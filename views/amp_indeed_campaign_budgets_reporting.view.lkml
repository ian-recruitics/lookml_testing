# The name of this view in Looker is "Amp Indeed Campaign Budgets Reporting"
view: amp_indeed_campaign_budgets_reporting {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.amp_indeed_campaign_budgets_reporting ;;
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
    # This dimension will be called "Budget" in Explore.

  dimension: budget {
    type: number
    sql: ${TABLE}.budget ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_budget {
    type: sum
    sql: ${budget} ;;  }
  measure: average_budget {
    type: average
    sql: ${budget} ;;  }

  dimension: campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: campaign_tag {
    type: string
    sql: ${TABLE}.campaign_tag ;;
  }

  dimension: client_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.client_id ;;
  }

  dimension: client_name {
    type: string
    sql: ${TABLE}.client_name ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: last_algorithm_run {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_algorithm_run ;;
  }

  dimension: market {
    type: string
    sql: ${TABLE}.market ;;
  }

  dimension: role_type {
    type: string
    sql: ${TABLE}.role_type ;;
  }

  dimension: submarket {
    type: string
    sql: ${TABLE}.submarket ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	client_name,
	clients.client_id,
	clients.client_name,
	campaigns.campaign_id,
	campaigns.campaign_name
	]
  }

}
