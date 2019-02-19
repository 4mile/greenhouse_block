view: in_cgatherapi_jobs {
  view_label: "Jobs"
  sql_table_name: WORKSPACE_1155666."in.c-gather-API.jobs" ;;

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
    label: "Job Created At"
    type: string
    sql: ${TABLE}."created_at" ;;
  }

  dimension: custom_fields_budgeted {
    label: "Budgeted"
    type: string
    sql: ${TABLE}."custom_fields_budgeted" ;;
  }

  dimension: custom_fields_currency_type {
    label: "Currency Type"
    type: string
    sql: ${TABLE}."custom_fields_currency_type" ;;
  }

  dimension: custom_fields_hiring_manager {
    label: "Hiring Manager"
    group_label: "Hiring Manager Info"
    type: string
    sql: ${TABLE}."custom_fields_hiring_manager" ;;
  }

  dimension: custom_fields_hiring_manager_email {
    label: "Hiring Manager Email"
    group_label: "Hiring Manager Info"
    type: string
    sql: ${TABLE}."custom_fields_hiring_manager_email" ;;
  }

  dimension: custom_fields_hiring_manager_first_name {
    label: "Hiring Manager First Name"
    group_label: "Hiring Manager Info"
    type: string
    sql: ${TABLE}."custom_fields_hiring_manager_first_name" ;;
  }

  dimension: custom_fields_hiring_manager_last_name {
    label: "Hiring Manager Last Name"
    group_label: "Hiring Manager Info"
    type: string
    sql: ${TABLE}."custom_fields_hiring_manager_last_name" ;;
  }

  dimension: custom_fields_job_status {
    label: "Job Status"
    type: string
    sql: ${TABLE}."custom_fields_job_status" ;;
  }

  dimension: custom_fields_pipeline_req {
    label: "Pipeline Req"
    type: string
    sql: ${TABLE}."custom_fields_pipeline_req" ;;
  }

  dimension: custom_fields_recruiter_email {
    label: "Recruiter Email"
    group_label: "Recruiter Info"
    type: string
    sql: ${TABLE}."custom_fields_recruiter_email" ;;
  }

  dimension: custom_fields_recruiter_first_name {
    label: "Recruiter First Name"
    group_label: "Recruiter Info"
    type: string
    sql: ${TABLE}."custom_fields_recruiter_first_name" ;;
  }

  dimension: custom_fields_recruiter_last_name {
    label: "Recruiter Last Name"
    group_label: "Recruiter Info"
    type: string
    sql: ${TABLE}."custom_fields_recruiter_last_name" ;;
  }

  dimension: custom_fields_req_category {
    label: "Req Category"
    group_label: "Req Info"
    type: string
    sql: ${TABLE}."custom_fields_req_category" ;;
  }

  dimension: custom_fields_req_level {
    label: "Req Level"
    group_label: "Req Info"
    type: string
    sql: ${TABLE}."custom_fields_req_level" ;;
  }

  dimension: custom_fields_req_type {
    label: "Req Type"
    group_label: "Req Info"
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
