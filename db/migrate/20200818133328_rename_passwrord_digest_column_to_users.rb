class RenamePasswrordDigestColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :passwrord_digest, :password_digest
  end
end
