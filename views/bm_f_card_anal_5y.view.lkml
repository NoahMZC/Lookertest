view: bm_f_card_anal_5y {
  sql_table_name: `SubwayBI.bm_f_card_anal_5y`
    ;;

  dimension: get_cnt {
    type: number
    sql: ${TABLE}.get_cnt ;;
  }

  dimension: get_off {
    type: number
    sql: ${TABLE}.get_off ;;
  }

  dimension: moving_passenger_cnt {
    type: number
    sql: ${TABLE}.moving_passenger_cnt ;;
  }

  dimension: station_nm {
    type: string
    sql: ${TABLE}.station_nm ;;
  }

  dimension: subway_route_nm {
    type: string
    sql: ${TABLE}.subway_route_nm ;;
  }

  dimension: sunsusong_cnt {
    type: number
    sql: abs(${TABLE}.sunsusong_cnt) ;;
  }

  dimension_group: use_dt {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.use_dt ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
