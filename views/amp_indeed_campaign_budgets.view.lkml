# The name of this view in Looker is "Amp Indeed Campaign Budgets"
view: amp_indeed_campaign_budgets {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.amp_indeed_campaign_budgets ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

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
  measure: count {
    type: count
    drill_fields: [clients.client_id, clients.client_name, campaigns.campaign_id, campaigns.campaign_name]
  }
}
