class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :roles
      t.string :password_digest
      t.string :slug
      t.timestamps
    end
  end
end
