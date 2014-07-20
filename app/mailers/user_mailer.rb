class UserMailer < ActionMailer::Base
  default from: "tap-coder@coder.com"
  
  def code_email(code)
    @email   = code.email
    @code    = code.code
    @company = code.offer.user.nil? ? "Unknown" : code.offer.user.name
    mail(to: @email, subject: "Your code from #{@company}")
  end
end
