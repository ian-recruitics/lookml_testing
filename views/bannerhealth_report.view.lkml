# The name of this view in Looker is "Bannerhealth Report"
view: bannerhealth_report {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.bannerhealth_report ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Ad Group" in Explore.

  dimension: ad_group {
    type: string
    sql: ${TABLE}.ad_group ;;
  }

  dimension: ad_group_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ad_group_id ;;
  }

  dimension: apply_flow_id {
    type: string
    sql: ${TABLE}.apply_flow_id ;;
  }

  dimension: attributed_ad_id {
    type: string
    sql: ${TABLE}.attributed_ad_id ;;
  }

  dimension: attributed_campaign_name {
    type: string
    sql: ${TABLE}.attributed_campaign_name ;;
  }

  dimension: attributed_source {
    type: string
    sql: ${TABLE}.attributed_source ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.company_name ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: event_bucket {
    type: string
    sql: ${TABLE}.event_bucket ;;
  }

  dimension: job_category {
    type: string
    sql: ${TABLE}.job_category ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension: job_specialty {
    type: string
    sql: ${TABLE}.job_specialty ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: job_type {
    type: string
    sql: ${TABLE}.job_type ;;
  }

  dimension: medium {
    type: string
    sql: ${TABLE}.medium ;;
  }

  dimension: paid_events {
    type: number
    sql: ${TABLE}.paid_events ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_paid_events {
    type: sum
    sql: ${paid_events} ;;  }
  measure: average_paid_events {
    type: average
    sql: ${paid_events} ;;  }

  dimension: raw_spend {
    type: number
    sql: ${TABLE}.raw_spend ;;
  }

  dimension: sequence {
    type: number
    sql: ${TABLE}.sequence ;;
  }

  dimension: shift {
    type: string
    sql: ${TABLE}.shift ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: timestamp {
    type: string
    sql: ${TABLE}.timestamp ;;
  }

  dimension: total_events {
    type: number
    sql: ${TABLE}.total_events ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	attributed_campaign_name,
	company_name,
	clients.client_id,
	clients.client_name,
	ad_groups.id,
	ad_groups.name
	]
  }

}
