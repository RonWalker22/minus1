require 'test_helper'
class LocationsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  include AuthorizationTests
  setup do
    @location = locations(:one)
    @location_two = @record = locations(:two)
    @game = games(:one)
    @game_two = games(:two)
    @user = users(:one)
    sign_in @user
  end

  test 'should create location' do
    assert_difference('Location.count') do
      post locations_url, params: { location: { name: 'New Location22',
                                                game_id: @game.id, level_id: [@location.level_ids.first] } }
    end
  end

  test 'should not create location' do
    assert_no_difference('Location.count') do
      begin
        post locations_url, params: { location: { name: @location.name,
                                                  game_id: @game.id, level_id: [@location.level_ids.first] } }
      rescue ActiveRecord::RecordNotUnique => invalid
      end
      assert invalid
    end
  end

  test 'should get edit' do
    get edit_location_url(@location)
    assert_response :success
  end

  test 'should update location' do
    patch location_url(@location), params: { location: { name: 'New level',
                                                         game_id: @game.id, level_id: [@location.level_ids.first] } }
  end

  test 'should destroy location' do
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end
  end
end
