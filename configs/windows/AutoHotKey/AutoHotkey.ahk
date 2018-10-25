﻿#NoTrayIcon ;タスクトレイのアイコンを非表示にする
#NoEnv ;変数名を解釈するとき、環境変数を無視する
#SingleInstance force ;複数起動禁止（既存プロセスを再起動する）
SetTitleMatchMode, 2 ; 文字列（中間一致）ウィンドウにマッチ

SendMode Input ;入力した操作の再生速度が速くなるモード。
SetWorkingDir %A_ScriptDir% ;スクリプトの作業ディレクトリ（相対パスを使うとき便利）

;==============================================================================================

;単一キーの置き換え	============================================================================
sc029::Send,{Esc}				;半角／全角キー = Escキー
sc03a::LCtrl 						;英数キー = Ctrl
	sc03a up::Send,{LCtrl up} 						;英数キー = Ctrl
	; Capslock::Ctrl
sc070::Send,{sc029}		;カタカナ／ひらがなキー = 半角／全角キー
!h::Send,{Left}	;Alt+ h = 「←」
	!+h::Send,+{Left}	;Alt+Shift+ h = 「Shift+←」
!l::Send,{Right}	;Alt+ l = 「→」
	!+l::Send,+{Right}	;Alt+Shift+ l = 「Shift+→」
!k::Send,{Up}				;Alt+ k = 「↑」
	!+k::Send,+{Up}				;Alt+Shift+ k = 「Shift+↑」
	<!>!k::Send,!{Up}     ;LAlt+RAlt+ k = 一回層上に戻る
!j::Send,{Down}	;Alt+ j = 「↓」
	!+j::Send,+{Down}	;Alt+Shift+j = 「Shift+↓」
	<!>!j::Send,!{Down}     ;LAlt+RAlt+ j = 「Alt+↓」

;マウス操作
vk1d::LButton											;無変換キー = 左クリック
	vk1d up::Send, {LButton up}
	^vk1d::Send,^{LButton}											;Ctrl+無変換キー = Ctrl+左クリック
^AppsKey::Send,{RButton down}									;Ctrl+Appskey = 右クリック
	^AppsKey up::Send,{RButton up}
	+AppsKey::																	;shift+Appskey = 要素の検証
		Send,{RButton down}
		Send,{RButton up}
		Sleep 100
		Send,ii
	return
;ファンクションキー	============================================================================
!1::Send,{F1}   ;Alt+1 F1キー
!2::Send,{F2}   ;Alt+2 F2キー
!3::Send,{F3}   ;Alt+3 F3キー
!4::Send,{F4}   ;Alt+4 F4キー
!5::Send,{F5}   ;Alt+5 F5キー
	!^5::Send,^{F5}   ;Alt+Ctrl+5 Ctrl+F5キー、キャッシュを削除してページ更新
!6::Send,{F6}   ;Alt+6 F6キー
!7::Send,{F7}   ;Alt+7 F7キー
!8::Send,{F8}   ;Alt+8 F8キー
!9::Send,{F9}   ;Alt+9 F9キー
; !0::Send,{F10}   ;Alt+0 F10キー
; !-::Send,{F11}   ;Alt+- F11キー
!0::Send,{F12}   ;Alt+^ F12キー

;組み合わせ	============================================================================
#q::Send,!{F4}  ;Windows+Q アプリケーションの終了

!x::Send,{Delete}     ;Alt+X Deleteキー
!+x::Send,{BackSpace}     ;Alt+Shift+X BackSpaceキー

![::Send,!{Left}     ;Alt+[ 前に戻る
	!+[::Send,^+{Left}     ;Alt+Shift+[ 前方の単語選択

!]::Send,!{Right}     ;Alt+] 先に進む
	!+]::Send,^+{Right}     ;Alt+Shift+] 後方の単語選択


;全選択系処理	============================================================================
$^d::												;Ctrl+A+D 全選択削除
	If GetKeyState("a", "P")
	{
		Send,^a
		Send,{Delete}
	}
	Else
	{
		Send,^d
	}
return

$^c::												;Ctrl+A+C 全選択コピー
	If GetKeyState("a", "P")
	{
		Send,^a
		Send,^c
	}
	Else
	{
		Send,^c
	}
return

$^v::												;Ctrl+A+V 全選択貼り付け
	If GetKeyState("a", "P")
	{
		Send,^a
		Send,^v
	}
	Else {
		Send,^v
	}
return

$^x::												;Ctrl+A+X 全選択切り取り
	If GetKeyState("a", "P")
	{
		Send,^a
		Send,^x
	}
	Else
	{
		Send,^x
	}
return

; vim風コマンド	============================================================================
!^::Send,{Home}     ;Alt + ^ = Homeキー
	^!^::Send,^{Home}     ;Ctrl+Alt+^ ドキュメントの最初に戻る
	!+^::Send,+{Home}     ;Alt+Shift+^ 行選択
	!^+^::Send,^+{Home}     ;Ctrl+Shift+Alt+^ 最初まで全選択

!\::Send,{End}     ;Alt+$ Endキー
	^!\::Send,^{End}     ;Ctrl+Alt+\ ドキュメントの最後に進む
	!+\::Send,+{End}     ;Alt+Shift+\ 行選択
	^+!\::Send,^{End}     ;Ctrl+Shift+Alt+\ 最後まで全選択


;ホットストリング	============================================================================
;https://qiita.com/sta/items/f92321e6d30f677008ff

#Hotstring *	;m@@でメールアドレスを入力
#Hotstring O
::m@@::kento.esashika@g.smartvalue.ad.jp

#Hotstring *	;zhで 「←」を入力
#Hotstring O
::zh::←

#Hotstring *	;zjで 「↓」を入力
#Hotstring O
::zj::↓

#Hotstring *	;zjで 「↑」を入力
#Hotstring O
::zk::↑

#Hotstring *	;zlで 「→」を入力
#Hotstring O
::zl::→

#Hotstring *	;y/dで現在年月日を入力
#Hotstring O
::y/d::
	FormatTime, now,, yyyy/MM/dd ;HH:mm:ss
	Send,%now%
return

#Hotstring *	;m/dで現在日付を入力
#Hotstring O
::m/d::
	FormatTime, now,, M/d
	Send,%now%
return

#Hotstring *	;(d)で現在曜日を入力
#Hotstring O
::(d)::
	FormatTime, now,, ddd
	Send,(%now%)
return

#Hotstring *	;(d)で現在時刻を入力
#Hotstring O
::h:m::
	FormatTime, now,, HH:mm
	Send,%now%
return

#Hotstring *	;m(dで現在日付と曜日を入力
#Hotstring O
::m(d::
	FormatTime, now,, M/d(ddd)
	Send,%now%
return

#Hotstring *	;h:mで現在時刻を入力
#Hotstring O
::h:m::
	FormatTime, now,, Time
	Send,%now%
return

#Hotstring *	;t(dで翌日日付と曜日を入力
#Hotstring O
::t(d::
	tomorrow := a_now
	tomorrow += 1, days
	FormatTime, tomorrow, %tomorrow%, M/d(ddd)
	Send,%tomorrow%
return

#Hotstring *	;p(dで昨日日付と曜日を入力
#Hotstring O
::p(d::
	yesterday := a_now
	yesterday += -1, days
	FormatTime, yesterday, %yesterday%, M/d(ddd)
	Send,%yesterday%
return