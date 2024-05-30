# The name of this view in Looker is "Campaigns"
view: campaigns {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.campaigns ;;
  drill_fields: [campaign_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: campaign_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.campaign_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Active" in Explore.

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: amp_market_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.amp_market_id ;;
  }

  dimension: applies_goal {
    type: number
    sql: ${TABLE}.applies_goal ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_applies_goal {
    type: sum
    sql: ${applies_goal} ;;  }
  measure: average_applies_goal {
    type: average
    sql: ${applies_goal} ;;  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: client_data {
    type: string
    sql: ${TABLE}.client_data ;;
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

  dimension: daily_average_spend {
    type: number
    sql: ${TABLE}.daily_average_spend ;;
  }

  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: expired {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.expired_at ;;
  }

  dimension: inactive_reason {
    type: string
    sql: ${TABLE}.inactive_reason ;;
  }

  dimension: monthly_recurring {
    type: yesno
    sql: ${TABLE}.monthly_recurring ;;
  }

  dimension_group: next_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.next_start_date ;;
  }

  dimension: recruitics_campaign {
    type: string
    sql: ${TABLE}.recruitics_campaign ;;
  }

  dimension: reporting_tag_1 {
    type: string
    sql: ${TABLE}.reporting_tag_1 ;;
  }

  dimension: reporting_tag_2 {
    type: string
    sql: ${TABLE}.reporting_tag_2 ;;
  }

  dimension_group: start_date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
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
	campaign_id,
	campaign_name,
	clients.client_id,
	clients.client_name,
	amp_markets.id,
	ad_groups.count,
	amp_algorithm_inno_usage.count,
	amp_campaign_vendor_allocations.count,
	amp_goal_fields.count,
	amp_indeed_campaign_budgets.count,
	amp_indeed_campaign_budgets_reporting.count,
	cost_data.count,
	reach_algorithm.count,
	reach_campaign_configuration.count,
	reach_campaign_shutoff_configuration.count,
	reach_feed_generation_results.count,
	reach_vendor_recommendation_ranking.count,
	vendor_allocations.count
	]
  }

}
