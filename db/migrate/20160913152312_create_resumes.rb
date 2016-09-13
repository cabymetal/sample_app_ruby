class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.string :file
      t.string :file_url
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :resumes, [:user_id, :created_at]
  end
end
