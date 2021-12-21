class ProvidersController < ApplicationController
  def index
    if params[:commit] == "Search by Last Name and Location"
      @providers = ProviderSearchFacade.last_name_location(params[:last_name_1], params[:state])
    elsif params[:commit] == "Search by Full Name"
      @providers = ProviderSearchFacade.first_name_last_name(params[:last_name_2], params[:first_name])
    elsif params[:commit] == "Search by Specialty"
      @providers = ProviderSearchFacade.last_name_specialty(params[:last_name_3], params[:specialty])
    else
      @providers = []
      @error = "An error has occured. Please try again."
    end
    @providers = @providers.paginate(:page => params[:page], :per_page => 20)
  end
end
