class User < ApplicationRecord


    validates :user_name, presence: true, uniqueness: true
    validates :session_token, presence: true, uniqueness: true
    validates :password_digest, presence: true

    after_initialize :ensure_session_token

    attr_reader :password

    def self.generate_session_token
        SecureRandom::urlsafe_base64
    end

    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end

    def ensure_session_token
        self.session_token ||= User.generate_session_token
    end

    def reset_session_token
        self.session_token = User.generate_session_token
        self.save!
        self.session_token
    end

    def password=(password)
        @password = password
        self.password_digest = BCrypt::Password.create(password)
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    has_many :cats,
        foreign_key: :user_id,
        class_name: :Cat

end
