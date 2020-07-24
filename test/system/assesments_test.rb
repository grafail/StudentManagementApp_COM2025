require "application_system_test_case"

class AssesmentsTest < ApplicationSystemTestCase
  setup do
    @assesment = assesments(:one)
  end

  test "visiting the index" do
    visit assesments_url
    assert_selector "h1", text: "Assesments"
  end

  test "creating a Assesment" do
    visit assesments_url
    click_on "New Assesment"

    fill_in "Name", with: @assesment.name
    fill_in "Subject", with: @assesment.subject_id
    click_on "Create Assesment"

    assert_text "Assesment was successfully created"
    click_on "Back"
  end

  test "updating a Assesment" do
    visit assesments_url
    click_on "Edit", match: :first

    fill_in "Name", with: @assesment.name
    fill_in "Subject", with: @assesment.subject_id
    click_on "Update Assesment"

    assert_text "Assesment was successfully updated"
    click_on "Back"
  end

  test "destroying a Assesment" do
    visit assesments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assesment was successfully destroyed"
  end
end
