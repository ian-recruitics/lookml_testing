# The name of this view in Looker is "Ad Group Bids"
view: ad_group_bids {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.ad_group_bids ;;
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
    # This dimension will be called "Bid" in Explore.

  dimension: bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.bid ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.bid_type ;;
  }

  dimension: campaign {
    type: string
    sql: ${TABLE}.campaign ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: segment_id {
    type: number
    sql: ${TABLE}.segment_id ;;
  }

  dimension: slot_count {
    type: number
    sql: ${TABLE}.slot_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_slot_count {
    type: sum
    sql: ${slot_count} ;;  }
  measure: average_slot_count {
    type: average
    sql: ${slot_count} ;;  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
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

  dimension: xml_tags {
    type: string
    sql: ${TABLE}.xml_tags ;;
  }
  measure: count {
    type: count
    drill_fields: [id, vendors.id, vendors.name, vendors.outbound_filename, vendors.canonical_name]
  }
}
