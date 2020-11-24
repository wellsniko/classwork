class Post < ApplicationRecord
    validates :title, :sub_id, :author_id, presence: true

    has_many :post_subs,
        primary_key: :id,
        foreign_key: :post_id,
        class_name: :PostSub,
        inverse_of: :posts

    belongs_to :author,
        foreign_key: :author_id,
        class_name: :User

    has_many :subs,
        through: :post_subs,
        source: :subs
end
