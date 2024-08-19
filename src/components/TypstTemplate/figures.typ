#import "@preview/fletcher:0.4.4" as fletcher: diagram, node, edge
#import "@preview/tablem:0.1.0": tablem
#import "@preview/lovelace:0.2.0": algorithm, pseudocode-raw, setup-lovelace
#import "@preview/truthfy:0.3.0": truth-table, truth-table-empty
#import "@preview/codly:0.2.0": *
#import "@preview/cetz:0.2.1"

// 插入图片
#let fig(alignment: center, ..args) = align(alignment, image(..args))

// 正则捕捉自动设置数学环境，对表格等使用
#let automath_rule = it => {
  show regex("\d+(.\d+)*"): it => $it$
  it
}
// 普通表，包含居中
#let tbl(alignment: center, align_content: center + horizon, automath: false, ..args) = {
  let fig = align(alignment, table(align: align_content, ..args))
  if automath {
    show table.cell: automath_rule
    fig
  } else {fig}
}
// 三线表，包含居中
#let tlt(alignment: center, align_content: center + horizon, automath: false, ..args) = {
  let fig = align(alignment, table(
    stroke: none,
    align: align_content,
    table.hline(y: 0),
    table.hline(y: 1),
    ..args,
    table.hline(),
  ))
  if automath {
    show table.cell: automath_rule
    fig
  } else {fig}
}
// 类 markdown 表格，使用 tablem 实现
#let tblm(alignment: center, automath: false, ..args) = {
  let fig = align(alignment, tablem(..args))
  if automath {
    show table.cell: automath_rule
    fig
  } else {fig}
}

// 真值表，使用 truthfy 实现
#let truth-tbl(alignment: center, ..args) = align(alignment, truth-table(..args))
#let truth-tbl-empty(alignment: center, ..args) = align(alignment, truth-table-empty(..args))

// 算法框，使用 lovelace 实现
#let algo(caption: "", body) = {
  // 去除当以 "[]" 形式传参时 body 中的 "[]"，方法比较笨，轻喷
  if "text" not in body.fields() {
    body = body.children
    body = body.at(1)
  }
  algorithm(
    caption: caption,
    pseudocode-raw(
      indentation-guide-stroke: .4pt + aqua,
      body
    )
  )
}

// 代码块，使用 codly 实现
#let code(body) = [#body]

// icons for codly
#let codly_icon(codepoint) = {
  box(
    height: 1em,
    baseline: 0.1em,
    image(codepoint)
  )
  h(0.2em)
}
#let c_svg = codly_icon("/src/assets/c.svg")
#let cpp_svg = codly_icon("/src/assets/cpp.svg")
#let python_svg = codly_icon("/src/assets/python.svg")
#let rust_svg = codly_icon("/src/assets/rust.svg")
#let java_svg = codly_icon("/src/assets/java.svg")
#let sql_svg = codly_icon("/src/assets/sql.svg")
#let typst_svg = codly_icon("/src/assets/typst.svg")
#let verilog_svg = codly_icon("/src/assets/verilog.svg")

#let diagram(..args) = align(center, fletcher.diagram(
  node-stroke: 1pt,
  edge-stroke: 1pt,
  mark-scale: 70%,
  ..args
))
#let edge(..args, marks: "-|>") = fletcher.edge(..args, marks: marks)
