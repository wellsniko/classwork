class PostSub < ApplicationRecord
    validates :sub_id, presence: true
    validates :post_id, uniqueness: {scope: :sub_id}

    belongs_to :subs,
        foreign_key: :sub_id,
        class_name: :Sub

    belongs_to :posts,
        foreign_key: :post_id,
        class_name: :Post
end

