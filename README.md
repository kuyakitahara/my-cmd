# darts-out
![test](https://github.com/kuyakitahara/my-cmd/actions/workflows/test.yml/badge.svg)

標準入力から受け取ったダーツ（01ゲーム）の残り点数に対し、3本以内でフィニッシュするための最短アレンジ（上がり目）を計算して標準出力に返すコマンドです。

## インストール方法
```bash
$ git clone [https://github.com/kuyakitahara/my-cmd.git](https://github.com/kuyakitahara/my-cmd.git)
$cd my-cmd$ chmod +x darts-out
```

## 使い方
標準入力から1行につき1つの正の整数（残り点数）を入力します。

```bash
$ echo 170 | ./darts-out
T20 T20 BULL
```

複数行をまとめてパイプで渡すこともできます。3本以内で上がれない点数の場合は `NO OUT` を出力します。

```bash
$ printf "100\n40\n169\n" | ./darts-out
T20 D20
D20
NO OUT
```

### オプション
| オプション | 説明 |
| :--- | :--- |
| `-d`, `--double` | ダブルアウト（デフォルト）。ダブルまたはBULLでフィニッシュ |
| `-m`, `--master` | マスターアウト。ダブル、トリプル、またはBULLでフィニッシュ |
| `-s`, `--straight` | ストレートアウト。すべてのエリアでフィニッシュ可能 |
| `-h`, `--help` | ヘルプを表示 |

使用例:
```bash
$ echo 180 | ./darts-out -m
T20 T20 T20
$ echo 20 | ./darts-out -s
S20
```

### エラー時の挙動
正の整数以外の入力や空入力が渡された場合、標準エラー出力にエラーメッセージを表示し、終了ステータス `1` で終了します。

## テストの実行方法
```bash
$ ./test.bash
```

## 必要なソフトウェア
- Python
  - テスト済みバージョン: 3.10〜3.14

## テスト環境
- Ubuntu 24.04 LTS

## ライセンス
- このソフトウェアパッケージは、3条項BSDライセンスの下、再頒布および使用が許可されます。
- © 2026 Kuya Kitahara
