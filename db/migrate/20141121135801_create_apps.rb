class CreateApps < ActiveRecord::Migration
  def change
    create_table :apps do |t|
      t.string :name
      t.string :permalink
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
