# Rails-Template

Docker で構築した、Rails テンプレート  
Ruby on Rails on Docker :)

## 使い方

1. リポジトリを取得

```
$ git clone https://github.com/santakurow/rails-template.git ディレクトリ名
```

2. イメージを構築

```
$ docker-compose build
```

3. 新しく `Gemfile` を更新

```
$ docker-compose run --rm web bundle install
```

4. キャッシュされている **npm** リストを再度インストール

```
$ docker-compose run --rm web yarn --check-files
```

5. `.env.sample`ファイルから新しくコピーした`.env`ファイル内の環境変数 **APP_NAME** にプロジェクト名を設定する  
   （設定しない場合は`database.yml`内のデフォルト値でプロジェクト名が設定される）

```
$ cp .env.example .env
```

`.env`

```
APP_NAME=wakuwaku_app

# MYSQL_USERNAME=
# MYSQL_PASSWORD=
# MYSQL_HOST=
```

6. **データベース** を作成

```
$ docker-compose run --rm web rails db:create
```

7. コンテナを起動して **Rails** を立ち上げる

```
$ docker-compose up
```

Enjoy!
