$ ->
  return unless $("#submissions_table").length > 0

  table = $("#submissions_table").dataTable()
  table.fnSort [ [0,'desc'] ]


  $("#submissions_table_wrapper").on "click", ".actions a", ->
    $(event.target.parentElement.children).hide()

  $("#submissions_table_wrapper").on "click", ".type a", ->
    id = $(event.target).data().id
    type = $(event.target).data().type

    $.ajax
      method: "patch",
      url: "/submissions/#{id}",
      data: {
        talk_type: "#{type}"
      }

    $(event.target.parentElement.children).hide()

    event.preventDefault()
    event.stopPropagation()
