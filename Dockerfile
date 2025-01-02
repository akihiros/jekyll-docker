# --------------------------------------------------------------
# Dockerfile
# --------------------------------------------------------------
FROM ruby:3.2-alpine

# パッケージをアップデート & 必要ツールをインストール
RUN apk update && apk --no-cache upgrade && \
    apk add --no-cache build-base git

# GitHub Pages と Bundler をインストール
# ※ バージョンを固定したい場合は "gem install github-pages -v 〇〇" など調整
RUN gem install bundler github-pages

# セキュリティ対応
# 非rootユーザを作成(権限をjekyll projectに合わせる)
ARG HOST_UID=1000
ARG HOST_GID=1000

RUN addgroup -g $HOST_GID jekyll && \
    adduser -D -u $HOST_UID -G jekyll jekyll

WORKDIR /jekyll
RUN chown -R jekyll:jekyll /jekyll
RUN chown -R jekyll:jekyll /usr/local/bundle

# entrypointをcopyして実行権限付与
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# 作業ユーザに切り替え
USER jekyll

# default server port
EXPOSE 4000

# ENTRYPOINTとCMDの指定
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
# デフォルトは "serve" とする ("build" など別のコマンドに切り替え可能)
CMD ["serve"]

