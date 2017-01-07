@Sessions = React.createClass
  propTypes:
    sessions: React.PropTypes.array.isRequired

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
      <p>No sessions!</p>
    else
      <div>
        <table id="talks_table" className="table table-striped table-bordered">
          <thead>
            <tr>
              <th className="col-md-1">Vote</th>
              <th className="col-md-3">Talk Name</th>
              <th className="col-md-5">Abstract</th>
              <th>Notes</th>
            </tr>
          </thead>
          <tbody>
            {
              sessions = _(@state.sessions).sample(1)
              _(sessions).map (session) =>
                <Submission session={session}
                            user={@props.user}
                            key={session.id}
                            voted={@voted}
                            skip={@skip} />
            }
          </tbody>
        </table>
          <span className="pull-right">{@state.sessions.length} more to go!</span>
      </div>
