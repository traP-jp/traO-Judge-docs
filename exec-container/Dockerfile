FROM nixos/nix
RUN nix-channel --update
COPY . /app
WORKDIR /app

RUN nix --extra-experimental-features 'nix-command flakes' build
RUN export PATH=$PATH:/app/result/linked-bin
