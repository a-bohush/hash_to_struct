module HashToStruct
  class StructBuilder
    class << self
      def struct_class
        ::Struct
      end

      def build(hash)
        s = struct_class.new(nil, *hash.keys)
        s.new(*hash.values_at(*hash.keys))
      end
    end
  end
end
