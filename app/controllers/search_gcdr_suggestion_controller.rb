class SearchGcdrSuggestionController < ApplicationController
  def index
    render json: GcdrCounter.terms_for(params[:term])
  end
end
