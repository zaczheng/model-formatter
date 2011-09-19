module Formatters
  class FormatDate < Format
    def initialize(options = {})
      @format = options[:format] || :normal
      @exclude_time = options[:exclude_time] || false
    end

    def from(value, options = {})
      if @exclude_time
        value = value.to_date
      end

      value.to_s(@format.to_sym)
    end
    
    def to(value, options = {})
      if @exclude_time
        value = value.to_date
      end
      value.to_time
    end
  end
end
