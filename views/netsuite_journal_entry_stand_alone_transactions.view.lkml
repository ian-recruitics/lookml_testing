# The name of this view in Looker is "Netsuite Journal Entry Stand Alone Transactions"
view: netsuite_journal_entry_stand_alone_transactions {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.netsuite_journal_entry_stand_alone_transactions ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Adobe Sign Status" in Explore.

  dimension: adobe_sign_status {
    type: string
    sql: ${TABLE}.adobe_sign_status ;;
  }

  dimension: agency_retainer {
    type: number
    sql: ${TABLE}.agency_retainer ;;
  }

  dimension: audit_adjustment {
    type: string
    sql: ${TABLE}.audit_adjustment ;;
  }

  dimension: auto_renewal {
    type: string
    sql: ${TABLE}.auto_renewal ;;
  }

  dimension: billing_address_line_1 {
    type: string
    sql: ${TABLE}.billing_address_line_1 ;;
  }

  dimension: billing_address_line_2 {
    type: string
    sql: ${TABLE}.billing_address_line_2 ;;
  }

  dimension: billing_address_line_3 {
    type: string
    sql: ${TABLE}.billing_address_line_3 ;;
  }

  dimension: billing_state {
    type: string
    sql: ${TABLE}.billing_state ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: close {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.close_date ;;
  }

  dimension: contract_allocation_avail {
    type: number
    sql: ${TABLE}.contract_allocation_avail ;;
  }

  dimension: contract_billable_flag {
    type: string
    sql: ${TABLE}.contract_billable_flag ;;
  }

  dimension: contract_billing_status {
    type: number
    sql: ${TABLE}.contract_billing_status ;;
  }

  dimension: contract_billing_status_name {
    type: string
    sql: ${TABLE}.contract_billing_status_name ;;
  }

  dimension: contract_invoice_total {
    type: number
    sql: ${TABLE}.contract_invoice_total ;;
  }

  dimension: contract_link_id {
    type: number
    sql: ${TABLE}.contract_link_id ;;
  }

  dimension: contract_max_so_month {
    type: string
    sql: ${TABLE}.contract_max_so_month ;;
  }

  dimension: contract_structure_name {
    type: string
    sql: ${TABLE}.contract_structure_name ;;
  }

  dimension: contract_total_allocated {
    type: number
    sql: ${TABLE}.contract_total_allocated ;;
  }

  dimension: contract_total_allocated_cm {
    type: number
    sql: ${TABLE}.contract_total_allocated_cm ;;
  }

  dimension: created_by_id {
    type: number
    sql: ${TABLE}.created_by_id ;;
  }

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_date ;;
  }

  dimension: currency_id {
    type: number
    sql: ${TABLE}.currency_id ;;
  }

  dimension: customer_transaction_reference_id {
    type: number
    sql: ${TABLE}.customer_transaction_reference_id ;;
  }

  dimension: document_number {
    type: number
    sql: ${TABLE}.document_number ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_document_number {
    type: sum
    sql: ${document_number} ;;  }
  measure: average_document_number {
    type: average
    sql: ${document_number} ;;  }

  dimension_group: due {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.due_date ;;
  }

  dimension: email_detail_flag {
    type: string
    sql: ${TABLE}.email_detail_flag ;;
  }

  dimension: emailed_manually {
    type: string
    sql: ${TABLE}.emailed_manually ;;
  }

  dimension_group: end_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.end_date ;;
  }

  dimension: exchange_rate {
    type: number
    sql: ${TABLE}.exchange_rate ;;
  }

  dimension_group: expiration {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.expiration_date ;;
  }

  dimension: foreign_amount_paid {
    type: number
    value_format_name: id
    sql: ${TABLE}.foreign_amount_paid ;;
  }

  dimension: foreign_amount_unpaid {
    type: number
    value_format_name: id
    sql: ${TABLE}.foreign_amount_unpaid ;;
  }

  dimension: foreign_total {
    type: number
    sql: ${TABLE}.foreign_total ;;
  }

  dimension: full_billing_address {
    type: string
    sql: ${TABLE}.full_billing_address ;;
  }

  dimension: full_parent_team_name {
    type: string
    sql: ${TABLE}.full_parent_team_name ;;
  }

  dimension: full_team_name {
    type: string
    sql: ${TABLE}.full_team_name ;;
  }

  dimension: gross_client_amt_not_rec {
    type: number
    sql: ${TABLE}.gross_client_amt_not_rec ;;
  }

  dimension: initial_contract_terms {
    type: number
    sql: ${TABLE}.initial_contract_terms ;;
  }

  dimension: insertion_order_term_name {
    type: string
    sql: ${TABLE}.insertion_order_term_name ;;
  }

  dimension_group: invoice_deadline {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.invoice_deadline ;;
  }

  dimension: is_deleted {
    type: yesno
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: item_receipt_link {
    type: number
    sql: ${TABLE}.item_receipt_link ;;
  }

  dimension: media_mgmt_fee {
    type: number
    sql: ${TABLE}.media_mgmt_fee ;;
  }

  dimension: media_mgmt_fee_pct {
    type: number
    sql: ${TABLE}.media_mgmt_fee_pct ;;
  }

  dimension: media_mgmt_minimum {
    type: number
    sql: ${TABLE}.media_mgmt_minimum ;;
  }

  dimension: memo {
    type: string
    sql: ${TABLE}.memo ;;
  }

  dimension: mkt_mgmt_fee_pct {
    type: number
    sql: ${TABLE}.mkt_mgmt_fee_pct ;;
  }

  dimension_group: next_renewal {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.next_renewal_date ;;
  }

  dimension: other_refnum {
    type: string
    sql: ${TABLE}.other_refnum ;;
  }

  dimension: parent_team_name {
    type: string
    sql: ${TABLE}.parent_team_name ;;
  }

  dimension: period_name {
    type: string
    sql: ${TABLE}.period_name ;;
  }

  dimension: po_client_gross_allocation_amt {
    type: number
    sql: ${TABLE}.po_client_gross_allocation_amt ;;
  }

  dimension_group: po_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.po_end_date ;;
  }

  dimension: po_net_revenue_review_check {
    type: number
    sql: ${TABLE}.po_net_revenue_review_check ;;
  }

  dimension: po_reconciled_revenue_amt {
    type: number
    sql: ${TABLE}.po_reconciled_revenue_amt ;;
  }

  dimension_group: po_start {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.po_start_date ;;
  }

  dimension: po_start_month_year {
    type: string
    sql: ${TABLE}.po_start_month_year ;;
  }

  dimension: po_vendor_gross_amt {
    type: number
    sql: ${TABLE}.po_vendor_gross_amt ;;
  }

  dimension_group: posting_period_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.posting_period_end_date ;;
  }

  dimension: posting_period_id {
    type: number
    sql: ${TABLE}.posting_period_id ;;
  }

  dimension_group: posting_period_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.posting_period_start_date ;;
  }

  dimension: printed_pdf_batch {
    type: string
    sql: ${TABLE}.printed_pdf_batch ;;
  }

  dimension: receipt_line_id {
    type: string
    sql: ${TABLE}.receipt_line_id ;;
  }

  dimension: record_type {
    type: string
    sql: ${TABLE}.record_type ;;
  }

  dimension: renewal_term {
    type: number
    sql: ${TABLE}.renewal_term ;;
  }

  dimension: sales_order_link {
    type: number
    sql: ${TABLE}.sales_order_link ;;
  }

  dimension_group: start_date {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.start_date ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: team_name {
    type: string
    sql: ${TABLE}.team_name ;;
  }

  dimension: term_name {
    type: string
    sql: ${TABLE}.term_name ;;
  }

  dimension: total_allocated {
    type: number
    sql: ${TABLE}.total_allocated ;;
  }

  dimension: tran_type_doc_number {
    type: string
    sql: ${TABLE}.tran_type_doc_number ;;
  }

  dimension: transaction_abbrev_type {
    type: string
    sql: ${TABLE}.transaction_abbrev_type ;;
  }

  dimension_group: transaction {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.transaction_date ;;
  }

  dimension: transaction_display_id {
    type: string
    sql: ${TABLE}.transaction_display_id ;;
  }

  dimension: transaction_display_name {
    type: string
    sql: ${TABLE}.transaction_display_name ;;
  }

  dimension: transaction_internal_id {
    type: number
    sql: ${TABLE}.transaction_internal_id ;;
  }

  dimension: transaction_number {
    type: string
    sql: ${TABLE}.transaction_number ;;
  }

  dimension: transaction_special_notes {
    type: string
    sql: ${TABLE}.transaction_special_notes ;;
  }

  dimension: transaction_type {
    type: string
    sql: ${TABLE}.transaction_type ;;
  }

  dimension_group: trial_end {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.trial_end_date ;;
  }

  dimension: vendor_bill_total {
    type: number
    sql: ${TABLE}.vendor_bill_total ;;
  }

  dimension: vendor_tag {
    type: string
    sql: ${TABLE}.vendor_tag ;;
  }

  dimension: vendor_transaction_reference_id {
    type: number
    sql: ${TABLE}.vendor_transaction_reference_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
	period_name,
	transaction_display_name,
	term_name,
	contract_structure_name,
	insertion_order_term_name,
	contract_billing_status_name,
	full_team_name,
	team_name,
	parent_team_name,
	full_parent_team_name
	]
  }

}
