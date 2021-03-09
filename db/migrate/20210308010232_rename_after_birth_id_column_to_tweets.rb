class RenameAfterBirthIdColumnToTweets < ActiveRecord::Migration[6.0]
  def change
    rename_column :tweets, :after_birth_id, :genre
  end
end
