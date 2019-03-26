view: candidates_email_addresses {
  view_label: "Candidates Email Addresses"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API.candidates_email_addresses";;

  dimension_group: _timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    hidden: yes
    sql: ${TABLE}."_timestamp" ;;
  }

  dimension: candidates_pkey {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."candidates_pkey" ;;
  }

  dimension: email_address {
    group_label: "Candidate Info"
    type: string
    sql: ${TABLE}."email_address" ;;
  }

  dimension: type {
    label: "Email Type"
    group_label: "Candidate Info"
    type: string
    sql: ${TABLE}."type" ;;
  }
#
#   measure: count {
#     label: "Count Candidates by Email"
#     type: count_distinct
#     sql: ${TABLE}."email_address" ;;
#   }
}
