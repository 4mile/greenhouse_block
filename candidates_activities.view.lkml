view: candidates_activities {
  view_label: "Candidate Activites"
  sql_table_name: WORKSPACE_1155666."in.c-gather-API.candidates_activities" ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension_group: activity_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: ${TABLE}."created_at" ;;
  }

  dimension: candidate_id {
    type: string
    sql: ${TABLE}."candidate_id" ;;
  }

#   dimension_group: _timestamp {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}."_timestamp" ;;
#   }

  dimension: body_category {
    type: string
    sql: CASE
            WHEN ${TABLE}."body" ilike '%submitted a take home test%' THEN 'Submitted Assessment'
            WHEN ${TABLE}."body" ilike '%Offer document % was signed by%' THEN 'Offer Signed'
            WHEN ${TABLE}."body" ilike '%marked an offer to % as accepted%' THEN 'Offer Accepted'
            WHEN ${TABLE}."body" ilike '%was moved into Assessment%' THEN 'Moved to Assessment'
            WHEN ${TABLE}."body" ilike '%was moved into Onsite Interview%' THEN 'Moved to Onsite Interview'
        ELSE NULL END ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}."body";;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."subject" ;;
  }

  measure: count_candidate {
    label: "Count of Candidates"
    type: count_distinct
    sql: ${TABLE}."candidate_id" ;;
#     drill_fields: [id]
  }

  measure: count_candidate_activities {
    label: "Count of Candidate Activites"
    type: count_distinct
    sql: ${TABLE}."id" ;;
#     drill_fields: [id]
  }
}
