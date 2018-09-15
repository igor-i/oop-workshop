module Oop
  module Workshop
    # array helper
    module ArrayHelper
      def self.middle(array)
        middle_index = array.count / 2
        array.fetch(middle_index)
      end
    end
  end
end
