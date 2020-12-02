class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.references :course,  null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end

    add_index :proposals, %i[course_id teacher_id], unique: true
  end
end
