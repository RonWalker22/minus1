require 'test_helper'

class ModesControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include AuthorizationTests
  setup do
    @mode = modes(:one)
    @mode_two = @record = modes(:two)
    @game = games(:one)
    @game = games(:two)
    @operator = operators(:one)
    sign_in @operator
  end

  test 'should create mode' do
    assert_difference('Mode.count') do
      post modes_url, params: { mode: { game_id: @mode.game_id,
                                        name: 'Control' } }
    end
  end

  test 'should not create duplicate mode' do
    assert_no_difference('Mode.count') do
      begin
        post modes_url, params: { mode: { game_id: @mode.game_id, name: @mode.name } }
      rescue ActiveRecord::RecordNotUnique => invalid
      end
      assert invalid
    end
  end

  test 'should get edit' do
    get edit_mode_url(@mode)
    assert_response :success
  end

  test 'should update mode' do
    patch mode_url(@mode), params: { mode: { game_id: @mode.game_id, name: @mode.name } }
  end

  test 'should destroy mode' do
    assert_difference('Mode.count', -1) do
      delete mode_url(@mode)
    end
  end
end
