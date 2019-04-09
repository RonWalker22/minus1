ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def self.random_index
    [0, 1].sample
  end

  module AuthorizationTests
    extend ActiveSupport::Concern
    included do
      # this user is not authorized(did not create)
      test 'should not destroy' do
        assert_no_difference(@record.class.name + '.count', -1) do
          begin
            delete url_for(@record)
          rescue Pundit::NotAuthorizedError => invalid
          end
          assert invalid
        end
      end

      test 'should allow admin to destroy' do
        @user.add_role(:admin)
        assert_difference(@record.class.name + '.count', -1) do
          delete url_for(@record)
        end
      end

      test 'should allow maintainer to destroy' do
        @user.add_role(:maintainer, @game_two)
        assert_difference(@record.class.name + '.count', -1) do
          delete url_for(@record)
        end
      end

      # this user is not authorized(did not create)
      test 'should not allow contributor to destroy' do
        @user.add_role(:contributor, @game_two)
        assert_no_difference(@record.class.name + '.count', -1) do
          begin
            delete url_for(@record)
          rescue Pundit::NotAuthorizedError => invalid
          end
          assert invalid
        end
      end
    end
  end
end
