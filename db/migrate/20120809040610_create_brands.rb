class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
    	t.integer :numer_process, :null => false
    	t.string :name, :null => false
    	t.string :procedure
    	t.date :date_rpi
    	t.date :date_company
    	t.date :deadline, :null => false
    	t.boolean :completed
      t.timestamps
    end
  end
end
