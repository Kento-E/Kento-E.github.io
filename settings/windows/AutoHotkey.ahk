#NoTrayIcon ;タスクトレイのアイコンを非表示にする
#NoEnv ;変数名を解釈するとき、環境変数を無視する
#SingleInstance force ;複数起動禁止（既存プロセスを再起動する）
SetTitleMatchMode, 2 ; 文字列（中間一致）ウィンドウにマッチ

SendMode Input ;入力した操作の再生速度が速くなるモード。
SetWorkingDir %A_ScriptDir% ;スクリプトの作業ディレクトリ（相対パスを使うとき便利）

;単一キーの置き換え
sc029::Send,{Esc}				;半角／全角キー = Escキー
vk1C::Send,{sc029}			;変換キー = 半角／全角キー
sc070::Send,{AppsKey}		;カタカナ／ひらがなキー = アプリケーションキー
AppsKey::Send,{RButton}	;Appskey = 右クリック

vk1C & Space::Send,{Blind}{Enter} 	;変換+スペース = エンターキーの動作をさせる

!h::Send,{Left}	;Alt+ h = 「←」
	!+h::Send,+{Left}	;Alt+Shift+ h = 「Shift+←」
!l::Send,{Right}	;Alt+ l = 「→」
	!+l::Send,+{Right}	;Alt+Shift+ l = 「Shift+→」
!k::Send,{Up}				;Alt+ k = 「↑」
	!+k::Send,+{Up}				;Alt+Shift+ k = 「Shift+↑」
	<!>!k::Send,!{Up}     ;LAlt+RAlt+ k = 一回層上に戻る
!j::Send,{Down}	;Alt+ j = 「↓」
	!+j::Send,+{Down}	;Alt+Shift+j = 「Shift+↓」

;ファンクションキー
!1::Send,{F1}   ;Alt+1 F1キー
!2::Send,{F2}   ;Alt+2 F2キー
!3::Send,{F3}   ;Alt+3 F3キー
!4::Send,{F4}   ;Alt+4 F4キー
!5::Send,{F5}   ;Alt+5 F5キー
	^5::Send,^{F5}   ;Ctrl+5 Ctrl+F5キー、キャッシュを削除してページ更新
!6::Send,{F6}   ;Alt+6 F6キー
!7::Send,{F7}   ;Alt+7 F7キー
!8::Send,{F8}   ;Alt+8 F8キー
!9::Send,{F9}   ;Alt+9 F9キー
!0::Send,{F10}   ;Alt+0 F10キー
!-::Send,{F11}   ;Alt+- F11キー
!^::Send,{F12}   ;Alt+^ F12キー

;組み合わせ
!q::Send,!{F4}  ;Alt+Q アプリケーションの終了

!b::Send,{BackSpace}     ;Alt+B BackSpaceキー

!d::Send,{Delete}     ;Alt+D Deleteキー
	!+d::           ;Alt+Shift+D 全選択削除
	Send,^a
	Send,{Delete}
	return

![::Send,!{Left}     ;Alt+[ 前に戻る
	!+[::Send,^+{Left}     ;Alt+Shift+[ 前方の単語選択

!]::Send,!{Right}     ;Alt+] 先に進む
	!+]::Send,^+{Right}     ;Alt+Shift+] 後方の単語選択

LWin & H::Send,{Home}     ;Win+H Homeキー
	; ^LWin & H::Send,^{Home}     ;Win+Ctrl+H ドキュメントの最初に戻る
	; 	LWin & ^+H::Send,^+{Home}     ;Ctrl+Shift+Alt+H 最初まで全選択

!e::Send,{End}     ;Alt+E Endキー
	^!e::Send,^{End}     ;Ctrl+Alt+E ドキュメントの最後に進む
	!+e::Send,+{End}     ;Alt+E 行選択
	^+!e::Send,^{End}     ;Ctrl+Shift+Alt+E 最後まで全選択

;複数処理
!+c::           ;Alt+Shift+C 全選択コピー
Send,^a
Send,^c
return
!+v::           ;Alt+Shift+V 全選択貼り付け
Send,^a
Send,^v
return
!+x::           ;Alt+Shift+x 全選択切り取り
Send,^a
Send,^x
return