view: application_stages_derived {
    derived_table: {
      sql:
      SELECT a."application_id"
            ,a."company_name"
            ,b."applied_at"
            ,a.stage
            ,a.created_at
      FROM
      (SELECT "company_name"
              ,"application_id"
              ,'Invited to Test' AS stage
              ,"invited_to_test_date" AS created_at
        FROM  WORKSPACE_493757853."in.c-greenhouseWebhooks.application_stages"
        WHERE "company_name" = 'WRIKE' AND NULLIF("invited_to_test_date",'') IS NOT NULL
      UNION
        SELECT "company_name"
              ,"application_id"
              ,'Moved to Dept Interview' AS stage
              ,"moved_to_dept_interview_date" AS created_at
        FROM  WORKSPACE_493757853."in.c-greenhouseWebhooks.application_stages"
        WHERE "company_name" = 'WRIKE' AND NULLIF("moved_to_dept_interview_date",'') IS NOT NULL
      UNION
        SELECT "company_name"
              ,"application_id"
              ,'Moved to Assessment' AS stage
              ,"moved_to_assessment_date" AS created_at
        FROM  WORKSPACE_493757853."in.c-greenhouseWebhooks.application_stages"
        WHERE "company_name" = 'WRIKE' AND NULLIF("moved_to_assessment_date",'') IS NOT NULL
      UNION
        SELECT "company_name"
              ,"application_id"
              ,'Moved to HR Interview' AS stage
              ,"moved_to_hr_interview_date" AS created_at
        FROM  WORKSPACE_493757853."in.c-greenhouseWebhooks.application_stages"
        WHERE "company_name" = 'WRIKE' AND NULLIF("moved_to_hr_interview_date",'') IS NOT NULL
      UNION
        SELECT "company_name"
              ,"application_id"
              ,'Moved to Onsite Interview' AS stage
              ,"moved_to_onsite_interview_date" AS created_at
        FROM  WORKSPACE_493757853."in.c-greenhouseWebhooks.application_stages"
        WHERE "company_name" = 'WRIKE' AND NULLIF("moved_to_onsite_interview_date",'') IS NOT NULL) a
      JOIN WORKSPACE_493757853."in.c-wrike-API-Milepost.applications" b ON a."application_id" = b."id"
            ;;
    sql_trigger_value: SELECT MAX("application_id") FROM WORKSPACE_493757853."in.c-greenhouseWebhooks.application_stages" ;;
    indexes: ["application_id"]
    }

    measure: count {
      type: count
    }

    dimension: company_name {
      type: string
      sql: ${TABLE}."company_name" ;;
    }

    dimension: application_id {
      type: string
      sql: ${TABLE}."application_id" ;;
    }

    dimension: stage {
      type: string
      sql: ${TABLE}."STAGE" ;;
    }

    dimension_group: created_at {
      type: time
      sql: ${TABLE}."created_at" ;;
    }

  dimension_group: applied_at {
    type: time
    sql: ${TABLE}."applied_at" ;;
  }
}
