# 概要
スクリプトは、対象ディレクトリ内のすべてのファイルをチェックし、拡張子が zip の場合、ファイルを解凍します。
また、解凍後は元のzipファイルを削除します。

## 実行手順
### unzip.conf
1. DOWNLOAD_DIR：解凍したファイルが保存されているディレクトリのパスを指定します。
2. UNZIP_DIR： (dittoを使用)解凍したファイルを保存するディレクトリのパスを指定します。

```
# unzip.conf
# 解凍するディレクトリのパスを指定
DOWNLOAD_DIR="./download"

# 解凍先のディレクトリのパスを指定
UNZIP_DIR="./unzip"
```

### スクリプト実行
```
#(初回のみ)スクリプトに実行権限を付与
chmod +x unzip.sh

#スクリプト実行
./unzip.sh
```

## (例)動作
### スクリプト実行前
```
.
├── download
│   ├── test1
│   │   ├── aaa.zip
│   │   └── bbb
│   ├── test2
│   │   └── 123
│   │       └── ccc.zip
│   ├── test3.zip
│   ├── test4
│   └── test5.zip
├── unzip.conf
└── unzip.sh
```

### スクリプト実行後
```
% ./unzip.sh 
無視されたファイル: /Users/chinone/chinone9/unzip/download/test1/bbb
無視されたファイル: /Users/chinone/chinone9/unzip/download/test4
ファイルの解凍が完了しました。
```
```
.
├── download
│   ├── test1
│   │   └── bbb
│   ├── test2
│   │   └── 123
│   └── test4
├── unzip
│   ├── test1
│   │   └── aaa
│   ├── test2
│   │   └── 123
│   │       └── ccc
│   ├── test3
│   └── test5
│       └── ddd
├── unzip.conf
└── unzip.sh
```
