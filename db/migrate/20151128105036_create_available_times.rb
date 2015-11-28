class CreateAvailableTimes < ActiveRecord::Migration
  def change
    create_table :available_times do |t|
      t.integer :expert_id
      t.date :date
      t.time :start_time
      t.time :end_time
      t.timestamps null: false
    end
  end
end
