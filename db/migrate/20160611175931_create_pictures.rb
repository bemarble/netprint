class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|

      t.integer  :print_num, default: 0, null: false
      t.string  :description, default: '', null: false
      t.string  :url, default: '', null: false
      t.string :uid, default: '', null: false

      t.timestamps null: false
    end
  end
end
