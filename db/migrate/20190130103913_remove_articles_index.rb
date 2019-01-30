class RemoveArticlesIndex < ActiveRecord::Migration[5.2]
  def change
  	remove_index :articles, :article_id
  end
end
