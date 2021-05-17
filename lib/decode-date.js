'use strict';

const { performance } = require('perf_hooks');
const wasmCode = require('./decode-date-code');
//const fs = require('fs');
//const wasmCode = fs.readFileSync('./decode-date.wasm');

const wasmImports = {};
const wasmModule = new WebAssembly.Module(wasmCode);
const wasmInstance = new WebAssembly.Instance(wasmModule, wasmImports);

const wasmExports = wasmInstance.exports;
const wasmBuffer = wasmExports.memory.buffer;

const wasmDecodeDate_A_Proc = wasmExports.decodeDate_A_Proc;
const wasmDecodeDate_B_Proc = wasmExports.decodeDate_B_Proc;
const wasmDecodeDate_C_Proc = wasmExports.decodeDate_C_Proc;
const wasmDecodeDate_A_View = new DataView(wasmBuffer, wasmExports.decodeDate_A_Offset());
const wasmDecodeDate_B_View = new DataView(wasmBuffer, wasmExports.decodeDate_B_Offset());
const wasmDecodeDate_C_View = new DataView(wasmBuffer, wasmExports.decodeDate_C_Offset());

function empty() {
    return {
        timestamp: undefined,
        week: undefined,
        year: undefined,
        month: undefined,
        day: undefined,
        hour: undefined,
        minute: undefined,
        second: undefined,
        msec: undefined,
    }
};

function dateDecodeDate(value) {
    const date = (value instanceof Date) ? value : new Date(value);
    return {
        timestamp: date.getTime(),
        week: date.getUTCDay(),
        year: date.getUTCFullYear(),
        month: date.getUTCMonth(),
        day: date.getUTCDate(),
        hour: date.getUTCHours(),
        minute: date.getUTCMinutes(),
        second: date.getUTCSeconds(),
        msec: date.getUTCMilliseconds(),
    }
}

function jsDecodeDate(value) {
    if (value instanceof Date)
        value = value.getTime();
    if (typeof value !== 'number')
        value = new Date(value).getTime();
    if (value < -62162035200000 || value > 92556518400000)
        return dateDecodeDate(value);

    let t, j, year, month, day, week, hour, minute, second, msec;
    t = value + 62162121600000;

    msec = t % 1000;
    second = ~~(t / 1000 % 60);
    minute = ~~(t / 60000 % 60);
    hour = ~~(t / 3600000 % 24);

    day = (t / 86400000);
    j = (day << 2) - 1;
    week = ~~(day + 2) % 7;
    year = ~~(j / 146097);

    day = (j - (146097 * year)) & 9007199254740988;  // and -4 //shr 2, shl 2
    j = ~~((day + 3) / 1461);
    day = (day + 7 - (1461 * j)) >> 2;
    month = ~~((5 * day - 3) / 153);
    day = ~~((5 * day + 2 - (153 * month)) / 5);
    year = 100 * year + j;
    if (month < 10)
        month += 2;
    else {
        month -= 10;
        year++;
    }
    return { timestamp: value, week, year, month, day, hour, minute, second, msec };
}

function wasmDecodeDateA(value) {
    if (value instanceof Date)
        value = value.getTime();
    if (typeof value !== 'number')
        value = new Date(value).getTime();

    return (wasmDecodeDate_A_Proc(value))
        ? {
            timestamp: value,
            week: wasmDecodeDate_A_View.getFloat64(0, true),
            year: wasmDecodeDate_A_View.getFloat64(8, true),
            month: wasmDecodeDate_A_View.getFloat64(16, true),
            day: wasmDecodeDate_A_View.getFloat64(24, true),
            hour: wasmDecodeDate_A_View.getFloat64(32, true),
            minute: wasmDecodeDate_A_View.getFloat64(40, true),
            second: wasmDecodeDate_A_View.getFloat64(48, true),
            msec: wasmDecodeDate_A_View.getFloat64(56, true),
        }
        : dateDecodeDate(value);
}

function wasmDecodeDateB(value) {
    if (value instanceof Date)
        value = value.getTime();
    if (typeof value !== 'number')
        value = new Date(value).getTime();

    return (wasmDecodeDate_B_Proc(value))
        ? {
            timestamp: value,
            week: wasmDecodeDate_B_View.getFloat64(0, true),
            year: wasmDecodeDate_B_View.getFloat64(8, true),
            month: wasmDecodeDate_B_View.getFloat64(16, true),
            day: wasmDecodeDate_B_View.getFloat64(24, true),
            hour: wasmDecodeDate_B_View.getFloat64(32, true),
            minute: wasmDecodeDate_B_View.getFloat64(40, true),
            second: wasmDecodeDate_B_View.getFloat64(48, true),
            msec: wasmDecodeDate_B_View.getFloat64(56, true),
        }
        : dateDecodeDate(value);
}

function wasmDecodeDateC(value) {
    if (value instanceof Date)
        value = value.getTime();
    if (typeof value !== 'number')
        value = new Date(value).getTime();

    return (wasmDecodeDate_C_Proc(value))
        ? {
            timestamp: value,
            week: wasmDecodeDate_C_View.getInt32(0, true),
            year: wasmDecodeDate_C_View.getInt32(4, true),
            month: wasmDecodeDate_C_View.getInt32(8, true),
            day: wasmDecodeDate_C_View.getInt32(12, true),
            hour: wasmDecodeDate_C_View.getInt32(16, true),
            minute: wasmDecodeDate_C_View.getInt32(20, true),
            second: wasmDecodeDate_C_View.getInt32(24, true),
            msec: wasmDecodeDate_C_View.getInt32(28, true),
        }
        : dateDecodeDate(value);
}

module.exports = {
    empty,

    dateDecodeDate,
    jsDecodeDate,

    wasmDecodeDateA,
    wasmDecodeDateB,
    wasmDecodeDateC,

    wasmDecodeDate_A_Proc,
    wasmDecodeDate_B_Proc,
    wasmDecodeDate_C_Proc,
    wasmDecodeDate_A_View,
    wasmDecodeDate_B_View,
    wasmDecodeDate_C_View,
}