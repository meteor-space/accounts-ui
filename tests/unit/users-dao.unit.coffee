describe 'Space.accountsUi.UsersDAO unit', ->

  beforeEach ->
    Meteor.call('removeUsers')
    @usersDao = new Space.accountsUi.UsersDAO()
    @usersDao.users = Meteor.users
    Meteor.call('addUsers')

  afterEach ->
    Meteor.call('removeUsers')

  describe 'getting users', ->

    it.server 'returns all users', ->
      expect(@usersDao.all()).to.deep.equal(Meteor.users.find())

    it.server 'finds a user by either the provided email or username', ->
      newAccountId = Accounts.createUser({ email: 'testEmail@mail.com', username: 'testUsername', password: '123'});
      expect(@usersDao.findByEmailOrUsername('testUsername')).to.deep.equal(Meteor.users.findOne(newAccountId));
      expect(@usersDao.findByEmailOrUsername('testEmail@mail.com')).to.deep.equal(Meteor.users.findOne(newAccountId));

