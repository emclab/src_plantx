require_dependency "src_plantx/application_controller"

module SrcPlantx
  class PlantsController < ApplicationController
    before_action :require_employee
    
    def index
      @title = t('Plants')
      @plants = params[:src_plantx_plants][:model_ar_r].page(params[:page]).per_page(@max_pagination)
      @erb_code = find_config_const('plant_index_view', 'src_plantx')
    end
  
    def new
      @title = t('New Plant')
      @plant = SrcPlantx::Plant.new()
      @erb_code = find_config_const('plant_new_view', 'src_plantx')
    end
  
    def create
      @plant = SrcPlantx::Plant.new(new_params)
      @plant.last_updated_by_id = session[:user_id]
      if @plant.save
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Successfully Saved!")
      else
        @erb_code = find_config_const('plant_new_view', 'src_plantx')
        flash[:notice] = t('Data Error. Not Saved!')
        render 'new'
      end
    end
  
    def edit
      @title = t('Update Plant')
      @plant = SrcPlantx::Plant.find_by_id(params[:id])
      @erb_code = find_config_const('plant_edit_view', 'src_plantx')
    end
  
    def update
      @plant = SrcPlantx::Plant.find_by_id(params[:id])
      @plant.last_updated_by_id = session[:user_id]
      if @plant.update_attributes(edit_params)
        redirect_to URI.escape(SUBURI + "/authentify/view_handler?index=0&msg=Successfully Updated!")
      else
        @erb_code = find_config_const('plant_edit_view', 'src_plantx')
        flash[:notice] = t('Data Error. Not Updated!')
        render 'edit'
      end
    end
  
    def show
      @title = t('Show Plant')
      @plant = SrcPlantx::Plant.find_by_id(params[:id])
      @erb_code = find_config_const('plant_show_view', 'src_plantx')
    end
    
    protected
    
    private
    
    def new_params
      params.require(:plant).permit(:active, :address, :customer_service, :employee_num, :equip, :fax, :last_updated_by_id, :main_product, :name, :phone, :primary_cell, 
                    :primary_contact, :production_capacity, :quality_system_id, :revenue, :short_name, :sourced_product, :src_since, :tech_ability, :category_id,
                    :tech_cell, :tech_contact, :primary_email, :tech_email, :web)
    end
    
    def edit_params
      params.require(:plant).permit(:active, :address, :customer_service, :employee_num, :equip, :fax, :last_updated_by_id, :main_product, :name, :phone, :primary_cell, 
                    :primary_contact, :production_capacity, :quality_system_id, :revenue, :short_name, :sourced_product, :src_since, :tech_ability, :category_id,
                    :tech_cell, :tech_contact, :primary_email, :tech_email, :web)
    end
    
  end
end
