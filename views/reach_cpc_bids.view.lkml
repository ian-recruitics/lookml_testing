# The name of this view in Looker is "Reach Cpc Bids"
view: reach_cpc_bids {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reach_cpc_bids ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Algorithm" in Explore.

  dimension: algorithm {
    type: string
    sql: ${TABLE}.algorithm ;;
  }

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
  measure: count {
    type: count
    drill_fields: [id, clients.client_id, clients.client_name]
  }
}
