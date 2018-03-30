Rails.application.routes.draw do    
  #GET
  #GET Escolas
  get '/escolas', to: 'escolas#index'

  #GET Alunos
  get '/escolas/:escola_id/alunos', to: 'alunos#index'

  #GET Avisos
  get '/escolas/:escola_id/avisos', to: 'avisos#index'

  #GET Aluno with id
  get '/escolas/:escola_id/alunos/:aluno_id', to: 'alunos#show'

  #GET Denuncias from escola
  get '/escolas/:escola_id/reports', to: 'escolas#show_reports'

  #GET Denuncias from escola with category
  get '/escolas/:escola_id/reports/select', to: 'escolas#show_reports_categories'

  #GET Escolas with id
  get '/escolas/select', to: 'escolas#show'

  #GET reports from aluno with id
  get '/escolas/:escola_id/alunos/:aluno_id/reports', to: 'alunos#show_reports'

  #GET Avisos from alunos with id
  get '/escolas/:escola_id/alunos/:aluno_id/avisos', to: 'avisos#index_alunos'

  #GET Aluno logout
  get '/alunos/logout', to: 'alunos#logout_aluno'

  #GET Escola logout
  get 'escolas/logout', to: 'escolas#logout_escola'

  #POST
  #POST Escola signup
  post '/escolas/signup', to: 'escolas#create'

  #POST Escola login
  post 'escolas/login', to: 'authentication#authenticate_escola'

  #POST Aluno signup
  post '/escolas/:escola_id/alunos/signup', to: 'alunos#create'

  #POST Aluno login
  post '/alunos/login', to: 'authentication#authenticate_aluno'

  #POST Avisos
  post '/escolas/:escola_id/avisos', to: 'avisos#create'

  # POST Denuncias
  post '/escolas/:escola_id/alunos/:aluno_id/denuncias', to: 'reports#create'

  #PUT
  #PUT Escola id
  put '/escolas/:escola_id', to: 'escolas#update'

  #PUT Aluno id
  put '/escolas/:escola_id/alunos/:aluno_id', to: 'alunos#update'
 
  #PUT Reports
  put '/escolas/:escola_id/reports', to: 'reports#update'

  #DELETE
  #DELETE Escola
  delete '/escolas/:id', to: 'escolas#delete'

  #DELETE Aluno
  delete '/escolas/:escola_id/alunos/:aluno_id', to: 'alunos#delete'
	
  #DELETE Aviso
  delete '/escolas/:escola_id/avisos/:aviso_id', to: 'avisos#delete'

  #DELETE Report
  delete '/escolas/:escola_id/reports/:report_id', to: 'reports#delete'

end
