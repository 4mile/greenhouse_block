view: candidates_activities {
  view_label: "Candidate Activites"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API-Milepost.candidates_activities" ;;

##### Primary Key #####
  dimension: id {
    label: "Candidate Activity Id"
    primary_key: yes
    type: string
    sql: ${TABLE}."id" ;;
  }

##### Dimension Groups #####
  dimension_group: activity_date {
    type: time
    timeframes: [raw
                ,date
                ,week
                ,month
                ,quarter
                ,year]
    sql: NULLIF(${TABLE}."created_at",'') ;;
  }

##### Dimensions #####
  dimension: candidate_id {
    type: string
    hidden: yes
    sql: ${TABLE}."candidate_id" ;;
  }

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

##### Measures #####
  measure: candidate_activities_count {
    type: count_distinct
    sql: ${id} ;;
  }

  measure: onsite_interviews_count {
    type: count_distinct
    sql: ${candidate_id} ;;

    filters: {
      field: body_category
      value: "Moved to Onsite Interview"
    }
  }

}