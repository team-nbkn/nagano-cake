require 'test_helper'

class Costomers::OrderInfomationsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get costomers_order_infomations_new_url
    assert_response :success
  end

  test "should get confirm" do
    get costomers_order_infomations_confirm_url
    assert_response :success
  end

  test "should get thank" do
    get costomers_order_infomations_thank_url
    assert_response :success
  end

  test "should get index" do
    get costomers_order_infomations_index_url
    assert_response :success
  end

  test "should get show" do
    get costomers_order_infomations_show_url
    assert_response :success
  end

end
