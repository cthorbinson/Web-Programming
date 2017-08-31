class ChangeIsbnType < ActiveRecord::Migration
  def change
    change_column(:items, :ISBN, :string)
  end
end
