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
- has_one :card

## products テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| name         | string     | null: false                    |
| price        | integer    | null: false                    |
| category_id  | integer    | null: false,foreign_key:true   |
| brand        | text       | null: false                    |

### Association

- has_many :product_images
- belongs_to :category
- belongs_to :user

## address テーブル

| Column         | Type       | Options       |
| -------------- | ---------- | ------------- |
| user_id        | integer    | null: false   |
| postal_code    | string     | null: false   |
| municipality   | string     | null: false   |
| block_number   | string     | null: false   |
| apartment_name | string     | nill: false   |

## Association

- belongs_to :user
* ...