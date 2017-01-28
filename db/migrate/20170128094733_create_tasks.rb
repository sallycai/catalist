class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :goal, index: true, foreign_key: true
      t.text :name
      t.integer :frequency
      t.integer :completion_status, default: 0

      t.timestamps null: false
    end
  end
end
