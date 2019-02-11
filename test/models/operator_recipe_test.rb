require 'test_helper'

class OperatorRecipeTest < ActiveSupport::TestCase
  setup do
    @operator = operators(:one)
    @recipe = recipes(:one)
  end
  test 'disallows duplicate OperatorRecipe' do
    begin
      OperatorRecipe.create!(operator_id: @operator.id,
                             recipe_id: @recipe.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end
end
