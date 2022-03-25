connection: "noah_0325"

# include all the views
include: "/views/**/*.view"

datagroup: noah_0325_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: noah_0325_default_datagroup

explore: grace_0325 {}
