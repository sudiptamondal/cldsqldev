class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.string :key
      t.string :value
      t.text :desc

      t.timestamps
    end
  end
end
