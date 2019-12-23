# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[
  ['北海道', '北海道'],
  ['東北', '青森'],['東北', '岩手'],['東北', '宮城'],['東北', '秋田'],['東北', '山形'],['東北', '福島'],
  ['関東', '茨城'],['関東', '栃木'],['関東', '群馬'],['関東', '埼玉'],['関東', '千葉'],['関東', '東京'],['関東', '神奈川'],
  ['中部', '新潟'],['中部', '富山'],['中部', '石川'],['中部', '福井'],['中部', '山梨'],['中部', '長野'],['中部', '岐阜'],['中部', '静岡'],['中部', '愛知'],
  ['近畿', '三重'],['近畿', '滋賀'],['近畿', '京都'],['近畿', '大阪'],['近畿', '兵庫'],['近畿', '奈良'],['近畿', '和歌山'],
  ['中国', '鳥取'],['中国', '島根'],['中国', '岡山'],['中国', '広島'],['中国', '山口'],
  ['四国', '徳島'],['四国', '香川'],['四国', '愛媛'],['四国', '高知'],
  ['九州', '福岡'],['九州', '佐賀'],['九州', '長崎'],['九州', '熊本'],['九州', '大分'],['九州', '宮崎'],['九州', '鹿児島'],['沖縄', '沖縄']
].each do |region, prefecture|
  Tag.create!(
    { region: region, prefecture: prefecture }
  )
end