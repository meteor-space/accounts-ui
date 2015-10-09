describe 'Space.accountsUi.UsersDAO unit', ->

  beforeEach ->
    Meteor.call('resetEnvironment')
    @usersDao = new Space.accountsUi.UsersDAO()
    @usersDao.users = Meteor.users
    Meteor.call('addUsers', 3)

  afterEach ->
    Meteor.call('resetEnvironment')

  describe 'getting users', ->

    it.server 'returns all users', ->
      expect(@usersDao.all()).to.deep.equal(Meteor.users.find())

    it.server 'finds a user by either the provided email or username', ->
      testUser = Meteor.users.findOne()
      expect(@usersDao.findByEmailOrUsername(testUser.username)).to.deep.equal(testUser);
      expect(@usersDao.findByEmailOrUsername(testUser.emails[0].address)).to.deep.equal(Meteor.users.findOne(testUser));

