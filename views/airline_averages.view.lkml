view: airline_averages {
  sql_table_name: `fh-bigquery.flights.airline_averages_198710_201904`
    ;;

  dimension: airline {
    type: string
    sql: ${TABLE}.airline ;;
  }

  dimension: avg_delay {
    type: number
    sql: ${TABLE}.avg_delay ;;
  }

  dimension: flights {
    type: number
    sql: ${TABLE}.flights ;;
  }

  dimension_group: quarter {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.quarter ;;
  }

  dimension: top_route {
    hidden: yes
    sql: ${TABLE}.top_route ;;
  }

  dimension: total_distance {
    type: number
    sql: ${TABLE}.total_distance ;;
  }

  dimension: total_time {
    type: number
    sql: ${TABLE}.total_time ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}

view: airline_averages_198710_201904__top_route {
  dimension: count {
    type: number
    sql: ${TABLE}.count ;;
  }

  dimension: value {
    type: string
    sql: ${TABLE}.value ;;
  }
}
