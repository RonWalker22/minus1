require 'test_helper'

class UserRecipeTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
    @recipe = recipes(:one)
  end
  test 'disallows duplicate UserRecipe' do
    begin
      UserRecipe.create!(user_id: @user.id,
                             recipe_id: @recipe.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end
end
