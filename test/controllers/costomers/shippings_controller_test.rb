require 'test_helper'

class Costomers::ShippingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get costomers_shippings_index_url
    assert_response :success
  end

  test "should get edit" do
    get costomers_shippings_edit_url
    assert_response :success
  end

end
