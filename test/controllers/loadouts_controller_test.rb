require 'test_helper'

class LoadoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loadout = loadouts(:one)
  end

  test "should get index" do
    get loadouts_url
    assert_response :success
  end

  test "should get new" do
    get new_loadout_url
    assert_response :success
  end

  test "should create loadout" do
    assert_difference('Loadout.count') do
      post loadouts_url, params: { loadout: { game_id: @loadout.game_id, kind: @loadout.kind, name: @loadout.name, operator_id: @loadout.operator_id } }
    end

    assert_redirected_to loadout_url(Loadout.last)
  end

  test "should show loadout" do
    get loadout_url(@loadout)
    assert_response :success
  end

  test "should get edit" do
    get edit_loadout_url(@loadout)
    assert_response :success
  end

  test "should update loadout" do
    patch loadout_url(@loadout), params: { loadout: { game_id: @loadout.game_id, kind: @loadout.kind, name: @loadout.name, operator_id: @loadout.operator_id } }
    assert_redirected_to loadout_url(@loadout)
  end

  test "should destroy loadout" do
    assert_difference('Loadout.count', -1) do
      delete loadout_url(@loadout)
    end

    assert_redirected_to loadouts_url
  end
end
