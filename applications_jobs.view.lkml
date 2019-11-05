view: applications_jobs {
  view_label: "Application Jobs"
  sql_table_name: WORKSPACE_493757853."in.c-wrike-API-Milepost.applications_jobs";;

##### Primary Key #####
  dimension: application_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."application_id" ;;
  }

##### Dimensions #####
  dimension: job_id {
    hidden: yes
    type: string
    sql: ${TABLE}."job_id" ;;
  }

  dimension: job_name {
    type: string
    sql: ${TABLE}."job_name" ;;
  }
}
