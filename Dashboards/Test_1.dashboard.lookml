---
- dashboard: Test_1
  title: Test 1
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: YCWS7kvTmTdAafCih84IPR
  elements:
  - title: Job/Page View Trend
    name: Job/Page View Trend
    model: production_reporting_model
    explore: client_level_performance
    type: looker_line
    fields: [attributed_events_aggregate.total_jobview, attributed_events_aggregate.total_pageview,
      attributed_events_aggregate.date_week]
    fill_fields: [attributed_events_aggregate.date_week]
    filters: {}
    sorts: [attributed_events_aggregate.date_week desc]
    limit: 500
    column_limit: 50
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    x_axis_zoom: true
    y_axis_zoom: true
    series_colors:
      attributed_events_aggregate.total_pageview: "#185AD4"
    defaults_version: 1
    hidden_pivots: {}
    listen:
      Event Date: attributed_events_aggregate.date_date
      Attributed Source: attributed_events_aggregate.attributed_source
      Client ID: clients.client_id
    row: 0
    col: 0
    width: 11
    height: 8
  - title: Apply Trends
    name: Apply Trends
    model: production_reporting_model
    explore: client_level_performance
    type: looker_line
    fields: [attributed_events_aggregate.date_week, attributed_events_aggregate.total_apply,
      attributed_events_aggregate.total_vendor_quick_apply]
    fill_fields: [attributed_events_aggregate.date_week]
    filters: {}
    sorts: [attributed_events_aggregate.date_week desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      label: Quick Apply %
      value_format:
      value_format_name: percent_1
      calculation_type: percent_of_column_sum
      table_calculation: quick_apply
      args:
      - attributed_events_aggregate.total_apply
      _kind_hint: measure
      _type_hint: number
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    y_axes: [{label: '', orientation: left, series: [{axisId: attributed_events_aggregate.total_apply,
            id: attributed_events_aggregate.total_apply, name: Total Number of Apply
              Events}], showLabels: true, showValues: true, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{axisId: quick_apply, id: quick_apply, name: Quick Apply %}], showLabels: true,
        showValues: true, maxValue: 1, minValue: 0, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hidden_series: []
    series_types:
      attributed_events_aggregate.total_apply: column
    series_colors:
      quick_apply: "#185AD4"
    defaults_version: 1
    hidden_pivots: {}
    hidden_fields: [attributed_events_aggregate.total_vendor_quick_apply]
    listen:
      Event Date: attributed_events_aggregate.date_date
      Attributed Source: attributed_events_aggregate.attributed_source
      Client ID: clients.client_id
    row: 0
    col: 11
    width: 11
    height: 8
  - title: Active US Jobs Missing Postal Code
    name: Active US Jobs Missing Postal Code
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.postal_code: EMPTY
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 8
    col: 5
    width: 5
    height: 4
  - title: Active US Jobs w/No Location
    name: Active US Jobs w/No Location
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.city: EMPTY
      reduced_jobs_data.state: EMPTY
      reduced_jobs_data.postal_code: EMPTY
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 8
    col: 18
    width: 4
    height: 4
  - title: Active US Jobs
    name: Active US Jobs
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 8
    col: 0
    width: 5
    height: 4
  - title: Active US Jobs Missing State
    name: Active US Jobs Missing State
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.state: EMPTY
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 8
    col: 10
    width: 4
    height: 4
  - title: Active US Jobs Missing City
    name: Active US Jobs Missing City
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.city: EMPTY
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 8
    col: 14
    width: 4
    height: 4
  - title: Active US Jobs w/o ONET
    name: Active US Jobs w/o ONET
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.onet_code: ''
      reduced_jobs_data.onet_matchscore: "<40"
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 16
    col: 0
    width: 5
    height: 4
  - title: Active US Jobs with match below 70
    name: Active US Jobs with match below 70
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.onet_code: ''
      reduced_jobs_data.onet_matchscore: "<70"
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 16
    col: 5
    width: 5
    height: 4
  - title: Active US Expansion Jobs
    name: Active US Expansion Jobs
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.is_expansion_job: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 12
    col: 0
    width: 5
    height: 4
  - title: Active US Expansion Jobs w/No Location
    name: Active US Expansion Jobs w/No Location
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.city: EMPTY
      reduced_jobs_data.state: EMPTY
      reduced_jobs_data.postal_code: EMPTY
      reduced_jobs_data.is_expansion_job: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 12
    col: 18
    width: 4
    height: 4
  - title: Active US Expansion Jobs Missing City
    name: Active US Expansion Jobs Missing City
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.city: EMPTY
      reduced_jobs_data.is_expansion_job: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 12
    col: 14
    width: 4
    height: 4
  - title: Active US Expansion Jobs w/o ONET
    name: Active US Expansion Jobs w/o ONET
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.onet_code: ''
      reduced_jobs_data.onet_matchscore: "<40"
      reduced_jobs_data.is_expansion_job: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 20
    col: 0
    width: 5
    height: 4
  - title: Active US Expansion Jobs Missing Postal Code
    name: Active US Expansion Jobs Missing Postal Code
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.postal_code: EMPTY
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.is_expansion_job: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 12
    col: 5
    width: 5
    height: 4
  - title: Active US Expansion Jobs Missing State
    name: Active US Expansion Jobs Missing State
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.state: EMPTY
      reduced_jobs_data.is_expansion_job: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 12
    col: 10
    width: 4
    height: 4
  - title: Active US Expansion Jobs with match below 70
    name: Active US Expansion Jobs with match below 70
    model: production_reporting_model
    explore: job_level_performance
    type: single_value
    fields: [reduced_jobs_data.count]
    filters:
      reduced_jobs_data.job_status: ACTIVE
      reduced_jobs_data.normalized_country: USA
      reduced_jobs_data.onet_code: ''
      reduced_jobs_data.onet_matchscore: "<70"
      reduced_jobs_data.is_expansion_job: 'Yes'
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Attributed Source: job_performance.attributed_source
      Client ID: clients.client_id
    row: 20
    col: 5
    width: 5
    height: 4
  filters:
  - name: Event Date
    title: Event Date
    type: field_filter
    default_value: 7 day
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
      options: []
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: []
    field: attributed_events_aggregate.date_date
  - name: Client ID
    title: Client ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: []
    field: clients.client_id
  - name: Attributed Source
    title: Attributed Source
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: production_reporting_model
    explore: job_level_performance
    listens_to_filters: [Client ID, Event Date]
    field: job_performance.attributed_source
