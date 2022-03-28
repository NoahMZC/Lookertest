view: line_total {
  derived_table: {
    sql: SELECT
          card_bi.Line  AS card_bi_line,
          sum(card_bi.Sub)  AS card_bi_sub_total,
          (card_bi.Date ) AS card_bi_date_date
      FROM `SubwayBI.CARD_BI`
           AS card_bi
      GROUP BY
          1,
          3
      ORDER BY
          3 DESC
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: card_bi_line {
    type: string
    sql: ${TABLE}.card_bi_line ;;
  }

  dimension: card_bi_sub_total {
    type: number
    sql: ${TABLE}.card_bi_sub_total ;;
  }

  dimension: card_bi_date_date {
    type: date
    datatype: date
    sql: ${TABLE}.card_bi_date_date ;;
  }

  set: detail {
    fields: [card_bi_line, card_bi_sub_total, card_bi_date_date]
  }
}
