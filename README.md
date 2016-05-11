# Asebi Mincho Maker

たのしい旧字フォント作り

フォントは[馬酔木明朝のサイト](https://metasta.github.io/asebi/)からダウンロードできます

## Build

1. 必要なもの
  - `sh`, `tr`, `sort`, `awk` などの基本 UNIX コマンド群
  - Python3
  - Adobe Font Development Kit for Opentype ([www.adobe.com](http://www.adobe.com/jp/devnet/opentype/afdko.html))
2. `src` ディレクトリに以下のフォントを入れる
  - sammin.otf ([三番明朝 - www.akenotsuki.com](http://www.akenotsuki.com/eyeben/font/sammin.html))
  - **otagi.otf** ([愛宕明朝 - www.akenotsuki.com](http://www.akenotsuki.com/eyeben/font/otagi.html)) ← v1.009 以前とは異なる
  - ipamjm.ttf ([IPAmj明朝 - mojikiban.ipa.go.jp](http://mojikiban.ipa.go.jp/1300.html))
3. `src/ipamjm.txt` を適宜改訂する。以下を駆使する
  - [新字源字形表](https://github.com/metasta/shinjigen-glyph)
  - [glyphwiki](http://glyphwiki.org/)
  - [IPA MJ 文字情報検索システム(簡易版)](http://mojikiban.ipa.go.jp/search/)
  - [梅雨空文庫 - 実験室1](http://home.q02.itscom.net/tosyokan/JIKKEN1.txt)の資料
4. `make` して完成

        % make

## License

この馬酔木明朝作成用プログラムを MIT ライセンスのもとで公開します

（生成されるフォントには [IPA フォントライセンス v1.0](http://ipafont.ipa.go.jp/ipa_font_license_v1.html) が適用されます）

## Changelog

### 1.010 (*2016-05-11*)
- 英数字・記号等の書体を変更（三番明朝（IPAex明朝由来）→ 愛宕明朝（錦明朝かな由来））
- ウェイトの表記を Regular から Light に変更（実際の字の太さには変更なし）

### 1.009 (*2016-05-08*)
- **床**・**携**・**渋**・**覇**の処理を変更（新字源準拠）
- **痺**の処理を変更（痺→痹）
- 御・柊・識・薀を旧字に修正
- 內・吿・尙・彥・巹・彍・搒・构・蓮・閱・鼔が空白になる問題を修正
- 卺の不適切な字形変更を解除

### 1.008 (*2016-05-03*)
- **亘**の処理を変更 (亘→**亙**)
- ひらがなの捨てがな（ぁぃぅぇぉっゃゅょゎ）が通常と同じ大きさだったが、小さく変更した

### 1.007 (*2016-02-23*)
- **弁**・**欠**・**芸**の処理を変更 (弁→**辨**、欠→**缺**、芸→**藝**)

### 1.006 (*2016-02-16*)
- 杖・菩・蔀・豗・毬・韜で別字が表示される誤りを修正
- 毱（鞠の俗字）の字形を鞠に修正

### 1.005 (*2014-10-14*)
- IPAmj 明朝 Ver.003.01 に対応

### 1.004 (*2014-07-12*)
- 歲・脫などが空白になる問題を修正

### 1.003 (*2014-03-23*)
- Web フォントで縦書きのとき旧字が右にずれる問題を修正

### 1.002 (*2014-03-19*)
- 松・艇・慢・麗・岳・床・窓・覇・累を訂正・変更

### 1.001 (*2014-03-18*)
- フォントの一意名とコピーライト情報を修正

### 1.000 (*2014-03-16*)
- 公開
