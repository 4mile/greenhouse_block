view: applications {
  view_label: "Applications"
  sql_table_name: WORKSPACE_1155666."in.c-gather-API.applications" ;;

  dimension: id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

#   dimension_group: _timestamp {
#     label: "Application Date"
#     type: time
#     timeframes: [
#       raw,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}."_timestamp" ;;
#   }

  dimension_group: applied_at {
    label: "Applied At"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
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

# no values
  dimension: custom_fields {
    type: string
    sql: ${TABLE}."custom_fields" ;;
  }

  dimension_group: last_activity_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: ${TABLE}."last_activity_at" ;;
  }

  dimension: prospect {
    type: string
    sql: ${TABLE}."prospect" ;;
  }

  dimension_group: rejected_at {
#     group_label: "Rejected Info"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
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
    hidden: yes
    sql: ${TABLE}."source_id" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  measure: application_count {
    label: "Count of Applications"
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }

  measure: candidate_count {
    label: "Count of Applicants"
    type: count_distinct
    sql: ${TABLE}."candidate_id" ;;
  }
}
