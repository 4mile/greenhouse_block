view: jobs_openings {
  view_label: "Job Openings"
  sql_table_name: WORKSPACE_493757853."in.c-wrike-API-Milepost.jobs_openings" ;;

  dimension: id {
    primary_key: yes
    label: "Job Opening Id"
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension_group: _timestamp {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    hidden: yes
    sql: ${TABLE}."_timestamp" ;;
  }

  dimension: application_id {
    label: "Application Id"
    type: string
    sql: ${TABLE}."application_id" ;;
  }

  dimension_group: closed_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(NULLIF(${TABLE}."closed_at",'') as datetime) ;;
  }

  dimension: job_id {
    label: "Job Id"
    type: string
    sql: ${TABLE}."job_id" ;;
  }

  dimension_group: opened_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: CAST(NULLIF(${TABLE}."opened_at",'') as datetime) ;;
  }

# this might be the rec-id
  dimension: opening_id {
    label: "Opening Id"
    type: string
    sql: ${TABLE}."opening_id" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  measure: avg_days_job_open {
    label: "Avg Days Opened - All"
    type: average
    sql: CASE
          WHEN ${closed_at_date} IS NULL THEN datediff('day', ${opened_at_date}, current_date)
          ELSE datediff('day', ${opened_at_date}, ${closed_at_date}) END;;
    value_format_name: decimal_0
  }

  measure: avg_days_open_closed {
    label: "Avg Days Opened - For Closed Jobs"
    type: average
    sql: CASE
          WHEN ${closed_at_date} IS NULL THEN NULL
          ELSE datediff('day', ${opened_at_date}, ${closed_at_date}) END;;
    value_format_name: decimal_0
  }

  measure: job_open_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;
    filters: {
      field: status
      value: "open"
    }
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
