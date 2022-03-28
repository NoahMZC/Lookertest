view: noah_test1_reservation {
  sql_table_name: `noah_test_reservation.noah_test1_reservation`
    ;;

  dimension: brand {
    type: string
    sql: ${TABLE}.brand ;;
  }

  dimension: category_1 {
    type: string
    sql: ${TABLE}.category_1 ;;
  }

  dimension: category_2 {
    type: string
    sql: ${TABLE}.category_2 ;;
  }

  dimension: category_3 {
    type: string
    sql: ${TABLE}.category_3 ;;
  }

  dimension: category_id {
    type: number
    sql: ${TABLE}.category_id ;;
  }

  dimension: category_name {
    type: string
    sql: ${TABLE}.category_name ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: price {
    type: number
    sql: ${TABLE}.price ;;
  }

  dimension: product_id {
    type: number
    sql: ${TABLE}.product_id ;;
  }

  dimension: session {
    type: string
    sql: ${TABLE}.session ;;
  }

  dimension_group: time {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.time ;;
  }

  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }

  measure: count {
    type: count
    drill_fields: [category_name, event_name]
  }
}
