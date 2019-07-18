class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set(:views, 'app/views')

    get '/' do
      # client = Yelp::Fusion.client
      # resp = client.search('London', {term: 'noodles'})
    end


end
