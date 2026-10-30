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
;
;メッセージウィンドウの表示
@layopt layer=message0 visible=true

;キャラクターの名前が表示される文字領域
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=180 y=510]

;上記で定義した領域がキャラクターの名前表示であることを宣言（これがないと#の部分でエラーになります）
[chara_config ptext="chara_name_area"]

;このゲームで登場するキャラクターを宣言
;akane
[chara_new  name="akane" storage="chara/akane/normal.png" jname="あかね"  ]
;キャラクターの表情登録
[chara_face name="akane" face="angry" storage="chara/akane/angry.png"]
[chara_face name="akane" face="doki" storage="chara/akane/doki.png"]
[chara_face name="akane" face="happy" storage="chara/akane/happy.png"]
[chara_face name="akane" face="sad" storage="chara/akane/sad.png"]

;hiroin_　すてあ
[chara_new name="sutea" storage="chara/sutea/normal.png" jname="すてあ"]
[chara_face name="sutea" face="angry" storage="chara/sutea/angry.png"]
[chara_face name="sutea" face="fukigen" storage="chara/sutea/fukigen.png"]
[chara_face name="sutea" face="niko" storage="chara/sutea/niko.png"]
[chara_face name="sutea" face="odoroki" storage="chara/sutea/odoroki.png"]
[chara_face name="sutea" face="question" storage="chara/sutea/question.png"]
[chara_face name="sutea" face="sad" storage="chara/sutea/sad.png"]
[chara_face name="sutea" face="yobi" storage="chara/sutea/yobi.png"]
[chara_face name="sutea" face="still_1_1" storage="chara/sutea/still_1_1.png"]
[chara_face name="sutea" face="still_1_2" storage="chara/sutea/still_1_2.png"]

;sub_　みやの
[chara_new name="miyano" storage="chara/miyano/normal.png" jname="みやの"]
[chara_face name="miyano" face="angry" storage="chara/miyano/angry.png"]
[chara_face name="miyano" face="mu" storage="chara/miyano/mu.png"]
[chara_face name="miyano" face="yobi" storage="chara/miyano/yobi.png"]
[chara_face name="miyano" face="still_1" storage="chara/miyano/still_1.png"]

;教室
[label name="s1-classroom"]
;[button text="s2-図書館" target="s2-library"]
;[skipstart]

#
俺はore。ごく普通の男子高校生だ。[p]
成績も普通。スポーツも普通。他の人と比べて特に目立つようなところはない。[r][p]
ある一点を除いて……。[r]それは……。[p]

#？？？
お～い？[r]oreく～ん？[p]

#
ん？[p]

;廊下に向く
[mask time="100"]
[bg time="100" storage="kaimaku/back.png"]
[layopt layer="1" visible="true"]
[image name="waku" storage="still/waku.png" layer="1" x=0 y=-100]
[chara_show name="miyano" wait=false]
[chara_mod name="miyano" face="still_1" wait=false]
[chara_show name="sutea" wait=false]
[chara_mod name="sutea" face="still_1_1" wait=false]
[chara_move name="miyano" left=0 top=0 wait=false]
[chara_move name="sutea" left=0 top=600]

[mask_off time="400"]
#？？？
どうも～[r]
元気～？[p]

#
やあ、みやのちゃん。俺は元気だよ。[r][p]
あれ？今日はすてあは学校に来てないの？[p]

#みやの
あ～それがね～。[p]

;すてあが下から勢いよく登場
[anim name="sutea" time=200 top=-40]
#すてあ
[font size="60"]わっ！！！！[p][resetfont]

#
おわ！？！？！？！？

[quake time=300 vmax=0 hmax=10 count=4]

[p]

#すてあ
[chara_mod name="sutea" face="still_1_2"]
えへへ～[r][p]
びっくりした～？[p]

#
そりゃいきなり現れたらびっくりするよ……。[p]
[anim name="miyano" left=-300]
#みやの
ごめんねー。すてあちゃんに頼まれてore君を驚かす手伝いをしてほしいって言われてさ～[p]

#すてあ
[chara_mod name="sutea" face="still_1_1"]
え～みやのちゃんもノリノリだったじゃ～ん。[p]

#
くっそ……[p]
(ご覧の通り俺は超絶のビビりなのである。)[r][p]
(しかも、幼馴染のすてあは俺がビビりなことをからかって毎日驚かしに来るのである。)[p]
(おかげで驚かされる度にクラスメイトから注目されてしまう……。)[p]

#
いつも驚かせに来るけど、そろそろやめてくれない……？[r][p]

#すてあ
えー？やめてって言われても、oreの反応が面白いもーん。[p]
絶対やめな～い。[p]

#みやの
あはは……。[r]それじゃあ私は委員会の仕事があるからまた明日ね。[p]

#すてあ
バイバイ、みやのちゃん！[p]

#
バイバイ。[p]

;スチル終了
[mask time="500"]
[chara_hide name="miyano" wait=false]
[layopt layer="1" visible=false]
[bg time="100" storage="rouka.jpg"]
[chara_mod name="sutea" face="default"]
[chara_move name="sutea" left=0 top=100]
[mask_off time="1000"]
#すてあ
#sutea:default
ore君はこの後どうする？[r]このまま部室に来る？[p]

#
いや、図書館に本を返しに行ってから部活に行こうかな。[p]

#すてあ
そう？じゃあ私も付いていこうかな。[p]

#
じゃあ図書館に行くか。[p]

;[skipstop]

;----scene1終了-----
;図書館へシーン遷移
[label name="s2-library"]
;みんちりえ（ https://min-chi.material.jp/ ）
[bg time="2000" storage="library.jpg"]

#sutea:niko
;#すてあ
そういえば何の本を借りてたの？[p]

#
気になった小説とかかな。[p]
付いてきたのはいいけど、図書館だから流石に静かにしろよ。[p]

#sutea:fukigen
#すてあ
そんぐらい分かってるよぅ～[l][r]
5分で戻ってきてー。[p]

#
すぐ終わらせるから待ってろ。[p]

#すてあ
はーい。[p]

#
(絶対驚かしに来るんだろうな……)[p]
[chara_hide name="sutea"]

;図書館内に移動

#
借りてた本を返す前に次に借りる本を探すか。[p]
どの本を借りようかな……[l][r][r]

;本を選ぶイベント発生 今週のおすすめの本のコーナーにて
;話題の人気小説1,2(どっちかがみやののおすすめ)・推理系・エッセイ・難しそうな本・謎の本
;時間制限ですてあが驚かしに来るイベントを作ろうかな

[glink  color="white"  storage="scene1.ks"  size="28"  x="360"  width="500"  y="150"  text="新着のエッセイ"  target="*select1"]
[glink  color="white"  storage="scene1.ks"  size="28"  x="360"  width="500"  y="250"  text="話題の人気小説"  target="*select2"]
[glink  color="white"  storage="scene1.ks"  size="28"  x="360"  width="500"  y="350"  text="気になる推理小説"  target="*select3"]
[glink  color="white"  storage="scene1.ks"  size="28"  x="360"  width="500"  y="450"  text="哲学の学術本"  target="*select4"]
;[link target=*select1]新着のエッセイ[endlink][r]
;[link target=*select2]話題の人気小説[endlink][r]
;[link target=*select3]気になる推理小説[endlink][r]
;[link target=*select4]哲学の学術本[endlink][r]
[s]

*select1
[cm]
[eval exp="sf.book = 1"]
新着のエッセイを選んだ[l]
@jump target=*common

*select2
[cm]
[eval exp="sf.book = 2"]
話題の人気小説を選んだ[l]
@jump target=*common

*select3
[cm]
[eval exp="sf.book = 3"]
気になる推理小説を選んだ[l]
@jump target=*common

*select4
[cm]
[eval exp="sf.book = 4"]
哲学の学術本を選んだ[l]
@jump target=*common

*common
[cm]

;選択後
この本にするか。[p]

;受付前に移動
[chara_show name="miyano"]
#みやの
あっore君。今日も本を借りに来たの？[p]

#
そうだよ。先に前に借りた本を返してからだけどね。[p]

#みやの
じゃあ返却ってことだねー。[r][l]
こ・れ・で・よし。[l] 
返却できたよー。[p]
;テキストスピードを落とす

#
ありがとう。[r]
じゃあこれが借りる本ね[p]


;新着のエッセイ
[if exp="sf.book==1"]
#みやの
さんきゅー。[l]
あっこの本って新着コーナーにあったやつ？[p]

#
そう。ちょっと前にニュースになってたから見たくなっちゃったんだ。[p]

#みやの
へー。私も気になるから今度感想聞かせてねー。[p]

#
わかった。部活行ってるね。[p]

#みやの
バイバーイ。また明日ー。[p]
@jump target=*borrowed-book

[endif]

;話題の人気小説
[if exp="sf.book==2"]
#みやの
さんきゅー。[l]
おっこの本ってクラスで話題になってた本じゃん。[p]

#
そうそう。たまたま見つけたから読んでみたくなって。[p]

#みやの
あのね。今その本かなり人気で[r]
返されたらその日に借りられちゃんだよ？[p]

#
えっ？じゃあめっちゃラッキーじゃん！[p]

#みやの
そう。まだ借りようとしてる人はけっこう居ると思うから[r]
なる早で返してね。[p]

#
そ、そうするよ……。[p]
じゃあ部活に行くよ。バイバイ。[p]

#みやの
じゃあねー。[p]
@jump target=*borrowed-book

[endif]

;気になる推理小説
[if exp="sf.book==3"]
#みやの
さんきゅー。[l]
ってこれ私のおすすめの本じゃん！[p]

#
えっこの本ってみやのちゃんがおすすめしてた本だったの？[p]

#みやの
そーだよ。[r]
君もこの本のこと気になったの？[p]

#
うん、そう。この作者さんの推理小説が好きで何回も読み直したりもしてるんだ。[p]

#みやの
えっ！そうなの？私もだよ！[p]
私と君ってけっこう趣味合うんだねー。[p]
かなりいい本だから、返すときに感想聞かせてね。[p]

#
分かったよ。じゃあ部活行ってくる。[p]

#みやの
部活がんばってねー。[p]
@jump target=*borrowed-book

[endif]

;哲学の学術本
[if exp="sf.book==4"]
#みやの
oreくんってこんな難しそうな本も読むんだね……。[l][r]
初めて知ったかも。[p]

#
たまにはこういう本も読んでみよっかなって。[p]

#みやの
勉強熱心だねー。部活もがんばってねー。[p]

#
じゃあまた明日ね。[p]
@jump target=*borrowed-book

*borrowed-book
[chara_hide name="miyano"]

;廊下
[bg time="2000" storage="rouka.jpg"]
[chara_show name="sutea"]
#sutea:fukigen
ちょっとー遅いよー[r][l]
ケッコー待ってたんだけど～。[p]

#
ごめん。ちょっと借りる本に迷っちゃって。[p]

#sutea:niko
すぐ部活に行こう！[l][r]
部室まで競争だ！！[p]
[chara_hide name="sutea"]

#
あっ！ちょっとスタートダッシュずるい！[p]

;場面変更
;----シーン２終了----
[label name="s3-club"]

;昇降口
[bg time="1500" storage="gym_back.jpg"]

#
はぁはぁ……。[l][r]
本をカバンにしまってたら完全に置いてかれてしまった……。[p]

;ダッシュをするミニゲームでもいい

#すてあ ;横から登場
[font size="60"]わっ！！！！[p][resetfont]

#
うぇっっっっっ！？！？！？[p]

#すてあ
あはははははっあはははっはっ[r]
やっぱりoreの反応おもしろい～～～。[p]

#
このやろぉ……。[r]
俺をダッシュで置いていったのは驚かすためだったのか……。[p]

;mod_hiroin_niko
#すてあ
ほんとーはそんな気はなかったたんだけど、思いついちゃったんだよね～。[p]

#
こいつ……。[p]

#すてあ
ちなみにレースはまだ終わってないよ～。[p]
;hiorinがダッシュで逃げる

#
あっ！ちょっと待て！！[p]

;弓道場に移動、弓道着に着替えて登場
#すてあ
わたしの勝ち～。[l][r]
ore君、遅かったね～。[p]

#
お前が「驚かす」っていう卑怯な手を使ってくるからだろ……。[p]

;mod_hiroin_fukigen
#sutea:fukigen
途中で物陰から現れただけだし～。[p]

#
それが「驚かす」っていうんだろ……。[r][l]
とにかく今回のレースに関してはノーカンでしょ！[p]

#すてあ
え～～～[r][l]
;mod_hiroin_niko
じゃあ的中率で勝負しようよ！！[p]
わたし、今日の朝練ですっごく調子よかったんだよね～。[p]

#
的中率の勝負なら望むところだ！[r]
卑怯な手は絶対使うなよ？[p]

;mod_hiroin_niko
#すてあ
負けたほうがコンビニでアイスおごるってことで良いよね！[p]
;mod_hiroin_niko
真剣勝負だ！！[r]
絶対負けないからな！！[p]

;----一時暗転----
[mask time=2000]
[mask_off time=2000]

;mod_hiroin_niko
#すてあ
3発！3発も当たったよ！！[r][l]

#
見てたから知ってるよ……。[p]

#すてあ
メチャクチャ上手くいったよ！[r][l]
これで君は全部的中させなきゃ勝てないね～。(ニヤニヤ)[p]

#
これはかなり勝つのが厳しいな……。[p]
全部当ててやるからな！[l]見とけよ！！[p]

#すてあ
やれるもんならやってみてよ～[p]
君が全部的中しているところ見たことないけど～？[p]

#
くそ……。[p]

;シーン転換・ゲームスタート
[call storage="kyudo_minigame.ks"]
;驚かしはなし……かも　皆中しているときの4発目に何かのイベントを作ろうかな

;勝ったとき
#
っしゃあ！！！[p]
見てたか！すてあ！！[p]

;mod_hiroin_sad
#すてあ
そんなぁ……[r]
絶対勝ったと思ってたのに……。[p]

#
それじゃあアイスはお前のおごりな[p]

#すてあ
......。[p]
ぅわ～ん……。[r]
ore君に脅されてるよぉ～……。[p]

#女子弓道部員A
ore君？またすてあちゃんを泣かせてるの？[r][l]
すてあちゃんが可哀そうだよー。[p]

#
ちょっと！？泣かせてはないよ！？[p]
っていうか全部的中したことを褒めてくれてもいいじゃないの！？[p]

;引き分け
#
引き分けかぁ……

;mod_hiroin_fukigen
#ひ
これじゃあ勝負つかないじゃん……。
もう勝ち負け関係なくアイス奢ってよ！

#
はぁ？それは約束が違うだろ！
引き分けならアイスを義務は無いだろ。

#ひ
うーん……。
[chara_mod name="sutea" face="normal"]
じゃあさ、私がアイス奢るからoreのアイス奢って？

#
？
どういうことだよ……？

#ひ
引き分けたってことは、両方が勝って、両方が負けたってことでしょ？
だったらこれでいいんじゃない？

#
なんでそんな無駄なことを……？
自分でアイスを買えばいいだけだろ。

;mod_hiroin_fukigen
#ひ
やだ！奢ってもらうことが大事なの！

#
分かったよ……。
部活終わったらコンビニ行くぞ。

;mod_hiroin_niko
#ひ
はーい♪

#
(なんなんだコイツ……)

;負け
#
ま、負けてしまった……。

;mod_hiroin_niko
#ひ
イェーイ！私の勝ち〜！
ちゃんとアイス奢ってね〜。

#
くそっ……。

#ひ
どんなアイスにするか楽しみだな〜。
高いやつにしちゃおうかな〜。

#
……。
…帰りにそこのコンビニでアイス奢ってやるから、
着替えたら待っとけよ…。

#ひ
！
わーい！oreがアイス奢ってくれるって〜。

#女子部員A
え〜いいな〜。私の分も奢ってよ〜。

#
さすがに一人が限界だ……。勘弁してくれ……。

;----コンビニに移動----
[label name="s4-konbini"]
;勝ち
;mod_hiroin_fukigen
#すてあ
も～勝てると思ってたのに～[p]
くやしいくやしいくやしいくやしい～～～～～[p]

#
残念だったな。ははっ。[p]
約束だぞ。アイスを奢ってもらおう。[p]

#すてあ
も～～～。[r]
oreくんのケチ！！[p]

#
うるさいなぁー。[r][l]
さっさとこのアイスを買ってくれ。[p]

#すてあ
oreくんさあ……。こんなかわいい幼馴染に奢らせるとかありえないんだけど～～。[p]
これは借りだからね～～。[p]

;現金決済

#
勝負だったのになんで借りになるんだよ。[p]
言っとくけど、借りだったとしても返すつもりはないからな[p]

#すてあ
ふーん。まあいいや。[p]
[chara_mod name="sutea" face="normal"]
せっかくだし近くの公園で食べようよ！[p]

#
そうだな。[r]
公園まで行こうか。[p]

;引き分け
;mod_hiroin_question
#ひ
どのアイスにしようかな〜。

#
言っとくけど、あまり高いやつにするなよ。
今月かなり厳しいんだ。

;mod_hiroin_fukigen
#ひ
わかってるよ〜。
oreは決まったー？

#
これにしようかな。
もう決まったのか？

;mod_hiroin_question
#ひ
うーん……。
[chara_mod name="sutea" face="normal"]
じゃあこれ！

#
決まったな。レジ行くぞ。

;現金決済×2
#
(あぶねーあとちょっとしかお金が残ってないし……)

#ひ
;mod_hiroin_question
ん？どうしたの？

#
いや、なんでもない。
アイスは近くの公園で食べようか。

[chara_mod name="sutea" face="normal"]
#ひ
わかった！行こう！

;負け
;mod_hiroin_question
#ひ
うーん、どのアイスにしようかなぁ〜。

#
(頼む、できるだけ安いやつにしてくれ……!)

#ひ
この期間限定のやつが気になるなぁ〜。
誰か奢ってくれる優しい人はいないかな〜。

#
…アイスは決まったか？

;mod_hiroin_odoroki
#ひ
えっ！もしかして奢ってくれるの！？
;mod_hiroin_niko
ありがと〜！

#
元々そう言う約束だっただろ……。
レジに持ってくから渡せ。

;mod_hiroin_niko
#ひ
はい、どーぞ。
oreって優しいんだねー。

#
(何を考えているんだコイツは……)
;現金決済

#
アイスも買えたし近くの公園で食べるぞ。

[chara_mod name="sutea" face="normal"]
#ひ
はーい。

;----公園に移動----
[label name="s5-park"]

#
この辺でアイス食べるか。[p]

[chara_mod name="sutea" face="normal"]
#すてあ
ちょっとトイレに行きたいからアイス持ってて。[p]

#
あっちのベンチで先に食べてるぞー。[p]
（なにか思うところがある）[p]

;ベンチに移動
#
(いつもあいつは何を考えているのか分からないな……)
(モグモグ)
……。
(昨日も急に俺の教室まで驚かしに来たし……)
(その前も登校中にいきなり現れたし……)
(そういや昨日あいつに貸したボールペンを返してもらってないな)
(あとで言っておくか)
……。
あいつ、ちょっと遅くないか？
早くしないとこの手に持ってるアイスが溶けてしまうぞ。
食べないなら俺が(((;ここら辺でいきなり登場

#ひ
だーーーーーれの話をしてたの〜〜〜〜？


;（いろいろ考えている途中）[p]
;テキストが進んでいる途中でhiroinがいきなり飛び出てくる

#
うわああああああ！！！！！[p]

;mod_hiroin_niko
#すてあ
あははははっ。[r]
ore君いつも油断しすぎだよ～。[p]

#
アイス食ってるときに人を驚かせるな！！[p]

[chara_mod name="sutea" face="normal"]
#すてあ
ごめんごめん。ore君が何かに集中しているところを見ると[r]
ついイタズラしたくなっちゃうんだよ～。[p]

#
このっ……。[p]
アイスが服についちゃったじゃねえかよ……。[p]

#すてあ
（……。ピコーン！）[p] ;これはoreに近づくチャンスだと思っている
あっほんとだ！[r]
ごめんね、拭いてあげるね～。[p]

#
（ポケットティッシュを取り出してごしごししようとする。）[p]

#
別にこれくらい自分でやるよ。[p]

;mod_hiroin_angry
#すてあ
ダメ！これはわたしの仕事なの！[r]
oreくんは座って待ってて！[p]
（ごしごし。ごしごし……。）[p]

#
（なんでコイツはこんなに怒ってるんだ……？）[p]
（それにしても近いな……。）[p]

[chara_mod name="sutea" face="normal"]
#すてあ
……。;めっちゃ小さい文字で「スンスン。」と服の匂いを嗅ぐ
よし、これでいいでしょ！[p]

#
まあちょっとシミは残ってるけどな……。[r]
やらないよりマシか……。[p]

#すてあ
はい、わたしのアイス返してー。[p]

#
かなり溶けてると思うぞ。[r][l]
買いなおした方がいいんじゃないか？[p]


#すてあ
別にいーよ。[r]
ほとんどわたしが悪いし。[p]

#
それもそうか。[r][l]
じゃあこのまま食べるか。[p]

;背景変化 エモいスチル
;セミの声など公園っぽい環境音＆BGMに
;この後の驚かしポイントは袋破裂による爆音とか？

#すてあ
やっぱり夏に公園でアイスを食べるのっていいよねー。[p]

#
そうだなー。特別なことをしてる感じがするな。[p]

#ひ
……。
…ore君はさ、今のクラスどう？

#
なんだよいきなり。

#ひ
なんか、聞いてみたくなっちゃって……。

#
そーだなぁ……
普通に楽しいし特に変わりはないぞ。

#ひ
そ、そっかあ、やっぱりそんなに変わらないよね！

#
強いて言うなら、お前が別のクラスになって、
俺の周りが静かになったことくらいだな。
お前、いつも俺の近くに居たもんな。

#ひ
そ、そお？あれぐらいふつうだと思うけど……。[p]

#
そうか？あまりに俺のいつも俺の近くにいるから友達から勘違いされそうだったんだぞ。[p]

#ひ
……勘違いってなんの？[p]

#
べ、別に言わなくても分かるだろ……。[p]

#ひ
言ってくれないと分かんない！[p]

#
言わなきゃダメなのか……？[p]

#ひ
そう！言って！[p]

#
うーーーーーーーーーん……。[p]

#ひ
言って！言って！[p]

;ここで唐突に正面真上からサッカーボール
;暗転
#
ぐはっっっっっっっ！！

#ひ
ore君！？大丈夫！？！？

#少年B
すいません！！蹴ったボールが飛んでいってしまいました！！

#ひ
もぉーー危ないからね！？気をつけてよ！![p]
;
;

#ひ
はいこれ！これ使って！

#
これ使っていいのか……？

#ひ
いいから使って！！

#
分かった……使わせてもらうぞ……。

#ひ
他に使えるものあるかな……。[p]

#
ありがとう……。

#すてあ
あれ？ちょっと待って。[p]
（かばんの中を探し出す。）[p]

#
どうした？忘れ物か？[p]

#すてあ
……。[l]…………。[l]………………。[l]
弁当箱がない……。[p]

#
えっ！？[l][r];衝撃による振動
こんな暑い日に学校に置きっぱなしにしたら確実に腐っちゃうじゃん！[p]

#すてあ
そうだよ……。どうしよう……。[p]

#
俺も一緒に行くから学校まで戻ろう。まだ18時だしギリギリ空いてるはずだよ！[p]

#すてあ
……。よし戻ろう！[p]

;全力ダッシュ 場面転換
;----学校に移動----
[label name="s6-lookfor"]
#
どこに置いてきたか覚えてるか？[p]

#すてあ
分かんない！教室か弓道場だと思う！[p]

#
じゃあ二手に分かれよう！[l][r]
俺は教室に行くよ。[p]

#すてあ
分かった。わたしは弓道場を見てくる！[p]

;たぶん教室に移動
#
あいつのクラスは確かこっちだったはず……。[p]
席はどこだ……？[p]
あった！これがあいつの弁当箱だろ。[p]
よし、見つけたし弓道場まで行って帰るか。[p]
;謎のチャイムが鳴る
#
……。[p]
そういえばすでに暗い時間だな……。[p]
ちょっと外も暗くて怖い気がしてきた……。[p]
いや、大丈夫だ。こんな学校で何か起こることなんて絶対にないからな。[p]

;あまりホラー感のない歩くだけの場面
;必要かな……。
;すこししたところでsubちゃんがいきなり登場
#みやの
わ～[p]

#
わあああああぁぁああぁぁぁあぁあああぁぁ！？！？！？[p]

#みやの
あははっ。ore君がビビりだって噂、ほんとうだったんだねー。[p]

#
もー……。あまりビックリさせないでくれ……。[p]

#みやの
ごめんごめん。一人で歩いてるore君を見かけたらやってみたくなっちゃって、[p]
ore君はなんで学校に残ってたの？

#
hiorinの弁当箱を取りに来てたんだよ。
あいつは弓道場に行ってるからそっちまで行くか。

#みやの
そうなんだ……。ちょっと邪魔しちゃったね。

#
いいよ。弓道場まで一緒に来る？

#みやの
！
じゃあ一緒に行こうかな。

#
それじゃあ行くか。

;外に移動
#みやの
……ore君はさ、hiorinちゃんのことどう思ってる？

#
……？
それはどういう質問？

#みやの
うーーん。
あんまり深い意味はないんだけどね、
大切に思ってたらいいなって思って、

#
まぁ……。あいつはいつも近くにいてウザいときもあるけど、
かわいいところもあるし、一人で居るよりもあいつと居るほうが楽しいからな。
そんな意味では大切だとは思っているが…そんなこと聞いてどうするんだ？

#みやの
…、…………うん、ありがとう。
聞かせてくれてありがとね。
……そういえばこの後すぐに予定があるんだった。
そろそろ帰るね、応援してるからねっ。

#
あ、ああ……。

#みやの
じゃあバイバイ！また明日っ！！

;逃げるように去る
#
？なんだったんだろう……？

#ひ
あっore～。弁当箱見つかったー？

#
お前の席に残ってたぞ。もう忘れんなよ。

#すてあ
ありがとね、ore君。

#
じゃあ帰ろうか。早くしないと暗くなっちゃう。

#hiorin
帰ろうか。

;帰り道に移動
#すてあ
そうえいばさっき誰かと話してなかった？

#
そうなんだよ、さっきまでsubちゃんがいたんだけど先に帰った。
なんか急用を思い出したとかで……。

#すてあ
そーなんだ。なんか変だねー。

#
変だよな。

;if (お金が余ってる)
;{
#
……ちょっと水飲んでもいいか？
走りまくったせいで喉が渇いた。

#すてあ
いいよー。
私はもう飲み干しちゃったんだよね。

#
お金は持ってないのか？そこに自販機あるけど。

#すてあ
アイス買ったときに無くなっちゃった。
もう買える分は残ってないよ。

#
……じゃあ買ってあげようか？
奢ってもらった分の余裕があるし。

#すてあ
えっ？ほんとにいいの？

#
いいよ。これこそ貸しだからな。
;ピッ・ガコン
はい、これ。

;mod_hiroin_odoroki
#すてあ
……ありがとう。
ほんとうにore君はやさしいね。

#
……別にたいしたことないぞ。
;}

#
……そろそろ分かれ道だね。

#すてあ
……。

#
じゃあバイバイ。また明日。

;画面を急に振り向かせる
#すてあ
……あの！今日はほんとにありがとう！
お礼は、……またいつか返すから！
そのときに！！
……じゃあ、またね！バイバイ！！

;ぴゅーんっと逃げる
#
……？
あいつもなんだったんだ……？

;終わり

;その時、昔言われたことを思い出した。シャウエッセンの一番おいしい食べ方は公式が宣伝している「黄金の３分間ボイル」なのだ。

[s]
