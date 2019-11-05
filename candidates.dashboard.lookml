
- dashboard: candidates
  title: Candidates
  layout: newspaper
  elements:
  - title: Candidates by Source
    name: Candidates by Source
    model: greenhouse
    explore: applications
    type: looker_column
    fields: [candidates.candidate_distinct_count, sources.source_type, offers.offer_count,
      offers.quality_candidate]
    filters:
      sources.source_type: "-NULL"
    sorts: [candidates.candidate_distinct_count desc]
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
    font_size: '12'
    legend_position: center
    hide_legend: false
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: circle
    series_colors:
      candidates.candidate_distinct_count: "#1f78b4"
      source_success_rate: "#ff7f00"
      offers.success_rate: "#ff7f00"
      offers.quality_candidate: "#ff7f00"
    series_labels:
      offers.quality_candidate: Candidate Success Rate
    series_types:
      source_success_rate: line
      offers.success_rate: line
      offers.quality_candidate: line
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: candidates.candidate_distinct_count,
            name: Candidate Distinct Count, axisId: candidates.candidate_distinct_count}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}, {label: !!null '', orientation: right,
        series: [{id: offers.quality_candidate, name: Candidate Success Rate, axisId: offers.quality_candidate}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
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
    hidden_fields: [offers.offer_count]
    listen: {}
    row: 6
    col: 13
    width: 11
    height: 7
  - title: Quality
    name: Quality
    model: greenhouse
    explore: applications
    type: looker_bar
    fields: [candidates.candidate_distinct_count, offers.offer_count, jobs_departments.name_category,
      offers.quality_candidate]
    sorts: [offers.quality_candidate desc]
    limit: 500
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
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      of_quality_candidate: "#1f78b4"
      offers.quality_candidate: "#1f78b4"
    series_labels:
      offers.quality_candidate: "% of Quality Candidates"
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: bottom, series: [{id: of_quality_candidate,
            name: "% of Quality Candidate", axisId: of_quality_candidate}], showLabels: true,
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
    column_group_spacing_ratio: 0
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [offers.offer_count, candidates.candidate_distinct_count]
    listen: {}
    row: 13
    col: 8
    width: 8
    height: 7
  - title: Volume
    name: Volume
    model: greenhouse
    explore: applications
    type: looker_bar
    fields: [candidates.candidate_distinct_count, jobs_departments.name_category]
    sorts: [candidates.candidate_distinct_count desc]
    limit: 500
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
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      candidates.candidate_distinct_count: "#33a02c"
    series_labels:
      candidates.candidate_distinct_count: Candidates
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: bottom, series: [{id: candidates.candidate_distinct_count,
            name: Candidates, axisId: candidates.candidate_distinct_count}], showLabels: true,
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
    listen: {}
    row: 13
    col: 0
    width: 8
    height: 7
  - title: Success
    name: Success
    model: greenhouse
    explore: applications
    type: looker_bar
    fields: [candidates.candidate_distinct_count, offers.offer_accepted_count, jobs_departments.name_category]
    sorts: [offers.offer_accepted_count desc]
    limit: 500
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
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: false
    point_style: none
    series_colors:
      offers.offer_accepted_count: "#ff7f00"
    series_labels:
      offers.offer_accepted_count: Offers Accepted
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: bottom, series: [{id: of_quality_candidate,
            name: "% of Quality Candidate", axisId: of_quality_candidate}], showLabels: true,
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
    hidden_fields: [candidates.candidate_distinct_count]
    listen: {}
    row: 13
    col: 16
    width: 8
    height: 7
  - title: Candidate Rejection Reason
    name: Candidate Rejection Reason
    model: greenhouse
    explore: applications
    type: looker_bar
    fields: [applications.rejection_reason_name, candidates.candidate_distinct_count,
      candidates.percent_of_total_candidate]
    filters:
      applications.rejection_reason_type_name: We rejected them
    sorts: [candidates.candidate_distinct_count desc]
    limit: 500
    column_limit: 50
    total: true
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
    series_colors:
      of_total: "#fb9a99"
      candidates.percent_of_total_candidate: "#e31a1c"
    series_labels:
      candidates.percent_of_total_candidate: "% of Total"
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_series: []
    y_axes: [{label: '', orientation: bottom, series: [{id: of_total, name: "% of\
              \ Total", axisId: of_total}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    hidden_fields: [candidates.candidate_distinct_count]
    listen: {}
    row: 20
    col: 0
    width: 12
    height: 6
  - title: Job Rejection Reason
    name: Job Rejection Reason
    model: greenhouse
    explore: applications
    type: looker_bar
    fields: [applications.rejection_reason_name, candidates.candidate_distinct_count,
      candidates.percent_of_total_candidate]
    filters:
      applications.rejection_reason_type_name: They rejected us
    sorts: [candidates.candidate_distinct_count desc]
    limit: 500
    column_limit: 50
    total: true
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
    series_colors:
      of_total: "#e31a1c"
      candidates.percent_of_total_candidate: "#fb9a99"
    series_labels:
      candidates.percent_of_total_candidate: "% of Total"
    series_types: {}
    limit_displayed_rows: true
    limit_displayed_rows_values:
      show_hide: show
      first_last: first
      num_rows: '10'
    hidden_series: []
    y_axes: [{label: '', orientation: bottom, series: [{id: of_total, name: "% of\
              \ Total", axisId: of_total}], showLabels: false, showValues: false,
        unpinAxis: false, tickDensity: default, tickDensityCustom: 5, type: linear}]
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
    hidden_fields: [candidates.candidate_distinct_count]
    listen: {}
    row: 20
    col: 12
    width: 12
    height: 6
  - title: Total Active Applications
    name: Total Active Applications
    model: greenhouse
    explore: applications
    type: single_value
    fields: [candidates.candidate_distinct_count]
    filters:
      applications.applied_at_date: after 2019/01/01
      applications.status: active
    sorts: [candidates.candidate_distinct_count desc]
    limit: 500
    column_limit: 50
    color_application:
      collection_id: legacy
      palette_id: mixed_dark
      options:
        steps: 5
    custom_color_enabled: true
    custom_color: ''
    show_single_value_title: true
    single_value_title: Active Candidates
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    trellis: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_labels:
      application_stages.moved_to_hr_interview_count: HR Interview
      application_stages.invited_to_test_count: Invited to Test
      application_stages.moved_to_onsite_interview_count: Onsite Interview
      application_stages.moved_to_dept_interview_count: Dept Interview
      offers.offer_count: Offer
      offers.offer_accepted_count: Offer Accepted
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: application_stages.moved_to_hr_interview_count,
            name: Moved to Hr Interview Count, axisId: application_stages.moved_to_hr_interview_count},
          {id: application_stages.invited_to_test_count, name: Invited to Test Count,
            axisId: application_stages.invited_to_test_count}, {id: application_stages.moved_to_onsite_interview_count,
            name: Moved to Onsite Interview Count, axisId: application_stages.moved_to_onsite_interview_count},
          {id: application_stages.moved_to_dept_interview_count, name: Moved to Dept
              Interview Count, axisId: application_stages.moved_to_dept_interview_count},
          {id: offers.offer_count, name: Offer Count, axisId: offers.offer_count},
          {id: offers.offer_accepted_count, name: Offer Accepted Count, axisId: offers.offer_accepted_count}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: []
    listen: {}
    row: 0
    col: 0
    width: 6
    height: 6
  - title: Candidates by Race
    name: Candidates by Race
    model: greenhouse
    explore: applications
    type: looker_pie
    fields: [candidates.candidate_distinct_count, demographics.race]
    filters:
      demographics.race: "-EMPTY,-NULL"
    sorts: [candidates.candidate_distinct_count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: legacy
      palette_id: mixed_dark
      options:
        steps: 5
        reverse: false
    series_colors: {}
    series_types: {}
    listen: {}
    row: 0
    col: 15
    width: 9
    height: 6
  - title: Candidates by Gender
    name: Candidates by Gender
    model: greenhouse
    explore: applications
    type: looker_pie
    fields: [demographics.gender, candidates.candidate_distinct_count]
    filters:
      demographics.gender: "-NULL,-EMPTY"
    sorts: [candidates.candidate_distinct_count desc]
    limit: 500
    column_limit: 50
    value_labels: legend
    label_type: labPer
    color_application:
      collection_id: legacy
      palette_id: mixed_dark
      options:
        steps: 5
    series_colors: {}
    series_types: {}
    listen: {}
    row: 0
    col: 6
    width: 9
    height: 6
  - title: Application Stages
    name: Application Stages
    model: greenhouse
    explore: applications
    type: looker_funnel
    fields: [application_stages.moved_to_assessment_count, application_stages.moved_to_hr_interview_count,
      application_stages.invited_to_test_count, application_stages.moved_to_onsite_interview_count,
      application_stages.moved_to_dept_interview_count, offers.offer_count, offers.offer_accepted_count]
    filters:
      applications.applied_at_date: after 2019/01/01
    limit: 500
    column_limit: 50
    leftAxisLabelVisible: false
    leftAxisLabel: ''
    rightAxisLabelVisible: false
    rightAxisLabel: ''
    color_application:
      collection_id: legacy
      palette_id: mixed_dark
      options:
        steps: 5
    smoothedBars: true
    orientation: automatic
    labelPosition: left
    percentType: prior
    percentPosition: right
    valuePosition: inline
    labelColorEnabled: false
    labelColor: "#FFF"
    stacking: ''
    trellis: ''
    show_value_labels: true
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    point_style: none
    series_labels:
      application_stages.moved_to_hr_interview_count: HR Interview
      application_stages.invited_to_test_count: Invited to Test
      application_stages.moved_to_onsite_interview_count: Onsite Interview
      application_stages.moved_to_dept_interview_count: Dept Interview
      offers.offer_count: Offer
      offers.offer_accepted_count: Offer Accepted
    series_types: {}
    limit_displayed_rows: false
    y_axes: [{label: '', orientation: left, series: [{id: application_stages.moved_to_hr_interview_count,
            name: Moved to Hr Interview Count, axisId: application_stages.moved_to_hr_interview_count},
          {id: application_stages.invited_to_test_count, name: Invited to Test Count,
            axisId: application_stages.invited_to_test_count}, {id: application_stages.moved_to_onsite_interview_count,
            name: Moved to Onsite Interview Count, axisId: application_stages.moved_to_onsite_interview_count},
          {id: application_stages.moved_to_dept_interview_count, name: Moved to Dept
              Interview Count, axisId: application_stages.moved_to_dept_interview_count},
          {id: offers.offer_count, name: Offer Count, axisId: offers.offer_count},
          {id: offers.offer_accepted_count, name: Offer Accepted Count, axisId: offers.offer_accepted_count}],
        showLabels: false, showValues: false, unpinAxis: false, tickDensity: default,
        tickDensityCustom: 5, type: linear}]
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: false
    x_axis_scale: auto
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    ordering: none
    show_null_labels: false
    show_dropoff: true
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    hidden_fields: [application_stages.moved_to_assessment_count]
    listen: {}
    row: 6
    col: 0
    width: 13
    height: 7
  # filters:
  # - name: Application Date
  #   title: Application Date
  #   type: field_filter
  #   default_value: 1 months ago for 1 months
  #   allow_multiple_values: true
  #   required: false
  #   model: greenhouse
  #   explore: applications
  #   listens_to_filters: []
  #   field: calendar_dates.calendar_date
