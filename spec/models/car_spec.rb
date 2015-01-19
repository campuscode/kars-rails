require 'rails_helper'

describe Car, :type => :model do
  before do
    Car.create({:brand => "VW", "value" => "20000", "model" => "Gol", "year" => "2014", "km" => "0", "motor" => "2.0"})
    Car.create({:brand => "VW", "value" => "20000", "model" => "Gol", "year" => "2014", "km" => "55430", "motor" => "2.0"})
    Car.create({:brand => "VW", "value" => "200000", "model" => "Gol", "year" => "2014", "km" => "10", "motor" => "2.0"})
    Car.create({:brand => "VW", "value" => "20000", "model" => "Gol", "year" => "2014", "km" => "0", "motor" => "2.0"})
    Car.create({:brand => "VW", "value" => "20000", "model" => "Gol", "year" => "2014", "km" => "55430", "motor" => "2.0"})
    Car.create({:brand => "VW", "value" => "200000", "model" => "Gol", "year" => "2014", "km" => "0", "motor" => "2.0"})
  end
  describe "#usados" do
    it "returns only second hand cars" do
      expect(Car.usados.length).to eq(3)
    end
  end

  describe "#novos" do
    it "returns only new cars" do
      expect(Car.novos.length).to eq(2)
    end
  end
  describe "#luxos" do
    it "returns only luxury cars" do
      Car.create({:brand => "VW", "value" => "ccfxxx", "model" => "Gol", "year" => "2014", "km" => "0", "motor" => "2.0"})
      expect(Car.luxos.length).to eq(0)
    end
  end
  describe "validates" do
    describe "blank fields" do
      it "all fields are mandatory" do
        car = Car.create
        expect(car.errors.messages.length).to eq(5)
      end
      it "model is blank" do

      end
      it "brand is blank"
      it "value is blank"
    end
  end
end