class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.text :content
      t.boolean :show, default: true

      t.timestamps
    end
    add_index :pages, :name
  end
end
