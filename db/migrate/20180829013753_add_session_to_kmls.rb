class AddSessionToKmls < ActiveRecord::Migration[5.1]
  def change
     add_column :kmls, :session, :string
  end
end
