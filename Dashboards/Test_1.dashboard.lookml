  dashboard: test_1
  title: Test 1
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

---
  description: 'Vendor performance for paid traffic on various websites. Includes
    sources of traffic, applies, cost and job views.

    '
  preferred_slug: WsGnONYmnhkTvBoZ27XQBc
  elements:
  - title: Performance Details
    name: Performance Details
    model: production_reporting_model
    explore: client_level_performance
    type: looker_grid
    fields: [attributed_events_aggregate.total_best_cost, attributed_events_aggregate.total_jobview,
      attributed_events_aggregate.total_apply, attributed_events_aggregate.conversion_rate,
      attributed_events_aggregate.date_date, sourcetype]
    pivots: [sourcetype]
    fill_fields: [attributed_events_aggregate.date_date]
    filters:
      attributed_events_aggregate.paid: ''
      sourcetype: Unpaid,Organic
    sorts: [sourcetype, attributed_events_aggregate.date_date]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: |-
        if(${attributed_events_aggregate.attributed_source}="ziprecruiter",
          ${attributed_events_aggregate.total_jobview},
          ${attributed_events_aggregate.total_jobview}+${attributed_events_aggregate.total_pageview})
      label: Job/Page Views
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: jobpage_views
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${attributed_events_aggregate.total_best_cost}/${jobpage_views}"
      label: Cost Per Page/Job View
      value_format:
      value_format_name: decimal_2
      _kind_hint: measure
      table_calculation: cost_per_pagejob_view
      _type_hint: number
      is_disabled: true
    - category: table_calculation
      expression: "${attributed_events_aggregate.total_apply}/${jobpage_views}"
      label: Conversion Rate
      value_format:
      value_format_name: percent_2
      _kind_hint: measure
      table_calculation: conversion_rate
      _type_hint: number
      is_disabled: true
    - category: dimension
      expression: |-
        case(when(${attributed_events_aggregate.paid}=yes,"Paid"),
          when(${attributed_events_aggregate.medium}="" AND ${attributed_events_aggregate.attributed_vendor_product}="" AND ${attributed_events_aggregate.attributed_vendor_channel}="" AND ${attributed_events_aggregate.attributed_source}="indeed" AND ${attributed_events_aggregate.traffic_type}="Direct","Unpaid"),
          when(${attributed_events_aggregate.medium}!="" AND ${attributed_events_aggregate.attributed_vendor_product}!="" AND ${attributed_events_aggregate.attributed_vendor_channel}!="" AND ${attributed_events_aggregate.attributed_source}="indeed" AND ${attributed_events_aggregate.traffic_type}="Direct","Unpaid"),
          when(${attributed_events_aggregate.attributed_source}="indeed","Organic"),
          when(contains(${attributed_events_aggregate.attributed_source},"reach-"),"Unpaid"),
          when((${attributed_events_aggregate.medium}="" OR ${attributed_events_aggregate.attributed_vendor_product}="" OR ${attributed_events_aggregate.attributed_vendor_channel}="" ) AND ${attributed_events_aggregate.attributed_source}!="indeed" ,"Organic"),
           "Unpaid"
          )
      label: SourceType
      value_format:
      value_format_name:
      dimension: sourcetype
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application: undefined
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", attributed_events_aggregate.attributed_source,
      attributed_events_aggregate.total_best_cost, jobpage_views, attributed_events_aggregate.total_apply,
      attributed_events_aggregate.conversion_rate, attributed_events_aggregate.cpa,
      cost_per_pagejob_view]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      attributed_events_aggregate.total_jobview: Job Visits
      attributed_events_aggregate.total_apply: Applies
      attributed_events_aggregate.conversion_rate: Conversion Rate
      cost_per_pagejob_view: CPC
      attributed_events_aggregate.attributed_source: Source
    series_cell_visualizations:
      attributed_events_aggregate.total_best_cost:
        is_active: true
    hidden_pivots:
      Organic:
        measure_names:
        - attributed_events_aggregate.total_best_cost
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    font_size: 12
    hidden_fields: [attributed_events_aggregate.total_best_cost]
    series_column_widths:
      attributed_events_aggregate.date_date: 125
    note_state: collapsed
    note_display: hover
    note_text: Cost and performance statistics of individual sources for the selected
      timeframe
    listen:
      Client ID: clients.client_id
      Start Date: attributed_events_aggregate.date_date
      Job ID: reduced_jobs_data.job_id
      Campaign Tag: attributed_events_aggregate.attributed_campaign_tag
      Country: reduced_jobs_data.country
      State: reduced_jobs_data.state
      Job Category: reduced_jobs_data.job_category
      Company Name: reduced_jobs_data.company_name
      City: reduced_jobs_data.city
      Education: reduced_jobs_data.education
      Experience: reduced_jobs_data.experience
      Device Type: attributed_events_aggregate.device_type
      Attributed Source: attributed_events_aggregate.attributed_source
    row: 7
    col: 0
    width: 24
    height: 6
  - title: Job View Trend
    name: Job View Trend
    model: production_reporting_model
    explore: client_level_performance
    type: looker_line
    fields: [attributed_events_aggregate.total_jobview, attributed_events_aggregate.date_date,
      sourcetype]
    pivots: [sourcetype]
    fill_fields: [attributed_events_aggregate.date_date]
    filters:
      validsource: 'Yes'
    sorts: [sourcetype, attributed_events_aggregate.date_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: |-
        if(${attributed_events_aggregate.attributed_source}="ziprecruiter",
          ${attributed_events_aggregate.total_jobview},
          ${attributed_events_aggregate.total_jobview}+${attributed_events_aggregate.total_pageview})
      label: Job/Page Views
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: jobpage_views
      _type_hint: number
      is_disabled: true
    - category: dimension
      expression: |-
        case(when(${attributed_events_aggregate.paid}=yes,"Paid"),
          when(${attributed_events_aggregate.medium}="" AND ${attributed_events_aggregate.attributed_vendor_product}="" AND ${attributed_events_aggregate.attributed_vendor_channel}="" AND ${attributed_events_aggregate.attributed_source}="indeed" AND ${attributed_events_aggregate.traffic_type}="Direct","Unpaid"),
          when(${attributed_events_aggregate.medium}!="" AND ${attributed_events_aggregate.attributed_vendor_product}!="" AND ${attributed_events_aggregate.attributed_vendor_channel}!="" AND ${attributed_events_aggregate.attributed_source}="indeed" AND ${attributed_events_aggregate.traffic_type}="Direct","Unpaid"),
          when(${attributed_events_aggregate.attributed_source}="indeed","Organic"),
          when(contains(${attributed_events_aggregate.attributed_source},"reach-"),"Unpaid"),
          when((${attributed_events_aggregate.medium}="" OR ${attributed_events_aggregate.attributed_vendor_product}="" OR ${attributed_events_aggregate.attributed_vendor_channel}="" ) AND ${attributed_events_aggregate.attributed_source}!="indeed" ,"Organic"),
           "Unpaid"
          )
      label: SourceType
      value_format:
      value_format_name:
      dimension: sourcetype
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: if(length(${attributed_events_aggregate.attributed_source})>0,yes,no)
      label: ValidSource
      value_format:
      value_format_name:
      dimension: validsource
      _kind_hint: measure
      _type_hint: yesno
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
    color_application: undefined
    y_axes: [{label: Job Visits, orientation: left, series: [{axisId: attributed_events_aggregate.total_jobview,
            id: indeed - attributed_events_aggregate.total_jobview, name: indeed},
          {axisId: attributed_events_aggregate.total_jobview, id: neuvoo - attributed_events_aggregate.total_jobview,
            name: neuvoo}, {axisId: attributed_events_aggregate.total_jobview, id: reach-adzuna
              - attributed_events_aggregate.total_jobview, name: reach-adzuna}, {
            axisId: attributed_events_aggregate.total_jobview, id: reach-neuvoo -
              attributed_events_aggregate.total_jobview, name: reach-neuvoo}, {axisId: attributed_events_aggregate.total_jobview,
            id: snagajob - attributed_events_aggregate.total_jobview, name: snagajob},
          {axisId: attributed_events_aggregate.total_jobview, id: ziprecruiter - attributed_events_aggregate.total_jobview,
            name: ziprecruiter}], showLabels: true, showValues: true, unpinAxis: false,
        tickDensity: default, tickDensityCustom: 5, type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    font_size: '12'
    series_colors:
      Paid - attributed_events_aggregate.total_jobview: "#185AD4"
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    listen:
      Client ID: clients.client_id
      Start Date: attributed_events_aggregate.date_date
      Job ID: reduced_jobs_data.job_id
      Campaign Tag: attributed_events_aggregate.attributed_campaign_tag
      Country: reduced_jobs_data.country
      State: reduced_jobs_data.state
      Job Category: reduced_jobs_data.job_category
      Company Name: reduced_jobs_data.company_name
      City: reduced_jobs_data.city
      Education: reduced_jobs_data.education
      Experience: reduced_jobs_data.experience
      Device Type: attributed_events_aggregate.device_type
      Attributed Source: attributed_events_aggregate.attributed_source
    row: 0
    col: 0
    width: 12
    height: 7
  - title: Apply Trend
    name: Apply Trend
    model: production_reporting_model
    explore: client_level_performance
    type: looker_line
    fields: [attributed_events_aggregate.date_date, sourcetype, attributed_events_aggregate.total_apply]
    pivots: [sourcetype]
    fill_fields: [attributed_events_aggregate.date_date]
    filters:
      validsource: 'Yes'
    sorts: [sourcetype, attributed_events_aggregate.date_date desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: table_calculation
      expression: |-
        if(${attributed_events_aggregate.attributed_source}="ziprecruiter",
          ${attributed_events_aggregate.total_jobview},
          ${attributed_events_aggregate.total_jobview}+${attributed_events_aggregate.total_pageview})
      label: Job/Page Views
      value_format:
      value_format_name:
      _kind_hint: measure
      table_calculation: jobpage_views
      _type_hint: number
      is_disabled: true
    - category: dimension
      expression: |-
        case(when(${attributed_events_aggregate.paid}=yes,"Paid"),
          when(${attributed_events_aggregate.medium}="" AND ${attributed_events_aggregate.attributed_vendor_product}="" AND ${attributed_events_aggregate.attributed_vendor_channel}="" AND ${attributed_events_aggregate.attributed_source}="indeed" AND ${attributed_events_aggregate.traffic_type}="Direct","Unpaid"),
          when(${attributed_events_aggregate.medium}!="" AND ${attributed_events_aggregate.attributed_vendor_product}!="" AND ${attributed_events_aggregate.attributed_vendor_channel}!="" AND ${attributed_events_aggregate.attributed_source}="indeed" AND ${attributed_events_aggregate.traffic_type}="Direct","Unpaid"),
          when(${attributed_events_aggregate.attributed_source}="indeed","Organic"),
          when(contains(${attributed_events_aggregate.attributed_source},"reach-"),"Unpaid"),
          when((${attributed_events_aggregate.medium}="" OR ${attributed_events_aggregate.attributed_vendor_product}="" OR ${attributed_events_aggregate.attributed_vendor_channel}="" ) AND ${attributed_events_aggregate.attributed_source}!="indeed" ,"Organic"),
           "Unpaid"
          )
      label: SourceType
      value_format:
      value_format_name:
      dimension: sourcetype
      _kind_hint: dimension
      _type_hint: string
    - category: dimension
      expression: if(length(${attributed_events_aggregate.attributed_source})>0,yes,no)
      label: ValidSource
      value_format:
      value_format_name:
      dimension: validsource
      _kind_hint: measure
      _type_hint: yesno
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
    color_application: undefined
    y_axes: [{label: Applies, orientation: left, series: [{axisId: attributed_events_aggregate.total_apply,
            id: Organic - attributed_events_aggregate.total_apply, name: Organic},
          {axisId: attributed_events_aggregate.total_apply, id: Paid - attributed_events_aggregate.total_apply,
            name: Paid}, {axisId: attributed_events_aggregate.total_apply, id: Unpaid
              - attributed_events_aggregate.total_apply, name: Unpaid}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    x_axis_zoom: true
    y_axis_zoom: true
    hide_legend: false
    font_size: '12'
    series_colors:
      Paid - attributed_events_aggregate.total_jobview: "#185AD4"
      Paid - attributed_events_aggregate.total_apply: "#185AD4"
    hidden_pivots: {}
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    hidden_fields:
    listen:
      Client ID: clients.client_id
      Start Date: attributed_events_aggregate.date_date
      Job ID: reduced_jobs_data.job_id
      Campaign Tag: attributed_events_aggregate.attributed_campaign_tag
      Country: reduced_jobs_data.country
      State: reduced_jobs_data.state
      Job Category: reduced_jobs_data.job_category
      Company Name: reduced_jobs_data.company_name
      City: reduced_jobs_data.city
      Education: reduced_jobs_data.education
      Experience: reduced_jobs_data.experience
      Device Type: attributed_events_aggregate.device_type
      Attributed Source: attributed_events_aggregate.attributed_source
    row: 0
    col: 12
    width: 12
    height: 7
  - title: Source List
    name: Source List
    model: production_reporting_model
    explore: client_level_performance
    type: looker_grid
    fields: [attributed_events_aggregate.attributed_source, sourcetype, attributed_events_aggregate.total_best_cost,
      attributed_events_aggregate.total_jobview, attributed_events_aggregate.total_apply,
      attributed_events_aggregate.conversion_rate]
    filters:
      attributed_events_aggregate.paid: ''
      sourcetype: Unpaid,Organic
    sorts: [attributed_events_aggregate.attributed_source desc]
    limit: 500
    column_limit: 50
    dynamic_fields:
    - category: dimension
      expression: |-
        case(when(${attributed_events_aggregate.paid}=yes,"Paid"),
          when(${attributed_events_aggregate.medium}="" AND ${attributed_events_aggregate.attributed_vendor_product}="" AND ${attributed_events_aggregate.attributed_vendor_channel}="" AND ${attributed_events_aggregate.attributed_source}="indeed" AND ${attributed_events_aggregate.traffic_type}="Direct","Unpaid"),
          when(${attributed_events_aggregate.medium}!="" AND ${attributed_events_aggregate.attributed_vendor_product}!="" AND ${attributed_events_aggregate.attributed_vendor_channel}!="" AND ${attributed_events_aggregate.attributed_source}="indeed" AND ${attributed_events_aggregate.traffic_type}="Direct","Unpaid"),
          when(${attributed_events_aggregate.attributed_source}="indeed","Organic"),
          when(contains(${attributed_events_aggregate.attributed_source},"reach-"),"Unpaid"),
          when((${attributed_events_aggregate.medium}="" OR ${attributed_events_aggregate.attributed_vendor_product}="" OR ${attributed_events_aggregate.attributed_vendor_channel}="" ) AND ${attributed_events_aggregate.attributed_source}!="indeed" ,"Organic"),
           "Unpaid"
          )
      label: SourceType
      value_format:
      value_format_name:
      dimension: sourcetype
      _kind_hint: dimension
      _type_hint: string
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: '12'
    rows_font_size: '12'
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    color_application: undefined
    show_sql_query_menu_options: false
    column_order: ["$$$_row_numbers_$$$", attributed_events_aggregate.attributed_source,
      sourcetype, attributed_events_aggregate.total_apply, attributed_events_aggregate.conversion_rate,
      attributed_events_aggregate.total_jobview]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 75
    series_labels:
      attributed_events_aggregate.total_jobview: Job Visits
      attributed_events_aggregate.total_apply: Applies
      attributed_events_aggregate.conversion_rate: Conversion Rate
      cost_per_pagejob_view: CPC
      attributed_events_aggregate.attributed_source: Source
    series_cell_visualizations:
      attributed_events_aggregate.total_best_cost:
        is_active: true
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
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
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    value_labels: legend
    label_type: labPer
    font_size: 12
    hidden_fields: [attributed_events_aggregate.total_best_cost]
    note_state: collapsed
    note_display: hover
    note_text: Cost and performance statistics of individual sources for the selected
      timeframe
    listen:
      Client ID: clients.client_id
      Start Date: attributed_events_aggregate.date_date
      Job ID: reduced_jobs_data.job_id
      Campaign Tag: attributed_events_aggregate.attributed_campaign_tag
      Country: reduced_jobs_data.country
      State: reduced_jobs_data.state
      Job Category: reduced_jobs_data.job_category
      Company Name: reduced_jobs_data.company_name
      City: reduced_jobs_data.city
      Education: reduced_jobs_data.education
      Experience: reduced_jobs_data.experience
      Device Type: attributed_events_aggregate.device_type
      Attributed Source: attributed_events_aggregate.attributed_source
    row: 13
    col: 0
    width: 24
    height: 6
  filters:
  - name: Client ID
    title: Client ID
    type: field_filter
    default_value: '0'
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
  - name: Start Date
    title: Start Date
    type: field_filter
    default_value: this month
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
      options: []
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: []
    field: attributed_events_aggregate.date_date
  - name: Company Name
    title: Company Name
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: [Client ID, Start Date]
    field: reduced_jobs_data.company_name
  - name: Job Category
    title: Job Category
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: [Client ID, Start Date]
    field: reduced_jobs_data.job_category
  - name: Campaign Tag
    title: Campaign Tag
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: [Client ID, Start Date]
    field: attributed_events_aggregate.attributed_campaign_tag
  - name: Job ID
    title: Job ID
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: popover
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: [Client ID, Start Date]
    field: reduced_jobs_data.job_id
  - name: Attributed Source
    title: Attributed Source
    type: field_filter
    default_value: indeed
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: []
    field: attributed_events_aggregate.attributed_source
  - name: City
    title: City
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: [Client ID, Start Date]
    field: reduced_jobs_data.city
  - name: State
    title: State
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: [Client ID, Start Date]
    field: reduced_jobs_data.state
  - name: Country
    title: Country
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: [Client ID, Start Date]
    field: reduced_jobs_data.country
  - name: Education
    title: Education
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: [Client ID, Start Date]
    field: reduced_jobs_data.education
  - name: Experience
    title: Experience
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: [Client ID, Start Date]
    field: reduced_jobs_data.experience
  - name: Device Type
    title: Device Type
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: tag_list
      display: overflow
    model: production_reporting_model
    explore: client_level_performance
    listens_to_filters: [Client ID, Start Date]
    field: attributed_events_aggregate.device_type
