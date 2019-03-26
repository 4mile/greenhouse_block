view: applications_jobs {
  view_label: "Application Jobs"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API.applications_jobs";;

  dimension_group: _timestamp {
    hidden: yes
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
    hidden: yes
    type: string
    sql: ${TABLE}."applications_pkey" ;;
  }

  dimension: job_id {
    hidden: yes
    type: string
    sql: ${TABLE}."job_id" ;;
  }
}
