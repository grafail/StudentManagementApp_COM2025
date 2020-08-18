require 'test_helper'

class RoleTest < ActiveSupport::TestCase


  test 'user should have role' do
    user = users(:student)
    user.grant :student
    assert user.has_any_role? :student
  end


  test 'should not have role' do
    user = users(:student)
    refute user.has_any_role?
  end

end
