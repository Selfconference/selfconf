$ ->
  table = $('.datatable')
  datatable = table.dataTable
    pageLength: table.data('pagelength') || 10
  datatable.fnSort [ [table.data('sortcolumn') || 0, table.data('sortorder') || "asc"] ]
