ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def set_up_users
    @admin = users(:admin)
    @admin.grant :admin
    @staff = users(:staff)
    @staff.grant :staff
    @student = users(:student)
    @student.grant :student
  end

end
