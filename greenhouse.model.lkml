connection: "keboola_greenhouse_sf"

# include all the views
include: "*.view"

datagroup: greenhouse_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: greenhouse_default_datagroup

explore: applications {
  label: "Applications"

  join: demographics {
    type: left_outer
    sql_on: ${applications.id} = ${demographics.application_id} ;;
    relationship: one_to_one
  }

  join:  candidates_stage_changes {
    type:left_outer
    sql_on: ${applications.id} = ${candidates_stage_changes.application_id};;
    relationship: one_to_many
  }

  join:  application_stages {
    type:left_outer
    sql_on: ${applications.id} = ${application_stages.application_id};;
    relationship: one_to_one
  }

  join:  candidates {
    type:left_outer
    sql_on: ${applications.candidate_id} = ${candidates.id};;
    relationship: many_to_one
  }

  join:  candidates_email_addresses {
    view_label: "Candidates"
    type:left_outer
    sql_on: ${candidates.id} = ${candidates_email_addresses.candidate_id};;
    relationship: one_to_one
  }

  join:  candidate_zipcodes {
    type:left_outer
    sql_on: ${candidates.id} = ${candidate_zipcodes.candidate_id};;
    relationship: one_to_one
  }

  join:  applications_jobs {
    type:left_outer
    sql_on: ${applications.id} = ${applications_jobs.application_id};;
    relationship: one_to_one
  }

  join:  jobs {
    type:left_outer
    sql_on: ${applications_jobs.job_id} = ${jobs.id};;
    relationship: many_to_one
  }

  join:  jobs_openings {
    type:left_outer
    sql_on: ${jobs.id} = ${jobs_openings.parent_job_id} ;;
    relationship: one_to_many
  }

  join:  jobs_offices {
    type:left_outer
    sql_on: ${jobs.id} = ${jobs_offices.job_id};;
    relationship: one_to_one
  }

  join:  jobs_departments {
    type:left_outer
    sql_on: ${jobs.id} = ${jobs_departments.job_id};;
    relationship: one_to_one
  }

  join:  offers {
    type:left_outer
    sql_on: ${applications.id} = ${offers.application_id}
        AND ${jobs.id} = ${offers.job_id};;
    relationship: one_to_one
  }

  join:  sources {
    type:left_outer
    sql_on: ${applications.source_id} = ${sources.id};;
    relationship: many_to_one
  }

  join: scheduled_interviews {
    type:left_outer
    sql_on: ${applications.id} = ${scheduled_interviews.application_id};;
    relationship: many_to_one
  }
}
