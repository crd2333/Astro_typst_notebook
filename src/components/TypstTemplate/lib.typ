#import "fonts.typ": *
#import "utils.typ": *
#import "math.typ": *
#import "figures.typ": *

#let project(
  title: "",
  lang: "zh",
  show_toc: true,
  toc_break: true,
  toc_depth: 4,
  body
) = {

  set document(title: title,)
  set page(
    paper: "a4",
    height: auto,
    margin: (x: 2cm, y: 1.5cm),
  )

  // 导入 show 规则
  show: setup-lovelace
  show: checklist.with(fill: luma(95%), stroke: blue, radius: .2em)
  show: shorthand // 导入 math shorthand
  show: codly-init.with()
  // 行间公式、原始文本与文字之间的自动空格
  show raw.where(block: false): it => h(0.25em, weak: true) + it + h(0.25em, weak: true)
  show math.equation.where(block: false): it => h(0.25em, weak: true) + it + h(0.25em, weak: true)
  // 矩阵用方括号显示
  set math.mat(delim: "[")
  set math.vec(delim: "[")
  // 引用与链接字体蓝色显示
  show ref: set text(colors.blue)
  show link: set text(colors.blue)
  // 设置字体与语言
  set text(font: 字体.宋体, size: 字号.小四, lang: lang)
  set par(first-line-indent: 2em)
  set list(marker: ([●], [○], [■], [□], [►])) // 设置 bullet list 的 marker，相比默认更像 markdown，另外刻意调大了一点（适合老年人
  set enum(numbering: numbly("{1}.", "{2:a}.", "{3:i}."), full: true)
  show emph: text.with(font: 字体.楷体) // 中文斜体显示为楷体

  // 设置标题
  show heading.where(level: 1): it => {
    set block(spacing: 1em)
    align(center, text(weight: "bold", font: 字体.黑体, size: 18pt, it))
  }
  show heading.where(level: 2): set text(weight: "bold", font: 字体.黑体, size: 17pt)
  show heading.where(level: 3): set text(weight: "bold", font: 字体.黑体, size: 16pt)
  show heading.where(level: 4): set text(weight: "bold", font: 字体.黑体, size: 15pt)
  show heading.where(level: 5): set text(weight: "bold", font: 字体.黑体, size: 14pt)
  set heading(numbering: (..nums) => { // 设置标题编号
    nums.pos().map(str).join(".") + " "
  })

  // 代码相关设置
  codly(
    languages: (
      c: (name: "", icon: h(2pt)+c_svg, color: rgb("#A8B9CC")),
      C: (name: "", icon: h(2pt)+c_svg, color: rgb("#A8B9CC")),
      cpp: (name: "Cpp", icon: cpp_svg, color: rgb("#00599C")),
      Cpp: (name: "Cpp", icon: cpp_svg, color: rgb("#00599C")),
      py: (name: "Python", icon: python_svg, color: rgb(("#3D8FD1"))),
      python: (name: "Python", icon: python_svg, color: rgb(("#3D8FD1"))),
      rust: (name: "Rust", icon: rust_svg, color: rgb("#CE412B")),
      java: (name: "Java", icon: java_svg, color: rgb("#5382A1")),
      typ: (name: "Typst", icon: typst_svg, color: rgb("#FFD700")),
      sql: (name: "SQL", icon: sql_svg, color: rgb("#F0A103")),
      SQL: (name: "SQL", icon: sql_svg, color: rgb("#F0A103")),
      verilog: (name: "Verilog", icon: verilog_svg, color: rgb("#FF6666")),
      Verilog: (name: "Verilog", icon: verilog_svg, color: rgb("#FF6666")),
    ),
    zebra-color: luma(250),
    fill: luma(250),
    // stroke-width: 1pt,
    // display-name: false,
    // display-icon: false
  )
  // 行内代码，灰色背景
  show raw.where(block: false): box.with(
    fill: colors.gray,
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  show raw: set text(font: (字体.meslo-mono, 字体.思源宋体)) // 代码中文字体
  show raw: it => {
    show regex("pin\d"): it => pin(eval(it.text.slice(3))) // pinit package for raw
    it
  }

  show: fix-indent() // 一个很 tricky 的包，需放在所有 show 规则的最后

  if title != none {
    move(dy: -25pt, text(font: 字体.黑体, 2.5em, weight: 700, title))
  }
  if show_toc {toc_note(toc_break: toc_break, depth: toc_depth)} // 目录

  body
  v(10em)
}
