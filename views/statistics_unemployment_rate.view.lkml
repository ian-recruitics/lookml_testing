# The name of this view in Looker is "Statistics Unemployment Rate"
view: statistics_unemployment_rate {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.statistics_unemployment_rate ;;
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

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: period_name {
    type: string
    sql: ${TABLE}.period_name ;;
  }

  dimension: rate_16_to_19_years {
    type: number
    sql: ${TABLE}.rate_16_to_19_years ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_rate_16_to_19_years {
    type: sum
    sql: ${rate_16_to_19_years} ;;  }
  measure: average_rate_16_to_19_years {
    type: average
    sql: ${rate_16_to_19_years} ;;  }

  dimension: rate_20_years_and_over_men {
    type: number
    sql: ${TABLE}.rate_20_years_and_over_men ;;
  }

  dimension: rate_20_years_and_over_women {
    type: number
    sql: ${TABLE}.rate_20_years_and_over_women ;;
  }

  dimension: rate_25_years_and_over_bachelor_degree_and_higher {
    type: number
    sql: ${TABLE}.rate_25_years_and_over_bachelor_degree_and_higher ;;
  }

  dimension: rate_25_years_and_over_hs_graduate_no_college {
    type: number
    sql: ${TABLE}.rate_25_years_and_over_hs_graduate_no_college ;;
  }

  dimension: rate_25_years_and_over_less_than_hs_diploma {
    type: number
    sql: ${TABLE}.rate_25_years_and_over_less_than_hs_diploma ;;
  }

  dimension: rate_25_years_and_over_some_college_or_associate_degree {
    type: number
    sql: ${TABLE}.rate_25_years_and_over_some_college_or_associate_degree ;;
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
