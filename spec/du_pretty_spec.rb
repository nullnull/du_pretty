RSpec.describe DuPretty do
  class DuPretty::DuWrapper
    def du
      if @depth == 2
        <<~EOT
          101	./a/a
          110	./a
          200	./b
          310	.
        EOT
      elsif @depth == nil
        <<~EOT
          1	./a/a/a
          100	./a/a/b
          101	./a/a
          110	./a
          200	./b
          310	.
        EOT
      end
    end
  end
  let(:path) { '/path/to/target' }
  let(:depth) { nil }
  let(:min_kbyte) { 0 }

  it "has a version number" do
    expect(DuPretty::VERSION).not_to be nil
  end

  subject do
    DuPretty::DuWrapper.new(
      path,
      depth: depth,
      min_kbyte: min_kbyte,
    ).tree.split("\n").length
  end

  it "works" do
    expect(subject).to eq(6)
  end

  context 'with depth argument' do
    let(:depth) { 2 }
    it "filter output by depth" do
      expect(subject).to eq(4)
    end
  end

  context 'with min_kbyte argument' do
    let(:min_kbyte) { 200 }
    it "filter output by minimum kbyte" do
      expect(subject).to eq(2)
    end
  end

  context 'with min_kbyte and depth arguments' do
    let(:min_kbyte) { 110 }
    let(:depth) { 2 }
    it "filter output by minimum kbyte" do
      expect(subject).to eq(3)
    end
  end
end
