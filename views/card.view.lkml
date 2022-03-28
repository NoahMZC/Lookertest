view: card {
  sql_table_name: `Grace_0325.CARD`
    ;;

  dimension_group: date {
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
    sql: ${TABLE}.Date ;;
  }

  dimension: in {
    type: number
    sql: ${TABLE}.`IN` ;;
  }

  dimension: line {
    type: string
    sql: ${TABLE}.Line ;;
  }

  dimension: out {
    type: number
    sql: ${TABLE}.Out ;;
  }

  dimension: SUMCOUNT {
    type: number
    sql: ${TABLE}.Out + ${TABLE}.`IN` ;;
  }

  dimension: station {
    type: string
    sql: ${TABLE}.Station ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
