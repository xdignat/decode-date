# decode-date

```npm install decode-date```

###Fast decompose timestamp into parts (UTC): year, month, day, hours, minutes, seconds, day of the week.###

Demo:

```node test.js```

```
const {jsDecodeDate, wasmDecodeDateA, wasmDecodeDateB, wasmDecodeDateC } = require('decode-date');

const now = Date.now();

console.log(jsDecodeDate(now));
console.log(wasmDecodeDateA(now));
console.log(wasmDecodeDateB(now));
console.log(wasmDecodeDateC(now));
// => {
//  timestamp: 1621252530175,
//  week: 1,
//  year: 2021,
//  month: 4,
//  day: 17,
//  hour: 11,
//  minute: 55,
//  second: 30,
//  msec: 175
//}
```

###Benchmark###
Test on **node** v14.16

```
 2440144 dateDecodeDate        //native: date.getUTCFullYear()...
 8580758 jsDecodeDate          //by js
 8370737 wasmDecodeDateA       //by wasm
 8110711 wasmDecodeDateB       //by wasm
 8550755 wasmDecodeDateC       //by wasm
15491449 wasmDecodeDate_C_Proc //by wasm without read values from memory
 ```
Total:
Passing values from WASM to JS is too expensive and nullifies all the benefits of WASM.


