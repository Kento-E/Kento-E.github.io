#NoTrayIcon ;タスクトレイのアイコンを非表示にする
#NoEnv ;変数名を解釈するとき、環境変数を無視する
#SingleInstance force ;複数起動禁止（既存プロセスを再起動する）
SetTitleMatchMode, 2 ; 文字列（中間一致）ウィンドウにマッチ

SendMode Input ;入力した操作の再生速度が速くなるモード。
SetWorkingDir %A_ScriptDir% ;スクリプトの作業ディレクトリ（相対パスを使うとき便利）

!r::Send,{F2}   ;Alt+R 名前の変更
!q::Send,!{F4}  ;Alt+Q アプリケーションの終了
!^::Send,!{Up}     ;Alt+^ 一回層上に戻る
![::Send,!{Left}     ;Alt+[ 前に戻る
!]::Send,!{Right}     ;Alt+] 先に進む