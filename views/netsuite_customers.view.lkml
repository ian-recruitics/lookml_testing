# The name of this view in Looker is "Netsuite Customers"
view: netsuite_customers {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.netsuite_customers ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Classification Category" in Explore.

  dimension: classification_category {
    type: number
    sql: ${TABLE}.classification_category ;;
  }

  dimension: currency_name {
    type: string
    sql: ${TABLE}.currency_name ;;
  }

  dimension: currency_symbol {
    type: string
    sql: ${TABLE}.currency_symbol ;;
  }

  dimension: customer_category {
    type: number
    sql: ${TABLE}.customer_category ;;
  }

  dimension: customer_classification {
    type: string
    sql: ${TABLE}.customer_classification ;;
  }

  dimension: customer_internal_id {
    type: number
    sql: ${TABLE}.customer_internal_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: date_deleted {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.date_deleted ;;
  }

  dimension: economic_sector {
    type: string
    sql: ${TABLE}.economic_sector ;;
  }

  dimension: economic_sub_sector {
    type: string
    sql: ${TABLE}.economic_sub_sector ;;
  }

  dimension: email_address {
    type: string
    sql: ${TABLE}.email_address ;;
  }

  dimension: employee_count {
    type: number
    sql: ${TABLE}.employee_count ;;
  }

  dimension: entity_contact_title {
    type: string
    sql: ${TABLE}.entity_contact_title ;;
  }

  dimension: entity_id {
    type: string
    sql: ${TABLE}.entity_id ;;
  }

  dimension: entity_number {
    type: number
    sql: ${TABLE}.entity_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_entity_number {
    type: sum
    sql: ${entity_number} ;;  }
  measure: average_entity_number {
    type: average
    sql: ${entity_number} ;;  }

  dimension: entity_status {
    type: number
    sql: ${TABLE}.entity_status ;;
  }

  dimension: entity_title {
    type: string
    sql: ${TABLE}.entity_title ;;
  }

  dimension_group: first_order {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_order_date ;;
  }

  dimension_group: first_sale {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.first_sale_date ;;
  }

  dimension: industry_group {
    type: string
    sql: ${TABLE}.industry_group ;;
  }

  dimension: naics_industry {
    type: string
    sql: ${TABLE}.naics_industry ;;
  }

  dimension: naics_us_code {
    type: string
    sql: ${TABLE}.naics_us_code ;;
  }

  dimension: naics_us_title {
    type: string
    sql: ${TABLE}.naics_us_title ;;
  }

  dimension: national_industry {
    type: string
    sql: ${TABLE}.national_industry ;;
  }

  dimension: netsuite_alternate_company_name {
    type: string
    sql: ${TABLE}.netsuite_alternate_company_name ;;
  }

  dimension: netsuite_client_id {
    type: string
    sql: ${TABLE}.netsuite_client_id ;;
  }

  dimension: netsuite_company_name {
    type: string
    sql: ${TABLE}.netsuite_company_name ;;
  }

  dimension_group: onboarding_completion {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.onboarding_completion_date ;;
  }

  dimension: overdue_balance_search {
    type: number
    sql: ${TABLE}.overdue_balance_search ;;
  }

  dimension: parent_company {
    type: string
    sql: ${TABLE}.parent_company ;;
  }

  dimension: parent_id {
    type: number
    sql: ${TABLE}.parent_id ;;
  }

  dimension: sales_rep_id {
    type: number
    sql: ${TABLE}.sales_rep_id ;;
  }

  dimension: search_stage {
    type: string
    sql: ${TABLE}.search_stage ;;
  }

  dimension_group: start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.start_date ;;
  }

  dimension: unbilled_orders_search {
    type: number
    sql: ${TABLE}.unbilled_orders_search ;;
  }
  measure: count {
    type: count
    drill_fields: [netsuite_company_name, netsuite_alternate_company_name, currency_name]
  }
}
