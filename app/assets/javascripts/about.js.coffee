$ ->
  $('#abouts-table').dataTable
    processing: true
    serverSide: true
    ajax: $('#abouts-table').data('source')
    pagingType: 'full_numbers'