# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|       Column       |    Type    |    Options  |
| -------------------| ---------- | ------------|
| nickname           | string     | null: false |
| email              | string     | null: false |
| encrypted_password | string     | null: false |
| family_name        | string     | null: false |
| first_name         | string     | null: false |
| family_name_kana   | string     | null: false |
| first_name_kana    | string     | null: false |
| birth_day	         | date       | null: false |

### Association
has_many:items
has_many:shipping


## itemsテーブル

|     Column     | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| name           | string     | null: false                    |
| text           | text       | null: false                    |
| category_id    | integer    | null: false                    |
| condition_id   | integer    | null: false                    | #状態
| price          | integer    | null: false                    |
| seller_user_id | references | null: false, foreign_key: true | #出品者
| image          | string     | null: false                    | 

### Association
belongs_to:users
has_one :orders


## shippingsテーブル (配送)
|       Column       |    Type    |    Options  |
| -------------------| ---------- | ------------|
| area               | integer    | null: false |
| handling_time      | integer    | null: false | #お届けまでの日数
| post_code          | string     | null: false | 
| prefecture_id      | string     | null: false | #県
| city               | string     | null: false | 
| address            | string     | null: false | 
| building_name      | string     |             | 
| street_address     | string     |             |#番地

### Association
belongs_to :orders
belongs_to :user

## ordersテーブル(購入情報)

|    Column    | Type       | Options     |
| -------------| ---------- | ------------|
| buyer_user   | references | null: false |
| item	       | references | null: false |
| phone_number | string     |             | 

### Association
belongs_to :user
has_one :shippings
belongs_to:items






