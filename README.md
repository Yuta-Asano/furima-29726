
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

## Association

- has_many :items
- has_one  :order

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| items_name        | string     | null: false                    |
| image             | string     | null: false                    |
| price             | integer    | null: false                    |
| items_information | text       | null: false                    |
| items_status_id   | integer    | null: false                    |
| delivery_fee_id   | integer    | null: false                    |
| area_id           | integer    | null: false                    |
| category_id       | integer    | null: false                    |
| user              | references | null: false, foreign_key: true |


## Association

- has_one :order
- belong_to :user

## orders テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| item           | references | null: false, foreign_key: true |

## Association

- belong_to :user
- belong_to :item

## addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| post_code      | string  | null: false |
| city           | string  | null: false |
| address        | string  | null: false |
| building       | string  |             |
| phone_number   | string  | null: false |
| prefectures_id | integer | null: false |

### Association

- belongs_to :order

