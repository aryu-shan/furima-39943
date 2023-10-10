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

|       Column       |    Type    |         Options           |
| -------------------| ---------- | ------------------------  |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false               |
| family_name        | string     | null: false               |
| first_name         | string     | null: false               |
| family_name_kana   | string     | null: false               |
| first_name_kana    | string     | null: false               |
| birth_day	         | date       | null: false               |

### Association
has_many:item
has_many:order


## itemsテーブル

|     Column      | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| text            | text       | null: false                    |
| category_id     | integer    | null: false                    |
| condition_id    | integer    | null: false                    | #状態
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true | #出品者
| fee_burden_id   | boolean	   | null: false                    |#配送料負担
| area_id         | string     | null: false                    |#地域
| handling_time_id| integer    | null: false                    | #お届けまでの日数

### Association
belongs_to:user
has_one :order


## shippingsテーブル (配送)
|       Column       |    Type        |               Options           |
| -------------------| -------------  | --------------------------------|
| post_code          | string         | null: false                     | #郵便番号
| prefecture_id      | string         | null: false                     | #県
| city               | string         | null: false                     | #市区町村
| building_name      | string         |                                 |#建物名
| street_address     | string         |                                 |#番地
| phone_number       | string         |                                 | #電話番号
| orders_id          | references     | null: false, foreign_key: true  |

### Association
belongs_to :order

## ordersテーブル(購入情報)

|    Column    | Type       |      Options                   |
| -------------| ---------- | -------------------------------|
| user_id      | references | null: false, foreign_key: true |
| item_id 	   | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :shipping
belongs_to:item






