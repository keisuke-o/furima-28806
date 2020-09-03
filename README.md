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
. has_many :items
. has_many :orders dependent: destroy
. has_one :address dependent: destroy


## address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user_id          | references | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| adress           | string     | null: false |
| zip_code         | string     | null: false |
| telephone        | string     | null: false |
| building         | string     | null: false |

Association
. belongs_to :user

## orders テーブル

| Column  | Type       | Options               |
| ------- | ---------- | --------------------- |
| user    | references | null: false, FK: true |
| item    | references | null: false, FK: true |

Association
. belongs_to :user
. belongs_to :item

## items テーブル

| Column          | Type       | Options               |
| --------------- | ---------- | --------------------- |
| seler_user_id   | integer    | null: false, FK: true |
| categoly_id     | integer    | null: false, FK: true |
| condition_id    | integer    | null: false           |
| shippig_id      | integer    | null: fals, FK: true  |
| prefecture_id   | intger     | null: false           |
| delivery_day_id | integer    | null: false           |
| name            | string     | null: false           |
| price           | integer    | null: false           |
| decribe         | text       | null :false           |

Association
. belongs_to :user


