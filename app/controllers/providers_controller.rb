

class ProvidersController < ApplicationController
  def index
    if params[:commit] == "Search by Last Name and Location"
      length = params[:state].length
      if length > 2
        state_abbreviation = state_name_conversion(params[:state])
      else
        state_abbreviation = params[:state]
      end
      @providers = ProviderSearchFacade.last_name_location(params[:last_name_1], state_abbreviation)
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

  def state_name_conversion(state_name)
    states = {
      'alabama' => 'AL',
      'alaska' => 'AK',
      'arizona' => 'AZ',
      'arkansas' => 'AR',
      'california' => 'CA',
      "colorado" => 'CO',
      'connecticut' => 'CT',
      'delaware' => 'DE',
      'district of columbia' => 'DC',
      'florida' => 'FL',
      'georgia' => 'GA',
      'guam' => 'GU',
      'hawaii' => 'HI',
      'idaho' => 'ID',
      'illinois' => 'IL',
      'indiana' => 'IN',
      'iowa' => 'IA',
      'kansas' => 'KS',
      'kentucky' => 'KY',
      'louisiana' => 'LA',
      'maine' => 'ME',
      'maryland' => 'MD',
      'massachusetts' => 'MA',
      'michigan' => 'MI',
      'minnesota' => 'MN',
      'mississippi' => 'MS',
      'missouri' => 'MO',
      'montana' => 'MT',
      'nebraska' => 'NE',
      'nevada' => 'NV',
      'new Hampshire' => 'NH',
      'new Jersey' => 'NJ',
      'new Mexico' => 'NM',
      'new York' => 'NY',
      'north Carolina' => 'NC',
      'north Dakota' => 'ND',
      'ohio' => 'OH',
      'oklahoma' => 'OK',
      'oregon' => 'OR',
      'pennsylvania' => 'PA',
      'puerto rico' => 'PR',
      'rhode island' => 'RI',
      'couth carolina' => 'SC',
      'south dakota' => 'SD',
      'tennessee' => 'TN',
      'texas' => 'TX',
      'utah' => 'UT',
      'vermont' => 'VT',
      'virginia' => 'VA',
      'washington' => 'WA',
      'west virginia' => 'WV',
      'wisconsin' => 'WI',
      'wyoming' => 'WY'
    }
    states[state_name]
  end
end
