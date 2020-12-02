class AddProposalsCountToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :proposals_count, :integer, null: false, default: 0
  end
end
