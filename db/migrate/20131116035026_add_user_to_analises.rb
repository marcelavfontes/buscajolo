class AddUserToAnalises < ActiveRecord::Migration
  def change
    add_column :analises, :user_id, :string
  end
end
