# The name of this view in Looker is "Netsuite Vendor Item"
view: netsuite_vendor_item {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.netsuite_vendor_item ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Fivetran ID" in Explore.

  dimension: fivetran_id {
    type: string
    sql: ${TABLE}.fivetran_id ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: item_display_name {
    type: string
    sql: ${TABLE}.item_display_name ;;
  }

  dimension: item_full_name {
    type: string
    sql: ${TABLE}.item_full_name ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: preferred_vendor {
    type: yesno
    sql: ${TABLE}.preferred_vendor ;;
  }

  dimension: subsidiary_id {
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }

  dimension: vendor_cost {
    type: number
    sql: ${TABLE}.vendor_cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_vendor_cost {
    type: sum
    sql: ${vendor_cost} ;;  }
  measure: average_vendor_cost {
    type: average
    sql: ${vendor_cost} ;;  }

  dimension: vendor_currency_id {
    type: number
    sql: ${TABLE}.vendor_currency_id ;;
  }

  dimension: vendor_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_item_id {
    type: number
    sql: ${TABLE}.vendor_item_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	name,
	item_display_name,
	item_full_name,
	vendors.id,
	vendors.name,
	vendors.outbound_filename,
	vendors.canonical_name
	]
  }

}
