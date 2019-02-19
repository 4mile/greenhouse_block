view: in_cgatherapi_applications_jobs {
  view_label: "Application Jobs"
  sql_table_name: WORKSPACE_1155666."in.c-gather-API.applications_jobs";;

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

  dimension: applications_pkey {
    primary_key: yes
    type: string
    sql: ${TABLE}."applications_pkey" ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}."job_id" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
