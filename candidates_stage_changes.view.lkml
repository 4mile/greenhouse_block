view: candidates_stage_changes {
    derived_table: {
      sql:    SELECT *
              FROM WORKSPACE_1155666."out.c-milepost-unpack-webhooks.webhooks_candidate_stage_changes"
              WHERE "company_name" = 'wrike'
               ;;
    }

    dimension: company_name {
      hidden: yes
      type: string
      sql: ${TABLE}."company_name" ;;
    }

    dimension: pk {
      primary_key: yes
      hidden: yes
      type: string
      sql: ${TABLE}."unix_timestamp" || '-' || ${TABLE}."application_id" ;;
    }

    dimension_group: unix_timestamp {
#       hidden: yes
      type: time
      timeframes: [raw,time,date,week,month,quarter,year]
      sql: DATEADD(MS, ${TABLE}."unix_timestamp", '1970-01-01');;
    }

    dimension: application_id {
      type: string
      sql: ${TABLE}."application_id" ;;
    }

    dimension: action {
      type: string
      sql: ${TABLE}."action" ;;
    }

    dimension: stage_id {
      type: string
      sql: ${TABLE}."stage_id" ;;
    }

    dimension: stage_name {
      type: string
      sql: ${TABLE}."stage_name" ;;
    }

    dimension: last_activity_at {
      type: string
      sql: ${TABLE}."last_activity_at" ;;
    }

    dimension_group: _timestamp {
      type: time
      timeframes: [raw,time,date,week,month,quarter,year]
      sql: ${TABLE}."_timestamp" ;;
    }

#     dimension_group: application_review_date {
#       type: time
#       timeframes: [raw,time,date,week,month,quarter,year]
#       sql: CASE WHEN ${stage_name} = 'Application Review' THEN ${unix_timestamp_raw}
#             ELSE NULL END;;
#     }
#
#     dimension_group: offer_review_date {
#       type: time
#       timeframes: [raw,time,date,week,month,quarter,year]
#       sql: CASE WHEN ${stage_name} = 'Offer' THEN ${unix_timestamp_raw}
#         ELSE NULL END;;
#     }


    measure: stage_count {
      type: count_distinct
      sql: ${stage_id};;
    }

    measure: application_count {
      type: count_distinct
      sql: ${application_id};;
    }

#     measure: duration_between_review_offer {
#       label: "Avg Days Between Application Review & Offer"
#       type: average
#       sql: datediff('day', ${application_review_date_raw}, ${offer_review_date_raw});;
#     }
  }