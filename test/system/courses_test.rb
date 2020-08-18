require 'application_system_test_case'

class CoursesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    set_up_users
    sign_in @admin
    @course = courses(:one)
  end

  test 'visiting the index' do
    visit courses_url
    assert_selector 'h1', text: 'Manage courses'
  end

  test 'creating a Course' do
    Course.delete(@course)
    visit courses_url
    click_on 'New Course'

    fill_in 'Type', with: @course.courseType
    fill_in 'Title', with: @course.title
    fill_in 'Year', with: @course.year
    click_on 'Submit'

    assert_text 'Submission was successful!'
  end

  test 'updating a Course' do
    visit courses_url
    within('.tabulator-table') do
      cells = all('.tabulator-cell')
      cells[1].click()
      cells[1].fill_in(with: 'MSc')
      cells[1].send_keys(:return)
    end

    assert_text 'Edit was successful!'
  end

  test 'destroying a Course' do
    visit courses_url
    within('.tabulator-table') do
      find('.DELETE_BUTTON_CLASS', :match => :first).click()
    end


    assert_text 'Removal was successful!'
  end
end
