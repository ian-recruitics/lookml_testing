# The name of this view in Looker is "Statistics Job Openings and Labor Turnover"
view: statistics_job_openings_and_labor_turnover {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.statistics_job_openings_and_labor_turnover ;;
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
    # This dimension will be called "Area" in Explore.

  dimension: area {
    type: string
    sql: ${TABLE}.area ;;
  }

  dimension: area_type {
    type: string
    sql: ${TABLE}.area_type ;;
  }

  dimension: hires_level_manufacturing {
    type: number
    sql: ${TABLE}.hires_level_manufacturing ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_hires_level_manufacturing {
    type: sum
    sql: ${hires_level_manufacturing} ;;  }
  measure: average_hires_level_manufacturing {
    type: average
    sql: ${hires_level_manufacturing} ;;  }

  dimension: hires_level_prof_business_services {
    type: number
    sql: ${TABLE}.hires_level_prof_business_services ;;
  }

  dimension: hires_level_total_nonfarm {
    type: number
    sql: ${TABLE}.hires_level_total_nonfarm ;;
  }

  dimension: hires_rate_total_nonfarm {
    type: number
    sql: ${TABLE}.hires_rate_total_nonfarm ;;
  }

  dimension: job_openings_level_total_nonfarm {
    type: number
    sql: ${TABLE}.job_openings_level_total_nonfarm ;;
  }

  dimension: job_openings_levels_construction {
    type: number
    sql: ${TABLE}.job_openings_levels_construction ;;
  }

  dimension: job_openings_levels_education_health {
    type: number
    sql: ${TABLE}.job_openings_levels_education_health ;;
  }

  dimension: job_openings_levels_financial_activities {
    type: number
    sql: ${TABLE}.job_openings_levels_financial_activities ;;
  }

  dimension: job_openings_levels_manufacturing {
    type: number
    sql: ${TABLE}.job_openings_levels_manufacturing ;;
  }

  dimension: job_openings_levels_prof_business_services {
    type: number
    sql: ${TABLE}.job_openings_levels_prof_business_services ;;
  }

  dimension: job_openings_levels_retail_trade {
    type: number
    sql: ${TABLE}.job_openings_levels_retail_trade ;;
  }

  dimension: job_openings_levels_trade_transport_utilities {
    type: number
    sql: ${TABLE}.job_openings_levels_trade_transport_utilities ;;
  }

  dimension: job_openings_rate_total_nonfarm {
    type: number
    sql: ${TABLE}.job_openings_rate_total_nonfarm ;;
  }

  dimension: layoffs_discharges_level_total_nonfarm {
    type: number
    sql: ${TABLE}.layoffs_discharges_level_total_nonfarm ;;
  }

  dimension: layoffs_discharges_rate_total_nonfarm {
    type: number
    sql: ${TABLE}.layoffs_discharges_rate_total_nonfarm ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: period_name {
    type: string
    sql: ${TABLE}.period_name ;;
  }

  dimension: quits_level_total_nonfarm {
    type: number
    sql: ${TABLE}.quits_level_total_nonfarm ;;
  }

  dimension: quits_rate_total_nonfarm {
    type: number
    sql: ${TABLE}.quits_rate_total_nonfarm ;;
  }

  dimension: total_separations_level_total_nonfarm {
    type: number
    sql: ${TABLE}.total_separations_level_total_nonfarm ;;
  }

  dimension: total_separations_rate_total_nonfarm {
    type: number
    sql: ${TABLE}.total_separations_rate_total_nonfarm ;;
  }

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }
  measure: count {
    type: count
    drill_fields: [id, period_name]
  }
}
