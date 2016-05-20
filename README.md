# 馬酔木明朝 Asebi Mincho

フォント本体は[馬酔木明朝のサイト](https://metasta.github.io/asebi/)からダウンロードできます

## Build

1. 必要なもの
  - `sh`, `tr`, `sort`, `awk` などの基本 UNIX コマンド群
  - Adobe Font Development Kit for Opentype ([www.adobe.com](http://www.adobe.com/jp/devnet/opentype/afdko.html))
2. `src` ディレクトリに以下のフォントを入れる
  - sammin.otf ([三番明朝 - www.akenotsuki.com](http://www.akenotsuki.com/eyeben/font/sammin.html))
  - otagi.otf ([愛宕明朝 - www.akenotsuki.com](http://www.akenotsuki.com/eyeben/font/otagi.html))
  - ipamjm.ttf ([IPAmj明朝 - mojikiban.ipa.go.jp](http://mojikiban.ipa.go.jp/1300.html))
3. `kyuji-map-*.txt` を適宜改訂する。以下を駆使する
  - [新字源字形表](https://github.com/metasta/shinjigen-glyph)
  - [IPA MJ 文字情報検索システム(簡易版)](http://mojikiban.ipa.go.jp/search/)
  - [glyphwiki](http://glyphwiki.org/)
4. `make` して完成

        % make

## License

この馬酔木明朝作成用プログラムを MIT ライセンスのもとで公開します

（フォント本体には [IPA フォントライセンス v1.0](http://ipafont.ipa.go.jp/ipa_font_license_v1.html) が適用されます）
