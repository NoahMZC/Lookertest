connection: "noah_card"

# include all the views
include: "/views/**/*.view"

datagroup: noah_card_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: noah_card_default_datagroup

explore: card_bi {}
