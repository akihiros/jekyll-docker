# jekyll-docker

## 概要

- github pagesの利用を目的としてjekyll環境を立ち上げます
- docker imageはrubyのオフィシャルイメージ(alpine)を利用しています
- 前提としてjekyllのPJを用意してください
  - 例：[akihiros.github.io](https://github.com/akihiros/akihiros.github.io)

## 使い方

- 当リポジトリの配下で実行します

```sh
# ビルド
$ sudo docker build . -t jekyll

# ビルド結果の例
$ sudo docker images
REPOSITORY   TAG       IMAGE ID       CREATED          SIZE
jekyll       latest    242cd1664d71   1 minutes ago   467MB
```

- ローカルで起動したいjekyllのPJフォルダに移動して実行します

```sh
# run
# Ctrl+Cを押すまで起動し続けます
$ sudo docker run --rm -it -p 4000:4000 -v $(pwd):/jekyll jekyll
```