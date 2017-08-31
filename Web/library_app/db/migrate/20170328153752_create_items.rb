class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :title
      t.integer :ISBN
      t.string :Description

      t.timestamps null: false
    end
  end
end
