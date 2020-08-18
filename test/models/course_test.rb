require 'test_helper'

class CourseTest < ActiveSupport::TestCase

  test 'should not save empty course' do
    course = Course.new
    course.save
    refute course.valid?
  end

  test 'should not save invalid course' do
    course = Course.new
    course.courseType = "MSc"
    course.year = 2020.5
    course.title = "Test"
    course.save
    refute course.valid?
  end

  test 'should save valid course' do
    course = Course.new
    course.courseType = "MSc"
    course.year = 2020
    course.title = "Test"
    course.save
    assert course.valid?
  end

end
