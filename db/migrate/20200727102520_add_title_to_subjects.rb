class AddTitleToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :title, :string
    change_column :subjects, :title, :string, null: false
  end
end
