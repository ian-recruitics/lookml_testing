# The name of this view in Looker is "Amp Client Source Levers Reporting"
view: amp_client_source_levers_reporting {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.amp_client_source_levers_reporting ;;
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

  dimension: bid_multiplier {
    type: number
    sql: ${TABLE}.bid_multiplier ;;
  }

  dimension: budget_cutoff {
    type: number
    sql: ${TABLE}.budget_cutoff ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: default_cvr {
    type: number
    sql: ${TABLE}.default_cvr ;;
  }

  dimension: jvlimit_cutoff {
    type: number
    sql: ${TABLE}.jvlimit_cutoff ;;
  }

  dimension: maxbid {
    type: number
    value_format_name: id
    sql: ${TABLE}.maxbid ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: minbid {
    type: number
    value_format_name: id
    sql: ${TABLE}.minbid ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: use_expansion_jobs {
    type: string
    sql: ${TABLE}.use_expansion_jobs ;;
  }

  dimension: vendor_markdown {
    type: number
    sql: ${TABLE}.vendor_markdown ;;
  }
  measure: count {
    type: count
    drill_fields: [id, client_name]
  }
}
