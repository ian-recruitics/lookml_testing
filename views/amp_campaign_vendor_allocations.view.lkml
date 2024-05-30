# The name of this view in Looker is "Amp Campaign Vendor Allocations"
view: amp_campaign_vendor_allocations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.amp_campaign_vendor_allocations ;;
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

  dimension: vendor {
    type: string
    sql: ${TABLE}.vendor ;;
  }
  measure: count {
    type: count
    drill_fields: [id, clients.client_id, clients.client_name, campaigns.campaign_id, campaigns.campaign_name]
  }
}
