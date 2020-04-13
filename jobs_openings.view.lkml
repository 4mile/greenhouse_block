view: jobs_openings {
  view_label: "Job Openings"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API-Milepost.jobs_openings" ;;

  dimension: id {
    primary_key: yes
    label: "Job Opening Id"
    type: string
    sql: ${TABLE}."id" ;;
  }

# this is rec-id
  dimension: opening_id {
    label: "Opening Id"
    type: string
    sql: ${TABLE}."opening_id" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension_group: opened_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(NULLIF(${TABLE}."opened_at",'') as datetime) ;;
  }

  dimension_group: closed_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(NULLIF(${TABLE}."closed_at",'') as datetime) ;;
  }

  dimension: application_id {
    type: string
    sql: ${TABLE}."application_id" ;;
  }

  dimension: close_reason_id {
    type: string
    sql: ${TABLE}."close_reason_id" ;;
  }

  dimension: close_reason_name {
    type: string
    sql: ${TABLE}."close_reason_name" ;;
  }

  dimension: parent_job_id {
    type: string
    sql: ${TABLE}."parent_job_id" ;;
  }

  dimension: days_opened {
    label: "Days Opened"
    type: number
    sql: CASE WHEN ${status} = 'open' THEN datediff('day', ${opened_at_date}, current_date)
         ELSE NULL END;;
    value_format_name: decimal_0
  }

  measure: avg_days_job_open_all {
    label: "Avg Days Opened - All"
    type: average
    sql: CASE
          WHEN ${closed_at_date} IS NULL THEN datediff('day', ${opened_at_date}, current_date)
          ELSE datediff('day', ${opened_at_date}, ${closed_at_date}) END;;
    value_format_name: decimal_0
  }

  measure: avg_days_open_closed {
    label: "Avg Days to Close"
    type: average
    sql: CASE
          WHEN ${closed_at_date} IS NULL THEN NULL
          ELSE datediff('day', ${opened_at_date}, ${closed_at_date}) END;;
    value_format_name: decimal_0
    drill_fields: [jobs.name,jobs_departments.name_category,jobs_offices.lcation_name,avg_days_open_closed]
  }

  measure: avg_days_job_open {
    label: "Avg Days Opened - For Open Jobs"
    type: average
    sql: CASE
          WHEN ${closed_at_date} IS NULL THEN datediff('day', ${opened_at_date}, current_date)
          ELSE NULL END;;
    value_format_name: decimal_0
  }

  measure: jobs_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }

  measure: job_open_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;
    filters: {
      field: status
      value: "open"
    }
  drill_fields: [opening_id,jobs.name,jobs_departments.name_category,jobs_offices.lcation_name,opened_at_date,days_opened,applications.active_count,applications.rejection_count]
  }

  measure: job_closed_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;
    filters: {
      field: status
      value: "closed"
    }
  }

}