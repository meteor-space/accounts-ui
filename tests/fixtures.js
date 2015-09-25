Meteor.methods({

  addUsers: function(){
    Accounts.createUser({ email: 'testEmail1@mail.com', username: 'testUsername1', password: 'testPassword1'});
    Accounts.createUser({ email: 'testEmail2@mail.com', username: 'testUsername2', password: 'testPassword2'});
    Accounts.createUser({ email: 'testEmail3@mail.com', username: 'testUsername3', password: 'testPassword3'});
  },

  removeUsers: function(){
    Meteor.users.remove({})
  }

});