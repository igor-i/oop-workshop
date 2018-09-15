module Oop
  module Workshop
    # simple pluralizer
    module Pluralizer
      def self.plural(str, symbol = 's')
        return str if str.end_with? symbol
        str << symbol
      end
    end
  end
end
