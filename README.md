# テーブル設計

## users テーブル

| Column           | Type   | Options                       | 
| ---------------- | ------ | ----------------------------- |
| nickname         | string | null: false                   |
| email            | string | null: false, uniqueness: true |
| password         | string | null: false                   |
| first_name       | string | null: false                   |
| family_name      | string | null: false                   |
| first_name_kana  | string | null: false                   |
| family_name_kana | string | null: false                   |
| birth_date       | date   | null: false                   |

### Association
- has_many :items
- has_many :purchases


## items テーブル
| Column            | Type       | Options                        | 
| ----------------- | ---------- | ------------------------------ | 
| user              | references | null: false, foreign_key: true |
| name              | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null:false                     |
| condition_id      | integer    | null: false                    |
| carriage_payer_id | integer    | null: false                    |
| prefecture_id     | integer    | null: false                    |
| handling_time     | integer    | null: false                    |
| price             | integer    | null: false                    |

### Association
- belongs_to :user
- has_one :purchase


## purchasesテーブル
| Column | Type       | Options                        | 
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


## addressesテーブル
| Column        | Type       | Options                        | 
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| phone_number  | string     | null: false                    |
| purchase      | references | null: false                    |

### Association
- belongs_to :purchase