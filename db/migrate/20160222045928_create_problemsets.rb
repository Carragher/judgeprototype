class CreateProblemsets < ActiveRecord::Migration
  def change
    create_table :problemsets do |t|
      t.string :problem
      t.string :attachment

      t.timestamps null: false
    end
  end
end
