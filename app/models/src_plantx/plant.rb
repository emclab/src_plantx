module SrcPlantx
  class Plant < ActiveRecord::Base
    attr_accessor :active_noupdate

    belongs_to :last_updated_by, :class_name => 'Authentify::User'
    belongs_to :quality_system, :class_name => 'Commonx::MiscDefinition'
    belongs_to :category, :class_name => 'Commonx::MiscDefinition'
   
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
    validates :quality_system_id, :numericality => {:greater_than => 0, :only_integer => true}, :if => 'quality_system_id.present?' 
    validates :supplier_category_id, :numericality => {:greater_than => 0, :only_integer => true}, :if => 'supplier_category_id.present?'
  
    validate :dynamic_validate
    
    def dynamic_validate
      wf = Authentify::AuthentifyUtility.find_config_const('dynamic_validate', 'src_plantx')
      eval(wf) if wf.present?
    end
  end
end
