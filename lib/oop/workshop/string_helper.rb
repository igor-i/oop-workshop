module Oop
  module Workshop
    # string helper
    module StringHelper
      def self.plural(str, symbol = 's')
        return str if str.end_with? symbol
        str.concat symbol
      end
    end
  end
end
