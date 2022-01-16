require 'hash_to_struct/open_struct_builder'

RSpec.describe HashToStruct::OpenStructBuilder do
  describe '.build' do
    it 'builds instance of ::OpenStruct from hash' do
      result = described_class.build({q: 1, 'w' => 2})
      expect(result).to be_a(::OpenStruct)
      expect(result.q).to eq(1)
      expect(result.w).to eq(2)
    end
  end
end
