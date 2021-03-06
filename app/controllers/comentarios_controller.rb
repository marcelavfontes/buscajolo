class ComentariosController < ApplicationController
  # GET /comentarios
  # GET /comentarios.json
  def index
    if params[:analise_id]
      @comentarios = Comentario.find_all_by_analise_id(params[:analise_id])
      @analise = Analise.find_by_id(params[:analise_id])
    else
      @comentarios = Comentario.all
    end 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comentarios }
    end
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comentario }
    end
  end

  # GET /comentarios/new
  # GET /comentarios/new.json
  def new
    @comentario = Comentario.new
    @analise = Analise.find_by_id(params[:analise_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comentario }
    end
  end

  # GET /comentarios/1/edit
  def edit
    @comentario = Comentario.find(params[:id])
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = Comentario.new(params[:comentario])
    @comentario.user = current_user

    @analise = Analise.find_by_id(params[:analise_id])
    @comentario.analise = @analise
    
    respond_to do |format|
      if @comentario.save
        format.html { redirect_to analise_comentarios_path(@analise), notice: 'Comentario foi criado com sucesso.' }
        format.json { render json: @comentario, status: :created, location: @comentario }
      else
        format.html { render action: "new" }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comentarios/1
  # PUT /comentarios/1.json
  def update
    @comentario = Comentario.find(params[:id])

    respond_to do |format|
      if @comentario.update_attributes(params[:comentario])
        format.html { redirect_to @comentario, notice: 'Comentario was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @comentario = Comentario.find(params[:id])
    @comentario.destroy

    respond_to do |format|
      format.html { redirect_to comentarios_url }
      format.json { head :no_content }
    end
  end
end
