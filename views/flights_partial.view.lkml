view: flights {
  sql_table_name: join_demo.flights_partial ;;

  dimension: aircraft_id {
    type: string
    sql: ${TABLE}.aircraft_id ;;
  }

  dimension: arr_delay {
    type: number
    sql: ${TABLE}.arr_delay ;;
  }

  dimension_group: arr {
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
    sql: ${TABLE}.arr_time ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.cancelled ;;
  }

  dimension: carrier_id {
    type: string
    sql: ${TABLE}.carrier_id ;;
  }

  dimension: dep_delay {
    type: number
    sql: ${TABLE}.dep_delay ;;
  }

  dimension_group: dep {
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
    sql: ${TABLE}.dep_time ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension: diverted {
    type: yesno
    sql: ${TABLE}.diverted ;;
  }

  dimension: flight_num {
    type: number
    sql: ${TABLE}.flight_num ;;
  }

  dimension: flight_time {
    type: number
    sql: ${TABLE}.flight_time ;;
  }

  dimension: id2 {
    type: number
    sql: ${TABLE}.id2 ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: taxi_in {
    type: number
    sql: ${TABLE}.taxi_in ;;
  }

  dimension: taxi_out {
    type: number
    sql: ${TABLE}.taxi_out ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: cancelled_count {
    type: count

    filters: {
      field: cancelled
      value: "yes"
    }
  }

  measure: average_distance {
    type: average
    sql: ${distance} ;;
    value_format_name: decimal_2
  }

  measure: average_flight_time {
    type: average
    sql: ${flight_time} ;;
    value_format_name: decimal_2
  }

  measure: total_flight_time {
    type: sum
    sql: ${flight_time} ;;
    value_format_name: decimal_2
  }
}
