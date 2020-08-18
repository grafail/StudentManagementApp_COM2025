require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    set_up_users
    sign_in @admin
  end

  test "should get index" do
    get root_path
    assert_response :success
  end

  test "should return contact email" do
    mail = ContactMailer.contact_email("test@example.org",
                                       "Matthew", "Casey", @message = "Hello")
    assert_equal ['info@studentManagementApp.com'], mail.to
    assert_equal ['info@studentManagementApp.com'], mail.from
  end

end
