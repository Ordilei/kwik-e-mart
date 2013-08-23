class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name, :null => false, :limit => 70
    	t.string :email, :null => false, :limit => 70
    	t.string :password, :null => false, :limit => 12
      t.timestamps
    end

    add_index :users, :email, :unique => true
  end
end
