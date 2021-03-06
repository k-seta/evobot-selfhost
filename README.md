# Evobot Selfhost on GCP
## Description
GCP の無料枠内での [Evobot](https://github.com/eritislami/evobot) のセルフホスティングを Terraform + GitHub Actions で実現します。

## Preparation
1. このリポジトリを `fork` します。
2. Google Cloud のアカウントを作成します。
3. Service Account (Role: Editor) を作成し、 取得した `credentials.json` に記載された json を GitHub の `Settings > Secrets` に `GOOGLE_CREDENTIALS` として登録します。
4. Discord Developer Portal で AutoMuteUs をセルフホスティングするための Bot を作成し、Bot の Token を GitHub の `Settings > Secrets` に `TF_VAR_DISCORD_BOT_TOKEN` として登録します。
5. Youtube Data API の API Key を GitHub の `Settings > Secrets` に `TF_VAR_YOUTUBE_API_KEY` として登録します。
6. `tfstate` 保存用に、下記の要件を満たす無料枠の GCS を手動で作成します。
```
location type: Region
location: us-east1
default storage class: Standard
versioning: enabled
life cycle: delete, num_newer_versions = 5
```
6. [main.tf の project id](https://github.com/k-seta/automuteus-selfhost-gcp/blob/master/main.tf#L2) を自分のプロジェクトの値に変えて commit & push します。
7. [main.tf の backend bucket の名前](https://github.com/k-seta/automuteus-selfhost-gcp/blob/master/main.tf#L9)を 5. で作った値に変えて commit & push します。
8. おめでとうございます。

## Usage
1. GitHub の `Actions > terraform ci > Run workflow` を順次クリックします。
2. `terraform command` に `plan` を入力して `Run workflow` を実行すると GCP に作成するリソースを確認できます。
3. `terraform command` に `apply` を入力して `Run workflow` を実行すると GCP に AutoMuteUs のためのリソースを作成します。
4. `terraform command` に `destroy` を入力して `Run workflow` を実行すると GCP に作成したリソースを削除します。
