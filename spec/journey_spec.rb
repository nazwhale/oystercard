require 'journey'

describe Journey do
  let(:entry_station) { double :entry_station, zone: 1 }
  let(:exit_station) { double :exit_station, zone: 3 }
  subject(:journey) {described_class.new}

  it 'initializes with an instance of fare' do
    expect(journey.fare).to be_truthy
  end

  describe '#start' do
    it "takes entry station" do
      expect(journey).to respond_to(:start).with(1).argument
    end

    it "expects entered station to be part of current trip" do
      journey.start(entry_station)
      expect(journey.current_trip).to eq ({entry_station => nil})
    end
  end

  describe '#finish' do
    it "takes exit station" do
      expect(journey).to respond_to(:finish).with(1).argument
    end

    it "expects exited station to be part of current trip" do
      journey.start(entry_station)
      journey.finish(exit_station)
      expect(journey.current_trip).to eq ({entry_station => exit_station})
    end

  end
end
