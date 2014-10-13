# Asebi Mincho

たのしい旧字フォント

フォントは[馬酔木明朝のサイト](https://metasta.github.io/asebi/)からダウンロードできます

## Build

1. 必要なもの
  - `sh`, `tr`, `sort`, `awk` などの基本 UNIX コマンド群
  - Python3
  - Adobe Font Development Kit for Opentype ([www.adobe.com](http://www.adobe.com/jp/devnet/opentype/afdko.html))
2. `src` ディレクトリに以下のフォントを入れる
  - sammin.otf ([三番明朝 - www.akenotsuki.com](http://www.akenotsuki.com/eyeben/font/sammin.html))
  - nishiki.otf ([錦明朝かな - www.akenotsuki.com](http://www.akenotsuki.com/eyeben/font/nishiki_kana.html))
  - ipamjm.ttf ([IPAmj明朝 - mojikiban.ipa.go.jp](http://mojikiban.ipa.go.jp/1300.html))
3. `src/ipamjm.txt` を適宜改訂する。以下を駆使する
  - Mac OS X の「文字ビューア」
  - [glyphwiki](http://glyphwiki.org/)
  - [IPA MJ 文字情報検索システム(簡易版)](http://mojikiban.ipa.go.jp/search/SearchCode.html)
  - [梅雨空文庫 - 実験室1](http://home.q02.itscom.net/tosyokan/JIKKEN1.txt)の資料
4. `make` して完成

        % make

## License

MIT ライセンスのもとで公開します

（生成されるフォントには [IPA フォントライセンス v1.0](http://ipafont.ipa.go.jp/ipa_font_license_v1.html) が適用されます）

## Changelog

### 1.005 (*2014-10-14*)
- IPAmj 明朝 Ver.003.01 に対応

### 1.004 (*2014-07-12*)
- 歲・脫など多くの字を訂正

### 1.003 (*2014-03-23*)
- Web フォントで縦書きのとき旧字が右にずれる問題を修正

### 1.002 (*2014-03-19*)
- 松・艇・慢・麗・岳・床・窓・覇・累を訂正・変更

### 1.001 (*2014-03-18*)
- フォントの一意名とコピーライト情報を修正

### 1.000 (*2014-03-16*)
- 公開
