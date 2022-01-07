class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :points
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
