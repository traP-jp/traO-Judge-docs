# Jobの概要
traOJudgeでは、提出に対するジャッジへの入力(テストケースや提出言語など)やジャッジ処理はすべてJobとして扱われます。Jobは、処理結果としてファイルを出力します。このファイルをOutcomeと呼びます。Jobには、
- StaticText
- RuntimeText
- EmptyDirectory
- Execution

の4種類があります。

## StaticText Job
StaticText Jobは作問に作問者が決めるテキスト(テストケースやジャッジ用のスクリプトなど)を配置するためのJobです。Outcomeはテキストファイルです。

## RuntimeText Job
RuntimeText Jobは提出時に決まりジャッジシステムから与えられるテキスト(提出言語など)を配置するためのJobです。Outcomeはテキストファイルです。

## EmptyDirectory Job
EmptyDirectory Jobは後述するExecution Jobで一時ディレクトリとして利用できるからのディレクトリを配置するためのJobです。Outcomeは空のディレクトリです。

## Execution Job
Execution Jobはジャッジの処理を行うためのJobです。このJobは(Execution Jobを含む)他のJobのOutcomeを参照することができます。この参照関係はOutcomeとOutcomeのパスを指定する環境変数の名前の組として指定することができ、これをDependencyと呼びます。Execution JobはDependencyの配列とExecutionのエントリーポイントとなるスクリプトで構成されます。また、Execution JobのOutcomeは処理終了後に環境変数`TRAOJUDGE_EXEC_OUTPUT`で与えられるパスのファイルです。