FactoryBot.define do
  factory :order do
    

    #allow(Payjp::Charge).to receive(:create).and_return(PayjpMock.prepare_valid_charge)
  end
end
