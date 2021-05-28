# Rails-Template

Docker で構築した、Rails テンプレート  
Ruby on Rails on Docker :)

## 使い方

1. リポジトリを取得

```
$ git clone https://github.com/santakurow/rails-template.git
```

2. イメージを構築

```
$ docker-compose build
```

3. 新しく **Gemfile** を更新

```
$ docker-compose run --rm web bundle install
```

4. キャッシュされている **npm** リストを再度インストール

```
$ docker-compose run --rm web yarn --check-files
```

5. **DB** を作成

```
$ docker-compose run --rm web rails db:create
```

6. コンテナを起動して **Rails** を立ち上げる

```
$ docker-compose up
```

Enjoy!
