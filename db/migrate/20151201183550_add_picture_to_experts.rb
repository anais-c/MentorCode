class AddPictureToExperts < ActiveRecord::Migration
  def change
    add_column :experts, :picture, :string
  end
end
