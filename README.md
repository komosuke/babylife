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
## トップページ
投稿されたつぶやきが一覧表示されます。
投稿者のみ自身のつぶやきを削除することができます。
ログイン状態であれば、つぶやきごとにいいねが押せるようになっています。
生後何ヶ月というジャンルを選択することで、そのジャンルだけを表示させることもできます。
投稿されたつぶやきの画像をクリックするとつぶやきの詳細画面に遷移します

## 新規登録画面
ニックネーム・Email・パスワード・自己紹介文を入力することで新規登録ができます。
ニックネーム・Email・パスワードは必須で、自己紹介文は任意で入力できます。
登録するとフラッシュメッセージで登録できたか確認できます。

## 投稿画面
トップページから投稿ボタンを押すことでmodalが表示され投稿することができます。

## 投稿詳細画面
投稿者のみ自身のつぶやきを削除することができます。
つぶやきに対してコメントをすることができます。
コメントはコメントした本人のみ削除することができます。
いいねを押すことができます。

## ユーザー詳細画面
登録した生年月日、自己紹介文を確認することができます。
本人のみ登録した情報を編集することができます。
ユーザー本人のみ自身のユーザーページでカレンダーを表示し、記念日を記録することができます。
設定した記念日をクリックすると詳細に遷移します。
ユーザー本人がつぶやいた投稿も一覧で表示されます

## 記録投稿画面
記録する年月日、記録するタイトル、記録する詳細を入力すると記念日を記録することができます。
記念日と記録のタイトルは必須で、詳細記録は任意で入力できます。

## 記録詳細画面
記録した内容が全て見れます。
付けた記録は編集・削除ができます。




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