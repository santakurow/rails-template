# Rails-Template v1.2

[Docker](https://www.docker.com/products/docker-desktop) で構築された、[Ruby on Rails](https://github.com/rails/rails) 自作テンプレート  
無駄なセットアップ作業は必要なしで、以下の方法で立ち上げればすぐにdocker上で使用可能(dockerが手元のPCにインストールされていることが前提)  

- Ruby v2.7.3
- Rails v6.1


## 使い方

1. サイト右上の **Use this template** からこのリポジトリをテンプレートとして新しく複製し、その複製されたリポジトリを作業ディレクトリにクローンする

```
$ git clone https://github.com/santakurow/リポジトリ名.git
```

2. イメージを構築

```
$ docker-compose build
```

3. 新しく `Gemfile` を更新

```
$ docker-compose run --rm web bundle install
```

4. キャッシュされている npm リストを再度インストール(**webpacker**コマンドを使えるようにする)

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
APP_NAME=プロジェクト名

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
