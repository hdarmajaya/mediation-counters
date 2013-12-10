MediationCounters::Application.routes.draw do
  get "scdr_counter/index"

  root to: 'dashboard#home'

  get "gcdr_counter/index"
end
