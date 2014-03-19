# 馬酔木明朝

たのしい旧字フォント

## つくりかた

1. 必要なもの
  - `sh`, `tr`, `sort`, `awk` などの基本 UNIX コマンド群
  - Adobe Font Development Kit for Opentype ([www.adobe.com](http://www.adobe.com/jp/devnet/opentype/afdko.html))
  - Python3
  - Ruby
2. `src` ディレクトリに以下のフォントを入れる
  - sammin.otf ([三番明朝 - www.akenotsuki.com](http://www.akenotsuki.com/eyeben/font/sammin.html))
  - nishiki.otf ([錦明朝かな - www.akenotsuki.com](http://www.akenotsuki.com/eyeben/font/nishiki_kana.html))
  - ipamjm.ttf ([IPAmj明朝 - mojikiban.ipa.go.jp](http://mojikiban.ipa.go.jp/1300.html))
3. `make` して完成

        make

## ライセンス
**馬酔木明朝**はIPAmj明朝の「派生プログラム」に該当しますので、 [IPA フォントライセンス v1.0](http://ipafont.ipa.go.jp/ipa_font_license_v1.html) が適用されます。一方、馬酔木明朝生成スクリプトは MIT ライセンスのもとで公開します。

## 改訂履歴

### 1.002 (*2014-03-19*)
- 松・艇・慢・麗・岳・床・窓・覇・累を訂正・変更。

### 1.001 (*2014-03-18*)
- フォントの一意名とコピーライト情報を修正。

### 1.000 (*2014-03-16*)
- 公開
