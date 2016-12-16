require('spec_helper')


describe(Brand) do
  store1 = Store.create({:name => "Footlocker", :zip_code => 97212, :city => 'Portland', :state => "Oregon", :street_address => "123 Sesame Street"})
  brand1 = Brand.create({:name => "Nike", :shoe_type => "Athletic"})
  brand2 = Brand.create({:name => "Sportiva", :shoe_type => "Climbing"})

  describe("tests brand for properties") do
    it "test for name of brand" do
      expect(brand1.name).to(eq("Nike"))
    end
  end
  describe("join table test") do
    it "can match a store with a brand" do
      brand1.stores.push(store1)
      expect(brand1.stores).to(eq([store1]))
    end
  end
  describe("can take a word and titlecase it") do
    it "titalizes words" do
      brand3 = Brand.create({:name => "spooortiva", :shoe_type => "Climbing"})
      expect(brand3.name).to(eq('Spooortiva'))
    end
  end
  describe("uniqueness path") do
    it "prevents redundant addition of names" do
      brand1 = Brand.create({:name => "Nike", :shoe_type => "Athletic"})
      brand2 = Brand.create({:name => "Sportiva", :shoe_type => "Climbing"})
      brand3 = Brand.create({:name => "Nike", :shoe_type => "Running"})
      expect(Brand.all).to(eq([brand1, brand2]))
    end
  end
end
