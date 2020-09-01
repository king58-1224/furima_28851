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

- has_many :products
- has_one :address

## products テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| price        | string     | null: false                    |
| description  | string     | null: false                    |
| condition    | string     | null: false                    |
| shipping_cost| string     | null: false                    |
| shipping_days| string     | null: false                    |
| category_id  | integer    | null: false                    |
| brand        | text       | null: false                    |
| buyer_id     | integer    |	null: false                    |

### Association

- has_many :product_images
- belongs_to :category
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

- belongs_to :user

## product_images テーブル

| Column      | Type     | Options                        |
| ----------- | -------- | -------------------------------|
| user_id     | string   | null: false                    |
| item_id     | string   | nill: false,foreign_key: true  |

## Association

- belongs_to :user
* ...