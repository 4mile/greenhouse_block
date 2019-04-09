view: sources {
  view_label: "Sources"
  sql_table_name: WORKSPACE_493757853."in.c-wrike-API-Milepost.sources" ;;

  dimension: id {
    label: "Source Id"
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: name {
    label: "Source Name"
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: source_type_id {
    type: string
    sql: ${TABLE}."source_type_id" ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}."source_type" ;;
  }

  measure: source_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }
}
