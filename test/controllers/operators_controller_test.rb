require 'test_helper'

class OperatorsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @operator = operators(:one)
    sign_in @operator
  end

  test 'should get index' do
    get operators_url
    assert_response :success
  end

  test 'should show operator' do
    get operator_url(@operator)
    assert_response :success
  end
end
