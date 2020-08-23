class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.references :course, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false # Lecturer
      t.text :description, null: false
      t.timestamps
    end
  end
end
