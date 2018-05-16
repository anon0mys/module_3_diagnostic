require 'rails_helper'

describe StationsPresenter do
  it 'should initialize with zip code' do
    presenter = StationsPresenter.new('80203')

    expect(presenter.zip).to eq('80203')
  end
end
