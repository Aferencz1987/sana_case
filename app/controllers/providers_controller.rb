class ProvidersController < ApplicationController
  def index
    if params[:commit] == "Search by Last Name and Location"
      @providers = ProviderSearchService.last_name_location(params[:last_name_1], params[:state])
    elsif params[:commit] == "Search by Full Name"
      @providers = ProviderSearchService.first_last_name(params[:last_name_2], params[:first_name])
    elsif params[:commit] == "Search by Specialty"
      @providers = ProviderSearchService.last_name_specialty(params[:last_name_3], params[:specialty])
    else
      @providers = []
      @error = "An error has occured. Please try again."
    end
  end
end
