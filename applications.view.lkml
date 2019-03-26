view: applications {
  view_label: "Applications"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API.applications" ;;

  dimension: id {
    label: "Application Id"
    primary_key: yes
#     hidden: yes
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
    sql: NULLIF(${TABLE}."applied_at",'');;
  }

  dimension: candidate_id {
    type: string
    hidden: yes
    sql: ${TABLE}."candidate_id" ;;
  }

  dimension: current_stage_id {
    hidden: yes
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
    sql: NULLIF(${TABLE}."last_activity_at",'') ;;
  }

  dimension: prospect {
    type: string
    sql: ${TABLE}."prospect" ;;
  }

  dimension_group: rejected_at {
#     group_label: "Rejected Info"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."rejected_at",'') ;;
  }

  dimension: rejection_reason_id {
    group_label: "Rejected Info"
    hidden: yes
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
    hidden: yes
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

#   measure: applied_rejection_duration {
#     label: "Days Between Applied/Rejection"
#     type: max
#     sql: datediff('day', ${applied_at_raw}, ${rejected_at_raw})  ;;
#   }

  measure: avg_applied_rejection_duration {
    label: "Average Days Between Applied/Rejection"
    type: average
    sql: datediff('day', ${applied_at_raw}, ${rejected_at_raw})  ;;
    value_format_name: decimal_1

  }

  measure: application_count {
    label: "Count of Applications"
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }

  measure: rejection_count {
    label: "Count of Rejections"
    type: count_distinct
    sql: ${TABLE}."id" ;;
    filters: {
      field: status
      value: "rejected"
    }
  }

  measure: hired_count {
    label: "Count of Application Hired"
    type: count_distinct
    sql: ${TABLE}."id" ;;
    filters: {
      field: status
      value: "hired"
    }
  }

  measure: active_count {
    label: "Count of Application Active"
    type: count_distinct
    sql: ${TABLE}."id" ;;
    filters: {
      field: status
      value: "active"
    }
  }
}
