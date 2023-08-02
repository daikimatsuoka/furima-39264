# テーブル設計

## users テーブル

| Column                | Type   | Options                   |
| --------------------- | ------ | ------------------------- |
| nickname              | string | null: false               |
| email                 | string | null: false, unique: true |
| encrypted_password    | string | null: false               |
| surname               | string | null: false               |
| first_name            | string | null: false               |
| surname_kana          | string | null: false               |
| first_name_kana       | string | null: false               |
| date_of_birth         | date   | null: false               |

### Association

- has_many: items
- has_many: orders

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | text       | null: false                    |
| description_item      | text       | null: false                    |
| category_id           | integer    | null: false                    |
| condition_id          | integer    | null: false                    |
| shipping_charges_id   | integer    | null: false                    |
| region_id             | integer    | null: false                    |
| number_of_days_id     | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_one: order

## Addresses テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postcode              | string     | null: false                    |
| prefecture            | string     | null: false                    |
| municipalities        | string     | null: false                    |
| address               | string     | null: false                    |
| building              | string     |                                |
| telephone_number      | string     | null: false                    |
| order                 | references | null: false, foreign_key: true |

### Association

- belongs_to: order

## orders テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: item
- has_one: address


