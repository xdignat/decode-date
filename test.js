'use strict';

const {performance} = require('perf_hooks');
const {empty, dateDecodeDate, jsDecodeDate, wasmDecodeDateA, wasmDecodeDateB, wasmDecodeDateC, wasmDecodeDate_C_Proc} = require('./lib/decode-date');

const now = Date.now();
console.log(now);
console.log(JSON.stringify(dateDecodeDate(now)));
console.log(JSON.stringify(jsDecodeDate(now)));
console.log(JSON.stringify(wasmDecodeDateA(now)));
console.log(JSON.stringify(wasmDecodeDateB(now)));
console.log(JSON.stringify(wasmDecodeDateC(now)));

console.log('Benchmark ops/sec:');
benchmark('empty', time => empty(time));
benchmark('dateDecodeDate', time => dateDecodeDate(time));
benchmark('jsDecodeDate', time => jsDecodeDate(time));
benchmark('wasmDecodeDateA', time => wasmDecodeDateA(time));
benchmark('wasmDecodeDateB', time => wasmDecodeDateB(time));
benchmark('wasmDecodeDateC', time => wasmDecodeDateC(time));
benchmark('wasmDecodeDate_C_Proc', () => wasmDecodeDate_C_Proc(0));

check();

function benchmark(message, callback) {
    let count = 0;
    let time = Date.UTC(1, 0, 1);
    let now = performance.now();
    let repeat = 1000000;
    let decode;
    while (true) {
        if (!repeat--) {
            repeat = 10000;
            if (performance.now() - now >= 1000)
                break;
        }
        decode = callback(time);
        time += 12345678;
        count++;
    }
    let result = '' + count;
    while (result.length < 9)
        result = ' ' + result;
    result += ' ' + message + ((decode) ? ' ' : '');
    console.log(result);
}

function check() {
    let count = 0;
    let err = 10;
    let time = -62162035200000;
    let last = 92556518400000;

    while (time < last) {
        const d = JSON.stringify(dateDecodeDate(time));
        const j = JSON.stringify(jsDecodeDate(time));
        const a = JSON.stringify(wasmDecodeDateA(time));
        const b = JSON.stringify(wasmDecodeDateB(time));
        const c = JSON.stringify(wasmDecodeDateC(time));

        if (d !== j || d !== a || d !== b || d !== c) {
            console.log('d: ', d);
            console.log('j: ', j);
            console.log('a: ', a);
            console.log('b: ', b);
            console.log('c: ', c);
            console.log();
            if (!err--)
                return;
        }

        count++;
        time += 1234567890;
    }
}
