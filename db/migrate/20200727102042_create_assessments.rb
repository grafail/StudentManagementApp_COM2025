class CreateAssessments < ActiveRecord::Migration[5.2]
  def change
    create_table :assessments do |t|
      t.references :subject, foreign_key: true, null: false
      t.string :name, null: false

      t.timestamps
    end
  end
end
