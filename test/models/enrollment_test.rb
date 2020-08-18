require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase

  test 'should not save empty enrollment' do
    enrollment = Enrollment.new
    enrollment.save
    refute enrollment.valid?
  end

  test 'should not save invalid enrollment' do
    enrollment = Enrollment.new
    enrollment.subject_id=subjects(:one).id
    enrollment.user_id=-1
    enrollment.save
    refute enrollment.valid?
  end

  test 'should save duplicate enrollment' do
    enrollment = Enrollment.new
    enrollment.subject_id=subjects(:one).id
    enrollment.user_id=users(:student).id
    enrollment.save
    refute enrollment.valid?
  end

  test 'should save valid enrollment' do
    Enrollment.delete_all()
    enrollment = Enrollment.new
    enrollment.subject_id=subjects(:one).id
    enrollment.user_id=users(:student).id
    enrollment.save
    assert enrollment.valid?
  end

end
