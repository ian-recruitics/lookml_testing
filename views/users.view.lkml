# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.users ;;
  drill_fields: [user_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: user_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.user_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Active" in Explore.

  dimension: active {
    type: string
    sql: ${TABLE}.active ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_at {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension_group: current_sign_in {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.current_sign_in_at ;;
  }

  dimension: current_sign_in_ip {
    type: string
    sql: ${TABLE}.current_sign_in_ip ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: encrypted_password {
    type: string
    sql: ${TABLE}.encrypted_password ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: id {
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension_group: last_sign_in {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_sign_in_at ;;
  }

  dimension: last_sign_in_ip {
    type: string
    sql: ${TABLE}.last_sign_in_ip ;;
  }

  dimension: meta_data {
    type: string
    sql: ${TABLE}.meta_data ;;
  }

  dimension: provider {
    type: string
    sql: ${TABLE}.provider ;;
  }

  dimension_group: remember_created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.remember_created_at ;;
  }

  dimension_group: reset_password_sent {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.reset_password_sent_at ;;
  }

  dimension: reset_password_token {
    type: string
    sql: ${TABLE}.reset_password_token ;;
  }

  dimension: role {
    type: string
    sql: ${TABLE}.role ;;
  }

  dimension: sign_in_count {
    type: number
    sql: ${TABLE}.sign_in_count ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sign_in_count {
    type: sum
    sql: ${sign_in_count} ;;  }
  measure: average_sign_in_count {
    type: average
    sql: ${sign_in_count} ;;  }

  dimension_group: updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: user_job_filter_id {
    type: string
    sql: ${TABLE}.user_job_filter_id ;;
  }
  measure: count {
    type: count
    drill_fields: [user_id, first_name, last_name]
  }
}
