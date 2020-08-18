require 'application_system_test_case'

class EnrollmentsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    set_up_users
    sign_in @admin
    @enrollment = enrollments(:one)
  end

  test 'visiting the index' do
    visit enrollments_url
    assert_selector 'h1', text: 'Manage Enrollments'
  end

  test 'creating a Enrollment' do
    Enrollment.delete(@enrollment)
    visit enrollments_url
    click_on 'New Enrollment'

    fill_in 'Subject', with: @enrollment.subject_id
    fill_in 'User', with: @enrollment.user_id
    click_on 'Submit'

    assert_text 'Submission was successful!'
  end

  test 'updating a Enrollment' do
    visit enrollments_url
    within('.tabulator-table') do
      cells = all('.tabulator-cell')
      cells[0].click()
      cells[0].fill_in(with: @admin.id)
      cells[0].send_keys(:return)
    end

    assert_text 'Edit was successful!'
  end

  test 'destroying a Enrollment' do
    visit enrollments_url
    within('.tabulator-table') do
      find('.DELETE_BUTTON_CLASS', :match => :first).click()
    end


    assert_text 'Removal was successful!'
  end
end
