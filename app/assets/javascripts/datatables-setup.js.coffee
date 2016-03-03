$ ->
  table = $('.datatable')
  datatable = table.dataTable
    pageLength: table.data('pagelength') || 10
    lengthMenu: [ 10, 25, 35, 50, 75, 100 ]
  datatable.fnSort [ [table.data('sortcolumn') || 0, table.data('sortorder') || "asc"] ]
