# The name of this view in Looker is "Clients"
view: clients {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.clients ;;
  drill_fields: [client_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: client_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.client_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Action Feed Generation Status" in Explore.

  dimension: action_feed_generation_status {
    type: string
    sql: ${TABLE}.action_feed_generation_status ;;
  }

  dimension: active {
    type: string
    sql: ${TABLE}.active ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: client_addition {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.client_addition_date ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: client_type {
    type: string
    sql: ${TABLE}.client_type ;;
  }

  dimension: cost_status {
    type: string
    sql: ${TABLE}.cost_status ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: currency_code {
    type: string
    sql: ${TABLE}.currency_code ;;
  }

  dimension: data_processing_frequency {
    type: string
    sql: ${TABLE}.data_processing_frequency ;;
  }

  dimension_group: data_processing_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.data_processing_start_date ;;
  }

  dimension: exclude_from_cohort_aggregates {
    type: string
    sql: ${TABLE}.exclude_from_cohort_aggregates ;;
  }

  dimension: invoice_type {
    type: string
    sql: ${TABLE}.invoice_type ;;
  }

  dimension: jobs_status {
    type: string
    sql: ${TABLE}.jobs_status ;;
  }

  dimension: js_status {
    type: string
    sql: ${TABLE}.js_status ;;
  }

  dimension_group: last_sync_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_sync_timestamp ;;
  }

  dimension_group: last_updated_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_updated_timestamp ;;
  }

  dimension: netsuite_id {
    type: number
    sql: ${TABLE}.netsuite_id ;;
  }

  dimension: performance_status {
    type: string
    sql: ${TABLE}.performance_status ;;
  }

  dimension: relationship_status {
    type: string
    sql: ${TABLE}.relationship_status ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: tier {
    type: string
    sql: ${TABLE}.tier ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	client_id,
	client_name,
	ad_groups.count,
	amp_algorithm.count,
	amp_algorithm_inno_usage.count,
	amp_campaign_vendor_allocations.count,
	amp_daterange_exclusions_levers_reporting.count,
	amp_indeed_campaign_budgets.count,
	amp_indeed_campaign_budgets_reporting.count,
	amp_jobs.count,
	amp_markets.count,
	applicant_report.count,
	attributed_events_aggregate_demo.count,
	attributed_events_aggregate_npc.count,
	attributed_events_po_line_item_aggregate.count,
	bannerhealth_report.count,
	campaign_daily_artificial_events.count,
	campaign_daily_demo_events.count,
	campaign_daily_npc_events.count,
	campaign_performance.count,
	campaigns.count,
	client_vendor_mappings.count,
	cost_data.count,
	inno_netsuite_purchase_order_data.count,
	jams_reach_configurations.count,
	job_daily_demo_events.count,
	job_daily_npc_events.count,
	reach_algorithm.count,
	reach_campaign_configuration.count,
	reach_campaign_daily_performance.count,
	reach_campaign_shutoff_configuration.count,
	reach_cpc_bids.count,
	reach_feed_generation_results.count,
	reach_sub_vendor_report_npc_events.count,
	reach_sub_vendor_report_web_events.count,
	reach_vendor_quality_score.count,
	reach_vendor_recommendation_ranking.count,
	reduced_jobs_data.count,
	transaction_daily_npc_events.count,
	transaction_daily_performance.count,
	transaction_daily_web_events.count,
	transactions.count,
	unmapped_vendor_campaigns.count,
	vendor_daily_performance.count,
	attributed_events_aggregate_with_string.count,
	transaction_daily_performance_without_billable_spend.count,
	attributed_events_aggregate.count,
	campaign_daily_performance.count,
	job_daily_performance.count,
	reach_sub_vendor_report.count,
	reach_campaign_spend_by_date.count
	]
  }

}
