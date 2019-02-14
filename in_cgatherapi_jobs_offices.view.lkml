view: in_cgatherapi_jobs_offices {
  sql_table_name: WORKSPACE_1155666.in.c-gather-API.jobs_offices ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

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

  dimension: jobs_pkey {
    type: string
    sql: ${TABLE}."jobs_pkey" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name]
  }
}
