require 'test_helper'

class SubjectTest < ActiveSupport::TestCase

  test 'should not save empty subject' do
    subject = Subject.new
    subject.save
    refute subject.valid?
  end

  test 'should not save invalid subject' do
    subject = Subject.new
    subject.course_id = -1
    subject.user_id = users(:staff).id
    subject.title = "Test"
    subject.save
    refute subject.valid?
  end

  test 'should save invalid subject' do
    subject = Subject.new
    subject.course_id = courses(:one).id
    subject.user_id = users(:staff).id
    subject.title = "Test"
    subject.save
    assert subject.valid?
  end

end
