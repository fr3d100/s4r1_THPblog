class SolveIndexProblems < ActiveRecord::Migration[5.2]
  def change
  		remove_index :users, :article_id
  end
end
