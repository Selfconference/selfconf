@Submission = React.createClass
  mixins: [SimpleFormatMixin]

  propTypes:
    session: React.PropTypes.object.isRequired
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
      url: "/selection/sessions/#{@props.session.id}/votes"
      dataType: "json"
      data: { vote: value }
      success: (session) =>
        @props.voted(session)

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
      <td>{@props.session.name}</td>
      <td dangerouslySetInnerHTML={__html: @simpleFormat(@props.session.abstract)}></td>
      <td dangerouslySetInnerHTML={__html: @simpleFormat(@props.session.notes)}></td>
    </tr>
