class EscolasController < ApplicationController
  before_action :set_escola, only: [:show, :update, :show_reports]
  before_action :set_reports, only: [:show_reports, :show_reports_categories]

  #POST
  #GET /escolas
  def index
    @escolas = Escola.all
    json_response @escolas
  end

  #GET /escolas/select
  def show
    json_response @escola
  end

  #POST /escolas/signup
  def create
    @escola = Escola.create! escola_params
    #TODO Auth token

    json_response @escola
  end

  #DELETE /escolas/:id
  def delete
    delete_update do
      @escola.destroy
      head :no_content
    end
  end

  #PUT /escolas/:id
  def update
    delete_update do
      @escola.update escola_params
      json_response @escola
    end
  end

  # GET /escolas/:escola_id/reports
  def show_reports
    json_response @reports
  end

  # GET /escolas/:escola_id/reports
  def show_reports_categories
    reports_category = @reports.where categoria: params[:category]
    json_response reports_category
  end

  private

  def escola_params
    params.permit :email, :password, :unidade, :nome, :cnpj
  end

  def set_escola
    @escola = Escola.where "nome = ? AND unidade = ?", params[:nome], params[:unidade]
  end

  def set_escola_id
    @escola = Escola.find params[:escola_id]
  end

  def set_reports
    set_escola_id
    alunos_id = @escola.aluno.select :id

    @reports = Report.where :aluno_id => alunos_id
  end

  def delete_update
    #TODO
    yield
  end
end
