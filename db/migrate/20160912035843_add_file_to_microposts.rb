class AddFileToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :file, :string
  end
end
