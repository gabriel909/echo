class AvisosController < ApplicationController
  before_action :set_escola
  # before_action :authorize_request_aluno, only: :index_alunos
  # before_action :authorize_request_aluno, except: :index_alunos
  before_action :set_aluno, only: :index_alunos

  #GET /escolas/:escola_id/avisos
  def index
    json_response @escola.aviso
  end

  #GET /escolas/:escola_id/alunos/:aluno_id/avisos
  def index_alunos
    avisos_alunos = @escola.aviso.where "series LIKE ?", "%#{@aluno.serie}%"
    json_response avisos_alunos
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

  def set_aluno
    @aluno = @escola.aluno.find params[:aluno_id]
  end

  # def set_escola_aviso
  #   @aviso = @escola.aviso.find_by! id: params[:escola_id] if @escola
  # end
end
