class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.string :original_url
      t.string :friendly_url
      t.string :title
      t.integer :visits

      t.timestamps
    end
  end
end
