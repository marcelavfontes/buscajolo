require "spec_helper"

describe ComentariosController do
  describe "routing" do

    it "routes to #index" do
      get("/comentarios").should route_to("comentarios#index")
    end

    # it "routes to #new" do
    #   get("/comentarios/new").should route_to("comentarios#new")
    # end

    it "routes to #show" do
      get("/comentarios/1").should route_to("comentarios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/comentarios/1/edit").should route_to("comentarios#edit", :id => "1")
    end

    # it "routes to #create" do
    #   post("/comentarios").should route_to("comentarios#create")
    # end

    it "routes to #update" do
      put("/comentarios/1").should route_to("comentarios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/comentarios/1").should route_to("comentarios#destroy", :id => "1")
    end

  end
end
