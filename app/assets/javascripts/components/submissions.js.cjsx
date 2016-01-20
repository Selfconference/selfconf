@Submissions = React.createClass
  propTypes:
    submissions: React.PropTypes.array.isRequired
    user: React.PropTypes.object.isRequired

  render: ->
    if _.isEmpty(@props.submissions)
      <p>No submissions</p>
    else
      <table id="submissions_table" className="table table-striped table-bordered">
        <thead>
          <tr>
            <th className="col-md-1">Vote</th>
            <th className="col-md-4">Talk Name</th>
            <th>Abstract</th>
          </tr>
        </thead>
        <tbody>
          {
            @props.submissions.map (submission) =>
              <Submission submission={submission} user={@props.user} key={submission.id} />
          }
        </tbody>
      </table>
