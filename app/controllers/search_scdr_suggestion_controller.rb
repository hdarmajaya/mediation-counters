class SearchScdrSuggestionController < ApplicationController
  def index
    render json: ScdrCounter.terms_for(params[:term])
  end
end
