# The name of this view in Looker is "Statistics Unemployment National Level"
view: statistics_unemployment_national_level {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.statistics_unemployment_national_level ;;
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

  dimension: average_employment {
    type: number
    sql: ${TABLE}.average_employment ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_average_employment {
    type: sum
    sql: ${average_employment} ;;  }
  measure: average_average_employment {
    type: average
    sql: ${average_employment} ;;  }

  dimension: average_employment_population_ratio {
    type: number
    sql: ${TABLE}.average_employment_population_ratio ;;
  }

  dimension: average_labor_force {
    type: number
    sql: ${TABLE}.average_labor_force ;;
  }

  dimension: average_labor_force_participation_rate {
    type: number
    sql: ${TABLE}.average_labor_force_participation_rate ;;
  }

  dimension: average_unemployment {
    type: number
    sql: ${TABLE}.average_unemployment ;;
  }

  dimension: average_unemployment_rate {
    type: number
    sql: ${TABLE}.average_unemployment_rate ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.period ;;
  }

  dimension: period_name {
    type: string
    sql: ${TABLE}.period_name ;;
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
