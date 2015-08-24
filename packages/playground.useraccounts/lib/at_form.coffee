myHelpers = AccountsTemplates.atFormHelpers
myHelpers.dump = () ->
  console.info 'Dump', arguments, this

myHelpers.showForgotPasswordLink = AccountsTemplates.atPwdFormHelpers.showForgotPasswordLink
#Template.atForm.events AccountsTemplates.atPwdFormEvents

Template.atForm.helpers myHelpers
