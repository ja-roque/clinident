require 'test_helper'

class MedicosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get medicos_index_url
    assert_response :success
  end

end
