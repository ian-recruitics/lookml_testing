# The name of this view in Looker is "Inno Netsuite Purchase Order Data"
view: inno_netsuite_purchase_order_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.inno_netsuite_purchase_order_data ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Client ID" in Explore.

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: document_number {
    type: number
    sql: ${TABLE}.document_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_document_number {
    type: sum
    sql: ${document_number} ;;  }
  measure: average_document_number {
    type: average
    sql: ${document_number} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }

  dimension: gross_amount {
    type: number
    sql: ${TABLE}.gross_amount ;;
  }

  dimension: source_tag {
    type: string
    sql: ${TABLE}.source_tag ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
  }
  measure: count {
    type: count
    drill_fields: [clients.client_id, clients.client_name]
  }
}
