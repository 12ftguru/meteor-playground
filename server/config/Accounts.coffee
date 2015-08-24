Accounts.config
  sendVerificationEmail: false
  restrictCreationByEmailDomain: '12ftguru.com'

adminEmailRe = /@12ftguru.com$/

Accounts.onCreateUser (options, user) ->
  console.log 'user: %O', user
  email = _.find user.emails, (addr) ->
    if adminEmailRe.test addr.address
      addr.verified = true
    return addr.verified
      
  if email?
    user.roles ?= []
    user.roles.push 'admin'


  return user
