# The name of this view in Looker is "Reduced Jobs Data"
view: reduced_jobs_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.reduced_jobs_data ;;
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
    # This dimension will be called "Amp Market" in Explore.

  dimension: amp_market {
    type: string
    sql: ${TABLE}.amp_market ;;
  }

  dimension: amp_purpose_flag {
    type: string
    sql: ${TABLE}.amp_purpose_flag ;;
  }

  dimension: amp_role_type {
    type: string
    sql: ${TABLE}.amp_role_type ;;
  }

  dimension: amp_submarket {
    type: string
    sql: ${TABLE}.amp_submarket ;;
  }

  dimension: amp_template_id {
    type: string
    sql: ${TABLE}.amp_template_id ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: client_created_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.client_created_timestamp ;;
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

  dimension: custom_data1 {
    type: string
    sql: ${TABLE}.custom_data1 ;;
  }

  dimension: custom_data10 {
    type: string
    sql: ${TABLE}.custom_data10 ;;
  }

  dimension: custom_data11 {
    type: string
    sql: ${TABLE}.custom_data11 ;;
  }

  dimension: custom_data12 {
    type: string
    sql: ${TABLE}.custom_data12 ;;
  }

  dimension: custom_data2 {
    type: string
    sql: ${TABLE}.custom_data2 ;;
  }

  dimension: custom_data3 {
    type: string
    sql: ${TABLE}.custom_data3 ;;
  }

  dimension: custom_data4 {
    type: string
    sql: ${TABLE}.custom_data4 ;;
  }

  dimension: custom_data5 {
    type: string
    sql: ${TABLE}.custom_data5 ;;
  }

  dimension: custom_data6 {
    type: string
    sql: ${TABLE}.custom_data6 ;;
  }

  dimension: custom_data7 {
    type: string
    sql: ${TABLE}.custom_data7 ;;
  }

  dimension: custom_data8 {
    type: string
    sql: ${TABLE}.custom_data8 ;;
  }

  dimension: custom_data9 {
    type: string
    sql: ${TABLE}.custom_data9 ;;
  }

  dimension: custom_number1 {
    type: number
    sql: ${TABLE}.custom_number1 ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_custom_number1 {
    type: sum
    sql: ${custom_number1} ;;  }
  measure: average_custom_number1 {
    type: average
    sql: ${custom_number1} ;;  }

  dimension: custom_number2 {
    type: number
    sql: ${TABLE}.custom_number2 ;;
  }

  dimension: custom_number3 {
    type: number
    sql: ${TABLE}.custom_number3 ;;
  }

  dimension: description {
    type: string
    sql: ${TABLE}.description ;;
  }

  dimension: education {
    type: string
    sql: ${TABLE}.education ;;
  }

  dimension_group: estimated_job_end {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.estimated_job_end_date ;;
  }

  dimension_group: estimated_job_start {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.estimated_job_start_date ;;
  }

  dimension: experience {
    type: string
    sql: ${TABLE}.experience ;;
  }

  dimension: featured {
    type: yesno
    sql: ${TABLE}.featured ;;
  }

  dimension: is_expansion_job {
    type: yesno
    sql: ${TABLE}.is_expansion_job ;;
  }

  dimension: is_most_recent {
    type: yesno
    sql: ${TABLE}.is_most_recent ;;
  }

  dimension: job_age {
    type: number
    sql: ${TABLE}.job_age ;;
  }

  dimension: job_category {
    type: string
    sql: ${TABLE}.job_category ;;
  }

  dimension_group: job_expiration {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.job_expiration_date ;;
  }

  dimension: job_id {
    type: string
    sql: ${TABLE}.job_id ;;
  }

  dimension_group: job_import_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.job_import_timestamp ;;
  }

  dimension: job_specialty {
    type: string
    sql: ${TABLE}.job_specialty ;;
  }

  dimension: job_status {
    type: string
    sql: ${TABLE}.job_status ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.job_title ;;
  }

  dimension: job_type {
    type: string
    sql: ${TABLE}.job_type ;;
  }

  dimension: job_url {
    type: string
    sql: ${TABLE}.job_url ;;
  }

  dimension: normalized_country {
    type: string
    sql: ${TABLE}.normalized_country ;;
  }

  dimension: normalized_region {
    type: string
    sql: ${TABLE}.normalized_region ;;
  }

  dimension: onet_code {
    type: string
    sql: ${TABLE}.onet_code ;;
  }

  dimension: onet_matchscore {
    type: number
    sql: ${TABLE}.onet_matchscore ;;
  }

  dimension: onet_title {
    type: string
    sql: ${TABLE}.onet_title ;;
  }

  dimension: parent_job_id {
    type: string
    sql: ${TABLE}.parent_job_id ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}.postal_code ;;
  }

  dimension: salary {
    type: string
    sql: ${TABLE}.salary ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }
  measure: count {
    type: count
    drill_fields: [id, company_name, clients.client_id, clients.client_name]
  }
}
