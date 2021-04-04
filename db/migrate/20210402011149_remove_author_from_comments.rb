class RemoveAuthorFromComments < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :user_id, :integer
    remove_column :comments, :tweet_id, :integer 
  end

end
