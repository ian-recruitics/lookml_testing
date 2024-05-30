# The name of this view in Looker is "Reach Campaign Configuration"
view: reach_campaign_configuration {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reach_campaign_configuration ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

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

  dimension: client_type {
    type: string
    sql: ${TABLE}.client_type ;;
  }

  dimension: default_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.default_bid ;;
  }

  dimension: job_volume_limit {
    type: number
    sql: ${TABLE}.job_volume_limit ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_job_volume_limit {
    type: sum
    sql: ${job_volume_limit} ;;  }
  measure: average_job_volume_limit {
    type: average
    sql: ${job_volume_limit} ;;  }

  dimension: max_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.max_bid ;;
  }

  dimension: minimum_bid {
    type: number
    value_format_name: id
    sql: ${TABLE}.minimum_bid ;;
  }

  dimension: pace_to_date {
    type: number
    sql: ${TABLE}.pace_to_date ;;
  }

  dimension: send_disqualified_jobs {
    type: yesno
    sql: ${TABLE}.send_disqualified_jobs ;;
  }

  dimension: use_computed_default_bid {
    type: yesno
    sql: ${TABLE}.use_computed_default_bid ;;
  }
  measure: count {
    type: count
    drill_fields: [campaign_name, clients.client_id, clients.client_name, campaigns.campaign_id, campaigns.campaign_name]
  }
}
