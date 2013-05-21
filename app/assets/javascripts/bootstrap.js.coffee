!(($) ->
  $('[rel=tooltip], [data-toggle=tooltip]').tooltip
    trigger: 'hover focus'

  $('[rel=popover], [data-toggle=popover]').popover
    trigger: 'hover'
    animation: true
    html: true
)(jQuery)
