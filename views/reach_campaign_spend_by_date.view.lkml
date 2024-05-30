# The name of this view in Looker is "Reach Campaign Spend By Date"
view: reach_campaign_spend_by_date {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reach_campaign_spend_by_date ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Active" in Explore.

  dimension: active {
    type: yesno
    sql: ${TABLE}.active ;;
  }

  dimension: applies_goal {
    type: number
    sql: ${TABLE}.applies_goal ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_applies_goal {
    type: sum
    sql: ${applies_goal} ;;  }
  measure: average_applies_goal {
    type: average
    sql: ${applies_goal} ;;  }

  dimension: archived {
    type: yesno
    sql: ${TABLE}.archived ;;
  }

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: campaign_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.campaign_created_at ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.campaign_name ;;
  }

  dimension_group: campaign_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.campaign_updated_at ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: cpa_goal {
    type: number
    sql: ${TABLE}.cpa_goal ;;
  }

  dimension_group: date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date ;;
  }

  dimension_group: end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.end_date ;;
  }

  dimension_group: expired {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.expired_at ;;
  }

  dimension_group: last_updated_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_updated_timestamp ;;
  }

  dimension: monthly_recurring {
    type: yesno
    sql: ${TABLE}.monthly_recurring ;;
  }

  dimension: recruitics_campaign {
    type: string
    sql: ${TABLE}.recruitics_campaign ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.start_date ;;
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
  measure: count {
    type: count
    drill_fields: [id, campaign_name, clients.client_id, clients.client_name]
  }
}
