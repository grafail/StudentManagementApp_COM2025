class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.references :assessment, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.float :grade, null: false

      t.timestamps
    end
  end
end
