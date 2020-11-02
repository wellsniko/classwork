# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    include ActionView::Helpers::DateHelper
    COLORS = ["black", "orange", "grey", "white", "multi-colored", "naked"]
    validates :birth_date, :color, :name, :sex, presence: true
    validate :check_sex
    validates :color, :inclusion => {:in => COLORS}

    def check_sex
        if sex != "M" && sex != "F"
            errors[:sex] << "Wrong value for sex"
        end
    end
    
    

    def age
        time_ago_in_words(birth_date)
    end

    
end
