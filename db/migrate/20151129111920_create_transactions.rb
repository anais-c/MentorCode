class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.references :available_time
      t.references :user
      t.string :status, :default => "pending"

      t.timestamps null: false
    end
  end
end
