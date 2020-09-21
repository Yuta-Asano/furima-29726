# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| nicname         | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_one  :orders

## items テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| items_name        | string  | null: false |
| image             | string  | null: false |
| price             | integer | null: false |
| items_information | text    | null: false |


### Association

- has_one :orders
- belong_to :users

## order テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| buyer          | string     | null: false |
| purchased_item | string     | null: false |

### Association

- belong_to :users
- belong_to :items

## addresses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| post_code    | string  | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| building     | string  | null: false |
| phone_number | integer | null: false |

### Association

- belongs_to :orders
