class ApplicationMailer < ActionMailer::Base
  default to: 'info@studentManagementApp.com', from: 'info@studentManagementApp.com'
  layout 'mailer'
end
