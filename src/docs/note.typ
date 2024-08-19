#set page(margin: 1em, height: auto)
#show link: it => text(fill: blue)[#it]
#import "@preview/cheq:0.1.0": checklist

Home page of notebook.

$arrow.t$ 点击上面的 here 查看更多例子

一个基于 #link("https://github.com/OverflowCat/astro-typst/tree/master")[astro-typst] 的网页笔记本，支持 md 和 typ 两种格式

#show: checklist.with(fill: luma(95%), stroke: blue, radius: .2em)
- Typst 原有的一些功能得到 astro-typst 的支持
  - [x] Import packages in Typst Universe
  - [x] import / include / read files or resources
  - [x] Use system fonts
  - [x] Selectable, clickable text layer
  - [x] Set scale
  - [x] Static SVGs without JavaScript
  - [ ] Responsive SVGs
  - [ ] Add font files or blobs

#let typst  = {
  text(font: "Linux Libertine", weight: "semibold", fill: eastern)[typst]
}

= Typst 笔记

== #typst: Compose paper faster

$ cases(
dot(x) = A x + B u = mat(delim: "[", 0, 0, dots.h.c, 0, - a_n; 1, 0, dots.h.c, 0, - a_(n - 1); 0, 1, dots.h.c, 0, - a_(n - 2); dots.v, dots.v, dots.down, dots.v, dots.v; 0, 0, dots.h.c, 1, - a_1) x + mat(delim: "[", b_n; b_(n - 1); b_(n - 2); dots.v; b_1) u,

y = C x = mat(delim: "[", 0, 0, dots.h.c, 1) x
) $

#set text(font: ("Garamond", "Noto Serif CJK SC"))

#import "@preview/tablem:0.1.0": tablem

#tablem[
  | *English* | *German* | *Chinese* | *Japanese* |
  | --------- | -------- | --------- | ---------- |
  | Cat       | Katze    | 猫        | 猫         |
  | Fish      | Fisch    | 鱼        | 魚         |
]