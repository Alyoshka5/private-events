class ChangeDateColumnTypeInEvents < ActiveRecord::Migration[7.0]
  def change
    change_column :events, :date, :date, null: false
  end
end
