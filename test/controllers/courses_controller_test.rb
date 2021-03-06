require 'test_helper'

class CoursesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @course = courses(:one)
    set_up_users
    sign_in @admin
  end

  test "should get index" do
    get courses_url
    assert_response :success
  end

  test "should create course" do
    Course.delete(@course)
    assert_difference('Course.count') do
      post courses_url, params: { course: { courseType: @course.courseType, title: @course.title, year: @course.year } }
    end

    assert_redirected_to courses_url
  end

  test "should not create course without permission" do
    sign_in @student
    Course.delete(@course)
    assert_no_difference('Course.count') do
      post courses_url, params: { course: { courseType: @course.courseType, title: @course.title, year: @course.year } }
    end
  end

  test "should show course" do
    get course_url(@course)
    assert_redirected_to courses_url
  end

  test "should update course" do
    patch course_url(@course), params: { course: { courseType: @course.courseType, title: @course.title, year: @course.year } }
    assert_redirected_to courses_url
  end

  test "should destroy course" do
    assert_difference('Course.count', -1) do
      delete course_url(@course)
    end

    assert_redirected_to courses_url
  end
end
