class AddVotesCountToProposals < ActiveRecord::Migration[6.0]
  def change
    add_column :proposals, :votes_count, :integer, default: 0, null: false
  end
end
