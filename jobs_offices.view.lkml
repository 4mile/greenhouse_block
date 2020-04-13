view: jobs_offices {
  view_label: "Job Offices"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API-Milepost.jobs_offices";;

  dimension: job_id {
    type: string
    primary_key: yes
    hidden: yes
    sql: ${TABLE}."job_id" ;;
  }

  dimension: id {
    label: "Office Id"
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: name {
    label: "Office City"
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: location_name {
    label: "Office City, State, Country"
    type: string
    sql: ${TABLE}."location_name" ;;
  }

  dimension: primary_contact_user_id {
    hidden: yes
    type: string
    sql: ${TABLE}."primary_contact_user_id" ;;
  }

  dimension: parent_id {
    hidden: yes
    type: string
    sql: ${TABLE}."parent_id" ;;
  }

  dimension: external_id {
    hidden: yes
    type: string
    sql: ${TABLE}."external_id" ;;
  }

  measure: office_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;
    drill_fields: [id, name]
  }
}