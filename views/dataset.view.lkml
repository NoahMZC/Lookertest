view: dataset {
  derived_table: {
    sql: SELECT
          sum(abs(bm_f_card_anal_5y.sunsusong_cnt))  AS bm_f_card_anal_5y_sunsusong_cnt,
          bm_f_card_anal_5y.subway_route_nm  AS bm_f_card_anal_5y_subway_route_nm,
          bm_f_card_anal_5y.station_nm  AS bm_f_card_anal_5y_station_nm,
          sum(bm_f_card_anal_5y.moving_passenger_cnt)  AS bm_f_card_anal_5y_moving_passenger_cnt,
          sum(bm_f_card_anal_5y.get_off)  AS bm_f_card_anal_5y_get_off,
          sum(bm_f_card_anal_5y.get_cnt)  AS bm_f_card_anal_5y_get_cnt,
          (bm_f_card_anal_5y.use_dt ) AS bm_f_card_anal_5y_use_dt_date
      FROM `SubwayBI.bm_f_card_anal_5y`
           AS bm_f_card_anal_5y
      WHERE ((( bm_f_card_anal_5y.use_dt  ) >= (DATE('2021-01-01')) AND ( bm_f_card_anal_5y.use_dt  ) < (DATE('2021-12-31'))))
      GROUP BY
          2,
          3,
          7
      ORDER BY
          7 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bm_f_card_anal_5y_sunsusong_cnt {
    type: number
    sql: ${TABLE}.bm_f_card_anal_5y_sunsusong_cnt ;;
  }

  dimension: bm_f_card_anal_5y_subway_route_nm {
    type: string
    sql: ${TABLE}.bm_f_card_anal_5y_subway_route_nm ;;
  }

  dimension: bm_f_card_anal_5y_station_nm {
    type: string
    sql: ${TABLE}.bm_f_card_anal_5y_station_nm ;;
  }

  dimension: bm_f_card_anal_5y_moving_passenger_cnt {
    type: number
    sql: ${TABLE}.bm_f_card_anal_5y_moving_passenger_cnt ;;
  }

  dimension: bm_f_card_anal_5y_get_off {
    type: number
    sql: ${TABLE}.bm_f_card_anal_5y_get_off ;;
  }

  dimension: bm_f_card_anal_5y_get_cnt {
    type: number
    sql: ${TABLE}.bm_f_card_anal_5y_get_cnt ;;
  }

  dimension: bm_f_card_anal_5y_use_dt_date {
    type: date
    datatype: date
    sql: ${TABLE}.bm_f_card_anal_5y_use_dt_date ;;
  }

  set: detail {
    fields: [
      bm_f_card_anal_5y_sunsusong_cnt,
      bm_f_card_anal_5y_subway_route_nm,
      bm_f_card_anal_5y_station_nm,
      bm_f_card_anal_5y_moving_passenger_cnt,
      bm_f_card_anal_5y_get_off,
      bm_f_card_anal_5y_get_cnt,
      bm_f_card_anal_5y_use_dt_date
    ]
  }
}
