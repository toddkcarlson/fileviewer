class CreateKmzs < ActiveRecord::Migration[5.1]
  def change
    create_table :kmzs do |t|

      t.timestamps
    end
  end
end
