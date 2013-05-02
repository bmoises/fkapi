module Fkapi
  
  # Will fetch either a local FS file or a remote file
  class Fetcher
    attr_accessor :path, :content, :parser, :load_time
    def initialize path

      @path = URI.parse path

      parse_file!
    end
    
    def parse_file!
      @load_time = Time.now
      if remote?
        res = Net::HTTP.get_response(@path)
        if res.is_a?(Net::HTTPSuccess)
          parse! res.body
        end
        # TODO: raise error
      else
        parse! File.read(@path.to_s)
      end
    end

    private
      def remote?
        begin
          !@path.host.nil?
        rescue
          false
        end
      end

      def parse!(data)
        case file_ext       
        when :json
          @content = JSON.parse data
        when :yaml
          @content = YAML.load data
        else
          raise Errors::InvalidFileParser
        end
      end

      def file_ext
        File.extname(@path.to_s).gsub(".","").intern
      end

  end
end
