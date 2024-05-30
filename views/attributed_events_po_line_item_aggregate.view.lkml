# The name of this view in Looker is "Attributed Events Po Line Item Aggregate"
view: attributed_events_po_line_item_aggregate {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.attributed_events_po_line_item_aggregate ;;
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
    # This dimension will be called "Attributed Campaign Name" in Explore.

  dimension: attributed_campaign_name {
    type: string
    sql: ${TABLE}.attributed_campaign_name ;;
  }

  dimension: attributed_source {
    type: string
    sql: ${TABLE}.attributed_source ;;
  }

  dimension: client_gross_cost {
    type: number
    sql: ${TABLE}.client_gross_cost ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_client_gross_cost {
    type: sum
    sql: ${client_gross_cost} ;;  }
  measure: average_client_gross_cost {
    type: average
    sql: ${client_gross_cost} ;;  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension_group: last_updated_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_updated_timestamp ;;
  }

  dimension: paid {
    type: yesno
    sql: ${TABLE}.paid ;;
  }

  dimension: purchase_order_line_item_id {
    type: string
    sql: ${TABLE}.purchase_order_line_item_id ;;
  }

  dimension: vendor_campaign_id {
    type: string
    sql: ${TABLE}.vendor_campaign_id ;;
  }

  dimension: vendor_gross_cost {
    type: number
    sql: ${TABLE}.vendor_gross_cost ;;
  }
  measure: count {
    type: count
    drill_fields: [id, attributed_campaign_name, clients.client_id, clients.client_name]
  }
}
