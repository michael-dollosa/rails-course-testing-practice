class AddPasswordDigestToUsers < ActiveRecord::Migration[6.1]
  def change
    #you can check this in google - rail has_secure_password
    add_column :users, :password_digest, :string
  end
end
