RSpec.describe HashToStruct do
  it "has a version number" do
    expect(HashToStruct::VERSION).not_to be nil
  end

  describe '.build' do
    it 'creates instance of HashToStruct::Struct' do
      result = described_class.build({q: 1})
      expect(result).to be_a(HashToStruct::Struct)
    end
  end

  describe '.struct' do
    it 'is based on ruby Struct class' do
      result = described_class.struct({q: 1})
      expect(result.__getobj__).to be_a(::Struct)
    end
  end

  describe '.ostruct' do
    it 'is base on ruby OpenStruct class' do
      result = described_class.ostruct({q: 1})
      expect(result.__getobj__).to be_a(::OpenStruct)
    end
  end
end
