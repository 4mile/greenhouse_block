connection: "keboola_greenhouse_sf"

# include all the views
include: "*.view"

datagroup: greenhouse_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: greenhouse_default_datagroup

explore: in_cgatherapi_applications {}

explore: in_cgatherapi_applications_jobs {}

explore: in_cgatherapi_candidates {}

explore: in_cgatherapi_candidates_activities {}

explore: in_cgatherapi_candidates_email_addresses {}

explore: in_cgatherapi_jobs {}

explore: in_cgatherapi_jobs_departments {}

explore: in_cgatherapi_jobs_offices {}

explore: in_cgatherapi_offers {}

explore: in_cgatherapi_sources {}
