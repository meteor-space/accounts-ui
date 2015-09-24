class Space.accountsUi.CurrentUserDAO extends Space.Object

  Dependencies: {
    currentUser: 'Meteor.user'
  }

  data: -> @currentUser()

  isLoggedIn: -> @currentUser()?
