view: jobs {
  view_label: "Jobs"
  sql_table_name: WORKSPACE_493757853."in.c-wrike-API-Milepost.jobs" ;;

  dimension: id {
    label: "Job Id"
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: name {
    label: "Job Title"
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: requisition_id {
    type: string
    sql: ${TABLE}."requisition_id" ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}."notes" ;;
  }

  dimension: is_confidential {
    type: string
    sql: ${TABLE}."is_confidential" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: CAST(NULLIF(${TABLE}."created_at",'') AS datetime) ;;
  }

  dimension_group: opened_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: CAST(NULLIF(${TABLE}."opened_at",'') AS datetime) ;;
  }

  dimension_group: closed_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: CAST(NULLIF(${TABLE}."closed_at",'') AS datetime) ;;
  }

  dimension_group: updated_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: CAST(NULLIF(${TABLE}."updated_at",'') AS datetime);;
  }

  dimension: custom_fields_budgeted {
    label: "Budgeted"
    type: string
    sql: ${TABLE}."custom_fields_budgeted" ;;
  }

  dimension: custom_fields_pipeline_req {
    label: "Pipeline Req"
    type: string
    sql: ${TABLE}."custom_fields_pipeline_req" ;;
  }

  dimension: custom_fields_req_level {
    label: "Req Level"
    group_label: "Req Info"
    type: string
    sql: ${TABLE}."custom_fields_req_level" ;;
  }

  dimension: custom_fields_recruiter_last_name {
    label: "Recruiter Last Name"
    group_label: "Recruiter Info"
    type: string
    sql: ${TABLE}."custom_fields_recruiter_last_name" ;;
  }

  dimension: custom_fields_recruiter_first_name {
    label: "Recruiter First Name"
    group_label: "Recruiter Info"
    type: string
    sql: ${TABLE}."custom_fields_recruiter_first_name" ;;
  }

  dimension: custom_fields_currency_type {
    label: "Currency Type"
    type: string
    sql: ${TABLE}."custom_fields_currency_type" ;;
  }

  dimension: custom_fields_recruiter_email {
    label: "Recruiter Email"
    group_label: "Recruiter Info"
    type: string
    sql: ${TABLE}."custom_fields_recruiter_email" ;;
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

  dimension: custom_fields_hiring_manager_email {
    label: "Hiring Manager Email"
    group_label: "Hiring Manager Info"
    type: string
    sql: ${TABLE}."custom_fields_hiring_manager_email" ;;
  }

  dimension: custom_fields_job_status {
    label: "Job Status"
    type: string
    sql: ${TABLE}."custom_fields_job_status" ;;
  }

  dimension: custom_fields_req_type {
    label: "Req Type"
    group_label: "Req Info"
    type: string
    sql: ${TABLE}."custom_fields_req_type" ;;
  }

  dimension: custom_fields_req_category {
    label: "Req Category"
    group_label: "Req Info"
    type: string
    sql: ${TABLE}."custom_fields_req_category" ;;
  }

  dimension: custom_fields_hiring_manager {
    label: "Hiring Manager"
    group_label: "Hiring Manager Info"
    type: string
    sql: ${TABLE}."custom_fields_hiring_manager" ;;
  }

  measure: jobs_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }

  measure: req_count {
    type: count_distinct
    sql: ${TABLE}."requisition_id" ;;
  }


  measure: open_jobs_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;

    filters: {
      field: status
      value: "open"
    }
  }

  measure: close_jobs_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;

    filters: {
      field: status
      value: "closed"
    }
  }

#   measure: avg_days_open_to_offer {
#     label: "Average Days Job Opened to Offer"
#     type: average
#     sql: datediff('day',${opened_at_raw},${offers.sent_at_raw}) ;;
#   }

  measure: avg_days_job_open_all {
    label: "Avg Days Opened - All"
    type: average
    sql: CASE
          WHEN ${closed_at_date} IS NULL THEN datediff('day', ${opened_at_date}, current_date)
          ELSE datediff('day', ${opened_at_date}, ${closed_at_date}) END;;
    value_format_name: decimal_0
  }

  measure: avg_days_open_closed {
    label: "Avg Days Opened - For Closed Jobs"
    type: average
    sql: CASE
          WHEN ${closed_at_date} IS NULL THEN NULL
          ELSE datediff('day', ${opened_at_date}, ${closed_at_date}) END;;
    value_format_name: decimal_0
  }

#   measure: avg_days_open_to_offer {
#     type: average
#     sql: datediff('day',${opened_at_date}, ${offers.sent_at_date}) ;;
#   }

  measure: avg_days_job_open {
    label: "Avg Days Opened - For Open Jobs"
    type: average
    sql: CASE
          WHEN ${closed_at_date} IS NULL THEN datediff('day', ${opened_at_date}, current_date)
          ELSE NULL END;;
    value_format_name: decimal_0
  }

}
