view: demographics {
    view_label: "Demographics"
    sql_table_name: WORKSPACE_493757853."in.c-wrike-API-Milepost.demographics" ;;

  dimension: application_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."application_id" ;;
  }

  dimension: candidate_id {
    hidden: yes
    type: string
    sql: ${TABLE}."candidate_id" ;;
  }

  dimension: race {
    type: string
    sql: ${TABLE}."race" ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}."gender" ;;
  }

  dimension: veteran_status {
    type: string
    sql: ${TABLE}."veteran_status" ;;
  }

  dimension: disability_status {
    type: string
    sql: ${TABLE}."disability_status" ;;
  }

  dimension_group: submitted_at {
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."submitted_at",'') ;;
  }
}
