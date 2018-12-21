class CreateTrends < ActiveRecord::Migration[5.2]
  def change
    create_table :trends do |t|

      t.timestamps
    end
  end
end
