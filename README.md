# テーブル設計

## users テーブル

| Column           | Type   | Options                       | 
| ---------------- | ------ | ----------------------------- |
| nickname         | string | null: false                   |
| email            | string | null: false, uniqueness: true |
| password         | string | null: false, uniqueness: true |
| first_name       | string | null: false                   |
| family_name      | string | null: false                   |
| first_name_kana  | string | null: false                   |
| family_name_kana | string | null: false                   |
| birth_date       | string | null: false                   |

### Association
- has_many :items
- has_many :purchases


## items テーブル
| Column            | Type       | Options                        | 
| ----------------- | ---------- | ------------------------------ |
| images            | string     | null: false                    |
| item              | references | null: false, foreign_key: true | 
| user              | string     | null: false, foreign_key: true |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null:false                     |
| condition_id      | integer    | null: false                    |
| carriage_payer_id | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| handling_time     | integer    | null: false                    |
| price             | integer    | null: false                    |

### Association
- belongs_to :users
- has_one :purchases


## purchasesテーブル
| Column | Type   | Options                        | 
| ------ | ------ | ------------------------------ |
| user   | string | null: false, foreign_key: true |
| item   | string | null: false, foreign_key: true |

### Association
- belongs_to :users
- belongs_to :items
- has_one :addresses


## addressesテーブル
| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false                    |

### Association
- belongs_to :purchases