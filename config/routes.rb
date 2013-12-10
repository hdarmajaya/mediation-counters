MediationCounters::Application.routes.draw do
  get "search_suggestion/index"

  get "search_scdr_suggestion/index"

  get "search_gcdr_suggestion/index"

  get "scdr_counter/index"

  root to: 'dashboard#home'

  get "gcdr_counter/index"
end
