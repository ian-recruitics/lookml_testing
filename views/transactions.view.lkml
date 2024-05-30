# The name of this view in Looker is "Transactions"
view: transactions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.transactions ;;
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
    # This dimension will be called "Applies Goal" in Explore.

  dimension: applies_goal {
    type: number
    sql: ${TABLE}.applies_goal ;;
  }

  dimension: batch_id {
    type: number
    sql: ${TABLE}.batch_id ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
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

  dimension: client_transaction_id {
    type: number
    sql: ${TABLE}.client_transaction_id ;;
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

  dimension: created_by {
    type: number
    sql: ${TABLE}.created_by ;;
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
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expired ;;
  }

  dimension: indeed_apply_enabled {
    type: yesno
    sql: ${TABLE}.indeed_apply_enabled ;;
  }

  dimension_group: invoice {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.invoice_date ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: maximum_cpa {
    type: number
    sql: ${TABLE}.maximum_cpa ;;
  }

  dimension: media_cost {
    type: number
    sql: ${TABLE}.media_cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_media_cost {
    type: sum
    sql: ${media_cost} ;;  }
  measure: average_media_cost {
    type: average
    sql: ${media_cost} ;;  }

  dimension: meta_data {
    type: string
    sql: ${TABLE}.meta_data ;;
  }

  dimension: metric_snapshot {
    type: string
    sql: ${TABLE}.metric_snapshot ;;
  }

  dimension: notes {
    type: string
    sql: ${TABLE}.notes ;;
  }

  dimension: posted {
    type: yesno
    sql: ${TABLE}.posted ;;
  }

  dimension: recruitics_campaign {
    type: string
    sql: ${TABLE}.recruitics_campaign ;;
  }

  dimension: recruitics_fee {
    type: number
    sql: ${TABLE}.recruitics_fee ;;
  }

  dimension: rx_ad {
    type: string
    sql: ${TABLE}.rx_ad ;;
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

  dimension: transaction_status_id {
    type: number
    sql: ${TABLE}.transaction_status_id ;;
  }

  dimension: transaction_statuses {
    type: string
    sql: ${TABLE}.transaction_statuses ;;
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

  dimension: updated_by {
    type: number
    sql: ${TABLE}.updated_by ;;
  }

  dimension: url_tags {
    type: string
    sql: ${TABLE}.url_tags ;;
  }

  dimension: vendor_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.vendor_id ;;
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
	vendors.id,
	vendors.name,
	vendors.outbound_filename,
	vendors.canonical_name,
	transaction_daily_npc_events.count,
	transaction_daily_performance.count,
	transaction_daily_web_events.count,
	transaction_daily_performance_without_billable_spend.count
	]
  }

}
