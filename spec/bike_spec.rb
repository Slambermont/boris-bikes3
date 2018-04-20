require 'bike'

describe Bike do
  it { is_expected.to respond_to :working }

  describe '#report_broken' do
    it 'should set the bike to "broken"' do
      subject.report_broken
      expect(subject.working).to eq false
    end
  end
end
