require 'test_helper'

class RespawnsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include AuthorizationTests
  setup do
    @respawn = respawns(:one)
    @respawn_two = @record = respawns(:two)
    @game = games(:one)
    @game_two = games(:two)
    @operator = operators(:one)
    sign_in @operator
  end

  test 'should not create duplicate respawn' do
    assert_no_difference('Respawn.count') do
      begin
        post respawns_url, params: { respawn: { game_id: @respawn.game_id, name: @respawn.name, level_id: [@game.levels.first] } }
      rescue ActiveRecord::RecordNotUnique => invalid
      end
      assert invalid
    end
  end

  test 'should create respawn' do
    assert_difference('Respawn.count') do
      post respawns_url, params: { respawn: { game_id: @respawn.game_id, name: 'R2', level_id: [@game.levels.first] } }
    end
  end

  test 'should get edit' do
    get edit_respawn_url(@respawn)
    assert_response :success
  end

  test 'should update respawn' do
    patch respawn_url(@respawn), params: { respawn: { game_id: @respawn.game_id,
                                              name: @respawn.name, 
                                              level_id: [@game.levels.first] } }
  end

  # this operator is not authorized(did not create)
  test 'should not update respawn' do
    begin
      patch respawn_url(@respawn_two), params: { respawn: { 
                                            game_id:@respawn.game_id, 
                                            name: @respawn.name, 
                                            level_id: [@game.levels.first] } }
    rescue Pundit::NotAuthorizedError => invalid
    end
    assert invalid
  end

  test 'should destroy respawn' do
    assert_difference('Respawn.count', -1) do
      delete respawn_url(@respawn)
    end
  end
end
