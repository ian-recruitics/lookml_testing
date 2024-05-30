# The name of this view in Looker is "Classification Tool Timeslices"
view: classification_tool_timeslices {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.classification_tool_timeslices ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Classification" in Explore.

  dimension: classification {
    type: string
    sql: ${TABLE}.classification ;;
  }

  dimension: classification_granularity {
    type: string
    sql: ${TABLE}.classification_granularity ;;
  }

  dimension: cpa_benchmark {
    type: number
    sql: ${TABLE}.cpa_benchmark ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cpa_benchmark {
    type: sum
    sql: ${cpa_benchmark} ;;  }
  measure: average_cpa_benchmark {
    type: average
    sql: ${cpa_benchmark} ;;  }

  dimension: cpc_benchmark {
    type: number
    sql: ${TABLE}.cpc_benchmark ;;
  }

  dimension: cr_benchmark {
    type: number
    sql: ${TABLE}.cr_benchmark ;;
  }

  dimension: date_segmentation {
    type: string
    sql: ${TABLE}.date_segmentation ;;
  }

  dimension: good_cpa_range {
    type: string
    sql: ${TABLE}."good cpa range" ;;
  }

  dimension: indeed_cpa_benchmark {
    type: number
    sql: ${TABLE}.indeed_cpa_benchmark ;;
  }

  dimension: indeed_cpa_range {
    type: string
    sql: ${TABLE}."indeed cpa range" ;;
  }

  dimension: indeed_cpc_benchmark {
    type: number
    sql: ${TABLE}.indeed_cpc_benchmark ;;
  }

  dimension: indeed_cr_benchmark {
    type: string
    sql: ${TABLE}.indeed_cr_benchmark ;;
  }

  dimension: indeed_cr_range {
    type: string
    sql: ${TABLE}."indeed cr range" ;;
  }

  dimension: jobcase_cpa_benchmark {
    type: number
    sql: ${TABLE}.jobcase_cpa_benchmark ;;
  }

  dimension: jobcase_cpa_range {
    type: string
    sql: ${TABLE}."jobcase cpa range" ;;
  }

  dimension: jobcase_cpc_benchmark {
    type: number
    sql: ${TABLE}.jobcase_cpc_benchmark ;;
  }

  dimension: jobcase_cr_benchmark {
    type: string
    sql: ${TABLE}.jobcase_cr_benchmark ;;
  }

  dimension: jobcase_cr_range {
    type: string
    sql: ${TABLE}."jobcase cr range" ;;
  }

  dimension: jobs2careers_cpa_benchmark {
    type: number
    sql: ${TABLE}.jobs2careers_cpa_benchmark ;;
  }

  dimension: jobs2careers_cpa_range {
    type: string
    sql: ${TABLE}."jobs2careers cpa range" ;;
  }

  dimension: jobs2careers_cpc_benchmark {
    type: number
    sql: ${TABLE}.jobs2careers_cpc_benchmark ;;
  }

  dimension: jobs2careers_cr_benchmark {
    type: string
    sql: ${TABLE}.jobs2careers_cr_benchmark ;;
  }

  dimension: jobs2careers_cr_range {
    type: string
    sql: ${TABLE}."jobs2careers cr range" ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: location_granularity {
    type: string
    sql: ${TABLE}.location_granularity ;;
  }

  dimension: poor_cpa_range {
    type: string
    sql: ${TABLE}."poor cpa range" ;;
  }

  dimension: reach_cpa_benchmark {
    type: number
    sql: ${TABLE}.reach_cpa_benchmark ;;
  }

  dimension: reach_cpa_range {
    type: string
    sql: ${TABLE}."reach cpa range" ;;
  }

  dimension: reach_cpc_benchmark {
    type: number
    sql: ${TABLE}.reach_cpc_benchmark ;;
  }

  dimension: reach_cr_benchmark {
    type: string
    sql: ${TABLE}.reach_cr_benchmark ;;
  }

  dimension: reach_cr_range {
    type: string
    sql: ${TABLE}."reach cr range" ;;
  }

  dimension: snagajob_cpa_benchmark {
    type: number
    sql: ${TABLE}.snagajob_cpa_benchmark ;;
  }

  dimension: snagajob_cpa_range {
    type: string
    sql: ${TABLE}."snagajob cpa range" ;;
  }

  dimension: snagajob_cpc_benchmark {
    type: number
    sql: ${TABLE}.snagajob_cpc_benchmark ;;
  }

  dimension: snagajob_cr_benchmark {
    type: string
    sql: ${TABLE}.snagajob_cr_benchmark ;;
  }

  dimension: snagajob_cr_range {
    type: string
    sql: ${TABLE}."snagajob cr range" ;;
  }

  dimension: timeframe {
    type: string
    sql: ${TABLE}.timeframe ;;
  }

  dimension: typical_cpa_range {
    type: string
    sql: ${TABLE}."typical cpa range" ;;
  }

  dimension: ziprecruiter_cpa_benchmark {
    type: number
    sql: ${TABLE}.ziprecruiter_cpa_benchmark ;;
  }

  dimension: ziprecruiter_cpa_range {
    type: string
    sql: ${TABLE}."ziprecruiter cpa range" ;;
  }

  dimension: ziprecruiter_cpc_benchmark {
    type: number
    sql: ${TABLE}.ziprecruiter_cpc_benchmark ;;
  }

  dimension: ziprecruiter_cr_benchmark {
    type: string
    sql: ${TABLE}.ziprecruiter_cr_benchmark ;;
  }

  dimension: ziprecruiter_cr_range {
    type: string
    sql: ${TABLE}."ziprecruiter cr range" ;;
  }
  measure: count {
    type: count
  }
}
