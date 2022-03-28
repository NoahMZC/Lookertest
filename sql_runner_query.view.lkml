view: sql_runner_query {
  derived_table: {
    sql: SELECT
          retail_dataset.city  AS town,
          COUNT(*) AS count
      FROM `Looker_Training.retail_dataset`
           AS retail_dataset
      GROUP BY
          town
      ORDER BY
          count DESC
      LIMIT 8
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: town {
    type: string
    sql: ${TABLE}.town ;;
  }

  dimension: count_ {
    type: number
    sql: ${TABLE}.count ;;
  }

  set: detail {
    fields: [town, count_]
  }
}
