class Space.accountsUi.UsersTracker extends Space.messaging.Tracker

  Dependencies: {
    meteor: 'Meteor'
  }

  autorun: -> @meteor.subscribe 'all-users'
