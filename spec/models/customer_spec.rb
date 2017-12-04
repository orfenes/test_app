require 'rails_helper'

RSpec.describe Customer, type: :model do
  it '#full_name' do
    customer = create(:customer)
    expect(customer.full_name).to start_with("Sr.")    
  end

  it '#full_name - sobrescrevendo atributo' do
    customer = create(:user, name:'Orfenes') #ou create(:customer)
    expect(customer.full_name).to eq('Sr. Orfenes')    
  end

  it '#full_name - herença true' do
    customer = create(:customer_vip)
    expect(customer.vip).to be_truthy
  end

  it '#full_name - hereança false' do
    customer = create(:customer_default)
    expect(customer.vip).to be_falsey
  end

  it 'usando attributes_for' do
    attrs = attributes_for(:customer)
    customer = Customer.create(attrs);
    expect(customer.full_name).to start_with('Sr.')
  end


  it 'Attributo transitorio' do
    customer = create(:customer_default, upcased: true)    
    expect(customer.name.upcase).to eq(customer.name)
  end

  it { expect{ create(:customer)}.to change {Customer.all.size}.by(1) }

end
