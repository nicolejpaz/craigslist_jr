class UpdatePosting < ActiveRecord::Migration
  def change
    add_column :postings, :price, :integer
    add_column :postings, :location, :string
  end
end
