require 'test_helper'

class ModesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mode = modes(:one)
  end

  test "should get index" do
    get modes_url
    assert_response :success
  end

  test "should get new" do
    get new_mode_url
    assert_response :success
  end

  test "should create mode" do
    assert_difference('Mode.count') do
      post modes_url, params: { mode: { game_id: @mode.game_id, level_id: @mode.level_id, name: @mode.name } }
    end

    assert_redirected_to mode_url(Mode.last)
  end

  test "should show mode" do
    get mode_url(@mode)
    assert_response :success
  end

  test "should get edit" do
    get edit_mode_url(@mode)
    assert_response :success
  end

  test "should update mode" do
    patch mode_url(@mode), params: { mode: { game_id: @mode.game_id, level_id: @mode.level_id, name: @mode.name } }
    assert_redirected_to mode_url(@mode)
  end

  test "should destroy mode" do
    assert_difference('Mode.count', -1) do
      delete mode_url(@mode)
    end

    assert_redirected_to modes_url
  end
end
