view: offers {
  view_label: "Offers"
  sql_table_name: WORKSPACE_1155666."in.c-gather-API.offers" ;;

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

  dimension: application_id {
    type: string
    sql: ${TABLE}."application_id" ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}."created_at" ;;
  }

  dimension: custom_fields_hire_base {
    type: string
    sql: ${TABLE}."custom_fields_hire_base" ;;
  }

  dimension: custom_fields_hire_bonus {
    type: string
    sql: ${TABLE}."custom_fields_hire_bonus" ;;
  }

  dimension: custom_fields_hire_commission_target {
    type: string
    sql: ${TABLE}."custom_fields_hire_commission_target" ;;
  }

  dimension: custom_fields_hire_hourly {
    type: string
    sql: ${TABLE}."custom_fields_hire_hourly" ;;
  }

  dimension: custom_fields_offer_reject_reason {
    type: string
    sql: ${TABLE}."custom_fields_offer_reject_reason" ;;
  }

  dimension: custom_fields_offer_status {
    type: string
    sql: ${TABLE}."custom_fields_offer_status" ;;
  }

  dimension: custom_fields_offer_type {
    type: string
    sql: ${TABLE}."custom_fields_offer_type" ;;
  }

  dimension: custom_fields_requisition_filled {
    type: string
    sql: ${TABLE}."custom_fields_requisition_filled" ;;
  }

  dimension: jobs_id {
    type: string
    sql: ${TABLE}."jobs_id" ;;
  }

  dimension: sent_at {
    type: string
    sql: ${TABLE}."sent_at" ;;
  }

  dimension: starts_at {
    type: string
    sql: ${TABLE}."starts_at" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
