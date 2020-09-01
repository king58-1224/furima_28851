# README
# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| -----------------| ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| password_conform | string | null: false |
| first_name       | string | nill: false |
| family_name      | string | nill: false |
| first_name_kana  | string | nill: false |
| family_name_kana | string | nill: false |
| birthday         | date   | nill: false |

### Association

- has_many :items
- has_many :item_purchase


## items テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| price        | integer    | null: false                    |
| description  | text       | null: false                    |
| condition    | string     | null: false                    |
| shipping_cost| string     | null: false                    |
| shipping_days| string     | null: false                    |
| category_id  | integer    | null: false                    |
| brand        | text       | null: false                    |

### Association
- has_one :item_purchase
- belongs_to :user


## addresses テーブル

| Column         | Type       | Options       |
| -------------- | ---------- | ------------- |
| user_id        | integer    | null: false   |
| postal_code    | string     | null: false   |
| municipality   | string     | null: false   |
| prefecture_id  | integer    | null: false   |
| block_number   | string     | null: false   |
| apartment_name | string     |               |
| phone_number	 | string     |               |

## Association

- belongs_to :item_purchase

## item_purchases テーブル

| Column      | Type     | Options                        |
| ----------- | -------- | -------------------------------|
| user_id     | integer  | null: false,foreign_key: true  |
| item_id     | integer  | nill: false,foreign_key: true  |

## Association
- belongs_to :item
- belongs_to :user
- has_one :address