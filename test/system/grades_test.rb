require 'application_system_test_case'

class GradesTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    set_up_users
    sign_in @admin
    @grade = grades(:one)
  end

  test 'visiting the index' do
    visit grades_url
    assert_selector 'h1', text: 'Manage grades'
  end

  test 'creating a Grade' do
    Grade.delete(@grade)
    visit grades_url
    click_on 'New Grade'

    fill_in 'Assessment', with: @grade.assessment_id
    fill_in 'Grade', with: @grade.grade
    fill_in 'User', with: @grade.user_id
    click_on 'Submit'

    assert_text 'Submission was successful!'
  end

  test 'updating a Grade' do
    visit grades_url
    within('.tabulator-table') do
      cells = all('.tabulator-cell')
      cells[5].click()
      cells[5].fill_in(with: '30')
      cells[5].send_keys(:return)
    end

    assert_text 'Edit was successful!'
  end

  test 'destroying a Grade' do
    visit grades_url
    within('.tabulator-table') do
      find('.DELETE_BUTTON_CLASS', :match => :first).click()
    end


    assert_text 'Removal was successful!'
  end
end
