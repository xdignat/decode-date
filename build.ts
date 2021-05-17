//use in https://webassembly.studio/

import * as gulp from "gulp";
import { Service, project } from "@wasm/studio-utils";

const file_src = 'src/decode-date.c';
const file_wat = 'out/decode-date.wat';
const file_wasm = 'lib/decode-date.wasm';
const file_module = 'lib/decode-date-code.js';

gulp.task("build", async () => {
  const data = await compile();
  await save_wat(data);
  await save_wasm(data);
  await save_module(data);
});

gulp.task("default", ["build"], async () => {});

async function compile() {
  return await Service.compileFile(project.getFile(file_src), 'c', 'wasm', '-g -O4');
}

async function save_wasm(data) {
  const file = project.newFile(file_wasm, 'wasm', true);
  file.setData(data);
}

async function save_wat(data) {
  data = await Service.disassembleWasm(data);
  const file = project.newFile(file_wat, 'wat', true);
  file.setData(data);
}

async function save_module(data) {
  let len = 0;
  let line = [];
  let lines = [];
  for (const v of new Uint8Array(data)) {
    line.push(v);
    len += `${v},`.length;
    if (len >= 120) {
      lines.push(line.join(','));
      line = [];
      len = 0;
    }
  }
  if (line.length)
    lines.push(line.join(','));
  const body = `'use strict';\n\nmodule.exports = new Uint8Array([\n    ${lines.join(',\n    ')}\n]);\n`;
  const file = project.newFile(file_module, 'js', true);
  file.setData(body);
}
