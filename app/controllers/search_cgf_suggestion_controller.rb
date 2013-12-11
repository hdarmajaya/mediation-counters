class SearchCgfSuggestionController < ApplicationController
  def index
    render json: CgfCounter.terms_for(params[:term])
  end
end
