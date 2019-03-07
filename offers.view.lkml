view: offers {
  view_label: "Offers"
  sql_table_name: WORKSPACE_1155666."in.c-gather-API.offers" ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

#   dimension_group: _timestamp {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}."_timestamp" ;;
#   }

  dimension: application_id {
    type: string
    sql: ${TABLE}."application_id" ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}."created_at" ;;
    timeframes: [raw,date,week,month,quarter,year]
  }

  dimension: custom_fields_hire_base {
    label: "Hire Base"
    type: number
    sql: ${TABLE}."custom_fields_hire_base" ;;
  }

  dimension: custom_fields_hire_bonus {
    label: "Hire Bonus"
    type: number
    sql: ${TABLE}."custom_fields_hire_bonus" ;;
  }

  dimension: custom_fields_hire_commission_target {
    label: "Hire Commision Target"
    type: number
    sql: ${TABLE}."custom_fields_hire_commission_target" ;;
  }

  dimension: custom_fields_hire_hourly {
    label: "Hire Hourly"
    type: number
    sql: ${TABLE}."custom_fields_hire_hourly" ;;
  }

  dimension: custom_fields_offer_reject_reason {
    label: "Offer Reject Reason"
    type: string
    sql: ${TABLE}."custom_fields_offer_reject_reason" ;;
  }

  dimension: custom_fields_offer_status {
    label: "Offer Status"
    type: string
    sql: ${TABLE}."custom_fields_offer_status" ;;
  }

  dimension: custom_fields_offer_type {
    label: "Offer Type"
    type: string
    sql: ${TABLE}."custom_fields_offer_type" ;;
  }

  dimension: custom_fields_requisition_filled {
    label: "Requisition Filled "
    type: string
    sql: ${TABLE}."custom_fields_requisition_filled" ;;
  }

  dimension: jobs_id {
    hidden: yes
    type: string
    sql: ${TABLE}."jobs_id" ;;
  }

  dimension_group: sent_at {
    type: time
    sql: ${TABLE}."sent_at" ;;
    timeframes: [raw,date,week,month,quarter,year]
  }

  dimension_group: starts_at {
    type: time
    sql: ${TABLE}."starts_at" ;;
    timeframes: [raw,date,week,month,quarter,year]
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  measure: count_offer {
    label: "Count of Offers"
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }

  measure: total_hire_bonus {
    label: "Total Hire Bonus"
    group_label: "Bonus"
    type: sum
    sql: NULLIF(${TABLE}."custom_fields_hire_bonus",'') ;;
    value_format_name: decimal_2
  }

  measure: avg_hire_bonus {
    label: "Average Hire Bonus"
    group_label: "Bonus"
    type: average
    sql: NULLIF(${TABLE}."custom_fields_hire_bonus",'') ;;
    value_format_name: decimal_2
  }

  measure: total_hirehourly {
    label: "Total Hire Hourly"
    group_label: "Hourly"
    type: sum
    sql: NULLIF(${TABLE}."custom_fields_hire_hourly",'') ;;
    value_format_name: decimal_2
  }

  measure: avg_hirehourly {
    label: "Average Hire Hourly"
    group_label: "Hourly"
    type: average
    sql: NULLIF(${TABLE}."custom_fields_hire_hourly",'') ;;
    value_format_name: decimal_2
  }


  measure: total_hirebase {
    label: "Total Hire Base"
    group_label: "Base"
    type: sum
    sql: NULLIF(${TABLE}."custom_fields_hire_base",'') ;;
    value_format_name: decimal_2
  }

  measure: avg_hirebase {
    label: "Average Hire Base"
    group_label: "Base"
    type: average
    sql: NULLIF(${TABLE}."custom_fields_hire_base",'') ;;
    value_format_name: decimal_2
  }

  measure: total_hirecommissiontarget{
    label: "Total Hire Commission Target"
    group_label: "Commission Target"
    type: sum
    sql: NULLIF(${TABLE}."custom_fields_hire_commission_target",'') ;;
    value_format_name: decimal_2
  }

  measure: avg_hirecommissiontarget{
    label: "Average Hire Commission Target"
    group_label: "Commission Target"
    type: average
    sql: NULLIF(${TABLE}."custom_fields_hire_commission_target",'') ;;
    value_format_name: decimal_2
  }
}
