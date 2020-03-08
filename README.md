# README

## Apprlication
ski area information

## Description
スキー場についての情報掲示板です。特定のスキー場を押すと、チャット画面に遷移し、投稿や閲覧により情報収集ができます。

## Function
ユーザー関係：新規登録、ログイン、ログアウト  
スキー場関係：一覧表示、人気スキー場表示、スキー場検索  
チャット機能：閲覧、投稿

## Demo

### URL
- http://52.197.123.110
### 管理者ユーザー
- Email : snowman@snowman.com
- Password : snowman1234
### テストユーザー
- Email : test1@test1.com
- Password : test1234

### ホーム画面
ホーム画面から新規登録を行います。
![homepage](https://user-images.githubusercontent.com/56856857/71333627-08aec580-257e-11ea-9648-aae968bff4c3.png)

新規登録画面
![signuppage](https://user-images.githubusercontent.com/56856857/71349561-aa500a00-25b2-11ea-82a0-a88959cfad70.png)

### トップページ
トップページのinformation listからリンク先を選択します。
![toppage](https://user-images.githubusercontent.com/56856857/71332245-d2227c00-2578-11ea-8f70-2fc8eb4837fa.png)

ここで選択したスキー場のチャットページに遷移します。  
右上の検索ボックスで検索（スキー場名、地域、都道府県）が可能です。
![skyarealistpage](https://user-images.githubusercontent.com/56856857/71332677-6c36f400-257a-11ea-80b5-be4a6846624d.png)

人気のスキー場が表示されます。https://www.ski-ichiba.jp/navi/article/270/  
ここからも各スキー場のチャットページに遷移することが可能です。
![ranklistpage](https://user-images.githubusercontent.com/56856857/75603060-2e23f680-5b0e-11ea-8d41-7f49b06d7fe5.png)

### チャットページ
チャット閲覧、投稿により情報収集を行うことが可能です。
![messagepage](https://user-images.githubusercontent.com/56856857/75603056-2b290600-5b0e-11ea-8951-db1e7b3b2fc8.png)

## 開発予定機能
### ユーザーマイページ画面の作成
- 動画、写真投稿
- いいね機能
### スキー場関係
- いいね機能、いいね順表示
### コミュニティ関係
- 管理者へコミュニティ作成依頼、編集依頼、削除依頼
- チャット機能

## DB設計

### usersテーブル
|Column|Type|Options|
|------|----|-------|
|name    |string|null: false|
|email   |string|null: false|
|password|string|null: false|
### Association
- has_many :groups
- has_many :messages

### groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name |string|null: false|
|image|string|null: false|
|rank |integer||
|hp   |text||
### Association
- has_many :users
- has_many :groups_tags
- has_many :messages

### messagesテーブル
|Column|Type|Options|
|------|----|-------|
|image   |string||
|text    |text||
|user_id |integer|null:false, foreign_key: true|
|group_id|integer|null:false, foreign_key: true|
### Association
- belongs_to :users
- belongs_to :group

### tagsテーブル
|Column|Type|Options|
|------|----|-------|
|region    |string|null: false|
|prefecture|string|null: false|
### Association
- has_many :groups_tags
