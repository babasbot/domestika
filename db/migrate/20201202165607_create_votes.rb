class CreateVotes < ActiveRecord::Migration[6.0]
  def change
    create_table :votes do |t|
      t.references :votable, null: false, polymorphic: true
      t.references :voter,   null: false, foreign_key: { to_table: :teachers }

      t.timestamps
    end

    add_index :votes, %i[votable_id votable_type voter_id], unique: true
  end
end
