require 'test_helper'

class GradeTest < ActiveSupport::TestCase

  test 'should not save empty grade' do
    grade = Grade.new
    grade.save
    refute grade.valid?
  end

  test 'should not save invalid grade' do
    grade = Grade.new
    grade.assessment_id=assessments(:one).id
    grade.user_id=users(:student)
    grade.grade = -10
    grade.save
    refute grade.valid?
  end

  test 'should not save duplicate grade' do
    grade = Grade.new
    grade.assessment_id=assessments(:one).id
    grade.user_id=users(:student).id
    grade.grade=10
    grade.save
    refute grade.valid?
  end

  test 'should save valid grade' do
    Grade.delete_all
    grade = Grade.new
    grade.assessment_id=assessments(:one).id
    grade.user_id=users(:student).id
    grade.grade=10
    grade.save
    assert grade.valid?
  end

end
