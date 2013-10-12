require_relative '../lib/testapi'
require 'fake_web'

describe Testapi::Client do
  let(:client) { Testapi::Client.new(url: 'http://localhost') }

  before(:all) do
    FakeWeb.allow_net_connect = false
  end

  it 'fails to initialize without url' do
    expect { Testapi::Client.new(hello: 'world') }.to raise_error(Testapi::UrlWasNotSetException)
  end

  it 'initializes' do
    client.should be_instance_of Testapi::Client
  end

  it 'fails to add without required params' do
    expect { client.add(foo: 'bar') }.to raise_error(Testapi::InvalidInputException)
  end

  it 'fails with invalid data' do
    FakeWeb.register_uri(:post, 'http://localhost/opt-ins', status: 400)

    expect { client.add(first_name: 'Bogdan',
               last_name: 'Litvinenko',
               email: 'test@gmail.com',
               mobile: '+380631234567',
               permission_type: 'invalid data',
               channel: 'invalid data',
               company_name: 'Company') }.to raise_error(Testapi::InvalidDataException)
  end

  it 'success with valid data' do
    FakeWeb.register_uri(:post, 'http://localhost/opt-ins', status: 200)

    client.add(first_name: 'Bogdan',
               last_name: 'Litvinenko',
               email: 'test@gmail.com',
               mobile: '+380631234567',
               channel: 'sms+email',
               permission_type: 'permanent',
               company_name: 'Company').should be_true
  end
end

