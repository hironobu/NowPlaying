# NowPlaying

Mac上でiTunesがその時演奏している曲名を出力するためのサンプルアプリケーションです。

# 構成

- AppDelegate.swift アプリケーションデリゲート。iTunesからの情報を受け取ってslackへの通知をここで行う。
- ViewController.swift ビューコントローラー。iTunesからの情報を取り出して画面表示を行う。