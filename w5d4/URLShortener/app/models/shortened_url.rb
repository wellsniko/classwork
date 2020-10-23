class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true, uniqueness: true

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    def self.random_url
        while true
            code = SecureRandom.urlsafe_base64
            return code if !ShortenedUrl.exists?(short_url: code)
        end
    end

    def self.create_for_no_short_url(user, long_url)
        ShortenedUrl.create!( 
            user_id: user.id, long_url: long_url, short_url: ShortenedUrl.random_url
        )
    end
end
