class AddReservedToAvailableTimes < ActiveRecord::Migration
  def change
    add_column :available_times, :reserved, :boolean, :default => false
  end
end
