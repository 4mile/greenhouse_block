view: application_stages {
  derived_table: {
    sql: select *
         from  WORKSPACE_493757853."in.c-greenhouseWebhooks.application_stages"
         where "company_name" = 'WRIKE';;
  }
##### Primary Key #####
  dimension: application_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."application_id" ;;
  }

##### Dimension Groups #####
  dimension_group: invited_to_test_date {
    type: time
    timeframes: [raw
      ,date
      ,week
      ,month
      ,quarter
      ,year]
    sql: nullif(${TABLE}."invited_to_test_date",'') ;;
  }

  dimension_group: moved_to_assessment_date {
    type: time
    timeframes: [raw
      ,date
      ,week
      ,month
      ,quarter
      ,year]
    sql: nullif(${TABLE}."moved_to_assessment_date",'') ;;
  }

  dimension_group: moved_to_dept_interview_date {
    type: time
    timeframes: [raw
      ,date
      ,week
      ,month
      ,quarter
      ,year]
    sql: nullif(${TABLE}."moved_to_dept_interview_date",'') ;;
  }

  dimension_group: moved_to_hr_interview_date {
    type: time
    timeframes: [raw
      ,date
      ,week
      ,month
      ,quarter
      ,year]
    sql: nullif(${TABLE}."moved_to_hr_interview_date",'') ;;
  }

  dimension_group: moved_to_onsite_interview_date {
    type: time
    timeframes: [raw
      ,date
      ,week
      ,month
      ,quarter
      ,year]
    sql: nullif(${TABLE}."moved_to_onsite_interview_date",'') ;;
  }

##### Dimensions #####
  dimension: company_name {
    hidden: yes
    type: string
    sql: ${TABLE}."company_name" ;;
  }

##### Measures #####
  measure: invited_to_test_count {
    type: sum
    sql: case
         when ${invited_to_test_date_date} <> 'NULL' then 1
         else 0 end;;
    drill_fields: [candidates.id
                  ,applications.applied_at_date
                  ,application_stages_derived.created_at
                  ,jobs_departments.name_category
                  ,jobs.name
                  ,jobs_offices.location_name
                  ,candidates.current_stage_name
                  ,offers.sent_at_date
                  ,offers.starts_at_date]
  }

  measure: moved_to_assessment_count {
    type: sum
    sql: case
         when ${moved_to_assessment_date_date} <> 'NULL' then 1
         else 0 end;;
    drill_fields: [candidates.id
                  ,applications.applied_at_date
                  ,moved_to_assessment_date_date
                  ,jobs_departments.name_category
                  ,jobs.name
                  ,jobs_offices.location_name
                  ,candidates.current_stage_name
                  ,offers.sent_at_date
                  ,offers.starts_at_date]
  }

  measure: moved_to_dept_interview_count {
    type: sum
    sql: case
         when ${moved_to_dept_interview_date_date} <> 'NULL' then 1
         else 0 end;;
    drill_fields: [candidates.id
                  ,applications.applied_at_date
                  ,moved_to_dept_interview_date_date
                  ,jobs_departments.name_category
                  ,jobs.name
                  ,jobs_offices.location_name
                  ,candidates.current_stage_name
                  ,offers.sent_at_date
                  ,offers.starts_at_date]
  }

  measure: moved_to_hr_interview_count {
    type: sum
    sql: case
         when ${moved_to_hr_interview_date_date} <> 'NULL' then 1
         else 0 end;;
    drill_fields: [candidates.id
                  ,applications.applied_at_date
                  ,moved_to_hr_interview_date_date
                  ,jobs_departments.name_category
                  ,jobs.name
                  ,jobs_offices.location_name
                  ,candidates.current_stage_name
                  ,offers.sent_at_date
                  ,offers.starts_at_date]
  }

  measure: moved_to_onsite_interview_count {
    type: sum
    sql: case
         when ${moved_to_onsite_interview_date_date} <> 'NULL' then 1
         else 0 end;;
    drill_fields: [candidates.id
                  ,applications.applied_at_date
                  ,moved_to_onsite_interview_date_date
                  ,jobs_departments.name_category
                  ,jobs.name
                  ,jobs_offices.location_name
                  ,candidates.current_stage_name
                  ,offers.sent_at_date
                  ,offers.starts_at_date]
  }

  measure: applications_count {
    type: count_distinct
    sql: ${application_id};;
  }
}
