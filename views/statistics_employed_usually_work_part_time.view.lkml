# The name of this view in Looker is "Statistics Employed Usually Work Part Time"
view: statistics_employed_usually_work_part_time {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.statistics_employed_usually_work_part_time ;;
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

  dimension: employed_usually_work_part_time_in_thousands {
    type: number
    sql: ${TABLE}.employed_usually_work_part_time_in_thousands ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_employed_usually_work_part_time_in_thousands {
    type: sum
    sql: ${employed_usually_work_part_time_in_thousands} ;;  }
  measure: average_employed_usually_work_part_time_in_thousands {
    type: average
    sql: ${employed_usually_work_part_time_in_thousands} ;;  }

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
