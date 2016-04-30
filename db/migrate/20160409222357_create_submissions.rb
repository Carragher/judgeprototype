class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.integer :userId
      t.integer :problemId
      t.text :code
      t.text :result
      t.string :job
      t.string :job_id

      t.timestamps null: false
    end
  end
end
