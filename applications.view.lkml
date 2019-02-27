view: applications {
  view_label: "Applications"
  sql_table_name: WORKSPACE_1155666."in.c-gather-API.applications" ;;

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

  dimension: applied_at {
    type: string
    sql: ${TABLE}."applied_at" ;;
  }

  dimension: candidate_id {
    type: string
    sql: ${TABLE}."candidate_id" ;;
  }

  dimension: current_stage_id {
    type: string
    sql: ${TABLE}."current_stage_id" ;;
  }

  dimension: current_stage_name {
    type: string
    sql: ${TABLE}."current_stage_name" ;;
  }

  dimension: custom_fields {
    type: string
    sql: ${TABLE}."custom_fields" ;;
  }

  dimension: last_activity_at {
    type: string
    sql: ${TABLE}."last_activity_at" ;;
  }

  dimension: prospect {
    type: string
    sql: ${TABLE}."prospect" ;;
  }

  dimension: rejected_at {
    group_label: "Rejected Info"
    type: string
    sql: ${TABLE}."rejected_at" ;;
  }

  dimension: rejection_reason_id {
    group_label: "Rejected Info"
    type: string
    sql: ${TABLE}."rejection_reason_id" ;;
  }

  dimension: rejection_reason_name {
    group_label: "Rejected Info"
    type: string
    sql: ${TABLE}."rejection_reason_name" ;;
  }

  dimension: rejection_reason_type_id {
    group_label: "Rejected Info"
    type: string
    sql: ${TABLE}."rejection_reason_type_id" ;;
  }

  dimension: rejection_reason_type_name {
    group_label: "Rejected Info"
    type: string
    sql: ${TABLE}."rejection_reason_type_name" ;;
  }

  dimension: source_id {
    type: string
    sql: ${TABLE}."source_id" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, rejection_reason_name, rejection_reason_type_name, current_stage_name]
  }
}
