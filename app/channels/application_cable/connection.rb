module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_operator

    def connect
      self.current_operator = find_verified_operator
    end

    private

      def find_verified_operator
        if key = request.params[:api_key]
          verified_operator = Operator.find_by(api_key: 
                                                    Digest::SHA2.hexdigest(key),
                                               online: false)
          verified_operator || reject_unauthorized_connection
        else
          reject_unauthorized_connection
        end
      end
  end
end
