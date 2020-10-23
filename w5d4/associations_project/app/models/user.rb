class User < ApplicationRecord
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :stu
end
