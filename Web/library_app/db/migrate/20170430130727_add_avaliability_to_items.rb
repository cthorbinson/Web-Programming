class AddAvaliabilityToItems < ActiveRecord::Migration
  def change
    add_column :items, :avaliability, :string
  end
end
