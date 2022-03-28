view: bm_f_unsturct__5y {
  sql_table_name: `SubwayBI.bm_f_unsturct__5y`
    ;;

  dimension_group: dd {
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
    sql: ${TABLE}.dd ;;
  }

  dimension: get_cnt {
    type: number
    sql: ${TABLE}.get_CNT ;;
  }

  dimension: getoff_cnt {
    type: number
    sql: ${TABLE}.getoff_CNT ;;
  }

  dimension: hh_gb {
    type: string
    sql: ${TABLE}.hh_GB ;;
  }

  dimension: moving_passenger____ {
    type: number
    sql: ${TABLE}.moving_passenger____ ;;
  }

  dimension: passenger_gb {
    type: string
    sql: ${TABLE}.passenger_GB ;;
  }

  dimension: subway_n_ {
    type: string
    sql: ${TABLE}.subway_n_ ;;
  }

  dimension: subway_no {
    type: number
    sql: ${TABLE}.subway_no ;;
  }

  dimension: sunsusong_cnt {
    type: number
    sql: abs(${TABLE}.sunsusong_cnt) ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
