require 'test_helper'

class PacientesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pacientes_index_url
    assert_response :success
  end

end
