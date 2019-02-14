view: in_cgatherapi_jobs {
  sql_table_name: WORKSPACE_1155666.in.c-gather-API.jobs ;;

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

  dimension: closed_at {
    type: string
    sql: ${TABLE}."closed_at" ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}."created_at" ;;
  }

  dimension: custom_fields_budgeted {
    type: string
    sql: ${TABLE}."custom_fields_budgeted" ;;
  }

  dimension: custom_fields_currency_type {
    type: string
    sql: ${TABLE}."custom_fields_currency_type" ;;
  }

  dimension: custom_fields_hiring_manager {
    type: string
    sql: ${TABLE}."custom_fields_hiring_manager" ;;
  }

  dimension: custom_fields_hiring_manager_email {
    type: string
    sql: ${TABLE}."custom_fields_hiring_manager_email" ;;
  }

  dimension: custom_fields_hiring_manager_first_name {
    type: string
    sql: ${TABLE}."custom_fields_hiring_manager_first_name" ;;
  }

  dimension: custom_fields_hiring_manager_last_name {
    type: string
    sql: ${TABLE}."custom_fields_hiring_manager_last_name" ;;
  }

  dimension: custom_fields_job_status {
    type: string
    sql: ${TABLE}."custom_fields_job_status" ;;
  }

  dimension: custom_fields_pipeline_req {
    type: string
    sql: ${TABLE}."custom_fields_pipeline_req" ;;
  }

  dimension: custom_fields_recruiter_email {
    type: string
    sql: ${TABLE}."custom_fields_recruiter_email" ;;
  }

  dimension: custom_fields_recruiter_first_name {
    type: string
    sql: ${TABLE}."custom_fields_recruiter_first_name" ;;
  }

  dimension: custom_fields_recruiter_last_name {
    type: string
    sql: ${TABLE}."custom_fields_recruiter_last_name" ;;
  }

  dimension: custom_fields_req_category {
    type: string
    sql: ${TABLE}."custom_fields_req_category" ;;
  }

  dimension: custom_fields_req_level {
    type: string
    sql: ${TABLE}."custom_fields_req_level" ;;
  }

  dimension: custom_fields_req_type {
    type: string
    sql: ${TABLE}."custom_fields_req_type" ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: opened_at {
    type: string
    sql: ${TABLE}."opened_at" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      custom_fields_recruiter_last_name,
      custom_fields_recruiter_first_name,
      custom_fields_hiring_manager_first_name,
      custom_fields_hiring_manager_last_name
    ]
  }
}
