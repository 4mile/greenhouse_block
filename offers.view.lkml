view: offers {
  view_label: "Offers"
  sql_table_name: WORKSPACE_493757853."in.c-wrike-API-Milepost.offers" ;;

  dimension: id {
    label: "Offer Id"
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: application_id {
    hidden: yes
    type: string
    sql: ${TABLE}."application_id" ;;
  }

  dimension: version {
    type: number
    sql: ${TABLE}."version" ;;
  }

  dimension: job_id {
    hidden: yes
    type: string
    sql: ${TABLE}."job_id" ;;
  }

  dimension: candidate_id {
    hidden: yes
    type: string
    sql: ${TABLE}."candidate_id" ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: CAST(NULLIF(${TABLE}."created_at",'') AS datetime) ;;
  }

  dimension_group: updated_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: CAST(NULLIF(${TABLE}."updated_at",'') AS datetime) ;;
  }

  dimension_group: sent_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."sent_at",'') ;;
  }

  dimension_group: resolved_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."resolved_at",'') ;;
  }

  dimension_group: starts_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."starts_at",'') ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension: custom_fields_offer_type {
    label: "Offer Type"
    type: string
    sql: ${TABLE}."custom_fields_offer_type" ;;
  }

  dimension: custom_fields_offer_status {
    label: "Offer Status"
    type: string
    sql: ${TABLE}."custom_fields_offer_status" ;;
  }

  dimension: custom_fields_offer_reject_reason {
    label: "Offer Reject Reason"
    type: string
    sql: ${TABLE}."custom_fields_offer_reject_reason" ;;
  }

  dimension: custom_fields_requisition_filled {
    label: "Requisition Filled "
    type: string
    sql: ${TABLE}."custom_fields_requisition_filled" ;;
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

  dimension: custom_fields_hire_hourly {
    label: "Hire Hourly"
    type: number
    sql: ${TABLE}."custom_fields_hire_hourly" ;;
  }

  dimension: custom_fields_hire_commission_target {
    label: "Hire Commision Target"
    type: number
    sql: ${TABLE}."custom_fields_hire_commission_target" ;;
  }

  measure: offer_count {
    group_label: "Offer"
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }

  measure: offer_accepted_count {
    group_label: "Offer"
    type: count_distinct
    sql: ${TABLE}."id" ;;
    filters: {
      field: status
      value: "accepted"
    }
  }

  measure: offer_rejected_count {
    group_label: "Offer"
    type: count_distinct
    sql: ${TABLE}."id" ;;
    filters: {
      field: status
      value: "rejected"
    }
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
