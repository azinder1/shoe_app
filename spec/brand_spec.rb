require('spec_helper')


describe(Brand) do
  store1 = Store.create({:name => "Footlocker", :zip_code => 97212, :city => 'Portland', :state => "Oregon", :street_address => "123 Sesame Street"})
  brand1 = Brand.create({:name => "Nike", :shoe_type => "Athletic"})
  brand2 = Brand.create({:name => "Sportiva", :shoe_type => "Climbing"})

  describe("tests brand for properties") do
    it "test for name of brand" do
      expect(brand1.name).to(eq("Nike"))
    end
    it "test for integration with stores" do
      brand1.update({:store_ids => [store1.id()]})
      brand2.update({:store_ids => [store1.id()]})
      expect(store1.brands).to(eq([brand1, brand2]))
    end
  end
end
