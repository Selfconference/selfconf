@Submissions = React.createClass
  propTypes:
    submissions: React.PropTypes.array.isRequired
    admin: React.PropTypes.bool

  getDefaultProps: ->
    admin: false

  getInitialState: ->
    submissions: @props.submissions

  voted: (submission) ->

    filtered = _(@state.submissions).reject (s) -> s.id == submission.id
    @setState(submissions: filtered)

  skip: (e) ->
    e.preventDefault()
    @forceUpdate()

  componentDidMount: ->
    if @props.admin
      table = $("#submissions_table").dataTable()
      table.fnSort [ [0,'desc'] ]

  render: ->
    if _.isEmpty(@state.submissions)
      <p>No submissions!</p>
    else
      <div>
        {
          if @props.admin
            <div>
              <span className="bold">Total</span>: {@state.submissions.length}
              <span className="bold">People</span>: {_(@state.submissions).filter((s) -> s.talktype == 'people').length}
              <span className="bold">Tech</span>: {_(@state.submissions).filter((s) -> s.talktype == 'tech').length}
            </div>
        }
        <table id="submissions_table" className="table table-striped table-bordered">
          <thead>
            {
              if @props.admin
                <tr>
                  <th className="col-md-1">Votes</th>
                  <th className="col-md-2">Name</th>
                  <th>Talk Name</th>
                  <th>Type</th>
                  <th>Abstract</th>
                </tr>
              else
                <tr>
                  <th className="col-md-1">Vote</th>
                  <th className="col-md-3">Talk Name</th>
                  <th className="col-md-5">Abstract</th>
                  <th>Notes</th>
                </tr>
            }
          </thead>
          <tbody>
            {
              submissions = @state.submissions
              submissions = _(submissions).sample(1) unless @props.admin
              _(submissions).map (submission) =>
                <Submission submission={submission}
                            user={@props.user}
                            key={submission.id}
                            voted={@voted}
                            skip={@skip}
                            admin={@props.admin} />
            }
          </tbody>
        </table>
        {
          unless @props.admin
            <span className="pull-right">{@state.submissions.length} more to go!</span>
        }
      </div>
