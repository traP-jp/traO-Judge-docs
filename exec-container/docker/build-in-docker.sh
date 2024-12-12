#!/root/.nix-profile/bin/bash

# コンテナビルド
if ! nix build --extra-experimental-features nix-command --extra-experimental-features flakes
then
  exit 1
fi

# /resultに書き込み権限を付与
chmod u+w /result

# ビルド結果をコピー
realpath /workspace/result | xargs -I {} cp {} /result

# 読み取り専用に戻す
chmod u-w /result
