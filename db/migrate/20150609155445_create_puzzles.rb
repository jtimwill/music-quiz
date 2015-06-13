class CreatePuzzles < ActiveRecord::Migration
  def change
    create_table :puzzles do |t|
      t.integer :quiz_id
      t.string :question
      t.string :answer
      t.timestamps
    end
  end
end
