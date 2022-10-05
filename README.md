# docker-ts2ass-monitor

Dockerコンテナを使用して字幕ASSファイルを生成します。 [arib-ts2ass](https://github.com/johnoneil/arib) を使用しています。

字幕ASSファイルが生成されるのは下記タイミングです。

* 監視対象ディレクトリに `*.m2ts` または `*.ts` が書き込まれ、そのファイルがクローズされた（ `inotifywait --event close_write` ）
* 監視対象ディレクトリに `*.m2ts` または `*.ts` が移動された（ `inotifywait --event moved_to` ）

## 使い方

### Dockerイメージをビルドする

```sh
# Dockerイメージ 68fpjc/ts2ass-monitor:latest をビルドする
dockerfiles/build.sh
```

### コンテナを起動する

```sh
# /path/to/monitor ディレクトリを監視する例
docker run -d --restart unless-stopped --name ts2ass-monitor -v /path/to/monitor/:/app/monitor/ 68fpjc/ts2ass-monitor:latest
```

以上
