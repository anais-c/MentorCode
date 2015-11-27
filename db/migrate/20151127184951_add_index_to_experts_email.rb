class AddIndexToExpertsEmail < ActiveRecord::Migration
  def change
    add_index :experts, :email, unique: true
  end
end
