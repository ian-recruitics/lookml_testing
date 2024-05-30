# The name of this view in Looker is "Amp Algorithm"
view: amp_algorithm {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.amp_algorithm ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Bid" in Explore.

  dimension: bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bid ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
  measure: count {
    type: count
    drill_fields: [clients.client_id, clients.client_name]
  }
}
