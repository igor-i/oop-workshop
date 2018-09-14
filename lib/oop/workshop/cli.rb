require 'thor'
require 'oop/workshop'

module Oop
  module Workshop
    class CLI < Thor
      desc "portray ITEM", "Determines if a piece of food is gross or delicious"
      def portray(name)
        puts Oop::Workshop::Food.portray(name)
      end

      desc "pluralize", "Pluralizes a word"
      method_option :word, :aliases => "-w"
      def pluralize
        puts Oop::Workshop::Food.pluralize(options[:word])
      end
    end
  end
end