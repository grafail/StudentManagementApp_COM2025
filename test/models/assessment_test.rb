require 'test_helper'

class AssessmentTest < ActiveSupport::TestCase

  test 'should not save empty assessment' do
    assessment = Assessment.new
    assessment.save
    refute assessment.valid?
  end

  test 'should not save invalid assessment' do
    assessment = Assessment.new
    assessment.subject_id=-1
    assessment.name = "Test"
    assessment.save
    refute assessment.valid?
  end

  test 'should save valid assessment' do
    assessment = Assessment.new
    assessment.subject_id= subjects(:one).id
    assessment.name = "Test"
    assessment.save
    assert assessment.valid?
  end

end
