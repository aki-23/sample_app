class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.string :region, null: false
      t.string :prefecture, null: false
      t.timestamps
    end
  end
end
