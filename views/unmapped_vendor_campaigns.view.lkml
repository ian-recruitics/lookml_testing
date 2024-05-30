# The name of this view in Looker is "Unmapped Vendor Campaigns"
view: unmapped_vendor_campaigns {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.unmapped_vendor_campaigns ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Campaign Tag" in Explore.

  dimension: campaign_tag {
    type: string
    sql: ${TABLE}.campaign_tag ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
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
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: cost {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.cost_date ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: po_lineitem_id {
    type: string
    sql: ${TABLE}.po_lineitem_id ;;
  }

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }

  dimension: vendor_campaign_id {
    type: string
    sql: ${TABLE}.vendor_campaign_id ;;
  }
  measure: count {
    type: count
    drill_fields: [client_name, clients.client_id, clients.client_name]
  }
}
