# The name of this view in Looker is "Reach Campaign Shutoff Configuration"
view: reach_campaign_shutoff_configuration {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reach_campaign_shutoff_configuration ;;
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
    # This dimension will be called "Campaign ID" in Explore.

  dimension: campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: rx_source_tag {
    type: string
    sql: ${TABLE}.rx_source_tag ;;
  }

  dimension: subvendor_shutoff {
    type: number
    sql: ${TABLE}.subvendor_shutoff ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_subvendor_shutoff {
    type: sum
    sql: ${subvendor_shutoff} ;;  }
  measure: average_subvendor_shutoff {
    type: average
    sql: ${subvendor_shutoff} ;;  }

  dimension: vendor_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.vendor_id ;;
  }

  dimension: vendor_name {
    type: string
    sql: ${TABLE}.vendor_name ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	campaign_name,
	vendor_name,
	clients.client_id,
	clients.client_name,
	campaigns.campaign_id,
	campaigns.campaign_name,
	vendors.id,
	vendors.name,
	vendors.outbound_filename,
	vendors.canonical_name
	]
  }

}
