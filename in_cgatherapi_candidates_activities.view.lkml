view: in_cgatherapi_candidates_activities {
  sql_table_name: WORKSPACE_1155666.in.c-gather-API.candidates_activities ;;

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

  dimension: body {
    type: string
    sql: ${TABLE}."body" ;;
  }

  dimension: candidate_id {
    type: string
    sql: ${TABLE}."candidate_id" ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}."created_at" ;;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."subject" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
