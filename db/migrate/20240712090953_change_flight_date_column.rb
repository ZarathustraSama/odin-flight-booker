class ChangeFlightDateColumn < ActiveRecord::Migration[7.1]
  def change
    change_table :flights do |t|
      t.rename :start_datetime, :date
    end

    change_column :flights, :date, :date
  end
end
