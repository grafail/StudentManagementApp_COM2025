require 'test_helper'

class AssesmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assesment = assesments(:one)
  end

  test "should get index" do
    get assessments_url
    assert_response :success
  end

  test "should get new" do
    get new_assessment_url
    assert_response :success
  end

  test "should create assesment" do
    assert_difference('Assesment.count') do
      post assessments_url, params: {assesment: {name: @assesment.name, subject_id: @assesment.subject_id } }
    end

    assert_redirected_to assessment_url(Assesment.last)
  end

  test "should show assesment" do
    get assessment_url(@assesment)
    assert_response :success
  end

  test "should get edit" do
    get edit_assessment_url(@assesment)
    assert_response :success
  end

  test "should update assesment" do
    patch assessment_url(@assesment), params: {assesment: {name: @assesment.name, subject_id: @assesment.subject_id } }
    assert_redirected_to assessment_url(@assesment)
  end

  test "should destroy assesment" do
    assert_difference('Assesment.count', -1) do
      delete assessment_url(@assesment)
    end

    assert_redirected_to assessments_url
  end
end
