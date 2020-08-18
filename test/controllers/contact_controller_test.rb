require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    set_up_users
    sign_in @admin
  end

  test "should get index" do
    get contact_url
    assert_response :success
  end

end
