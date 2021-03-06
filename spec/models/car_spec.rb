require 'rails_helper'

describe Car, :type => :model do
  before do
    Car.create({:brand => "VW", "value" => "20000", "model" => "Gol", "year" => "2014", "km" => "0", "motor" => "2.0", "fuel" => "gasolina"})
    Car.create({:brand => "VW", "value" => "20000", "model" => "Gol", "year" => "2014", "km" => "55430", "motor" => "2.0", "fuel" => "gasolina"})
    Car.create({:brand => "VW", "value" => "200000", "model" => "Gol", "year" => "2014", "km" => "10", "motor" => "2.0", "fuel" => "gasolina"})
    Car.create({:brand => "VW", "value" => "20000", "model" => "Gol", "year" => "2014", "km" => "0", "motor" => "2.0", "fuel" => "gasolina"})
    Car.create({:brand => "VW", "value" => "20000", "model" => "Gol", "year" => "2014", "km" => "55430", "motor" => "2.0", "fuel" => "gasolina"})
    Car.create({:brand => "VW", "value" => "200000", "model" => "Gol", "year" => "2014", "km" => "0", "motor" => "2.0", "fuel" => "gasolina"})
  end
  
  describe "#second_hand?" do
    it "should be true only when km is greater than 0" do
      car = Car.create(brand: "VW", value: 20000, model: "Gol", year: 2014, km: 10, motor: "1,8")
      expect(car.second_hand?).to eq(true)

      car = Car.create(brand: "VW", value: 20000, model: "Gol", year: 2014, km: 0, motor: "1,8")
      expect(car.second_hand?).to eq(false) 
    end
  end

  describe "#usados" do
    it "returns only second hand cars" do
      Car.usados.each do |car|
        expect(car.km).to be >0
      end
    end
  end

  describe "#novos" do
    it "returns only new cars" do
      expect(Car.novos.length).to eq(2)
    end
  end

  describe "#novos" do
     it "Car news km == 0" do
      Car.novos.each do |car|
        expect(car).to be_new_one
      end 
    end
  end

  

  describe "#luxos" do
    it "returns only luxury cars" do
      Car.create({:brand => "VW", "value" => "ccfxxx", "model" => "Gol", "year" => "2014", "km" => "0", "motor" => "2.0", "fuel" => "gasolina"})
      expect(Car.luxos.length).to eq(1)
    end
  end

    describe "validates" do
      describe "blank fields" do
        it "all fields are mandatory" do
          car = Car.create
          expect(car.errors.messages.length).to eq(6)
          end

        it "model is blank" do

          end
        it "brand is blank" do
          end
        it "value is blank" do
          end
        it "km is blank" do 
          car = Car.create({:brand => "VW", "value" => "20000", "model" => "Gol", "year" => "2014", "motor" => "2.0"})
          expect(car.errors.messages[:km][0]).to eq(": Favor preencher o campo.")
          end

        it "year is blank" do 
          end

        it "model is blank" do 
          end

        it "brand is blank" do 
          end

        it "value should not is blank" do 
          end
    end
  end
end
