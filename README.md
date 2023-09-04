# README

![ER Diagram]
https://tech-master.s3.amazonaws.com/uploads/curriculums//78eba31af2338b5ce8df1e10fd1d5ea9.png

### `users` テーブル
このテーブルは、ユーザーに関する情報を保持します。

- `id` (integer, Not Null, Primary Key): ユーザーID
- `email` (string, Not Null, Unique): ユーザーのメールアドレス
- `encrypted_password` (string, Not Null): 暗号化されたパスワード
- `name` (string, Not Null): ユーザー名
- `profile` (text, Not Null): プロフィール
- `occupation` (text, Not Null): 職業
- `position` (text, Not Null): ポジション

### `prototypes` テーブル
このテーブルは、プロトタイプに関する情報を保持します。

- `id` (integer, Not Null, Primary Key): プロトタイプID
- `title` (string, Not Null): プロトタイプのタイトル
- `catch_copy` (text, Not Null): プロトタイプのキャッチコピー
- `concept` (text, Not Null): プロトタイプのコンセプト
- `user_id` (integer, Not Null, Foreign Key): プロトタイプを作成したユーザーID
# (※`image` は ActiveStorage で実装するため含まない)

### `comments` テーブル
このテーブルは、記事へのコメントに関する情報を保持します。

- `id` (integer, Not Null, Primary Key): コメントID
- `content` (text, Not Null): コメントの内容
- `prototype_id` (integer, Not Null, Foreign Key): コメント対象のプロトタイプID
- `user_id` (integer, Not Null, Foreign Key): コメントを投稿したユーザーID

-END-




This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

