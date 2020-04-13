view: candidate_detail {
  derived_table: {
    sql: WITH candidate_activities_cte AS (
      SELECT
          "candidate_id" AS candidate_id
        -- , "company_name" AS "company_name"
        , "body" AS "body"
        , CASE
            WHEN "body" ilike '%submitted a take home test%' THEN 'Submitted Assessment'
            WHEN "body" ilike '%Offer document % was signed by%' THEN 'Offer Signed'
            WHEN "body" ilike '%marked an offer to % as accepted%' THEN 'Offer Accepted'
        WHEN "body" ilike '%was moved into Assessment%' THEN 'Moved to Assessment'
        WHEN "body" ilike '%was moved into Onsite Interview%' THEN 'Moved to Onsite Interview'
            ELSE NULL
          END AS activity
        , NULLIF("created_at",'') AS activity_date
      FROM
        WORKSPACE_493757853."in.c-gather-API.candidates_activities"
      WHERE
        ("body" ilike '%submitted a take home test%'
              OR "body" ilike '%Offer document % was signed by%'
              OR "body" ilike '%marked an offer to % as accepted%'
              OR "body" ilike '%was moved into Assessment%'
             OR "body" ilike '%was moved into Onsite Interview%'
          )
  ),
  candidate_activity_hired_dates_cte
  AS (
      SELECT
          CACTE.candidate_id
        -- , A."company_name" AS "company_name"
        , A."id" AS application_id
        , MAX(CASE WHEN CACTE.activity = 'Offer Signed' THEN NULLIF(CACTE.activity_date,'') ELSE NULL END) AS offer_signed_date
        , MAX(CASE WHEN CACTE.activity = 'Offer Accepted' THEN NULLIF(CACTE.activity_date,'') ELSE NULL END) AS offer_accepted_date
      FROM
        WORKSPACE_493757853."in.c-gather-API.applications"  A
        INNER JOIN candidate_activities_cte CACTE
            ON A."candidate_id" = CACTE.candidate_id
        INNER JOIN WORKSPACE_493757853."in.c-gather-API.offers" O
            ON A."id" = O."application_id"
      GROUP BY
        1, 2
     ),
  candidate_activity_submitted_assessment_cte
  AS (
      SELECT
          CACTE.candidate_id
     -- , A."company_name" AS "company_name"
        , A."id" AS application_id
        , MAX(CASE WHEN CACTE.activity IN ('Submitted Assessment', 'Moved to Onsite Interview') THEN NULLIF(CACTE.activity_date,'') ELSE NULL END) AS submitted_assessment_date
      FROM
        WORKSPACE_493757853."in.c-gather-API.applications" A
        INNER JOIN candidate_activities_cte CACTE
            ON A."candidate_id" = CACTE.candidate_id
      WHERE
        CACTE.activity IN ('Submitted Assessment', 'Moved to Onsite Interview')
      GROUP BY
        1, 2, A."applied_at"
      HAVING
        DATEDIFF(DAY, NULLIF(A."applied_at",''), MAX(CASE WHEN CACTE.activity IN ('Submitted Assessment', 'Moved to Onsite Interview') THEN NULLIF(CACTE.activity_date,'') ELSE NULL END)) <= 60
     ),
     candidate_activity_moved_assessment_cte
     AS (
      SELECT
          CACTE.candidate_id
        -- , A."company_name" AS "company_name"
        , A."id" AS application_id
        , J."id" AS "job_id"
        , MIN(CASE WHEN CACTE.activity = 'Moved to Assessment' THEN NULLIF(CACTE.activity_date,'') ELSE NULL END) AS moved_to_assessment_date
      FROM
        WORKSPACE_493757853."in.c-gather-API.applications" A
        INNER JOIN candidate_activities_cte CACTE
            ON A."candidate_id" = CACTE.candidate_id
        INNER JOIN WORKSPACE_493757853."in.c-gather-API.applications_jobs" AJ
            ON A."id" = AJ."applications_pkey"
        INNER JOIN WORKSPACE_493757853."in.c-gather-API.jobs" J
            ON AJ."job_id" = J."id"
      WHERE
        CACTE.activity = 'Moved to Assessment'
          AND CACTE."body" ilike '%' || TRIM(J."name") || '%'
      GROUP BY
        1, 2, 3, A."applied_at"
      HAVING
        DATEDIFF(DAY, NULLIF(A."applied_at",''), MIN(CASE WHEN CACTE.activity = 'Moved to Assessment' THEN NULLIF(CACTE.activity_date,'') ELSE NULL END)) <= 60
      ),
   candidate_activity_summary_cte
   AS (
       SELECT DISTINCT
          CACTE.candidate_id
         -- , A."company_name" AS "company_name"
        , A."id" AS application_id
        , NULLIF(CAHDCTE.offer_accepted_date,'') AS offer_accepted_date
        , COALESCE(NULLIF(CAHDCTE.offer_signed_date,''), NULLIF(CAHDCTE.offer_accepted_date,'')) AS offer_hired_date
        , NULLIF(CAADCTE.submitted_assessment_date,'') AS submitted_assessment_date
        , NULLIF(CAMACTE.moved_to_assessment_date,'') AS moved_to_assessment_date
       FROM
        WORKSPACE_493757853."in.c-gather-API.applications" A
        INNER JOIN candidate_activities_cte CACTE
            ON A."candidate_id" = CACTE.candidate_id
        LEFT JOIN WORKSPACE_493757853."in.c-gather-API.candidates" AS candidates
            ON A."candidate_id" = candidates."id"
        LEFT JOIN WORKSPACE_493757853."in.c-gather-API.applications_jobs" AS applications_jobs
            ON A."id" = applications_jobs."applications_pkey"
        LEFT JOIN WORKSPACE_493757853."in.c-gather-API.jobs" AS jobs
            ON applications_jobs."job_id" = jobs."id"
        LEFT JOIN candidate_activity_hired_dates_cte CAHDCTE
            ON CACTE.candidate_id = CAHDCTE.candidate_id
            AND A."id" = CAHDCTE.application_id
        LEFT JOIN candidate_activity_submitted_assessment_cte CAADCTE
            ON CACTE.candidate_id = CAADCTE.candidate_id
            AND A."id" = CAADCTE.application_id
        LEFT JOIN candidate_activity_moved_assessment_cte CAMACTE
            ON CACTE.candidate_id = CAMACTE.candidate_id
            AND A."id" = CAMACTE.application_id
           AND jobs."id" = CAMACTE."job_id"
       WHERE
        DATEDIFF(DAY, NULLIF(A."applied_at",''), CURRENT_DATE) <= 180
            AND (NULLIF(jobs."closed_at",'') IS NULL
                 OR DATEDIFF(DAY, NULLIF(jobs."closed_at",''), CURRENT_DATE) <= 180)
      ),
       most_recent_app_per_candidate_cte
   AS (
       SELECT
        -- A."company_name" AS "company_name",
        C."id" AS "candidate_id",
        MAX(NULLIF(A."applied_at",'')) AS "most_recent_app_date"
       FROM
        WORKSPACE_493757853."in.c-gather-API.applications" A
        INNER JOIN WORKSPACE_493757853."in.c-gather-API.candidates" C
            ON A."candidate_id" = C."id"
       GROUP BY
        1
      ),
      assessment_results2_cte
  AS (
        SELECT
            A."id" AS "application_id",
            -- A."company_name" AS "company_name",
            candidates."custom_fields_candidate_assessment_results2" AS "candidate_assessment_results2"
        FROM
            WORKSPACE_493757853."in.c-gather-API.applications" A
            INNER JOIN WORKSPACE_493757853."in.c-gather-API.candidates"  AS candidates
                ON A."candidate_id" = candidates."id"
            INNER JOIN most_recent_app_per_candidate_cte MRACTE
                ON candidates."id" = MRACTE."candidate_id"
                AND A."applied_at" = MRACTE."most_recent_app_date"
            INNER JOIN WORKSPACE_493757853."in.c-gather-API.applications_jobs" AS applications_jobs
                ON A."id" = applications_jobs."applications_pkey"
            INNER JOIN WORKSPACE_493757853."in.c-gather-API.jobs" AS jobs
                ON applications_jobs."job_id" = jobs."id"
       WHERE
            (candidates."custom_fields_ccat1_raw_score" IS NOT NULL
             OR candidates."custom_fields_ccat2_raw_score" IS NOT NULL
             OR candidates."custom_fields_candidate_assessment_results2" IS NOT NULL)
            -- DATEDIFF(DAY, A."applied_at", CURRENT_DATE) <= 180
            --     AND (jobs."closed_at" IS NULL
            --         OR DATEDIFF(DAY, jobs."closed_at", CURRENT_DATE) <= 180)
     ),
  master_cte
   AS (
      SELECT
        candidates_email_addresses."email_address"  AS "candidateemail",
        candidates."id" as "candidateid",
        applications."id" as "applicationid",
      TO_CHAR(TO_DATE(NULLIF(applications."applied_at",''))::date, 'MM/DD/YYYY') AS "applieddate",
      TO_CHAR(TO_DATE(NULLIF(applications."last_activity_at",''))::date, 'MM/DD/YYYY') AS "applicationlastactivity",
        jobs."id"  AS "jobid",
        jobs."name"  AS "jobtitle",
        CASE WHEN jobs."status" = 'draft' THEN 'Pending'
             WHEN jobs."status" = 'closed' THEN 'Closed'
          ELSE 'Public' END AS "jobstatus",
        CASE WHEN case when (jobs."custom_fields_budgeted") in (NULL,'No','') then false
            else true end  THEN 'y' ELSE 'n' END
            AS "budgeted",
        CASE WHEN case when (jobs."custom_fields_pipeline_req") in (NULL,'No','') then false
            else true end  THEN 'y' ELSE 'n' END
            AS "pipelinereq",
        TO_CHAR(TO_DATE(NULLIF(jobs."opened_at",''))::date, 'MM/DD/YYYY') AS "approveddate",
        TO_CHAR(TO_DATE(NULLIF(jobs."opened_at",''))::date, 'MM/DD/YYYY') AS "publisheddate",
        TO_CHAR(TO_DATE(NULLIF(jobs."opened_at",''))::date, 'MM/DD/YYYY') AS "createdate",
        jobs."custom_fields_req_level"  AS "reqlevel",
        jobs_offices."name"  AS "Location",
        jobs_departments."name"  AS "reqdepartment",
        CASE WHEN jobs."custom_fields_req_category" = 'Product' THEN 'Product Management'
            ELSE jobs."custom_fields_req_category" END AS "reqcategory",
        jobs."custom_fields_recruiter_last_name"  AS "recruiterlastname",
        jobs."custom_fields_recruiter_first_name"  AS "recruiterfirstname",
        jobs."custom_fields_currency_type"  AS "currencytype",
        jobs."custom_fields_recruiter_email"  AS "recruiteremail",
        jobs."custom_fields_hiring_manager_first_name"  AS "hiringmanagerfirstname",
        jobs."custom_fields_hiring_manager_last_name"  AS "hiringmanagerlastname",
        jobs."custom_fields_hiring_manager_email"  AS "hiringmanageremail",
        candidates."first_name"  AS "candidatefirstname",
        candidates."last_name"  AS "candidatelastname",
        candidates."first_name"  AS "candidatepreferredname",
        CASE WHEN sources."name" ilike 'Sourced:%' OR sources."name" ilike 'Sourced-%' OR sources."name" ilike 'Sourced -%' THEN 'y'
             ELSE 'n' END AS "candidatesourced",
        sources."name"  AS "candidatereferralsource",
        ''  AS "candidateothersource",
      TO_CHAR(TO_DATE(NULLIF(applications."applied_at",''))::date, 'MM/DD/YYYY') AS "candidateapplicationdate",
      TO_CHAR(TO_DATE(NULLIF(applications."rejected_at",''))::date, 'MM/DD/YYYY') AS "candidatedispositiondate",
        -- COALESCE(TO_CHAR(TO_DATE(application_stages."moved_to_hr_interview_date")::date, 'MM/DD/YYYY'),
        --         TO_CHAR(TO_DATE(applications."rejected_at")::date, 'MM/DD/YYYY')) AS "candidatefirstviewed",
        applications."current_stage_name"  AS "candidatestage",
        case when NULLIF(candidates."custom_fields_candidate_status",'') IS NULL then 'active'
            else candidates."custom_fields_candidate_status" end AS "candidatestatus",
        applications."rejection_reason_name"  AS "candidaterejectreason",
        -- TO_CHAR(TO_DATE(COALESCE(application_stages."moved_to_assessment_date", candidate_activity.moved_to_assessment_date, application_stages."invited_to_test_date"))::date, 'MM/DD/YYYY') AS "candidateassessmentinvite1",
        -- TO_CHAR(TO_DATE(application_stages."moved_to_assessment_date")::date, 'MM/DD/YYYY') AS "webhook_invite_1",
        -- TO_CHAR(TO_DATE(candidate_activity.moved_to_assessment_date)::date, 'MM/DD/YYYY') AS "feed_invite_1",
        -- TO_CHAR(TO_DATE(COALESCE(candidate_activity.submitted_assessment_date, application_stages."moved_to_assessment_date", candidate_activity.moved_to_assessment_date, application_stages."moved_to_onsite_interview_date"))::date, 'MM/DD/YYYY') AS "candidateassessmentresults1",
        TO_CHAR(TO_DATE(NULLIF(ARCTE."candidate_assessment_results2",''))::date, 'MM/DD/YYYY') AS "candidateassessmentresults2",
    candidates."custom_fields_ccat1_raw_score"  AS "ccat1rawscore",
        candidates."custom_fields_ccat2_raw_score"  AS "ccat2rawscore",
        TO_CHAR(TO_DATE(NULLIF(ARCTE."candidate_assessment_results2",''))::date, 'MM/DD/YYYY') AS "testingcomplete",
        -- TO_CHAR(TO_DATE(application_stages."moved_to_dept_interview_date")::date, 'MM/DD/YYYY') AS "deptinterviewdate",
        -- TO_CHAR(TO_DATE(application_stages."moved_to_hr_interview_date")::date, 'MM/DD/YYYY') AS "hrinterviewdate",
        TO_CHAR(TO_DATE(NULLIF(offers."created_at",''))::date, 'MM/DD/YYYY') AS "offerdate",
        TO_CHAR(TO_DATE(NULLIF(offers."sent_at",''))::date, 'MM/DD/YYYY') AS "offerextendeddate",
        offers."custom_fields_offer_type"  AS "offertype",
        offers."custom_fields_offer_status"  AS "offerstatus",
        offers."custom_fields_offer_reject_reason"  AS "offerrejectreason",
        TO_CHAR(TO_DATE(NULLIF(candidate_activity.offer_accepted_date,''))::date, 'MM/DD/YYYY') AS "offeraccepteddate",
        TO_CHAR(TO_DATE(NULLIF(candidate_activity.offer_hired_date,''))::date, 'MM/DD/YYYY') AS "hiredate",
        offers."custom_fields_offer_type"  AS "hiretype",
        TO_CHAR(TO_DATE(NULLIF(jobs."closed_at",''))::date, 'MM/DD/YYYY') AS "requisitionclosedate",
        CASE WHEN jobs."status" = 'open' THEN 'y' ELSE 'n' END AS "requisitionfilled",
        TO_CHAR(TO_DATE(NULLIF(offers."starts_at",''))::date, 'MM/DD/YYYY') AS "startdate",
        -- applications."company_id" AS "companyid",
         -- applications."company_name" AS "companyname",
        offers."custom_fields_hire_base"  AS "hirebase",
        offers."custom_fields_hire_bonus"  AS "hirebonus",
        offers."custom_fields_hire_hourly"  AS "hirehourly",
        offers."custom_fields_hire_commission_target"  AS "hirecommissiontarget",
        candidates."custom_fields_candidate_experience_level"  AS "candidateexperiencelevel",
        candidates."custom_fields_sales_ap_score_band"  AS "salesapscoreband",
        candidates."custom_fields_csap_score_band"  AS "csapscoreband",
        candidates."custom_fields_epp"  AS "EPP",
        jobs."custom_fields_req_type"  AS "reqtype",
        candidates."custom_fields_candidate_no_show"  AS "candidatenoshow",
        candidates."custom_fields_ucat1_raw_score"  AS "ucat1rawscore",
        candidates."custom_fields_ucat2_raw_score"  AS "ucat2rawscore"
      FROM
        WORKSPACE_493757853."in.c-gather-API.applications"  AS applications
        -- LEFT JOIN "application_stages" AS application_stages
        --     ON applications."id" = application_stages."application_id"
        LEFT JOIN WORKSPACE_493757853."in.c-gather-API.candidates" AS candidates
            ON applications."candidate_id" = candidates."id"
        LEFT JOIN WORKSPACE_493757853."in.c-gather-API.candidates_email_addresses" AS candidates_email_addresses
            ON candidates."id" = candidates_email_addresses."candidates_pkey"
        LEFT JOIN WORKSPACE_493757853."in.c-gather-API.applications_jobs" AS applications_jobs
            ON applications."id" = applications_jobs."applications_pkey"
        LEFT JOIN WORKSPACE_493757853."in.c-gather-API.jobs" AS jobs
            ON applications_jobs."job_id" = jobs."id"
        LEFT JOIN WORKSPACE_493757853."in.c-gather-API.jobs_departments" AS jobs_departments
            ON jobs."id" = jobs_departments."jobs_pkey"
        LEFT JOIN WORKSPACE_493757853."in.c-gather-API.jobs_offices" AS jobs_offices
            ON jobs."id" = jobs_offices."jobs_pkey"
        LEFT JOIN WORKSPACE_493757853."in.c-gather-API.offers"  AS offers
            ON applications."id" = offers."application_id"
        LEFT JOIN WORKSPACE_493757853."in.c-gather-API.sources" AS sources
            ON applications."source_id" = sources."id"
        LEFT JOIN candidate_activity_summary_cte AS candidate_activity
            ON applications."id" = candidate_activity.application_id
        LEFT JOIN assessment_results2_cte ARCTE
            ON applications."id" = ARCTE."application_id"
      WHERE
        jobs."id" IS NOT NULL
            AND candidates_email_addresses."email_address" IS NOT NULL
            AND candidates_email_addresses."email_address" != ''
            AND candidates."first_name" NOT IN ('Test', 'Sample', 'Candidate')
          -- AND candidates_email_addresses."email_address" = 'craig.d.alexander@gmail.com'
          -- AND candidates_email_addresses."email_address" = 'jadamsingerman@gmail.com'
          -- AND candidates."last_name" = 'St. Jean'
  )
    SELECT DISTINCT
    "candidateemail",
--     "candidateid",
    "jobid",
    "jobtitle",
    "jobstatus",
    "budgeted",
    "pipelinereq",
    "approveddate",
    "publisheddate",
    "createdate",
    "reqlevel",
    "Location",
    "reqdepartment",
    "reqcategory",
    "recruiterlastname",
    "recruiterfirstname",
    "currencytype",
    "recruiteremail",
    "hiringmanagerfirstname",
    "hiringmanagerlastname",
    "hiringmanageremail",
    LAST_VALUE("candidatefirstname" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "candidatefirstname",
    LAST_VALUE("candidatelastname" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "candidatelastname",
    LAST_VALUE("candidatepreferredname" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "candidatepreferredname",
    LAST_VALUE("candidatesourced" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "candidatesourced",
    LAST_VALUE("candidatereferralsource" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "candidatereferralsource",
    LAST_VALUE("candidateothersource" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "candidateothersource",
    MIN("candidateapplicationdate") OVER(partition by "candidateemail", "jobid", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "candidateapplicationdate",
    MIN("candidatedispositiondate") OVER(partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "candidatedispositiondate",
    -- MIN("candidatefirstviewed") OVER(partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "candidatefirstviewed",
    LAST_VALUE("candidatestage" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate") AS "candidatestage",
    LAST_VALUE("candidatestatus" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate") AS "candidatestatus",
    LAST_VALUE("candidaterejectreason") OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "candidaterejectreason",
    -- MAX("candidateassessmentinvite1") OVER(partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "candidateassessmentinvite1",
    -- MAX("candidateassessmentresults1") OVER(partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "candidateassessmentresults1",
    MAX("candidateassessmentresults2") OVER(partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "candidateassessmentresults2",
    LAST_VALUE("ccat1rawscore" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "ccat1rawscore",
    LAST_VALUE("ccat2rawscore" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "ccat2rawscore",
    MAX("testingcomplete") OVER (partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "testingcomplete",
    -- MAX("deptinterviewdate") OVER (partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "deptinterviewdate",
    -- MAX("hrinterviewdate") OVER( partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "hrinterviewdate",
    MAX("offerdate") OVER(partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "offerdate",
    MAX("offerextendeddate") OVER(partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "offerextendeddate",
    LAST_VALUE("offertype" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "offertype",
    LAST_VALUE("offerstatus" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "offerstatus",
    LAST_VALUE("offerrejectreason" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "offerrejectreason",
    MAX("offeraccepteddate") OVER(partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "offeraccepteddate",
    MAX("hiredate") OVER(partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "hiredate",
    LAST_VALUE("hiretype" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "hiretype",
    LAST_VALUE("requisitionclosedate") OVER (partition by "candidateemail", "jobid" order by "applieddate" ) AS "requisitionclosedate",
    "requisitionfilled",
    MAX("startdate") OVER (partition by "candidateemail", "jobid" order by "applieddate" ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS "startdate",
    -- "companyid",
    -- "companyname",
    LAST_VALUE("hirebase" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "hirebase",
    LAST_VALUE("hirebonus" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "hirebonus",
    LAST_VALUE("hirehourly" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "hirehourly",
    LAST_VALUE("hirecommissiontarget" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "hirecommissiontarget",
    LAST_VALUE("candidateexperiencelevel" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "candidateexperiencelevel",
    LAST_VALUE("salesapscoreband" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "salesapscoreband",
    LAST_VALUE("csapscoreband" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "csapscoreband",
    LAST_VALUE("EPP" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "EPP",
    "reqtype",
    LAST_VALUE("candidatenoshow" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "candidatenoshow",
    LAST_VALUE("ucat1rawscore" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "ucat1rawscore",
    LAST_VALUE("ucat2rawscore" IGNORE NULLS) OVER(partition by "candidateemail", "jobid" order by "applieddate" ) AS "ucat2rawscore"
  FROM
    master_cte
 ;;
  }


################################### CANDIDATE  ###################################
#   dimension: candidateid {
#     view_label: "Candidate"
#     label: "Candidate ID"
#     type: string
#     sql: ${TABLE}."candidateid" ;;
#   }

  dimension: candidateemail {
    group_label: "Candidate Info"
    view_label: "Candidate"
    label: "Email"
    type: string
    sql: ${TABLE}."candidateemail" ;;
  }

  dimension: candidatefirstname {
    view_label: "Candidate"
    group_label: "Candidate Info"
    label: "First Name"
    type: string
    sql: ${TABLE}."candidatefirstname" ;;
  }

  dimension: candidatelastname {
    view_label: "Candidate"
    group_label: "Candidate Info"
    label: "Last Name"
    type: string
    sql: ${TABLE}."candidatelastname" ;;
  }

  dimension: candidatepreferredname {
    view_label: "Candidate"
    group_label: "Candidate Info"
    label: "Preferred Name"
    type: string
    sql: ${TABLE}."candidatepreferredname" ;;
  }

  dimension: candidatesourced {
    view_label: "Candidate"
#     group_label: "Candidate Info"
    label: "Sourced"
    type: string
    sql: ${TABLE}."candidatesourced" ;;
  }

  dimension: candidatereferralsource {
    view_label: "Candidate"
#     group_label: "Candidate Info"
    label: "Referral Source"
    type: string
    sql: ${TABLE}."candidatereferralsource" ;;
  }

  dimension: candidateothersource {
    view_label: "Candidate"
#     group_label: "Candidate Info"
    label: "Other Source"
    type: string
    sql: ${TABLE}."candidateothersource" ;;
  }

  dimension_group: candidateapplicationdate {
    view_label: "Candidate"
    label: "Application"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."candidateapplicationdate" ;;
  }

  dimension_group: candidatedispositiondate {
    view_label: "Candidate"
#     group_label: "Candidate Info"
    label: "Disposition"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."candidatedispositiondate" ;;
  }

  dimension: candidatestage {
    view_label: "Candidate"
#     group_label: "Candidate Info"
    label: "Stage"
    type: string
    sql: ${TABLE}."candidatestage" ;;
  }

  dimension: candidatestatus {
    view_label: "Candidate"
#     group_label: "Candidate Info"
    label: "Status"
    type: string
    sql: ${TABLE}."candidatestatus" ;;
  }

  dimension: candidaterejectreason {
    view_label: "Candidate"
#     group_label: "Candidate Info"
    label: "Reject Reason"
    type: string
    sql: ${TABLE}."candidaterejectreason" ;;
  }

  dimension_group: candidateassessmentresults2 {
    view_label: "Candidate"
#     group_label: "Candidate Info"
    label: "Assessment Date"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."candidateassessmentresults2" ;;
  }

  dimension: ccat1rawscore {
    view_label: "Candidate"
    label: "CCAT 1 Raw Score"
    type: number
    sql: ${TABLE}."ccat1rawscore" ;;
  }

  dimension: ccat2rawscore {
    view_label: "Candidate"
    label: "CCAT 2 Raw Score"
    type: number
    sql: ${TABLE}."ccat2rawscore" ;;
  }

  dimension: testingcomplete {
    view_label: "Candidate"
    label: "Testing Complete"
    type: string
    sql: ${TABLE}."testingcomplete" ;;
  }

  dimension_group: hiredate {
    view_label: "Candidate"
    label: "Hire"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."hiredate" ;;
  }

  dimension: hiretype {
    view_label: "Candidate"
    label: "Hire Type"
    type: string
    sql: ${TABLE}."hiretype" ;;
  }

  dimension: candidateexperiencelevel {
    view_label: "Candidate"
    label: "Experience Level"
    type: string
    sql: ${TABLE}."candidateexperiencelevel" ;;
  }

  dimension: salesapscoreband {
    view_label: "Candidate"
    label: "Sales AP Score Band"
    type: string
    sql: ${TABLE}."salesapscoreband" ;;
  }

  dimension: csapscoreband {
    view_label: "Candidate"
    label: "CSAP Score Band"
    type: string
    sql: ${TABLE}."csapscoreband" ;;
  }

  dimension: epp {
    view_label: "Candidate"
    label: "EPP"
    type: string
    sql: ${TABLE}."EPP" ;;
  }

  dimension: candidatenoshow {
    view_label: "Candidate"
#     group_label: "Candidate Info"
    label: "Is No Show"
    type: string
    sql: ${TABLE}."candidatenoshow" ;;
  }

  dimension: ucat1rawscore {
    view_label: "Candidate"
    label: "UCAT 1 Raw Score"
    type: number
    sql: ${TABLE}."ucat1rawscore" ;;
  }

  dimension: ucat2rawscore {
    view_label: "Candidate"
    label: "UCAT 2 Raw Score"
    type: number
    sql: ${TABLE}."ucat2rawscore" ;;
  }

#   measure: count_candidate {
#     view_label: "Candidate"
#     label: "Number of Candidates"
#     type: count
#   }

  measure: count_candidate_distinct {
    view_label: "Candidate"
    label: "Count of Candidates"
    type: count_distinct
    sql:  ${TABLE}."candidateemail";;
  }

  measure: sum_ucat1rawscore {
    view_label: "Candidate"
    group_label: "UCAT Score"
    label: "Total UCAT 1 Raw Score"
    type: sum
    sql: NULLIF(${TABLE}."ucat1rawscore",'');;
    }

  measure: sum_ucat2rawscore {
    view_label: "Candidate"
    group_label: "UCAT Score"
    label: "Total UCAT 2 Raw Score"
    type: sum
    sql: NULLIF(${TABLE}."ucat2rawscore",'');;
  }

  measure: sum_combined_ucat_score {
    view_label: "Candidate"
    group_label: "UCAT Score"
    label: "Total UCAT Raw Score"
    type: number
    sql: ${sum_ucat1rawscore}+${sum_ucat2rawscore};;
  }

  measure: avg_ucat1_score {
    view_label: "Candidate"
    group_label: "UCAT Score"
    label: "Average UCAT 1 Raw Score"
    type: average
    sql: NULLIF(${TABLE}."ucat1rawscore",'');;
    value_format_name: decimal_1
  }

  measure: avg_ucat2_score {
    view_label: "Candidate"
    group_label: "UCAT Score"
    label: "Average UCAT 2 Raw Score"
    type: average
    sql: NULLIF(${TABLE}."ucat2rawscore",'');;
    value_format_name: decimal_1
  }

  measure: avg_combined_ucat_score {
    view_label: "Candidate"
    group_label: "UCAT Score"
    label: "Average Combined UCAT Raw Score"
    type: average
    sql: (NULLIF(${TABLE}."ucat1rawscore",'')+NULLIF(${TABLE}."ucat2rawscore",''));;
    value_format_name: decimal_1
  }

  measure: sum_ccat1rawscore {
    view_label: "Candidate"
    group_label: "CCAT Score"
    label: "Total CCAT 1 Raw Score"
    type: sum
    sql: NULLIF(${TABLE}."ccat1rawscore",'');;
  }

  measure: sum_ccat2rawscore {
    view_label: "Candidate"
    group_label: "CCAT Score"
    label: "Total CCAT 2 Raw Score"
    type: sum
    sql: NULLIF(${TABLE}."ccat2rawscore",'');;
  }

  measure: sum_combined_ccat_score {
    view_label: "Candidate"
    group_label: "CCAT Score"
    label: "Total CCAT Raw Score"
    type: number
    sql: ${sum_ccat1rawscore}+${sum_ccat2rawscore};;
  }

  measure: avg_ccat1_score {
    view_label: "Candidate"
    group_label: "CCAT Score"
    label: "Average CCAT 1 Raw Score"
    type: average
    sql: NULLIF(${TABLE}."ccat1rawscore",'');;
    value_format_name: decimal_1
  }

  measure: avg_ccat2_score {
    view_label: "Candidate"
    group_label: "CCAT Score"
    label: "Average CCAT 2 Raw Score"
    type: average
    sql: NULLIF(${TABLE}."ccat2rawscore",'');;
    value_format_name: decimal_1
  }

  measure: avg_combined_ccat_score {
    view_label: "Candidate"
    group_label: "CCAT Score"
    label: "Average Combined CCAT Raw Score"
    type: average
    sql: (NULLIF(${TABLE}."ccat1rawscore",'')+NULLIF(${TABLE}."ccat2rawscore",''));;
    value_format_name: decimal_1
  }

################################### JOB  ###################################

  dimension: jobid {
    view_label: "Job"
    label: "Job Id"
    type: string
    sql: ${TABLE}."jobid" ;;
  }

  dimension: jobtitle {
    view_label: "Job"
    label: "Title"
    type: string
    sql: ${TABLE}."jobtitle" ;;
  }

  dimension: jobstatus {
    view_label: "Job"
    label: "Status"
    type: string
    sql: ${TABLE}."jobstatus" ;;
  }

  dimension: budgeted {
    view_label: "Job"
    label: "Budgeted"
    type: string
    sql: ${TABLE}."budgeted" ;;
  }

  dimension: pipelinereq {
    view_label: "Job"
    label: "Pipeline Req"
    type: string
    sql: ${TABLE}."pipelinereq" ;;
  }

  dimension_group: approveddate {
    view_label: "Job"
    label: "Approved"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."approveddate" ;;
  }

  dimension_group: publisheddate {
    view_label: "Job"
    label: "Published"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."publisheddate" ;;
  }

  dimension_group: createdate {
    view_label: "Job"
    label: "Created"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."createdate" ;;
  }

  dimension: reqlevel {
    view_label: "Job"
    label: "Req Level"
    type: string
    sql: ${TABLE}."reqlevel" ;;
  }

  dimension: location {
    view_label: "Job"
    type: string
    sql: ${TABLE}."Location" ;;
  }

  dimension: reqdepartment {
    view_label: "Job"
    label: "Req Department"
    type: string
    sql: ${TABLE}."reqdepartment" ;;
  }

  dimension: reqcategory {
    view_label: "Job"
    label: "Req Category"
    type: string
    sql: ${TABLE}."reqcategory" ;;
  }

  dimension: recruiterlastname {
    view_label: "Job"
    group_label: "Recruiter Info"
    label: "Recruiter Last Name"
    type: string
    sql: ${TABLE}."recruiterlastname" ;;
  }

  dimension: recruiterfirstname {
    view_label: "Job"
    group_label: "Recruiter Info"
    label: "Recruiter First Name"
    type: string
    sql: ${TABLE}."recruiterfirstname" ;;
  }

  dimension: recruiteremail {
    view_label: "Job"
    group_label: "Recruiter Info"
    label: "Recruiter Email"
    type: string
    sql: ${TABLE}."recruiteremail" ;;
  }

  dimension: currencytype {
    view_label: "Job"
    label: "Currency Type"
    type: string
    sql: ${TABLE}."currencytype" ;;
  }

  dimension: hiringmanagerfirstname {
    view_label: "Job"
    group_label: "Hiring Manager Info"
    label: "Hiring Manager First Name"
    type: string
    sql: ${TABLE}."hiringmanagerfirstname" ;;
  }

  dimension: hiringmanagerlastname {
    view_label: "Job"
    group_label: "Hiring Manager Info"
    label: "Hiring Manager Last Name"
    type: string
    sql: ${TABLE}."hiringmanagerlastname" ;;
  }

  dimension: hiringmanageremail {
    view_label: "Job"
    group_label: "Hiring Manager Info"
    label: "Hiring Manager Email"
    type: string
    sql: ${TABLE}."hiringmanageremail" ;;
  }

  dimension_group: requisitionclosedate {
    view_label: "Job"
    label: "Requisition Close"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."requisitionclosedate" ;;
  }

  dimension: requisitionfilled {
    view_label: "Job"
    label: "Requisition Filled"
    type: string
    sql: ${TABLE}."requisitionfilled" ;;
  }

  dimension: reqtype {
    view_label: "Job"
#     group_label: "Req Info"
    label: "Req Type"
    type: string
    sql: ${TABLE}."reqtype" ;;
  }

  measure: count_jobs {
    view_label: "Job"
    label: "Count of Jobs"
    type: count_distinct
    sql: ${TABLE}."jobid" ;;
  }

################################### OFFER  ###################################

  dimension_group: offerdate {
    view_label: "Offer"
    label: "Offer"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."offerdate" ;;
  }

  dimension_group: offerextendeddate {
    view_label: "Offer"
    label: "Offer Extended"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."offerextendeddate" ;;
  }

  dimension: offertype {
    view_label: "Offer"
    label: "Type"
    type: string
    sql: ${TABLE}."offertype" ;;
  }

  dimension: offerstatus {
    view_label: "Offer"
    label: "Status"
    type: string
    sql: ${TABLE}."offerstatus" ;;
  }

  dimension: offerrejectreason {
    view_label: "Offer"
    label: "Reject Reason"
    type: string
    sql: ${TABLE}."offerrejectreason" ;;
  }

  dimension_group: offeraccepteddate {
    view_label: "Offer"
    label: "Accepted"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."offeraccepteddate" ;;
  }

  dimension_group: startdate {
    view_label: "Offer"
    label: "Start"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."startdate" ;;
  }

  dimension: hirebase {
    view_label: "Offer"
    label: "Hire Base"
    type: number
    sql: ${TABLE}."hirebase" ;;
  }

  dimension: hirebonus {
    view_label: "Offer"
    label: "Hire Bonus"
    type: number
    sql: ${TABLE}."hirebonus" ;;
  }

  dimension: hirehourly {
    view_label: "Offer"
    label: "Hire Hourly"
    type: number
    sql: ${TABLE}."hirehourly" ;;
  }

  dimension: hirecommissiontarget {
    view_label: "Offer"
    label: "Hire Commission Target"
    type: number
    sql: ${TABLE}."hirecommissiontarget" ;;
  }

  measure: total_hire_bonus {
    view_label: "Offer"
    label: "Total Hire Bonus"
    group_label: "Bonus"
    type: sum
    sql: NULLIF(${TABLE}."hirebonus",'') ;;
    value_format_name: decimal_2
  }

  measure: avg_hire_bonus {
    view_label: "Offer"
    label: "Average Hire Bonus"
    group_label: "Bonus"
    type: average
    sql: NULLIF(${TABLE}."hirebonus",'') ;;
    value_format_name: decimal_2
  }

  measure: total_hirehourly {
    view_label: "Offer"
    label: "Total Hire Hourly"
    group_label: "Hourly"
    type: sum
    sql: NULLIF(${TABLE}."hirehourly",'') ;;
    value_format_name: decimal_2
  }

  measure: avg_hirehourly {
    view_label: "Offer"
    label: "Average Hire Hourly"
    group_label: "Hourly"
    type: average
    sql: NULLIF(${TABLE}."hirehourly",'') ;;
    value_format_name: decimal_2
  }


  measure: total_hirebase {
    view_label: "Offer"
    label: "Total Hire Base"
    group_label: "Base"
    type: sum
    sql: NULLIF(${TABLE}."hirebase",'') ;;
    value_format_name: decimal_2
  }

  measure: avg_hirebase {
    view_label: "Offer"
    label: "Average Hire Base"
    group_label: "Base"
    type: average
    sql: NULLIF(${TABLE}."hirebase",'') ;;
    value_format_name: decimal_2
  }

  measure: total_hirecommissiontarget{
    view_label: "Offer"
    label: "Total Hire Commission Target"
    group_label: "Commission Target"
    type: sum
    sql: NULLIF(${TABLE}."hirecommissiontarget",'') ;;
    value_format_name: decimal_2
  }

  measure: avg_hirecommissiontarget{
    view_label: "Offer"
    label: "Average Hire Commission Target"
    group_label: "Commission Target"
    type: average
    sql: NULLIF(${TABLE}."hirecommissiontarget",'') ;;
    value_format_name: decimal_2
  }


#   set: detail {
#     fields: [
#       candidateemail,
#       jobid,
#       jobtitle,
#       jobstatus,
#       budgeted,
#       pipelinereq,
#       approveddate,
#       publisheddate,
#       createdate,
#       reqlevel,
#       location,
#       reqdepartment,
#       reqcategory,
#       recruiterlastname,
#       recruiterfirstname,
#       currencytype,
#       recruiteremail,
#       hiringmanagerfirstname,
#       hiringmanagerlastname,
#       hiringmanageremail,
#       candidatefirstname,
#       candidatelastname,
#       candidatepreferredname,
#       candidatesourced,
#       candidatereferralsource,
#       candidateothersource,
#       candidateapplicationdate,
#       candidatedispositiondate,
#       candidatestage,
#       candidatestatus,
#       candidaterejectreason,
#       candidateassessmentresults2,
#       ccat1rawscore,
#       ccat2rawscore,
#       testingcomplete,
#       offerdate,
#       offerextendeddate,
#       offertype,
#       offerstatus,
#       offerrejectreason,
#       offeraccepteddate,
#       hiredate,
#       hiretype,
#       requisitionclosedate,
#       requisitionfilled,
#       startdate,
#       hirebase,
#       hirebonus,
#       hirehourly,
#       hirecommissiontarget,
#       candidateexperiencelevel,
#       salesapscoreband,
#       csapscoreband,
#       epp,
#       reqtype,
#       candidatenoshow,
#       ucat1rawscore,
#       ucat2rawscore
#     ]
#   }
}
