Rails.application.routes.draw do
  #GET
  #GET Escolas
  get '/escolas', to: 'escolas#index'

  #GET Alunos
  get '/alunos', to: 'alunos#index'

  #GET Avisos
  get '/escolas/:escola_id/avisos', to: 'avisos#index'

  #GET Aluno with id
  get '/alunos/:id', to: 'alunos#show'

  #GET Escolas with id
  get '/escolas/:nome/:unidade', to: 'escolas#show'

  #GET reports from aluno with id
  get '/alunos/reports/:id/', to: 'alunos#show_reports'

  get '/alunos/:aluno_id/reports/:id', to: 'reports#show'

  #POST
  #POST Escola signup
  post '/escolas/signup', to: 'escolas#create'

  #POST Aluno signup
  post '/alunos/signup', to: 'alunos#create'

  #POST Avisos
  post '/escolas/:escola_id/avisos', to: 'avisos#create'

  #PUT
  #PUT Escola id
  put '/escolas/:id', to: 'escols#update'

  #PUT Aluno id
  put '/alunos/:id', to: 'alunos#update'

  #DELETE
  #DELETE escola
  delete '/escolas/:id', to: 'escolas#delete'

  #DELETE Aluno
  # delete '/alunos/:id', to: 'alunos#delete'
end
