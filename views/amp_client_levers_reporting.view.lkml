# The name of this view in Looker is "Amp Client Levers Reporting"
view: amp_client_levers_reporting {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.amp_client_levers_reporting ;;
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

  dimension: active {
    type: number
    sql: ${TABLE}.active ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: default_cvr {
    type: number
    sql: ${TABLE}.default_cvr ;;
  }

  dimension: historic_lookback {
    type: number
    sql: ${TABLE}.historic_lookback ;;
  }

  dimension: indeed_budget {
    type: number
    sql: ${TABLE}.indeed_budget ;;
  }

  dimension: indeed_min_budget {
    type: number
    sql: ${TABLE}.indeed_min_budget ;;
  }

  dimension: priorities {
    type: string
    sql: ${TABLE}.priorities ;;
  }

  dimension: stop_conditions {
    type: string
    sql: ${TABLE}.stop_conditions ;;
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
