class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|

      t.text :probText
      t.text :input
      t.text :output

      t.timestamps null: false
    end
  end
end
