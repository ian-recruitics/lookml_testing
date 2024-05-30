# The name of this view in Looker is "Transaction Daily Performance Without Billable Spend"
view: transaction_daily_performance_without_billable_spend {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.transaction_daily_performance_without_billable_spend ;;
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

  dimension: attributed_vendor_product {
    type: string
    sql: ${TABLE}.attributed_vendor_product ;;
  }

  dimension: billable_spend {
    type: number
    sql: ${TABLE}.billable_spend ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_billable_spend {
    type: sum
    sql: ${billable_spend} ;;  }
  measure: average_billable_spend {
    type: average
    sql: ${billable_spend} ;;  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: count_apply {
    type: number
    sql: ${TABLE}.count_apply ;;
  }

  dimension: count_apply_start {
    type: number
    sql: ${TABLE}.count_apply_start ;;
  }

  dimension: count_ats_apply {
    type: number
    sql: ${TABLE}.count_ats_apply ;;
  }

  dimension: count_jobview {
    type: number
    sql: ${TABLE}.count_jobview ;;
  }

  dimension: count_longform {
    type: number
    sql: ${TABLE}.count_longform ;;
  }

  dimension: count_pageview {
    type: number
    sql: ${TABLE}.count_pageview ;;
  }

  dimension: count_register {
    type: number
    sql: ${TABLE}.count_register ;;
  }

  dimension: count_shortform {
    type: number
    sql: ${TABLE}.count_shortform ;;
  }

  dimension: count_signup {
    type: number
    sql: ${TABLE}.count_signup ;;
  }

  dimension: count_unknown {
    type: number
    sql: ${TABLE}.count_unknown ;;
  }

  dimension: count_vendor_quick_apply {
    type: number
    sql: ${TABLE}.count_vendor_quick_apply ;;
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

  dimension: paid {
    type: yesno
    sql: ${TABLE}.paid ;;
  }

  dimension: rx_ad {
    type: string
    sql: ${TABLE}.rx_ad ;;
  }

  dimension: source_type {
    type: string
    sql: ${TABLE}.source_type ;;
  }

  dimension: sum_of_client_gross_spend {
    type: number
    sql: ${TABLE}.sum_of_client_gross_spend ;;
  }

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

  dimension: transaction_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  dimension_group: transaction_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.transaction_start_date ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }
  measure: count {
    type: count
    drill_fields: [id, attributed_campaign_name, transactions.id, clients.client_id, clients.client_name]
  }
}
