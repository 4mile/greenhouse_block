view: faa_aircraft {
  sql_table_name: `fh-bigquery.flights.faa_aircraft_201909`
    ;;

  dimension_group: air_worth {
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
    sql: ${TABLE}.air_worth_date ;;
  }

  dimension_group: cert_issue {
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
    sql: ${TABLE}.cert_issue_date ;;
  }

  dimension: certification {
    type: string
    sql: ${TABLE}.certification ;;
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

  dimension: county {
    type: string
    sql: ${TABLE}.county ;;
  }

  dimension: eng_mfr_mdl {
    type: string
    sql: ${TABLE}.eng_mfr_mdl ;;
  }

  dimension_group: expiration {
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
    sql: ${TABLE}.expiration_date ;;
  }

  dimension: extra {
    type: string
    sql: ${TABLE}.extra ;;
  }

  dimension: fract_owner {
    type: string
    sql: ${TABLE}.fract_owner ;;
  }

  dimension: kit_mfr {
    type: string
    sql: ${TABLE}.kit_mfr ;;
  }

  dimension: kit_model {
    type: string
    sql: ${TABLE}.kit_model ;;
  }

  dimension_group: last_action {
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
    sql: ${TABLE}.last_action_date ;;
  }

  dimension: mfr_mdl_code {
    type: string
    sql: ${TABLE}.mfr_mdl_code ;;
  }

  dimension: mode_s_code {
    type: string
    sql: ${TABLE}.mode_s_code ;;
  }

  dimension: mode_s_code_hex {
    type: string
    sql: ${TABLE}.mode_s_code_hex ;;
  }

  dimension: n_number {
    type: string
    sql: ${TABLE}.n_number ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: other_names1 {
    type: string
    sql: ${TABLE}.other_names1 ;;
  }

  dimension: other_names2 {
    type: string
    sql: ${TABLE}.other_names2 ;;
  }

  dimension: other_names3 {
    type: string
    sql: ${TABLE}.other_names3 ;;
  }

  dimension: other_names4 {
    type: string
    sql: ${TABLE}.other_names4 ;;
  }

  dimension: other_names5 {
    type: string
    sql: ${TABLE}.other_names5 ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.region ;;
  }

  dimension: serial_number {
    type: string
    sql: ${TABLE}.serial_number ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: status_code {
    type: string
    sql: ${TABLE}.status_code ;;
  }

  dimension: street {
    type: string
    sql: ${TABLE}.street ;;
  }

  dimension: street2 {
    type: string
    sql: ${TABLE}.street2 ;;
  }

  dimension: tail_number {
    type: string
    sql: ${TABLE}.Tail_Number ;;
  }

  dimension: type_aircraft {
    type: string
    sql: ${TABLE}.type_aircraft ;;
  }

  dimension: type_engine {
    type: string
    sql: ${TABLE}.type_engine ;;
  }

  dimension: type_registrant {
    type: string
    sql: ${TABLE}.type_registrant ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}.unique_id ;;
  }

  dimension: year_mfr {
    type: number
    sql: ${TABLE}.year_mfr ;;
  }

  dimension: zip_code {
    type: zipcode
    sql: ${TABLE}.zip_code ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
