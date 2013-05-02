module Fkapi
  class Loader
    attr_accessor :file, :type, :fetcher

    def initialize file
      @file = file
      @file_type = ""

      fetch_data!
    end

    def fetch_data!
      @fetcher = Fetcher.new(@file)
    end

    def end_point path
      # Account for expired and reloading content
      #
      @fetcher.content[path]
    end
  end

end
