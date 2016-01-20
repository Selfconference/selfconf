@Submission = React.createClass
  propTypes:
    submission: React.PropTypes.object.isRequired
    user: React.PropTypes.object.isRequired

  getInitialState: ->
    submission: @props.submission

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
      url: "/admin/submissions/#{@state.submission.id}/votes"
      dataType: "json"
      data: { vote: value }
      success: (submission) =>
        @setState submission: submission

  resetVote: (e) ->
    e.preventDefault()

    $.ajax
      method: "delete"
      url: "/admin/submissions/#{@state.submission.id}/votes/#{@vote().id}"
      dataType: "json"
      success: (submission) =>
        @setState submission: submission

  vote: ->
    _(@state.submission.votes).find (vote) => vote.user_id == @props.user.id

  render: ->
    vote = @vote()
    <tr>
      <td className="actions">
        {
          if vote
            <div>
              {
                if vote.value == 1
                  "Yes"
                else if vote.value == 0
                  "Meh"
                else
                  "No"
              }
              <a className="btn" onClick={@resetVote} rel="nofollow" href="#">(Reset)</a>
            </div>
          else
            <div className="center-wrapper">
              <a className="btn btn-primary" onClick={@voteYes} rel="nofollow" href="#">Yes</a>
              <a className="btn btn-primary" onClick={@voteDontCare} rel="nofollow" href="#">Meh</a>
              <a className="btn btn-primary" onClick={@voteNo} rel="nofollow" href="#">No</a>
            </div>
        }
      </td>
      {
        if vote
          <td>{s.truncate(@state.submission.talkname, 30)}</td>
        else
          <td>{@state.submission.talkname}</td>
      }
      {
        if vote
          <td>{s.truncate(@state.submission.abstract, 50)}</td>
        else
          <td>{@state.submission.abstract}</td>
      }
    </tr>
