require 'spec_helper'


describe(Store) do
  store1 = Store.create({:name => "Footlocker", :zip_code => 97212, :city => 'Portland', :state => "Oregon", :street_address => "123 Sesame Street"})
  store2 = Store.create({:name => "Nike Outlet", :zip_code => 97213, :city => 'Portland', :state => 'Oregon', :street_address => '123 Nike Town Street'})
  brand1 = Brand.create({:name => "Nike", :shoe_type => "Athletic"})

  describe("tests brand for properties") do
    it "test for name of brand" do
      expect(brand1.name).to(eq("Nike"))
    end
  end
  describe("join table test") do
    it "can match a store with a brand" do
      store1.brands.push(brand1)
      expect(store1.brands).to(eq([brand1]))
    end
  end
  describe("join table test") do
    it "test for integration update with brands" do
      store1.update({:brand_ids => [brand1.id()]})
      expect(brand1.stores).to(eq([store1]))
    end
  end
  describe("can take a word and titlecase it") do
    it "titalizes words" do
      store3 = Store.create({:name => "fooooootlocker", :zip_code => 97213, :city => 'Portland', :state => "Oregon", :street_address => "123 Sesame Street"})
    expect(store3.name).to(eq('Fooooootlocker'))
    end
  end
  describe("uniqueness path") do
    it "prevents redundant addition of names" do
      store1 = Store.create({:name => "Footlocker", :zip_code => 97212, :city => 'Portland', :state => "Oregon", :street_address => "123 Sesame Street"})
      store2 = Store.create({:name => "Nike Outlet", :zip_code => 97213, :city => 'Portland', :state => 'Oregon', :street_address => '123 Nike Town Street'})
      store3 = Store.create({:name => "Footlocker", :zip_code => 97213, :city => 'Portland', :state => "Oregon", :street_address => "123 Sesame Street"})
      expect(Store.all).to(eq([store1, store2]))
    end
  end
end
