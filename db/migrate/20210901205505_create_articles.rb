class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title, unique: true
      t.text :content

      t.timestamps
    end
  end
end
