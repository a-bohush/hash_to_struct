RSpec.describe HashToStruct::Struct do
  let(:sample_hash) {
    {
      q: 1,
      w: 2,
      e: {
        r: 3,
        t: { y: 4 },
        u: [{i: 5}]
      }
    }
  }

  it 'recursively converts hashes into Struct-like objects' do
    result = described_class.new(sample_hash)

    expect(result.w).to eq(2)
    expect(result.e.r).to eq(3)
    expect(result.e.t.y).to eq(4)
    expect(result.e.u.first).to be_a(Hash)
  end

  context 'with including_arrays: true true' do
    it 'also converts hashes inside arrays' do
      result = described_class.new(sample_hash, including_arrays: true)
      expect(result.e.u.first.i).to eq(5)
    end
  end

  context 'with immutable: true option' do
    it 'prevents mutations to objects' do
      result = described_class.new(sample_hash, immutable: true)
      expect(result.frozen?).to be(true)
      expect { result.e = 0 }.to raise_error(FrozenError)
    end
  end

  describe "#to_h" do
    it 'converts self to Hash' do
      result = described_class.new(sample_hash, including_arrays: true).to_h
      expect(result).to be_a(Hash)
      expect(result[:e]).to be_a(Hash)
      expect(result[:e][:t]).to be_a(Hash)
      expect(result[:e][:u]).to be_a(Array)
      expect(result[:e][:u].first).to be_a(Hash)
    end
  end
end
