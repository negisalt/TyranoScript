;ティラノスクリプトサンプルゲーム

*start

[cm  ]
[clearfix]
[start_keyconfig]


[bg storage="room.jpg" time="100"]

;メニューボタンの表示
@showmenubutton

;メッセージウィンドウの設定
[position layer="message0" left=160 top=500 width=1000 height=200 page=fore visible=true]

;文字が表示される領域を調整
[position layer=message0 page=fore margint="45" marginl="50" marginr="70" marginb="60"]


;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=30 bold=true x=180 y=510]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;sheri
[chara_new name="sheri" storage="chara/sheri/normal.png" jname="橘シェリー" ]
[chara_face name="sheri" face="niko" storage="chara/sheri/niko.png"]

;sheri2
[chara_new name="sheri2" storage="chara/sheri/normal.png" jname="橘シェリー2" ]
[chara_face name="sheri2" face="niko" storage="chara/sheri/niko.png"]

;hannna
[chara_new name="hannna" storage="chara/hannna/normal.png" jname="遠野ハンナ" ]

#
某日……[p]

[chara_show name="sheri"]

#橘シェリー
こんばんは〜橘シェリーですっ！[p]

[chara_mod name="sheri" face="niko"]
今日のまのさば、すっごく楽しかったですね〜[p]

みんなのおかげで[font color="red"]【第3話】[resetfont]まで見終わることができちゃいました！[p]

[chara_mod name="sheri" face="default"]
いや〜、色んな[font color="red"]【ネタバレ】[resetfont]を見ててある程度は知ってると思ってたんですけど、[l]知らないコトが多くて、たくさん驚かされちゃいました！[p]

[chara_mod name="sheri" face="niko"]
もう続きが気になって仕方ありません〜！[p]

[chara_mod name="sheri" face="default"]
次に遊ぶとしたら大学に来れる[font color="red"]【閉庁期間後】[resetfont]になっちゃうかもしれませんねぇ？[p]

それまでは、新しい[font color="red"]【ネタバレ】[resetfont]を踏まないように気をつけなきゃ行けませんね！[p]

[chara_mod name="sheri" face="niko"]
その時にはハンナさんや[font color="red"]【友だち】[resetfont]皆んなも呼んで一緒に遊びましょう！[p]

[chara_mod name="sheri" face="default"]
それでは、来てくれた方ありがとうございました〜！[p]

[chara_show name="hannna"]
#遠野ハンナ
[font size="22"]
あなた今、私のこと呼びましたかしら？[p]
ってあなた大きすぎですわ～～～！？！？[p]
[resetfont]

#橘シェリー
いや～、これにはちょっと事情がありまして～[p]

#遠野ハンナ
[chara_move name=hannna time=1 left=200 top=260 width=350]
[font size="19"]
事情……って何があるんですの？[p]
[resetfont]
[wa]

#橘シェリー
実はタブレットで立ち絵を描いてみたんですけど、[l]
立ち絵のファイルサイズを見てなくてですね～[p]
何となく描いたら上にはみ出してしまいました～てへっ[p]

#遠野ハンナ
[chara_move name=hannna time=1 left=300 top=400 width=220]
[wa]
[font size="16"]
にしても大きすぎですわ！！[r][p]
……っていうか、さっきから私が小さくなってますわ！！[p]
[font size="14"]
このままでは[ruby text=わたくし]私の存在が消えてしまいますわ～～！[p]
[resetfont]

#橘シェリー
あれ～？[l]
ハンナさんどこいっちゃいました～？[p]

#遠野ハンナ
[chara_move name=hannna time=1 left=350 top=540 width=100]
[wa]
[font size="12"]
シェリーさん！ここですわ！！私はここにいますわ！！[p]
[resetfont]

#橘シェリー
ハンナさ～ん？[l]どこ行きました～？[p]
[chara_move name=sheri time=1000 left=100 top=-50]
[chara_move name=sheri time=1000 left=800]
[chara_move name=sheri time=1000 left=540]
[wa]
見つかりませんね～[p]

#遠野ハンナ
[chara_move name=hannna time=1 left=400 top=540 width=70]
[wa]
[font size="12"]
ぴゃっ！？[r][p]
シェリーさんが動き回っていると踏みつぶされてしまいそうですわ～！[r][p]
どうか止まってくださいまし～～！[p]
[resetfont]

#橘シェリー
[chara_move name=sheri time=1000 left=-100]
どこ行っちゃいました～？[l]
[chara_move name=sheri time=1000 left=900]
隠れるのが上手ですね～[p]
[wa]

#遠野ハンナ
[font size="12"]
ほんっとうに危ないですわ！？[r][p]
[chara_move name=sheri time=1000 left=750]
[wa]
このままではペチャンコになってしまいますわ～～[p]
あ！そうですわ！！[r][p]
[font color="red"]【浮遊】[font color="white"]の魔法で空中に逃げますわ！！[p]
[chara_move name=hannna time=2000 top=200]
[wa]
[resetfont]

#橘シェリー
あっ！！[l]
[chara_move name=sheri time=1000 left=480]
[wa]
こんなところにハエがいますね～[r][p]
シェリーちゃんパワーで叩きつぶしちゃいましょう！[p]

#遠野ハンナ
[font size="12"]
ちょっ、ちょっとお待ちくださいましーーー！？[p]
[resetfont]

#橘シェリー
いきますよ～[r]せ～のっ[p]

#遠野ハンナ
[font size="12"]
あっ[p]
[resetfont]

[quake time=300 vmax=0 hmax=10 count=4]

#
[chara_hide_all]
@layopt layer=message0 visible=false
[wa]

[bg time="3000" method"crossfade" storage="badend.jpg"]


[s]