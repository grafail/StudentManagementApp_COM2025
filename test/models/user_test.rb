require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'should not save empty user' do
    user = User.new
    user.save
    refute user.valid?
  end

  test 'should not save invalid user' do
    user = User.new
    user.firstname = "John"
    user.lastname = "Doe"
    user.email = "test5@example.org"
    user.password = "123456"
    user.course_id = -1
    user.save
    puts(User.all)
    refute user.valid?
  end

  test 'should not save duplicate user' do
    user = User.new
    user.firstname = "John"
    user.lastname = "Doe"
    user.email = "test2@example.org"
    user.password = "123456"
    user.course_id = courses(:one).id
    user.save
    refute user.valid?
  end

  test 'should save valid user' do
    user = User.new
    user.firstname = "John"
    user.lastname = "Doe"
    user.email = "test6@example.org"
    user.password = "123456"
    user.course_id = courses(:one).id
    user.save
    assert user.valid?
  end

end
