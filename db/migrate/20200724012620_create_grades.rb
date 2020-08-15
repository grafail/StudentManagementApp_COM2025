class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.references :assessment, foreign_key: true
      t.references :user, foreign_key: true
      t.float :grade

      t.timestamps
    end
  end
end
