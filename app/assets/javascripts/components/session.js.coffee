@Submission = createReactClass
  mixins: [SimpleFormatMixin]

  voteYes: (e) ->
    @castVote(e, 1)

  voteDontCare: (e) ->
    @castVote(e, 0)

  voteNo: (e) ->
    @castVote(e, -1)

  castVote: (e, value) ->
    e.preventDefault()

    $.ajax
      method: "post"
      url: "/selection/sessions/#{@props.session.id}/votes"
      dataType: "json"
      data: { vote: value }
      success: (session) =>
        @props.voted(session)

  render: ->
    React.createElement("tr", null,
      React.createElement("td", {"className": "actions"},
        React.createElement("div", {"className": "center-wrapper"},
          React.createElement("a", {"className": "btn button purple-button", "onClick": (@voteYes), "rel": "nofollow", "href": "#"}, "Yes"),
          React.createElement("a", {"className": "btn button orange-button", "onClick": (@voteDontCare), "rel": "nofollow", "href": "#"}, "Meh"),
          React.createElement("a", {"className": "btn button red-button", "onClick": (@voteNo), "rel": "nofollow", "href": "#"}, "No"),
          React.createElement("a", {"onClick": (@props.skip), "className": "btn button yellow-button", "rel": "nofollow", "href": "#"}, "Skip")
        )
      ),
      React.createElement("td", null, (@props.session.name)),
      React.createElement("td", {"dangerouslySetInnerHTML": (__html: @simpleFormat(@props.session.abstract))}),
      React.createElement("td", {"dangerouslySetInnerHTML": (__html: @simpleFormat(@props.session.notes))})
    )
