require './spec_helper'

describe Card do
  before :each do
    @card         = Card.new
    @condition    = Condition.new
    @screening    = Screening.new
    @frequency    = Frequency.new
    @cardtitle    = CardTitle.new
  end

  describe "associations" do
    it "should be able to get it's condition"
      expect { @card.condition }.to_not raise_error
    end

    it "should be able to set it's condition"
      expect { @card.condition = @condition }.to_not raise_error
    end
  end

  describe "associations" do
    it "should be able to get it's screening"
      expect { @card.screening }.to_not raise_error
    end

    it "should be able to set it's screenings"
      expect { @card.screening = @screening }.to_not raise_error
    end
  end

  describe "assocations" do 
    it "should be able to get it's frequency"
      expect { @card.frequency }.to_not raise_error
    end

    it "should be able to set it's frequency"
      expect { @card.frequency = @frequency }.to_not raise_error
    end
  end

  describe "associations" do
    it "should be able to get it's card title"
      expect { @card.cardtitle }.to_not raise_error
    end
  end
end