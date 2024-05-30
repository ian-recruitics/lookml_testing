# The name of this view in Looker is "Client Vendor Mappings"
view: client_vendor_mappings {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.client_vendor_mappings ;;
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
    # This dimension will be called "Campaigns" in Explore.

  dimension: campaigns {
    type: string
    sql: ${TABLE}.campaigns ;;
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

  dimension: custom_url_tags {
    type: string
    sql: ${TABLE}.custom_url_tags ;;
  }

  dimension: custom_xml_tags {
    type: string
    sql: ${TABLE}.custom_xml_tags ;;
  }

  dimension: enable_auto_select_jobs {
    type: yesno
    sql: ${TABLE}.enable_auto_select_jobs ;;
  }

  dimension: enable_job_expansions {
    type: yesno
    sql: ${TABLE}.enable_job_expansions ;;
  }

  dimension: enabled {
    type: yesno
    sql: ${TABLE}.enabled ;;
  }

  dimension: outbound_filename {
    type: string
    sql: ${TABLE}.outbound_filename ;;
  }

  dimension: rx_url_tags {
    type: string
    sql: ${TABLE}.rx_url_tags ;;
  }

  dimension: sanitize_description {
    type: yesno
    sql: ${TABLE}.sanitize_description ;;
  }

  dimension: settings {
    type: string
    sql: ${TABLE}.settings ;;
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

  dimension: supports_organic {
    type: yesno
    sql: ${TABLE}.supports_organic ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: vendor_display_name {
    type: string
    sql: ${TABLE}.vendor_display_name ;;
  }

  dimension: vendor_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.vendor_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	outbound_filename,
	vendor_display_name,
	clients.client_id,
	clients.client_name,
	vendors.id,
	vendors.name,
	vendors.outbound_filename,
	vendors.canonical_name
	]
  }

}
