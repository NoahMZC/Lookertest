connection: "noah_0328_bi"

# include all the views
include: "/views/**/*.view"

datagroup: subway_bi_noah_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: subway_bi_noah_default_datagroup

explore: calender {}

explore: bm_f_unsturct__5y {}

explore: transfer {}

explore: bm_f_card_anal_5y {}
