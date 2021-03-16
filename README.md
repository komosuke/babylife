# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | string  | null: false |
| birthday           | date    | null: false |
| profile            | text    |             |

### Association

- has_many :tweets
- has_many :comments
- has_many :memories
- has_many :favorites


## tweets テーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| title          | string     | null: false       |
| content        | text       | null: false       |
| after_birth_id | integer    | null: false       |
| user           | references | foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- has_many :favorites


## comment テーブル
| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| text   | text       | null: false       |
| user   | references | foreign_key: true |
| tweet  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet

## memories テーブル
| Column      | Type       | Options           |
| ----------- | ---------- | ----------------- |
| title       | string     | null: false       |
| content     | text       |                   |
| memory_date | date       | null: false       |
| user        | references | foreign_key: true |

- belongs_to :user

## favorite テーブル
| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| user_id  | integer    |                   |
| tweet_id | integer    |                   |

- belongs_to :user
- belongs_to :tweet