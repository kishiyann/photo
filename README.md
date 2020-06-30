![gorimepresetV2_TP_V](https://user-images.githubusercontent.com/62429329/82107954-6084dd80-9766-11ea-9aef-3f940f339267.jpg)
ページIPアドレス：http://54.248.177.20/.   <br>

# :camera: Function  
## １、ホーム
<img width="1440" alt="スクリーンショット 2020-05-16 10 52 51" src="https://user-images.githubusercontent.com/62429329/82108150-852d8500-9767-11ea-851d-f3584d187c0d.png"> 
中央にあるバーの部分がスライドショーになっています。<br>
表示画像はそのページ内にある画像をランダムで表示させます。

## ２、ログイン
<img width="1419" alt="スクリーンショット 2020-05-16 10 55 20" src="https://user-images.githubusercontent.com/62429329/82108222-0127cd00-9768-11ea-8f6d-b7dffccb9c8c.png">
ゲストログイン（閲覧用）と書いてある部分をクリックすると新規登録しなくてもログインすることができます。<br>
本来は新規登録してもらうことを前提にしているのでゲストログイン部分のデザインは簡素なものにしました。

## ３、新規登録
<img width="1423" alt="スクリーンショット 2020-05-16 10 55 48" src="https://user-images.githubusercontent.com/62429329/82108200-c887f380-9767-11ea-8dc0-6e617af08e80.png">  

## ４、投稿詳細画面
**他の人の投稿詳細画面**
<img width="1327" alt="スクリーンショット 2020-05-16 10 53 38" src="https://user-images.githubusercontent.com/62429329/82108233-1997e780-9768-11ea-9eb1-03c2585f9d3b.png">
ログインしていればコメント欄のユーザー名をクリックするとそのユーザーの投稿一覧を見ることができます。<br>
コメント機能に関してはログインしている時のみコメントすることができます。

**自分の投稿詳細画面**
<img width="1310" alt="スクリーンショット 2020-05-16 11 36 50" src="https://user-images.githubusercontent.com/62429329/82108552-2289b880-976a-11ea-96d4-227f22d437c5.png">
自身の投稿詳細画面には白い▼が出るようになりそれをクリックすると削除ボタンが出て削除できるようになります。

## ５、投稿画面
<img width="1423" alt="スクリーンショット 2020-05-16 11 28 51" src="https://user-images.githubusercontent.com/62429329/82108281-6f6c8f80-9768-11ea-8a94-d7adf19f1e31.png">
写真の枠をクリックすると写真を選択し、選んだ画像のプレビューを見ることができます。

## ６、カテゴリー検索、ページネーション
<img width="1400" alt="スクリーンショット 2020-05-16 10 54 37" src="https://user-images.githubusercontent.com/62429329/82108334-bb1f3900-9768-11ea-8af1-2391ed10e3f5.png">
上部のCategoryをクリックすると項目が出て、選ぶとそのカテゴリーを付けて投稿されたものを見ることができます。<br>
投稿画像が１ページに１５枚まで表示され、溢れた写真は次のページに入っていきます。

## なぜこれを作ったのか？
twitterやテレビなのでとても綺麗な写真を見ることがよくあると思います。<br>
それを見て「すごく綺麗」「自分もそこに行ってみたい！」など思うことが必ずあると思います。<br>
そんな人の心を動かすことのできる写真や素晴らしいのに埋もれてしまっているものを多くの人と共有することのできる場所、多くの人の心を動かせる場所を作りたいと思いこの投稿サイトを作りました。

## 工夫したポイント
1.サイトの主役である写真を前面に押し出すためにシンプルなデザインにしました。<br>
2.スライドショーを追加することで埋もれてしまう画像が出てこないようにしました。<br>
3.コメント機能で自分の投稿への反応を見られるようにしました。

## 課題、今後実装したい機能
課題はテストがまだ完璧にはかけていない為充実させていく。<br>
*今後実装したい機能*
1.いいね機能
2.自分のいいねした投稿の一覧表示
3.フォロー機能

## DB設計
### userテーブル
|column|type|options|
|------|----|-------|
|email|string|null: false|
|password|string|null: false|
|nickname|string|null: false|
#### Association
 - has_many :tweets, dependent: :destroy
 - has_many :comments, dependent: :destroy
### tweetテーブル
|column|type|options|
|------|----|-------|
|title|string|null: false|
|text|string||
|image|string|null: false|
|user_id|integer||
|category_id|integer|null: false|
#### Association
 - belongs_to :user
 - has_many :comments, dependent: :destroy
 - belongs_to_active_hash :category
 - mount_uploader :image, ImageUploader, dependent: :destroy
### commentテーブル
|column|type|options|
|------|----|-------|
|user_id|integer||
|tweet_id|integer||
|text|text||
