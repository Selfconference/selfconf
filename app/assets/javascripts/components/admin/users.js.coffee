@Users = createReactClass
  getInitialState: ->
    users: @props.users

  userUpdated: (user) ->
    users = _(@props.users).reject((storedUser) -> storedUser.id == user.id)
    users.push(user)
    @setState(users: users)

  componentDidMount: () ->
    @initializeDataTables()

  componentDidUpdate: () ->
    @initializeDataTables()

  initializeDataTables: () ->
    table = $('.datatable')
    datatable = table.dataTable
      pageLength: table.data('pagelength') || 10
      lengthMenu: [ 10, 25, 35, 50, 75, 100 ]
    datatable.fnSort [ [table.data('sortcolumn') || 0, table.data('sortorder') || "asc"] ]

  render: ->
    if _.isEmpty(@state.users)
      React.createElement("p", null, "No users!")
    else
      React.createElement("table", {"className": "datatable table table-striped table-bordered"},
        React.createElement("thead", null,
          React.createElement("tr", null,
            React.createElement("th", null, "ID"),
            React.createElement("th", null, "Name"),
            React.createElement("th", null, "Twitter"),
            React.createElement("th", null, "Email"),
            React.createElement("th", null, "")
          )
        ),
        React.createElement("tbody", null,
          (
            _(@state.users).map (user) =>
              React.createElement(User, {"user": (user),  \
                          "user": (user),  \
                          "key": (user.id), \
                          "userUpdated": (@userUpdated)})
          )
        )
      )
