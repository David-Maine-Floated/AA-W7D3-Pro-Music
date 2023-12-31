# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#


#figvapebr
class User < ApplicationRecord

    before_validation :ensure_token

    validates :email, presence: true, uniqueness: true 
    validates :session_token, presence: true, uniqueness: true   #why????
    validates :password_digest, presence: true 
    validates :password, allow_nil: true, length: {minimum:6}




    attr_reader :password 

    def self.find_user_by_credentials(email, password) 
        user = User.find_by(email: email)
        if user && user.is_password?(password)
            user 
        else  
            nil 
        end 
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def ensure_token 
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def reset_session_token! #login
        self.session_token = SecureRandom::urlsafe_base64
        self.save! 
        self.session_token 
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end


end