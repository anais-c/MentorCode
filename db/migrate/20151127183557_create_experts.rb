class CreateExperts < ActiveRecord::Migration
  def change
    create_table :experts do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.text :experience
      t.string :location

      t.timestamps null: false
    end
  end
end
