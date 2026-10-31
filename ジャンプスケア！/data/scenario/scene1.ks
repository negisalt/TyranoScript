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
[chara_face name="sutea" face="still_2_1" storage="chara/sutea/still_2_1.png"]

;hiroin_　すてあ 弓道ver
[chara_new name="suteak" storage="chara/suteak/normal.png" jname="すてあ"]
[chara_face name="suteak" face="angry" storage="chara/suteak/angry.png"]
[chara_face name="suteak" face="fukigen" storage="chara/suteak/fukigen.png"]
[chara_face name="suteak" face="niko" storage="chara/suteak/niko.png"]
[chara_face name="suteak" face="odoroki" storage="chara/suteak/odoroki.png"]
[chara_face name="suteak" face="question" storage="chara/suteak/question.png"]
[chara_face name="suteak" face="sad" storage="chara/suteak/sad.png"]
[chara_face name="suteak" face="yobi" storage="chara/suteak/yobi.png"]

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
俺は俺。ごく普通の男子高校生だ。[p]
成績も普通。スポーツも普通。他の人と比べて特に目立つようなところはない。[r][p]
ある一点を除いて……。[r]それは……。[p]

#？？？
お～い？[r]俺く～ん？[p]

#
ん？[p]

;廊下に向く
[mask time="1000"]
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
ごめんねー。すてあちゃんに頼まれて俺君を驚かす手伝いをしてほしいって言われてさ～[p]

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
えー？やめてって言われても、俺の反応が面白いもーん。[p]
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
俺君はこの後どうする？[r]このまま部室に来る？[p]

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
[bg time="1500" storage="library.jpg"]

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
[eval exp="f.book = 1"]
新着のエッセイを選んだ[l]
@jump target=*common

*select2
[cm]
[eval exp="f.book = 2"]
話題の人気小説を選んだ[l]
@jump target=*common

*select3
[cm]
[eval exp="f.book = 3"]
気になる推理小説を選んだ[l]
@jump target=*common

*select4
[cm]
[eval exp="f.book = 4"]
哲学の学術本を選んだ[l]
@jump target=*common

*common
[cm]

;選択後
この本にするか。[p]

;受付前に移動
[chara_show name="miyano"]
#みやの
あっ俺君。今日も本を借りに来たの？[p]

#
そうだよ。先に前に借りた本を返してからだけどね。[p]

#みやの
じゃあ返却ってことだねー。[r][l]
[delay speed=120]
こ・れ・で・よし。[l] 
[resetdelay]
返却できたよー。[p]
;テキストスピードを落とす

#
ありがとう。[r]
じゃあこれが借りる本ね[p]


;新着のエッセイ
[if exp="f.book==1"]
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
[if exp="f.book==2"]
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
[if exp="f.book==3"]
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
[if exp="f.book==4"]
#みやの
俺くんってこんな難しそうな本も読むんだね……。[l][r]
初めて知ったかも。[p]

#
たまにはこういう本も読んでみよっかなって。[p]

#みやの
勉強熱心だねー。部活もがんばってねー。[p]

#
じゃあまた明日ね。[p]
@jump target=*borrowed-book
[endif]

*borrowed-book
[chara_hide name="miyano"]

;廊下
[bg time="1500" storage="rouka.jpg"]
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
;[skipstop]

[chara_show name="sutea" left=1000 width=900]
;昇降口
[bg time="1500" storage="gym_back.jpg"]

#
はぁはぁ……。[l][r]
本をカバンにしまってたら完全に置いてかれてしまった……。[p]

;ダッシュをするミニゲームでもいい

#すてあ ;横から登場
[anim name="sutea" left=100 top=0 width=1200 time="300"]
;[chara_move name="sutea" left=0 time=1]
[font size="60"]わっ！！！！[p][resetfont]

#
うぇっっっっっ！？！？！？[p]

#sutea:niko
あはははははっあはははっはっ[r]
やっぱり俺の反応おもしろい～～～。[p]

#
このやろぉ……。[r]
俺をダッシュで置いていったのは驚かすためだったのか……。[p]


#sutea:niko
ほんとーはそんな気はなかったたんだけど、思いついちゃったんだよね～。[p]

#
こいつ……。[p]

#sutea:default
ちなみにレースはまだ終わってないよ～。[p]
[chara_move anim=true name="sutea" left="1200" time=500]
[chara_move name="sutea" width=614 top=30]
;hiorinがダッシュで逃げる

#
あっ！ちょっと待て！！[p]

[chara_hide name="sutea"]

[bg time="2000" storage="kyudo.jpg"]
;弓道場に移動、弓道着に着替えて登場
[chara_show name="suteak"]

#suteak:default
わたしの勝ち～。[l][r]
俺君、遅かったね～。[p]

#
お前が「驚かす」っていう卑怯な手を使ってくるからだろ……。[p]

#suteak:fukigen
途中で物陰から現れただけだし～。[p]

#
それが「驚かす」っていうんだろ……。[r][l]
とにかく今回のレースに関してはノーカンでしょ！[p]

#suteak:fukigen
え～～～[r][l]
#suteak:niko
じゃあ的中率で勝負しようよ！！[p]
わたし、今日の朝練ですっごく調子よかったんだよね～。[p]

#
的中率の勝負なら望むところだ！[r]
卑怯な手は絶対使うなよ？[p]

#suteak:niko
負けたほうがコンビニでアイスおごるってことで良いよね！[p]
#
真剣勝負だ！！[r]
絶対負けないからな！！[p]

;----一時暗転----
[mask time=2000]
[mask_off time=2000]

#suteak:niko
3発！3発も当たったよ！！[r][l]
すごいでしょ！！[p]

#
見てたから知ってるよ……。[p]

#suteak:niko
メチャクチャ上手くいったよ！[r][l]
これで君は全部的中させなきゃ勝てないね～。(ニヤニヤ)[p]

#
これはかなり勝つのが厳しいな……。[p]
全部当ててやるからな！[l]見とけよ！！[p]

#suteak:default
やれるもんならやってみてよ～[p]
君が全部的中しているところ見たことないけど～？[p]

#
くそ……。[p]

;シーン転換・ゲームスタート
[mask time="1000"]
[mask_off time=100]
[call storage="kyudo_minigame.ks"]
;驚かしはなし……かも　皆中しているときの4発目に何かのイベントを作ろうかな

[if exp="f.kyudo_result=='success'"]
;-----勝ったとき-----
#
っしゃあ！！！[p]
見てたか！すてあ！！[p]

#suteak:sad
そんなぁ……[r]
絶対勝ったと思ってたのに……。[p]

#
それじゃあアイスはお前のおごりな[p]

#suteak:sad
......。[p]
ぅわ～ん……。[r]
俺君に脅されてるよぉ～……。[p]

#女子弓道部員A
俺君？またすてあちゃんを泣かせてるの？[r][l]
すてあちゃんが可哀そうだよー。[p]

#
ちょっと！？泣かせてはないよ！？[p]
っていうか全部的中したことを褒めてくれてもいいじゃないの！？[p]
[chara_hide name="suteak]
@jump target=*convini_success

[elsif exp="f.kyudo_result=='draw'"]
;-----引き分け-----
#
引き分けかぁ……[p]

#suteak:fukigen
これじゃあ勝負つかないじゃん……。[p]
もう勝ち負け関係なくアイス奢ってよ！[p]

#
はぁ？それは約束が違うだろ！[p]
引き分けならアイスを義務は無いだろ。[p]

#suteak:yobi
うーん……。[p]
#suteak:default
じゃあさ、私がアイス奢るから俺もアイス奢って？[p]

#
？[l][r]
どういうことだよ……？[p]

#suteak:default
引き分けたってことは、両方が勝って、両方が負けたってことでしょ？[p]
だったらこれでいいんじゃない？[p]

#
なんでそんな無駄なことを……？[l][r]
自分でアイスを買えばいいだけだろ。[p]

#suteak:fukigen
やだ！奢ってもらうことが大事なの！[p]

#
分かったよ……。[l][r]
部活終わったらコンビニ行くぞ。[p]

#suteak:niko
はーい♪[p]

#
(なんなんだコイツ……)[p]
[chara_hide name="suteak]
@jump target=*convini_draw
[elsif exp="f.kyudo_result=='failed'"]
;-----負け-----
#
ま、負けてしまった……。[p]

#suteak:niko
イェーイ！私の勝ち〜！[l][r]
ちゃんとアイス奢ってね〜。[p]

#
くそっ……。[p]

#suteak:niko
どんなアイスにするか楽しみだな〜。[p]
高いやつにしちゃおうかな〜。[p]

#
……。[p]
…帰りにそこのコンビニでアイス奢ってやるから、[r]
着替えたら待っとけよ…。[p]

#suteak:odoroki
！[p]
#suteak:niko
わーい！俺がアイス奢ってくれるって〜。[p]

#女子部員A
え〜いいな〜。私の分も奢ってよ〜。[p]

#
さすがに一人が限界だ……。勘弁してくれ……。[p]
[chara_hide name="suteak]
@jump target=*convini_failed
[endif]
;----コンビニに移動----
[label name="s4-konbini"]

;-----勝ち-----
*convini_success
[bg time=2000 storage="convini.jpg]
[chara_show name="sutea"　top=30]
#suteak:fukigen
も～勝てると思ってたのに～[p]
くやしいくやしいくやしいくやしい～～～～～[p]

#
残念だったな。ははっ。[p]
約束だぞ。アイスを奢ってもらおう。[p]

#suteak:fukigen
も～～～。[r]
俺くんのケチ！！[p]

#
うるさいなぁー。[r][l]
さっさとこのアイスを買ってくれ。[p]

#sutea:fukigen
俺くんさあ……。こんなかわいい幼馴染に奢らせるとかありえないんだけど～～。[p]
これは借りだからね～～。[p]

;現金決済

#
勝負だったのになんで借りになるんだよ。[p]
言っとくけど、借りだったとしても返すつもりはないからな[p]

#sutea:fukigen
ふーん。まあいいや。[p]
[chara_mod name="sutea" face="default"]
せっかくだし近くの公園で食べようよ！[p]

#
そうだな。[r]
公園まで行こうか。[p]
@jump target=*bought_ice

;-----引き分け-----
*convini_draw
[bg time=2000 storage="convini.jpg]
[chara_show name="sutea"　top=30]
#sutea:question
どのアイスにしようかな〜。[p]

#
言っとくけど、あまり高いやつにするなよ。[l][r]
今月かなり厳しいんだ。[p]

#sutea:fukigen
わかってるよ〜。[l][r]
俺は決まったー？[p]

#
これにしようかな。[l][r]
もう決まったのか？[p]

#sutea:question
うーん……。[p]
#sutea:default
じゃあこれ！[p]

#
決まったな。レジ行くぞ。[p]

;現金決済×2
#
(あぶねーあとちょっとしかお金が残ってないし……)[p]

#sutea:question
ん？どうしたの？[p]

#
いや、なんでもない。[l][r]
アイスは近くの公園で食べようか。[p]

#sutea:default
わかった！行こう！[p]
@jump target=*bought_ice

;-----負け-----
*convini_failed
[bg time=2000 storage="convini.jpg]
[chara_show name="sutea"　top=30]
#sutea:question
うーん、どのアイスにしようかなぁ〜。[p]

#
(頼む、できるだけ安いやつにしてくれ……!)[p]

#sutea:default
この期間限定のやつが気になるなぁ〜。[p]
誰か奢ってくれる優しい人はいないかな〜。[p]

#
…アイスは決まったか？[p]

#sutea:odoroki
えっ！もしかして奢ってくれるの！？[l][r]
#sutea:niko
ありがと〜！[p]

#
元々そう言う約束だっただろ……。[l][r]
レジに持ってくから渡せ。[p]

#sutea:niko
はい、どーぞ。[p]
俺って優しいんだねー。[p]

#
(何を考えているんだコイツは……)[p]
;現金決済

#
アイスも買えたし近くの公園で食べるぞ。[p]

#sutea:default
はーい。[p]
@jump target=*bought_ice

*bought_ice
;----公園に移動----
[label name="s5-park"]

[bg time=2000 storage="park.jpg"]

#
この辺でアイス食べるか。[p]

[chara_mod name="sutea" face="default"]
#すてあ
ちょっとトイレに行きたいからアイス持ってて。[p]

#
あっちのベンチで先に食べてるぞー。[p]
[chara_hide name="sutea"]
;（なにか思うところがある）[p]

;ベンチに移動
#
(いつもあいつは何を考えているのか分からないな……)[p]
(モグモグ)[p]
……。[p]
(昨日も急に俺の教室まで驚かしに来たし……)[p]
(その前も登校中にいきなり現れたし……)[p]
(そういや昨日あいつに貸したボールペンを返してもらってないな)[p]
(あとで言っておくか)[p]
[chara_show name="sutea" left=2000 width=2000]
……。[p]
あいつ、ちょっと遅くないか？[p]
早くしないとこの手に持ってるアイスが溶けてしまうぞ。[p]
食べないなら俺が食べ
[cm]
;ここら辺でいきなり登場

#sutea:fukigen
[chara_move name="sutea" left=-400 top=0 width=2000 anim=true time=400]
[font size=50]
だーーーーーれの話をしてたの〜〜〜〜？[p]
[resetfont]

#
うわああああああ！！！！！[p]

#sutea:niko
あははははっ。[r]
俺君いつも油断しすぎだよ～。[p]

#
アイス食ってるときに人を驚かせるな！！[p]

[chara_move name="sutea" left=500 top=0 width=614]
#sutea:default
ごめんごめん。俺君が何かに集中しているところを見ると[r]
ついイタズラしたくなっちゃうんだよ～。[p]

#
このっ……。[p]
アイスが服についちゃったじゃねえかよ……。[p]

#sutea:yobi
（……。ピコーン！）[p] 
;これは俺に近づくチャンスだと思っている
#sutea:odoroki
あっほんとだ！[r]
ごめんね、拭いてあげるね～。[p]
[chara_move name="sutea" top=200]

#
（ポケットティッシュを取り出してごしごししようとする。）[p]

#
別にこれくらい自分でやるよ。[p]

#sutea:angry
ダメ！これはわたしの仕事なの！[r]
俺くんは座って待ってて！[p]
（ごしごし。ごしごし……。）[p]

#
（なんでコイツはこんなに怒ってるんだ……？）[p]
（それにしても近いな……。）[p]

#sutea:yobi
[font size=8]
……ｽﾝｽﾝ。[p] 
;めっちゃ小さい文字で「スンスン。」と服の匂いを嗅ぐ
[resetfont]
#sutea:default
よし、これでいいでしょ！[p]
[chara_move name="sutea" top=0]

#
まあちょっとシミは残ってるけどな……。[r]
やらないよりマシか……。[p]

#sutea:default
はい、わたしのアイス返してー。[p]

#
かなり溶けてると思うぞ。[r][l]
買いなおした方がいいんじゃないか？[p]


#sutea:default
別にいーよ。[r]
ほとんどわたしが悪いし。[p]

#
それもそうか。[r][l]
じゃあこのまま食べるか。[p]
[chara_hide name="sutea"]

;背景変化 エモいスチル
;セミの声など公園っぽい環境音＆BGMに
;この後の驚かしポイントは袋破裂による爆音とか？

[bg time=2000 storage="still/park_ice.jpg"]
[chara_show name="sutea"]
[chara_move name="sutea" left=0 top=0 width=1280]

#sutea:still_2_1
やっぱり夏に公園でアイスを食べるのっていいよねー。[p]

#
そうだなー。特別なことをしてる感じがするな。[p]

#すてあ
……。[l][r]
…俺君はさ、今のクラスどう？[p]

#
なんだよいきなり。[p]

#すてあ
なんか、聞いてみたくなっちゃって……。[p]

#
そーだなぁ……[l][r]
普通に楽しいし特に変わりはないぞ。[p]

#すてあ
そ、そっかあ、やっぱりそんなに変わらないよね！[p]

#
強いて言うなら、お前が別のクラスになって、[r]
俺の周りが静かになったことくらいだな。[p]
お前、いつも俺の近くに居たもんな。[p]

#すてあ
そ、そお？あれぐらいふつうだと思うけど……。[p]

#
いまでも一緒に昼休みに弁当食べたりするくらいだし、[r]
かなり近い距離にいるとは思うぞ。[p]

#すてあ
そ、そうかな……。[r]
あれくらいふつうだと思ってたけど……。[p]

#
一緒に弁当を食べる男女ってなかなかいないぞ……。[p]

#すてあ
あれ？ちょっと待って。[p]
（かばんの中を探し出す。）[p]

[bg time=2000 storage="park.jpg"]
[chara_move name="sutea" width=614]
[chara_mod name="sutea" face="odoroki"]

#
どうした？忘れ物か？[p]

#すてあ
……。[l]…………。[l]………………。[l]
弁当箱がない……。[p]

#
えっ！？[l][r]
;衝撃による振動
こんな暑い日に学校に置きっぱなしにしたら確実に腐っちゃうじゃん！[p]

#sutea:sad
そうだよ……。どうしよう……。[p]

#
俺も一緒に行くから学校まで戻ろう。まだ18時だしギリギリ空いてるはずだよ！[p]

#sutea:angry
……。よし戻ろう！[p]
[chara_hide name="sutea"]

;全力ダッシュ 場面転換
;----学校に移動----
[label name="s6-lookfor"]

[bg time=2000 storage="classroom_2.jpg"]
[chara_show name="sutea" width=614]
[chara_mod name="sutea" face="default"]

#
どこに置いてきたか覚えてるか？[p]

#すてあ
分かんない！教室か弓道場だと思う！[p]

#
じゃあ二手に分かれよう！[l][r]
俺は教室に行くよ。[p]

#すてあ
分かった。わたしは弓道場を見てくる！[p]

[chara_hide name="sutea"]

;たぶん教室に移動
#
あいつのクラスは確かこっちだったはず……。[p]
席はどこだ……？[p]
あった！これがあいつの弁当箱だろ。[p]
よし、見つけたし弓道場まで行って帰るか。[p]
;謎のチャイムが鳴る

[bg time=2000 storage="rouka.jpg"]
[chara_show name="miyano" left=1500 top=50 width=1200]
#
……。[p]
そういえばすでに暗い時間だな……。[p]
ちょっと外も暗くて怖い気がしてきた……。[p]
いや、大丈夫だ。こんな学校で何か起こることなんて絶対にないからな。[p]

;あまりホラー感のない歩くだけの場面
;必要かな……。
;すこししたところでsubちゃんがいきなり登場

[chara_move name="miyano" left=333 anim=true time=500]
#みやの
わ～[p]

#
わあああああぁぁああぁぁぁあぁあああぁぁ！？！？！？[p]

#みやの
あははっ。俺君がビビりだって噂、ほんとうだったんだねー。[p]

#
もー……。あまりビックリさせないでくれ……。[p]

#みやの
ごめんごめん。一人で歩いてる俺君を見かけたらやってみたくなっちゃって、[p]
俺君はなんで学校に残ってたの？[p]

#
すてあの弁当箱を取りに来てたんだよ。[p]
あいつは弓道場に行ってるからそっちまで行くか。[p]

#みやの
そうなんだ……。ちょっと邪魔しちゃったね。[p]

#
いいよ。弓道場まで一緒に来る？[p]

#みやの
！[l][r]
じゃあ一緒に行こうかな。[p]

#
それじゃあ行くか。[p]
[chara_hide name="miyano"]

;外に移動
[bg time=2000 storage="gym_back_2.jpg"]
[chara_show name="miyano" width=614]
#みやの
……俺君はさ、hiorinちゃんのことどう思ってる？[p]

#
……？[l][r]
それはどういう質問？[p]

#みやの
うーーん。[l]
あんまり深い意味はないんだけどね、[p]
大切に思ってたらいいなって思って、[p]

#
まぁ……。あいつはいつも近くにいてウザいときもあるけど、[p]
かわいいところもあるし、一人で居るよりもあいつと居るほうが楽しいからな。[p]
そんな意味では大切だとは思っているが…そんなこと聞いてどうするんだ？[p]

#みやの
…、…………うん、ありがとう。[p]
聞かせてくれてありがとね。[p]
……そういえばこの後すぐに予定があるんだった。[p]
そろそろ帰るね、応援してるからねっ。[p]

#
あ、ああ……。[p]

#みやの
じゃあバイバイ！また明日っ！！[p]

[chara_move name="miyano" left=1200]
[chara_hide name="miyano"]
;逃げるように去る
#
？なんだったんだろう……？[p]
[chara_show name="sutea"]

#sutea:sad
あっ俺～。弁当箱見つかったー？[p]

#
お前の席に残ってたぞ。もう忘れんなよ。[p]

#sutea:niko
ありがとね、俺君。[p]

#
じゃあ帰ろうか。早くしないと暗くなっちゃう。[p]

#sutea:default
帰ろうか。[p]

;帰り道に移動
[bg time=2000 storage="road.jpg"]
#sutea:yobi
そうえいばさっき誰かと話してなかった？[p]

#
そうなんだよ、さっきまでsubちゃんがいたんだけど先に帰った。[p]
なんか急用を思い出したとかで……。[p]

#sutea:question
そーなんだ。なんか変だねー。[p]

#
変だよな。[p]

[if exp="f.kyudo_result=='success'"]
;{
#
……ちょっと水飲んでもいいか？[r]
走りまくったせいで喉が渇いた。[p]

#sutea:niko
いいよー。[r]
私はもう飲み干しちゃったんだよね。[p]

#
お金は持ってないのか？そこに自販機あるけど。[p]

#sutea:yobi
アイス買ったときに無くなっちゃった。[l][r]
もう買える分は残ってないよ。[p]

#
……じゃあ買ってあげようか？[l][r]
奢ってもらった分の余裕があるし。[p]

#sutea:odoroki
えっ？ほんとにいいの？[p]

#
いいよ。これこそ貸しだからな。[p]
;ピッ・ガコン
はい、これ。[p]

#sutea:odoroki
……ありがとう。[l][r]
ほんとうに俺君はやさしいね。[p]

#
……別にたいしたことないぞ。[p]
;}
[endif]

#
……そろそろ分かれ道だね。[p]

#sutea:yobi
……。[p]

#
じゃあバイバイ。また明日。[p]

;画面を急に振り向かせる
[font size=60]
#sutea:default
……あの！今日はほんとにありがとう！[p]
お礼は、……またいつか返すから！[p]
そのときに！！[p]
……じゃあ、またね！バイバイ！！[p]
[resetfont]

;ぴゅーんっと逃げる
[chara_move name="sutea" left=1200 anim=true time=600]
#
……？[l][r]
あいつもなんだったんだ……？[p]

[font size=80]
終わり[p]
[resetfont]

クレジット：背景 -みんちりえ（ https://min-chi.material.jp/ ）様


;その時、昔言われたことを思い出した。シャウエッセンの一番おいしい食べ方は公式が宣伝している「黄金の３分間ボイル」なのだ。

[s]
