# StudySupport
勉強の質問が無料でできるWebアプリです。全国の小学生、中学生、高校生の利用を想定しており、質問への回答はどなたでも可能です。転職用のポートフォリオとして作成しました。

# リンク
https://studysupport.link/

![2020-09-13 (4)](https://user-images.githubusercontent.com/59565900/93003741-2ee91b00-f57c-11ea-9bd6-f8dda2d5f97f.png)

**テストユーザーとしてログイン:**
* ログインページからかんたんログインを押して下さい。
* 質問や回答機能もご利用頂けます。
* テストユーザーでのログイン後、プロフィール編集画面においてパスワードの変更などはご遠慮いただきますようお願い致します。

## 特に見て頂きたい箇所
* Dockerを使用し、ECS/ECRで本番環境をEC2インスタンス内で実行していること
* AWSを使用し、ALBを通すことで常時SSL通信を行っていること
* CodepipelineによりCDラインを構築していること
* 実際の運用を意識し、tag機能により質問投稿の種類（科目）を分けることが可能になっていること

## 使用した技術
**開発環境**

 * Docker
   * docker-compose

**サーバーサイド**

 * mysql:5.7
 * ruby:2.7.0
   * rails:6.0.0
 * AWS
   * ECS
   * ECR
   * EC2
   * ALB
   * RDS(MySQL)
   * S3
   * Route53
   * Certificate Manager
   * VPC
   * CloudWatch
   * IAM
   * CodePipeline
   * CodeBuild
   * CodeDeploy
 
**フロントエンド**

 * nginx:1.15.8
 
**gem**
 
 * sassc-rails
 * webpacker
 * bcrypt
 * rails-i18n
 * kaminari
 * kaminari-bootstrap
 * bootsnap
 * aws-sdk-s3
 * rubocop
 * rubocop-rails
 * rspec-rails 
 
## クラウドアーキテクチャ
![20200913](https://user-images.githubusercontent.com/59565900/93004532-ce111100-f582-11ea-9546-c761cda9c135.png)

CodePipelineを用いてGithubのmasterブランチへのプッシュをウェブフックにして、ECSの自動デプロイを実現しています。

 
## 機能一覧
* 質問一覧表示機能
* 質問詳細表示機能
* 質問投稿機能（編集機能なども含む）
* 回答投稿機能
* 質問削除機能
* 回答削除機能
* 科目別タグ機能
* ユーザー登録機能
* ユーザーログイン機能
* ユーザーログアウト機能
* 画像ファイルのアップロード機能
* ページネーション機能
* 単体テスト機能（Model,Controller）
* 統合テスト機能（Request spec）
* ブラウザテスト機能（System spec）
 
## 開発環境
 Windows 10 Home EditionのPCを使用しています。このOSではWindows自身が備える仮想環境（Hyper-V）が利用できないため、Oracle VM VirtualBox
 で仮想マシン(Linux、Ubuntu)を立ち上げてDockerを使用して開発しています。
