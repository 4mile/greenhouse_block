view: jobs_departments {
  view_label: "Job Departments"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API.jobs_departments" ;;

  dimension: id {
    label: "Department Id"
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
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."jobs_pkey" ;;
  }

  dimension: name {
    label: "Department Name"
    type: string
    sql: ${TABLE}."name" ;;
  }

  measure: department_count {
    label: "Count of Departments"
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }
}
