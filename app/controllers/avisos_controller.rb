class AvisosController < ApplicationController
  before_action :set_escola
  before_action :set_escola_aviso, only: :delete
  before_action :authorize_request_aluno, only: :index_alunos
  before_action :authorize_request_escola, except: :index_alunos
  before_action :set_aluno, only: :index_alunos

  #GET /escolas/:escola_id/avisos
  def index
    avisos_array = @escola.aviso.to_a
    avisos_image_array = []

    for aviso in avisos_array
      avisos_image_array << { aviso: aviso, image: aviso.image }
    end

    json_response avisos_image_array
  end

  #GET /escolas/:escola_id/alunos/:aluno_id/avisos
  def index_alunos
    avisos_alunos = @escola.aviso.where("series LIKE ?", "%#{@aluno.serie}%").to_a
    avisos_alunos_image = []
   
    for aviso in avisos_alunos
      avisos_alunos_image << { aviso: aviso, image: aviso.image }
    end
 
    json_response avisos_alunos_image
  end

  # POST /escolas/:escola_id/avisos
  def create
    images_array = params[:image].to_a
    @aviso = @escola.aviso.create! aviso_params

    images_array.each do |elem|
      @aviso.image.create! image_data: elem
    end

    json_response @aviso, @aviso.image
  end

  def delete
    images_array = @aviso.image.to_a

    images_array.each do |elem|
      elem.destroy
    end 

    @aviso.destroy
    head :no_content
  end

  private

  def aviso_params
    params.permit :titulo, :descricao, :series, :imagem
  end

  def set_escola
    @escola = Escola.find params[:escola_id]
  end

  def set_aluno
    puts "ALUNO"
    @aluno = @escola.aluno.find params[:aluno_id]
  end

   def set_escola_aviso
     @aviso = @escola.aviso.find_by! id: params[:aviso_id] if @escola
   end
end
