class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_hash
    remove_column :users, :email 

      t.timestamps
    end

  end
end
