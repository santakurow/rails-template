# Rails-Template

Dockerで構築した、Railsテンプレート  
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
3. bundle installで新しいGemを更新
```
$ docker-compose run --rm web bundle install
```
4. DBを作成
```
$ docker-compose run --rm web rails db:create
```
5. webpackerをインストールし、バイナリーファイル(webpackコマンド)を上書きする
```
$ docker-compose run --rm web rails webpacker:install

  Overwrite /myapp/bin/webpack? (enter "h" for help) [Ynaqdhm] y
  Overwrite /myapp/bin/webpack-dev-server? (enter "h" for help) [Ynaqdhm] y
```
6. コンテナを起動してRailsを立ち上げる
```
$ docker-compose up
```

enjoy!

