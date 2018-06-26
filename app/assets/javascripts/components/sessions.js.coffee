@Sessions = createReactClass
  getInitialState: ->
    sessions: @props.sessions

  voted: (session) ->
    filtered = _(@state.sessions).reject (s) -> s.id == session.id
    @setState(sessions: filtered)

  skip: (e) ->
    e.preventDefault()
    @forceUpdate()

  render: ->
    if _.isEmpty(@state.sessions)
      React.createElement("p", null, "No sessions!")
    else
      React.createElement("div", null,
        React.createElement("table", {"id": "talks_table", "className": "table table-striped table-bordered"},
          React.createElement("thead", null,
            React.createElement("tr", null,
              React.createElement("th", {"className": "col-md-1"}, "Vote"),
              React.createElement("th", {"className": "col-md-3"}, "Talk Name"),
              React.createElement("th", {"className": "col-md-5"}, "Abstract"),
              React.createElement("th", null, "Notes")
            )
          ),
          React.createElement("tbody", null,
            (
              sessions = _(@state.sessions).sample(1)
              _(sessions).map (session) =>
                React.createElement(Submission, {"session": (session),  \
                            "user": (@props.user),  \
                            "key": (session.id),  \
                            "voted": (@voted),  \
                            "skip": (@skip)})
            )
          )
        ),
          React.createElement("span", {"className": "pull-right"}, (@state.sessions.length), " more to go!")
      )
