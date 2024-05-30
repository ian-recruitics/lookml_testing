# The name of this view in Looker is "Amp Static Bids Levers Reporting"
view: amp_static_bids_levers_reporting {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.amp_static_bids_levers_reporting ;;
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
    # This dimension will be called "Account" in Explore.

  dimension: account {
    type: number
    sql: ${TABLE}.account ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_account {
    type: sum
    sql: ${account} ;;  }
  measure: average_account {
    type: average
    sql: ${account} ;;  }

  dimension: amp_market {
    type: string
    sql: ${TABLE}.amp_market ;;
  }

  dimension: amp_roletype {
    type: string
    sql: ${TABLE}.amp_roletype ;;
  }

  dimension: amp_submarket {
    type: string
    sql: ${TABLE}.amp_submarket ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: market_expansion {
    type: number
    sql: ${TABLE}.market_expansion ;;
  }

  dimension: market_label {
    type: string
    sql: ${TABLE}.market_label ;;
  }

  dimension: market_priority {
    type: number
    sql: ${TABLE}.market_priority ;;
  }

  dimension: market_tag {
    type: string
    sql: ${TABLE}.market_tag ;;
  }

  dimension: market_template {
    type: string
    sql: ${TABLE}.market_template ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension: static_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.static_bid ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }
  measure: count {
    type: count
    drill_fields: [id, client_name]
  }
}
