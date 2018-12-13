class CreatePosts < ActiveRecord::Migration[5.2]
  def change

    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :photo
      t.text :content
    end

  end
end
