require "hash_to_struct/version"
require "hash_to_struct/struct_builder"
require "hash_to_struct/struct"

module HashToStruct
  class << self
    def build(h, **opts)
      HashToStruct::Struct.new(h, **opts)
    end

    def struct(hash, **opts)
      build(hash, **opts.merge({builder_class: HashToStruct::StructBuilder}))
    end

    def ostruct(hash, **opts)
      require 'hash_to_struct/open_struct_builder'
      build(hash, **opts.merge({builder_class: HashToStruct::OpenStructBuilder}))
    end
  end
end
