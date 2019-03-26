view: candidates {
  view_label: "Candidates"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API.candidates" ;;

  dimension: id {
    label: "Candidate Id"
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension_group: _timestamp {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    hidden: yes
    sql: ${TABLE}."_timestamp" ;;
  }

  dimension_group: custom_fields_candidate_assessment_results2 {
    label: "Candidate Assessment Results"
#     group_label: "Custom Fields"
    type: time
    timeframes: [raw,date,week,quarter,year]
    sql: NULLIF(${TABLE}."custom_fields_candidate_assessment_results2",'') ;;
  }

  dimension: custom_fields_candidate_experience_level {
    label: "Candidate Experience Level"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_candidate_experience_level" ;;
  }

  dimension: custom_fields_candidate_no_show {
    label: "Candidate No Show"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_candidate_no_show" ;;
  }

  dimension: custom_fields_candidate_sourced {
    label: "Sourced"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_candidate_sourced" ;;
  }

  dimension: custom_fields_candidate_status {
    label: "Status"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_candidate_status" ;;
  }

  dimension: custom_fields_ccat1_raw_score {
    label: "CCAT1 Raw Score"
    group_label: "Assessment Scores"
    type: string
    sql: ${TABLE}."custom_fields_ccat1_raw_score" ;;
  }

  dimension: custom_fields_ccat2_raw_score {
    label: "CCAT2 Raw Score"
    group_label: "Assessment Scores"
    type: string
    sql: ${TABLE}."custom_fields_ccat2_raw_score" ;;
  }

  dimension: custom_fields_csap_score_band {
    label: "CSAP Score Band"
    group_label: "Assessment Scores"
    type: string
    sql: ${TABLE}."custom_fields_csap_score_band" ;;
  }

  dimension: custom_fields_desired_salary {
    label: "Desired Salary"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_desired_salary" ;;
  }

  dimension: custom_fields_epp {
    label: "EPP"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_epp" ;;
  }

  dimension: custom_fields_invite_to_expensify {
    label: "Invite to Expensify"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_invite_to_expensify" ;;
  }

  dimension: custom_fields_sales_ap_score_band {
    label: "Sales AP Score Band"
    group_label: "Assessment Scores"
    type: string
    sql: ${TABLE}."custom_fields_sales_ap_score_band" ;;
  }

  dimension: custom_fields_sponsorship {
    label: "Sponsorship"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_sponsorship" ;;
  }

  dimension: custom_fields_ucat1_raw_score {
    label: "UCAT1 Raw Score"
    group_label: "Assessment Scores"
    type: string
    sql: ${TABLE}."custom_fields_ucat1_raw_score" ;;
  }

  dimension: custom_fields_ucat2_raw_score {
    label: "UCAT2 Raw Score"
    group_label: "Assessment Scores"
    type: string
    sql: ${TABLE}."custom_fields_ucat2_raw_score" ;;
  }

  dimension: first_name {
    group_label: "Candidate Info"
    type: string
    sql: ${TABLE}."first_name" ;;
  }

  dimension: last_name {
    group_label: "Candidate Info"
    type: string
    sql: ${TABLE}."last_name" ;;
  }
  measure: count_candidate_distinct {
    label: "Count of Candidates"
    type: count_distinct
    sql: ${TABLE}."id";;
  }

  measure: sum_ucat1rawscore {
    group_label: "UCAT Score"
    label: "Total UCAT 1 Raw Score"
    type: sum
    sql: NULLIF(${TABLE}."custom_fields_ucat1_raw_score",'');;
  }

  measure: sum_ucat2rawscore {
    group_label: "UCAT Score"
    label: "Total UCAT 2 Raw Score"
    type: sum
    sql: NULLIF(${TABLE}."custom_fields_ucat2_raw_score",'');;
  }

  measure: sum_combined_ucat_score {
    group_label: "UCAT Score"
    label: "Total UCAT Raw Score"
    type: number
    sql: ${sum_ucat1rawscore}+${sum_ucat2rawscore};;
  }

  measure: avg_ucat1_score {
    group_label: "UCAT Score"
    label: "Average UCAT 1 Raw Score"
    type: average
    sql: NULLIF(${TABLE}."custom_fields_ucat1_raw_score",'');;
    value_format_name: decimal_1
  }

  measure: avg_ucat2_score {
    group_label: "UCAT Score"
    label: "Average UCAT 2 Raw Score"
    type: average
    sql: NULLIF(${TABLE}."custom_fields_ucat2_raw_score",'');;
    value_format_name: decimal_1
  }

  measure: avg_combined_ucat_score {
    group_label: "UCAT Score"
    label: "Average Combined UCAT Raw Score"
    type: average
    sql: (NULLIF(${TABLE}."custom_fields_ucat1_raw_score",'')+NULLIF(${TABLE}."custom_fields_ucat2_raw_score",''));;
    value_format_name: decimal_1
  }

  measure: sum_ccat1rawscore {
    group_label: "CCAT Score"
    label: "Total CCAT 1 Raw Score"
    type: sum
    sql: NULLIF(${TABLE}."custom_fields_ccat1_raw_score",'');;
  }

  measure: sum_ccat2rawscore {
    group_label: "CCAT Score"
    label: "Total CCAT 2 Raw Score"
    type: sum
    sql: NULLIF(${TABLE}."custom_fields_ccat2_raw_score",'');;
  }

  measure: sum_combined_ccat_score {
    group_label: "CCAT Score"
    label: "Total CCAT Raw Score"
    type: number
    sql: ${sum_ccat1rawscore}+${sum_ccat2rawscore};;
  }

  measure: avg_ccat1_score {
    group_label: "CCAT Score"
    label: "Average CCAT 1 Raw Score"
    type: average
    sql: NULLIF(${TABLE}."custom_fields_ccat1_raw_score",'');;
    value_format_name: decimal_1
  }

  measure: avg_ccat2_score {
    group_label: "CCAT Score"
    label: "Average CCAT 2 Raw Score"
    type: average
    sql: NULLIF(${TABLE}."custom_fields_ccat2_raw_score",'');;
    value_format_name: decimal_1
  }

  measure: avg_combined_ccat_score {
    group_label: "CCAT Score"
    label: "Average Combined CCAT Raw Score"
    type: average
    sql: (NULLIF(${TABLE}."custom_fields_ccat1_raw_score",'')+NULLIF(${TABLE}."custom_fields_ccat2_raw_score",''));;
    value_format_name: decimal_1
  }
}
