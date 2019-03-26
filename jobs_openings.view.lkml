view: jobs_openings {
  view_label: "Job Openings"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API.jobs_openings" ;;

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
    sql: NULLIF(${TABLE}."closed_at",'') ;;
  }

  dimension: job_id {
    label: "Job Id"
    type: string
    sql: ${TABLE}."job_id" ;;
  }

  dimension_group: opened_at {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: NULLIF(${TABLE}."opened_at",'') ;;
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

  measure: days_job_open {
    label: "Days Job Title Open"
    type: max
    sql: CASE
          WHEN ${closed_at_date} IS NULL THEN datediff('day', ${opened_at_date}, current_date)
          ELSE datediff('day', ${opened_at_date}, ${closed_at_date}) END;;
  }



  measure: count {
    type: count
    drill_fields: [id]
  }
}
