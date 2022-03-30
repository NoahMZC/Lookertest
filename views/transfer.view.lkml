view: transfer {
  sql_table_name: `SubwayBI.Transfer`
    ;;

  dimension: line_count {
    type: number
    sql: ${TABLE}.Line_count ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.Name ;;
  }

  dimension: transfer {
    type: string
    sql: ${TABLE}.Transfer ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
