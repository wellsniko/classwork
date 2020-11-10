class Sub < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :description, :moderator_id, presence: true
    
    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User

    has_many :post_subs,
        primary_key: :id,
        foreign_key: :sub_id,
        class_name: :PostSub,
        inverse_of: :subs

    has_many :posts,
        through: :post_subs,
        source: :posts
end