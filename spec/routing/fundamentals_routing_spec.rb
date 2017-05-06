require "rails_helper"

RSpec.describe FundamentalsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fundamentals").to route_to("fundamentals#index")
    end

    it "routes to #new" do
      expect(:get => "/fundamentals/new").to route_to("fundamentals#new")
    end

    it "routes to #show" do
      expect(:get => "/fundamentals/1").to route_to("fundamentals#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fundamentals/1/edit").to route_to("fundamentals#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fundamentals").to route_to("fundamentals#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fundamentals/1").to route_to("fundamentals#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fundamentals/1").to route_to("fundamentals#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fundamentals/1").to route_to("fundamentals#destroy", :id => "1")
    end

  end
end
