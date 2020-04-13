view: sources {
  view_label: "Sources"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API-Milepost.sources" ;;

##### Primary Key #####
  dimension: id {
    label: "Source Id"
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

##### Dimensions #####
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

##### Measures #####
  measure: source_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }
}