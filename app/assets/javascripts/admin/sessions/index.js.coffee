$ ->
  return unless $('#admin-schedule').length > 0

  sessions = $('.session')
  slots = $('.slot')
  $('.session-list').droppable
    drop: (e, ui) ->
      session = $(ui.draggable.target).data('id')
      saveRoomAndSlot(session, null, null)

  _(sessions).each (session) ->
    $(session).draggable
      revert: "invalid"
      snap: ".slot"

  _(slots).each (slot) ->
    $(slot).droppable
      drop: (e, ui) ->
        session = $(ui.draggable).data('id')
        room = $(e.target).data('room')
        time = $(e.target).data('slot')
        saveRoomAndSlot(session, room, time)

  saveRoomAndSlot = (session, room, time) ->
    $.post "/admin/sessions/#{session}/schedule", { room: room, slot: time }
