require "application_system_test_case"

class BusdetailsTest < ApplicationSystemTestCase
  setup do
    @busdetail = busdetails(:one)
  end

  test "visiting the index" do
    visit busdetails_url
    assert_selector "h1", text: "Busdetails"
  end

  test "should create busdetail" do
    visit busdetails_url
    click_on "New busdetail"

    fill_in "Available seats", with: @busdetail.available_seats
    fill_in "Bus name", with: @busdetail.bus_name
    fill_in "Bus no", with: @busdetail.bus_no
    fill_in "End time", with: @busdetail.end_time
    fill_in "Start time", with: @busdetail.start_time
    fill_in "Total seats", with: @busdetail.total_seats
    click_on "Create Busdetail"

    assert_text "Busdetail was successfully created"
    click_on "Back"
  end

  test "should update Busdetail" do
    visit busdetail_url(@busdetail)
    click_on "Edit this busdetail", match: :first

    fill_in "Available seats", with: @busdetail.available_seats
    fill_in "Bus name", with: @busdetail.bus_name
    fill_in "Bus no", with: @busdetail.bus_no
    fill_in "End time", with: @busdetail.end_time
    fill_in "Start time", with: @busdetail.start_time
    fill_in "Total seats", with: @busdetail.total_seats
    click_on "Update Busdetail"

    assert_text "Busdetail was successfully updated"
    click_on "Back"
  end

  test "should destroy Busdetail" do
    visit busdetail_url(@busdetail)
    click_on "Destroy this busdetail", match: :first

    assert_text "Busdetail was successfully destroyed"
  end
end
