class AddProposalsCountToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :proposals_count, :integer, null: false, default: 0
  end
end
