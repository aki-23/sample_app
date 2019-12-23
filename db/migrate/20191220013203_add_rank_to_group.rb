class AddRankToGroup < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :rank, :integer
  end
end
