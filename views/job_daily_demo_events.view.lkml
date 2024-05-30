# The name of this view in Looker is "Job Daily Demo Events"
view: job_daily_demo_events {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.job_daily_demo_events ;;
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

  dimension: attributed_reach_traffic_type {
    type: string
    sql: ${TABLE}.attributed_reach_traffic_type ;;
  }

  dimension: attributed_source {
    type: string
    sql: ${TABLE}.attributed_source ;;
  }

  dimension: attributed_vendor_channel {
    type: string
    sql: ${TABLE}.attributed_vendor_channel ;;
  }

  dimension: attributed_vendor_platform {
    type: string
    sql: ${TABLE}.attributed_vendor_platform ;;
  }

  dimension: attributed_vendor_product {
    type: string
    sql: ${TABLE}.attributed_vendor_product ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: count_apply_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_apply_paid ;;
  }

  dimension: count_apply_start_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_apply_start_paid ;;
  }

  dimension: count_apply_start_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_apply_start_unpaid ;;
  }

  dimension: count_apply_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_apply_unpaid ;;
  }

  dimension: count_ats_apply_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_ats_apply_paid ;;
  }

  dimension: count_ats_apply_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_ats_apply_unpaid ;;
  }

  dimension: count_jobview_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_jobview_paid ;;
  }

  dimension: count_jobview_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_jobview_unpaid ;;
  }

  dimension: count_longform_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_longform_paid ;;
  }

  dimension: count_longform_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_longform_unpaid ;;
  }

  dimension: count_pageview_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_pageview_paid ;;
  }

  dimension: count_pageview_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_pageview_unpaid ;;
  }

  dimension: count_register_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_register_paid ;;
  }

  dimension: count_register_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_register_unpaid ;;
  }

  dimension: count_shortform_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_shortform_paid ;;
  }

  dimension: count_shortform_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_shortform_unpaid ;;
  }

  dimension: count_signup_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_signup_paid ;;
  }

  dimension: count_signup_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_signup_unpaid ;;
  }

  dimension: count_unknown_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_unknown_paid ;;
  }

  dimension: count_unknown_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_unknown_unpaid ;;
  }

  dimension: count_vendor_quick_apply_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_vendor_quick_apply_paid ;;
  }

  dimension: count_vendor_quick_apply_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.count_vendor_quick_apply_unpaid ;;
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

  dimension: device_type {
    type: string
    sql: ${TABLE}.device_type ;;
  }

  dimension: is_hot {
    type: yesno
    sql: ${TABLE}.is_hot ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension_group: last_processed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_processed_date ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: sum_of_client_gross_spend {
    type: number
    sql: ${TABLE}.sum_of_client_gross_spend ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sum_of_client_gross_spend {
    type: sum
    sql: ${sum_of_client_gross_spend} ;;  }
  measure: average_sum_of_client_gross_spend {
    type: average
    sql: ${sum_of_client_gross_spend} ;;  }

  dimension: sum_of_client_raw_gross_spend {
    type: number
    sql: ${TABLE}.sum_of_client_raw_gross_spend ;;
  }

  dimension: sum_of_vendor_gross_spend {
    type: number
    sql: ${TABLE}.sum_of_vendor_gross_spend ;;
  }

  dimension: traffic_type {
    type: string
    sql: ${TABLE}.traffic_type ;;
  }
  measure: count {
    type: count
    drill_fields: [id, attributed_campaign_name, clients.client_id, clients.client_name]
  }
}
