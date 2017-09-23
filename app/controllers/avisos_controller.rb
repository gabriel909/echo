class AvisosController < ApplicationController
  before_action :set_escola

  #GET /escolas/:escola_id/avisos
  def index
    json_response @escola.aviso
  end

  # POST /escolas/:escola_id/avisos
  def create
    @aviso = @escola.aviso.create! aviso_params
    json_response @aviso
  end

  private

  def aviso_params
    params.permit :titulo, :descrição, :series, :imagem
  end

  def set_escola
    @escola = Escola.find params[:escola_id]
  end

  def set_escola_aviso
    @aviso = @escola.aviso.find_by! id: params[:id] if @escola
  end
end
