AccountsTemplates.configure
  confirmPassword: true
  enablePasswordChange: true
  forbidClientAccountCreation: false
  overrideLoginErrors: false
  sendVerificationEmail: false
  lowercaseUsername: false
  showAddRemoveServices: false
  showForgotPasswordLink: true
  showLabels: true
  showPlaceholders: true
  showResendVerificationEmailLink: false
  continuousValidation: false
  negativeFeedback: false
  negativeValidation: true
  positiveValidation: false
  positiveFeedback: true
  showValidating: true
  privacyUrl: 'privacy'
  termsUrl: 'terms-of-use'
  homeRoutePath: '/'
  redirectTimeout: 4000
  #onLogoutHook: myLogoutFunc
  #onSubmitHook: mySubmitFunc
  #preSubmitHook: myPreSubmitFunc
  texts:
    signInLink_link: "Sign In"
  #  socialSignUp: 'Register'
  #  socialIcons: 'meteor-developer': 'fa fa-rocket'
  #  title: forgotPwd: 'Recover Your Password'

#This is how we change error messages.
T9n.map 'en',
  error:
    accounts:
      'Login forbidden': 'Login attempt failed.'
