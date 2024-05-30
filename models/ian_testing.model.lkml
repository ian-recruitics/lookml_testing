# Define the database connection to be used for this model.
connection: "datawarehouse_prod"

# include all the views
include: "/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: ian_testing_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: ian_testing_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Ian Testing"

explore: ad_group_bids {
  join: vendors {
    type: left_outer 
    sql_on: ${ad_group_bids.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: ad_groups {
  join: clients {
    type: left_outer 
    sql_on: ${ad_groups.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${ad_groups.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: amp_algorithm {
  join: clients {
    type: left_outer 
    sql_on: ${amp_algorithm.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: amp_algorithm_inno_usage {
  join: clients {
    type: left_outer 
    sql_on: ${amp_algorithm_inno_usage.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${amp_algorithm_inno_usage.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: amp_campaign_vendor_allocations {
  join: clients {
    type: left_outer 
    sql_on: ${amp_campaign_vendor_allocations.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${amp_campaign_vendor_allocations.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: amp_client_levers_reporting {}

explore: amp_client_source_levers_reporting {}

explore: amp_daterange_exclusions_levers_reporting {
  join: clients {
    type: left_outer 
    sql_on: ${amp_daterange_exclusions_levers_reporting.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: amp_goal_fields {
  join: campaigns {
    type: left_outer 
    sql_on: ${amp_goal_fields.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer 
    sql_on: ${campaigns.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: amp_inclusions_exclusions_levers_reporting {}

explore: amp_indeed_campaign_budgets {
  join: clients {
    type: left_outer 
    sql_on: ${amp_indeed_campaign_budgets.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${amp_indeed_campaign_budgets.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: amp_indeed_campaign_budgets_reporting {
  join: clients {
    type: left_outer 
    sql_on: ${amp_indeed_campaign_budgets_reporting.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${amp_indeed_campaign_budgets_reporting.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: amp_jobs {
  join: clients {
    type: left_outer 
    sql_on: ${amp_jobs.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${amp_jobs.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: amp_locations {}

explore: amp_markets {
  join: clients {
    type: left_outer 
    sql_on: ${amp_markets.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: amp_pacing_levers_reporting {}

explore: amp_static_bids_levers_reporting {}

explore: applicant_report {
  join: clients {
    type: left_outer 
    sql_on: ${applicant_report.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: attributed_events_aggregate_demo {
  join: clients {
    type: left_outer 
    sql_on: ${attributed_events_aggregate_demo.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: attributed_events_aggregate_npc {
  join: clients {
    type: left_outer 
    sql_on: ${attributed_events_aggregate_npc.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: attributed_events_po_line_item_aggregate {
  join: clients {
    type: left_outer 
    sql_on: ${attributed_events_po_line_item_aggregate.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: bannerhealth_report {
  join: clients {
    type: left_outer 
    sql_on: ${bannerhealth_report.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: ad_groups {
    type: left_outer 
    sql_on: ${bannerhealth_report.ad_group_id} = ${ad_groups.id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${ad_groups.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: bureau_labor_statistics_reference {}

explore: campaign_daily_artificial_events {
  join: clients {
    type: left_outer 
    sql_on: ${campaign_daily_artificial_events.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: campaign_daily_demo_events {
  join: clients {
    type: left_outer 
    sql_on: ${campaign_daily_demo_events.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: campaign_daily_npc_events {
  join: clients {
    type: left_outer 
    sql_on: ${campaign_daily_npc_events.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: campaign_performance {
  join: clients {
    type: left_outer 
    sql_on: ${campaign_performance.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: campaigns {
  join: clients {
    type: left_outer 
    sql_on: ${campaigns.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: classification_tool {}

explore: classification_tool_timeslices {}

explore: client_vendor_mappings {
  join: clients {
    type: left_outer 
    sql_on: ${client_vendor_mappings.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: vendors {
    type: left_outer 
    sql_on: ${client_vendor_mappings.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: clients {}

explore: cost_data {
  join: clients {
    type: left_outer 
    sql_on: ${cost_data.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: vendors {
    type: left_outer 
    sql_on: ${cost_data.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${cost_data.campaignid} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: dates {}

explore: drive_time {}

explore: inno_netsuite_purchase_order_data {
  join: clients {
    type: left_outer 
    sql_on: ${inno_netsuite_purchase_order_data.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: jams_reach_configurations {
  join: clients {
    type: left_outer 
    sql_on: ${jams_reach_configurations.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: job_daily_demo_events {
  join: clients {
    type: left_outer 
    sql_on: ${job_daily_demo_events.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: job_daily_npc_events {
  join: clients {
    type: left_outer 
    sql_on: ${job_daily_npc_events.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: jobs_metadata_segmentation_reporting {}

explore: kelly_services_cost_centers {}

explore: log_full_refresh {}

explore: netsuite_contract_transaction_items {}

explore: netsuite_contract_transaction_lines {}

explore: netsuite_contract_transactions {}

explore: netsuite_credit_memo_transaction_items {}

explore: netsuite_credit_memo_transaction_lines {}

explore: netsuite_credit_memo_transactions {}

explore: netsuite_customers {}

explore: netsuite_invoice_transaction_items {}

explore: netsuite_invoice_transaction_lines {}

explore: netsuite_invoice_transactions {}

explore: netsuite_item_receipt_transaction_items {}

explore: netsuite_item_receipt_transaction_lines {}

explore: netsuite_item_receipt_transactions {}

explore: netsuite_journal_entry_sales_order_link_transaction_items {}

explore: netsuite_journal_entry_sales_order_link_transaction_lines {}

explore: netsuite_journal_entry_sales_order_link_transactions {}

explore: netsuite_journal_entry_stand_alone_transaction_items {}

explore: netsuite_journal_entry_stand_alone_transaction_lines {}

explore: netsuite_journal_entry_stand_alone_transactions {}

explore: netsuite_journal_entry_transaction_items {}

explore: netsuite_journal_entry_transaction_lines {}

explore: netsuite_journal_entry_transactions {}

explore: netsuite_purchase_order_transaction_items {}

explore: netsuite_purchase_order_transaction_lines {}

explore: netsuite_purchase_order_transactions {}

explore: netsuite_sales_order_transaction_items {}

explore: netsuite_sales_order_transaction_lines {}

explore: netsuite_sales_order_transactions {}

explore: netsuite_transaction_items {}

explore: netsuite_transaction_lines_base {}

explore: netsuite_vendor_item {
  join: vendors {
    type: left_outer 
    sql_on: ${netsuite_vendor_item.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: netsuite_vendors {
  join: vendors {
    type: left_outer 
    sql_on: ${netsuite_vendors.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: netsuite_vendors_item_receipt {
  join: vendors {
    type: left_outer 
    sql_on: ${netsuite_vendors_item_receipt.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: netsuite_vendors_journal_entry {
  join: vendors {
    type: left_outer 
    sql_on: ${netsuite_vendors_journal_entry.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: netsuite_vendors_journal_entry_sales_order_link {
  join: vendors {
    type: left_outer 
    sql_on: ${netsuite_vendors_journal_entry_sales_order_link.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: netsuite_vendors_journal_entry_stand_alone {
  join: vendors {
    type: left_outer 
    sql_on: ${netsuite_vendors_journal_entry_stand_alone.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: netsuite_vendors_purchase_order {
  join: vendors {
    type: left_outer 
    sql_on: ${netsuite_vendors_purchase_order.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: reach_algorithm {
  join: clients {
    type: left_outer 
    sql_on: ${reach_algorithm.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${reach_algorithm.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: reach_campaign_configuration {
  join: clients {
    type: left_outer 
    sql_on: ${reach_campaign_configuration.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${reach_campaign_configuration.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: reach_campaign_daily_performance {
  join: clients {
    type: left_outer 
    sql_on: ${reach_campaign_daily_performance.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: reach_campaign_shutoff_configuration {
  join: clients {
    type: left_outer 
    sql_on: ${reach_campaign_shutoff_configuration.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${reach_campaign_shutoff_configuration.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: vendors {
    type: left_outer 
    sql_on: ${reach_campaign_shutoff_configuration.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: reach_cpc_bids {
  join: clients {
    type: left_outer 
    sql_on: ${reach_cpc_bids.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: reach_custom_vqs {}

explore: reach_feed_generation_results {
  join: clients {
    type: left_outer 
    sql_on: ${reach_feed_generation_results.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${reach_feed_generation_results.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: ad_groups {
    type: left_outer 
    sql_on: ${reach_feed_generation_results.ad_group_id} = ${ad_groups.id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: reach_historical_vendor_performance_onet_location {}

explore: reach_sub_vendor_report_npc_events {
  join: clients {
    type: left_outer 
    sql_on: ${reach_sub_vendor_report_npc_events.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: reach_sub_vendor_report_web_events {
  join: clients {
    type: left_outer 
    sql_on: ${reach_sub_vendor_report_web_events.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: reach_vendor_feeds {
  join: vendors {
    type: left_outer 
    sql_on: ${reach_vendor_feeds.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: reach_vendor_feeds_list {}

explore: reach_vendor_quality_score {
  join: clients {
    type: left_outer 
    sql_on: ${reach_vendor_quality_score.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: reach_vendor_recommendation_ranking {
  join: clients {
    type: left_outer 
    sql_on: ${reach_vendor_recommendation_ranking.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer 
    sql_on: ${reach_vendor_recommendation_ranking.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: reduced_jobs_data {
  join: clients {
    type: left_outer 
    sql_on: ${reduced_jobs_data.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: statistics_civilian_labor_force_level {}

explore: statistics_discouraged_workers {}

explore: statistics_employed_usually_work_full_time {}

explore: statistics_employed_usually_work_part_time {}

explore: statistics_job_openings_and_labor_turnover {}

explore: statistics_labor_force_participation_rate {}

explore: statistics_local_area_unemployment {}

explore: statistics_unemployment_national_level {}

explore: statistics_unemployment_rate {}

explore: transaction_daily_npc_events {
  join: clients {
    type: left_outer 
    sql_on: ${transaction_daily_npc_events.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: transactions {
    type: left_outer 
    sql_on: ${transaction_daily_npc_events.transaction_id} = ${transactions.id} ;;
    relationship: many_to_one
  }

  join: vendors {
    type: left_outer 
    sql_on: ${transactions.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: transaction_daily_performance {
  join: clients {
    type: left_outer 
    sql_on: ${transaction_daily_performance.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: transactions {
    type: left_outer 
    sql_on: ${transaction_daily_performance.transaction_id} = ${transactions.id} ;;
    relationship: many_to_one
  }

  join: vendors {
    type: left_outer 
    sql_on: ${transactions.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: transaction_daily_web_events {
  join: clients {
    type: left_outer 
    sql_on: ${transaction_daily_web_events.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: transactions {
    type: left_outer 
    sql_on: ${transaction_daily_web_events.transaction_id} = ${transactions.id} ;;
    relationship: many_to_one
  }

  join: vendors {
    type: left_outer 
    sql_on: ${transactions.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: transactions {
  join: clients {
    type: left_outer 
    sql_on: ${transactions.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: vendors {
    type: left_outer 
    sql_on: ${transactions.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: unmapped_vendor_campaigns {
  join: clients {
    type: left_outer 
    sql_on: ${unmapped_vendor_campaigns.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: users {}

explore: vendor_allocations {
  join: campaigns {
    type: left_outer 
    sql_on: ${vendor_allocations.campaign_id} = ${campaigns.campaign_id} ;;
    relationship: many_to_one
  }

  join: vendors {
    type: left_outer 
    sql_on: ${vendor_allocations.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer 
    sql_on: ${campaigns.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: amp_markets {
    type: left_outer 
    sql_on: ${campaigns.amp_market_id} = ${amp_markets.id} ;;
    relationship: many_to_one
  }
}

explore: vendor_daily_performance {
  join: clients {
    type: left_outer 
    sql_on: ${vendor_daily_performance.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: vendors {}

explore: attributed_events_aggregate_with_string {
  join: clients {
    type: left_outer 
    sql_on: ${attributed_events_aggregate_with_string.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: transaction_daily_performance_without_billable_spend {
  join: transactions {
    type: left_outer 
    sql_on: ${transaction_daily_performance_without_billable_spend.transaction_id} = ${transactions.id} ;;
    relationship: many_to_one
  }

  join: clients {
    type: left_outer 
    sql_on: ${transaction_daily_performance_without_billable_spend.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }

  join: vendors {
    type: left_outer 
    sql_on: ${transactions.vendor_id} = ${vendors.id} ;;
    relationship: many_to_one
  }
}

explore: attributed_events_aggregate {
  join: clients {
    type: left_outer 
    sql_on: ${attributed_events_aggregate.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: campaign_daily_performance {
  join: clients {
    type: left_outer 
    sql_on: ${campaign_daily_performance.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: job_daily_performance {
  join: clients {
    type: left_outer 
    sql_on: ${job_daily_performance.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: reach_sub_vendor_report {
  join: clients {
    type: left_outer 
    sql_on: ${reach_sub_vendor_report.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

explore: reach_campaign_spend_by_date {
  join: clients {
    type: left_outer 
    sql_on: ${reach_campaign_spend_by_date.client_id} = ${clients.client_id} ;;
    relationship: many_to_one
  }
}

