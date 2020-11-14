class DeliveryType < ActiveHash::Base

  self.data = [
    {id: 1, name: 'らくらくフリマ便'}, {id: 2, name: 'ゆうゆうフリマ便'}, {id: 3, name: 'ゆうメール'},
    {id: 4, name: 'レターパック'}, {id: 5, name: '普通郵便（定形、定形外）'}, {id: 6, name: 'クロネコヤマト'},
    {id: 7, name: 'ゆうパック'}, {id: 8, name: 'クリックポスト'}, {id: 9, name: 'ゆうパケット'},
    {id: 10, name: 'その他'}
  ]
end
