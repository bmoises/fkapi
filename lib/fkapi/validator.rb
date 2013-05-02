module Fkapi
  class Validator

    attr_accessor :obj, :params
    # object: hash from input file
    # params: server params
    def initialize obj, params
      @obj = obj
      @params = params

    end

    def valid?
      validate_params
    end

    def to_json
      @obj['response'].to_json
    end

    private
      def validate_params
        op = @obj['params']

        if @obj['strict']
          # We convert to strings because yaml converts these to native types
          # For sake of comparison, convert to strings
          op_vals = op.values.map{|a| a.to_s}
          op.keys == @params.keys && op_vals == @params.values
        else
          # If check is not strict, we don't validate values of params, but 
          # we enforce that keys all match
          op.keys == @params.keys 
        end
      end
  end
end
