require 'test_helper'

class OperatorRecipeTest < ActiveSupport::TestCase
  test 'disallows duplicate OperatorRecipe' do
    begin
      OperatorRecipe.create!(operator_id: Operator.first.id,
                             recipe_id: Recipe.first.id)
    rescue ActiveRecord::RecordNotUnique => invalid
    end
    assert invalid
  end
end
