connection: "noah_card_0328"

# include all the views
include: "/views/**/*.view"

datagroup: noah_card_0328_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: noah_card_0328_default_datagroup

explore: bm_f_card_anal_5y {
  join: dataset {
    type: inner
    sql_on: ${dataset.bm_f_card_anal_5y_use_dt_date}+(INTERVAL '1' YEAR) = ${bm_f_card_anal_5y.use_dt_date} AND
    ${dataset.bm_f_card_anal_5y_subway_route_nm} = ${bm_f_card_anal_5y.subway_route_nm} AND
    ${dataset.bm_f_card_anal_5y_station_nm} = ${bm_f_card_anal_5y.station_nm};;
    relationship: one_to_one
    }
    join: date_line_count {
      type: left_outer
      sql_on: ${date_line_count.bm_f_card_anal_5y_subway_route_nm} = ${bm_f_card_anal_5y.subway_route_nm} AND
      ${date_line_count.bm_f_card_anal_5y_use_dt_date} = ${bm_f_card_anal_5y.use_dt_date};;
      relationship: one_to_many
    }
}

explore: dataset{
  join: date_line_two {
    type: left_outer
    sql_on:  ${dataset.bm_f_card_anal_5y_use_dt_date} = ${date_line_two.date_line_count_bm_f_card_anal_5y_use_dt_date} AND
    ${dataset.bm_f_card_anal_5y_subway_route_nm} = ${date_line_two.date_line_count_bm_f_card_anal_5y_subway_route_nm};;
    relationship: one_to_many
  }
}

explore: date_line_count {}

explore: date_line_two {}
