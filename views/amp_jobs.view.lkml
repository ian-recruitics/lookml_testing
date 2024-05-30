# The name of this view in Looker is "Amp Jobs"
view: amp_jobs {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.amp_jobs ;;
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
    # This dimension will be called "Amp Market ID" in Explore.

  dimension: amp_market_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.amp_market_id ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: estimated_job_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.estimated_job_end_date ;;
  }

  dimension_group: estimated_job_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.estimated_job_start_date ;;
  }

  dimension_group: job_expiration {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.job_expiration_date ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id, clients.client_id, clients.client_name, amp_markets.id]
  }
}
