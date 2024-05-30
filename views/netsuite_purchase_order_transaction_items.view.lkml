# The name of this view in Looker is "Netsuite Purchase Order Transaction Items"
view: netsuite_purchase_order_transaction_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.netsuite_purchase_order_transaction_items ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Billing Schedule" in Explore.

  dimension: billing_schedule {
    type: number
    sql: ${TABLE}.billing_schedule ;;
  }

  dimension: channel_name {
    type: string
    sql: ${TABLE}.channel_name ;;
  }

  dimension: class_id {
    type: number
    sql: ${TABLE}.class_id ;;
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

  dimension: cost_of_sale_rec_account_id {
    type: number
    sql: ${TABLE}.cost_of_sale_rec_account_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_date ;;
  }

  dimension: deferred_expense_account_id {
    type: number
    sql: ${TABLE}.deferred_expense_account_id ;;
  }

  dimension: department_id {
    type: number
    sql: ${TABLE}.department_id ;;
  }

  dimension: expense_account_id {
    type: number
    sql: ${TABLE}.expense_account_id ;;
  }

  dimension: gain_loss_account_id {
    type: number
    sql: ${TABLE}.gain_loss_account_id ;;
  }

  dimension: income_account_id {
    type: number
    sql: ${TABLE}.income_account_id ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: item_class {
    type: number
    sql: ${TABLE}.item_class ;;
  }

  dimension: item_class_name {
    type: string
    sql: ${TABLE}.item_class_name ;;
  }

  dimension: item_display_name {
    type: string
    sql: ${TABLE}.item_display_name ;;
  }

  dimension: item_full_name {
    type: string
    sql: ${TABLE}.item_full_name ;;
  }

  dimension: item_id {
    type: number
    sql: ${TABLE}.item_id ;;
  }

  dimension: item_reconciliation {
    type: number
    sql: ${TABLE}.item_reconciliation ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: offering_bucket {
    type: number
    sql: ${TABLE}.offering_bucket ;;
  }

  dimension: offering_name {
    type: string
    sql: ${TABLE}.offering_name ;;
  }

  dimension: parent_item_id {
    type: number
    sql: ${TABLE}.parent_item_id ;;
  }

  dimension: pillar_name {
    type: string
    sql: ${TABLE}.pillar_name ;;
  }

  dimension: revenue_rec_account_id {
    type: number
    sql: ${TABLE}.revenue_rec_account_id ;;
  }

  dimension: rx_medium {
    type: string
    sql: ${TABLE}.rx_medium ;;
  }

  dimension: sales_description {
    type: string
    sql: ${TABLE}.sales_description ;;
  }

  dimension: stickiness_score {
    type: number
    sql: ${TABLE}.stickiness_score ;;
  }

  dimension: sub_type {
    type: string
    sql: ${TABLE}.sub_type ;;
  }

  dimension: subsidiary_id {
    type: string
    sql: ${TABLE}.subsidiary_id ;;
  }

  dimension: type_name {
    type: string
    sql: ${TABLE}.type_name ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	pillar_name,
	channel_name,
	offering_name,
	item_display_name,
	item_full_name,
	name,
	type_name,
	item_class_name
	]
  }

}
