# オンボーディング資料

## はじめに

このドキュメントは、traOJudgeプロジェクトにおけるGit/GitHubの使い方をまとめたものです。traOJudgeプロジェクトではGit Workflowを用いてissueドリブンな開発をします。

## Git Workflow

Git Workflowでは以下のブランチを使用します。

- **main**: 本番環境にデプロイされる安定版コード。
- **develop**: 次のリリースに向けた開発中のコード。
- **release/\***: リリース前の最終調整を行うブランチ。
- **feature/\***: 新機能や改善点を開発するためのブランチ。
- **hotfix/\***: 本番環境の緊急バグ修正を行うブランチ。

![image alt](https://anarsolutions.com/wp-content/uploads/2019/11/Gitflow.png "title")
*Git-Workflow のブランチツリーの概略図* [出典](https://anarsolutions.com/gitflow-branching-model/)


## 開発手順

### 1. Issue の作成

- 新しいタスクやバグ報告、機能追加の要望は、すべてGitHubのIssueとして作成します。
- Issueには詳細な説明を記載してください。
- 適切なラベルを付与し、担当者をアサインします。

### 2. ブランチの作成

- 対応するIssueが作成されたら、以下の命名規則でブランチを作成します。
  - **機能追加・改善**: `feature/#issue番号-簡潔な説明`
    - 例: `feature/#45-add-login-function`
  - **バグ修正**: `hotfix/#issue番号-簡潔な説明`
    - 例: `hotfix/#32-fix-login-error`

### 3. 開発作業

- 作成したブランチ上で開発を行います。
- コミットは小さく、論理的な単位で行ってください。
- コミットメッセージは以下の形式で記述します。
  - 例: `Add user authentication feature`

### 4. プルリクエストの作成

- 開発が完了したら、`develop`ブランチに向けてプルリクエスト（PR）を作成します。
- PRのタイトルにはIssue番号と概要を含めます。
  - 例: `Issue #45: Add user authentication feature`
- PRの説明欄に変更内容や注意点を記載し、レビュアーを指定します。

### 5. コードレビュー

- 指定されたレビュアーがコードレビューを行います。
- レビューで指摘された点は修正し、再度レビューを依頼します。

### 6. マージとブランチの削除

- レビューが承認されたら、`develop`ブランチにマージします。
- マージ後、対応するIssueをクローズし、開発ブランチを削除します。

## 参考リンク

- [Git Workflow の詳細解説](https://nvie.com/posts/a-successful-git-branching-model/)
