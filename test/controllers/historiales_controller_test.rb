require 'test_helper'

class HistorialesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get historiales_index_url
    assert_response :success
  end

end
