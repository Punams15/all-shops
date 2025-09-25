class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :email, :string, null: false unless column_exists?(:users, :email)
    add_column :users, :name, :string unless column_exists?(:users, :name)
    add_column :users, :password_digest, :string, null: false unless column_exists?(:users, :password_digest)

    add_index :users, :email, unique: true unless index_exists?(:users, :email)
  end
end

