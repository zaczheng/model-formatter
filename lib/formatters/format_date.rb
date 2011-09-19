module Formatters
  class FormatDate < Format
    def initialize(options = {})
      @format = options[:format] || :default
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

      # format should be defined in locale.yml
      # see https://github.com/svenfuchs/rails-i18n for examples
      I18n.l(value, :format => @format)
    end
  end
end
