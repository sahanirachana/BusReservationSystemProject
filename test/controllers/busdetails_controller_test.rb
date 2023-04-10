require "test_helper"

class BusdetailsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @busdetail = busdetails(:one)
  end

  test "should get index" do
    get busdetails_url
    assert_response :success
  end

  test "should get new" do
    get new_busdetail_url
    assert_response :success
  end

  test "should create busdetail" do
    assert_difference("Busdetail.count") do
      post busdetails_url, params: { busdetail: { available_seats: @busdetail.available_seats, bus_name: @busdetail.bus_name, bus_no: @busdetail.bus_no, end_time: @busdetail.end_time, start_time: @busdetail.start_time, total_seats: @busdetail.total_seats } }
    end

    assert_redirected_to busdetail_url(Busdetail.last)
  end

  test "should show busdetail" do
    get busdetail_url(@busdetail)
    assert_response :success
  end

  test "should get edit" do
    get edit_busdetail_url(@busdetail)
    assert_response :success
  end

  test "should update busdetail" do
    patch busdetail_url(@busdetail), params: { busdetail: { available_seats: @busdetail.available_seats, bus_name: @busdetail.bus_name, bus_no: @busdetail.bus_no, end_time: @busdetail.end_time, start_time: @busdetail.start_time, total_seats: @busdetail.total_seats } }
    assert_redirected_to busdetail_url(@busdetail)
  end

  test "should destroy busdetail" do
    assert_difference("Busdetail.count", -1) do
      delete busdetail_url(@busdetail)
    end

    assert_redirected_to busdetails_url
  end
end
