class DeliveryDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1日〜２日で発送' }, { id: 3, name: '２日〜３日で発送' },
    { id: 4, name: '４日〜７日で発送' }
    ]
end
