# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)
Genre.create(
    name:"ケーキ"
)
Genre.create(
    name:"クッキー"
)
Genre.create(
    name:"ドーナツ"
)
Item.create(
    name:"プレミアムケーキ", price:"1500", is_active:true, genre_id:"1", image:open("app/assets/images/cake.png"), description:"北海道産原料にこだわった、ふんわり生地にしました。クリームはよりミルク感を感じられる仕立てにしました。 "
)
Item.create(
    name:"ショートケーキ", price:"800", is_active:true, genre_id:"1", image:open("app/assets/images/shotcake.jpg"), description:"クリスマスや誕生日にかかせないショートケーキ。今年は是非手作りにチャレンジ！"
)
Item.create(
    name:"バタークッキー", price:"400", is_active:true, genre_id:"2", image:open("app/assets/images/buttercookie.jpg"), description:"バターの風味豊かで甘くて懐かしい味簡単に作れる大絶賛のサクサククッキー♪"
)
Item.create(
    name:"チョコチップス", price:"600", is_active:true, genre_id:"2", image:open("app/assets/images/chocochips.jpg"), description:"チョコレートを薄くのばしてカールさせたライトな食感のチョコチップス。"
)
Item.create(
    name:"エンゼルフレンチ", price:"200", is_active:true, genre_id:"3", image:open("app/assets/images/enzelfrench.jpg"), description:"軽くてなめらかなホイップクリームをふわっとサンド。"
)
Item.create(
    name:"ポンデリング", price:"200", is_active:true, genre_id:"3", image:open("app/assets/images/pondeling.jpg"), description:"大人気のもちもち食感！"
)