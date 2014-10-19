class AddDeviseToUsers < ActiveRecord::Migration
  def self.up

    change_table(:users) do |t|
      # Remove unnecessary field
      t.remove :password_digest

      ## Database authenticatable
      t.change :email, :string,     :null => false, :default => ""
      t.string :encrypted_password, :null => false, :default => ""

      ## Rememberable
      t.datetime :remember_created_at
    end
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
