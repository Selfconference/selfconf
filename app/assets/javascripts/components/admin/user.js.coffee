@User = createReactClass
  mixins: [SimpleFormatMixin]

  toggleSelector: (e) ->
    $.ajax
      method: "post"
      url: "/admin/speakers/#{@props.user.id}/make_selector"
      dataType: "json"
      data: { }
      success: (user) =>
        @props.userUpdated(user)

  toggleAdmin: (e) ->
    $.ajax
      method: "post"
      url: "/admin/speakers/#{@props.user.id}/make_admin"
      dataType: "json"
      data: { }
      success: (user) =>
        @props.userUpdated(user)

  edit: (e) ->
    redirect "/admin/speakers/#{@props.user.id}/edit"

  toggleText: (value) ->
    if value then 'Remove' else 'Make'

  render: ->
    React.createElement("tr", null,
      React.createElement("td", null, (@props.user.id)),
      React.createElement("td", null, (@props.user.name)),
      React.createElement("td", null, (@props.user.twitter)),
      React.createElement("td", null, (@props.user.email)),
      React.createElement("td", {"className": "actions"},
        React.createElement("a", {onClick: (@edit), "className": "btn small-button orange-button", "rel": "nofollow", "href": "#"}, "Edit"),
        React.createElement("a", {onClick: (@toggleSelector), "className": "btn small-button purple-button", "rel": "nofollow", "href": "#"}, "#{@toggleText(@props.user['selector?'])} Selector"),
        React.createElement("a", {onClick: (@toggleAdmin), "className": "btn small-button purple-button", "rel": "nofollow", "href": "#"}, "#{@toggleText(@props.user['admin?'])} Admin")
      )
    )
