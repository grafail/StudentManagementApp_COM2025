class CreateSubjects < ActiveRecord::Migration[5.2]
  def change
    create_table :subjects do |t|
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true # Lecturer
      t.text :description
      t.timestamps
    end
  end
end
