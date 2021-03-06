# docker_practiceの解説およびDockerについてのメモ

PythonのFlaskを使って，Webを立ち上げてみるだけのプログラム

一応Dockerfileも書いている

参考：[Docker超入門講座 合併版 | ゼロから実践する4時間のフルコース](https://www.youtube.com/watch?v=lZD1MIHwMBY&t=6693s)

## コンテナ起動

以下のコマンドでイメージの作成およびコンテナ起動が可能

```
# イメージ作成
> docker image build -t docker_flask/practice:latest .
# コンテナ作成＆起動
> docker container run -d -p 8080:8000 --name docker_flask docker_flask/practice:latest
```

![docker image build](./img/image_build.png)

![docker container run](./img/container_run.png)

## ブラウザ閲覧方法

ブラウザを立ち上げて、以下のURLにアクセスする。

[http://127.0.0.1:8080](http://127.0.0.1:8080)

[index.html](./templates/index.html)の中身が表示されていたら成功

![browse](./img/browse.png)

## コンテナ動作状況確認

以下のコマンドで、現在稼働中のDockerコンテナを確認可能

```
> docker container ls
```

停止中のコンテナ含め確認したい場合は以下のコマンドを入力する。

```
> docker container ls -a
```


## コンテナ停止

コンテナを停止する場合は以下のコマンドを入力

```
> docker container stop docker_flask
```

停止しているかを確認するために、稼働中のコンテナがないか確認すると良い


## コンテナ削除

コンテナを削除する場合は以下のコマンドを入力

```
> docker container rm docker_flask
```

コンテナ稼働したあとに修正点を見つけて、ファイルを修正した場合はイメージを新たに生成する必要がある。

その際に前のコンテナが残っていると、`> docker container run`を実行する際にエラーを出す。

コンテナを停止したら削除する習慣をつけると良い。


## コンテナのお掃除

停止中のコンテナを一度に削除することができる。

```
> docker container prune
```

覚えておくとよいだろう。


## Dockerイメージの確認

作成したDockerイメージは以下のコマンドで確認することができる。

```
> docker image ls
```


## イメージ作成について

Dockerイメージを作成する際のコマンドについて解説

```
> docker image build
```

このコマンドでDockerイメージを作成することができる。

`-t`は**タグをつける**という意味となる。`-t docker_flask/practice:latest`と書くことで、**docker\_flask/practice**となる。

## コンテナ作成＆起動について

```
> docker container run
```

このコマンドを入力するだけで、コンテナ作成と起動の両方を行ってくれる。

起動するイメージについて、`> docker image ls`で確認可能なのでうまく使用するとよいだろう。


`-p 8080:8000`という箇所は、Dockerを起動する端末（localhost/127.0.0.1）側のポートと起動するコンテナ内のポートを連結するためのオプションとなっている。

> ポートの連結について補足説明
> 
> 今回の場合は、*python flask*でポート8000番にブラウザを公開している。
> 
> しかし、公開しているのはDockerコンテナ内であるため、閲覧することはできない。
>
> そこで、localhost/127.0.0.1（自分のPCのIPアドレス）の8080番ポートとDockerコンテナの8000番ポートをつないであげることで、自分のPCの8000番ポートを閲覧すればDockerコンテナで公開したWebページを閲覧することができる。
> 
`--name docker_flask`というものは、コンテナ名を定義しているものとなる。

これ以降、コンテナの停止や削除などといった操作をおこなうときはこの名前を使用することになる。



