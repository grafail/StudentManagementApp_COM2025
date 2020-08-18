require 'application_system_test_case'

class SubjectsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    set_up_users
    sign_in @admin
    @subject = subjects(:one)
  end

  test 'visiting the index' do
    visit subjects_url
    assert_selector 'h1', text: 'Manage Subjects'
  end

  test 'creating a Subject' do
    Subject.delete(@subject)
    visit subjects_url
    click_on 'New Subject'

    fill_in 'Course', with: @subject.course_id
    fill_in 'Lecturer', with: @subject.user_id
    fill_in 'Title', with: @subject.title
    fill_in 'Description', with: @subject.description
    click_on 'Submit'

    assert_text 'Submission was successful!'
  end

  test 'updating a Subject' do
    visit subjects_url
    within('.tabulator-table') do
      cells = all('.tabulator-cell')
      cells[5].click()
      cells[5].fill_in(with: 'Test')
      cells[5].send_keys(:return)
    end

    assert_text 'Edit was successful!'
  end

  test 'destroying a Subject' do
    visit subjects_url
    within('.tabulator-table') do
      find('.DELETE_BUTTON_CLASS', :match => :first).click()
    end


    assert_text 'Removal was successful!'
  end
end
