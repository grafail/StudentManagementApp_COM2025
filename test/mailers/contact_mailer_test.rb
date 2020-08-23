require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "should return contact email" do
    mail = ContactMailer.contact_email("test@example.org",
                                       "Matthew", "Casey", @message = "Hello")
    assert_equal ['info@studentManagementApp.com'], mail.to
    assert_equal ['info@studentManagementApp.com'], mail.from
  end
end
