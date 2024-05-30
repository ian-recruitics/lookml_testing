# The name of this view in Looker is "Campaign Performance"
view: campaign_performance {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.campaign_performance ;;
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
    # This dimension will be called "Client ID" in Explore.

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: job_count {
    type: number
    sql: ${TABLE}.job_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_job_count {
    type: sum
    sql: ${job_count} ;;  }
  measure: average_job_count {
    type: average
    sql: ${job_count} ;;  }

  dimension: recruitics_campaign {
    type: string
    sql: ${TABLE}.recruitics_campaign ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }
  measure: count {
    type: count
    drill_fields: [id, clients.client_id, clients.client_name]
  }
}
