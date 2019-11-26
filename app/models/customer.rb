class Customer < ApplicationRecord
	has_many :instances
	has_many :users
end
