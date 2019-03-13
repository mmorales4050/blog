class OnlyMigrationNeeded < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :body
      t.string :category
      t.integer :user_id
    end

    create_table :users do |t|
      t.string :name
    end
  end
end
