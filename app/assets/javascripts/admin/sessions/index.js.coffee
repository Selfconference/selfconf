$ ->
  return unless $('#admin-schedule').length > 0

  sessions = $('.session')
  slots = $('.slot')
  $('.session-list').droppable
    tolerance: "fit"
    drop: (e, ui) ->
      $item = $(ui.draggable)
      session = $item.data('id')
      saveRoomAndSlot(session, null, null)

  _(sessions).each (session) ->
    $(session).draggable
      revert: "invalid"
      snap: ".slot"

  _(slots).each (slot) ->
    scheduledSession = $(slot).find('.session')[0]
    $(slot).droppable
      accept: if scheduledSession? then ".session[data-id=#{$(scheduledSession).data("id")}]" else "*"
      tolerance: "fit"
      drop: (e, ui) ->
        $slot = $(@)
        session = $(ui.draggable).data('id')
        $slot.droppable("option", "accept", ".session[data-id=#{session}]")
        room = $slot.data('room')
        time = $slot.data('slot')
        saveRoomAndSlot(session, room, time)
      out: (e, ui) ->
        $(@).droppable "option", "accept", "*"

  saveRoomAndSlot = (session, room, time) ->
    $.post "/admin/sessions/#{session}/schedule", { room: room, slot: time }
