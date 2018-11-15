class ChangeUrlVisitsDefaultToZero < ActiveRecord::Migration[5.2]
  def change
    change_column :urls, :visits, :integer, default: 0, null: false
  end
end
