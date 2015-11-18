class Space.accountsUi.CurrentUserDAO extends Space.Object

  dependencies: {
    currentUser: 'Meteor.user'
  }

  data: -> @currentUser()

  isLoggedIn: -> @currentUser()?
