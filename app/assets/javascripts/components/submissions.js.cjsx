@Submissions = React.createClass
  propTypes:
    submissions: React.PropTypes.array.isRequired

  getInitialState: ->
    submissions: @props.submissions

  voted: (submission) ->
    filtered = _(@state.submissions).reject (s) -> s.id == submission.id
    @setState(submissions: filtered)

  skip: (e) ->
    e.preventDefault()
    @forceUpdate()

  render: ->
    if _.isEmpty(@state.submissions)
      <p>No submissions!</p>
    else
      <div>
        <table id="submissions_table" className="table table-striped table-bordered">
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
              _(@state.submissions).sample(1).map (submission) =>
                <Submission submission={submission}
                            user={@props.user}
                            key={submission.id}
                            voted={@voted}
                            skip={@skip} />
            }
          </tbody>
        </table>
        <span className="pull-right">{@state.submissions.length} more to go!</span>
      </div>
