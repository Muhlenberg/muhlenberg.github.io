class AddPictureToMember < ActiveRecord::Migration
  def change
    add_column :members, :picture, :string
  end
end
