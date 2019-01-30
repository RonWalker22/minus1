require 'test_helper'

class ModeTest < ActiveSupport::TestCase
  setup do
    @mode = modes(:one)
  end

  test 'has strategies' do
    assert_equal 'Strategy', @mode.strategies.first.class.name
  end
end
