class User < ActiveRecord::Base
    def User::create_user! input_hash
        current_session = SecureRandom.base64 
        return User.create!(input_hash.permit(:user_id, :email).merge(session_token: current_session))
    end
end
