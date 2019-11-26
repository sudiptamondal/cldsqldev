class AddWsdlUrlToInstance < ActiveRecord::Migration[6.0]
  def change
    add_column :instances, :wsdl_url, :string
  end
end
