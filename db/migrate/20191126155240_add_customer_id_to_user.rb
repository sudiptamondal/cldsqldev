class AddCustomerIdToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :customer_id, :integer
  end
end
