class AvisosController < ApplicationController
  before_action :set_escola

  #GET /avisos
  def index
    json_response @escola.aviso
  end

  # POST /escolas/:escola_id/avisos
  def create
    puts "ID ID ID #{params[:escola_id]}"
    @escola.aviso.create! aviso_params
    json_response @escola.aviso
  end


  private

  def aviso_params
    params.permit :titulo, :descrição, :series, :imagem
  end

  def set_escola
    puts "SET ESCOLA"
    @escola = Escola.find params[:escola_id]
  end

  def set_escola_aviso
    @aviso = @escola.aviso.find_by! id: params[:id] if @escola
  end
end
