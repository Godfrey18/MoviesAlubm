
class Film < ApplicationRecord
	validates :name,:genere,:langauge,presence:true
end