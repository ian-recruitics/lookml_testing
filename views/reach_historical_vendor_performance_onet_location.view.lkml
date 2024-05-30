# The name of this view in Looker is "Reach Historical Vendor Performance Onet Location"
view: reach_historical_vendor_performance_onet_location {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reach_historical_vendor_performance_onet_location ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Cbsa" in Explore.

  dimension: cbsa {
    type: string
    sql: ${TABLE}.cbsa ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: client_gross_spend {
    type: number
    sql: ${TABLE}.client_gross_spend ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_client_gross_spend {
    type: sum
    sql: ${client_gross_spend} ;;  }
  measure: average_client_gross_spend {
    type: average
    sql: ${client_gross_spend} ;;  }

  dimension: count_apply {
    type: number
    sql: ${TABLE}.count_apply ;;
  }

  dimension: count_distinct_jobs_with_paid_views {
    type: number
    sql: ${TABLE}.count_distinct_jobs_with_paid_views ;;
  }

  dimension: count_jobview {
    type: number
    sql: ${TABLE}.count_jobview ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: month {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.month ;;
  }

  dimension: onet_code {
    type: string
    sql: ${TABLE}.onet_code ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }
  measure: count {
    type: count
  }
}
