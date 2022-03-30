view: date_line_count {
  derived_table: {
    sql: SELECT
          (bm_f_card_anal_5y.use_dt ) AS bm_f_card_anal_5y_use_dt_date,
          bm_f_card_anal_5y.subway_route_nm  AS bm_f_card_anal_5y_subway_route_nm,
          sum(abs(bm_f_card_anal_5y.sunsusong_cnt))  AS bm_f_card_anal_5y_sunsusong_cnt
      FROM `SubwayBI.bm_f_card_anal_5y`
           AS bm_f_card_anal_5y
      GROUP BY
          1,
          2
      ORDER BY
          1 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: bm_f_card_anal_5y_use_dt_date {
    type: date
    datatype: date
    sql: ${TABLE}.bm_f_card_anal_5y_use_dt_date ;;
  }

  dimension: bm_f_card_anal_5y_subway_route_nm {
    type: string
    sql: ${TABLE}.bm_f_card_anal_5y_subway_route_nm ;;
  }

  dimension: bm_f_card_anal_5y_sunsusong_cnt {
    type: number
    sql: ${TABLE}.bm_f_card_anal_5y_sunsusong_cnt ;;
  }

  set: detail {
    fields: [bm_f_card_anal_5y_use_dt_date, bm_f_card_anal_5y_subway_route_nm, bm_f_card_anal_5y_sunsusong_cnt]
  }
}
