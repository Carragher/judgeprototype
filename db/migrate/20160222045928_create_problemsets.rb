class CreateProblemsets < ActiveRecord::Migration
  def change
    create_table :problemsets do |t|
      t.integer :problem
      t.string :attachment

      t.timestamps null: false
    end
  end
end
