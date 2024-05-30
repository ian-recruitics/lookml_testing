# The name of this view in Looker is "Vendors"
view: vendors {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.vendors ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Accepts Empty Feeds" in Explore.

  dimension: accepts_empty_feeds {
    type: yesno
    sql: ${TABLE}.accepts_empty_feeds ;;
  }

  dimension: active {
    type: string
    sql: ${TABLE}.active ;;
  }

  dimension: canonical_name {
    type: string
    sql: ${TABLE}.canonical_name ;;
  }

  dimension: combine_alias {
    type: string
    sql: ${TABLE}.combine_alias ;;
  }

  dimension: cost {
    type: number
    sql: ${TABLE}.cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost {
    type: sum
    sql: ${cost} ;;  }
  measure: average_cost {
    type: average
    sql: ${cost} ;;  }

  dimension: cost_max {
    type: number
    sql: ${TABLE}.cost_max ;;
  }

  dimension: cost_min {
    type: number
    sql: ${TABLE}.cost_min ;;
  }

  dimension: cost_variable {
    type: string
    sql: ${TABLE}.cost_variable ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: decode_description {
    type: yesno
    sql: ${TABLE}.decode_description ;;
  }

  dimension: display_name_settable {
    type: yesno
    sql: ${TABLE}.display_name_settable ;;
  }

  dimension: generate_feed_of_count {
    type: number
    sql: ${TABLE}.generate_feed_of_count ;;
  }

  dimension: generate_single_feed_file {
    type: yesno
    sql: ${TABLE}.generate_single_feed_file ;;
  }

  dimension: interval_in_hours {
    type: number
    sql: ${TABLE}.interval_in_hours ;;
  }

  dimension: maximum_post_duration {
    type: number
    sql: ${TABLE}.maximum_post_duration ;;
  }

  dimension: minimum_post_duration {
    type: number
    sql: ${TABLE}.minimum_post_duration ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: outbound_filename {
    type: string
    sql: ${TABLE}.outbound_filename ;;
  }

  dimension: post_duration {
    type: number
    sql: ${TABLE}.post_duration ;;
  }

  dimension: post_duration_variable {
    type: yesno
    sql: ${TABLE}.post_duration_variable ;;
  }

  dimension: product_type {
    type: string
    sql: ${TABLE}.product_type ;;
  }

  dimension: rx_url_tags {
    type: string
    sql: ${TABLE}.rx_url_tags ;;
  }

  dimension: sanitize_description {
    type: yesno
    sql: ${TABLE}.sanitize_description ;;
  }

  dimension: storage_type {
    type: string
    sql: ${TABLE}.storage_type ;;
  }

  dimension: supports_organic {
    type: string
    sql: ${TABLE}.supports_organic ;;
  }

  dimension: template {
    type: string
    sql: ${TABLE}.template ;;
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
	id,
	name,
	outbound_filename,
	canonical_name,
	ad_group_bids.count,
	client_vendor_mappings.count,
	cost_data.count,
	netsuite_vendor_item.count,
	netsuite_vendors.count,
	netsuite_vendors_item_receipt.count,
	netsuite_vendors_journal_entry.count,
	netsuite_vendors_journal_entry_sales_order_link.count,
	netsuite_vendors_journal_entry_stand_alone.count,
	netsuite_vendors_purchase_order.count,
	reach_campaign_shutoff_configuration.count,
	reach_vendor_feeds.count,
	transactions.count,
	vendor_allocations.count
	]
  }

}
