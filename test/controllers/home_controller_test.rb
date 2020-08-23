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

  test "should email" do
    post contact_url, params: { fname: 'Rafail', lname: 'Giavrimis', email: 'test@example.org', message: '12345' }

    assert_redirected_to root_url
    assert_not_empty(flash[:notice])
  end

  test "should not email" do
    post contact_url, params: { fname: 'Rafail', lname: 'Giavrimis', email: 'testexample.org', message: '12345' }

    assert_redirected_to root_url, notice: 'test'
    assert_not_empty(flash[:alert])
  end

end
