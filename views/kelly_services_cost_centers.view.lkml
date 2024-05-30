# The name of this view in Looker is "Kelly Services Cost Centers"
view: kelly_services_cost_centers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.kelly_services_cost_centers ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bu" in Explore.

  dimension: bu {
    type: string
    sql: ${TABLE}.bu ;;
  }

  dimension: cost_center {
    type: string
    sql: ${TABLE}.cost_center ;;
  }

  dimension: cost_center_number {
    type: string
    sql: ${TABLE}.cost_center_number ;;
  }

  dimension: level_2 {
    type: string
    sql: ${TABLE}.level_2 ;;
  }

  dimension: level_3 {
    type: string
    sql: ${TABLE}.level_3 ;;
  }

  dimension: level_4 {
    type: string
    sql: ${TABLE}.level_4 ;;
  }

  dimension: level_5 {
    type: string
    sql: ${TABLE}.level_5 ;;
  }

  dimension: level_6 {
    type: string
    sql: ${TABLE}.level_6 ;;
  }
  measure: count {
    type: count
  }
}
