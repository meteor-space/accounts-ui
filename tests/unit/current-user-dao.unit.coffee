describe 'Space.accountsUi.CurrentUserDAO unit', ->

  beforeEach ->
    Meteor.call 'resetEnvironment'
    @currentUserDao = new Space.accountsUi.CurrentUserDAO()
    @currentUserDao.currentUser = Meteor.user
    @userCreds = { email: 'testEmail@mail.com', username: 'testUsername', password: 'testPassword'}
    Accounts.createUser @userCreds

  afterEach ->
    Meteor.call('resetEnvironment')

  describe 'getting current user data', ->

    it.client 'returns the logged in user data', ->
      Meteor.loginWithPassword @userCreds.email, @userCreds.password, =>
        expect(@currentUserDao.data()).to.deep.equal(Meteor.user())

    it.client 'returns null when the current user is logged out', ->
      Meteor.logout =>
        expect(@currentUserDao.data()).to.be.null

  describe 'determining logged in state', ->

    it.client 'returns true when the current user is logged in', ->
      Meteor.loginWithPassword @userCreds.email, @userCreds.password, =>
        expect(@currentUserDao.isLoggedIn()).to.be.true

    it.client 'returns false when the current user is logged out', ->
      Meteor.logout =>
        expect(@currentUserDao.isLoggedIn()).to.be.false
