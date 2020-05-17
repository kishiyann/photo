# frozen_string_literal: true

class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '風景' }, { id: 2, name: 'ポートレート' }, { id: 3, name: 'スナップ' },
    { id: 4, name: 'ペット・生物' }, { id: 5, name: '花・植物' }, { id: 6, name: '自然' },
    { id: 7, name: '鉄道' }, { id: 8, name: '車・バイク' }, { id: 9, name: '食事・料理' },
    { id: 10, name: '水中写真' }, { id: 11, name: '趣味' }, { id: 12, name: 'フィギュア' },
    { id: 13, name: 'モノクローム' }, { id: 14, name: '旅行' }, { id: 15, name: 'ファッション' },
    { id: 16, name: 'スポーツ' }, { id: 17, name: 'スチルライフ' }, { id: 18, name: '都市風景' },
    { id: 19, name: 'その他' }
  ]
end
