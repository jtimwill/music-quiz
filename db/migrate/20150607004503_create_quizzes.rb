class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :category
      t.integer :score
      t.integer :user_id
      t.string :slug
      t.timestamps
    end
  end
end
