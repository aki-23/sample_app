# README

# sample_app DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
### Association
- has_many :groups, through: :users_groups
- has_many :users_groups
- has_many :messages

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :users, through: :users_groups
- has_many :users_groups
- has_many :tags, through: :groups_tags
- has_many :groups_tags
- has_many :messages

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string||
|text|string||
|user_id|integer|null:false, foreign_key: true|
|group_id|integer|null:false, foreign_key: true|
### Association
- belongs_to :users
- belongs_to :group

## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|text|string|null: false|
### Association
- has_many :groups, through: :groups_tags
- has_many :groups_tags

## users_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null:false, foreign_key: true|
|group_id|integer|null:false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :group

## groups_tagsテーブル
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null:false, foreign_key: true|
|tags_id|integer|null:false, foreign_key: true|
### Association
- belongs_to :group
- belongs_to :tag