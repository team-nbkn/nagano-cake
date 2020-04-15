require 'test_helper'

class Admins::OrderInformationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_order_informations_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_order_informations_show_url
    assert_response :success
  end

end
