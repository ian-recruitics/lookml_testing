# The name of this view in Looker is "Netsuite Journal Entry Sales Order Link Transaction Lines"
view: netsuite_journal_entry_sales_order_link_transaction_lines {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.netsuite_journal_entry_sales_order_link_transaction_lines ;;
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
    # This dimension will be called "Accounting Line Type" in Explore.

  dimension: accounting_line_type {
    type: string
    sql: ${TABLE}.accounting_line_type ;;
  }

  dimension: amount_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.amount_paid ;;
  }

  dimension: amount_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.amount_unpaid ;;
  }

  dimension: client_finance_coordinator {
    type: number
    sql: ${TABLE}.client_finance_coordinator ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: closed {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.closed_date ;;
  }

  dimension: contract_classification_name {
    type: string
    sql: ${TABLE}.contract_classification_name ;;
  }

  dimension: cos {
    type: number
    sql: ${TABLE}.cos ;;
  }

  dimension: cos_account_display_name {
    type: string
    sql: ${TABLE}.cos_account_display_name ;;
  }

  dimension: cos_account_display_name_hierarchy {
    type: string
    sql: ${TABLE}.cos_account_display_name_hierarchy ;;
  }

  dimension: cos_account_number {
    type: string
    sql: ${TABLE}.cos_account_number ;;
  }

  dimension: cos_account_search_display_name {
    type: string
    sql: ${TABLE}.cos_account_search_display_name ;;
  }

  dimension: cost_data_per_spend {
    type: number
    sql: ${TABLE}.cost_data_per_spend ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_cost_data_per_spend {
    type: sum
    sql: ${cost_data_per_spend} ;;  }
  measure: average_cost_data_per_spend {
    type: average
    sql: ${cost_data_per_spend} ;;  }

  dimension: cost_of_sale_rec_account_id {
    type: number
    sql: ${TABLE}.cost_of_sale_rec_account_id ;;
  }

  dimension: created_from_id {
    type: number
    sql: ${TABLE}.created_from_id ;;
  }

  dimension: credit_amount {
    type: number
    sql: ${TABLE}.credit_amount ;;
  }

  dimension: credit_foreign_amount {
    type: number
    sql: ${TABLE}.credit_foreign_amount ;;
  }

  dimension: debit_amount {
    type: number
    sql: ${TABLE}.debit_amount ;;
  }

  dimension: debit_foreign_amount {
    type: number
    sql: ${TABLE}.debit_foreign_amount ;;
  }

  dimension: department_id {
    type: number
    sql: ${TABLE}.department_id ;;
  }

  dimension: discount_percent {
    type: number
    sql: ${TABLE}.discount_percent ;;
  }

  dimension: discount_percent_override {
    type: number
    sql: ${TABLE}.discount_percent_override ;;
  }

  dimension: document_number {
    type: string
    sql: ${TABLE}.document_number ;;
  }

  dimension: entity_id {
    type: number
    sql: ${TABLE}.entity_id ;;
  }

  dimension: exchange_rate {
    type: number
    sql: ${TABLE}.exchange_rate ;;
  }

  dimension: expense_account_display_name {
    type: string
    sql: ${TABLE}.expense_account_display_name ;;
  }

  dimension: expense_account_display_name_hierarchy {
    type: string
    sql: ${TABLE}.expense_account_display_name_hierarchy ;;
  }

  dimension: expense_account_id {
    type: number
    sql: ${TABLE}.expense_account_id ;;
  }

  dimension: expense_account_number {
    type: string
    sql: ${TABLE}.expense_account_number ;;
  }

  dimension: expense_account_search_display_name {
    type: string
    sql: ${TABLE}.expense_account_search_display_name ;;
  }

  dimension: foreign_amount {
    type: number
    sql: ${TABLE}.foreign_amount ;;
  }

  dimension: full_parent_team_name {
    type: string
    sql: ${TABLE}.full_parent_team_name ;;
  }

  dimension: full_team_name {
    type: string
    sql: ${TABLE}.full_team_name ;;
  }

  dimension: generalized_item_name {
    type: string
    sql: ${TABLE}.generalized_item_name ;;
  }

  dimension: gross_amt {
    type: number
    sql: ${TABLE}.gross_amt ;;
  }

  dimension: income_account_display_name {
    type: string
    sql: ${TABLE}.income_account_display_name ;;
  }

  dimension: income_account_display_name_hierarchy {
    type: string
    sql: ${TABLE}.income_account_display_name_hierarchy ;;
  }

  dimension: income_account_id {
    type: number
    sql: ${TABLE}.income_account_id ;;
  }

  dimension: income_account_number {
    type: string
    sql: ${TABLE}.income_account_number ;;
  }

  dimension: income_account_search_display_name {
    type: string
    sql: ${TABLE}.income_account_search_display_name ;;
  }

  dimension: ir_custom_link {
    type: number
    sql: ${TABLE}.ir_custom_link ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: item_memo {
    type: string
    sql: ${TABLE}.item_memo ;;
  }

  dimension: item_receipt_custom_record_link {
    type: number
    sql: ${TABLE}.item_receipt_custom_record_link ;;
  }

  dimension: je_account_display_name {
    type: string
    sql: ${TABLE}.je_account_display_name ;;
  }

  dimension: je_account_number {
    type: string
    sql: ${TABLE}.je_account_number ;;
  }

  dimension: je_account_search_display_name {
    type: string
    sql: ${TABLE}.je_account_search_display_name ;;
  }

  dimension: je_expense_account_id {
    type: number
    sql: ${TABLE}.je_expense_account_id ;;
  }

  dimension: line_item_name {
    type: string
    sql: ${TABLE}.line_item_name ;;
  }

  dimension: location_2 {
    type: number
    sql: ${TABLE}.location_2 ;;
  }

  dimension: location_id {
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: markup_amt {
    type: number
    sql: ${TABLE}.markup_amt ;;
  }

  dimension: net_amount {
    type: number
    sql: ${TABLE}.net_amount ;;
  }

  dimension: original_rev_rec_je {
    type: number
    sql: ${TABLE}.original_rev_rec_je ;;
  }

  dimension: parent_team_name {
    type: string
    sql: ${TABLE}.parent_team_name ;;
  }

  dimension: po_line_sequence_number {
    type: number
    sql: ${TABLE}.po_line_sequence_number ;;
  }

  dimension: purchase_order_number {
    type: string
    sql: ${TABLE}.purchase_order_number ;;
  }

  dimension: quantity {
    type: number
    sql: ${TABLE}.quantity ;;
  }

  dimension: quantity_billed {
    type: number
    sql: ${TABLE}.quantity_billed ;;
  }

  dimension: quantity_rate {
    type: number
    sql: ${TABLE}.quantity_rate ;;
  }

  dimension: quantity_rate_amount {
    type: number
    sql: ${TABLE}.quantity_rate_amount ;;
  }

  dimension: quantity_received {
    type: number
    sql: ${TABLE}.quantity_received ;;
  }

  dimension: quantity_rejected {
    type: number
    sql: ${TABLE}.quantity_rejected ;;
  }

  dimension: rev_cos_name {
    type: string
    sql: ${TABLE}.rev_cos_name ;;
  }

  dimension: revenue_account_display_name {
    type: string
    sql: ${TABLE}.revenue_account_display_name ;;
  }

  dimension: revenue_account_display_name_hierarchy {
    type: string
    sql: ${TABLE}.revenue_account_display_name_hierarchy ;;
  }

  dimension: revenue_account_search_display_name {
    type: string
    sql: ${TABLE}.revenue_account_search_display_name ;;
  }

  dimension: revenue_rec_account_id {
    type: number
    sql: ${TABLE}.revenue_rec_account_id ;;
  }

  dimension: revenue_rec_account_number {
    type: string
    sql: ${TABLE}.revenue_rec_account_number ;;
  }

  dimension: sales_order_link {
    type: number
    sql: ${TABLE}.sales_order_link ;;
  }

  dimension: subsidiary_id {
    type: number
    sql: ${TABLE}.subsidiary_id ;;
  }

  dimension: subsidiary_name {
    type: string
    sql: ${TABLE}.subsidiary_name ;;
  }

  dimension: tax_line {
    type: yesno
    sql: ${TABLE}.tax_line ;;
  }

  dimension: tax_rate_percent {
    type: number
    sql: ${TABLE}.tax_rate_percent ;;
  }

  dimension: team_name {
    type: string
    sql: ${TABLE}.team_name ;;
  }

  dimension: transaction_internal_id {
    type: number
    sql: ${TABLE}.transaction_internal_id ;;
  }

  dimension: transaction_item_type {
    type: string
    sql: ${TABLE}.transaction_item_type ;;
  }

  dimension: transaction_line_id {
    type: number
    sql: ${TABLE}.transaction_line_id ;;
  }

  dimension: transaction_line_item_id {
    type: number
    sql: ${TABLE}.transaction_line_item_id ;;
  }

  dimension: vendor_custom_column {
    type: number
    sql: ${TABLE}.vendor_custom_column ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	id,
	je_account_search_display_name,
	je_account_display_name,
	income_account_search_display_name,
	income_account_display_name,
	expense_account_search_display_name,
	expense_account_display_name,
	revenue_account_search_display_name,
	revenue_account_display_name,
	cos_account_search_display_name,
	cos_account_display_name,
	rev_cos_name,
	line_item_name,
	full_team_name,
	team_name,
	subsidiary_name,
	parent_team_name,
	generalized_item_name,
	full_parent_team_name,
	contract_classification_name
	]
  }

}
