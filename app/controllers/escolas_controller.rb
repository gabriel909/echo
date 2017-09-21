class EscolasController < ApplicationController
  before_action :set_escola, only: [:show, :update]

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
      @escola = Escola.find params[:id]
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

  private

  def escola_params
    params.permit :email, :password, :unidade, :nome, :CNPJ
  end

  def set_escola
    @escola = Escola.where "nome = ? AND unidade = ?", params[:nome], params[:unidade]
  end

  def delete_update
    #TODO
    yield
  end
end
