class AlunosController < ApplicationController
  before_action :set_aluno, only: [:show,:show_reports]


  def index
    @alunos = Aluno.all
    json_response @alunos
  end

  def create
    @aluno = Aluno.create! alunos_params
    json_response @aluno
  end

  def show
    json_response @aluno
  end

 def show_reports
   json_response @aluno.report
 end

  private

  def aluno_params
    params.permit :email, :password, :serie, :nome, :avatar, :escola_id
  end

  def set_aluno
    @aluno = Aluno.find params[:id]
  end


end
