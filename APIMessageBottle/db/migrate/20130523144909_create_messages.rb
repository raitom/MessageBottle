class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.int :user_id
      t.text :texte

      t.timestamps
    end
  end
end
