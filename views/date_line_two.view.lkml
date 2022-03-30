view: date_line_two {
  derived_table: {
    sql: WITH date_line_count AS (SELECT
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
       )
SELECT
    (date_line_count.bm_f_card_anal_5y_use_dt_date ) AS date_line_count_bm_f_card_anal_5y_use_dt_date,
    date_line_count.bm_f_card_anal_5y_sunsusong_cnt  AS date_line_count_bm_f_card_anal_5y_sunsusong_cnt,
    date_line_count.bm_f_card_anal_5y_subway_route_nm  AS date_line_count_bm_f_card_anal_5y_subway_route_nm
FROM `SubwayBI.bm_f_card_anal_5y`
     AS bm_f_card_anal_5y
LEFT JOIN date_line_count ON date_line_count.bm_f_card_anal_5y_subway_route_nm = bm_f_card_anal_5y.subway_route_nm AND
      date_line_count.bm_f_card_anal_5y_use_dt_date = bm_f_card_anal_5y.use_dt
WHERE ((( date_line_count.bm_f_card_anal_5y_use_dt_date  ) >= (DATE('2021-01-01')) AND ( date_line_count.bm_f_card_anal_5y_use_dt_date  ) < (DATE('2021-12-31'))))
GROUP BY
    1,
    2,
    3
ORDER BY
    1
 ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: date_line_count_bm_f_card_anal_5y_use_dt_date {
    type: date
    datatype: date
    sql: ${TABLE}.date_line_count_bm_f_card_anal_5y_use_dt_date ;;
  }

  dimension: date_line_count_bm_f_card_anal_5y_sunsusong_cnt {
    type: number
    sql: ${TABLE}.date_line_count_bm_f_card_anal_5y_sunsusong_cnt ;;
  }

  dimension: date_line_count_bm_f_card_anal_5y_subway_route_nm {
    type: string
    sql: ${TABLE}.date_line_count_bm_f_card_anal_5y_subway_route_nm ;;
  }

  set: detail {
    fields: [date_line_count_bm_f_card_anal_5y_use_dt_date, date_line_count_bm_f_card_anal_5y_sunsusong_cnt, date_line_count_bm_f_card_anal_5y_subway_route_nm]
  }
}
