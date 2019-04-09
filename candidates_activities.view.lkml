view: candidates_activities {
  view_label: "Candidate Activites"
  sql_table_name: WORKSPACE_493757853."in.c-wrike-API-Milepost.candidates_activities" ;;

  dimension: id {
    label: "Candidate Activity Id"
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension_group: activity_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    sql: NULLIF(${TABLE}."created_at",'') ;;
  }

  dimension: candidate_id {
    type: string
    hidden: yes
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
            WHEN ${TABLE}."body" ilike '%marked an offer as sent%' THEN 'Offer Sent'
        ELSE 'Other' END ;;
  }

  dimension: body {
    type: string
    sql: ${TABLE}."body";;
  }

  dimension: subject {
    type: string
    sql: ${TABLE}."subject" ;;
  }

  measure: candidate_activities_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }

  measure: onsite_interviews_count {
    type: count_distinct
    sql: ${TABLE}."candidate_id" ;;
    filters: {
      field: body_category
      value: "Moved to Onsite Interview"
    }
  }

}
