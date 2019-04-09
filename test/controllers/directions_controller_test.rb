require 'test_helper'
class DirectionsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  setup do
    @direction = directions(:one)
    @user = users(:one)
    @recipe = recipes(:one)
    sign_in @user
  end

  test 'should get index' do
    get directions_url
    assert_response :success
  end

  test 'should get new' do
    get new_direction_url recipe: @recipe.id
    assert_response :success
  end

  test 'should create direction' do
    assert_difference('Direction.count') do
      post directions_url, params: { direction: { name: 'new direction',
                                                    recipe_id: @recipe.id,
                                                    content: 'go to war!',
                                                    private: true } }
    end

    assert_redirected_to direction_url(Direction.last)
  end

  test 'should show direction' do
    get direction_url(@direction)
    assert_response :success
  end

  test 'should get edit' do
    get edit_direction_url(@direction)
    assert_response :success
  end

  test 'should update direction' do
    patch direction_url(@direction), params: { direction: {} }
    assert_redirected_to direction_url(@direction)
  end

  test 'should destroy direction' do
    assert_difference('Direction.count', -1) do
      delete direction_url(@direction)
    end

    assert_redirected_to directions_url
  end
end
