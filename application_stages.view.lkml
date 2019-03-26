view: application_stages {
  view_label: "Application Stages"
  sql_table_name: WORKSPACE_1155666."in.c-greenhouseWebhooks.application_stages" ;;

  dimension_group: _timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."_timestamp" ;;
  }

  dimension: application_id {
    type: string
    sql: ${TABLE}."application_id" ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}."company_name" ;;
  }

  dimension: invited_to_test_date {
    type: string
    sql: ${TABLE}."invited_to_test_date" ;;
  }

  dimension: moved_to_assessment_date {
    type: string
    sql: ${TABLE}."moved_to_assessment_date" ;;
  }

  dimension: moved_to_dept_interview_date {
    type: string
    sql: ${TABLE}."moved_to_dept_interview_date" ;;
  }

  dimension: moved_to_hr_interview_date {
    type: string
    sql: ${TABLE}."moved_to_hr_interview_date" ;;
  }

  dimension: moved_to_onsite_interview_date {
    type: string
    sql: ${TABLE}."moved_to_onsite_interview_date" ;;
  }

  measure: count {
    type: count
    drill_fields: [company_name]
  }
}
