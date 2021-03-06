require 'test_helper'

class SubjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @subject = subjects(:one)
    set_up_users
    sign_in @admin
  end

  test "should get index" do
    get subjects_url
    assert_response :success
  end

  test "should create subject" do
    Subject.delete(@subject)
    assert_difference('Subject.count') do
      post subjects_url, params: { subject: { title:@subject.title, course_id: @subject.course_id, description: @subject.description, user_id: @subject.user_id } }
    end

    assert_redirected_to subjects_url
  end

  test "should not create subject without permission" do
    sign_in @student
    Subject.delete(@subject)
    assert_no_difference('Subject.count') do
      post subjects_url, params: { subject: { title:@subject.title, course_id: @subject.course_id, description: @subject.description, user_id: @subject.user_id } }
    end
  end

  test "should show subject" do
    get subject_url(@subject)
    assert_redirected_to subjects_url
  end

  test "should update subject" do
    patch subject_url(@subject), params: { subject: { title:@subject.title, course_id: @subject.course_id, description: @subject.description, user_id: @subject.user_id } }
    assert_response :found
  end

  test "should destroy subject" do
    assert_difference('Subject.count', -1) do
      delete subject_url(@subject)
    end

    assert_redirected_to subjects_url
  end
end
