# The name of this view in Looker is "Reach Custom Vqs"
view: reach_custom_vqs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reach_custom_vqs ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cid" in Explore.

  dimension: cid {
    type: number
    value_format_name: id
    sql: ${TABLE}.cid ;;
  }

  dimension: ratio {
    type: number
    sql: ${TABLE}.ratio ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_ratio {
    type: sum
    sql: ${ratio} ;;  }
  measure: average_ratio {
    type: average
    sql: ${ratio} ;;  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }
  measure: count {
    type: count
  }
}
