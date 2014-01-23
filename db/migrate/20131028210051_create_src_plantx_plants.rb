class CreateSrcPlantxPlants < ActiveRecord::Migration
  def change
    create_table :src_plantx_plants do |t|
      t.string :name
      t.string :short_name
      t.text :address
      t.text :primary_contact
      t.string :primary_cell
      t.string :phone
      t.text :tech_contact
      t.string :tech_cell
      t.text :tech_ability
      t.text :customer_service
      t.text :production_capacity
      t.text :sourced_product
      t.text :equip
      t.integer :quality_system_id
      t.string :employee_num
      t.boolean :active, :default => true
      t.string :revenue
      t.date :src_since
      t.timestamps
      t.integer :last_updated_by_id
      t.string :web
      t.string :primary_email
      t.string :fax  
      t.text :main_product    
      t.string :tech_email
      
    end
    
    add_index :src_plantx_plants, :name
    
  end
end
