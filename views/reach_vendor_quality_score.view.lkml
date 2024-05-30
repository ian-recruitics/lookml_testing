# The name of this view in Looker is "Reach Vendor Quality Score"
view: reach_vendor_quality_score {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reach_vendor_quality_score ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Applies" in Explore.

  dimension: applies {
    type: number
    sql: ${TABLE}.applies ;;
  }

  dimension: blacklisted {
    type: yesno
    sql: ${TABLE}.blacklisted ;;
  }

  dimension: calculated_score {
    type: number
    sql: ${TABLE}.calculated_score ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: job_views {
    type: number
    sql: ${TABLE}.job_views ;;
  }

  dimension: override_score {
    type: number
    sql: ${TABLE}.override_score ;;
  }

  dimension: percent_of_traffic {
    type: number
    sql: ${TABLE}.percent_of_traffic ;;
  }

  dimension: raw_score {
    type: number
    sql: ${TABLE}.raw_score ;;
  }

  dimension: score {
    type: number
    sql: ${TABLE}.score ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

  dimension: total_job_views {
    type: number
    sql: ${TABLE}.total_job_views ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated ;;
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }

  dimension: weighted_conversion_rate {
    type: number
    sql: ${TABLE}.weighted_conversion_rate ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_weighted_conversion_rate {
    type: sum
    sql: ${weighted_conversion_rate} ;;  }
  measure: average_weighted_conversion_rate {
    type: average
    sql: ${weighted_conversion_rate} ;;  }
  measure: count {
    type: count
    drill_fields: [clients.client_id, clients.client_name]
  }
}
