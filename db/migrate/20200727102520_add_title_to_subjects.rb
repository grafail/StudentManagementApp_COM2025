class AddTitleToSubjects < ActiveRecord::Migration[5.2]
  def change
    add_column :subjects, :title, :string
  end
end
