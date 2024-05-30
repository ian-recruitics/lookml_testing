# The name of this view in Looker is "Reach Vendor Recommendation Ranking"
view: reach_vendor_recommendation_ranking {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reach_vendor_recommendation_ranking ;;
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
    # This dimension will be called "Achieved Applies" in Explore.

  dimension: achieved_applies {
    type: number
    sql: ${TABLE}.achieved_applies ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_achieved_applies {
    type: sum
    sql: ${achieved_applies} ;;  }
  measure: average_achieved_applies {
    type: average
    sql: ${achieved_applies} ;;  }

  dimension: achieved_cpa {
    type: number
    sql: ${TABLE}.achieved_cpa ;;
  }

  dimension: achieved_jobviews {
    type: number
    sql: ${TABLE}.achieved_jobviews ;;
  }

  dimension: achieved_total_spend {
    type: number
    sql: ${TABLE}.achieved_total_spend ;;
  }

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

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }

  dimension: vendor_ranking {
    type: number
    sql: ${TABLE}.vendor_ranking ;;
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
	clients.client_id,
	clients.client_name,
	campaigns.campaign_id,
	campaigns.campaign_name
	]
  }

}
