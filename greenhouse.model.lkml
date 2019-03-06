connection: "keboola_greenhouse_sf"

# include all the views
include: "*.view"

datagroup: greenhouse_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: greenhouse_default_datagroup

explore: in_cgatherapi_applications {
  label: "Applications"

  join:  in_cgatherapi_candidates {
    type:left_outer
    sql_on: ${in_cgatherapi_applications.candidate_id} = ${in_cgatherapi_candidates.id};;
    relationship: many_to_one
  }

  join:  in_cgatherapi_candidates_email_addresses {
    type:left_outer
    sql_on: ${in_cgatherapi_candidates.id} = ${in_cgatherapi_candidates_email_addresses.candidates_pkey};;
    relationship: one_to_one
  }

  join:  in_cgatherapi_candidates_activities {
    type:left_outer
    sql_on: ${in_cgatherapi_applications.candidate_id} = ${in_cgatherapi_candidates_activities.candidate_id};;
    relationship: many_to_many
  }

# is this data useful or just used to join jobs...
  join:  in_cgatherapi_applications_jobs {
    type:left_outer
    sql_on: ${in_cgatherapi_applications.id} = ${in_cgatherapi_applications_jobs.applications_pkey};;
    relationship: one_to_one
  }

  join:  in_cgatherapi_jobs {
    type:left_outer
    sql_on: ${in_cgatherapi_applications_jobs.job_id} = ${in_cgatherapi_jobs.id};;
    relationship: many_to_one
  }

  join:  in_cgatherapi_jobs_offices {
    type:left_outer
    sql_on: ${in_cgatherapi_jobs.id} = ${in_cgatherapi_jobs_offices.jobs_pkey};;
    relationship: one_to_one
  }

  join:  in_cgatherapi_jobs_departments {
    type:left_outer
    sql_on: ${in_cgatherapi_jobs.id} = ${in_cgatherapi_jobs_departments.jobs_pkey};;
    relationship: one_to_one
  }

  join:  in_cgatherapi_offers {
    type:left_outer
    sql_on: ${in_cgatherapi_applications.id} = ${in_cgatherapi_offers.application_id};;
    relationship: one_to_many
  }

#   applications."source_id" = sources."id"
  join:  in_cgatherapi_sources {
    type:left_outer
    sql_on: ${in_cgatherapi_applications.source_id} = ${in_cgatherapi_sources.id};;
    relationship: many_to_one
  }
}

explore: candidate_detail {}

# explore: in_cgatherapi_applications {}

# explore: in_cgatherapi_applications_jobs {}

# explore: in_cgatherapi_candidates {}

# explore: in_cgatherapi_candidates_activities {}

# explore: in_cgatherapi_candidates_email_addresses {}
#
# explore: in_cgatherapi_jobs {}
#
# explore: in_cgatherapi_jobs_departments {}
#
# explore: in_cgatherapi_jobs_offices {}
#
# explore: in_cgatherapi_offers {}
#
# explore: in_cgatherapi_sources {}
