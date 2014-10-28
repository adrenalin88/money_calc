class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.integer :user_id, null: false
      t.float :amount, null: false
      t.string :comment

      t.timestamps
    end
  end
end
