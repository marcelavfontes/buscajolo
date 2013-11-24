class FornecedorsController < ApplicationController
  # GET /fornecedors
  # GET /fornecedors.json
  def index
    @fornecedors = Fornecedor.all
    @produtos = Produto.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fornecedors }
    end
  end

  # GET /fornecedors/1
  # GET /fornecedors/1.json
  def show
    @fornecedor = Fornecedor.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fornecedor }
    end
  end

  # GET /fornecedors/new
  # GET /fornecedors/new.json
  def new
    @fornecedor = Fornecedor.new
    @produtos = Produto.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fornecedor }
    end
  end

  # GET /fornecedors/1/edit
  def edit
    @produtos = Produto.all
    @fornecedor = Fornecedor.find(params[:id])
  end

  # POST /fornecedors
  # POST /fornecedors.json
  def create
    @fornecedor = Fornecedor.new(params[:fornecedor])

    @fornecedor.produtos = Produto.find_all_by_id(params[:produtos])

    respond_to do |format|
      if @fornecedor.save
        format.html { redirect_to @fornecedor, notice: 'Fornecedor was successfully created.' }
        format.json { render json: @fornecedor, status: :created, location: @fornecedor }
      else
        format.html { render action: "new" }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fornecedors/1
  # PUT /fornecedors/1.json
  def update
    @fornecedor = Fornecedor.find(params[:id])

    @fornecedor.produtos = Produto.find_all_by_id(params[:produtos])

    respond_to do |format|
      if @fornecedor.update_attributes(params[:fornecedor])
        format.html { redirect_to @fornecedor, notice: 'Fornecedor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fornecedor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fornecedors/1
  # DELETE /fornecedors/1.json
  def destroy
    @fornecedor = Fornecedor.find(params[:id])
    @fornecedor.destroy

    respond_to do |format|
      format.html { redirect_to fornecedors_url }
      format.json { head :no_content }
    end
  end
end
