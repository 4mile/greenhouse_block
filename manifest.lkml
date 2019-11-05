# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
application: demo {
  label: "Demo"
  # url: "https://localhost:8080/bundle.js"
  file: "bundle.js"
}
