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
| password           | string     | null: false |
| encrypted_password | string     | null: false |
| family_name        | string     | null: false |
| first_name         | string     | null: false |
| family_name_kana   | string     | null: false |
| first_name_kana    | string     | null: false |
| birth_day	         | date       | null: false |


### Association
belongs_to :items
has_one :shipping


## itemsテーブル

|     Column     | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| name           | string     | null: false                    |
| text           | text       | null: false                    |
| category       | integer    | null: false                    |
| condition      | integer    | null: false                    | #状態
| price          | integer    | null: false                    |
| seller_user_id | references | null: false, foreign_key: true | #出品者

### Association
has_many :users
has_one :shipping


## shippingsテーブル (配送)
|       Column       |    Type    |    Options  |
| -------------------| ---------- | ------------|
| fee_burden         | boolean    | null: false | #手数料負担
| area               | integer    | null: false |
| handling_time      | integer    | null: false | #お届けまでの日数
| post_code          | string     | null: false | 
| prefecture	       | string     | null: false | #県
| city               | string     | null: false | 
| address            | string     | null: false | 
| building_name      | string     |             | 
| street_address     | string     |             |#番地
| phone_number       | string     |             | 

### Association
belongs_to :items

## ordersテーブル

|     Column     | Type       | Options                        |
| ---------------| ---------- | ------------------------------ |
| buyer_user_id  | references | null: false, foreign_key: true |
| item_id	       | references | null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item







