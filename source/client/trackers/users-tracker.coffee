class Space.accountsUi.UsersTracker extends Space.messaging.Tracker

  dependencies: {
    meteor: 'Meteor'
  }

  autorun: -> @meteor.subscribe 'all-users'
