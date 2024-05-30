# The name of this view in Looker is "Amp Algorithm Inno Usage"
view: amp_algorithm_inno_usage {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.amp_algorithm_inno_usage ;;
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
    # This dimension will be called "Abs Avg Cpa" in Explore.

  dimension: abs_avg_cpa {
    type: number
    sql: ${TABLE}.abs_avg_cpa ;;
  }

  dimension: abs_indeed_cpc_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.abs_indeed_cpc_bid ;;
  }

  dimension: abs_jobcase_cpc_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.abs_jobcase_cpc_bid ;;
  }

  dimension: abs_jobs2careers_cpc_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.abs_jobs2careers_cpc_bid ;;
  }

  dimension: abs_reach_cpc_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.abs_reach_cpc_bid ;;
  }

  dimension: abs_snagajob_cpc_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.abs_snagajob_cpc_bid ;;
  }

  dimension: abs_ziprecruiter_cpc_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.abs_ziprecruiter_cpc_bid ;;
  }

  dimension: applies_goal {
    type: number
    sql: ${TABLE}.applies_goal ;;
  }

  dimension: bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bid ;;
  }

  dimension: bid_multiplier_lever {
    type: number
    sql: ${TABLE}.bid_multiplier_lever ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension: campaign_available_jv {
    type: number
    sql: ${TABLE}.campaign_available_jv ;;
  }

  dimension: campaign_best_cost {
    type: number
    sql: ${TABLE}.campaign_best_cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_campaign_best_cost {
    type: sum
    sql: ${campaign_best_cost} ;;  }
  measure: average_campaign_best_cost {
    type: average
    sql: ${campaign_best_cost} ;;  }

  dimension: campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_non_indeed_best_cost {
    type: number
    sql: ${TABLE}.campaign_non_indeed_best_cost ;;
  }

  dimension: campaign_paid_applies {
    type: number
    sql: ${TABLE}.campaign_paid_applies ;;
  }

  dimension: campaign_paid_jobviews {
    type: number
    sql: ${TABLE}.campaign_paid_jobviews ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: cpa_goal {
    type: number
    sql: ${TABLE}.cpa_goal ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }

  dimension: exclusions_rule {
    type: string
    sql: ${TABLE}.exclusions_rule ;;
  }

  dimension: expected_pace_to_goal {
    type: number
    sql: ${TABLE}.expected_pace_to_goal ;;
  }

  dimension: inclusions_rule {
    type: string
    sql: ${TABLE}.inclusions_rule ;;
  }

  dimension: indeed_budget {
    type: number
    sql: ${TABLE}.indeed_budget ;;
  }

  dimension: indeed_healthy_budgets_min_budget_per_job {
    type: number
    sql: ${TABLE}.indeed_healthy_budgets_min_budget_per_job ;;
  }

  dimension: indeed_min_budget_lever {
    type: number
    sql: ${TABLE}.indeed_min_budget_lever ;;
  }

  dimension: job_category {
    type: string
    sql: ${TABLE}.job_category ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: job_specialty {
    type: string
    sql: ${TABLE}.job_specialty ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: job_type {
    type: string
    sql: ${TABLE}.job_type ;;
  }

  dimension: jvlimit_cutoff_lever {
    type: number
    sql: ${TABLE}.jvlimit_cutoff_lever ;;
  }

  dimension_group: last_algorithm_run {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_algorithm_run ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: market_expansion {
    type: number
    sql: ${TABLE}.market_expansion ;;
  }

  dimension: market_id {
    type: number
    sql: ${TABLE}.market_id ;;
  }

  dimension: market_label {
    type: string
    sql: ${TABLE}.market_label ;;
  }

  dimension: market_priority {
    type: number
    sql: ${TABLE}.market_priority ;;
  }

  dimension: market_source_cvr {
    type: number
    sql: ${TABLE}.market_source_cvr ;;
  }

  dimension: market_tag {
    type: string
    sql: ${TABLE}.market_tag ;;
  }

  dimension: market_template {
    type: string
    sql: ${TABLE}.market_template ;;
  }

  dimension: maxbid_lever {
    type: number
    sql: ${TABLE}.maxbid_lever ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: minbid_lever {
    type: number
    sql: ${TABLE}.minbid_lever ;;
  }

  dimension: pace_to_goal {
    type: number
    sql: ${TABLE}.pace_to_goal ;;
  }

  dimension: pacing_multiplier {
    type: number
    sql: ${TABLE}.pacing_multiplier ;;
  }

  dimension: pacing_rule {
    type: string
    sql: ${TABLE}.pacing_rule ;;
  }

  dimension: percent_rank_within_market {
    type: number
    sql: ${TABLE}.percent_rank_within_market ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: rank_within_market {
    type: number
    sql: ${TABLE}.rank_within_market ;;
  }

  dimension: ranking_multiplier {
    type: number
    sql: ${TABLE}.ranking_multiplier ;;
  }

  dimension: recruitics_campaign {
    type: string
    sql: ${TABLE}.recruitics_campaign ;;
  }

  dimension: role_type {
    type: string
    sql: ${TABLE}.role_type ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }

  dimension: static_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.static_bid ;;
  }

  dimension: stop_conditions_lever {
    type: string
    sql: ${TABLE}.stop_conditions_lever ;;
  }

  dimension: submarket {
    type: string
    sql: ${TABLE}.submarket ;;
  }

  dimension: use_expansion_jobs_lever {
    type: string
    sql: ${TABLE}.use_expansion_jobs_lever ;;
  }

  dimension: vendor_markdown_lever {
    type: number
    sql: ${TABLE}.vendor_markdown_lever ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	client_name,
	clients.client_id,
	clients.client_name,
	campaigns.campaign_id,
	campaigns.campaign_name
	]
  }

}
