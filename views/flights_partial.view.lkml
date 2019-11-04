view: flights {
  sql_table_name: join_demo.flights_partial ;;

  dimension: aircraft_years_in_service {
    type: number
    sql: ${TABLE}.Flights_Aircraft_Years_In_Service ;;
  }

  dimension: categories {
    type: string
    sql: ${TABLE}.Flights_Categories ;;
  }

  dimension_group: depart {
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
    sql: ${TABLE}.Flights_Depart_Date ;;
  }

  dimension_group: details_arrival {
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
    sql: ${TABLE}.Flights_Details_Arrival_Date ;;
  }

  dimension: arrival_status {
    type: string
    sql: ${TABLE}.Flights_Details_Arrival_Status ;;
  }

  dimension: cancelled {
    type: yesno
    sql: ${TABLE}.Flights_Details_Cancelled ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.Flights_Details_Carrier ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}.Flights_Details_Destination ;;
  }

  dimension: diverted {
    type: yesno
    sql: ${TABLE}.Flights_Details_Diverted ;;
  }

  dimension: flight_num {
    type: number
    sql: ${TABLE}.Flights_Details_Flight_Num ;;
  }

  dimension: flight_time {
    type: number
    sql: ${TABLE}.Flights_Details_Flight_Time ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.Flights_Details_Origin ;;
  }

  dimension: tail_num {
    type: string
    sql: ${TABLE}.Flights_Details_Tail_Num ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.Flights_Distance ;;
  }

  dimension: origin_and_destination {
    type: string
    sql: ${TABLE}.Flights_Origin_and_Destination ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }

  measure: average_distance {
    type: average
    value_format_name: decimal_2
    sql: ${distance} ;;
  }

  measure: total_distance {
    type: sum
    value_format_name: decimal_2
    sql: ${distance} ;;
  }

  measure: cancelled_count {
    type: count
    filters: {
      field: cancelled
      value: "yes"
    }
  }




}
