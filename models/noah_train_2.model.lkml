connection: "noah_220321_test2"

# include all the views
include: "/views/**/*.view"

datagroup: noah_train_2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: noah_train_2_default_datagroup


explore: test2 {}
