connection: "noah_0328"

# include all the views
include: "/views/**/*.view"

datagroup: noah_0328_2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: noah_0328_2_default_datagroup

explore: card {}
