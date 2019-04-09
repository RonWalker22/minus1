module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private

      def find_verified_user
        if key = request.params[:api_key]
          verified_user = User.find_by(api_key: 
                                                    Digest::SHA2.hexdigest(key),
                                               online: false)
          verified_user || reject_unauthorized_connection
        else
          reject_unauthorized_connection
        end
      end
  end
end
