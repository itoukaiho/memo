require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

# if文を使用して続きを作成していきましょう。
# 「memo_typeの値（1 or 2）によって処理を分岐させていきましょう。



until memo_type == 1 or memo_type == 2
    puts "1か2を入力してください。"
    puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"
    memo_type = gets.to_i
end

if memo_type == 1
    
    puts "新規でメモを作成します。拡張子を除いたファイル名を入力してください。"
    file_name = gets.chomp
    puts "メモの内容を記入してください。"
    puts "完了したらCtrl + Dをおします。"
    input_memo= STDIN.gets.chomp
    CSV.open("#{file_name}.csv","w")do|csv|
    csv << ["#{input_memo}"]
    
    end

elsif memo_type == 2
    
    puts"既存のメモを編集します。拡張子を除いた既存ファイル名を入力してください。"
    file_name = gets.chomp
    begin
    puts CSV.read("#{file_name}.csv")
    rescue
    puts "存在しないファイルです。"
    else
    puts "編集内容を記入してください。"
    puts "完了したらCtrl + Dをおします。"
    input_memo = STDIN.read.chomp
    CSV.open("#{file_name}.csv","w")do|csv|
    csv << ["#{input_memo}"]
    end
    end
    end
