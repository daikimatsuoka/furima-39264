# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| password              | string | null: false |
| password_conformation | string | null: false |
| name                  | string | null: false |
| name_conformation     | string | null: false |
| date_of_birth         | string | null: false |

### Association

- has_many: items
- has_one: order

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item_name             | text       | null: false                    |
| description_item      | text       | null: false                    |
| category              | string     | null: false                    |
| condition             | string     | null: false                    |
| shipping_charges      | string     | null: false                    |
| region                | string     | null: false                    |
| number_of_days        | string     | null: false                    |
| price                 | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |
| order                 | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- belongs_to: item

## orders テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| postcode              | string     | null: false                    |
| prefecture            | string     | null: false                    |
| category              | string     | null: false                    |
| municipalities        | string     | null: false                    |
| address               | string     | null: false                    |
| building              | string     |                                |
| telephone_number      | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to: user
- has_many: items



