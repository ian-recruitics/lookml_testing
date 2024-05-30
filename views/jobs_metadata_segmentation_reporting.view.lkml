# The name of this view in Looker is "Jobs Metadata Segmentation Reporting"
view: jobs_metadata_segmentation_reporting {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.jobs_metadata_segmentation_reporting ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Active Jobs" in Explore.

  dimension: active_jobs {
    type: number
    sql: ${TABLE}.active_jobs ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_active_jobs {
    type: sum
    sql: ${active_jobs} ;;  }
  measure: average_active_jobs {
    type: average
    sql: ${active_jobs} ;;  }

  dimension: classification {
    type: string
    sql: ${TABLE}.classification ;;
  }

  dimension: classification_granularity {
    type: string
    sql: ${TABLE}.classification_granularity ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: location_granularity {
    type: string
    sql: ${TABLE}.location_granularity ;;
  }

  dimension: lookback_jobs {
    type: number
    sql: ${TABLE}.lookback_jobs ;;
  }
  measure: count {
    type: count
  }
}
