view: application_stages {
  view_label: "Application Stages"
  derived_table: {
    sql: SELECT *
         FROM WORKSPACE_493757853."in.c-greenhouseWebhooks.application_stages"
         WHERE "company_name" = 'WRIKE';;
  }

  dimension: application_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."application_id" ;;
  }

  dimension: company_name {
    hidden: yes
    type: string
    sql: ${TABLE}."company_name" ;;
  }

  dimension_group: invited_to_test_date {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."invited_to_test_date",'') ;;
  }

  dimension_group: moved_to_assessment_date {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."moved_to_assessment_date",'') ;;
  }

  dimension_group: moved_to_dept_interview_date {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."moved_to_dept_interview_date",'') ;;
  }

  dimension_group: moved_to_hr_interview_date {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."moved_to_hr_interview_date",'') ;;
  }

  dimension_group: moved_to_onsite_interview_date {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."moved_to_onsite_interview_date",'') ;;
  }

  measure: invited_to_test_count {
    type: sum
    sql: CASE WHEN ${invited_to_test_date_date} <> 'NULL' THEN 1
         ELSE 0 END;;
  }

  measure: moved_to_assessment_count {
    type: sum
    sql: CASE WHEN ${moved_to_assessment_date_date} <> 'NULL' THEN 1
      ELSE 0 END;;
  }

  measure: moved_to_dept_interview_count {
    type: sum
    sql: CASE WHEN ${moved_to_dept_interview_date_date} <> 'NULL' THEN 1
      ELSE 0 END;;
  }

  measure: moved_to_hr_interview_count {
    type: sum
    sql: CASE WHEN ${moved_to_hr_interview_date_date} <> 'NULL' THEN 1
      ELSE 0 END;;
  }

  measure: moved_to_onsite_interview_count {
    type: sum
    sql: CASE WHEN ${moved_to_onsite_interview_date_date} <> 'NULL' THEN 1
      ELSE 0 END;;
  }

  measure: applications_count {
    type: count_distinct
    sql: ${application_id};;
  }

}
