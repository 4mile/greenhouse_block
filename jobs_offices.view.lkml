view: jobs_offices {
  view_label: "Job Offices"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API.jobs_offices";;

  dimension: id {
    label: "Office Id"
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension_group: _timestamp {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    hidden: yes
    sql: ${TABLE}."_timestamp" ;;
  }

  dimension: jobs_pkey {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}."jobs_pkey" ;;
  }

  dimension: name {
    label: "Office Name"
    type: string
    sql: ${TABLE}."name" ;;
  }

  measure: office_count {
    label: "Count of Offices"
    type: count_distinct
    sql: ${TABLE}."id" ;;
    drill_fields: [id, name]
  }
}
