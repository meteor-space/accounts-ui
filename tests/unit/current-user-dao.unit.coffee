describe 'Space.accountsUi.CurrentUserDAO unit', ->

  beforeEach ->
    Meteor.call 'resetEnvironment'
    @currentUserDao = new Space.accountsUi.CurrentUserDAO()
    @currentUserDao.currentUser = Meteor.user

  afterEach ->
    Meteor.call('resetEnvironment')

  describe 'getting current user data', ->

    it.client 'returns the logged in user data', ->
      Accounts.createUser { email: 'testEmail@mail.com', username: 'testUsername', password: 'testPassword'}, =>
        expect(@currentUserDao.data()).to.deep.equal(Meteor.user())

    it.client 'returns null when the current user is logged out', ->
      Accounts.createUser { email: 'testEmail@mail.com', username: 'testUsername', password: 'testPassword'}, =>
        Meteor.logout =>
          expect(@currentUserDao.data()).to.equal(null)

  describe 'determining logged in state', ->

    it.client 'returns true when the current user is logged in', ->
      Accounts.createUser { email: 'testEmail@mail.com', username: 'testUsername', password: 'testPassword'}, =>
        expect(@currentUserDao.isLoggedIn()).to.be.true

    it.client 'returns false when the current user is logged out', ->
      Accounts.createUser { email: 'testEmail@mail.com', username: 'testUsername', password: 'testPassword'}, =>
        Meteor.logout =>
          expect(@currentUserDao.isLoggedIn()).to.be.false
