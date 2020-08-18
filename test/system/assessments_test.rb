require 'application_system_test_case'

class AssessmentsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    set_up_users
    sign_in @admin
    @assessment = assessments(:one)
  end

  test 'visiting the index' do
    visit assessments_url
    assert_selector 'h1', text: 'Manage Assessments'
  end

  test 'creating a Assessment' do
    Assessment.delete(@assessment)
    visit assessments_url
    click_on 'New Assessment'

    fill_in 'Name', with: @assessment.name
    fill_in 'Subject', with: @assessment.subject_id
    click_on 'Submit'

    assert_text 'Submission was successful!'
  end

  test 'updating a Assessment' do
    visit assessments_url
    within('.tabulator-table') do
      cells = all('.tabulator-cell')
      cells[2].click()
      cells[2].fill_in(with: 'Test')
      cells[2].send_keys(:return)
    end

    assert_text 'Edit was successful!'
  end

  test 'destroying a Assessment' do
    visit assessments_url
    within('.tabulator-table') do
      find('.DELETE_BUTTON_CLASS', :match => :first).click()
    end


    assert_text 'Removal was successful!'
  end
end
