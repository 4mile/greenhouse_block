view: candidate_zipcodes {
  view_label: "Candidate Zipcodes"
  sql_table_name: WORKSPACE_493757853."out.c-milepost-parse-address-data.parsed_zipcodes" ;;

##### Primary Key #####
  dimension: candidate_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."candidate_id" ;;
  }

##### Dimensions Group #####
  dimension_group: _timestamp {
    hidden: yes
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
  }

##### Dimensions #####
  dimension: zipcode {
    type: zipcode
    sql: ${TABLE}."zipcode" ;;
  }

##### Measures #####
  measure: zipcode_count {
    type: count_distinct
    sql: ${zipcode} ;;
  }
}
