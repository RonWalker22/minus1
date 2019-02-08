require 'test_helper'

class RespawnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @respawn = respawns(:one)
  end

  test "should get index" do
    get respawns_url
    assert_response :success
  end

  test "should get new" do
    get new_respawn_url
    assert_response :success
  end

  test "should create respawn" do
    assert_difference('Respawn.count') do
      post respawns_url, params: { respawn: { game_id: @respawn.game_id, name: @respawn.name } }
    end

    assert_redirected_to respawn_url(Respawn.last)
  end

  test "should show respawn" do
    get respawn_url(@respawn)
    assert_response :success
  end

  test "should get edit" do
    get edit_respawn_url(@respawn)
    assert_response :success
  end

  test "should update respawn" do
    patch respawn_url(@respawn), params: { respawn: { game_id: @respawn.game_id, name: @respawn.name } }
    assert_redirected_to respawn_url(@respawn)
  end

  test "should destroy respawn" do
    assert_difference('Respawn.count', -1) do
      delete respawn_url(@respawn)
    end

    assert_redirected_to respawns_url
  end
end
