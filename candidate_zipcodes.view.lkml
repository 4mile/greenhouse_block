view: candidate_zipcodes {
  view_label: "Candidate Zipcodes"
  sql_table_name: WORKSPACE_493757853."out.c-milepost-parse-address-data.parsed_zipcodes" ;;

  dimension_group: _timestamp {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."_timestamp" ;;
    hidden: yes
  }

  dimension: candidate_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."candidate_id" ;;
  }

  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}."zipcode" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
