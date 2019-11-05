view: applications {
  sql_table_name: WORKSPACE_493757853."in.c-wrike-API-Milepost.applications" ;;

##### Primary Key #####
  dimension: id {
    label: "Application Id"
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

##### Dimension Groups #####
  dimension_group: applied_at {
    label: "Applied At"
    type: time
    timeframes: [raw
      ,date
      ,week
      ,month
      ,quarter,year]
    sql: cast(nullif(${TABLE}."applied_at",'') as datetime);;
  }

  dimension_group: rejected_at {
    type: time
    timeframes: [raw
      ,date
      ,week
      ,month
      ,quarter,year]
    sql: cast(nullif(${TABLE}."rejected_at",'') as datetime);;
  }

  dimension_group: last_activity_at {
    type: time
    timeframes: [raw
      ,date
      ,week
      ,month
      ,quarter,year]
    sql: cast(nullif(${TABLE}."last_activity_at",'') as datetime) ;;
  }

##### Dimensions #####
  dimension: candidate_id {
    type: string
    hidden: yes
    sql: ${TABLE}."candidate_id" ;;
  }

  dimension: source_id {
    type: string
    hidden: yes
    sql: ${TABLE}."source_id" ;;
  }

  dimension: source_public_name {
    type: string
    hidden: yes
    sql: ${TABLE}."source_public_name" ;;
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

  dimension: status {
    label: "Application Status"
    type: string
    sql: ${TABLE}."status" ;;
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

  dimension: custom_field {
    type: string
    sql: ${TABLE}."custom_fields" ;;
  }

  dimension: applied_rejection_duration {
    hidden: yes
    type: duration_day
    sql_start: ${applied_at_raw} ;;
    sql_end:  ${rejected_at_raw} ;;

  }

##### Measures #####
  measure: avg_applied_rejection_duration {
    label: "Average Days Between Applied/Rejection"
    type: average
    sql: ${applied_rejection_duration};;
    value_format_name: decimal_1
  }

  measure: application_count {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id
                  ,candidate_id
                  ,applied_at_date
                  ,jobs_departments.name_category
                  ,jobs.name
                  ,jobs_offices.location_name
                  ,status
                  ,sources.source_type
                  ,current_stage_name
                  ,last_activity_at_date]
  }

  measure: rejection_count {
    label: "Reject Application Count"
    type: count_distinct
    sql: ${id} ;;

    filters: {
      field: status
      value: "rejected"
    }

    drill_fields: [id
      ,candidate_id
      ,applied_at_date
      ,jobs_departments.name_category
      ,jobs.name
      ,jobs_offices.location_name
      ,status
      ,sources.source_type
      ,rejected_at_date
      ,rejection_reason_name
      ,rejection_reason_type_name
      ,current_stage_name]
  }

  measure: hired_count {
    type: count_distinct
    sql: ${id} ;;

    filters: {
      field: status
      value: "hired"
    }
  }

  measure: active_count {
    label: "Active Application Count"
    type: count_distinct
    sql: ${id} ;;

    filters: {
      field: status
      value: "active"
    }

    drill_fields: [id
                  ,candidate_id
                  ,applied_at_date
                  ,jobs_departments.name_category
                  ,jobs.name
                  ,jobs_offices.location_name
                  ,status
                  ,sources.source_type
                  ,current_stage_name
                  ,last_activity_at_date]
  }
}
