view: scheduled_interviews {
  view_label: "Interviews"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API-Milepost.scheduled_interviews" ;;

  dimension: id {
    primary_key: yes
    sql: ${TABLE}."id" ;;
  }

  dimension: application_id {
    hidden: yes
    type: string
    sql: ${TABLE}."application_id" ;;
  }

  dimension: external_event_id {
    hidden: yes
    type: string
    sql: ${TABLE}."external_event_id" ;;
  }

  dimension_group: interview_start_time {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."interview_start_time",'') ;;
  }

  dimension_group: interview_end_time {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."interview_end_time",'') ;;
  }

  dimension: interview_location {
    type: string
    sql: ${TABLE}."interview_location" ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}."status" ;;
  }

  dimension_group: created_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."created_at",'') ;;
  }

  dimension_group: updated_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."updated_at",'') ;;
  }

  dimension: interview_id {
    type: string
    sql: ${TABLE}."interview_id" ;;
  }

  dimension: interview_name {
    label: "Interview Type"
    type: string
    sql: ${TABLE}."interview_name" ;;
  }

  dimension: organizer_id {
    type: string
    sql: ${TABLE}."organizer_id" ;;
  }

  dimension: organizer_first_name {
    type: string
    sql: ${TABLE}."organizer_first_name" ;;
  }

  dimension: organizer_last_name {
    type: string
    sql: ${TABLE}."organizer_last_name" ;;
  }

  dimension: organizer_full_name {
    type: string
    sql: ${TABLE}."organizer_full_name" ;;
  }

  dimension: organizer_employee_id {
    type: string
    sql: ${TABLE}."organizer_employee_id" ;;
  }

  measure: interview_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }

}