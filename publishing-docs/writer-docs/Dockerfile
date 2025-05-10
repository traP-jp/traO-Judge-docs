FROM node:23-slim AS builder
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable
RUN corepack prepare pnpm@latest --activate
COPY . /app
WORKDIR /app
RUN pnpm install
RUN pnpm -F writer-docs docs:build
