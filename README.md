## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_date       | date   | null: false |


Association
. has_many :items dependent :destroy
. has_many :orders dependent: destroy


## address テーブル

| Column           | Type       | Options               |
| ---------------- | ---------- | --------------------- |
| prefecture_id    | integer    | null: false           |
| city             | string     | null: false           |
| adress           | string     | null: false           |
| zip_code         | string     | null: false           |
| telephone        | string     | null: false           |
| building         | string     |                       |
| order            | refarences | null :false, FK :true |

Association
. belongs_to :order

## orders テーブル

| Column  | Type       | Options               |
| ------- | ---------- | --------------------- |
| user    | references | null: false, FK: true |
| item    | references | null: false, FK: true |

Association
. belongs_to :user
. belonghs_to :item
. has_one :address

## items テーブル

| Column          | Type       | Options               |
| --------------- | ---------- | --------------------- |
| user_id         | integer    | null: false, FK: true |
| category_id     | integer    | null: false           |
| condition_id    | integer    | null: false           |
| shipping_id     | integer    | null: false           |
| prefecture_id   | intger     | null: false           |
| delivery_day_id | integer    | null: false           |
| name            | string     | null: false           |
| price           | integer    | null: false           |
| decribe         | text       | null :false           |

Association
. belongs_to :user
. has_one :order



