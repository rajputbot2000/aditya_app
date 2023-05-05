class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :task
      t.integer :points
      t.float :reward
      t.string :logo

      t.timestamps
    end
  end
end
