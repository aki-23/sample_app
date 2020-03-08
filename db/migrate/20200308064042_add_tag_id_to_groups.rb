class AddTagIdToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :tag_id, :integer
  end
end
