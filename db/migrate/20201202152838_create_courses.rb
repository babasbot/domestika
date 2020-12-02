class CreateCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :courses do |t|
      t.string :title, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
