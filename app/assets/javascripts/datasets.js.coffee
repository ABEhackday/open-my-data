$ ->
  if !$('body').hasClass('datasets-controller show-action')
    return

  $('table.dataset-preview').dataTable
    bJQueryUI: true
