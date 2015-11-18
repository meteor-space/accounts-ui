class Space.accountsUi.UsersProjection extends Space.eventSourcing.Projection

  dependencies: {
    accounts: 'Accounts'
  }

  collections: {
    usersCollection: 'Meteor.users'
  }

  _meteorUsersBackup: null

  onDependenciesReady: ->
    super
    @accounts.onCreateUser @handleUserCreation

  handleUserCreation: (options, user) =>
    # The options come from the Meteor.createUser call -> assign the guid
    user._id = new Guid(options.guid).toString()
    return user

  enterReplayMode: ->
    super
    # Override the global Meteor.users collection, so that calls like `createUser`
    # are writing into the in-memory collections used during the replay
    @_meteorUsersBackup = Meteor.users
    Meteor.users = @usersCollection

  exitReplayMode: ->
    super
    # Reset the global Meteor.users collection back to the original one
    Meteor.users = @_meteorUsersBackup
    @_meteorUsersBackup = null

  eventSubscriptions: -> [
    'Space.accounts.UserCreated': (event) ->
      @accounts.createUser {
        username: event.username.toString()
        email: event.email.toString()
        password: event.password.toString()
        guid: event.sourceId.toString()
      }
  ]
