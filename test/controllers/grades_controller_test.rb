require 'test_helper'

class GradesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @grade = grades(:one)
    set_up_users
    sign_in @admin
  end

  test "should get index" do
    get grades_url
    assert_response :success
  end

  test "should get new" do
    get new_grade_url
    assert_response :success
  end

  test "should create grade" do
    Grade.delete(@grade)
    assert_difference('Grade.count') do
      post grades_url, params: { grade: { assessment_id: @grade.assessment_id, grade: @grade.grade, user_id: @grade.user_id } }
    end

    assert_redirected_to grade_url(Grade.last)
  end

  test "should show grade" do
    get grade_url(@grade)
    assert_response :success
  end

  test "should get edit" do
    get edit_grade_url(@grade)
    assert_response :success
  end

  test "should update grade" do
    patch grade_url(@grade), params: { grade: { assesment_id: @grade.assessment_id, grade: @grade.grade, user_id: @grade.user_id } }
    assert_response :success
  end

  test "should destroy grade" do
    assert_difference('Grade.count', -1) do
      delete grade_url(@grade)
    end

    assert_redirected_to grades_url
  end
end
