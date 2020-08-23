class HomeController < ApplicationController
  def index
  end

  def contact
  end

  # Used after to process a submitted contact request
  def request_contact
    fname = params[:fname]
    lname = params[:lname]
    email = params[:email]
    message = params[:message]
    if email.blank? or !isEmail(email)
      flash[:alert] = I18n.t('home.request_contact.no_email')
    else
      # Send an email
      puts 'Sending email!'
      ContactMailer.contact_email(email,fname,lname,message).deliver_now
      puts 'Sent!'
      flash[:notice] = I18n.t('home.request_contact.email_sent')
    end
    redirect_to root_path
  end

  private

  # Uses a regular expression to check if an email is valid
  def isEmail(str)
    return str.match('[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}')
  end

end
