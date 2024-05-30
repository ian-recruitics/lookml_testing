# The name of this view in Looker is "Netsuite Transaction Lines Base"
view: netsuite_transaction_lines_base {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.netsuite_transaction_lines_base ;;
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
    # This dimension will be called "Customer Transaction Reference ID" in Explore.

  dimension: customer_transaction_reference_id {
    type: number
    sql: ${TABLE}.customer_transaction_reference_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: po_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.po_end_date ;;
  }

  dimension_group: po_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.po_start_date ;;
  }

  dimension: purchase_order_number {
    type: string
    sql: ${TABLE}.purchase_order_number ;;
  }

  dimension: transaction_internal_id {
    type: number
    sql: ${TABLE}.transaction_internal_id ;;
  }

  dimension: transaction_line_id {
    type: number
    sql: ${TABLE}.transaction_line_id ;;
  }

  dimension: transaction_line_item_id {
    type: number
    sql: ${TABLE}.transaction_line_item_id ;;
  }

  dimension: vendor_tag {
    type: string
    sql: ${TABLE}.vendor_tag ;;
  }

  dimension: vendor_transaction_reference_id {
    type: number
    sql: ${TABLE}.vendor_transaction_reference_id ;;
  }
  measure: count {
    type: count
    drill_fields: [id]
  }
}
