; ModuleID = 'prog'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.treetable_s = type { %struct.rbnode_s*, %struct.rbnode_s*, i64, i32 (i8*, i8*)*, i8* (i64)*, i8* (i64, i64)*, void (i8*)* }
%struct.rbnode_s = type { i8*, i8*, i8, %struct.rbnode_s*, %struct.rbnode_s*, %struct.rbnode_s* }
%struct.treetable_conf_s = type { i32 (i8*, i8*)*, i8* (i64)*, i8* (i64, i64)*, void (i8*)* }

@.str = private unnamed_addr constant [5 x i8] c"key1\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"key2\00", align 1
@.str.2 = private unnamed_addr constant [30 x i8] c"*(int*)outputKey > currentKey\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"get_greater_node.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str.4 = private unnamed_addr constant [31 x i8] c"ccStat == CC_ERR_KEY_NOT_FOUND\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !32 {
entry:
  %retval = alloca i32, align 4
  %table = alloca %struct.treetable_s*, align 8
  %key1 = alloca i32, align 4
  %key2 = alloca i32, align 4
  %keyArray = alloca [2 x i32], align 4
  %value1 = alloca [10 x i8], align 1
  %value2 = alloca [10 x i8], align 1
  %outputKey = alloca i8*, align 8
  %i = alloca i32, align 4
  %currentKey = alloca i32, align 4
  %ccStat = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table, metadata !36, metadata !DIExpression()), !dbg !41
  %call = call i32 @treetable_new(%struct.treetable_s** %table), !dbg !42
  call void @llvm.dbg.declare(metadata i32* %key1, metadata !43, metadata !DIExpression()), !dbg !44
  call void @llvm.dbg.declare(metadata i32* %key2, metadata !45, metadata !DIExpression()), !dbg !46
  call void @llvm.dbg.declare(metadata [2 x i32]* %keyArray, metadata !47, metadata !DIExpression()), !dbg !51
  %arrayinit.begin = getelementptr inbounds [2 x i32], [2 x i32]* %keyArray, i64 0, i64 0, !dbg !52
  %0 = load i32, i32* %key1, align 4, !dbg !53
  store i32 %0, i32* %arrayinit.begin, align 4, !dbg !52
  %arrayinit.element = getelementptr inbounds i32, i32* %arrayinit.begin, i64 1, !dbg !52
  %1 = load i32, i32* %key2, align 4, !dbg !54
  store i32 %1, i32* %arrayinit.element, align 4, !dbg !52
  call void @llvm.dbg.declare(metadata [10 x i8]* %value1, metadata !55, metadata !DIExpression()), !dbg !60
  call void @llvm.dbg.declare(metadata [10 x i8]* %value2, metadata !61, metadata !DIExpression()), !dbg !62
  %2 = bitcast i32* %key1 to i8*, !dbg !63
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !64
  %3 = bitcast i32* %key2 to i8*, !dbg !65
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !66
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !67
  %5 = bitcast i32* %key1 to i8*, !dbg !68
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %value1, i64 0, i64 0, !dbg !69
  %call1 = call i32 @treetable_add(%struct.treetable_s* %4, i8* %5, i8* %arraydecay), !dbg !70
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !71
  %7 = bitcast i32* %key2 to i8*, !dbg !72
  %arraydecay2 = getelementptr inbounds [10 x i8], [10 x i8]* %value2, i64 0, i64 0, !dbg !73
  %call3 = call i32 @treetable_add(%struct.treetable_s* %6, i8* %7, i8* %arraydecay2), !dbg !74
  call void @llvm.dbg.declare(metadata i8** %outputKey, metadata !75, metadata !DIExpression()), !dbg !76
  call void @llvm.dbg.declare(metadata i32* %i, metadata !77, metadata !DIExpression()), !dbg !78
  store i32 0, i32* %i, align 4, !dbg !78
  br label %while.cond, !dbg !79

while.cond:                                       ; preds = %if.end13, %entry
  %8 = load i32, i32* %i, align 4, !dbg !80
  %cmp = icmp slt i32 %8, 2, !dbg !81
  br i1 %cmp, label %while.body, label %while.end, !dbg !79

while.body:                                       ; preds = %while.cond
  call void @llvm.dbg.declare(metadata i32* %currentKey, metadata !82, metadata !DIExpression()), !dbg !84
  %9 = load i32, i32* %i, align 4, !dbg !85
  %idxprom = sext i32 %9 to i64, !dbg !86
  %arrayidx = getelementptr inbounds [2 x i32], [2 x i32]* %keyArray, i64 0, i64 %idxprom, !dbg !86
  %10 = load i32, i32* %arrayidx, align 4, !dbg !86
  store i32 %10, i32* %currentKey, align 4, !dbg !84
  call void @llvm.dbg.declare(metadata i32* %ccStat, metadata !87, metadata !DIExpression()), !dbg !88
  %11 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !89
  %12 = bitcast i32* %currentKey to i8*, !dbg !90
  %call4 = call i32 @treetable_get_greater_than(%struct.treetable_s* %11, i8* %12, i8** %outputKey), !dbg !91
  store i32 %call4, i32* %ccStat, align 4, !dbg !88
  %13 = load i32, i32* %ccStat, align 4, !dbg !92
  %cmp5 = icmp eq i32 %13, 0, !dbg !94
  br i1 %cmp5, label %if.then, label %if.else8, !dbg !95

if.then:                                          ; preds = %while.body
  %14 = load i8*, i8** %outputKey, align 8, !dbg !96
  %15 = bitcast i8* %14 to i32*, !dbg !96
  %16 = load i32, i32* %15, align 4, !dbg !96
  %17 = load i32, i32* %currentKey, align 4, !dbg !96
  %cmp6 = icmp sgt i32 %16, %17, !dbg !96
  br i1 %cmp6, label %if.end13, label %if.else, !dbg !100

if.else:                                          ; preds = %if.then
  call void @__assert_fail(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 32, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !96
  unreachable, !dbg !96

if.else8:                                         ; preds = %while.body
  %18 = load i32, i32* %ccStat, align 4, !dbg !101
  %cmp9 = icmp eq i32 %18, 6, !dbg !101
  br i1 %cmp9, label %if.end13, label %if.else11, !dbg !105

if.else11:                                        ; preds = %if.else8
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 34, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !101
  unreachable, !dbg !101

if.end13:                                         ; preds = %if.else8, %if.then
  %19 = load i32, i32* %i, align 4, !dbg !106
  %inc = add nsw i32 %19, 1, !dbg !106
  store i32 %inc, i32* %i, align 4, !dbg !106
  br label %while.cond, !dbg !79, !llvm.loop !107

while.end:                                        ; preds = %while.cond
  %20 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !110
  call void @treetable_destroy(%struct.treetable_s* %20), !dbg !111
  %21 = load i32, i32* %retval, align 4, !dbg !112
  ret i32 %21, !dbg !112
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @cmp(i8* %e1, i8* %e2) #0 !dbg !113 {
entry:
  %retval = alloca i32, align 4
  %e1.addr = alloca i8*, align 8
  %e2.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %e1, i8** %e1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %e1.addr, metadata !118, metadata !DIExpression()), !dbg !119
  store i8* %e2, i8** %e2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %e2.addr, metadata !120, metadata !DIExpression()), !dbg !121
  call void @llvm.dbg.declare(metadata i32* %i, metadata !122, metadata !DIExpression()), !dbg !123
  %0 = load i8*, i8** %e1.addr, align 8, !dbg !124
  %1 = bitcast i8* %0 to i32*, !dbg !125
  %2 = load i32, i32* %1, align 4, !dbg !126
  store i32 %2, i32* %i, align 4, !dbg !123
  call void @llvm.dbg.declare(metadata i32* %j, metadata !127, metadata !DIExpression()), !dbg !128
  %3 = load i8*, i8** %e2.addr, align 8, !dbg !129
  %4 = bitcast i8* %3 to i32*, !dbg !130
  %5 = load i32, i32* %4, align 4, !dbg !131
  store i32 %5, i32* %j, align 4, !dbg !128
  %6 = load i32, i32* %i, align 4, !dbg !132
  %7 = load i32, i32* %j, align 4, !dbg !134
  %cmp = icmp slt i32 %6, %7, !dbg !135
  br i1 %cmp, label %if.then, label %if.end, !dbg !136

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !137
  br label %return, !dbg !137

if.end:                                           ; preds = %entry
  %8 = load i32, i32* %i, align 4, !dbg !138
  %9 = load i32, i32* %j, align 4, !dbg !140
  %cmp1 = icmp eq i32 %8, %9, !dbg !141
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !142

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !143
  br label %return, !dbg !143

if.end3:                                          ; preds = %if.end
  store i32 1, i32* %retval, align 4, !dbg !144
  br label %return, !dbg !144

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !145
  ret i32 %10, !dbg !145
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @treetable_conf_init(%struct.treetable_conf_s* %conf) #0 !dbg !146 {
entry:
  %conf.addr = alloca %struct.treetable_conf_s*, align 8
  store %struct.treetable_conf_s* %conf, %struct.treetable_conf_s** %conf.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s** %conf.addr, metadata !171, metadata !DIExpression()), !dbg !172
  %0 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !173
  %mem_alloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %0, i32 0, i32 1, !dbg !174
  store i8* (i64)* @malloc, i8* (i64)** %mem_alloc, align 8, !dbg !175
  %1 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !176
  %mem_calloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %1, i32 0, i32 2, !dbg !177
  store i8* (i64, i64)* @calloc, i8* (i64, i64)** %mem_calloc, align 8, !dbg !178
  %2 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !179
  %mem_free = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %2, i32 0, i32 3, !dbg !180
  store void (i8*)* @free, void (i8*)** %mem_free, align 8, !dbg !181
  %3 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !182
  %cmp = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %3, i32 0, i32 0, !dbg !183
  store i32 (i8*, i8*)* @cmp, i32 (i8*, i8*)** %cmp, align 8, !dbg !184
  ret void, !dbg !185
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_new(%struct.treetable_s** %tt) #0 !dbg !186 {
entry:
  %tt.addr = alloca %struct.treetable_s**, align 8
  %conf = alloca %struct.treetable_conf_s, align 8
  store %struct.treetable_s** %tt, %struct.treetable_s*** %tt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s*** %tt.addr, metadata !212, metadata !DIExpression()), !dbg !213
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s* %conf, metadata !214, metadata !DIExpression()), !dbg !215
  call void @treetable_conf_init(%struct.treetable_conf_s* %conf), !dbg !216
  %0 = load %struct.treetable_s**, %struct.treetable_s*** %tt.addr, align 8, !dbg !217
  %call = call i32 @treetable_new_conf(%struct.treetable_conf_s* %conf, %struct.treetable_s** %0), !dbg !218
  ret i32 %call, !dbg !219
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_new_conf(%struct.treetable_conf_s* %conf, %struct.treetable_s** %tt) #0 !dbg !220 {
entry:
  %retval = alloca i32, align 4
  %conf.addr = alloca %struct.treetable_conf_s*, align 8
  %tt.addr = alloca %struct.treetable_s**, align 8
  %table = alloca %struct.treetable_s*, align 8
  %sentinel = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_conf_s* %conf, %struct.treetable_conf_s** %conf.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s** %conf.addr, metadata !226, metadata !DIExpression()), !dbg !227
  store %struct.treetable_s** %tt, %struct.treetable_s*** %tt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s*** %tt.addr, metadata !228, metadata !DIExpression()), !dbg !229
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table, metadata !230, metadata !DIExpression()), !dbg !231
  %0 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !232
  %mem_calloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %0, i32 0, i32 2, !dbg !233
  %1 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc, align 8, !dbg !233
  %call = call i8* %1(i64 1, i64 56), !dbg !232
  %2 = bitcast i8* %call to %struct.treetable_s*, !dbg !232
  store %struct.treetable_s* %2, %struct.treetable_s** %table, align 8, !dbg !231
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !234
  %tobool = icmp ne %struct.treetable_s* %3, null, !dbg !234
  br i1 %tobool, label %if.end, label %if.then, !dbg !236

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !237
  br label %return, !dbg !237

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %sentinel, metadata !238, metadata !DIExpression()), !dbg !239
  %4 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !240
  %mem_calloc1 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %4, i32 0, i32 2, !dbg !241
  %5 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc1, align 8, !dbg !241
  %call2 = call i8* %5(i64 1, i64 48), !dbg !240
  %6 = bitcast i8* %call2 to %struct.rbnode_s*, !dbg !240
  store %struct.rbnode_s* %6, %struct.rbnode_s** %sentinel, align 8, !dbg !239
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !242
  %tobool3 = icmp ne %struct.rbnode_s* %7, null, !dbg !242
  br i1 %tobool3, label %if.end5, label %if.then4, !dbg !244

if.then4:                                         ; preds = %if.end
  %8 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !245
  %mem_free = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %8, i32 0, i32 3, !dbg !247
  %9 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !247
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !248
  %11 = bitcast %struct.treetable_s* %10 to i8*, !dbg !248
  call void %9(i8* %11), !dbg !245
  store i32 1, i32* %retval, align 4, !dbg !249
  br label %return, !dbg !249

if.end5:                                          ; preds = %if.end
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !250
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 2, !dbg !251
  store i8 1, i8* %color, align 8, !dbg !252
  %13 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !253
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %13, i32 0, i32 2, !dbg !254
  store i64 0, i64* %size, align 8, !dbg !255
  %14 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !256
  %cmp = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %14, i32 0, i32 0, !dbg !257
  %15 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp, align 8, !dbg !257
  %16 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !258
  %cmp6 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %16, i32 0, i32 3, !dbg !259
  store i32 (i8*, i8*)* %15, i32 (i8*, i8*)** %cmp6, align 8, !dbg !260
  %17 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !261
  %mem_alloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %17, i32 0, i32 1, !dbg !262
  %18 = load i8* (i64)*, i8* (i64)** %mem_alloc, align 8, !dbg !262
  %19 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !263
  %mem_alloc7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %19, i32 0, i32 4, !dbg !264
  store i8* (i64)* %18, i8* (i64)** %mem_alloc7, align 8, !dbg !265
  %20 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !266
  %mem_calloc8 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %20, i32 0, i32 2, !dbg !267
  %21 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc8, align 8, !dbg !267
  %22 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !268
  %mem_calloc9 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %22, i32 0, i32 5, !dbg !269
  store i8* (i64, i64)* %21, i8* (i64, i64)** %mem_calloc9, align 8, !dbg !270
  %23 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !271
  %mem_free10 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %23, i32 0, i32 3, !dbg !272
  %24 = load void (i8*)*, void (i8*)** %mem_free10, align 8, !dbg !272
  %25 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !273
  %mem_free11 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %25, i32 0, i32 6, !dbg !274
  store void (i8*)* %24, void (i8*)** %mem_free11, align 8, !dbg !275
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !276
  %27 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !277
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %27, i32 0, i32 0, !dbg !278
  store %struct.rbnode_s* %26, %struct.rbnode_s** %root, align 8, !dbg !279
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !280
  %29 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !281
  %sentinel12 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %29, i32 0, i32 1, !dbg !282
  store %struct.rbnode_s* %28, %struct.rbnode_s** %sentinel12, align 8, !dbg !283
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !284
  %31 = load %struct.treetable_s**, %struct.treetable_s*** %tt.addr, align 8, !dbg !285
  store %struct.treetable_s* %30, %struct.treetable_s** %31, align 8, !dbg !286
  store i32 0, i32* %retval, align 4, !dbg !287
  br label %return, !dbg !287

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %32 = load i32, i32* %retval, align 4, !dbg !288
  ret i32 %32, !dbg !288
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @treetable_destroy(%struct.treetable_s* %table) #0 !dbg !289 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !292, metadata !DIExpression()), !dbg !293
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !294
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !295
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !296
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !296
  call void @tree_destroy(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !297
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !298
  %mem_free = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %3, i32 0, i32 6, !dbg !299
  %4 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !299
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !300
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !301
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !301
  %7 = bitcast %struct.rbnode_s* %6 to i8*, !dbg !300
  call void %4(i8* %7), !dbg !298
  %8 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !302
  %mem_free1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %8, i32 0, i32 6, !dbg !303
  %9 = load void (i8*)*, void (i8*)** %mem_free1, align 8, !dbg !303
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !304
  %11 = bitcast %struct.treetable_s* %10 to i8*, !dbg !304
  call void %9(i8* %11), !dbg !302
  ret void, !dbg !305
}

; Function Attrs: noinline nounwind uwtable
define internal void @tree_destroy(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !306 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !309, metadata !DIExpression()), !dbg !310
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !311, metadata !DIExpression()), !dbg !312
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !313
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !315
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !316
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !316
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !317
  br i1 %cmp, label %return, label %if.end, !dbg !318

if.end:                                           ; preds = %entry
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !319
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !320
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !321
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !321
  call void @tree_destroy(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !322
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !323
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !324
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !325
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !325
  call void @tree_destroy(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !326
  %9 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !327
  %mem_free = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %9, i32 0, i32 6, !dbg !328
  %10 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !328
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !329
  %12 = bitcast %struct.rbnode_s* %11 to i8*, !dbg !329
  call void %10(i8* %12), !dbg !327
  br label %return, !dbg !330

return:                                           ; preds = %entry, %if.end
  ret void, !dbg !330
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get(%struct.treetable_s* %table, i8* %key, i8** %out) #0 !dbg !331 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %out.addr = alloca i8**, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !338, metadata !DIExpression()), !dbg !339
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !340, metadata !DIExpression()), !dbg !341
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !342, metadata !DIExpression()), !dbg !343
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !344, metadata !DIExpression()), !dbg !345
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !346
  %1 = load i8*, i8** %key.addr, align 8, !dbg !347
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !348
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !345
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !349
  %tobool = icmp ne %struct.rbnode_s* %2, null, !dbg !349
  br i1 %tobool, label %if.end, label %if.then, !dbg !351

if.then:                                          ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !352
  br label %return, !dbg !352

if.end:                                           ; preds = %entry
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !353
  %value = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %3, i32 0, i32 1, !dbg !354
  %4 = load i8*, i8** %value, align 8, !dbg !354
  %5 = load i8**, i8*** %out.addr, align 8, !dbg !355
  store i8* %4, i8** %5, align 8, !dbg !356
  store i32 0, i32* %retval, align 4, !dbg !357
  br label %return, !dbg !357

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !358
  ret i32 %6, !dbg !358
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %table, i8* %key) #0 !dbg !359 {
entry:
  %retval = alloca %struct.rbnode_s*, align 8
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %n = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  %cmp1 = alloca i32, align 4
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !362, metadata !DIExpression()), !dbg !363
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !364, metadata !DIExpression()), !dbg !365
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !366
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 2, !dbg !368
  %1 = load i64, i64* %size, align 8, !dbg !368
  %cmp = icmp eq i64 %1, 0, !dbg !369
  br i1 %cmp, label %if.then, label %if.end, !dbg !370

if.then:                                          ; preds = %entry
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !371
  br label %return, !dbg !371

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !372, metadata !DIExpression()), !dbg !373
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !374
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %2, i32 0, i32 0, !dbg !375
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !375
  store %struct.rbnode_s* %3, %struct.rbnode_s** %n, align 8, !dbg !373
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !376, metadata !DIExpression()), !dbg !377
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !378
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !379
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !379
  store %struct.rbnode_s* %5, %struct.rbnode_s** %s, align 8, !dbg !377
  call void @llvm.dbg.declare(metadata i32* %cmp1, metadata !380, metadata !DIExpression()), !dbg !381
  br label %do.body, !dbg !382

do.body:                                          ; preds = %do.cond, %if.end
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !383
  %cmp2 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %6, i32 0, i32 3, !dbg !385
  %7 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp2, align 8, !dbg !385
  %8 = load i8*, i8** %key.addr, align 8, !dbg !386
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !387
  %key3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 0, !dbg !388
  %10 = load i8*, i8** %key3, align 8, !dbg !388
  %call = call i32 %7(i8* %8, i8* %10), !dbg !383
  store i32 %call, i32* %cmp1, align 4, !dbg !389
  %11 = load i32, i32* %cmp1, align 4, !dbg !390
  %cmp4 = icmp slt i32 %11, 0, !dbg !392
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !393

if.then5:                                         ; preds = %do.body
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !394
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 4, !dbg !395
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !395
  store %struct.rbnode_s* %13, %struct.rbnode_s** %n, align 8, !dbg !396
  br label %do.cond, !dbg !397

if.else:                                          ; preds = %do.body
  %14 = load i32, i32* %cmp1, align 4, !dbg !398
  %cmp6 = icmp sgt i32 %14, 0, !dbg !400
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !401

if.then7:                                         ; preds = %if.else
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !402
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 5, !dbg !403
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !403
  store %struct.rbnode_s* %16, %struct.rbnode_s** %n, align 8, !dbg !404
  br label %do.cond

if.else8:                                         ; preds = %if.else
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !405
  store %struct.rbnode_s* %17, %struct.rbnode_s** %retval, align 8, !dbg !406
  br label %return, !dbg !406

do.cond:                                          ; preds = %if.then5, %if.then7
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !407
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !408
  %cmp11 = icmp ne %struct.rbnode_s* %18, %19, !dbg !409
  %20 = load i32, i32* %cmp1, align 4, !dbg !410
  %cmp12 = icmp ne i32 %20, 0, !dbg !410
  %21 = select i1 %cmp11, i1 %cmp12, i1 false, !dbg !410
  br i1 %21, label %do.body, label %do.end, !dbg !411, !llvm.loop !412

do.end:                                           ; preds = %do.cond
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !414
  br label %return, !dbg !414

return:                                           ; preds = %do.end, %if.else8, %if.then
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %retval, align 8, !dbg !415
  ret %struct.rbnode_s* %22, !dbg !415
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get_first_key(%struct.treetable_s* %table, i8** %out) #0 !dbg !416 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %out.addr = alloca i8**, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !419, metadata !DIExpression()), !dbg !420
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !421, metadata !DIExpression()), !dbg !422
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !423, metadata !DIExpression()), !dbg !424
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !425
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !426
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !427
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !427
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !428
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !424
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !429
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !431
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !432
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !432
  %cmp = icmp ne %struct.rbnode_s* %3, %5, !dbg !433
  br i1 %cmp, label %if.then, label %if.end, !dbg !434

if.then:                                          ; preds = %entry
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !435
  %key = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 0, !dbg !437
  %7 = load i8*, i8** %key, align 8, !dbg !437
  %8 = load i8**, i8*** %out.addr, align 8, !dbg !438
  store i8* %7, i8** %8, align 8, !dbg !439
  store i32 0, i32* %retval, align 4, !dbg !440
  br label %return, !dbg !440

if.end:                                           ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !441
  br label %return, !dbg !441

return:                                           ; preds = %if.end, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !442
  ret i32 %9, !dbg !442
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @tree_min(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !443 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !446, metadata !DIExpression()), !dbg !447
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !448, metadata !DIExpression()), !dbg !449
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !450, metadata !DIExpression()), !dbg !451
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !452
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !453
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !453
  store %struct.rbnode_s* %1, %struct.rbnode_s** %s, align 8, !dbg !451
  br label %while.cond, !dbg !454

while.cond:                                       ; preds = %while.body, %entry
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !455
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !456
  %cmp = icmp ne %struct.rbnode_s* %2, %3, !dbg !457
  br i1 %cmp, label %land.rhs, label %while.end, !dbg !458

land.rhs:                                         ; preds = %while.cond
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !459
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !460
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !460
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !461
  %cmp1 = icmp ne %struct.rbnode_s* %5, %6, !dbg !462
  br i1 %cmp1, label %while.body, label %while.end, !dbg !454

while.body:                                       ; preds = %land.rhs
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !463
  %left2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 4, !dbg !464
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %left2, align 8, !dbg !464
  store %struct.rbnode_s* %8, %struct.rbnode_s** %n.addr, align 8, !dbg !465
  br label %while.cond, !dbg !454, !llvm.loop !466

while.end:                                        ; preds = %while.cond, %land.rhs
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !467
  ret %struct.rbnode_s* %9, !dbg !468
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get_greater_than(%struct.treetable_s* %table, i8* %key, i8** %out) #0 !dbg !469 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %out.addr = alloca i8**, align 8
  %n = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !470, metadata !DIExpression()), !dbg !471
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !472, metadata !DIExpression()), !dbg !473
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !474, metadata !DIExpression()), !dbg !475
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !476, metadata !DIExpression()), !dbg !477
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !478
  %1 = load i8*, i8** %key.addr, align 8, !dbg !479
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !480
  store %struct.rbnode_s* %call, %struct.rbnode_s** %n, align 8, !dbg !477
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !481, metadata !DIExpression()), !dbg !482
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !483
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !484
  %call1 = call %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %2, %struct.rbnode_s* %3), !dbg !485
  store %struct.rbnode_s* %call1, %struct.rbnode_s** %s, align 8, !dbg !482
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !486
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !488
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !489
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !489
  %cmp = icmp ne %struct.rbnode_s* %4, %6, !dbg !490
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8
  %tobool = icmp ne %struct.rbnode_s* %7, null
  %or.cond = select i1 %cmp, i1 %tobool, i1 false, !dbg !491
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8
  %tobool3 = icmp ne %struct.rbnode_s* %8, null
  %or.cond1 = select i1 %or.cond, i1 %tobool3, i1 false, !dbg !491
  br i1 %or.cond1, label %if.then, label %if.end, !dbg !491

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !492
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 0, !dbg !494
  %10 = load i8*, i8** %key4, align 8, !dbg !494
  %11 = load i8**, i8*** %out.addr, align 8, !dbg !495
  store i8* %10, i8** %11, align 8, !dbg !496
  store i32 0, i32* %retval, align 4, !dbg !497
  br label %return, !dbg !497

if.end:                                           ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !498
  br label %return, !dbg !498

return:                                           ; preds = %if.end, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !499
  ret i32 %12, !dbg !499
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !500 {
entry:
  %retval = alloca %struct.rbnode_s*, align 8
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !501, metadata !DIExpression()), !dbg !502
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !503, metadata !DIExpression()), !dbg !504
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !505
  %cmp = icmp eq %struct.rbnode_s* %0, null, !dbg !507
  br i1 %cmp, label %if.then, label %if.end, !dbg !508

if.then:                                          ; preds = %entry
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !509
  br label %return, !dbg !509

if.end:                                           ; preds = %entry
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !510
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %1, i32 0, i32 5, !dbg !512
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !512
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !513
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %3, i32 0, i32 1, !dbg !514
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !514
  %cmp1 = icmp ne %struct.rbnode_s* %2, %4, !dbg !515
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !516

if.then2:                                         ; preds = %if.end
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !517
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !518
  %right3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 5, !dbg !519
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %right3, align 8, !dbg !519
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %5, %struct.rbnode_s* %7), !dbg !520
  store %struct.rbnode_s* %call, %struct.rbnode_s** %retval, align 8, !dbg !521
  br label %return, !dbg !521

if.end4:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !522, metadata !DIExpression()), !dbg !523
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !524
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %8, i32 0, i32 3, !dbg !525
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %parent, align 8, !dbg !525
  store %struct.rbnode_s* %9, %struct.rbnode_s** %y, align 8, !dbg !523
  br label %while.cond, !dbg !526

while.cond:                                       ; preds = %while.body, %if.end4
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !527
  %11 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !528
  %sentinel5 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %11, i32 0, i32 1, !dbg !529
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel5, align 8, !dbg !529
  %cmp6 = icmp ne %struct.rbnode_s* %10, %12, !dbg !530
  br i1 %cmp6, label %land.rhs, label %while.end, !dbg !531

land.rhs:                                         ; preds = %while.cond
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !532
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !533
  %right7 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 5, !dbg !534
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %right7, align 8, !dbg !534
  %cmp8 = icmp eq %struct.rbnode_s* %13, %15, !dbg !535
  br i1 %cmp8, label %while.body, label %while.end, !dbg !526

while.body:                                       ; preds = %land.rhs
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !536
  store %struct.rbnode_s* %16, %struct.rbnode_s** %x.addr, align 8, !dbg !538
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !539
  %parent9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 3, !dbg !540
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %parent9, align 8, !dbg !540
  store %struct.rbnode_s* %18, %struct.rbnode_s** %y, align 8, !dbg !541
  br label %while.cond, !dbg !526, !llvm.loop !542

while.end:                                        ; preds = %while.cond, %land.rhs
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !544
  store %struct.rbnode_s* %19, %struct.rbnode_s** %retval, align 8, !dbg !545
  br label %return, !dbg !545

return:                                           ; preds = %while.end, %if.then2, %if.then
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %retval, align 8, !dbg !546
  ret %struct.rbnode_s* %20, !dbg !546
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @treetable_size(%struct.treetable_s* %table) #0 !dbg !547 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !550, metadata !DIExpression()), !dbg !551
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !552
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 2, !dbg !553
  %1 = load i64, i64* %size, align 8, !dbg !553
  ret i64 %1, !dbg !554
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @treetable_contains_key(%struct.treetable_s* %table, i8* %key) #0 !dbg !555 {
entry:
  %retval = alloca i1, align 1
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !559, metadata !DIExpression()), !dbg !560
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !561, metadata !DIExpression()), !dbg !562
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !563, metadata !DIExpression()), !dbg !564
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !565
  %1 = load i8*, i8** %key.addr, align 8, !dbg !566
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !567
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !564
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !568
  %tobool = icmp ne %struct.rbnode_s* %2, null, !dbg !568
  br i1 %tobool, label %if.then, label %if.end, !dbg !570

if.then:                                          ; preds = %entry
  store i1 true, i1* %retval, align 1, !dbg !571
  br label %return, !dbg !571

if.end:                                           ; preds = %entry
  store i1 false, i1* %retval, align 1, !dbg !572
  br label %return, !dbg !572

return:                                           ; preds = %if.end, %if.then
  %3 = load i1, i1* %retval, align 1, !dbg !573
  ret i1 %3, !dbg !573
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @treetable_contains_value(%struct.treetable_s* %table, i8* %value) #0 !dbg !574 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %value.addr = alloca i8*, align 8
  %node = alloca %struct.rbnode_s*, align 8
  %o = alloca i64, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !577, metadata !DIExpression()), !dbg !578
  store i8* %value, i8** %value.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %value.addr, metadata !579, metadata !DIExpression()), !dbg !580
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !581, metadata !DIExpression()), !dbg !582
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !583
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !584
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !585
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !585
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !586
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !582
  call void @llvm.dbg.declare(metadata i64* %o, metadata !587, metadata !DIExpression()), !dbg !588
  store i64 0, i64* %o, align 8, !dbg !588
  br label %while.cond, !dbg !589

while.cond:                                       ; preds = %if.end, %entry
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !590
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !591
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !592
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !592
  %cmp = icmp ne %struct.rbnode_s* %3, %5, !dbg !593
  br i1 %cmp, label %while.body, label %while.end, !dbg !589

while.body:                                       ; preds = %while.cond
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !594
  %value1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 1, !dbg !597
  %7 = load i8*, i8** %value1, align 8, !dbg !597
  %8 = load i8*, i8** %value.addr, align 8, !dbg !598
  %cmp2 = icmp eq i8* %7, %8, !dbg !599
  br i1 %cmp2, label %if.then, label %if.end, !dbg !600

if.then:                                          ; preds = %while.body
  %9 = load i64, i64* %o, align 8, !dbg !601
  %inc = add i64 %9, 1, !dbg !601
  store i64 %inc, i64* %o, align 8, !dbg !601
  br label %if.end, !dbg !602

if.end:                                           ; preds = %if.then, %while.body
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !603
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !604
  %call3 = call %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %10, %struct.rbnode_s* %11), !dbg !605
  store %struct.rbnode_s* %call3, %struct.rbnode_s** %node, align 8, !dbg !606
  br label %while.cond, !dbg !589, !llvm.loop !607

while.end:                                        ; preds = %while.cond
  %12 = load i64, i64* %o, align 8, !dbg !609
  ret i64 %12, !dbg !610
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_add(%struct.treetable_s* %table, i8* %key, i8* %val) #0 !dbg !611 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %val.addr = alloca i8*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  %x = alloca %struct.rbnode_s*, align 8
  %cmp = alloca i32, align 4
  %n = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !614, metadata !DIExpression()), !dbg !615
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !616, metadata !DIExpression()), !dbg !617
  store i8* %val, i8** %val.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %val.addr, metadata !618, metadata !DIExpression()), !dbg !619
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !620, metadata !DIExpression()), !dbg !621
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !622
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !623
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !623
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !621
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x, metadata !624, metadata !DIExpression()), !dbg !625
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !626
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %2, i32 0, i32 0, !dbg !627
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !627
  store %struct.rbnode_s* %3, %struct.rbnode_s** %x, align 8, !dbg !625
  call void @llvm.dbg.declare(metadata i32* %cmp, metadata !628, metadata !DIExpression()), !dbg !629
  br label %while.cond, !dbg !630

while.cond:                                       ; preds = %if.end9, %entry
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !631
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !632
  %sentinel1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !633
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel1, align 8, !dbg !633
  %cmp2 = icmp ne %struct.rbnode_s* %4, %6, !dbg !634
  br i1 %cmp2, label %while.body, label %while.end, !dbg !630

while.body:                                       ; preds = %while.cond
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !635
  %cmp3 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 3, !dbg !637
  %8 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp3, align 8, !dbg !637
  %9 = load i8*, i8** %key.addr, align 8, !dbg !638
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !639
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 0, !dbg !640
  %11 = load i8*, i8** %key4, align 8, !dbg !640
  %call = call i32 %8(i8* %9, i8* %11), !dbg !635
  store i32 %call, i32* %cmp, align 4, !dbg !641
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !642
  store %struct.rbnode_s* %12, %struct.rbnode_s** %y, align 8, !dbg !643
  %13 = load i32, i32* %cmp, align 4, !dbg !644
  %cmp5 = icmp slt i32 %13, 0, !dbg !646
  br i1 %cmp5, label %if.then, label %if.else, !dbg !647

if.then:                                          ; preds = %while.body
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !648
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 4, !dbg !650
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !650
  store %struct.rbnode_s* %15, %struct.rbnode_s** %x, align 8, !dbg !651
  br label %if.end9, !dbg !652

if.else:                                          ; preds = %while.body
  %16 = load i32, i32* %cmp, align 4, !dbg !653
  %cmp6 = icmp sgt i32 %16, 0, !dbg !655
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !656

if.then7:                                         ; preds = %if.else
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !657
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 5, !dbg !659
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !659
  store %struct.rbnode_s* %18, %struct.rbnode_s** %x, align 8, !dbg !660
  br label %if.end9

if.else8:                                         ; preds = %if.else
  %19 = load i8*, i8** %val.addr, align 8, !dbg !661
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !663
  %value = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %20, i32 0, i32 1, !dbg !664
  store i8* %19, i8** %value, align 8, !dbg !665
  store i32 0, i32* %retval, align 4, !dbg !666
  br label %return, !dbg !666

if.end9:                                          ; preds = %if.then7, %if.then
  br label %while.cond, !dbg !630, !llvm.loop !667

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !669, metadata !DIExpression()), !dbg !670
  %21 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !671
  %mem_alloc = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %21, i32 0, i32 4, !dbg !672
  %22 = load i8* (i64)*, i8* (i64)** %mem_alloc, align 8, !dbg !672
  %call10 = call i8* %22(i64 48), !dbg !671
  %23 = bitcast i8* %call10 to %struct.rbnode_s*, !dbg !671
  store %struct.rbnode_s* %23, %struct.rbnode_s** %n, align 8, !dbg !670
  %24 = load i8*, i8** %val.addr, align 8, !dbg !673
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !674
  %value11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %25, i32 0, i32 1, !dbg !675
  store i8* %24, i8** %value11, align 8, !dbg !676
  %26 = load i8*, i8** %key.addr, align 8, !dbg !677
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !678
  %key12 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 0, !dbg !679
  store i8* %26, i8** %key12, align 8, !dbg !680
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !681
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !682
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !683
  store %struct.rbnode_s* %28, %struct.rbnode_s** %parent, align 8, !dbg !684
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !685
  %sentinel13 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %30, i32 0, i32 1, !dbg !686
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel13, align 8, !dbg !686
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !687
  %left14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 4, !dbg !688
  store %struct.rbnode_s* %31, %struct.rbnode_s** %left14, align 8, !dbg !689
  %33 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !690
  %sentinel15 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %33, i32 0, i32 1, !dbg !691
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel15, align 8, !dbg !691
  %35 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !692
  %right16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %35, i32 0, i32 5, !dbg !693
  store %struct.rbnode_s* %34, %struct.rbnode_s** %right16, align 8, !dbg !694
  %36 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !695
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %36, i32 0, i32 2, !dbg !696
  %37 = load i64, i64* %size, align 8, !dbg !697
  %inc = add i64 %37, 1, !dbg !697
  store i64 %inc, i64* %size, align 8, !dbg !697
  %38 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !698
  %39 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !700
  %sentinel17 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %39, i32 0, i32 1, !dbg !701
  %40 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel17, align 8, !dbg !701
  %cmp18 = icmp eq %struct.rbnode_s* %38, %40, !dbg !702
  br i1 %cmp18, label %if.then19, label %if.else21, !dbg !703

if.then19:                                        ; preds = %while.end
  %41 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !704
  %42 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !706
  %root20 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %42, i32 0, i32 0, !dbg !707
  store %struct.rbnode_s* %41, %struct.rbnode_s** %root20, align 8, !dbg !708
  %43 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !709
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %43, i32 0, i32 2, !dbg !710
  store i8 1, i8* %color, align 8, !dbg !711
  br label %if.end32, !dbg !712

if.else21:                                        ; preds = %while.end
  %44 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !713
  %color22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %44, i32 0, i32 2, !dbg !715
  store i8 0, i8* %color22, align 8, !dbg !716
  %45 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !717
  %cmp23 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %45, i32 0, i32 3, !dbg !719
  %46 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp23, align 8, !dbg !719
  %47 = load i8*, i8** %key.addr, align 8, !dbg !720
  %48 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !721
  %key24 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %48, i32 0, i32 0, !dbg !722
  %49 = load i8*, i8** %key24, align 8, !dbg !722
  %call25 = call i32 %46(i8* %47, i8* %49), !dbg !717
  %cmp26 = icmp slt i32 %call25, 0, !dbg !723
  br i1 %cmp26, label %if.then27, label %if.else29, !dbg !724

if.then27:                                        ; preds = %if.else21
  %50 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !725
  %51 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !727
  %left28 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %51, i32 0, i32 4, !dbg !728
  store %struct.rbnode_s* %50, %struct.rbnode_s** %left28, align 8, !dbg !729
  br label %if.end31, !dbg !730

if.else29:                                        ; preds = %if.else21
  %52 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !731
  %53 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !733
  %right30 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %53, i32 0, i32 5, !dbg !734
  store %struct.rbnode_s* %52, %struct.rbnode_s** %right30, align 8, !dbg !735
  br label %if.end31

if.end31:                                         ; preds = %if.else29, %if.then27
  %54 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !736
  %55 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !737
  call void @rebalance_after_insert(%struct.treetable_s* %54, %struct.rbnode_s* %55), !dbg !738
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then19
  store i32 0, i32* %retval, align 4, !dbg !739
  br label %return, !dbg !739

return:                                           ; preds = %if.end32, %if.else8
  %56 = load i32, i32* %retval, align 4, !dbg !740
  ret i32 %56, !dbg !740
}

; Function Attrs: noinline nounwind uwtable
define internal void @rebalance_after_insert(%struct.treetable_s* %table, %struct.rbnode_s* %z) #0 !dbg !741 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %z.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !742, metadata !DIExpression()), !dbg !743
  store %struct.rbnode_s* %z, %struct.rbnode_s** %z.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %z.addr, metadata !744, metadata !DIExpression()), !dbg !745
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !746, metadata !DIExpression()), !dbg !747
  br label %while.cond, !dbg !748

while.cond:                                       ; preds = %if.end69, %entry
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !749
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 3, !dbg !750
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %parent, align 8, !dbg !750
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %1, i32 0, i32 2, !dbg !751
  %2 = load i8, i8* %color, align 8, !dbg !751
  %conv = sext i8 %2 to i32, !dbg !749
  %cmp = icmp eq i32 %conv, 0, !dbg !752
  br i1 %cmp, label %while.body, label %while.end, !dbg !748

while.body:                                       ; preds = %while.cond
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !753
  %parent2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %3, i32 0, i32 3, !dbg !756
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %parent2, align 8, !dbg !756
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !757
  %parent3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 3, !dbg !758
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %parent3, align 8, !dbg !758
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 3, !dbg !759
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !759
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 4, !dbg !760
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !760
  %cmp5 = icmp eq %struct.rbnode_s* %4, %8, !dbg !761
  br i1 %cmp5, label %if.then, label %if.else36, !dbg !762

if.then:                                          ; preds = %while.body
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !763
  %parent7 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 3, !dbg !765
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %parent7, align 8, !dbg !765
  %parent8 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 3, !dbg !766
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %parent8, align 8, !dbg !766
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 5, !dbg !767
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !767
  store %struct.rbnode_s* %12, %struct.rbnode_s** %y, align 8, !dbg !768
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !769
  %color9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %13, i32 0, i32 2, !dbg !771
  %14 = load i8, i8* %color9, align 8, !dbg !771
  %conv10 = sext i8 %14 to i32, !dbg !769
  %cmp11 = icmp eq i32 %conv10, 0, !dbg !772
  br i1 %cmp11, label %if.then13, label %if.else, !dbg !773

if.then13:                                        ; preds = %if.then
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !774
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !776
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !776
  %color15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %16, i32 0, i32 2, !dbg !777
  store i8 1, i8* %color15, align 8, !dbg !778
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !779
  %color16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 2, !dbg !780
  store i8 1, i8* %color16, align 8, !dbg !781
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !782
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %18, i32 0, i32 3, !dbg !783
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !783
  %parent18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %19, i32 0, i32 3, !dbg !784
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %parent18, align 8, !dbg !784
  %color19 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %20, i32 0, i32 2, !dbg !785
  store i8 0, i8* %color19, align 8, !dbg !786
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !787
  %parent20 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %21, i32 0, i32 3, !dbg !788
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %parent20, align 8, !dbg !788
  %parent21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !789
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent21, align 8, !dbg !789
  store %struct.rbnode_s* %23, %struct.rbnode_s** %z.addr, align 8, !dbg !790
  br label %if.end69, !dbg !791

if.else:                                          ; preds = %if.then
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !792
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !795
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %25, i32 0, i32 3, !dbg !796
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %parent22, align 8, !dbg !796
  %right23 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 5, !dbg !797
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %right23, align 8, !dbg !797
  %cmp24 = icmp eq %struct.rbnode_s* %24, %27, !dbg !798
  br i1 %cmp24, label %if.then26, label %if.end, !dbg !799

if.then26:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !800
  %parent27 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %28, i32 0, i32 3, !dbg !802
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %parent27, align 8, !dbg !802
  store %struct.rbnode_s* %29, %struct.rbnode_s** %z.addr, align 8, !dbg !803
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !804
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !805
  call void @rotate_left(%struct.treetable_s* %30, %struct.rbnode_s* %31), !dbg !806
  br label %if.end, !dbg !807

if.end:                                           ; preds = %if.then26, %if.else
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !808
  %parent28 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 3, !dbg !809
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %parent28, align 8, !dbg !809
  %color29 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %33, i32 0, i32 2, !dbg !810
  store i8 1, i8* %color29, align 8, !dbg !811
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !812
  %parent30 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !813
  %35 = load %struct.rbnode_s*, %struct.rbnode_s** %parent30, align 8, !dbg !813
  %parent31 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %35, i32 0, i32 3, !dbg !814
  %36 = load %struct.rbnode_s*, %struct.rbnode_s** %parent31, align 8, !dbg !814
  %color32 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %36, i32 0, i32 2, !dbg !815
  store i8 0, i8* %color32, align 8, !dbg !816
  %37 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !817
  %38 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !818
  %parent33 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %38, i32 0, i32 3, !dbg !819
  %39 = load %struct.rbnode_s*, %struct.rbnode_s** %parent33, align 8, !dbg !819
  %parent34 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %39, i32 0, i32 3, !dbg !820
  %40 = load %struct.rbnode_s*, %struct.rbnode_s** %parent34, align 8, !dbg !820
  call void @rotate_right(%struct.treetable_s* %37, %struct.rbnode_s* %40), !dbg !821
  br label %if.end69

if.else36:                                        ; preds = %while.body
  %41 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !822
  %parent37 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %41, i32 0, i32 3, !dbg !824
  %42 = load %struct.rbnode_s*, %struct.rbnode_s** %parent37, align 8, !dbg !824
  %parent38 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %42, i32 0, i32 3, !dbg !825
  %43 = load %struct.rbnode_s*, %struct.rbnode_s** %parent38, align 8, !dbg !825
  %left39 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %43, i32 0, i32 4, !dbg !826
  %44 = load %struct.rbnode_s*, %struct.rbnode_s** %left39, align 8, !dbg !826
  store %struct.rbnode_s* %44, %struct.rbnode_s** %y, align 8, !dbg !827
  %45 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !828
  %color40 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %45, i32 0, i32 2, !dbg !830
  %46 = load i8, i8* %color40, align 8, !dbg !830
  %conv41 = sext i8 %46 to i32, !dbg !828
  %cmp42 = icmp eq i32 %conv41, 0, !dbg !831
  br i1 %cmp42, label %if.then44, label %if.else53, !dbg !832

if.then44:                                        ; preds = %if.else36
  %47 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !833
  %parent45 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %47, i32 0, i32 3, !dbg !835
  %48 = load %struct.rbnode_s*, %struct.rbnode_s** %parent45, align 8, !dbg !835
  %color46 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %48, i32 0, i32 2, !dbg !836
  store i8 1, i8* %color46, align 8, !dbg !837
  %49 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !838
  %color47 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %49, i32 0, i32 2, !dbg !839
  store i8 1, i8* %color47, align 8, !dbg !840
  %50 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !841
  %parent48 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %50, i32 0, i32 3, !dbg !842
  %51 = load %struct.rbnode_s*, %struct.rbnode_s** %parent48, align 8, !dbg !842
  %parent49 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %51, i32 0, i32 3, !dbg !843
  %52 = load %struct.rbnode_s*, %struct.rbnode_s** %parent49, align 8, !dbg !843
  %color50 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %52, i32 0, i32 2, !dbg !844
  store i8 0, i8* %color50, align 8, !dbg !845
  %53 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !846
  %parent51 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %53, i32 0, i32 3, !dbg !847
  %54 = load %struct.rbnode_s*, %struct.rbnode_s** %parent51, align 8, !dbg !847
  %parent52 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %54, i32 0, i32 3, !dbg !848
  %55 = load %struct.rbnode_s*, %struct.rbnode_s** %parent52, align 8, !dbg !848
  store %struct.rbnode_s* %55, %struct.rbnode_s** %z.addr, align 8, !dbg !849
  br label %if.end69, !dbg !850

if.else53:                                        ; preds = %if.else36
  %56 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !851
  %57 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !854
  %parent54 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %57, i32 0, i32 3, !dbg !855
  %58 = load %struct.rbnode_s*, %struct.rbnode_s** %parent54, align 8, !dbg !855
  %left55 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %58, i32 0, i32 4, !dbg !856
  %59 = load %struct.rbnode_s*, %struct.rbnode_s** %left55, align 8, !dbg !856
  %cmp56 = icmp eq %struct.rbnode_s* %56, %59, !dbg !857
  br i1 %cmp56, label %if.then58, label %if.end60, !dbg !858

if.then58:                                        ; preds = %if.else53
  %60 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !859
  %parent59 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %60, i32 0, i32 3, !dbg !861
  %61 = load %struct.rbnode_s*, %struct.rbnode_s** %parent59, align 8, !dbg !861
  store %struct.rbnode_s* %61, %struct.rbnode_s** %z.addr, align 8, !dbg !862
  %62 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !863
  %63 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !864
  call void @rotate_right(%struct.treetable_s* %62, %struct.rbnode_s* %63), !dbg !865
  br label %if.end60, !dbg !866

if.end60:                                         ; preds = %if.then58, %if.else53
  %64 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !867
  %parent61 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %64, i32 0, i32 3, !dbg !868
  %65 = load %struct.rbnode_s*, %struct.rbnode_s** %parent61, align 8, !dbg !868
  %color62 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %65, i32 0, i32 2, !dbg !869
  store i8 1, i8* %color62, align 8, !dbg !870
  %66 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !871
  %parent63 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %66, i32 0, i32 3, !dbg !872
  %67 = load %struct.rbnode_s*, %struct.rbnode_s** %parent63, align 8, !dbg !872
  %parent64 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %67, i32 0, i32 3, !dbg !873
  %68 = load %struct.rbnode_s*, %struct.rbnode_s** %parent64, align 8, !dbg !873
  %color65 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %68, i32 0, i32 2, !dbg !874
  store i8 0, i8* %color65, align 8, !dbg !875
  %69 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !876
  %70 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !877
  %parent66 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %70, i32 0, i32 3, !dbg !878
  %71 = load %struct.rbnode_s*, %struct.rbnode_s** %parent66, align 8, !dbg !878
  %parent67 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %71, i32 0, i32 3, !dbg !879
  %72 = load %struct.rbnode_s*, %struct.rbnode_s** %parent67, align 8, !dbg !879
  call void @rotate_left(%struct.treetable_s* %69, %struct.rbnode_s* %72), !dbg !880
  br label %if.end69

if.end69:                                         ; preds = %if.then44, %if.end60, %if.then13, %if.end
  br label %while.cond, !dbg !748, !llvm.loop !881

while.end:                                        ; preds = %while.cond
  %73 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !883
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %73, i32 0, i32 0, !dbg !884
  %74 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !884
  %color70 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %74, i32 0, i32 2, !dbg !885
  store i8 1, i8* %color70, align 8, !dbg !886
  ret void, !dbg !887
}

; Function Attrs: noinline nounwind uwtable
define internal void @rotate_left(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !888 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !889, metadata !DIExpression()), !dbg !890
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !891, metadata !DIExpression()), !dbg !892
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !893, metadata !DIExpression()), !dbg !894
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !895
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 5, !dbg !896
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !896
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !894
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !897
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 4, !dbg !898
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !898
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !899
  %right1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 5, !dbg !900
  store %struct.rbnode_s* %3, %struct.rbnode_s** %right1, align 8, !dbg !901
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !902
  %left2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 4, !dbg !904
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %left2, align 8, !dbg !904
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !905
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 1, !dbg !906
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !906
  %cmp = icmp ne %struct.rbnode_s* %6, %8, !dbg !907
  br i1 %cmp, label %if.then, label %if.end, !dbg !908

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !909
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !910
  %left3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 4, !dbg !911
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %left3, align 8, !dbg !911
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 3, !dbg !912
  store %struct.rbnode_s* %9, %struct.rbnode_s** %parent, align 8, !dbg !913
  br label %if.end, !dbg !910

if.end:                                           ; preds = %if.then, %entry
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !914
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 3, !dbg !915
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !915
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !916
  %parent5 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 3, !dbg !917
  store %struct.rbnode_s* %13, %struct.rbnode_s** %parent5, align 8, !dbg !918
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !919
  %parent6 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !921
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent6, align 8, !dbg !921
  %17 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !922
  %sentinel7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !923
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel7, align 8, !dbg !923
  %cmp8 = icmp eq %struct.rbnode_s* %16, %18, !dbg !924
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !925

if.then9:                                         ; preds = %if.end
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !926
  %20 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !927
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %20, i32 0, i32 0, !dbg !928
  store %struct.rbnode_s* %19, %struct.rbnode_s** %root, align 8, !dbg !929
  br label %if.end20, !dbg !927

if.else:                                          ; preds = %if.end
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !930
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !932
  %parent10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !933
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent10, align 8, !dbg !933
  %left11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %23, i32 0, i32 4, !dbg !934
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %left11, align 8, !dbg !934
  %cmp12 = icmp eq %struct.rbnode_s* %21, %24, !dbg !935
  br i1 %cmp12, label %if.then13, label %if.else16, !dbg !936

if.then13:                                        ; preds = %if.else
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !937
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !938
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 3, !dbg !939
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !939
  %left15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 4, !dbg !940
  store %struct.rbnode_s* %25, %struct.rbnode_s** %left15, align 8, !dbg !941
  br label %if.end20, !dbg !938

if.else16:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !942
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !943
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !944
  %30 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !944
  %right18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %30, i32 0, i32 5, !dbg !945
  store %struct.rbnode_s* %28, %struct.rbnode_s** %right18, align 8, !dbg !946
  br label %if.end20

if.end20:                                         ; preds = %if.then13, %if.else16, %if.then9
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !947
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !948
  %left21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 4, !dbg !949
  store %struct.rbnode_s* %31, %struct.rbnode_s** %left21, align 8, !dbg !950
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !951
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !952
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !953
  store %struct.rbnode_s* %33, %struct.rbnode_s** %parent22, align 8, !dbg !954
  ret void, !dbg !955
}

; Function Attrs: noinline nounwind uwtable
define internal void @rotate_right(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !956 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !957, metadata !DIExpression()), !dbg !958
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !959, metadata !DIExpression()), !dbg !960
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !961, metadata !DIExpression()), !dbg !962
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !963
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 4, !dbg !964
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !964
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !962
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !965
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 5, !dbg !966
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !966
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !967
  %left1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !968
  store %struct.rbnode_s* %3, %struct.rbnode_s** %left1, align 8, !dbg !969
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !970
  %right2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 5, !dbg !972
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %right2, align 8, !dbg !972
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !973
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 1, !dbg !974
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !974
  %cmp = icmp ne %struct.rbnode_s* %6, %8, !dbg !975
  br i1 %cmp, label %if.then, label %if.end, !dbg !976

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !977
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !978
  %right3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 5, !dbg !979
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %right3, align 8, !dbg !979
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 3, !dbg !980
  store %struct.rbnode_s* %9, %struct.rbnode_s** %parent, align 8, !dbg !981
  br label %if.end, !dbg !978

if.end:                                           ; preds = %if.then, %entry
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !982
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 3, !dbg !983
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !983
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !984
  %parent5 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 3, !dbg !985
  store %struct.rbnode_s* %13, %struct.rbnode_s** %parent5, align 8, !dbg !986
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !987
  %parent6 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !989
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent6, align 8, !dbg !989
  %17 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !990
  %sentinel7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !991
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel7, align 8, !dbg !991
  %cmp8 = icmp eq %struct.rbnode_s* %16, %18, !dbg !992
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !993

if.then9:                                         ; preds = %if.end
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !994
  %20 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !995
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %20, i32 0, i32 0, !dbg !996
  store %struct.rbnode_s* %19, %struct.rbnode_s** %root, align 8, !dbg !997
  br label %if.end20, !dbg !995

if.else:                                          ; preds = %if.end
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !998
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1000
  %parent10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !1001
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent10, align 8, !dbg !1001
  %right11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %23, i32 0, i32 5, !dbg !1002
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %right11, align 8, !dbg !1002
  %cmp12 = icmp eq %struct.rbnode_s* %21, %24, !dbg !1003
  br i1 %cmp12, label %if.then13, label %if.else16, !dbg !1004

if.then13:                                        ; preds = %if.else
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1005
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1006
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 3, !dbg !1007
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !1007
  %right15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 5, !dbg !1008
  store %struct.rbnode_s* %25, %struct.rbnode_s** %right15, align 8, !dbg !1009
  br label %if.end20, !dbg !1006

if.else16:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1010
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1011
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !1012
  %30 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !1012
  %left18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %30, i32 0, i32 4, !dbg !1013
  store %struct.rbnode_s* %28, %struct.rbnode_s** %left18, align 8, !dbg !1014
  br label %if.end20

if.end20:                                         ; preds = %if.then13, %if.else16, %if.then9
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1015
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1016
  %right21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 5, !dbg !1017
  store %struct.rbnode_s* %31, %struct.rbnode_s** %right21, align 8, !dbg !1018
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1019
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1020
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !1021
  store %struct.rbnode_s* %33, %struct.rbnode_s** %parent22, align 8, !dbg !1022
  ret void, !dbg !1023
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @balanced(%struct.treetable_s* %t) #0 !dbg !1024 {
entry:
  %t.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1027, metadata !DIExpression()), !dbg !1028
  %0 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1029
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1030
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !1031
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !1031
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 4, !dbg !1032
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1032
  %call = call i32 @height(%struct.treetable_s* %0, %struct.rbnode_s* %3), !dbg !1033
  %4 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1034
  %5 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1035
  %root1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 0, !dbg !1036
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %root1, align 8, !dbg !1036
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 5, !dbg !1037
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1037
  %call2 = call i32 @height(%struct.treetable_s* %4, %struct.rbnode_s* %7), !dbg !1038
  %sub = sub nsw i32 %call, %call2, !dbg !1039
  %call3 = call i32 @abs(i32 %sub) #7, !dbg !1040
  %cmp = icmp sle i32 %call3, 1, !dbg !1041
  %conv = zext i1 %cmp to i32, !dbg !1041
  ret i32 %conv, !dbg !1042
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @height(%struct.treetable_s* %t, %struct.rbnode_s* %node) #0 !dbg !1043 {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca %struct.treetable_s*, align 8
  %node.addr = alloca %struct.rbnode_s*, align 8
  %leftHeight = alloca i32, align 4
  %rightHeight = alloca i32, align 4
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1046, metadata !DIExpression()), !dbg !1047
  store %struct.rbnode_s* %node, %struct.rbnode_s** %node.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node.addr, metadata !1048, metadata !DIExpression()), !dbg !1049
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1050
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1052
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !1053
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1053
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !1054
  br i1 %cmp, label %if.then, label %if.end, !dbg !1055

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1056
  br label %return, !dbg !1056

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %leftHeight, metadata !1057, metadata !DIExpression()), !dbg !1058
  %3 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1059
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1060
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !1061
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1061
  %call = call i32 @height(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !1062
  store i32 %call, i32* %leftHeight, align 4, !dbg !1058
  call void @llvm.dbg.declare(metadata i32* %rightHeight, metadata !1063, metadata !DIExpression()), !dbg !1064
  %6 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1065
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1066
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !1067
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1067
  %call1 = call i32 @height(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !1068
  store i32 %call1, i32* %rightHeight, align 4, !dbg !1064
  %9 = load i32, i32* %leftHeight, align 4, !dbg !1069
  %10 = load i32, i32* %rightHeight, align 4, !dbg !1070
  %cmp2 = icmp sgt i32 %9, %10, !dbg !1071
  %11 = load i32, i32* %leftHeight, align 4, !dbg !1069
  %add = add nsw i32 %11, 1, !dbg !1069
  %12 = load i32, i32* %rightHeight, align 4, !dbg !1069
  %add3 = add nsw i32 %12, 1, !dbg !1069
  %cond = select i1 %cmp2, i32 %add, i32 %add3, !dbg !1069
  store i32 %cond, i32* %retval, align 4, !dbg !1072
  br label %return, !dbg !1072

return:                                           ; preds = %if.end, %if.then
  %13 = load i32, i32* %retval, align 4, !dbg !1073
  ret i32 %13, !dbg !1073
}

; Function Attrs: nounwind readnone willreturn
declare dso_local i32 @abs(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @sorted(%struct.treetable_s* %t) #0 !dbg !1074 {
entry:
  %t.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1075, metadata !DIExpression()), !dbg !1076
  %0 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1077
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1078
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !1079
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !1079
  %call = call i32 @isSorted(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !1080
  ret i32 %call, !dbg !1081
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @isSorted(%struct.treetable_s* %t, %struct.rbnode_s* %node) #0 !dbg !1082 {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca %struct.treetable_s*, align 8
  %node.addr = alloca %struct.rbnode_s*, align 8
  %maxLeft = alloca %struct.rbnode_s*, align 8
  %minRight = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1083, metadata !DIExpression()), !dbg !1084
  store %struct.rbnode_s* %node, %struct.rbnode_s** %node.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node.addr, metadata !1085, metadata !DIExpression()), !dbg !1086
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1087
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1089
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !1090
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1090
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !1091
  br i1 %cmp, label %if.then, label %if.end, !dbg !1092

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !1093
  br label %return, !dbg !1093

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %maxLeft, metadata !1094, metadata !DIExpression()), !dbg !1095
  %3 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1096
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1097
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !1098
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1098
  %call = call %struct.rbnode_s* @tree_max(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !1099
  store %struct.rbnode_s* %call, %struct.rbnode_s** %maxLeft, align 8, !dbg !1095
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %minRight, metadata !1100, metadata !DIExpression()), !dbg !1101
  %6 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1102
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1103
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !1104
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1104
  %call1 = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !1105
  store %struct.rbnode_s* %call1, %struct.rbnode_s** %minRight, align 8, !dbg !1101
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %maxLeft, align 8, !dbg !1106
  %10 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1108
  %sentinel2 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %10, i32 0, i32 1, !dbg !1109
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel2, align 8, !dbg !1109
  %cmp3 = icmp ne %struct.rbnode_s* %9, %11, !dbg !1110
  br i1 %cmp3, label %land.lhs.true, label %lor.lhs.false, !dbg !1111

land.lhs.true:                                    ; preds = %if.end
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1112
  %key = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 0, !dbg !1113
  %13 = load i8*, i8** %key, align 8, !dbg !1113
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %maxLeft, align 8, !dbg !1114
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 0, !dbg !1115
  %15 = load i8*, i8** %key4, align 8, !dbg !1115
  %cmp5 = icmp ult i8* %13, %15, !dbg !1116
  br i1 %cmp5, label %if.then12, label %lor.lhs.false, !dbg !1117

lor.lhs.false:                                    ; preds = %land.lhs.true, %if.end
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %minRight, align 8, !dbg !1118
  %17 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1119
  %sentinel6 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !1120
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel6, align 8, !dbg !1120
  %cmp7 = icmp ne %struct.rbnode_s* %16, %18, !dbg !1121
  br i1 %cmp7, label %land.lhs.true8, label %if.end13, !dbg !1122

land.lhs.true8:                                   ; preds = %lor.lhs.false
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1123
  %key9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %19, i32 0, i32 0, !dbg !1124
  %20 = load i8*, i8** %key9, align 8, !dbg !1124
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %minRight, align 8, !dbg !1125
  %key10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %21, i32 0, i32 0, !dbg !1126
  %22 = load i8*, i8** %key10, align 8, !dbg !1126
  %cmp11 = icmp ugt i8* %20, %22, !dbg !1127
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !1128

if.then12:                                        ; preds = %land.lhs.true8, %land.lhs.true
  store i32 0, i32* %retval, align 4, !dbg !1129
  br label %return, !dbg !1129

if.end13:                                         ; preds = %land.lhs.true8, %lor.lhs.false
  %23 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1130
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1131
  %left14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %24, i32 0, i32 4, !dbg !1132
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %left14, align 8, !dbg !1132
  %call15 = call i32 @isSorted(%struct.treetable_s* %23, %struct.rbnode_s* %25), !dbg !1133
  %tobool = icmp ne i32 %call15, 0, !dbg !1133
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !1134

land.rhs:                                         ; preds = %if.end13
  %26 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1135
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1136
  %right16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 5, !dbg !1137
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %right16, align 8, !dbg !1137
  %call17 = call i32 @isSorted(%struct.treetable_s* %26, %struct.rbnode_s* %28), !dbg !1138
  %tobool18 = icmp ne i32 %call17, 0, !dbg !1134
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end13
  %29 = phi i1 [ false, %if.end13 ], [ %tobool18, %land.rhs ], !dbg !1139
  %land.ext = zext i1 %29 to i32, !dbg !1134
  store i32 %land.ext, i32* %retval, align 4, !dbg !1140
  br label %return, !dbg !1140

return:                                           ; preds = %land.end, %if.then12, %if.then
  %30 = load i32, i32* %retval, align 4, !dbg !1141
  ret i32 %30, !dbg !1141
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @tree_max(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !1142 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !1143, metadata !DIExpression()), !dbg !1144
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !1145, metadata !DIExpression()), !dbg !1146
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !1147, metadata !DIExpression()), !dbg !1148
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !1149
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !1150
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1150
  store %struct.rbnode_s* %1, %struct.rbnode_s** %s, align 8, !dbg !1148
  br label %while.cond, !dbg !1151

while.cond:                                       ; preds = %while.body, %entry
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1152
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 5, !dbg !1153
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1153
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !1154
  %cmp = icmp ne %struct.rbnode_s* %3, %4, !dbg !1155
  br i1 %cmp, label %while.body, label %while.end, !dbg !1151

while.body:                                       ; preds = %while.cond
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1156
  %right1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 5, !dbg !1157
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %right1, align 8, !dbg !1157
  store %struct.rbnode_s* %6, %struct.rbnode_s** %n.addr, align 8, !dbg !1158
  br label %while.cond, !dbg !1151, !llvm.loop !1159

while.end:                                        ; preds = %while.cond
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1160
  ret %struct.rbnode_s* %7, !dbg !1161
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0, !19}
!llvm.ident = !{!26, !26}
!llvm.module.flags = !{!27, !28, !29, !30, !31}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !16, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "get_greater_node.c", directory: "/home/klee/klee_src/examples/trabalho2/Ex2SymbTestSuite")
!2 = !{!3}
!3 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cc_stat", file: !4, line: 29, baseType: !5, size: 32, elements: !6)
!4 = !DIFile(filename: "./../common.h", directory: "/home/klee/klee_src/examples/trabalho2/Ex2SymbTestSuite")
!5 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!6 = !{!7, !8, !9, !10, !11, !12, !13, !14, !15}
!7 = !DIEnumerator(name: "CC_OK", value: 0)
!8 = !DIEnumerator(name: "CC_ERR_ALLOC", value: 1)
!9 = !DIEnumerator(name: "CC_ERR_INVALID_CAPACITY", value: 2)
!10 = !DIEnumerator(name: "CC_ERR_INVALID_RANGE", value: 3)
!11 = !DIEnumerator(name: "CC_ERR_MAX_CAPACITY", value: 4)
!12 = !DIEnumerator(name: "CC_ERR_KEY_NOT_FOUND", value: 6)
!13 = !DIEnumerator(name: "CC_ERR_VALUE_NOT_FOUND", value: 7)
!14 = !DIEnumerator(name: "CC_ERR_OUT_OF_RANGE", value: 8)
!15 = !DIEnumerator(name: "CC_ITER_END", value: 9)
!16 = !{!17}
!17 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !18, size: 64)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = distinct !DICompileUnit(language: DW_LANG_C99, file: !20, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !21, retainedTypes: !24, splitDebugInlining: false, nameTableKind: None)
!20 = !DIFile(filename: "treetable.c", directory: "/home/klee/klee_src/examples/trabalho2")
!21 = !{!22}
!22 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cc_stat", file: !23, line: 29, baseType: !5, size: 32, elements: !6)
!23 = !DIFile(filename: "./common.h", directory: "/home/klee/klee_src/examples/trabalho2")
!24 = !{!17, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!26 = !{!"clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)"}
!27 = !{i32 7, !"Dwarf Version", i32 4}
!28 = !{i32 2, !"Debug Info Version", i32 3}
!29 = !{i32 1, !"wchar_size", i32 4}
!30 = !{i32 7, !"uwtable", i32 1}
!31 = !{i32 7, !"frame-pointer", i32 2}
!32 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !33, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !35)
!33 = !DISubroutineType(types: !34)
!34 = !{!18}
!35 = !{}
!36 = !DILocalVariable(name: "table", scope: !32, file: !1, line: 8, type: !37)
!37 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !38, size: 64)
!38 = !DIDerivedType(tag: DW_TAG_typedef, name: "TreeTable", file: !39, line: 30, baseType: !40)
!39 = !DIFile(filename: "./../treetable.h", directory: "/home/klee/klee_src/examples/trabalho2/Ex2SymbTestSuite")
!40 = !DICompositeType(tag: DW_TAG_structure_type, name: "treetable_s", file: !39, line: 30, flags: DIFlagFwdDecl)
!41 = !DILocation(line: 8, column: 16, scope: !32)
!42 = !DILocation(line: 9, column: 5, scope: !32)
!43 = !DILocalVariable(name: "key1", scope: !32, file: !1, line: 11, type: !18)
!44 = !DILocation(line: 11, column: 9, scope: !32)
!45 = !DILocalVariable(name: "key2", scope: !32, file: !1, line: 12, type: !18)
!46 = !DILocation(line: 12, column: 9, scope: !32)
!47 = !DILocalVariable(name: "keyArray", scope: !32, file: !1, line: 14, type: !48)
!48 = !DICompositeType(tag: DW_TAG_array_type, baseType: !18, size: 64, elements: !49)
!49 = !{!50}
!50 = !DISubrange(count: 2)
!51 = !DILocation(line: 14, column: 9, scope: !32)
!52 = !DILocation(line: 14, column: 22, scope: !32)
!53 = !DILocation(line: 14, column: 23, scope: !32)
!54 = !DILocation(line: 14, column: 29, scope: !32)
!55 = !DILocalVariable(name: "value1", scope: !32, file: !1, line: 16, type: !56)
!56 = !DICompositeType(tag: DW_TAG_array_type, baseType: !57, size: 80, elements: !58)
!57 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!58 = !{!59}
!59 = !DISubrange(count: 10)
!60 = !DILocation(line: 16, column: 10, scope: !32)
!61 = !DILocalVariable(name: "value2", scope: !32, file: !1, line: 17, type: !56)
!62 = !DILocation(line: 17, column: 10, scope: !32)
!63 = !DILocation(line: 19, column: 24, scope: !32)
!64 = !DILocation(line: 19, column: 5, scope: !32)
!65 = !DILocation(line: 20, column: 24, scope: !32)
!66 = !DILocation(line: 20, column: 5, scope: !32)
!67 = !DILocation(line: 22, column: 19, scope: !32)
!68 = !DILocation(line: 22, column: 26, scope: !32)
!69 = !DILocation(line: 22, column: 33, scope: !32)
!70 = !DILocation(line: 22, column: 5, scope: !32)
!71 = !DILocation(line: 23, column: 19, scope: !32)
!72 = !DILocation(line: 23, column: 26, scope: !32)
!73 = !DILocation(line: 23, column: 33, scope: !32)
!74 = !DILocation(line: 23, column: 5, scope: !32)
!75 = !DILocalVariable(name: "outputKey", scope: !32, file: !1, line: 25, type: !25)
!76 = !DILocation(line: 25, column: 11, scope: !32)
!77 = !DILocalVariable(name: "i", scope: !32, file: !1, line: 27, type: !18)
!78 = !DILocation(line: 27, column: 9, scope: !32)
!79 = !DILocation(line: 28, column: 5, scope: !32)
!80 = !DILocation(line: 28, column: 12, scope: !32)
!81 = !DILocation(line: 28, column: 14, scope: !32)
!82 = !DILocalVariable(name: "currentKey", scope: !83, file: !1, line: 29, type: !18)
!83 = distinct !DILexicalBlock(scope: !32, file: !1, line: 28, column: 19)
!84 = !DILocation(line: 29, column: 13, scope: !83)
!85 = !DILocation(line: 29, column: 35, scope: !83)
!86 = !DILocation(line: 29, column: 26, scope: !83)
!87 = !DILocalVariable(name: "ccStat", scope: !83, file: !1, line: 30, type: !18)
!88 = !DILocation(line: 30, column: 13, scope: !83)
!89 = !DILocation(line: 30, column: 49, scope: !83)
!90 = !DILocation(line: 30, column: 56, scope: !83)
!91 = !DILocation(line: 30, column: 22, scope: !83)
!92 = !DILocation(line: 31, column: 13, scope: !93)
!93 = distinct !DILexicalBlock(scope: !83, file: !1, line: 31, column: 13)
!94 = !DILocation(line: 31, column: 20, scope: !93)
!95 = !DILocation(line: 31, column: 13, scope: !83)
!96 = !DILocation(line: 32, column: 13, scope: !97)
!97 = distinct !DILexicalBlock(scope: !98, file: !1, line: 32, column: 13)
!98 = distinct !DILexicalBlock(scope: !99, file: !1, line: 32, column: 13)
!99 = distinct !DILexicalBlock(scope: !93, file: !1, line: 31, column: 30)
!100 = !DILocation(line: 32, column: 13, scope: !98)
!101 = !DILocation(line: 34, column: 13, scope: !102)
!102 = distinct !DILexicalBlock(scope: !103, file: !1, line: 34, column: 13)
!103 = distinct !DILexicalBlock(scope: !104, file: !1, line: 34, column: 13)
!104 = distinct !DILexicalBlock(scope: !93, file: !1, line: 33, column: 16)
!105 = !DILocation(line: 34, column: 13, scope: !103)
!106 = !DILocation(line: 36, column: 10, scope: !83)
!107 = distinct !{!107, !79, !108, !109}
!108 = !DILocation(line: 37, column: 5, scope: !32)
!109 = !{!"llvm.loop.mustprogress"}
!110 = !DILocation(line: 39, column: 23, scope: !32)
!111 = !DILocation(line: 39, column: 5, scope: !32)
!112 = !DILocation(line: 40, column: 1, scope: !32)
!113 = distinct !DISubprogram(name: "cmp", scope: !20, file: !20, line: 53, type: !114, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!114 = !DISubroutineType(types: !115)
!115 = !{!18, !116, !116}
!116 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !117, size: 64)
!117 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!118 = !DILocalVariable(name: "e1", arg: 1, scope: !113, file: !20, line: 53, type: !116)
!119 = !DILocation(line: 53, column: 21, scope: !113)
!120 = !DILocalVariable(name: "e2", arg: 2, scope: !113, file: !20, line: 53, type: !116)
!121 = !DILocation(line: 53, column: 37, scope: !113)
!122 = !DILocalVariable(name: "i", scope: !113, file: !20, line: 54, type: !18)
!123 = !DILocation(line: 54, column: 9, scope: !113)
!124 = !DILocation(line: 54, column: 22, scope: !113)
!125 = !DILocation(line: 54, column: 15, scope: !113)
!126 = !DILocation(line: 54, column: 13, scope: !113)
!127 = !DILocalVariable(name: "j", scope: !113, file: !20, line: 55, type: !18)
!128 = !DILocation(line: 55, column: 9, scope: !113)
!129 = !DILocation(line: 55, column: 22, scope: !113)
!130 = !DILocation(line: 55, column: 15, scope: !113)
!131 = !DILocation(line: 55, column: 13, scope: !113)
!132 = !DILocation(line: 57, column: 9, scope: !133)
!133 = distinct !DILexicalBlock(scope: !113, file: !20, line: 57, column: 9)
!134 = !DILocation(line: 57, column: 13, scope: !133)
!135 = !DILocation(line: 57, column: 11, scope: !133)
!136 = !DILocation(line: 57, column: 9, scope: !113)
!137 = !DILocation(line: 58, column: 9, scope: !133)
!138 = !DILocation(line: 59, column: 9, scope: !139)
!139 = distinct !DILexicalBlock(scope: !113, file: !20, line: 59, column: 9)
!140 = !DILocation(line: 59, column: 14, scope: !139)
!141 = !DILocation(line: 59, column: 11, scope: !139)
!142 = !DILocation(line: 59, column: 9, scope: !113)
!143 = !DILocation(line: 60, column: 9, scope: !139)
!144 = !DILocation(line: 61, column: 5, scope: !113)
!145 = !DILocation(line: 62, column: 1, scope: !113)
!146 = distinct !DISubprogram(name: "treetable_conf_init", scope: !20, file: !20, line: 70, type: !147, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!147 = !DISubroutineType(types: !148)
!148 = !{null, !149}
!149 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64)
!150 = !DIDerivedType(tag: DW_TAG_typedef, name: "TreeTableConf", file: !151, line: 94, baseType: !152)
!151 = !DIFile(filename: "./treetable.h", directory: "/home/klee/klee_src/examples/trabalho2")
!152 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "treetable_conf_s", file: !151, line: 89, size: 256, elements: !153)
!153 = !{!154, !156, !163, !167}
!154 = !DIDerivedType(tag: DW_TAG_member, name: "cmp", scope: !152, file: !151, line: 90, baseType: !155, size: 64)
!155 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !114, size: 64)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "mem_alloc", scope: !152, file: !151, line: 91, baseType: !157, size: 64, offset: 64)
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = !DISubroutineType(types: !159)
!159 = !{!25, !160}
!160 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !161, line: 46, baseType: !162)
!161 = !DIFile(filename: "/tmp/llvm-130-install_O_D_A/lib/clang/13.0.1/include/stddef.h", directory: "")
!162 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!163 = !DIDerivedType(tag: DW_TAG_member, name: "mem_calloc", scope: !152, file: !151, line: 92, baseType: !164, size: 64, offset: 128)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DISubroutineType(types: !166)
!166 = !{!25, !160, !160}
!167 = !DIDerivedType(tag: DW_TAG_member, name: "mem_free", scope: !152, file: !151, line: 93, baseType: !168, size: 64, offset: 192)
!168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !169, size: 64)
!169 = !DISubroutineType(types: !170)
!170 = !{null, !25}
!171 = !DILocalVariable(name: "conf", arg: 1, scope: !146, file: !20, line: 70, type: !149)
!172 = !DILocation(line: 70, column: 41, scope: !146)
!173 = !DILocation(line: 72, column: 5, scope: !146)
!174 = !DILocation(line: 72, column: 11, scope: !146)
!175 = !DILocation(line: 72, column: 22, scope: !146)
!176 = !DILocation(line: 73, column: 5, scope: !146)
!177 = !DILocation(line: 73, column: 11, scope: !146)
!178 = !DILocation(line: 73, column: 22, scope: !146)
!179 = !DILocation(line: 74, column: 5, scope: !146)
!180 = !DILocation(line: 74, column: 11, scope: !146)
!181 = !DILocation(line: 74, column: 22, scope: !146)
!182 = !DILocation(line: 75, column: 5, scope: !146)
!183 = !DILocation(line: 75, column: 11, scope: !146)
!184 = !DILocation(line: 75, column: 22, scope: !146)
!185 = !DILocation(line: 76, column: 1, scope: !146)
!186 = distinct !DISubprogram(name: "treetable_new", scope: !20, file: !20, line: 87, type: !187, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!187 = !DISubroutineType(types: !188)
!188 = !{!22, !189}
!189 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !190, size: 64)
!190 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !191, size: 64)
!191 = !DIDerivedType(tag: DW_TAG_typedef, name: "TreeTable", file: !151, line: 30, baseType: !192)
!192 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "treetable_s", file: !20, line: 30, size: 448, elements: !193)
!193 = !{!194, !206, !207, !208, !209, !210, !211}
!194 = !DIDerivedType(tag: DW_TAG_member, name: "root", scope: !192, file: !20, line: 31, baseType: !195, size: 64)
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64)
!196 = !DIDerivedType(tag: DW_TAG_typedef, name: "RBNode", file: !151, line: 61, baseType: !197)
!197 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rbnode_s", file: !151, line: 37, size: 384, elements: !198)
!198 = !{!199, !200, !201, !202, !204, !205}
!199 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !197, file: !151, line: 40, baseType: !25, size: 64)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !197, file: !151, line: 44, baseType: !25, size: 64, offset: 64)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "color", scope: !197, file: !151, line: 48, baseType: !57, size: 8, offset: 128)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !197, file: !151, line: 52, baseType: !203, size: 64, offset: 192)
!203 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !197, size: 64)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "left", scope: !197, file: !151, line: 56, baseType: !203, size: 64, offset: 256)
!205 = !DIDerivedType(tag: DW_TAG_member, name: "right", scope: !197, file: !151, line: 60, baseType: !203, size: 64, offset: 320)
!206 = !DIDerivedType(tag: DW_TAG_member, name: "sentinel", scope: !192, file: !20, line: 32, baseType: !195, size: 64, offset: 64)
!207 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !192, file: !20, line: 33, baseType: !160, size: 64, offset: 128)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "cmp", scope: !192, file: !20, line: 35, baseType: !155, size: 64, offset: 192)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "mem_alloc", scope: !192, file: !20, line: 36, baseType: !157, size: 64, offset: 256)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "mem_calloc", scope: !192, file: !20, line: 37, baseType: !164, size: 64, offset: 320)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "mem_free", scope: !192, file: !20, line: 38, baseType: !168, size: 64, offset: 384)
!212 = !DILocalVariable(name: "tt", arg: 1, scope: !186, file: !20, line: 87, type: !189)
!213 = !DILocation(line: 87, column: 40, scope: !186)
!214 = !DILocalVariable(name: "conf", scope: !186, file: !20, line: 89, type: !150)
!215 = !DILocation(line: 89, column: 19, scope: !186)
!216 = !DILocation(line: 90, column: 5, scope: !186)
!217 = !DILocation(line: 91, column: 38, scope: !186)
!218 = !DILocation(line: 91, column: 12, scope: !186)
!219 = !DILocation(line: 91, column: 5, scope: !186)
!220 = distinct !DISubprogram(name: "treetable_new_conf", scope: !20, file: !20, line: 107, type: !221, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!221 = !DISubroutineType(types: !222)
!222 = !{!22, !223, !189}
!223 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !224)
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 64)
!225 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !150)
!226 = !DILocalVariable(name: "conf", arg: 1, scope: !220, file: !20, line: 107, type: !223)
!227 = !DILocation(line: 107, column: 61, scope: !220)
!228 = !DILocalVariable(name: "tt", arg: 2, scope: !220, file: !20, line: 107, type: !189)
!229 = !DILocation(line: 107, column: 79, scope: !220)
!230 = !DILocalVariable(name: "table", scope: !220, file: !20, line: 109, type: !190)
!231 = !DILocation(line: 109, column: 16, scope: !220)
!232 = !DILocation(line: 109, column: 24, scope: !220)
!233 = !DILocation(line: 109, column: 30, scope: !220)
!234 = !DILocation(line: 111, column: 10, scope: !235)
!235 = distinct !DILexicalBlock(scope: !220, file: !20, line: 111, column: 9)
!236 = !DILocation(line: 111, column: 9, scope: !220)
!237 = !DILocation(line: 112, column: 9, scope: !235)
!238 = !DILocalVariable(name: "sentinel", scope: !220, file: !20, line: 114, type: !195)
!239 = !DILocation(line: 114, column: 13, scope: !220)
!240 = !DILocation(line: 114, column: 24, scope: !220)
!241 = !DILocation(line: 114, column: 30, scope: !220)
!242 = !DILocation(line: 116, column: 10, scope: !243)
!243 = distinct !DILexicalBlock(scope: !220, file: !20, line: 116, column: 9)
!244 = !DILocation(line: 116, column: 9, scope: !220)
!245 = !DILocation(line: 117, column: 9, scope: !246)
!246 = distinct !DILexicalBlock(scope: !243, file: !20, line: 116, column: 20)
!247 = !DILocation(line: 117, column: 15, scope: !246)
!248 = !DILocation(line: 117, column: 24, scope: !246)
!249 = !DILocation(line: 118, column: 9, scope: !246)
!250 = !DILocation(line: 121, column: 5, scope: !220)
!251 = !DILocation(line: 121, column: 15, scope: !220)
!252 = !DILocation(line: 121, column: 23, scope: !220)
!253 = !DILocation(line: 123, column: 5, scope: !220)
!254 = !DILocation(line: 123, column: 12, scope: !220)
!255 = !DILocation(line: 123, column: 23, scope: !220)
!256 = !DILocation(line: 124, column: 25, scope: !220)
!257 = !DILocation(line: 124, column: 31, scope: !220)
!258 = !DILocation(line: 124, column: 5, scope: !220)
!259 = !DILocation(line: 124, column: 12, scope: !220)
!260 = !DILocation(line: 124, column: 23, scope: !220)
!261 = !DILocation(line: 125, column: 25, scope: !220)
!262 = !DILocation(line: 125, column: 31, scope: !220)
!263 = !DILocation(line: 125, column: 5, scope: !220)
!264 = !DILocation(line: 125, column: 12, scope: !220)
!265 = !DILocation(line: 125, column: 23, scope: !220)
!266 = !DILocation(line: 126, column: 25, scope: !220)
!267 = !DILocation(line: 126, column: 31, scope: !220)
!268 = !DILocation(line: 126, column: 5, scope: !220)
!269 = !DILocation(line: 126, column: 12, scope: !220)
!270 = !DILocation(line: 126, column: 23, scope: !220)
!271 = !DILocation(line: 127, column: 25, scope: !220)
!272 = !DILocation(line: 127, column: 31, scope: !220)
!273 = !DILocation(line: 127, column: 5, scope: !220)
!274 = !DILocation(line: 127, column: 12, scope: !220)
!275 = !DILocation(line: 127, column: 23, scope: !220)
!276 = !DILocation(line: 128, column: 25, scope: !220)
!277 = !DILocation(line: 128, column: 5, scope: !220)
!278 = !DILocation(line: 128, column: 12, scope: !220)
!279 = !DILocation(line: 128, column: 23, scope: !220)
!280 = !DILocation(line: 129, column: 25, scope: !220)
!281 = !DILocation(line: 129, column: 5, scope: !220)
!282 = !DILocation(line: 129, column: 12, scope: !220)
!283 = !DILocation(line: 129, column: 23, scope: !220)
!284 = !DILocation(line: 131, column: 11, scope: !220)
!285 = !DILocation(line: 131, column: 6, scope: !220)
!286 = !DILocation(line: 131, column: 9, scope: !220)
!287 = !DILocation(line: 132, column: 5, scope: !220)
!288 = !DILocation(line: 133, column: 1, scope: !220)
!289 = distinct !DISubprogram(name: "treetable_destroy", scope: !20, file: !20, line: 159, type: !290, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!290 = !DISubroutineType(types: !291)
!291 = !{null, !190}
!292 = !DILocalVariable(name: "table", arg: 1, scope: !289, file: !20, line: 159, type: !190)
!293 = !DILocation(line: 159, column: 35, scope: !289)
!294 = !DILocation(line: 161, column: 18, scope: !289)
!295 = !DILocation(line: 161, column: 25, scope: !289)
!296 = !DILocation(line: 161, column: 32, scope: !289)
!297 = !DILocation(line: 161, column: 5, scope: !289)
!298 = !DILocation(line: 163, column: 5, scope: !289)
!299 = !DILocation(line: 163, column: 12, scope: !289)
!300 = !DILocation(line: 163, column: 21, scope: !289)
!301 = !DILocation(line: 163, column: 28, scope: !289)
!302 = !DILocation(line: 164, column: 5, scope: !289)
!303 = !DILocation(line: 164, column: 12, scope: !289)
!304 = !DILocation(line: 164, column: 21, scope: !289)
!305 = !DILocation(line: 165, column: 1, scope: !289)
!306 = distinct !DISubprogram(name: "tree_destroy", scope: !20, file: !20, line: 141, type: !307, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!307 = !DISubroutineType(types: !308)
!308 = !{null, !190, !195}
!309 = !DILocalVariable(name: "table", arg: 1, scope: !306, file: !20, line: 141, type: !190)
!310 = !DILocation(line: 141, column: 37, scope: !306)
!311 = !DILocalVariable(name: "n", arg: 2, scope: !306, file: !20, line: 141, type: !195)
!312 = !DILocation(line: 141, column: 52, scope: !306)
!313 = !DILocation(line: 143, column: 9, scope: !314)
!314 = distinct !DILexicalBlock(scope: !306, file: !20, line: 143, column: 9)
!315 = !DILocation(line: 143, column: 14, scope: !314)
!316 = !DILocation(line: 143, column: 21, scope: !314)
!317 = !DILocation(line: 143, column: 11, scope: !314)
!318 = !DILocation(line: 143, column: 9, scope: !306)
!319 = !DILocation(line: 146, column: 18, scope: !306)
!320 = !DILocation(line: 146, column: 25, scope: !306)
!321 = !DILocation(line: 146, column: 28, scope: !306)
!322 = !DILocation(line: 146, column: 5, scope: !306)
!323 = !DILocation(line: 147, column: 18, scope: !306)
!324 = !DILocation(line: 147, column: 25, scope: !306)
!325 = !DILocation(line: 147, column: 28, scope: !306)
!326 = !DILocation(line: 147, column: 5, scope: !306)
!327 = !DILocation(line: 149, column: 5, scope: !306)
!328 = !DILocation(line: 149, column: 12, scope: !306)
!329 = !DILocation(line: 149, column: 21, scope: !306)
!330 = !DILocation(line: 150, column: 1, scope: !306)
!331 = distinct !DISubprogram(name: "treetable_get", scope: !20, file: !20, line: 177, type: !332, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!332 = !DISubroutineType(types: !333)
!333 = !{!22, !334, !116, !337}
!334 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !335)
!335 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !336, size: 64)
!336 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !191)
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!338 = !DILocalVariable(name: "table", arg: 1, scope: !331, file: !20, line: 177, type: !334)
!339 = !DILocation(line: 177, column: 52, scope: !331)
!340 = !DILocalVariable(name: "key", arg: 2, scope: !331, file: !20, line: 177, type: !116)
!341 = !DILocation(line: 177, column: 71, scope: !331)
!342 = !DILocalVariable(name: "out", arg: 3, scope: !331, file: !20, line: 177, type: !337)
!343 = !DILocation(line: 177, column: 83, scope: !331)
!344 = !DILocalVariable(name: "node", scope: !331, file: !20, line: 179, type: !195)
!345 = !DILocation(line: 179, column: 13, scope: !331)
!346 = !DILocation(line: 179, column: 41, scope: !331)
!347 = !DILocation(line: 179, column: 48, scope: !331)
!348 = !DILocation(line: 179, column: 20, scope: !331)
!349 = !DILocation(line: 181, column: 10, scope: !350)
!350 = distinct !DILexicalBlock(scope: !331, file: !20, line: 181, column: 9)
!351 = !DILocation(line: 181, column: 9, scope: !331)
!352 = !DILocation(line: 182, column: 9, scope: !350)
!353 = !DILocation(line: 184, column: 12, scope: !331)
!354 = !DILocation(line: 184, column: 18, scope: !331)
!355 = !DILocation(line: 184, column: 6, scope: !331)
!356 = !DILocation(line: 184, column: 10, scope: !331)
!357 = !DILocation(line: 185, column: 5, scope: !331)
!358 = !DILocation(line: 186, column: 1, scope: !331)
!359 = distinct !DISubprogram(name: "get_tree_node_by_key", scope: !20, file: !20, line: 477, type: !360, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!360 = !DISubroutineType(types: !361)
!361 = !{!195, !334, !116}
!362 = !DILocalVariable(name: "table", arg: 1, scope: !359, file: !20, line: 477, type: !334)
!363 = !DILocation(line: 477, column: 61, scope: !359)
!364 = !DILocalVariable(name: "key", arg: 2, scope: !359, file: !20, line: 477, type: !116)
!365 = !DILocation(line: 477, column: 80, scope: !359)
!366 = !DILocation(line: 479, column: 9, scope: !367)
!367 = distinct !DILexicalBlock(scope: !359, file: !20, line: 479, column: 9)
!368 = !DILocation(line: 479, column: 16, scope: !367)
!369 = !DILocation(line: 479, column: 21, scope: !367)
!370 = !DILocation(line: 479, column: 9, scope: !359)
!371 = !DILocation(line: 480, column: 9, scope: !367)
!372 = !DILocalVariable(name: "n", scope: !359, file: !20, line: 482, type: !195)
!373 = !DILocation(line: 482, column: 13, scope: !359)
!374 = !DILocation(line: 482, column: 17, scope: !359)
!375 = !DILocation(line: 482, column: 24, scope: !359)
!376 = !DILocalVariable(name: "s", scope: !359, file: !20, line: 483, type: !195)
!377 = !DILocation(line: 483, column: 13, scope: !359)
!378 = !DILocation(line: 483, column: 17, scope: !359)
!379 = !DILocation(line: 483, column: 24, scope: !359)
!380 = !DILocalVariable(name: "cmp", scope: !359, file: !20, line: 485, type: !18)
!381 = !DILocation(line: 485, column: 9, scope: !359)
!382 = !DILocation(line: 486, column: 5, scope: !359)
!383 = !DILocation(line: 487, column: 15, scope: !384)
!384 = distinct !DILexicalBlock(scope: !359, file: !20, line: 486, column: 8)
!385 = !DILocation(line: 487, column: 22, scope: !384)
!386 = !DILocation(line: 487, column: 26, scope: !384)
!387 = !DILocation(line: 487, column: 31, scope: !384)
!388 = !DILocation(line: 487, column: 34, scope: !384)
!389 = !DILocation(line: 487, column: 13, scope: !384)
!390 = !DILocation(line: 489, column: 13, scope: !391)
!391 = distinct !DILexicalBlock(scope: !384, file: !20, line: 489, column: 13)
!392 = !DILocation(line: 489, column: 17, scope: !391)
!393 = !DILocation(line: 489, column: 13, scope: !384)
!394 = !DILocation(line: 490, column: 17, scope: !391)
!395 = !DILocation(line: 490, column: 20, scope: !391)
!396 = !DILocation(line: 490, column: 15, scope: !391)
!397 = !DILocation(line: 490, column: 13, scope: !391)
!398 = !DILocation(line: 491, column: 18, scope: !399)
!399 = distinct !DILexicalBlock(scope: !391, file: !20, line: 491, column: 18)
!400 = !DILocation(line: 491, column: 22, scope: !399)
!401 = !DILocation(line: 491, column: 18, scope: !391)
!402 = !DILocation(line: 492, column: 17, scope: !399)
!403 = !DILocation(line: 492, column: 20, scope: !399)
!404 = !DILocation(line: 492, column: 15, scope: !399)
!405 = !DILocation(line: 494, column: 20, scope: !399)
!406 = !DILocation(line: 494, column: 13, scope: !399)
!407 = !DILocation(line: 495, column: 14, scope: !359)
!408 = !DILocation(line: 495, column: 19, scope: !359)
!409 = !DILocation(line: 495, column: 16, scope: !359)
!410 = !DILocation(line: 495, column: 21, scope: !359)
!411 = !DILocation(line: 495, column: 5, scope: !384)
!412 = distinct !{!412, !382, !413, !109}
!413 = !DILocation(line: 495, column: 32, scope: !359)
!414 = !DILocation(line: 497, column: 5, scope: !359)
!415 = !DILocation(line: 498, column: 1, scope: !359)
!416 = distinct !DISubprogram(name: "treetable_get_first_key", scope: !20, file: !20, line: 198, type: !417, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!417 = !DISubroutineType(types: !418)
!418 = !{!22, !334, !337}
!419 = !DILocalVariable(name: "table", arg: 1, scope: !416, file: !20, line: 198, type: !334)
!420 = !DILocation(line: 198, column: 62, scope: !416)
!421 = !DILocalVariable(name: "out", arg: 2, scope: !416, file: !20, line: 198, type: !337)
!422 = !DILocation(line: 198, column: 76, scope: !416)
!423 = !DILocalVariable(name: "node", scope: !416, file: !20, line: 200, type: !195)
!424 = !DILocation(line: 200, column: 13, scope: !416)
!425 = !DILocation(line: 200, column: 29, scope: !416)
!426 = !DILocation(line: 200, column: 36, scope: !416)
!427 = !DILocation(line: 200, column: 43, scope: !416)
!428 = !DILocation(line: 200, column: 20, scope: !416)
!429 = !DILocation(line: 202, column: 9, scope: !430)
!430 = distinct !DILexicalBlock(scope: !416, file: !20, line: 202, column: 9)
!431 = !DILocation(line: 202, column: 17, scope: !430)
!432 = !DILocation(line: 202, column: 24, scope: !430)
!433 = !DILocation(line: 202, column: 14, scope: !430)
!434 = !DILocation(line: 202, column: 9, scope: !416)
!435 = !DILocation(line: 203, column: 16, scope: !436)
!436 = distinct !DILexicalBlock(scope: !430, file: !20, line: 202, column: 34)
!437 = !DILocation(line: 203, column: 22, scope: !436)
!438 = !DILocation(line: 203, column: 10, scope: !436)
!439 = !DILocation(line: 203, column: 14, scope: !436)
!440 = !DILocation(line: 204, column: 9, scope: !436)
!441 = !DILocation(line: 207, column: 5, scope: !416)
!442 = !DILocation(line: 208, column: 1, scope: !416)
!443 = distinct !DISubprogram(name: "tree_min", scope: !20, file: !20, line: 391, type: !444, scopeLine: 392, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!444 = !DISubroutineType(types: !445)
!445 = !{!195, !334, !195}
!446 = !DILocalVariable(name: "table", arg: 1, scope: !443, file: !20, line: 391, type: !334)
!447 = !DILocation(line: 391, column: 56, scope: !443)
!448 = !DILocalVariable(name: "n", arg: 2, scope: !443, file: !20, line: 391, type: !195)
!449 = !DILocation(line: 391, column: 71, scope: !443)
!450 = !DILocalVariable(name: "s", scope: !443, file: !20, line: 393, type: !195)
!451 = !DILocation(line: 393, column: 13, scope: !443)
!452 = !DILocation(line: 393, column: 17, scope: !443)
!453 = !DILocation(line: 393, column: 24, scope: !443)
!454 = !DILocation(line: 396, column: 9, scope: !443)
!455 = !DILocation(line: 396, column: 16, scope: !443)
!456 = !DILocation(line: 396, column: 21, scope: !443)
!457 = !DILocation(line: 396, column: 18, scope: !443)
!458 = !DILocation(line: 396, column: 23, scope: !443)
!459 = !DILocation(line: 396, column: 26, scope: !443)
!460 = !DILocation(line: 396, column: 29, scope: !443)
!461 = !DILocation(line: 396, column: 37, scope: !443)
!462 = !DILocation(line: 396, column: 34, scope: !443)
!463 = !DILocation(line: 397, column: 17, scope: !443)
!464 = !DILocation(line: 397, column: 20, scope: !443)
!465 = !DILocation(line: 397, column: 15, scope: !443)
!466 = distinct !{!466, !454, !464, !109}
!467 = !DILocation(line: 399, column: 12, scope: !443)
!468 = !DILocation(line: 399, column: 5, scope: !443)
!469 = distinct !DISubprogram(name: "treetable_get_greater_than", scope: !20, file: !20, line: 220, type: !332, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!470 = !DILocalVariable(name: "table", arg: 1, scope: !469, file: !20, line: 220, type: !334)
!471 = !DILocation(line: 220, column: 65, scope: !469)
!472 = !DILocalVariable(name: "key", arg: 2, scope: !469, file: !20, line: 220, type: !116)
!473 = !DILocation(line: 220, column: 84, scope: !469)
!474 = !DILocalVariable(name: "out", arg: 3, scope: !469, file: !20, line: 220, type: !337)
!475 = !DILocation(line: 220, column: 96, scope: !469)
!476 = !DILocalVariable(name: "n", scope: !469, file: !20, line: 222, type: !195)
!477 = !DILocation(line: 222, column: 13, scope: !469)
!478 = !DILocation(line: 222, column: 38, scope: !469)
!479 = !DILocation(line: 222, column: 45, scope: !469)
!480 = !DILocation(line: 222, column: 17, scope: !469)
!481 = !DILocalVariable(name: "s", scope: !469, file: !20, line: 223, type: !195)
!482 = !DILocation(line: 223, column: 13, scope: !469)
!483 = !DILocation(line: 223, column: 36, scope: !469)
!484 = !DILocation(line: 223, column: 43, scope: !469)
!485 = !DILocation(line: 223, column: 17, scope: !469)
!486 = !DILocation(line: 226, column: 9, scope: !487)
!487 = distinct !DILexicalBlock(scope: !469, file: !20, line: 226, column: 9)
!488 = !DILocation(line: 226, column: 14, scope: !487)
!489 = !DILocation(line: 226, column: 21, scope: !487)
!490 = !DILocation(line: 226, column: 11, scope: !487)
!491 = !DILocation(line: 226, column: 30, scope: !487)
!492 = !DILocation(line: 227, column: 16, scope: !493)
!493 = distinct !DILexicalBlock(scope: !487, file: !20, line: 226, column: 41)
!494 = !DILocation(line: 227, column: 19, scope: !493)
!495 = !DILocation(line: 227, column: 10, scope: !493)
!496 = !DILocation(line: 227, column: 14, scope: !493)
!497 = !DILocation(line: 228, column: 9, scope: !493)
!498 = !DILocation(line: 230, column: 5, scope: !469)
!499 = !DILocation(line: 231, column: 1, scope: !469)
!500 = distinct !DISubprogram(name: "get_successor_node", scope: !20, file: !20, line: 508, type: !444, scopeLine: 509, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!501 = !DILocalVariable(name: "table", arg: 1, scope: !500, file: !20, line: 508, type: !334)
!502 = !DILocation(line: 508, column: 59, scope: !500)
!503 = !DILocalVariable(name: "x", arg: 2, scope: !500, file: !20, line: 508, type: !195)
!504 = !DILocation(line: 508, column: 74, scope: !500)
!505 = !DILocation(line: 510, column: 9, scope: !506)
!506 = distinct !DILexicalBlock(scope: !500, file: !20, line: 510, column: 9)
!507 = !DILocation(line: 510, column: 11, scope: !506)
!508 = !DILocation(line: 510, column: 9, scope: !500)
!509 = !DILocation(line: 511, column: 9, scope: !506)
!510 = !DILocation(line: 513, column: 9, scope: !511)
!511 = distinct !DILexicalBlock(scope: !500, file: !20, line: 513, column: 9)
!512 = !DILocation(line: 513, column: 12, scope: !511)
!513 = !DILocation(line: 513, column: 21, scope: !511)
!514 = !DILocation(line: 513, column: 28, scope: !511)
!515 = !DILocation(line: 513, column: 18, scope: !511)
!516 = !DILocation(line: 513, column: 9, scope: !500)
!517 = !DILocation(line: 514, column: 25, scope: !511)
!518 = !DILocation(line: 514, column: 32, scope: !511)
!519 = !DILocation(line: 514, column: 35, scope: !511)
!520 = !DILocation(line: 514, column: 16, scope: !511)
!521 = !DILocation(line: 514, column: 9, scope: !511)
!522 = !DILocalVariable(name: "y", scope: !500, file: !20, line: 516, type: !195)
!523 = !DILocation(line: 516, column: 13, scope: !500)
!524 = !DILocation(line: 516, column: 17, scope: !500)
!525 = !DILocation(line: 516, column: 20, scope: !500)
!526 = !DILocation(line: 518, column: 5, scope: !500)
!527 = !DILocation(line: 518, column: 12, scope: !500)
!528 = !DILocation(line: 518, column: 17, scope: !500)
!529 = !DILocation(line: 518, column: 24, scope: !500)
!530 = !DILocation(line: 518, column: 14, scope: !500)
!531 = !DILocation(line: 518, column: 33, scope: !500)
!532 = !DILocation(line: 518, column: 36, scope: !500)
!533 = !DILocation(line: 518, column: 41, scope: !500)
!534 = !DILocation(line: 518, column: 44, scope: !500)
!535 = !DILocation(line: 518, column: 38, scope: !500)
!536 = !DILocation(line: 519, column: 13, scope: !537)
!537 = distinct !DILexicalBlock(scope: !500, file: !20, line: 518, column: 51)
!538 = !DILocation(line: 519, column: 11, scope: !537)
!539 = !DILocation(line: 520, column: 13, scope: !537)
!540 = !DILocation(line: 520, column: 16, scope: !537)
!541 = !DILocation(line: 520, column: 11, scope: !537)
!542 = distinct !{!542, !526, !543, !109}
!543 = !DILocation(line: 521, column: 5, scope: !500)
!544 = !DILocation(line: 522, column: 12, scope: !500)
!545 = !DILocation(line: 522, column: 5, scope: !500)
!546 = !DILocation(line: 523, column: 1, scope: !500)
!547 = distinct !DISubprogram(name: "treetable_size", scope: !20, file: !20, line: 241, type: !548, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!548 = !DISubroutineType(types: !549)
!549 = !{!160, !334}
!550 = !DILocalVariable(name: "table", arg: 1, scope: !547, file: !20, line: 241, type: !334)
!551 = !DILocation(line: 241, column: 47, scope: !547)
!552 = !DILocation(line: 243, column: 12, scope: !547)
!553 = !DILocation(line: 243, column: 19, scope: !547)
!554 = !DILocation(line: 243, column: 5, scope: !547)
!555 = distinct !DISubprogram(name: "treetable_contains_key", scope: !20, file: !20, line: 254, type: !556, scopeLine: 255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!556 = !DISubroutineType(types: !557)
!557 = !{!558, !334, !116}
!558 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!559 = !DILocalVariable(name: "table", arg: 1, scope: !555, file: !20, line: 254, type: !334)
!560 = !DILocation(line: 254, column: 53, scope: !555)
!561 = !DILocalVariable(name: "key", arg: 2, scope: !555, file: !20, line: 254, type: !116)
!562 = !DILocation(line: 254, column: 72, scope: !555)
!563 = !DILocalVariable(name: "node", scope: !555, file: !20, line: 256, type: !195)
!564 = !DILocation(line: 256, column: 13, scope: !555)
!565 = !DILocation(line: 256, column: 41, scope: !555)
!566 = !DILocation(line: 256, column: 48, scope: !555)
!567 = !DILocation(line: 256, column: 20, scope: !555)
!568 = !DILocation(line: 258, column: 9, scope: !569)
!569 = distinct !DILexicalBlock(scope: !555, file: !20, line: 258, column: 9)
!570 = !DILocation(line: 258, column: 9, scope: !555)
!571 = !DILocation(line: 259, column: 9, scope: !569)
!572 = !DILocation(line: 261, column: 5, scope: !555)
!573 = !DILocation(line: 262, column: 1, scope: !555)
!574 = distinct !DISubprogram(name: "treetable_contains_value", scope: !20, file: !20, line: 272, type: !575, scopeLine: 273, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!575 = !DISubroutineType(types: !576)
!576 = !{!160, !334, !116}
!577 = !DILocalVariable(name: "table", arg: 1, scope: !574, file: !20, line: 272, type: !334)
!578 = !DILocation(line: 272, column: 57, scope: !574)
!579 = !DILocalVariable(name: "value", arg: 2, scope: !574, file: !20, line: 272, type: !116)
!580 = !DILocation(line: 272, column: 76, scope: !574)
!581 = !DILocalVariable(name: "node", scope: !574, file: !20, line: 274, type: !195)
!582 = !DILocation(line: 274, column: 13, scope: !574)
!583 = !DILocation(line: 274, column: 29, scope: !574)
!584 = !DILocation(line: 274, column: 36, scope: !574)
!585 = !DILocation(line: 274, column: 43, scope: !574)
!586 = !DILocation(line: 274, column: 20, scope: !574)
!587 = !DILocalVariable(name: "o", scope: !574, file: !20, line: 276, type: !160)
!588 = !DILocation(line: 276, column: 12, scope: !574)
!589 = !DILocation(line: 277, column: 5, scope: !574)
!590 = !DILocation(line: 277, column: 12, scope: !574)
!591 = !DILocation(line: 277, column: 20, scope: !574)
!592 = !DILocation(line: 277, column: 27, scope: !574)
!593 = !DILocation(line: 277, column: 17, scope: !574)
!594 = !DILocation(line: 278, column: 13, scope: !595)
!595 = distinct !DILexicalBlock(scope: !596, file: !20, line: 278, column: 13)
!596 = distinct !DILexicalBlock(scope: !574, file: !20, line: 277, column: 37)
!597 = !DILocation(line: 278, column: 19, scope: !595)
!598 = !DILocation(line: 278, column: 28, scope: !595)
!599 = !DILocation(line: 278, column: 25, scope: !595)
!600 = !DILocation(line: 278, column: 13, scope: !596)
!601 = !DILocation(line: 279, column: 14, scope: !595)
!602 = !DILocation(line: 279, column: 13, scope: !595)
!603 = !DILocation(line: 280, column: 35, scope: !596)
!604 = !DILocation(line: 280, column: 42, scope: !596)
!605 = !DILocation(line: 280, column: 16, scope: !596)
!606 = !DILocation(line: 280, column: 14, scope: !596)
!607 = distinct !{!607, !589, !608, !109}
!608 = !DILocation(line: 281, column: 5, scope: !574)
!609 = !DILocation(line: 282, column: 12, scope: !574)
!610 = !DILocation(line: 282, column: 5, scope: !574)
!611 = distinct !DISubprogram(name: "treetable_add", scope: !20, file: !20, line: 299, type: !612, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!612 = !DISubroutineType(types: !613)
!613 = !{!22, !190, !25, !25}
!614 = !DILocalVariable(name: "table", arg: 1, scope: !611, file: !20, line: 299, type: !190)
!615 = !DILocation(line: 299, column: 39, scope: !611)
!616 = !DILocalVariable(name: "key", arg: 2, scope: !611, file: !20, line: 299, type: !25)
!617 = !DILocation(line: 299, column: 52, scope: !611)
!618 = !DILocalVariable(name: "val", arg: 3, scope: !611, file: !20, line: 299, type: !25)
!619 = !DILocation(line: 299, column: 63, scope: !611)
!620 = !DILocalVariable(name: "y", scope: !611, file: !20, line: 301, type: !195)
!621 = !DILocation(line: 301, column: 13, scope: !611)
!622 = !DILocation(line: 301, column: 17, scope: !611)
!623 = !DILocation(line: 301, column: 24, scope: !611)
!624 = !DILocalVariable(name: "x", scope: !611, file: !20, line: 302, type: !195)
!625 = !DILocation(line: 302, column: 13, scope: !611)
!626 = !DILocation(line: 302, column: 17, scope: !611)
!627 = !DILocation(line: 302, column: 24, scope: !611)
!628 = !DILocalVariable(name: "cmp", scope: !611, file: !20, line: 304, type: !18)
!629 = !DILocation(line: 304, column: 9, scope: !611)
!630 = !DILocation(line: 305, column: 5, scope: !611)
!631 = !DILocation(line: 305, column: 12, scope: !611)
!632 = !DILocation(line: 305, column: 17, scope: !611)
!633 = !DILocation(line: 305, column: 24, scope: !611)
!634 = !DILocation(line: 305, column: 14, scope: !611)
!635 = !DILocation(line: 306, column: 15, scope: !636)
!636 = distinct !DILexicalBlock(scope: !611, file: !20, line: 305, column: 34)
!637 = !DILocation(line: 306, column: 22, scope: !636)
!638 = !DILocation(line: 306, column: 26, scope: !636)
!639 = !DILocation(line: 306, column: 31, scope: !636)
!640 = !DILocation(line: 306, column: 34, scope: !636)
!641 = !DILocation(line: 306, column: 13, scope: !636)
!642 = !DILocation(line: 307, column: 15, scope: !636)
!643 = !DILocation(line: 307, column: 13, scope: !636)
!644 = !DILocation(line: 309, column: 13, scope: !645)
!645 = distinct !DILexicalBlock(scope: !636, file: !20, line: 309, column: 13)
!646 = !DILocation(line: 309, column: 17, scope: !645)
!647 = !DILocation(line: 309, column: 13, scope: !636)
!648 = !DILocation(line: 310, column: 17, scope: !649)
!649 = distinct !DILexicalBlock(scope: !645, file: !20, line: 309, column: 22)
!650 = !DILocation(line: 310, column: 20, scope: !649)
!651 = !DILocation(line: 310, column: 15, scope: !649)
!652 = !DILocation(line: 311, column: 9, scope: !649)
!653 = !DILocation(line: 311, column: 20, scope: !654)
!654 = distinct !DILexicalBlock(scope: !645, file: !20, line: 311, column: 20)
!655 = !DILocation(line: 311, column: 24, scope: !654)
!656 = !DILocation(line: 311, column: 20, scope: !645)
!657 = !DILocation(line: 312, column: 17, scope: !658)
!658 = distinct !DILexicalBlock(scope: !654, file: !20, line: 311, column: 29)
!659 = !DILocation(line: 312, column: 20, scope: !658)
!660 = !DILocation(line: 312, column: 15, scope: !658)
!661 = !DILocation(line: 314, column: 24, scope: !662)
!662 = distinct !DILexicalBlock(scope: !654, file: !20, line: 313, column: 16)
!663 = !DILocation(line: 314, column: 13, scope: !662)
!664 = !DILocation(line: 314, column: 16, scope: !662)
!665 = !DILocation(line: 314, column: 22, scope: !662)
!666 = !DILocation(line: 315, column: 13, scope: !662)
!667 = distinct !{!667, !630, !668, !109}
!668 = !DILocation(line: 317, column: 5, scope: !611)
!669 = !DILocalVariable(name: "n", scope: !611, file: !20, line: 318, type: !195)
!670 = !DILocation(line: 318, column: 13, scope: !611)
!671 = !DILocation(line: 318, column: 17, scope: !611)
!672 = !DILocation(line: 318, column: 24, scope: !611)
!673 = !DILocation(line: 320, column: 17, scope: !611)
!674 = !DILocation(line: 320, column: 5, scope: !611)
!675 = !DILocation(line: 320, column: 8, scope: !611)
!676 = !DILocation(line: 320, column: 15, scope: !611)
!677 = !DILocation(line: 321, column: 17, scope: !611)
!678 = !DILocation(line: 321, column: 5, scope: !611)
!679 = !DILocation(line: 321, column: 8, scope: !611)
!680 = !DILocation(line: 321, column: 15, scope: !611)
!681 = !DILocation(line: 322, column: 17, scope: !611)
!682 = !DILocation(line: 322, column: 5, scope: !611)
!683 = !DILocation(line: 322, column: 8, scope: !611)
!684 = !DILocation(line: 322, column: 15, scope: !611)
!685 = !DILocation(line: 323, column: 17, scope: !611)
!686 = !DILocation(line: 323, column: 24, scope: !611)
!687 = !DILocation(line: 323, column: 5, scope: !611)
!688 = !DILocation(line: 323, column: 8, scope: !611)
!689 = !DILocation(line: 323, column: 15, scope: !611)
!690 = !DILocation(line: 324, column: 17, scope: !611)
!691 = !DILocation(line: 324, column: 24, scope: !611)
!692 = !DILocation(line: 324, column: 5, scope: !611)
!693 = !DILocation(line: 324, column: 8, scope: !611)
!694 = !DILocation(line: 324, column: 15, scope: !611)
!695 = !DILocation(line: 326, column: 5, scope: !611)
!696 = !DILocation(line: 326, column: 12, scope: !611)
!697 = !DILocation(line: 326, column: 16, scope: !611)
!698 = !DILocation(line: 328, column: 9, scope: !699)
!699 = distinct !DILexicalBlock(scope: !611, file: !20, line: 328, column: 9)
!700 = !DILocation(line: 328, column: 14, scope: !699)
!701 = !DILocation(line: 328, column: 21, scope: !699)
!702 = !DILocation(line: 328, column: 11, scope: !699)
!703 = !DILocation(line: 328, column: 9, scope: !611)
!704 = !DILocation(line: 329, column: 23, scope: !705)
!705 = distinct !DILexicalBlock(scope: !699, file: !20, line: 328, column: 31)
!706 = !DILocation(line: 329, column: 9, scope: !705)
!707 = !DILocation(line: 329, column: 16, scope: !705)
!708 = !DILocation(line: 329, column: 21, scope: !705)
!709 = !DILocation(line: 330, column: 9, scope: !705)
!710 = !DILocation(line: 330, column: 12, scope: !705)
!711 = !DILocation(line: 330, column: 21, scope: !705)
!712 = !DILocation(line: 331, column: 5, scope: !705)
!713 = !DILocation(line: 332, column: 9, scope: !714)
!714 = distinct !DILexicalBlock(scope: !699, file: !20, line: 331, column: 12)
!715 = !DILocation(line: 332, column: 12, scope: !714)
!716 = !DILocation(line: 332, column: 18, scope: !714)
!717 = !DILocation(line: 333, column: 13, scope: !718)
!718 = distinct !DILexicalBlock(scope: !714, file: !20, line: 333, column: 13)
!719 = !DILocation(line: 333, column: 20, scope: !718)
!720 = !DILocation(line: 333, column: 24, scope: !718)
!721 = !DILocation(line: 333, column: 29, scope: !718)
!722 = !DILocation(line: 333, column: 32, scope: !718)
!723 = !DILocation(line: 333, column: 37, scope: !718)
!724 = !DILocation(line: 333, column: 13, scope: !714)
!725 = !DILocation(line: 334, column: 23, scope: !726)
!726 = distinct !DILexicalBlock(scope: !718, file: !20, line: 333, column: 42)
!727 = !DILocation(line: 334, column: 13, scope: !726)
!728 = !DILocation(line: 334, column: 16, scope: !726)
!729 = !DILocation(line: 334, column: 21, scope: !726)
!730 = !DILocation(line: 335, column: 9, scope: !726)
!731 = !DILocation(line: 336, column: 24, scope: !732)
!732 = distinct !DILexicalBlock(scope: !718, file: !20, line: 335, column: 16)
!733 = !DILocation(line: 336, column: 13, scope: !732)
!734 = !DILocation(line: 336, column: 16, scope: !732)
!735 = !DILocation(line: 336, column: 22, scope: !732)
!736 = !DILocation(line: 338, column: 32, scope: !714)
!737 = !DILocation(line: 338, column: 39, scope: !714)
!738 = !DILocation(line: 338, column: 9, scope: !714)
!739 = !DILocation(line: 340, column: 5, scope: !611)
!740 = !DILocation(line: 341, column: 1, scope: !611)
!741 = distinct !DISubprogram(name: "rebalance_after_insert", scope: !20, file: !20, line: 349, type: !307, scopeLine: 350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!742 = !DILocalVariable(name: "table", arg: 1, scope: !741, file: !20, line: 349, type: !190)
!743 = !DILocation(line: 349, column: 47, scope: !741)
!744 = !DILocalVariable(name: "z", arg: 2, scope: !741, file: !20, line: 349, type: !195)
!745 = !DILocation(line: 349, column: 62, scope: !741)
!746 = !DILocalVariable(name: "y", scope: !741, file: !20, line: 351, type: !195)
!747 = !DILocation(line: 351, column: 13, scope: !741)
!748 = !DILocation(line: 353, column: 5, scope: !741)
!749 = !DILocation(line: 353, column: 12, scope: !741)
!750 = !DILocation(line: 353, column: 15, scope: !741)
!751 = !DILocation(line: 353, column: 23, scope: !741)
!752 = !DILocation(line: 353, column: 29, scope: !741)
!753 = !DILocation(line: 354, column: 13, scope: !754)
!754 = distinct !DILexicalBlock(scope: !755, file: !20, line: 354, column: 13)
!755 = distinct !DILexicalBlock(scope: !741, file: !20, line: 353, column: 40)
!756 = !DILocation(line: 354, column: 16, scope: !754)
!757 = !DILocation(line: 354, column: 26, scope: !754)
!758 = !DILocation(line: 354, column: 29, scope: !754)
!759 = !DILocation(line: 354, column: 37, scope: !754)
!760 = !DILocation(line: 354, column: 45, scope: !754)
!761 = !DILocation(line: 354, column: 23, scope: !754)
!762 = !DILocation(line: 354, column: 13, scope: !755)
!763 = !DILocation(line: 355, column: 17, scope: !764)
!764 = distinct !DILexicalBlock(scope: !754, file: !20, line: 354, column: 51)
!765 = !DILocation(line: 355, column: 20, scope: !764)
!766 = !DILocation(line: 355, column: 28, scope: !764)
!767 = !DILocation(line: 355, column: 36, scope: !764)
!768 = !DILocation(line: 355, column: 15, scope: !764)
!769 = !DILocation(line: 356, column: 17, scope: !770)
!770 = distinct !DILexicalBlock(scope: !764, file: !20, line: 356, column: 17)
!771 = !DILocation(line: 356, column: 20, scope: !770)
!772 = !DILocation(line: 356, column: 26, scope: !770)
!773 = !DILocation(line: 356, column: 17, scope: !764)
!774 = !DILocation(line: 357, column: 17, scope: !775)
!775 = distinct !DILexicalBlock(scope: !770, file: !20, line: 356, column: 37)
!776 = !DILocation(line: 357, column: 20, scope: !775)
!777 = !DILocation(line: 357, column: 28, scope: !775)
!778 = !DILocation(line: 357, column: 42, scope: !775)
!779 = !DILocation(line: 358, column: 17, scope: !775)
!780 = !DILocation(line: 358, column: 20, scope: !775)
!781 = !DILocation(line: 358, column: 42, scope: !775)
!782 = !DILocation(line: 359, column: 17, scope: !775)
!783 = !DILocation(line: 359, column: 20, scope: !775)
!784 = !DILocation(line: 359, column: 28, scope: !775)
!785 = !DILocation(line: 359, column: 36, scope: !775)
!786 = !DILocation(line: 359, column: 42, scope: !775)
!787 = !DILocation(line: 360, column: 21, scope: !775)
!788 = !DILocation(line: 360, column: 24, scope: !775)
!789 = !DILocation(line: 360, column: 32, scope: !775)
!790 = !DILocation(line: 360, column: 19, scope: !775)
!791 = !DILocation(line: 361, column: 13, scope: !775)
!792 = !DILocation(line: 362, column: 21, scope: !793)
!793 = distinct !DILexicalBlock(scope: !794, file: !20, line: 362, column: 21)
!794 = distinct !DILexicalBlock(scope: !770, file: !20, line: 361, column: 20)
!795 = !DILocation(line: 362, column: 26, scope: !793)
!796 = !DILocation(line: 362, column: 29, scope: !793)
!797 = !DILocation(line: 362, column: 37, scope: !793)
!798 = !DILocation(line: 362, column: 23, scope: !793)
!799 = !DILocation(line: 362, column: 21, scope: !794)
!800 = !DILocation(line: 363, column: 25, scope: !801)
!801 = distinct !DILexicalBlock(scope: !793, file: !20, line: 362, column: 44)
!802 = !DILocation(line: 363, column: 28, scope: !801)
!803 = !DILocation(line: 363, column: 23, scope: !801)
!804 = !DILocation(line: 364, column: 33, scope: !801)
!805 = !DILocation(line: 364, column: 40, scope: !801)
!806 = !DILocation(line: 364, column: 21, scope: !801)
!807 = !DILocation(line: 365, column: 17, scope: !801)
!808 = !DILocation(line: 366, column: 17, scope: !794)
!809 = !DILocation(line: 366, column: 20, scope: !794)
!810 = !DILocation(line: 366, column: 28, scope: !794)
!811 = !DILocation(line: 366, column: 42, scope: !794)
!812 = !DILocation(line: 367, column: 17, scope: !794)
!813 = !DILocation(line: 367, column: 20, scope: !794)
!814 = !DILocation(line: 367, column: 28, scope: !794)
!815 = !DILocation(line: 367, column: 36, scope: !794)
!816 = !DILocation(line: 367, column: 42, scope: !794)
!817 = !DILocation(line: 368, column: 30, scope: !794)
!818 = !DILocation(line: 368, column: 37, scope: !794)
!819 = !DILocation(line: 368, column: 40, scope: !794)
!820 = !DILocation(line: 368, column: 48, scope: !794)
!821 = !DILocation(line: 368, column: 17, scope: !794)
!822 = !DILocation(line: 371, column: 17, scope: !823)
!823 = distinct !DILexicalBlock(scope: !754, file: !20, line: 370, column: 16)
!824 = !DILocation(line: 371, column: 20, scope: !823)
!825 = !DILocation(line: 371, column: 28, scope: !823)
!826 = !DILocation(line: 371, column: 36, scope: !823)
!827 = !DILocation(line: 371, column: 15, scope: !823)
!828 = !DILocation(line: 372, column: 17, scope: !829)
!829 = distinct !DILexicalBlock(scope: !823, file: !20, line: 372, column: 17)
!830 = !DILocation(line: 372, column: 20, scope: !829)
!831 = !DILocation(line: 372, column: 26, scope: !829)
!832 = !DILocation(line: 372, column: 17, scope: !823)
!833 = !DILocation(line: 373, column: 17, scope: !834)
!834 = distinct !DILexicalBlock(scope: !829, file: !20, line: 372, column: 37)
!835 = !DILocation(line: 373, column: 20, scope: !834)
!836 = !DILocation(line: 373, column: 28, scope: !834)
!837 = !DILocation(line: 373, column: 42, scope: !834)
!838 = !DILocation(line: 374, column: 17, scope: !834)
!839 = !DILocation(line: 374, column: 20, scope: !834)
!840 = !DILocation(line: 374, column: 42, scope: !834)
!841 = !DILocation(line: 375, column: 17, scope: !834)
!842 = !DILocation(line: 375, column: 20, scope: !834)
!843 = !DILocation(line: 375, column: 28, scope: !834)
!844 = !DILocation(line: 375, column: 36, scope: !834)
!845 = !DILocation(line: 375, column: 42, scope: !834)
!846 = !DILocation(line: 376, column: 21, scope: !834)
!847 = !DILocation(line: 376, column: 24, scope: !834)
!848 = !DILocation(line: 376, column: 32, scope: !834)
!849 = !DILocation(line: 376, column: 19, scope: !834)
!850 = !DILocation(line: 377, column: 13, scope: !834)
!851 = !DILocation(line: 378, column: 21, scope: !852)
!852 = distinct !DILexicalBlock(scope: !853, file: !20, line: 378, column: 21)
!853 = distinct !DILexicalBlock(scope: !829, file: !20, line: 377, column: 20)
!854 = !DILocation(line: 378, column: 26, scope: !852)
!855 = !DILocation(line: 378, column: 29, scope: !852)
!856 = !DILocation(line: 378, column: 37, scope: !852)
!857 = !DILocation(line: 378, column: 23, scope: !852)
!858 = !DILocation(line: 378, column: 21, scope: !853)
!859 = !DILocation(line: 379, column: 25, scope: !860)
!860 = distinct !DILexicalBlock(scope: !852, file: !20, line: 378, column: 43)
!861 = !DILocation(line: 379, column: 28, scope: !860)
!862 = !DILocation(line: 379, column: 23, scope: !860)
!863 = !DILocation(line: 380, column: 34, scope: !860)
!864 = !DILocation(line: 380, column: 41, scope: !860)
!865 = !DILocation(line: 380, column: 21, scope: !860)
!866 = !DILocation(line: 381, column: 17, scope: !860)
!867 = !DILocation(line: 382, column: 17, scope: !853)
!868 = !DILocation(line: 382, column: 20, scope: !853)
!869 = !DILocation(line: 382, column: 28, scope: !853)
!870 = !DILocation(line: 382, column: 42, scope: !853)
!871 = !DILocation(line: 383, column: 17, scope: !853)
!872 = !DILocation(line: 383, column: 20, scope: !853)
!873 = !DILocation(line: 383, column: 28, scope: !853)
!874 = !DILocation(line: 383, column: 36, scope: !853)
!875 = !DILocation(line: 383, column: 42, scope: !853)
!876 = !DILocation(line: 384, column: 29, scope: !853)
!877 = !DILocation(line: 384, column: 36, scope: !853)
!878 = !DILocation(line: 384, column: 39, scope: !853)
!879 = !DILocation(line: 384, column: 47, scope: !853)
!880 = !DILocation(line: 384, column: 17, scope: !853)
!881 = distinct !{!881, !748, !882, !109}
!882 = !DILocation(line: 387, column: 5, scope: !741)
!883 = !DILocation(line: 388, column: 5, scope: !741)
!884 = !DILocation(line: 388, column: 12, scope: !741)
!885 = !DILocation(line: 388, column: 18, scope: !741)
!886 = !DILocation(line: 388, column: 24, scope: !741)
!887 = !DILocation(line: 389, column: 1, scope: !741)
!888 = distinct !DISubprogram(name: "rotate_left", scope: !20, file: !20, line: 447, type: !307, scopeLine: 448, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!889 = !DILocalVariable(name: "table", arg: 1, scope: !888, file: !20, line: 447, type: !190)
!890 = !DILocation(line: 447, column: 36, scope: !888)
!891 = !DILocalVariable(name: "x", arg: 2, scope: !888, file: !20, line: 447, type: !195)
!892 = !DILocation(line: 447, column: 51, scope: !888)
!893 = !DILocalVariable(name: "y", scope: !888, file: !20, line: 449, type: !195)
!894 = !DILocation(line: 449, column: 13, scope: !888)
!895 = !DILocation(line: 449, column: 17, scope: !888)
!896 = !DILocation(line: 449, column: 20, scope: !888)
!897 = !DILocation(line: 451, column: 16, scope: !888)
!898 = !DILocation(line: 451, column: 19, scope: !888)
!899 = !DILocation(line: 451, column: 5, scope: !888)
!900 = !DILocation(line: 451, column: 8, scope: !888)
!901 = !DILocation(line: 451, column: 14, scope: !888)
!902 = !DILocation(line: 453, column: 9, scope: !903)
!903 = distinct !DILexicalBlock(scope: !888, file: !20, line: 453, column: 9)
!904 = !DILocation(line: 453, column: 12, scope: !903)
!905 = !DILocation(line: 453, column: 20, scope: !903)
!906 = !DILocation(line: 453, column: 27, scope: !903)
!907 = !DILocation(line: 453, column: 17, scope: !903)
!908 = !DILocation(line: 453, column: 9, scope: !888)
!909 = !DILocation(line: 454, column: 27, scope: !903)
!910 = !DILocation(line: 454, column: 9, scope: !903)
!911 = !DILocation(line: 454, column: 12, scope: !903)
!912 = !DILocation(line: 454, column: 18, scope: !903)
!913 = !DILocation(line: 454, column: 25, scope: !903)
!914 = !DILocation(line: 456, column: 17, scope: !888)
!915 = !DILocation(line: 456, column: 20, scope: !888)
!916 = !DILocation(line: 456, column: 5, scope: !888)
!917 = !DILocation(line: 456, column: 8, scope: !888)
!918 = !DILocation(line: 456, column: 15, scope: !888)
!919 = !DILocation(line: 458, column: 9, scope: !920)
!920 = distinct !DILexicalBlock(scope: !888, file: !20, line: 458, column: 9)
!921 = !DILocation(line: 458, column: 12, scope: !920)
!922 = !DILocation(line: 458, column: 22, scope: !920)
!923 = !DILocation(line: 458, column: 29, scope: !920)
!924 = !DILocation(line: 458, column: 19, scope: !920)
!925 = !DILocation(line: 458, column: 9, scope: !888)
!926 = !DILocation(line: 459, column: 23, scope: !920)
!927 = !DILocation(line: 459, column: 9, scope: !920)
!928 = !DILocation(line: 459, column: 16, scope: !920)
!929 = !DILocation(line: 459, column: 21, scope: !920)
!930 = !DILocation(line: 460, column: 14, scope: !931)
!931 = distinct !DILexicalBlock(scope: !920, file: !20, line: 460, column: 14)
!932 = !DILocation(line: 460, column: 19, scope: !931)
!933 = !DILocation(line: 460, column: 22, scope: !931)
!934 = !DILocation(line: 460, column: 30, scope: !931)
!935 = !DILocation(line: 460, column: 16, scope: !931)
!936 = !DILocation(line: 460, column: 14, scope: !920)
!937 = !DILocation(line: 461, column: 27, scope: !931)
!938 = !DILocation(line: 461, column: 9, scope: !931)
!939 = !DILocation(line: 461, column: 12, scope: !931)
!940 = !DILocation(line: 461, column: 20, scope: !931)
!941 = !DILocation(line: 461, column: 25, scope: !931)
!942 = !DILocation(line: 463, column: 28, scope: !931)
!943 = !DILocation(line: 463, column: 9, scope: !931)
!944 = !DILocation(line: 463, column: 12, scope: !931)
!945 = !DILocation(line: 463, column: 20, scope: !931)
!946 = !DILocation(line: 463, column: 26, scope: !931)
!947 = !DILocation(line: 465, column: 17, scope: !888)
!948 = !DILocation(line: 465, column: 5, scope: !888)
!949 = !DILocation(line: 465, column: 8, scope: !888)
!950 = !DILocation(line: 465, column: 15, scope: !888)
!951 = !DILocation(line: 466, column: 17, scope: !888)
!952 = !DILocation(line: 466, column: 5, scope: !888)
!953 = !DILocation(line: 466, column: 8, scope: !888)
!954 = !DILocation(line: 466, column: 15, scope: !888)
!955 = !DILocation(line: 467, column: 1, scope: !888)
!956 = distinct !DISubprogram(name: "rotate_right", scope: !20, file: !20, line: 418, type: !307, scopeLine: 419, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!957 = !DILocalVariable(name: "table", arg: 1, scope: !956, file: !20, line: 418, type: !190)
!958 = !DILocation(line: 418, column: 37, scope: !956)
!959 = !DILocalVariable(name: "x", arg: 2, scope: !956, file: !20, line: 418, type: !195)
!960 = !DILocation(line: 418, column: 52, scope: !956)
!961 = !DILocalVariable(name: "y", scope: !956, file: !20, line: 420, type: !195)
!962 = !DILocation(line: 420, column: 13, scope: !956)
!963 = !DILocation(line: 420, column: 17, scope: !956)
!964 = !DILocation(line: 420, column: 20, scope: !956)
!965 = !DILocation(line: 422, column: 15, scope: !956)
!966 = !DILocation(line: 422, column: 18, scope: !956)
!967 = !DILocation(line: 422, column: 5, scope: !956)
!968 = !DILocation(line: 422, column: 8, scope: !956)
!969 = !DILocation(line: 422, column: 13, scope: !956)
!970 = !DILocation(line: 424, column: 9, scope: !971)
!971 = distinct !DILexicalBlock(scope: !956, file: !20, line: 424, column: 9)
!972 = !DILocation(line: 424, column: 12, scope: !971)
!973 = !DILocation(line: 424, column: 21, scope: !971)
!974 = !DILocation(line: 424, column: 28, scope: !971)
!975 = !DILocation(line: 424, column: 18, scope: !971)
!976 = !DILocation(line: 424, column: 9, scope: !956)
!977 = !DILocation(line: 425, column: 28, scope: !971)
!978 = !DILocation(line: 425, column: 9, scope: !971)
!979 = !DILocation(line: 425, column: 12, scope: !971)
!980 = !DILocation(line: 425, column: 19, scope: !971)
!981 = !DILocation(line: 425, column: 26, scope: !971)
!982 = !DILocation(line: 427, column: 17, scope: !956)
!983 = !DILocation(line: 427, column: 20, scope: !956)
!984 = !DILocation(line: 427, column: 5, scope: !956)
!985 = !DILocation(line: 427, column: 8, scope: !956)
!986 = !DILocation(line: 427, column: 15, scope: !956)
!987 = !DILocation(line: 429, column: 9, scope: !988)
!988 = distinct !DILexicalBlock(scope: !956, file: !20, line: 429, column: 9)
!989 = !DILocation(line: 429, column: 12, scope: !988)
!990 = !DILocation(line: 429, column: 22, scope: !988)
!991 = !DILocation(line: 429, column: 29, scope: !988)
!992 = !DILocation(line: 429, column: 19, scope: !988)
!993 = !DILocation(line: 429, column: 9, scope: !956)
!994 = !DILocation(line: 430, column: 23, scope: !988)
!995 = !DILocation(line: 430, column: 9, scope: !988)
!996 = !DILocation(line: 430, column: 16, scope: !988)
!997 = !DILocation(line: 430, column: 21, scope: !988)
!998 = !DILocation(line: 431, column: 14, scope: !999)
!999 = distinct !DILexicalBlock(scope: !988, file: !20, line: 431, column: 14)
!1000 = !DILocation(line: 431, column: 19, scope: !999)
!1001 = !DILocation(line: 431, column: 22, scope: !999)
!1002 = !DILocation(line: 431, column: 30, scope: !999)
!1003 = !DILocation(line: 431, column: 16, scope: !999)
!1004 = !DILocation(line: 431, column: 14, scope: !988)
!1005 = !DILocation(line: 432, column: 28, scope: !999)
!1006 = !DILocation(line: 432, column: 9, scope: !999)
!1007 = !DILocation(line: 432, column: 12, scope: !999)
!1008 = !DILocation(line: 432, column: 20, scope: !999)
!1009 = !DILocation(line: 432, column: 26, scope: !999)
!1010 = !DILocation(line: 434, column: 27, scope: !999)
!1011 = !DILocation(line: 434, column: 9, scope: !999)
!1012 = !DILocation(line: 434, column: 12, scope: !999)
!1013 = !DILocation(line: 434, column: 20, scope: !999)
!1014 = !DILocation(line: 434, column: 25, scope: !999)
!1015 = !DILocation(line: 436, column: 17, scope: !956)
!1016 = !DILocation(line: 436, column: 5, scope: !956)
!1017 = !DILocation(line: 436, column: 8, scope: !956)
!1018 = !DILocation(line: 436, column: 15, scope: !956)
!1019 = !DILocation(line: 437, column: 17, scope: !956)
!1020 = !DILocation(line: 437, column: 5, scope: !956)
!1021 = !DILocation(line: 437, column: 8, scope: !956)
!1022 = !DILocation(line: 437, column: 15, scope: !956)
!1023 = !DILocation(line: 438, column: 1, scope: !956)
!1024 = distinct !DISubprogram(name: "balanced", scope: !20, file: !20, line: 538, type: !1025, scopeLine: 538, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!1025 = !DISubroutineType(types: !1026)
!1026 = !{!18, !190}
!1027 = !DILocalVariable(name: "t", arg: 1, scope: !1024, file: !20, line: 538, type: !190)
!1028 = !DILocation(line: 538, column: 25, scope: !1024)
!1029 = !DILocation(line: 539, column: 23, scope: !1024)
!1030 = !DILocation(line: 539, column: 26, scope: !1024)
!1031 = !DILocation(line: 539, column: 29, scope: !1024)
!1032 = !DILocation(line: 539, column: 35, scope: !1024)
!1033 = !DILocation(line: 539, column: 16, scope: !1024)
!1034 = !DILocation(line: 539, column: 50, scope: !1024)
!1035 = !DILocation(line: 539, column: 53, scope: !1024)
!1036 = !DILocation(line: 539, column: 56, scope: !1024)
!1037 = !DILocation(line: 539, column: 62, scope: !1024)
!1038 = !DILocation(line: 539, column: 43, scope: !1024)
!1039 = !DILocation(line: 539, column: 41, scope: !1024)
!1040 = !DILocation(line: 539, column: 12, scope: !1024)
!1041 = !DILocation(line: 539, column: 70, scope: !1024)
!1042 = !DILocation(line: 539, column: 5, scope: !1024)
!1043 = distinct !DISubprogram(name: "height", scope: !20, file: !20, line: 527, type: !1044, scopeLine: 527, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!1044 = !DISubroutineType(types: !1045)
!1045 = !{!18, !190, !195}
!1046 = !DILocalVariable(name: "t", arg: 1, scope: !1043, file: !20, line: 527, type: !190)
!1047 = !DILocation(line: 527, column: 30, scope: !1043)
!1048 = !DILocalVariable(name: "node", arg: 2, scope: !1043, file: !20, line: 527, type: !195)
!1049 = !DILocation(line: 527, column: 41, scope: !1043)
!1050 = !DILocation(line: 529, column: 9, scope: !1051)
!1051 = distinct !DILexicalBlock(scope: !1043, file: !20, line: 529, column: 9)
!1052 = !DILocation(line: 529, column: 17, scope: !1051)
!1053 = !DILocation(line: 529, column: 20, scope: !1051)
!1054 = !DILocation(line: 529, column: 14, scope: !1051)
!1055 = !DILocation(line: 529, column: 9, scope: !1043)
!1056 = !DILocation(line: 530, column: 9, scope: !1051)
!1057 = !DILocalVariable(name: "leftHeight", scope: !1043, file: !20, line: 532, type: !18)
!1058 = !DILocation(line: 532, column: 9, scope: !1043)
!1059 = !DILocation(line: 532, column: 29, scope: !1043)
!1060 = !DILocation(line: 532, column: 32, scope: !1043)
!1061 = !DILocation(line: 532, column: 38, scope: !1043)
!1062 = !DILocation(line: 532, column: 22, scope: !1043)
!1063 = !DILocalVariable(name: "rightHeight", scope: !1043, file: !20, line: 533, type: !18)
!1064 = !DILocation(line: 533, column: 9, scope: !1043)
!1065 = !DILocation(line: 533, column: 30, scope: !1043)
!1066 = !DILocation(line: 533, column: 33, scope: !1043)
!1067 = !DILocation(line: 533, column: 39, scope: !1043)
!1068 = !DILocation(line: 533, column: 23, scope: !1043)
!1069 = !DILocation(line: 535, column: 12, scope: !1043)
!1070 = !DILocation(line: 535, column: 25, scope: !1043)
!1071 = !DILocation(line: 535, column: 23, scope: !1043)
!1072 = !DILocation(line: 535, column: 5, scope: !1043)
!1073 = !DILocation(line: 536, column: 1, scope: !1043)
!1074 = distinct !DISubprogram(name: "sorted", scope: !20, file: !20, line: 558, type: !1025, scopeLine: 558, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!1075 = !DILocalVariable(name: "t", arg: 1, scope: !1074, file: !20, line: 558, type: !190)
!1076 = !DILocation(line: 558, column: 23, scope: !1074)
!1077 = !DILocation(line: 559, column: 21, scope: !1074)
!1078 = !DILocation(line: 559, column: 24, scope: !1074)
!1079 = !DILocation(line: 559, column: 27, scope: !1074)
!1080 = !DILocation(line: 559, column: 12, scope: !1074)
!1081 = !DILocation(line: 559, column: 5, scope: !1074)
!1082 = distinct !DISubprogram(name: "isSorted", scope: !20, file: !20, line: 542, type: !1044, scopeLine: 542, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!1083 = !DILocalVariable(name: "t", arg: 1, scope: !1082, file: !20, line: 542, type: !190)
!1084 = !DILocation(line: 542, column: 32, scope: !1082)
!1085 = !DILocalVariable(name: "node", arg: 2, scope: !1082, file: !20, line: 542, type: !195)
!1086 = !DILocation(line: 542, column: 43, scope: !1082)
!1087 = !DILocation(line: 544, column: 9, scope: !1088)
!1088 = distinct !DILexicalBlock(scope: !1082, file: !20, line: 544, column: 9)
!1089 = !DILocation(line: 544, column: 17, scope: !1088)
!1090 = !DILocation(line: 544, column: 20, scope: !1088)
!1091 = !DILocation(line: 544, column: 14, scope: !1088)
!1092 = !DILocation(line: 544, column: 9, scope: !1082)
!1093 = !DILocation(line: 545, column: 9, scope: !1088)
!1094 = !DILocalVariable(name: "maxLeft", scope: !1082, file: !20, line: 547, type: !195)
!1095 = !DILocation(line: 547, column: 13, scope: !1082)
!1096 = !DILocation(line: 547, column: 32, scope: !1082)
!1097 = !DILocation(line: 547, column: 35, scope: !1082)
!1098 = !DILocation(line: 547, column: 41, scope: !1082)
!1099 = !DILocation(line: 547, column: 23, scope: !1082)
!1100 = !DILocalVariable(name: "minRight", scope: !1082, file: !20, line: 548, type: !195)
!1101 = !DILocation(line: 548, column: 13, scope: !1082)
!1102 = !DILocation(line: 548, column: 33, scope: !1082)
!1103 = !DILocation(line: 548, column: 36, scope: !1082)
!1104 = !DILocation(line: 548, column: 42, scope: !1082)
!1105 = !DILocation(line: 548, column: 24, scope: !1082)
!1106 = !DILocation(line: 550, column: 10, scope: !1107)
!1107 = distinct !DILexicalBlock(scope: !1082, file: !20, line: 550, column: 9)
!1108 = !DILocation(line: 550, column: 21, scope: !1107)
!1109 = !DILocation(line: 550, column: 24, scope: !1107)
!1110 = !DILocation(line: 550, column: 18, scope: !1107)
!1111 = !DILocation(line: 550, column: 33, scope: !1107)
!1112 = !DILocation(line: 550, column: 36, scope: !1107)
!1113 = !DILocation(line: 550, column: 42, scope: !1107)
!1114 = !DILocation(line: 550, column: 48, scope: !1107)
!1115 = !DILocation(line: 550, column: 57, scope: !1107)
!1116 = !DILocation(line: 550, column: 46, scope: !1107)
!1117 = !DILocation(line: 550, column: 62, scope: !1107)
!1118 = !DILocation(line: 551, column: 10, scope: !1107)
!1119 = !DILocation(line: 551, column: 22, scope: !1107)
!1120 = !DILocation(line: 551, column: 25, scope: !1107)
!1121 = !DILocation(line: 551, column: 19, scope: !1107)
!1122 = !DILocation(line: 551, column: 34, scope: !1107)
!1123 = !DILocation(line: 551, column: 38, scope: !1107)
!1124 = !DILocation(line: 551, column: 44, scope: !1107)
!1125 = !DILocation(line: 551, column: 50, scope: !1107)
!1126 = !DILocation(line: 551, column: 60, scope: !1107)
!1127 = !DILocation(line: 551, column: 48, scope: !1107)
!1128 = !DILocation(line: 550, column: 9, scope: !1082)
!1129 = !DILocation(line: 552, column: 9, scope: !1107)
!1130 = !DILocation(line: 554, column: 21, scope: !1082)
!1131 = !DILocation(line: 554, column: 24, scope: !1082)
!1132 = !DILocation(line: 554, column: 30, scope: !1082)
!1133 = !DILocation(line: 554, column: 12, scope: !1082)
!1134 = !DILocation(line: 554, column: 36, scope: !1082)
!1135 = !DILocation(line: 554, column: 48, scope: !1082)
!1136 = !DILocation(line: 554, column: 51, scope: !1082)
!1137 = !DILocation(line: 554, column: 57, scope: !1082)
!1138 = !DILocation(line: 554, column: 39, scope: !1082)
!1139 = !DILocation(line: 0, scope: !1082)
!1140 = !DILocation(line: 554, column: 5, scope: !1082)
!1141 = !DILocation(line: 556, column: 1, scope: !1082)
!1142 = distinct !DISubprogram(name: "tree_max", scope: !20, file: !20, line: 402, type: !444, scopeLine: 403, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!1143 = !DILocalVariable(name: "table", arg: 1, scope: !1142, file: !20, line: 402, type: !334)
!1144 = !DILocation(line: 402, column: 56, scope: !1142)
!1145 = !DILocalVariable(name: "n", arg: 2, scope: !1142, file: !20, line: 402, type: !195)
!1146 = !DILocation(line: 402, column: 71, scope: !1142)
!1147 = !DILocalVariable(name: "s", scope: !1142, file: !20, line: 404, type: !195)
!1148 = !DILocation(line: 404, column: 13, scope: !1142)
!1149 = !DILocation(line: 404, column: 17, scope: !1142)
!1150 = !DILocation(line: 404, column: 24, scope: !1142)
!1151 = !DILocation(line: 406, column: 5, scope: !1142)
!1152 = !DILocation(line: 406, column: 12, scope: !1142)
!1153 = !DILocation(line: 406, column: 15, scope: !1142)
!1154 = !DILocation(line: 406, column: 24, scope: !1142)
!1155 = !DILocation(line: 406, column: 21, scope: !1142)
!1156 = !DILocation(line: 407, column: 13, scope: !1142)
!1157 = !DILocation(line: 407, column: 16, scope: !1142)
!1158 = !DILocation(line: 407, column: 11, scope: !1142)
!1159 = distinct !{!1159, !1151, !1157, !109}
!1160 = !DILocation(line: 408, column: 12, scope: !1142)
!1161 = !DILocation(line: 408, column: 5, scope: !1142)
