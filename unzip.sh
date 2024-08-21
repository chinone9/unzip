# 設定ファイルを読み込む
source ./unzip.conf

# 解凍先ディレクトリが存在しない場合は作成
mkdir -p "$UNZIP_DIR"

# ダウンロードしたディレクトリ内のすべての zip ファイルを再帰的に処理
find "$DOWNLOAD_DIR" -type f -name "*.zip" | while read -r file; do
    # ファイル名を取得（拡張子なし）
    file_name=$(basename "$file" .zip)
    
    # 親ディレクトリを取得
    parent_dir=$(dirname "${file#"$DOWNLOAD_DIR/"}")
    
    # 解凍先のディレクトリ名を決定
    output_dir="$UNZIP_DIR/$parent_dir"
    
    # 解凍先のディレクトリを作成
    mkdir -p "$output_dir"
    
    # ファイルを解凍 (dittoを使用)
    ditto -x -k "$file" "$output_dir"

    # 元の圧縮ファイルを削除
    rm "$file"
done

# ダウンロードしたディレクトリ内で無視されたファイルを表示
find "$DOWNLOAD_DIR" -type f ! -name "*.zip" | while read -r ignored_file; do
    echo "無視されたファイル: $(realpath "$ignored_file")"
done

echo "ファイルの解凍が完了しました。"
