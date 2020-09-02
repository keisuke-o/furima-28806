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


## adress テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| user_id          | references | null: false |
| family_bname     | string     | null: false |
| first_name       | string     | null: false |
| family_name_kana | string     | null: false |
| first_name_kana  | string     | null: false |
| prefecture       | string     | null: false |
| city             | string     | null: false |
| adress           | string     | null: false |
| zip_code         | string     | null: false |
| telephone        | string     | null: false |

## orders テーブル

| Column  | Type       | Options               |
| ------- | ---------- | --------------------- |
| user_id | references | null: false, FK: true |
| item_id | references | null: false, FK: true |

## items テーブル

| Column        | Type       | Options               |
| ------------- | ---------- | --------------------- |
| seler_user_id | references | null: false, FK: true |
| categoly_id   | references | null: false, FK: true |
| condition     | integer    | null: false           |
| shippig_id    | referevces | null: fals, FK: true  |
| prefecture    | string     | null: false           |
| delivery day  | integer    | null: false           |
| name          | string     | null: false           |
| price         | integer    | null: false           |


## item_image テーブル

| Column    | Type       | Options               |
| --------- | ---------- | --------------------- |
| item_id   | references | null: false, FK: true |
| image_url | string     | null: false           |


## comments テーブル

| Column  | Type       | Options               |
| ------- | ---------- | --------------------- |
| user_id | references | null: false, FK: true |
| item_id | references | null: false, FK: true |
| text    | text       | null: false           |


## likes テーブル

| Column  | Type       | Options               |
| ------- | ---------- | --------------------- |
| user_id | references | null: false, FK: true |
| item_id | references | null: false, FK: true |


## wallets テーブル

| Column  | Type       | Options               |
| ------- | -----------| --------------------- |
| user_id | references | null: false, FK: true |
| money   | integer    | null: false           |


