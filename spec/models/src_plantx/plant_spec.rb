require 'spec_helper'

module SrcPlantx
  describe Plant do
    it "should be OK" do
      p = FactoryGirl.build(:src_plantx_plant)
      p.should be_valid  
    end
    
    it "should be OK for nil email" do
      p = FactoryGirl.build(:src_plantx_plant, :primary_email => nil, :tech_email => nil)
      p.should be_valid 
    end
     
    it "should reject nil name" do
      p = FactoryGirl.build(:src_plantx_plant, :name => nil)
      p.should_not be_valid
    end

    it "should reject nil short name" do
      p = FactoryGirl.build(:src_plantx_plant, :short_name => nil)
      p.should_not be_valid
    end

    it "should reject nil phone" do
      p = FactoryGirl.build(:src_plantx_plant, :phone => nil)
      p.should_not be_valid
    end

    it "should reject nil primary cell" do
      p = FactoryGirl.build(:src_plantx_plant, :primary_cell => nil)
      p.should_not be_valid
    end

    it "should reject nil primary contact" do
      p = FactoryGirl.build(:src_plantx_plant, :primary_contact => nil)
      p.should_not be_valid
    end

  end
end
