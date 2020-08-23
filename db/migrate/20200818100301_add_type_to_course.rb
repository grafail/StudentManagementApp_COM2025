class AddTypeToCourse < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :courseType, :string, null: false
  end
end
