class CreateInstances < ActiveRecord::Migration[6.0]
  def change
    create_table :instances do |t|
      t.string :name
      t.string :instance_url
      t.string :username
      t.string :password
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
