class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :owner_id
      t.boolean :is_approved
      t.boolean :is_disable

      t.timestamps
    end
  end
end
