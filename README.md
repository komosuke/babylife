# アプリ名
「Babylife」

# 概要
子育て中の人同士で情報を共有したり、子育ての記録をするアプリケーションです。

# 本番環境
http://3.115.48.97/

ログイン情報(テスト用)
・ Eメール test@gmail.com
・ パスワード test12345

# 制作背景(意図)
子育てではわからないことが多く、共通の悩みや情報を共有出来る子育てに特化したアプリケーションが欲しいと考えました。また、子供は日々成長していくので、日々の成長も記録出来るアプリケーションを目指しました。

# DEMO

# 工夫したポイント
・つぶやきの投稿方法に関して、気軽につぶやいてもらうために、トップページで簡潔出来るようAjaxを採用しました。これによりトップページで新規投稿を押すとmodalが表示されそのままつぶやけるようになっています。

・異なるデバイスの画面幅に対応できるよう、レスポンシブデザインを実装しました

# 使用技術(開発環境)

## バックエンド
Ruby, Ruby on Rails

## フロントエンド
erb, Sass, Javascript, JQuery, Ajax, bootstrap

## データベース
MySQL, SequelPro, MariaDB

## インフラ
AWS(EC2), Capistrano

## Webサーバ(本番環境)
nginx

## アプリケーションサーバ(本番環境)
unicorn

## ソース管理
Github, GitHubDesktop

## テスト
RSpec

## エディタ
VSCode

# 課題や今後実装したい機能
## 課題
・スマホ画面だと投稿ボタンやマイページに遷移するリンクが小さい
・コメントがツイートの詳細画面からしかできない
## 実装したい機能
・Dockerの導入
・ユーザーフォロー機能
・コメントや、いいねの通知機能

# DB設計

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