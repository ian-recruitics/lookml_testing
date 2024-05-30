# The name of this view in Looker is "Amp Daterange Exclusions Levers Reporting"
view: amp_daterange_exclusions_levers_reporting {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.amp_daterange_exclusions_levers_reporting ;;
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
    # This dimension will be called "Client ID" in Explore.

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

  dimension_group: exclude {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.exclude_date ;;
  }

  dimension_group: last_updated {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_updated ;;
  }

  dimension: source {
    type: string
    sql: ${TABLE}.source ;;
  }
  measure: count {
    type: count
    drill_fields: [id, client_name, clients.client_id, clients.client_name]
  }
}
