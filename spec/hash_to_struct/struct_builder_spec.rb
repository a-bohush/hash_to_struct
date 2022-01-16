RSpec.describe HashToStruct::StructBuilder do
  describe '.build' do
    it 'builds instance of ::Struct from hash' do
      result = described_class.build({q: 1, 'w' => 2})
      expect(result).to be_a(::Struct)
      expect(result.q).to eq(1)
      expect(result.w).to eq(2)
    end
  end
end
