class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :parent_id
      t.integer :user_id, null: false
      t.integer :post_id, null: false
      t.text :content,    null: false
    end
  end
end
