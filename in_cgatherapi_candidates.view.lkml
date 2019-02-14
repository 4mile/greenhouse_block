view: in_cgatherapi_candidates {
  sql_table_name: WORKSPACE_1155666.in.c-gather-API.candidates ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

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
  }

  dimension: custom_fields_candidate_assessment_results2 {
    type: string
    sql: ${TABLE}."custom_fields_candidate_assessment_results2" ;;
  }

  dimension: custom_fields_candidate_experience_level {
    type: string
    sql: ${TABLE}."custom_fields_candidate_experience_level" ;;
  }

  dimension: custom_fields_candidate_no_show {
    type: string
    sql: ${TABLE}."custom_fields_candidate_no_show" ;;
  }

  dimension: custom_fields_candidate_sourced {
    type: string
    sql: ${TABLE}."custom_fields_candidate_sourced" ;;
  }

  dimension: custom_fields_candidate_status {
    type: string
    sql: ${TABLE}."custom_fields_candidate_status" ;;
  }

  dimension: custom_fields_ccat1_raw_score {
    type: string
    sql: ${TABLE}."custom_fields_ccat1_raw_score" ;;
  }

  dimension: custom_fields_ccat2_raw_score {
    type: string
    sql: ${TABLE}."custom_fields_ccat2_raw_score" ;;
  }

  dimension: custom_fields_csap_score_band {
    type: string
    sql: ${TABLE}."custom_fields_csap_score_band" ;;
  }

  dimension: custom_fields_desired_salary {
    type: string
    sql: ${TABLE}."custom_fields_desired_salary" ;;
  }

  dimension: custom_fields_epp {
    type: string
    sql: ${TABLE}."custom_fields_epp" ;;
  }

  dimension: custom_fields_invite_to_expensify {
    type: string
    sql: ${TABLE}."custom_fields_invite_to_expensify" ;;
  }

  dimension: custom_fields_sales_ap_score_band {
    type: string
    sql: ${TABLE}."custom_fields_sales_ap_score_band" ;;
  }

  dimension: custom_fields_sponsorship {
    type: string
    sql: ${TABLE}."custom_fields_sponsorship" ;;
  }

  dimension: custom_fields_ucat1_raw_score {
    type: string
    sql: ${TABLE}."custom_fields_ucat1_raw_score" ;;
  }

  dimension: custom_fields_ucat2_raw_score {
    type: string
    sql: ${TABLE}."custom_fields_ucat2_raw_score" ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}."last_name" ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name]
  }
}
