require './config/environment'
require './app/models/sample_model'

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    return erb :index
  end
  
  post '/results' do
    #puts params
    # 'params' gives you a hash of all the values
    points_array = params.values # makes an array that has all the point values from the questions answered
    total = 0
    points_array.each do |point| # loop through points array to calculate total
      total += point.to_i # makes sure to convert points to an integer because it's a string
    end
    #puts total
    
    # require rb file at top to be used here
    result = calculate_result(total) # use the method calculate_result (that we defined in sample_model.rb) to get result
    
    #puts result
    if result == "bffs" # depending on the result, redirect to a certain erb file (aka different page)
      return erb :bff
    elsif result == "ok"
      return erb :okay
    else
      return erb :nope
    end
    
    
  end
end