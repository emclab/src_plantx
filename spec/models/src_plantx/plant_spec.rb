require 'rails_helper'

module SrcPlantx
  RSpec.describe Plant, type: :model do
    it "should be OK" do
      p = FactoryGirl.build(:src_plantx_plant)
      expect(p).to be_valid  
    end
    
    it "should be OK for nil email" do
      p = FactoryGirl.build(:src_plantx_plant, :primary_email => nil, :tech_email => nil)
      expect(p).to be_valid 
    end
     
    it "should reject nil name" do
      p = FactoryGirl.build(:src_plantx_plant, :name => nil)
      expect(p).not_to be_valid
    end

    it "should reject nil short name" do
      p = FactoryGirl.build(:src_plantx_plant, :short_name => nil)
      expect(p).not_to be_valid
    end
    
    it "should reject duplidate name" do
      p = FactoryGirl.create(:src_plantx_plant, :name => 'test')
      p1 = FactoryGirl.build(:src_plantx_plant, :name => 'Test', :short_name => 'a new short')
      expect(p1).not_to be_valid
    end
    
    it "should reject duplidate short name" do
      p = FactoryGirl.create(:src_plantx_plant, :short_name => 'test')
      p1 = FactoryGirl.build(:src_plantx_plant, :short_name => 'Test', :name => 'a new short')
      expect(p1).not_to be_valid
    end

    it "should reject nil phone" do
      p = FactoryGirl.build(:src_plantx_plant, :phone => nil)
      expect(p).not_to be_valid
    end

    it "should reject nil primary cell" do
      p = FactoryGirl.build(:src_plantx_plant, :primary_cell => nil)
      expect(p).not_to be_valid
    end

    it "should reject nil primary contact" do
      p = FactoryGirl.build(:src_plantx_plant, :primary_contact => nil)
      expect(p).not_to be_valid
    end

  end
end
