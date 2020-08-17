class ContactMailer < ApplicationMailer

  def contact_email(email, fname, lname, message)
    @email = email
    @fname = fname
    @lname = lname
    @message = message
    mail cc: @email
  end

end
