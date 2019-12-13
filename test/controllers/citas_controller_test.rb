require 'test_helper'

class CitasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get citas_index_url
    assert_response :success
  end

end
