# ココノコレ
飲食店のおすすめグルメを共有できるWebサービスです。

## デモ
https://kokonokore.herokuapp.com/
```
【デバッグ用アカウント】  
メールアドレス: test@example.com  
パスワード: testtest
```

## 機能一覧
- 記事・・・一覧表示、詳細表示、投稿
- 管理ユーザー・・・登録、ログイン
- 画像ファイルのアップロード・・・carrierwaveを使用。デモはS3へアップロード
- 「いいね」機能
- パスワード暗号化・・・bcryptを使用
- ページネーション・・・kaminariを使用

## 使用技術
- 言語・・・Ruby
- フレームワーク・・・Ruby on Rails、Bootstrap
- データベース・・・PostgreSQL
- 本番環境・・・Heroku

## バージョン
- Ruby 2.6.0
- Ruby on Rails 5.2.3