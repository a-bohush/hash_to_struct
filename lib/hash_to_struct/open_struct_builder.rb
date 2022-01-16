require 'ostruct'

module HashToStruct
  class OpenStructBuilder
    class << self
      def struct_class
        ::OpenStruct
      end

      def build(hash)
        struct_class.new(hash)
      end
    end
  end
end
