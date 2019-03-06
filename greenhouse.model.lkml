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

  join:  candidates {
    type:left_outer
    sql_on: ${applications.candidate_id} = ${candidates.id};;
    relationship: many_to_one
  }

  join:  candidates_email_addresses {
    type:left_outer
    sql_on: ${candidates.id} = ${candidates_email_addresses.candidates_pkey};;
    relationship: one_to_one
  }

  join:  candidates_activities {
    type:left_outer
    sql_on: ${applications.candidate_id} = ${candidates_activities.candidate_id};;
    relationship: many_to_many
  }

# is this data useful or just used to join jobs...
  join:  applications_jobs {
    type:left_outer
    sql_on: ${applications.id} = ${applications_jobs.applications_pkey};;
    relationship: one_to_one
  }

  join:  jobs {
    type:left_outer
    sql_on: ${applications_jobs.job_id} = ${jobs.id};;
    relationship: many_to_one
  }

  join:  jobs_offices {
    type:left_outer
    sql_on: ${jobs.id} = ${jobs_offices.jobs_pkey};;
    relationship: one_to_one
  }

  join:  jobs_departments {
    type:left_outer
    sql_on: ${jobs.id} = ${jobs_departments.jobs_pkey};;
    relationship: one_to_one
  }

  join:  offers {
    type:left_outer
    sql_on: ${applications.id} = ${offers.application_id};;
    relationship: one_to_many
  }

#   applications."source_id" = sources."id"
  join:  sources {
    type:left_outer
    sql_on: ${applications.source_id} = ${sources.id};;
    relationship: many_to_one
  }
}

explore: candidate_detail {}

# explore: applications {}

# explore: applications_jobs {}

# explore: candidates {}

# explore: candidates_activities {}

# explore: candidates_email_addresses {}
#
# explore: jobs {}
#
# explore: jobs_departments {}
#
# explore: jobs_offices {}
#
# explore: offers {}
#
# explore: sources {}
