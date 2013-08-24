class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :password_digest, :text, :null => false
  end

end
