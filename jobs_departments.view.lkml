view: jobs_departments {
  view_label: "Job Departments"
  sql_table_name: WORKSPACE_1155666."in.c-wrike-API-Milepost.jobs_departments" ;;

  dimension: id {
    label: "Department Id"
    type: string
    sql: ${TABLE}."id" ;;
  }

  dimension: job_id {
    primary_key: yes
    hidden: yes
    type: string
    sql: ${TABLE}."job_id" ;;
  }

  dimension: name {
    label: "Department Name"
    type: string
    sql: ${TABLE}."name" ;;
  }

  dimension: name_category {
    label: "Department Category"
    type: string
    sql: CASE
          WHEN LEFT(${name},LENGTH(${name})-(LENGTH(${name})-(CHARINDEX(',', ${name})-1))) = '' THEN ${name}
            ELSE LEFT(${name},LENGTH(${name})-(LENGTH(${name})-(CHARINDEX(',', ${name})-1))) END;;
  }

  dimension: parent_id {
    hidden: yes
    type: string
    sql: ${TABLE}."parent_id" ;;
  }

  measure: department_count {
    type: count_distinct
    sql: ${TABLE}."id" ;;
  }
}