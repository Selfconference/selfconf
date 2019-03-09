$ ->
  return unless $('#admin-sessions').length > 0

  $('.select-all').on 'change', (e) ->
    $('.selected').prop('checked', e.target.checked)

  $('.promote').on 'click', (e) ->
    selected = _($('.selected')).map (checkbox) -> if checkbox.checked then $(checkbox).val() else null
    selected = _(selected).compact()

    $.post('/admin/sessions/promote_session', {ids: selected}, () -> location.reload() )
