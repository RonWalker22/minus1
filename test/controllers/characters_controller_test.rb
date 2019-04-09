require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include AuthorizationTests
  setup do
    @character = characters(:one)
    @character_two = @record = characters(:two)
    @game = games(:one)
    @game = games(:two)
    @user = users(:one)
    sign_in @user
  end

  test 'should create character' do
    assert_difference('Character.count') do
      post characters_url, params: { character: { game_id: @character.game_id, name: 'New character' } }
    end
  end

  test 'should not create duplicate character' do
    assert_no_difference('Character.count') do
      begin
        post characters_url, params: { character: { game_id: @character.game_id, name: @character.name } }
      rescue ActiveRecord::RecordNotUnique => invalid
      end
      assert invalid
    end
  end

  test 'should get edit' do
    get edit_character_url(@character)
    assert_response :success
  end

  test 'should update character' do
    patch character_url(@character), params: { character: { game_id: @character.game_id, name: 'Bam' } }
  end

  test 'should destroy character' do
    assert_difference('Character.count', -1) do
      delete character_url(@character)
    end
  end
end
