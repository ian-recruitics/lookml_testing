# The name of this view in Looker is "Reach Vendor Feeds List"
view: reach_vendor_feeds_list {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reach_vendor_feeds_list ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Attributed Source" in Explore.

  dimension: attributed_source {
    type: string
    sql: ${TABLE}.attributed_source ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }
  measure: count {
    type: count
  }
}
