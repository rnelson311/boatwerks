require "rails_helper"

RSpec.describe MarinasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/marinas").to route_to("marinas#index")
    end

    it "routes to #new" do
      expect(:get => "/marinas/new").to route_to("marinas#new")
    end

    it "routes to #show" do
      expect(:get => "/marinas/1").to route_to("marinas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/marinas/1/edit").to route_to("marinas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/marinas").to route_to("marinas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/marinas/1").to route_to("marinas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/marinas/1").to route_to("marinas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/marinas/1").to route_to("marinas#destroy", :id => "1")
    end

  end
end
