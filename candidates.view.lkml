view: candidates {
  view_label: "Candidates"
  sql_table_name: WORKSPACE_493757853."in.c-wrike-API-Milepost.candidates" ;;

  dimension: id {
    label: "Candidate Id"
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
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

  dimension: company {
    group_label: "Candidate Info"
    type: string
    sql: ${TABLE}."company" ;;
  }

  dimension: title {
    group_label: "Candidate Info"
    type: string
    sql: ${TABLE}."title" ;;
  }

  dimension_group: created_at {
#     group_label: "Candidate Info"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."created_at",'') ;;
  }

  dimension_group: updated_at {
#     group_label: "Candidate Info"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."updated_at",'') ;;
  }

  dimension_group: last_activity_at {
#     group_label: "Candidate Info"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."last_activity_at",'') ;;
  }

  dimension: recruiter_id {
    group_label: "Recruiter Info"
    type: string
    sql: ${TABLE}."recruiter_id" ;;
  }

  dimension: recruiter_first_name {
    group_label: "Recruiter Info"
    type: string
    sql: ${TABLE}."recruiter_first_name" ;;
  }

  dimension: recruiter_last_name {
    group_label: "Recruiter Info"
    type: string
    sql: ${TABLE}."recruiter_last_name" ;;
  }

  dimension: recruiter_full_name {
    group_label: "Recruiter Info"
    type: string
    sql: ${TABLE}."recruiter_full_name" ;;
  }

  dimension: recruiter_employee_id {
    group_label: "Recruiter Info"
    type: string
    sql: ${TABLE}."recruiter_full_name" ;;
  }

  dimension: coordinator_id {
    group_label: "Coordinator Info"
    type: string
    sql: ${TABLE}."coordinator_id" ;;
  }

  dimension: coordinator_first_name {
    group_label: "Coordinator Info"
    type: string
    sql: ${TABLE}."coordinator_first_name" ;;
  }

  dimension: coordinator_last_name {
    group_label: "Coordinator Info"
    type: string
    sql: ${TABLE}."coordinator_last_name" ;;
  }

  dimension: coordinator_full_name {
    group_label: "Coordinator Info"
    type: string
    sql: ${TABLE}."coordinator_full_name" ;;
  }

  dimension: coordinator_employee_id {
    group_label: "Coordinator Info"
    type: string
    sql: ${TABLE}."coordinator_employee_id" ;;
  }

  dimension: custom_fields_desired_salary {
    label: "Desired Salary"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_desired_salary" ;;
  }

  dimension: custom_fields_invite_to_expensify {
    label: "Invite to Expensify"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_invite_to_expensify" ;;
  }

  dimension: custom_fields_sponsorship {
    label: "Sponsorship"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_sponsorship" ;;
  }

  dimension_group: custom_fields_candidate_assessment_results2 {
    label: "Candidate Assessment Results"
#     group_label: "Custom Fields"
    type: time
    timeframes: [raw,date,week,month,quarter,year]
    sql: NULLIF(${TABLE}."custom_fields_candidate_assessment_results2",'') ;;
  }

  dimension: custom_fields_candidate_status {
    label: "Status"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_candidate_status" ;;
  }

  dimension: custom_fields_candidate_experience_level {
    label: "Candidate Experience Level"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_candidate_experience_level" ;;
  }

  dimension: custom_fields_sales_ap_score_band {
    label: "Sales AP Score Band"
    group_label: "Assessment Scores"
    type: string
    sql: ${TABLE}."custom_fields_sales_ap_score_band" ;;
  }

  dimension: custom_fields_csap_score_band {
    label: "CSAP Score Band"
    group_label: "Assessment Scores"
    type: string
    sql: ${TABLE}."custom_fields_csap_score_band" ;;
  }

  dimension: custom_fields_candidate_no_show {
    label: "Candidate No Show"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_candidate_no_show" ;;
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

  dimension: custom_fields_candidate_sourced {
    label: "Sourced"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_candidate_sourced" ;;
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

  dimension: custom_fields_epp {
    label: "EPP"
#     group_label: "Custom Fields"
    type: string
    sql: ${TABLE}."custom_fields_epp" ;;
  }

  measure: candidate_distinct_count {
    type: count_distinct
    sql: ${TABLE}."id";;
    drill_fields: [id,applications.id, applications.applied_at_date,application.status,jobs_departments.name_category,jobs.name,jobs_offices.lcation_name,sources.source_type,demographics.race,demographics.gender,applications.current_stage_name]
  }

  measure: percent_of_total_candidate {
    label: "Percent of Total (Candidates)"
    type: percent_of_total
#     value_format_name: decimal_1
    sql: ${candidate_distinct_count} ;;
    drill_fields: [id,applications.id, applications.applied_at_date,application.status,jobs_departments.name_category,jobs.name,jobs_offices.lcation_name,sources.source_type,demographics.race,demographics.gender,applications.current_stage_name]
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
