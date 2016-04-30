class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.string :problem
      t.string :attachment
      t.string :username



      t.timestamps null: false
    end
  end
end
