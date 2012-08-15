class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
    	t.integer :number_process, :null => false
    	t.string :name, :null => false
    	t.string :procedure
    	t.date :date_rpi
    	t.date :date_company
    	t.date :deadline, :null => false
    	t.boolean :completed
      t.timestamps
    end

    add_index :brands, :user_id
    add_index :brands, :client_id
  end
end
