class AnalisesController < ApplicationController
  # GET /analises
  # GET /analises.json
  def index
    if params[:fornecedor_id]
      @analises = Analise.find_all_by_fornecedor_id(params[:fornecedor_id])
    else
      @analises = Analise.all
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @analises }
    end
  end

  # GET /analises/1
  # GET /analises/1.json
  def show
    @analise = Analise.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @analise }
    end
  end

  # GET /analises/new
  # GET /analises/new.json
  def new
    @analise = Analise.new
    @fornecedor = Fornecedor.find(params[:fornecedor_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @analise }
    end
  end

  # GET /analises/1/edit
  def edit
    @analise = Analise.find(params[:id])
  end

  # POST /analises
  # POST /analises.json
  def create
    @analise = Analise.new(params[:analise])

    @fornecedor = Fornecedor.find_by_id(params[:fornecedor_id])

    @analise.fornecedor = @fornecedor
    @analise.user = current_user

    respond_to do |format|
      if @analise.save
        format.html { redirect_to @analise, notice: 'Analise was successfully created.' }
        format.json { render json: @analise, status: :created, location: @analise }
      else
        format.html { render action: "new" }
        format.json { render json: @analise.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /analises/1
  # PUT /analises/1.json
  def update
    @analise = Analise.find(params[:id])

    respond_to do |format|
      if @analise.update_attributes(params[:analise])
        format.html { redirect_to @analise, notice: 'Analise was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @analise.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /analises/1
  # DELETE /analises/1.json
  def destroy
    @analise = Analise.find(params[:id])
    @analise.destroy

    respond_to do |format|
      format.html { redirect_to analises_url }
      format.json { head :no_content }
    end
  end
end
