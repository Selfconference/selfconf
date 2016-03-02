@Submission = React.createClass
  mixins: [SimpleFormatMixin]

  propTypes:
    submission: React.PropTypes.object.isRequired
    voted: React.PropTypes.func.isRequired
    skip: React.PropTypes.func.isRequired

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
      url: "/selection/submissions/#{@props.submission.id}/votes"
      dataType: "json"
      data: { vote: value }
      success: (submission) =>
        @props.voted(submission)

  render: ->
    <tr>
      <td className="actions">
        <div className="center-wrapper">
          <a className="btn button purple-button" onClick={@voteYes} rel="nofollow" href="#">Yes</a>
          <a className="btn button orange-button" onClick={@voteDontCare} rel="nofollow" href="#">Meh</a>
          <a className="btn button red-button" onClick={@voteNo} rel="nofollow" href="#">No</a>
          <a onClick={@props.skip} className="btn button yellow-button" rel="nofollow" href="#">Skip</a>
        </div>
      </td>
      <td>{@props.submission.talkname}</td>
      <td dangerouslySetInnerHTML={__html: @simpleFormat(@props.submission.abstract)}></td>
      <td dangerouslySetInnerHTML={__html: @simpleFormat(@props.submission.notes)}></td>
    </tr>
