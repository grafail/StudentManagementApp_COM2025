require 'test_helper'

class AssessmentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @assessment = assessments(:one)
    set_up_users
    sign_in @admin
  end

  test "should get index" do
    get assessments_url
    assert_response :success
  end

  test "should create assessment" do
    assert_difference('Assessment.count') do
      post assessments_url, params: { assessment: { name: @assessment.name, subject_id: @assessment.subject_id } }
    end

    assert_redirected_to assessments_url
  end

  test "should not create assessment without permission" do
    sign_in @student
    assert_no_difference('Assessment.count') do
      post assessments_url, params: { assessment: { name: @assessment.name, subject_id: @assessment.subject_id } }
    end
  end

  test "should show assessment" do
    get assessment_url(@assessment)
    assert_redirected_to assessments_url
  end

  test "should update assessment" do
    patch assessment_url(@assessment), params: { assessment: { name: @assessment.name, subject_id: @assessment.subject_id } }
    assert_redirected_to assessments_url
  end

  test "should destroy assessment" do
    assert_difference('Assessment.count', -1) do
      delete assessment_url(@assessment)
    end

    assert_redirected_to assessments_url
  end
end
