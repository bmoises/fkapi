module Fkapi
  class Server < Sinatra::Base

    configure do 
      options = {}
      OptionParser.new do |opts|
        opts.banner = "Usage: fkapi [options]"

        opts.on("-i", "--input FILE", "Specify config file") do |f|
          options[:input_file] = f
        end
      end.parse!


      set :loader, Fkapi::Loader.new( options[:input_file] )
    end


    get %r{(.*)} do |c|
      content_type :json

      end_point_obj = settings.loader.end_point(request.path_info)
      
      if end_point_obj.nil?
        halt 404
      end

      request_params = request.env['rack.request.query_hash']

      puts request_params.inspect
      validator = Fkapi::Validator.new end_point_obj, request_params
      
      if validator.valid?
        validator.to_json
      else
        status 404
      end


    end

  end
end
