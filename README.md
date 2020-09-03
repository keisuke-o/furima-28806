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
| birth_year       | string | null: false |
| birth_montth     | string | null: false |
| birth_day        | string | null: false |

Association
. has_many :items
. has_many :likes dependent: destroy
. has_many :comments dependent: destroy
. has_many :orders dependent: destroy
. has_one :address dependent: destroy
. has_many :wallets dependent :destroy


## address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user_id          | references | null: false |
| prefecture_id    | integer    | null: false |
| city             | string     | null: false |
| adress           | string     | null: false |
| zip_code         | string     | null: false |
| telephone        | string     | null: false |

Association
. belongs_to :user

## orders テーブル

| Column  | Type       | Options               |
| ------- | ---------- | --------------------- |
| user    | references | null: false, FK: true |
| item    | references | null: false, FK: true |

Association
. belongs_to :user
. belongs_to :items

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

Association
. belongs_to :user
. has_many :comments dependent :destroy
. has_many :items_images dependent :destroy
. has_many :likes dependent :destroy


## item_image テーブル

| Column    | Type       | Options               |
| --------- | ---------- | --------------------- |
| item_id   | references | null: false, FK: true |
| image_url | string     | null: false           |

Association
. belongs_to :items

## comments テーブル

| Column  | Type       | Options               |
| ------- | ---------- | --------------------- |
| user_id | references | null: false, FK: true |
| item_id | references | null: false, FK: true |
| text    | text       | null: false           |

Association
. belongs_to :user
. belongs_to :items


## likes テーブル

| Column  | Type       | Options               |
| ------- | ---------- | --------------------- |
| user_id | references | null: false, FK: true |
| item_id | references | null: false, FK: true |

Association
. belongs_to :user
. belongs_to :items


## wallets テーブル

| Column  | Type       | Options               |
| ------- | -----------| --------------------- |
| user_id | references | null: false, FK: true |
| money   | integer    | null: false           |

Association
. belongs_to :user


