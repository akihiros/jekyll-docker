#!/bin/sh
set -e

# --------------------------------------------------------------
# entrypoint.sh
# --------------------------------------------------------------
# "github-pages" gem をインストールしてある前提
# カレントディレクトリを /jekyll に移動
cd /jekyll

# Gemfile が存在する場合のみ bundle install
if [ -f Gemfile ]; then
  echo "Gemfile is exist. start bundle install..."
  bundle install
fi

exec bundle exec jekyll "$@" --host 0.0.0.0