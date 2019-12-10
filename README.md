# tcpSocketを使ったヘルスチェック用サンプルスクリプト

[Kubernetes2 Advent Calendar 2019](https://qiita.com/advent-calendar/2019/kubernetes2) 11日目の記事のスクリプトとデプロイ用マニフェストです。

- sockserv.pl: スクリプト本体
- Dockerfile: Dockerイメージビルド用
- pod.yml: K8sへpod単体をデプロイするマニフェスト
- deployment-app.yml: K8sへDeploymentとServiceを作成するマニフェスト

本編: [tcpSocket設定で覚えるKubernetesとOpenShiftのヘルスチェック機能 (ソケットサーバーPodをビルド&デプロイ) - Qiita](https://qiita.com/zaki-lknr/items/768d77363c3b566c4c19)
