# The name of this view in Looker is "Ad Groups"
view: ad_groups {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.ad_groups ;;
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

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
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

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_created_by {
    type: sum
    sql: ${created_by} ;;  }
  measure: average_created_by {
    type: average
    sql: ${created_by} ;;  }

  dimension: default {
    type: string
    sql: ${TABLE}."default" ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: entity_type {
    type: string
    sql: ${TABLE}.entity_type ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: priority {
    type: number
    sql: ${TABLE}.priority ;;
  }

  dimension: search {
    type: string
    sql: ${TABLE}.search ;;
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

  dimension: uploading_active {
    type: yesno
    sql: ${TABLE}.uploading_active ;;
  }

  dimension: url_tags {
    type: string
    sql: ${TABLE}.url_tags ;;
  }

  dimension: xml_tags {
    type: string
    sql: ${TABLE}.xml_tags ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	name,
	clients.client_id,
	clients.client_name,
	campaigns.campaign_id,
	campaigns.campaign_name,
	bannerhealth_report.count,
	reach_feed_generation_results.count
	]
  }

}
