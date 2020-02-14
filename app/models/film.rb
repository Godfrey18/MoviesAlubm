
class Film < ApplicationRecord
	belongs_to :user
	validates :name,:genere,:langauge,presence:true
	validates :user_id,presence:true
end