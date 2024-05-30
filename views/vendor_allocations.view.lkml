# The name of this view in Looker is "Vendor Allocations"
view: vendor_allocations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.vendor_allocations ;;
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
    # This dimension will be called "Allocated Budget" in Explore.

  dimension: allocated_budget {
    type: number
    sql: ${TABLE}.allocated_budget ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_allocated_budget {
    type: sum
    sql: ${allocated_budget} ;;  }
  measure: average_allocated_budget {
    type: average
    sql: ${allocated_budget} ;;  }

  dimension: campaign_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.campaign_id ;;
  }

  dimension: cpa_goal {
    type: number
    sql: ${TABLE}.cpa_goal ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: vendor_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.vendor_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	name,
	campaigns.campaign_id,
	campaigns.campaign_name,
	vendors.id,
	vendors.name,
	vendors.outbound_filename,
	vendors.canonical_name
	]
  }

}
