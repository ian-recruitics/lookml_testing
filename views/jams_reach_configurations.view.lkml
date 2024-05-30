# The name of this view in Looker is "Jams Reach Configurations"
view: jams_reach_configurations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.jams_reach_configurations ;;
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

  dimension: client_type {
    type: string
    sql: ${TABLE}.client_type ;;
  }

  dimension: cpa_goal {
    type: number
    sql: ${TABLE}.cpa_goal ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cpa_goal {
    type: sum
    sql: ${cpa_goal} ;;  }
  measure: average_cpa_goal {
    type: average
    sql: ${cpa_goal} ;;  }

  dimension: display_name {
    type: string
    sql: ${TABLE}.display_name ;;
  }

  dimension: job_volume_limit {
    type: number
    sql: ${TABLE}.job_volume_limit ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_updated_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_updated_timestamp ;;
  }

  dimension: max_cpc {
    type: number
    sql: ${TABLE}.max_cpc ;;
  }

  dimension: pace_to_date {
    type: number
    sql: ${TABLE}.pace_to_date ;;
  }

  dimension: service {
    type: string
    sql: ${TABLE}.service ;;
  }
  measure: count {
    type: count
    drill_fields: [id, display_name, clients.client_id, clients.client_name]
  }
}
