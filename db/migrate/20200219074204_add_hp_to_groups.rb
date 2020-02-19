class AddHpToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :hp, :string
  end
end
