- dashboard: jobs
  title: Jobs
  layout: newspaper
  elements:
  - title: Department By Openings
    name: Department By Openings
    model: greenhouse
    explore: applications
    type: looker_column
    fields: [jobs_departments.name_category, jobs_openings.avg_days_open_closed, jobs_openings.job_open_count]
    filters:
      jobs_departments.name_category: "-NULL"
    sorts: [jobs_departments.name_category]
    limit: 500
    column_limit: 50
    stacking: ''
    trellis: ''
    color_application:
      collection_id: legacy
      palette_id: mixed_dark
      options:
        steps: 5
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_colors: {}
    series_labels:
      jobs.avg_days_open_closed: Average Days to Close
      jobs.open_jobs_count: Count of Jobs
      jobs_openings.avg_days_open_closed: Avg Days to Close
      jobs_openings.job_open_count: "# of Openings"
    series_types:
      jobs.avg_days_open_closed: line
      jobs_openings.avg_days_open_closed: line
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: jobs_openings.avg_days_open_closed,
            name: Avg Days to Close, axisId: jobs_openings.avg_days_open_closed},
          {id: jobs_openings.job_open_count, name: "# of Openings", axisId: jobs_openings.job_open_count}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Number of Openings
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    listen: {}
    row: 0
    col: 12
    width: 12
    height: 6
  - title: Acceptance Rate
    name: Acceptance Rate
    model: greenhouse
    explore: applications
    type: single_value
    fields: [offers.offer_rejected_count, offers.offer_accepted_count, offers.offer_count,
      offers.acceptance_rate]
    filters:
      offers.offer_count: ">0"
      jobs_openings.status: closed
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Acceptance Rate
    value_format: ''
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    showComparison: false
    minValue: 0
    maxValue: 100
    circleThickness: 0.05
    circleFillGap: 0.05
    circleColor: '0.05'
    waveHeight: 0.05
    waveCount: 1
    waveRiseTime: 1000
    waveAnimateTime: 1800
    waveRise: true
    waveHeightScaling: true
    waveAnimate: true
    waveColor: "#33a02c"
    waveOffset: 0
    textVertPosition: 0.5
    textSize: 1
    valueCountUp: true
    displayPercent: true
    textColor: "#000000"
    waveTextColor: "#FFFFFF"
    stacking: ''
    trellis: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: bottom, series: [{id: acceptance_percent, name: Acceptance
              Percent, axisId: acceptance_percent}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [offers.offer_rejected_count, offers.offer_accepted_count, offers.offer_count]
    listen:
      Department: jobs_departments.name_category
    row: 0
    col: 6
    width: 6
    height: 4
  - title: "# of Openings"
    name: "# of Openings"
    model: greenhouse
    explore: applications
    type: single_value
    fields: [jobs_openings.job_open_count]
    limit: 500
    column_limit: 50
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: "# of Openings"
    show_comparison: false
    comparison_type: change
    comparison_reverse_colors: true
    show_comparison_label: true
    comparison_label: ''
    listen:
      Department: jobs_departments.name_category
    row: 0
    col: 0
    width: 6
    height: 4
  - title: Department By Source & Acceptance Rate
    name: Department By Source & Acceptance Rate
    model: greenhouse
    explore: applications
    type: looker_column
    fields: [sources.source_type, offers.acceptance_rate, offers.offer_accepted_count,
      offers.offer_count]
    filters:
      sources.source_type: "-NULL"
      offers.status: accepted,rejected,unresolved
    sorts: [offers.acceptance_rate desc]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
    query_timezone: America/Los_Angeles
    stacking: ''
    trellis: ''
    color_application:
      collection_id: legacy
      palette_id: mixed_dark
      options:
        steps: 5
    show_value_labels: true
    label_density: 25
    font_size: '12'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_colors:
      acceptance_rate: "#33a02c"
      offers.acceptance_rate: "#33a02c"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: offers.acceptance_rate,
            name: Acceptance Rate, axisId: offers.acceptance_rate}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    charts_across: 2
    hidden_fields: [offers.offer_accepted_count, offers.offer_count]
    listen:
      Department: jobs_departments.name_category
    row: 12
    col: 0
    width: 12
    height: 7
  - title: Department By Source & Applicants
    name: Department By Source & Applicants
    model: greenhouse
    explore: applications
    type: looker_column
    fields: [sources.source_type, applications.application_count, offers.acceptance_rate]
    filters:
      jobs_openings.status: open
      sources.source_type: "-NULL"
    sorts: [applications.application_count desc]
    limit: 500
    column_limit: 50
    total: true
    row_total: right
    query_timezone: America/Los_Angeles
    stacking: ''
    trellis: ''
    color_application:
      collection_id: legacy
      palette_id: mixed_dark
      options:
        steps: 5
    show_value_labels: true
    label_density: 25
    font_size: '12'
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: circle
    series_colors:
      acceptance_rate: "#33a02c"
      sources.source_count: "#1f78b4"
      applications.application_count: "#ff7f00"
    series_types:
      offers.acceptance_rate: line
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: applications.application_count,
            name: Application Count, axisId: applications.application_count}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear},
      {label: !!null '', orientation: right, series: [{id: offers.acceptance_rate,
            name: Acceptance Rate, axisId: offers.acceptance_rate}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    value_labels: labels
    label_type: labVal
    charts_across: 2
    hidden_fields: [offers.acceptance_rate]
    listen:
      Department: jobs_departments.name_category
    row: 12
    col: 12
    width: 12
    height: 7
  - title: Department By Job & Applicants
    name: Department By Job & Applicants
    model: greenhouse
    explore: applications
    type: looker_bar
    fields: [jobs.name, applications.rejection_count, applications.active_count, applications.application_count]
    filters:
      jobs_openings.status: open
      jobs.name: "-NULL"
    sorts: [applications.application_count desc]
    limit: 500
    column_limit: 50
    stacking: normal
    trellis: ''
    color_application:
      collection_id: legacy
      palette_id: mixed_dark
      options:
        steps: 5
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: circle
    series_colors:
      applications.application_count: "#e31a1c"
      applications.rejection_count: "#e31a1c"
    series_labels:
      applications.rejection_count: Rejected Applications
      applications.active_count: Active Applications
    series_types:
      jobs.jobs_count: line
    series_point_styles:
      jobs.jobs_count: auto
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: bottom, series: [{id: applications.application_count,
            name: Application Count, axisId: applications.application_count}], showLabels: false,
        showValues: false, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [applications.application_count]
    listen:
      Department: jobs_departments.name_category
    row: 4
    col: 0
    width: 12
    height: 8
  - title: Department By Applicant Rejected Reason
    name: Department By Applicant Rejected Reason
    model: greenhouse
    explore: applications
    type: looker_bar
    fields: [applications.rejection_reason_name, applications.rejection_count]
    filters:
      applications.rejection_reason_type_name: We rejected them
    sorts: [applications.rejection_count desc]
    limit: 500
    column_limit: 50
    stacking: ''
    trellis: ''
    color_application:
      collection_id: legacy
      palette_id: mixed_dark
      options:
        steps: 5
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      applications.application_count: "#e31a1c"
      applications.rejection_count: "#e31a1c"
    series_labels:
      applications.rejection_count: Applicant Count
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: Applicant Count, orientation: bottom, series: [{id: applications.application_count,
            name: Application Count, axisId: applications.application_count}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    listen:
      Department: jobs_departments.name_category
    row: 6
    col: 12
    width: 12
    height: 6
  filters:
  - name: Department
    title: Department
    type: field_filter
    default_value: "-NULL"
    allow_multiple_values: true
    required: false
    model: greenhouse
    explore: applications
    listens_to_filters: []
    field: jobs_departments.name_category
