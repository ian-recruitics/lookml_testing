# The name of this view in Looker is "Netsuite Vendors"
view: netsuite_vendors {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.netsuite_vendors ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Balance" in Explore.

  dimension: balance {
    type: number
    sql: ${TABLE}.balance ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_balance {
    type: sum
    sql: ${balance} ;;  }
  measure: average_balance {
    type: average
    sql: ${balance} ;;  }

  dimension: balance_primary {
    type: number
    sql: ${TABLE}.balance_primary ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: create_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.create_date_at ;;
  }

  dimension: currency_id {
    type: number
    sql: ${TABLE}.currency_id ;;
  }

  dimension: external_id {
    type: string
    sql: ${TABLE}.external_id ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: payable_account_id {
    type: number
    sql: ${TABLE}.payable_account_id ;;
  }

  dimension: unbilled_orders {
    type: number
    sql: ${TABLE}.unbilled_orders ;;
  }

  dimension: unbilled_orders_primary {
    type: number
    sql: ${TABLE}.unbilled_orders_primary ;;
  }

  dimension: url {
    type: string
    sql: ${TABLE}.url ;;
  }

  dimension: vendor_alt_name {
    type: string
    sql: ${TABLE}.vendor_alt_name ;;
  }

  dimension: vendor_category_id {
    type: number
    sql: ${TABLE}.vendor_category_id ;;
  }

  dimension: vendor_classification {
    type: string
    sql: ${TABLE}.vendor_classification ;;
  }

  dimension: vendor_discount_agency {
    type: number
    sql: ${TABLE}.vendor_discount_agency ;;
  }

  dimension: vendor_discount_corp {
    type: number
    sql: ${TABLE}.vendor_discount_corp ;;
  }

  dimension: vendor_discount_job_board {
    type: number
    sql: ${TABLE}.vendor_discount_job_board ;;
  }

  dimension: vendor_discount_reach {
    type: number
    sql: ${TABLE}.vendor_discount_reach ;;
  }

  dimension: vendor_discount_staffing {
    type: number
    sql: ${TABLE}.vendor_discount_staffing ;;
  }

  dimension: vendor_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_legal_name {
    type: string
    sql: ${TABLE}.vendor_legal_name ;;
  }

  dimension: vendor_tag {
    type: string
    sql: ${TABLE}.vendor_tag ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	vendor_alt_name,
	company_name,
	vendor_legal_name,
	vendors.id,
	vendors.name,
	vendors.outbound_filename,
	vendors.canonical_name
	]
  }

}
