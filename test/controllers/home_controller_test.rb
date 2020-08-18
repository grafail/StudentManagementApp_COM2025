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

end
