(module
  (type $t0 (func))
  (type $t1 (func (param f64 f64) (result f64)))
  (type $t2 (func (result i32)))
  (type $t3 (func (param f64) (result i32)))
  (func $__wasm_call_ctors (type $t0))
  (func $fmod (type $t1) (param $p0 f64) (param $p1 f64) (result f64)
    get_local $p0
    get_local $p0
    get_local $p1
    f64.div
    f64.trunc
    get_local $p1
    f64.mul
    f64.sub)
  (func $decodeDate_A_Offset (export "decodeDate_A_Offset") (type $t2) (result i32)
    i32.const 1024)
  (func $decodeDate_B_Offset (export "decodeDate_B_Offset") (type $t2) (result i32)
    i32.const 1024)
  (func $decodeDate_C_Offset (export "decodeDate_C_Offset") (type $t2) (result i32)
    i32.const 1152)
  (func $decodeDate_A_Proc (export "decodeDate_A_Proc") (type $t3) (param $p0 f64) (result i32)
    (local $l0 i32) (local $l1 f64) (local $l2 i32) (local $l3 i32)
    i32.const 0
    set_local $l0
    block $B0
      get_local $p0
      f64.const -0x1.c449d0368p+45 (;=-6.2162e+13;)
      f64.lt
      br_if $B0
      get_local $p0
      f64.const 0x1.50b7f99a8p+46 (;=9.25565e+13;)
      f64.gt
      br_if $B0
      block $B1
        block $B2
          get_local $p0
          f64.const 0x1.c449f9696p+45 (;=6.21621e+13;)
          f64.add
          tee_local $p0
          f64.const 0x1.4997p+26 (;=8.64e+07;)
          call $fmod
          tee_local $l1
          f64.abs
          f64.const 0x1p+31 (;=2.14748e+09;)
          f64.lt
          br_if $B2
          i32.const -2147483648
          set_local $l0
          br $B1
        end
        get_local $l1
        i32.trunc_s/f64
        set_local $l0
      end
      i32.const 0
      get_local $l0
      i32.const 3600000
      i32.div_s
      f64.convert_s/i32
      f64.store offset=1056
      block $B3
        block $B4
          get_local $p0
          f64.const 0x1.4997p+26 (;=8.64e+07;)
          f64.div
          tee_local $p0
          f64.abs
          f64.const 0x1p+31 (;=2.14748e+09;)
          f64.lt
          br_if $B4
          i32.const -2147483648
          set_local $l2
          br $B3
        end
        get_local $p0
        i32.trunc_s/f64
        set_local $l2
      end
      i32.const 0
      get_local $l2
      i32.const 2
      i32.add
      i32.const 7
      i32.rem_s
      f64.convert_s/i32
      f64.store offset=1024
      i32.const 0
      get_local $l0
      i32.const 60000
      i32.div_s
      i32.const 60
      i32.rem_s
      f64.convert_s/i32
      f64.store offset=1064
      i32.const 0
      get_local $l0
      i32.const 1000
      i32.div_s
      tee_local $l3
      i32.const 60
      i32.rem_s
      f64.convert_s/i32
      f64.store offset=1072
      i32.const 0
      get_local $l0
      get_local $l3
      i32.const 1000
      i32.mul
      i32.sub
      f64.convert_s/i32
      f64.store offset=1080
      i32.const 0
      get_local $l2
      i32.const 2
      i32.shl
      i32.const -1
      i32.add
      tee_local $l0
      i32.const 146097
      i32.div_s
      tee_local $l2
      i32.const -146097
      i32.mul
      get_local $l0
      i32.add
      tee_local $l0
      i32.const 3
      i32.or
      i32.const 1461
      i32.div_s
      tee_local $l3
      get_local $l2
      i32.const 100
      i32.mul
      i32.add
      get_local $l0
      i32.const -4
      i32.and
      get_local $l3
      i32.const -1461
      i32.mul
      i32.add
      i32.const 7
      i32.add
      i32.const 2
      i32.shr_s
      i32.const 5
      i32.mul
      tee_local $l2
      i32.const -3
      i32.add
      tee_local $l0
      i32.const 1529
      i32.gt_s
      i32.add
      f64.convert_s/i32
      f64.store offset=1032
      i32.const 0
      i32.const 2
      i32.const -10
      get_local $l0
      i32.const 1530
      i32.lt_s
      select
      get_local $l0
      i32.const 153
      i32.div_s
      tee_local $l0
      i32.add
      f64.convert_s/i32
      f64.store offset=1040
      i32.const 0
      get_local $l2
      get_local $l0
      i32.const -153
      i32.mul
      i32.add
      i32.const 2
      i32.add
      i32.const 5
      i32.div_s
      f64.convert_s/i32
      f64.store offset=1048
      i32.const 1
      set_local $l0
    end
    get_local $l0)
  (func $decodeDate_B_Proc (export "decodeDate_B_Proc") (type $t3) (param $p0 f64) (result i32)
    (local $l0 i32) (local $l1 f64) (local $l2 f64)
    i32.const 0
    set_local $l0
    block $B0
      get_local $p0
      f64.const -0x1.c449d0368p+45 (;=-6.2162e+13;)
      f64.lt
      br_if $B0
      get_local $p0
      f64.const 0x1.50b7f99a8p+46 (;=9.25565e+13;)
      f64.gt
      br_if $B0
      i32.const 0
      get_local $p0
      f64.const 0x1.c449f9696p+45 (;=6.21621e+13;)
      f64.add
      tee_local $l1
      f64.const 0x1.4997p+26 (;=8.64e+07;)
      call $fmod
      tee_local $p0
      f64.const 0x1.f4p+9 (;=1000;)
      call $fmod
      f64.store offset=1144
      i32.const 0
      get_local $p0
      f64.const 0x1.b774p+21 (;=3.6e+06;)
      f64.div
      f64.trunc
      f64.store offset=1120
      i32.const 0
      get_local $l1
      f64.const 0x1.4997p+26 (;=8.64e+07;)
      f64.div
      f64.trunc
      tee_local $l1
      f64.const 0x1p+1 (;=2;)
      f64.add
      f64.const 0x1.cp+2 (;=7;)
      call $fmod
      f64.store offset=1088
      i32.const 0
      get_local $p0
      f64.const 0x1.d4cp+15 (;=60000;)
      f64.div
      f64.trunc
      f64.const 0x1.ep+5 (;=60;)
      call $fmod
      f64.store offset=1128
      i32.const 0
      get_local $p0
      f64.const 0x1.f4p+9 (;=1000;)
      f64.div
      f64.trunc
      f64.const 0x1.ep+5 (;=60;)
      call $fmod
      f64.store offset=1136
      i32.const 0
      get_local $l1
      f64.const 0x1p+2 (;=4;)
      f64.mul
      f64.const -0x1p+0 (;=-1;)
      f64.add
      tee_local $p0
      f64.const 0x1.1d588p+17 (;=146097;)
      f64.div
      f64.trunc
      tee_local $l1
      f64.const 0x1.9p+6 (;=100;)
      f64.mul
      get_local $p0
      get_local $l1
      f64.const 0x1.1d588p+17 (;=146097;)
      f64.mul
      f64.sub
      f64.const 0x1p-2 (;=0.25;)
      f64.mul
      f64.trunc
      f64.const 0x1p+2 (;=4;)
      f64.mul
      tee_local $p0
      f64.const 0x1.8p+1 (;=3;)
      f64.add
      f64.const 0x1.6d4p+10 (;=1461;)
      f64.div
      f64.trunc
      tee_local $l1
      f64.add
      tee_local $l2
      get_local $l2
      f64.const 0x1p+0 (;=1;)
      f64.add
      get_local $p0
      f64.const 0x1.cp+2 (;=7;)
      f64.add
      get_local $l1
      f64.const 0x1.6d4p+10 (;=1461;)
      f64.mul
      f64.sub
      f64.const 0x1p-2 (;=0.25;)
      f64.mul
      f64.trunc
      f64.const 0x1.4p+2 (;=5;)
      f64.mul
      tee_local $l1
      f64.const -0x1.8p+1 (;=-3;)
      f64.add
      f64.const 0x1.32p+7 (;=153;)
      f64.div
      f64.trunc
      tee_local $p0
      f64.const 0x1.4p+3 (;=10;)
      f64.lt
      tee_local $l0
      select
      f64.store offset=1096
      i32.const 0
      get_local $p0
      f64.const 0x1p+1 (;=2;)
      f64.const -0x1.4p+3 (;=-10;)
      get_local $l0
      select
      f64.add
      f64.store offset=1104
      i32.const 0
      get_local $l1
      f64.const 0x1p+1 (;=2;)
      f64.add
      get_local $p0
      f64.const 0x1.32p+7 (;=153;)
      f64.mul
      f64.sub
      f64.const 0x1.4p+2 (;=5;)
      f64.div
      f64.trunc
      f64.store offset=1112
      i32.const 1
      set_local $l0
    end
    get_local $l0)
  (func $decodeDate_C_Proc (export "decodeDate_C_Proc") (type $t3) (param $p0 f64) (result i32)
    (local $l0 i32) (local $l1 f64) (local $l2 i32) (local $l3 i32)
    i32.const 0
    set_local $l0
    block $B0
      get_local $p0
      f64.const -0x1.c449d0368p+45 (;=-6.2162e+13;)
      f64.lt
      br_if $B0
      get_local $p0
      f64.const 0x1.50b7f99a8p+46 (;=9.25565e+13;)
      f64.gt
      br_if $B0
      block $B1
        block $B2
          get_local $p0
          f64.const 0x1.c449f9696p+45 (;=6.21621e+13;)
          f64.add
          tee_local $p0
          f64.const 0x1.4997p+26 (;=8.64e+07;)
          call $fmod
          tee_local $l1
          f64.abs
          f64.const 0x1p+31 (;=2.14748e+09;)
          f64.lt
          br_if $B2
          i32.const -2147483648
          set_local $l0
          br $B1
        end
        get_local $l1
        i32.trunc_s/f64
        set_local $l0
      end
      i32.const 0
      get_local $l0
      i32.const 3600000
      i32.div_s
      i32.store offset=1168
      block $B3
        block $B4
          get_local $p0
          f64.const 0x1.4997p+26 (;=8.64e+07;)
          f64.div
          tee_local $p0
          f64.abs
          f64.const 0x1p+31 (;=2.14748e+09;)
          f64.lt
          br_if $B4
          i32.const -2147483648
          set_local $l2
          br $B3
        end
        get_local $p0
        i32.trunc_s/f64
        set_local $l2
      end
      i32.const 0
      get_local $l2
      i32.const 2
      i32.add
      i32.const 7
      i32.rem_s
      i32.store offset=1152
      i32.const 0
      get_local $l0
      i32.const 60000
      i32.div_s
      i32.const 60
      i32.rem_s
      i32.store offset=1172
      i32.const 0
      get_local $l0
      i32.const 1000
      i32.div_s
      tee_local $l3
      i32.const 60
      i32.rem_s
      i32.store offset=1176
      i32.const 0
      get_local $l0
      get_local $l3
      i32.const 1000
      i32.mul
      i32.sub
      i32.store offset=1180
      i32.const 0
      get_local $l2
      i32.const 2
      i32.shl
      i32.const -1
      i32.add
      tee_local $l0
      i32.const 146097
      i32.div_s
      tee_local $l2
      i32.const -146097
      i32.mul
      get_local $l0
      i32.add
      tee_local $l0
      i32.const 3
      i32.or
      i32.const 1461
      i32.div_s
      tee_local $l3
      get_local $l2
      i32.const 100
      i32.mul
      i32.add
      get_local $l0
      i32.const -4
      i32.and
      get_local $l3
      i32.const -1461
      i32.mul
      i32.add
      i32.const 7
      i32.add
      i32.const 2
      i32.shr_s
      i32.const 5
      i32.mul
      tee_local $l2
      i32.const -3
      i32.add
      tee_local $l0
      i32.const 1529
      i32.gt_s
      i32.add
      i32.store offset=1156
      i32.const 0
      i32.const 2
      i32.const -10
      get_local $l0
      i32.const 1530
      i32.lt_s
      select
      get_local $l0
      i32.const 153
      i32.div_s
      tee_local $l0
      i32.add
      i32.store offset=1160
      i32.const 0
      get_local $l2
      get_local $l0
      i32.const -153
      i32.mul
      i32.add
      i32.const 2
      i32.add
      i32.const 5
      i32.div_s
      i32.store offset=1164
      i32.const 1
      set_local $l0
    end
    get_local $l0)
  (table $T0 1 1 anyfunc)
  (memory $memory (export "memory") 2)
  (global $g0 (mut i32) (i32.const 66720))
  (global $__heap_base (export "__heap_base") i32 (i32.const 66720))
  (global $__data_end (export "__data_end") i32 (i32.const 1184))
  (data (i32.const 1024) "\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00"))
