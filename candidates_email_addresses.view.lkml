view: candidates_email_addresses {
  view_label: "Candidates Email Addresses"
  sql_table_name: WORKSPACE_493757853."in.c-wrike-API-Milepost.candidates_email_addresses";;

##### Primary Key #####
  dimension: candidate_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."candidate_id" ;;
  }

##### Dimensions #####
  dimension: email_address {
    group_label: "Candidate Info"
    type: string
    sql: ${TABLE}."email_address" ;;
  }

  dimension: type {
    label: "Email Type"
    group_label: "Candidate Info"
    type: string
    sql: ${TABLE}."type" ;;
  }
}
