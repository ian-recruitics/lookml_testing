# The name of this view in Looker is "Cost Data"
view: cost_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.cost_data ;;
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
    # This dimension will be called "Ad ID Tag" in Explore.

  dimension: ad_id_tag {
    type: string
    sql: ${TABLE}.ad_id_tag ;;
  }

  dimension: applies {
    type: number
    sql: ${TABLE}.applies ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }

  dimension: campaign_recruitics {
    type: string
    sql: ${TABLE}.campaign_recruitics ;;
  }

  dimension: campaign_tag {
    type: string
    sql: ${TABLE}.campaign_tag ;;
  }

  dimension: campaignid {
    type: string
    # hidden: yes
    sql: ${TABLE}.campaignid ;;
  }

  dimension: clicks {
    type: number
    sql: ${TABLE}.clicks ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_mapping_file_name {
    type: string
    sql: ${TABLE}.client_mapping_file_name ;;
  }

  dimension: client_mapping_id {
    type: string
    sql: ${TABLE}.client_mapping_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }

  dimension: cost_amount {
    type: number
    sql: ${TABLE}.cost_amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost_amount {
    type: sum
    sql: ${cost_amount} ;;  }
  measure: average_cost_amount {
    type: average
    sql: ${cost_amount} ;;  }

  dimension: cost_currency {
    type: string
    sql: ${TABLE}.cost_currency ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: cost {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.cost_date ;;
  }

  dimension: cost_origin {
    type: string
    sql: ${TABLE}.cost_origin ;;
  }

  dimension: cost_type {
    type: string
    sql: ${TABLE}.cost_type ;;
  }

  dimension: filename {
    type: string
    sql: ${TABLE}.filename ;;
  }

  dimension: is_intraday_entry {
    type: yesno
    sql: ${TABLE}.is_intraday_entry ;;
  }

  dimension: is_reach {
    type: yesno
    sql: ${TABLE}.is_reach ;;
  }

  dimension: is_reconciliation_entry {
    type: yesno
    sql: ${TABLE}.is_reconciliation_entry ;;
  }

  dimension: is_rx_generated {
    type: yesno
    sql: ${TABLE}.is_rx_generated ;;
  }

  dimension: is_vendor_transaction_cost {
    type: yesno
    sql: ${TABLE}.is_vendor_transaction_cost ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: parsed_file_type {
    type: string
    sql: ${TABLE}.parsed_file_type ;;
  }

  dimension: po_lineitem_id {
    type: string
    sql: ${TABLE}.po_lineitem_id ;;
  }

  dimension: rx_vp {
    type: string
    sql: ${TABLE}.rx_vp ;;
  }

  dimension_group: updated_timestamp_utc {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_timestamp_utc ;;
  }

  dimension: vendor_file_name {
    type: string
    sql: ${TABLE}.vendor_file_name ;;
  }

  dimension: vendor_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_mapping_id {
    type: string
    sql: ${TABLE}.vendor_mapping_id ;;
  }

  dimension: vendor_source {
    type: string
    sql: ${TABLE}.vendor_source ;;
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
	client_mapping_file_name,
	vendor_file_name,
	filename,
	clients.client_id,
	clients.client_name,
	vendors.id,
	vendors.name,
	vendors.outbound_filename,
	vendors.canonical_name,
	campaigns.campaign_id,
	campaigns.campaign_name
	]
  }

}
