class CreatePostings < ActiveRecord::Migration
  def change
    create_table :postings do |t|
      t.string :title
      t.string :body
      t.belongs_to :category

      t.timestamps
    end
  end
end
