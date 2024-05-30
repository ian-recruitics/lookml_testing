# The name of this view in Looker is "Reach Feed Generation Results"
view: reach_feed_generation_results {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reach_feed_generation_results ;;
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
    # This dimension will be called "Ad Group ID" in Explore.

  dimension: ad_group_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bid ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_budget {
    type: sum
    sql: ${budget} ;;  }
  measure: average_budget {
    type: average
    sql: ${budget} ;;  }

  dimension: campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: cpa_goal {
    type: number
    sql: ${TABLE}.cpa_goal ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: default_bid_type {
    type: string
    sql: ${TABLE}.default_bid_type ;;
  }

  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }

  dimension: final_bid_source {
    type: string
    sql: ${TABLE}.final_bid_source ;;
  }

  dimension: initial_bid_source {
    type: string
    sql: ${TABLE}.initial_bid_source ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: qualified {
    type: yesno
    sql: ${TABLE}.qualified ;;
  }

  dimension: qualified_for_limited_feed {
    type: yesno
    sql: ${TABLE}.qualified_for_limited_feed ;;
  }

  dimension: rating {
    type: string
    sql: ${TABLE}.rating ;;
  }

  dimension_group: reach_jobs_update_complete_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.reach_jobs_update_complete_timestamp ;;
  }

  dimension: rx_ad {
    type: string
    sql: ${TABLE}.rx_ad ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension_group: spend_by {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.spend_by_date ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: tracking_url {
    type: string
    sql: ${TABLE}.tracking_url ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	clients.client_id,
	clients.client_name,
	campaigns.campaign_id,
	campaigns.campaign_name,
	ad_groups.id,
	ad_groups.name
	]
  }

}
