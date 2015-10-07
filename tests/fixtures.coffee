Meteor.methods

  addUsers: (amount) ->
    for i in [1..amount]
      Accounts.createUser { email: 'testEmail' + i + '@mail.com', username: 'testUsername' + i , password: 'testPassword' + i }

  resetEnvironment: ->
    Meteor.users.remove {}

