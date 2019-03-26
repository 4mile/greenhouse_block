view: sources {
  view_label: "Sources"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API.sources" ;;

  dimension: id {
    label: "Source Id"
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension_group: _timestamp {
    hidden: yes
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."_timestamp" ;;
  }

  dimension: name {
    label: "Source Name"
    type: string
    sql: ${TABLE}."name" ;;
  }

  measure: source_count {
    label: "Count of Sources"
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }
}
