require 'test_helper'

class EnrollmentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @enrollment = enrollments(:one)
    set_up_users
    sign_in @admin
  end

  test "should get index" do
    get enrollments_url
    assert_response :success
  end

  test "should create enrollment" do
    Enrollment.delete(@enrollment)
    assert_difference('Enrollment.count') do
      post enrollments_url, params: { enrollment: { subject_id: @enrollment.subject_id, user_id: @enrollment.user_id } }
    end

    assert_redirected_to enrollments_url
  end

  test "should show enrollment" do
    get enrollment_url(@enrollment)
    assert_redirected_to enrollments_url
  end

  test "should update enrollment" do
    patch enrollment_url(@enrollment), params: { enrollment: { subject_id: @enrollment.subject_id, user_id: @enrollment.user_id } }
    assert_response :found
  end

  test "should destroy enrollment" do
    assert_difference('Enrollment.count', -1) do
      delete enrollment_url(@enrollment)
    end

    assert_redirected_to enrollments_url
  end
end
