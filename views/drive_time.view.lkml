# The name of this view in Looker is "Drive Time"
view: drive_time {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: reporting.drive_time ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Distance Miles" in Explore.

  dimension: distance_miles {
    type: string
    sql: ${TABLE}.distance_miles ;;
  }

  dimension: drivetime_minutes {
    type: string
    sql: ${TABLE}.drivetime_minutes ;;
  }

  dimension: origin_cbsa_name {
    type: string
    sql: ${TABLE}.origin_cbsa_name ;;
  }

  dimension: origin_city {
    type: string
    sql: ${TABLE}.origin_city ;;
  }

  dimension: origin_county {
    type: string
    sql: ${TABLE}.origin_county ;;
  }

  dimension: origin_lat {
    type: string
    sql: ${TABLE}.origin_lat ;;
  }

  dimension: origin_long {
    type: string
    sql: ${TABLE}.origin_long ;;
  }

  dimension: origin_state {
    type: string
    sql: ${TABLE}.origin_state ;;
  }

  dimension: origin_zip {
    type: string
    sql: ${TABLE}.origin_zip ;;
  }

  dimension: remote_cbsa_name {
    type: string
    sql: ${TABLE}.remote_cbsa_name ;;
  }

  dimension: remote_city {
    type: string
    sql: ${TABLE}.remote_city ;;
  }

  dimension: remote_county {
    type: string
    sql: ${TABLE}.remote_county ;;
  }

  dimension: remote_lat {
    type: string
    sql: ${TABLE}.remote_lat ;;
  }

  dimension: remote_long {
    type: string
    sql: ${TABLE}.remote_long ;;
  }

  dimension: remote_state {
    type: string
    sql: ${TABLE}.remote_state ;;
  }

  dimension: remote_zip {
    type: string
    sql: ${TABLE}.remote_zip ;;
  }
  measure: count {
    type: count
    drill_fields: [origin_cbsa_name, remote_cbsa_name]
  }
}
