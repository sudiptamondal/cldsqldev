include Secret
class Instance < ApplicationRecord
  belongs_to :customer
  before_save :hash_password

  private
  	def hash_password
  		self.password = cldencrypt self.password 
  	end
end
