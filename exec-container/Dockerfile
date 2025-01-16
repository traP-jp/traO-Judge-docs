# hadolint ignore=DL3029
FROM --platform=amd64 nixos/nix:2.25.2

# configの修正、ワークスペースの作成
RUN printf "filter-syscalls = false\nexperimental-features = nix-command flakes" >> /etc/nix/nix.conf \
	&& mkdir /workspace
COPY . /workspace
WORKDIR /workspace

# ビルド成果物用の空ファイル作成
RUN touch /result \
	# ビルドスクリプトの実行権限付与
	&& chmod +x /workspace/docker/build-in-docker.sh

# ビルドキャッシュとビルド成果物
VOLUME [ "/nix", "/result" ]

# ビルド実行
CMD [ "/workspace/docker/build-in-docker.sh" ]
