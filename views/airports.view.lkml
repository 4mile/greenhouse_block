view: airports {
  sql_table_name: `fh-bigquery.flights.global_airport_database`
    ;;

  dimension: altitude {
    type: number
    sql: ${TABLE}.altitude ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: geo {
    type: string
    sql: ${TABLE}.geo ;;
  }

  dimension: iata {
    type: string
    sql: ${TABLE}.iata ;;
  }

  dimension: icao {
    type: string
    sql: ${TABLE}.icao ;;
  }

  dimension: lat {
    type: number
    sql: ${TABLE}.lat ;;
  }

  dimension: lon {
    type: number
    sql: ${TABLE}.lon ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
