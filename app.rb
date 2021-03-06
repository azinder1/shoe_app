require("bundler/setup")
require('pry')
Bundler.require(:default)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

get('/store/new') do

  @brands = Brand.all
  erb(:store_form)
end

get('/brand/new') do
  @stores = Store.all
  erb(:brand_form)
end

post('/brands') do
  name = params['name']
  type = params['type']
  @brand = Brand.create({:name => name, :shoe_type => type})
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

post('/stores') do
  name = params['name']
  address = params['address']
  city = params['city']
  state = params['state']
  zip_code = params['zip_code']
  @store = Store.create({:name => name, :street_address => address, :city => city, :state => state, :zip_code => zip_code})
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

get('/brand/:id') do
  @brand = Brand.find(params['id'])
  @stores = Store.all
  @brand_stores = @brand.stores
  erb(:brand)
end

get('/store/:id') do
  @store = Store.find(params['id'])
  @brands = Brand.all
  @store_brands = @store.brands
  erb(:store)
end


post('/store/brands') do
  @brand = Brand.find(params.fetch('brands').to_i)
  @store = Store.find(params['id'].to_i)
  @store.brands.push(@brand)
  @store_brands = @store.brands
  @brands = Brand.all
  erb(:store)
end

post('/brand/stores') do
  @store = Store.find(params.fetch('stores').to_i)
  @brand = Brand.find(params['id'].to_i)
  @brand.stores.push(@store)
  @brand_stores = @brand.stores
  @stores = Store.all
  erb(:brand)
end

delete('/brands/delete/:id') do
  @brand = Brand.find(params['id'].to_i)
  @brand.delete
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

delete('/stores/delete/:id') do
  @store = Store.find(params['id'].to_i)
  @store.delete
  @stores = Store.all
  @brands = Brand.all
  erb(:index)
end

get('/store/:id/edit') do
  @store = Store.find(params['id'].to_i)
  erb(:store_edit_form)
end

get('/brand/:id/edit') do
  @brand = Brand.find(params['id'].to_i)
  erb(:brand_edit_form)
end

patch('/store/:id') do
  name = params['name']
  address = params['address']
  city = params['city']
  state = params['state']
  zip_code = params['zip_code']
  @store = Store.find(params['id'].to_i)
  @store.update({:name => name, :street_address => address, :city => city, :state => state, :zip_code => zip_code})
  @brands = Brand.all
  @store_brands = @store.brands
  erb(:store)
end

patch('/brand/:id') do
    @brand = Brand.find(params['id'].to_i)
    name = params['name']
    type = params['type']
    @brand.update({:name => name, :shoe_type => type})
    @stores = Store.all
    @brand_stores = @brand.stores
  erb(:brand)
end
