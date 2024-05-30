# The name of this view in Looker is "Reach Vendor Feeds"
view: reach_vendor_feeds {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reach_vendor_feeds ;;
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
    # This dimension will be called "Bid Maximum" in Explore.

  dimension: bid_maximum {
    type: number
    sql: ${TABLE}.bid_maximum ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_bid_maximum {
    type: sum
    sql: ${bid_maximum} ;;  }
  measure: average_bid_maximum {
    type: average
    sql: ${bid_maximum} ;;  }

  dimension: bid_minimum {
    type: number
    sql: ${TABLE}.bid_minimum ;;
  }

  dimension: bid_modifier {
    type: number
    sql: ${TABLE}.bid_modifier ;;
  }

  dimension: bid_values {
    type: string
    sql: ${TABLE}.bid_values ;;
  }

  dimension: client_id_blacklist {
    type: string
    sql: ${TABLE}.client_id_blacklist ;;
  }

  dimension: client_id_whitelist {
    type: string
    sql: ${TABLE}.client_id_whitelist ;;
  }

  dimension: client_type_blacklist {
    type: string
    sql: ${TABLE}.client_type_blacklist ;;
  }

  dimension: client_type_whitelist {
    type: string
    sql: ${TABLE}.client_type_whitelist ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: disallowed_vendor_allocations {
    type: string
    sql: ${TABLE}.disallowed_vendor_allocations ;;
  }

  dimension: generate_feed_of_count {
    type: number
    sql: ${TABLE}.generate_feed_of_count ;;
  }

  dimension: job_description_includes {
    type: string
    sql: ${TABLE}.job_description_includes ;;
  }

  dimension: job_onet_code_blacklist {
    type: string
    sql: ${TABLE}.job_onet_code_blacklist ;;
  }

  dimension: job_onet_code_whitelist {
    type: string
    sql: ${TABLE}.job_onet_code_whitelist ;;
  }

  dimension: job_region_whitelist {
    type: string
    sql: ${TABLE}.job_region_whitelist ;;
  }

  dimension: job_title_includes {
    type: string
    sql: ${TABLE}.job_title_includes ;;
  }

  dimension: outbound_file_name {
    type: string
    sql: ${TABLE}.outbound_file_name ;;
  }

  dimension: reach_feed_type {
    type: string
    sql: ${TABLE}.reach_feed_type ;;
  }

  dimension: sanitize_description {
    type: yesno
    sql: ${TABLE}.sanitize_description ;;
  }

  dimension: storage_details {
    type: string
    sql: ${TABLE}.storage_details ;;
  }

  dimension: storage_type {
    type: string
    sql: ${TABLE}.storage_type ;;
  }

  dimension: template {
    type: string
    sql: ${TABLE}.template ;;
  }

  dimension: tracking_name {
    type: string
    sql: ${TABLE}.tracking_name ;;
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

  dimension: vendor_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: volume_limited_feed {
    type: string
    sql: ${TABLE}.volume_limited_feed ;;
  }

  dimension: vqs_maximum {
    type: number
    sql: ${TABLE}.vqs_maximum ;;
  }

  dimension: vqs_minimum {
    type: number
    sql: ${TABLE}.vqs_minimum ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	tracking_name,
	outbound_file_name,
	vendors.id,
	vendors.name,
	vendors.outbound_filename,
	vendors.canonical_name
	]
  }

}
