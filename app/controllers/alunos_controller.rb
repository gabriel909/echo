class AlunosController < ApplicationController
  before_action :authorize_request_aluno, except: :create
  before_action :set_aluno, only: [:show, :show_reports, :update, :delete]
  before_action :set_escola, only: [:create]

  # GET /alunos
  def index
    @alunos = Aluno.all
    json_response @alunos
  end

  #POST /alunos/signup
  def create
    @aluno = @escola.aluno.create! aluno_params
    json_response @aluno
  end

  # GET /alunos/:id
  def show
    json_response @aluno
  end

  # PUT /alunos/:id
  def update
    delete_update do
      @aluno.update aluno_params
      json_response @aluno
    end
  end

  # DELETE /alunos/:id
  def delete
    delete_update do
      @aluno.destroy
    end
  end

  # GET /escolas/:escola_id/alunos/:aluno_id/reports
  def show_reports
    json_response @aluno.report
  end

  private

  def aluno_params
    params.permit :email, :password, :serie, :nome, :avatar
  end

  def set_escola
    @escola = Escola.find params[:escola_id]
  end

  def set_aluno
    set_escola
    @aluno = @escola.aluno.find params[:aluno_id]
  end

  def delete_update
    #TODO
    yield
  end
end
