class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.date :birthdate
      t.string :password
      t.integer 'posts_count'
    end

    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :title
      t.string :photo
      t.text :content
      t.text :tags
      t.timestamps
    end
  end
end
