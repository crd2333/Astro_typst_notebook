# Astro-typst Notebook

一个基于 [astro-typst](https://github.com/OverflowCat/astro-typst/tree/master) 的网页笔记本，支持 md 和 typ 两种格式

- Typst 原有的一些功能得到 astro-typst 的支持
  - [x] Import packages in Typst Universe
  - [x] import / include / read files or resources
  - [x] Use system fonts
  - [x] Selectable, clickable text layer
  - [x] Set scale
  - [x] Static SVGs without JavaScript
  - [ ] Responsive SVGs
  - [ ] Add font files or blobs

没有使用 Astro 原有的 content 内容集合（~~其实是不会~~）和 pages 内自动静态路由（也就是能够兼容）

实现方式非常丑陋且笨拙，孩子不会前端且不熟悉 Astro，做着玩的（x
