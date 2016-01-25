@Submission = React.createClass
  mixins: [SimpleFormatMixin]

  propTypes:
    submission: React.PropTypes.object.isRequired
    voted: React.PropTypes.func.isRequired
    skip: React.PropTypes.func.isRequired
    admin: React.PropTypes.bool

  getDefaultProps: ->
    admin: false

  voteYes: (e) ->
    @castVote(e, 1)

  voteDontCare: (e) ->
    @castVote(e, 0)

  voteNo: (e) ->
    @castVote(e, -1)

  castVote: (e, value) ->
    e.preventDefault()

    if @props.admin
      value = value * 2

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
        {
          if @props.admin
            <div className="center-wrapper">
              {_(@props.submission.votes).chain().pluck('value').reduce(((memo, v) -> memo + v), 0).value() }
            </div>
          else
            <div className="center-wrapper">
              <a className="btn orange-btn" onClick={@voteYes} rel="nofollow" href="#">Yes</a>
              <a className="btn orange-btn" onClick={@voteDontCare} rel="nofollow" href="#">Meh</a>
              <a className="btn orange-btn" onClick={@voteNo} rel="nofollow" href="#">No</a>
              <a onClick={@props.skip} rel="nofollow" href="#">Skip for now...</a>
            </div>
        }
      </td>
      {
        if @props.admin
          <td>{@props.submission.user.name}</td>
      }
      <td>{@props.submission.talkname}</td>
      {
        if @props.admin
          <td>{@props.submission.talktype}</td>
      }
      <td dangerouslySetInnerHTML={__html: @simpleFormat(@props.submission.abstract)}></td>
      {
        unless @props.admin
          <td dangerouslySetInnerHTML={__html: @simpleFormat(@props.submission.notes)}></td>
      }
    </tr>
