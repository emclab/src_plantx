module SrcPlantx
  class Plant < ActiveRecord::Base
    attr_accessor :active_noupdate
    attr_accessible :active, :address, :customer_service, :employee_num, :equip, :fax, :last_updated_by_id, :main_product, :name, :phone, :primary_cell, 
                    :primary_contact, :production_capacity, :quality_system_id, :revenue, :short_name, :sourced_product, :src_since, :tech_ability, 
                    :tech_cell, :tech_contact, :primary_email, :tech_email, :web,
                    :as => :role_new
    attr_accessible :active, :address, :customer_service, :employee_num, :equip, :fax, :last_updated_by_id, :main_product, :name, :phone, :primary_cell, 
                    :primary_contact, :production_capacity, :quality_system_id, :revenue, :short_name, :sourced_product, :src_since, :tech_ability, 
                    :tech_cell, :tech_contact, :primary_email, :tech_email, :web,
                    :active_noupdate,
                    :as => :role_update
                    
    belongs_to :last_updated_by, :class_name => 'Authentify::User'
    belongs_to :quality_system, :class_name => 'Commonx::MiscDefinition'
   
    email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   
    validates :name, :short_name, :presence => true, :uniqueness => {:case_sensitive => false, :message => I18n.t('Must be unique!')}
    validates :phone, :presence => true
    validates :primary_contact, :primary_cell, :presence => true
    validates :primary_email, :format     => { :with => email_regex, :message => '电邮格式错误！' },
                              :uniqueness => { :case_sensitive => false, :message => '电邮已占用！' },
                              :if => 'primary_email.present?'
    validates :tech_email, :format     => { :with => email_regex, :message => '电邮格式错误！' },
                           :uniqueness => { :case_sensitive => false, :message => '电邮已占用！' },
                           :if => 'tech_email.present?'    
    validate :dynamic_validate
    
    def dynamic_validate
      wf = Authentify::AuthentifyUtility.find_config_const('dynamic_validate', 'src_plantx')
      eval(wf) if wf.present?
    end
  end
end
