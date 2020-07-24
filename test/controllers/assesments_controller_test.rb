require 'test_helper'

class AssesmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assesment = assesments(:one)
  end

  test "should get index" do
    get assesments_url
    assert_response :success
  end

  test "should get new" do
    get new_assesment_url
    assert_response :success
  end

  test "should create assesment" do
    assert_difference('Assesment.count') do
      post assesments_url, params: { assesment: { name: @assesment.name, subject_id: @assesment.subject_id } }
    end

    assert_redirected_to assesment_url(Assesment.last)
  end

  test "should show assesment" do
    get assesment_url(@assesment)
    assert_response :success
  end

  test "should get edit" do
    get edit_assesment_url(@assesment)
    assert_response :success
  end

  test "should update assesment" do
    patch assesment_url(@assesment), params: { assesment: { name: @assesment.name, subject_id: @assesment.subject_id } }
    assert_redirected_to assesment_url(@assesment)
  end

  test "should destroy assesment" do
    assert_difference('Assesment.count', -1) do
      delete assesment_url(@assesment)
    end

    assert_redirected_to assesments_url
  end
end
