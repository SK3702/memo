require "csv"
puts "1 → 新規でメモを作成する / 2 → 既存にメモを編集する"
memo_type = gets.to_i


if memo_type === 1
  #新しいファイル作成
  puts "新規メモを作成します。"
  puts "拡張子をの除いたファイル名を入力してください"
  file_name = gets.chomp

  puts "メモしたい内容を記入してください。"
  puts "完了したらCtrl+dを押します。"

  memo = STDIN.read
  input_memo = memo.chomp
  
  CSV.open("#{file_name}.csv", "w") do |csv|
    csv.puts ["#{input_memo}"]
  end


elsif memo_type === 2
  #既存のファイルを編集
  puts "既存のファイルを編集します。"
  puts "拡張子をの除いたファイル名を入力してください。"
  file_name = gets.chomp

  puts "追記したい内容を記入してください。"
  puts "完了したらCtrl+dを押します。"

  #既存のファイルの読み込みと表示
  exiting_content = CSV.read("#{file_name}.csv")
  puts exiting_content

  memo = STDIN.read
  input_memo = memo.chomp
  
  CSV.open("#{file_name}.csv", "a") do |csv|
    csv.puts ["#{input_memo}"]
  end


else
  puts "1か2を入力してください。"
end






