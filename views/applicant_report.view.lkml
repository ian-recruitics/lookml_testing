# The name of this view in Looker is "Applicant Report"
view: applicant_report {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.applicant_report ;;
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
    # This dimension will be called "Applicant Tracking System" in Explore.

  dimension: applicant_tracking_system {
    type: string
    sql: ${TABLE}.applicant_tracking_system ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: apply {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.apply_date ;;
  }

  dimension: apply_flow_id {
    type: string
    sql: ${TABLE}.apply_flow_id ;;
  }

  dimension: apply_flow_id_hash {
    type: string
    sql: ${TABLE}.apply_flow_id_hash ;;
  }

  dimension_group: apply_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.apply_timestamp ;;
  }

  dimension: attributed_ad_group_id {
    type: string
    sql: ${TABLE}.attributed_ad_group_id ;;
  }

  dimension: attributed_ad_id {
    type: string
    sql: ${TABLE}.attributed_ad_id ;;
  }

  dimension: attributed_campaign_tag {
    type: string
    sql: ${TABLE}.attributed_campaign_tag ;;
  }

  dimension: attributed_event_id {
    type: string
    sql: ${TABLE}.attributed_event_id ;;
  }

  dimension: attributed_publisher_click_id {
    type: string
    sql: ${TABLE}.attributed_publisher_click_id ;;
  }

  dimension: attributed_source {
    type: string
    sql: ${TABLE}.attributed_source ;;
  }

  dimension: attributed_vendor_product {
    type: string
    sql: ${TABLE}.attributed_vendor_product ;;
  }

  dimension: client_gross {
    type: number
    sql: ${TABLE}.client_gross ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_client_gross {
    type: sum
    sql: ${client_gross} ;;  }
  measure: average_client_gross {
    type: average
    sql: ${client_gross} ;;  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension_group: estimated_job_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.estimated_job_start_date ;;
  }

  dimension_group: event {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }

  dimension: event_group {
    type: string
    sql: ${TABLE}.event_group ;;
  }

  dimension: funnel_name {
    type: string
    sql: ${TABLE}.funnel_name ;;
  }

  dimension: is_in_progress_event {
    type: yesno
    sql: ${TABLE}.is_in_progress_event ;;
  }

  dimension: is_quality_event {
    type: yesno
    sql: ${TABLE}.is_quality_event ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension_group: jobview_cohort {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.jobview_cohort_date ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: paid {
    type: yesno
    sql: ${TABLE}.paid ;;
  }

  dimension: reporting_name {
    type: string
    sql: ${TABLE}.reporting_name ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: traffic_type {
    type: string
    sql: ${TABLE}.traffic_type ;;
  }
  measure: count {
    type: count
    drill_fields: [id, funnel_name, reporting_name, clients.client_id, clients.client_name]
  }
}
