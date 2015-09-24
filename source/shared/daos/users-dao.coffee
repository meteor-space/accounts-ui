class Space.accountsUi.UsersDAO extends Space.Object

  Dependencies: {
    users: 'Meteor.users'
  }

  all: -> @users.find({})

  findByEmailOrUsername: (identifier) ->
    @users.findOne $or: [
      { username: identifier }
      { 'emails.address': identifier }
    ]
