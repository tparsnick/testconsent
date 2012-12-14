class AddConsentedAtToUser < ActiveRecord::Migration
  def change
    add_column :users, :consented_at, :datetime
  end
end
