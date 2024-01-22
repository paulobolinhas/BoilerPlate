; ModuleID = 'prog'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.treetable_s = type { %struct.rbnode_s*, %struct.rbnode_s*, i64, i32 (i8*, i8*)*, i8* (i64)*, i8* (i64, i64)*, void (i8*)* }
%struct.rbnode_s = type { i8*, i8*, i8, %struct.rbnode_s*, %struct.rbnode_s*, %struct.rbnode_s* }
%struct.treetable_conf_s = type { i32 (i8*, i8*)*, i8* (i64)*, i8* (i64, i64)*, void (i8*)* }

@__const.main.value1 = private unnamed_addr constant [4 x i8] c"aaa\00", align 1
@__const.main.value2 = private unnamed_addr constant [4 x i8] c"bbb\00", align 1
@.str = private unnamed_addr constant [5 x i8] c"key1\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"key2\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"(char*) value == value1\00", align 1
@.str.3 = private unnamed_addr constant [12 x i8] c"add_nodes.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"(char*) value == value2\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !34 {
entry:
  %retval = alloca i32, align 4
  %table = alloca %struct.treetable_s*, align 8
  %key1 = alloca i32, align 4
  %key2 = alloca i32, align 4
  %value1 = alloca [4 x i8], align 1
  %value2 = alloca [4 x i8], align 1
  %value = alloca i8*, align 8
  store i32 0, i32* %retval, align 4
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table, metadata !37, metadata !DIExpression()), !dbg !42
  %call = call i32 @treetable_new(%struct.treetable_s** %table), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %key1, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %key2, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [4 x i8]* %value1, metadata !48, metadata !DIExpression()), !dbg !52
  %0 = bitcast [4 x i8]* %value1 to i8*, !dbg !52
  %1 = call i8* @memcpy(i8* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__const.main.value1, i32 0, i32 0), i64 4), !dbg !52
  call void @llvm.dbg.declare(metadata [4 x i8]* %value2, metadata !53, metadata !DIExpression()), !dbg !54
  %2 = bitcast [4 x i8]* %value2 to i8*, !dbg !54
  %3 = call i8* @memcpy(i8* %2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__const.main.value2, i32 0, i32 0), i64 4), !dbg !54
  %4 = bitcast i32* %key1 to i8*, !dbg !55
  call void @klee_make_symbolic(i8* %4, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !56
  %5 = bitcast i32* %key2 to i8*, !dbg !57
  call void @klee_make_symbolic(i8* %5, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !58
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !59
  %7 = bitcast i32* %key1 to i8*, !dbg !60
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %value1, i64 0, i64 0, !dbg !61
  %call1 = call i32 @treetable_add(%struct.treetable_s* %6, i8* %7, i8* %arraydecay), !dbg !62
  %8 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !63
  %9 = bitcast i32* %key2 to i8*, !dbg !64
  %arraydecay2 = getelementptr inbounds [4 x i8], [4 x i8]* %value2, i64 0, i64 0, !dbg !65
  %call3 = call i32 @treetable_add(%struct.treetable_s* %8, i8* %9, i8* %arraydecay2), !dbg !66
  call void @llvm.dbg.declare(metadata i8** %value, metadata !67, metadata !DIExpression()), !dbg !68
  %10 = load i32, i32* %key1, align 4, !dbg !69
  %11 = load i32, i32* %key2, align 4, !dbg !71
  %cmp = icmp ne i32 %10, %11, !dbg !72
  br i1 %cmp, label %land.lhs.true, label %if.end9, !dbg !73

land.lhs.true:                                    ; preds = %entry
  %12 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !74
  %13 = bitcast i32* %key1 to i8*, !dbg !75
  %call4 = call zeroext i1 @treetable_contains_key(%struct.treetable_s* %12, i8* %13), !dbg !76
  br i1 %call4, label %if.then, label %if.end9, !dbg !77

if.then:                                          ; preds = %land.lhs.true
  %14 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !78
  %15 = bitcast i32* %key1 to i8*, !dbg !80
  %call5 = call i32 @treetable_get(%struct.treetable_s* %14, i8* %15, i8** %value), !dbg !81
  %16 = load i8*, i8** %value, align 8, !dbg !82
  %arraydecay6 = getelementptr inbounds [4 x i8], [4 x i8]* %value1, i64 0, i64 0, !dbg !82
  %cmp7 = icmp eq i8* %16, %arraydecay6, !dbg !82
  br i1 %cmp7, label %if.end9, label %if.else, !dbg !85

if.else:                                          ; preds = %if.then
  call void @__assert_fail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), i32 26, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #7, !dbg !82
  unreachable, !dbg !82

if.end9:                                          ; preds = %if.then, %land.lhs.true, %entry
  %17 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !86
  %18 = bitcast i32* %key2 to i8*, !dbg !88
  %call10 = call zeroext i1 @treetable_contains_key(%struct.treetable_s* %17, i8* %18), !dbg !89
  br i1 %call10, label %if.then11, label %if.end18, !dbg !90

if.then11:                                        ; preds = %if.end9
  %19 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !91
  %20 = bitcast i32* %key2 to i8*, !dbg !93
  %call12 = call i32 @treetable_get(%struct.treetable_s* %19, i8* %20, i8** %value), !dbg !94
  %21 = load i8*, i8** %value, align 8, !dbg !95
  %arraydecay13 = getelementptr inbounds [4 x i8], [4 x i8]* %value2, i64 0, i64 0, !dbg !95
  %cmp14 = icmp eq i8* %21, %arraydecay13, !dbg !95
  br i1 %cmp14, label %if.end18, label %if.else16, !dbg !98

if.else16:                                        ; preds = %if.then11
  call void @__assert_fail(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.3, i64 0, i64 0), i32 31, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #7, !dbg !95
  unreachable, !dbg !95

if.end18:                                         ; preds = %if.then11, %if.end9
  %22 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !99
  call void @treetable_destroy(%struct.treetable_s* %22), !dbg !100
  %23 = load i32, i32* %retval, align 4, !dbg !101
  ret i32 %23, !dbg !101
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #3

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @cmp(i8* %e1, i8* %e2) #0 !dbg !102 {
entry:
  %retval = alloca i32, align 4
  %e1.addr = alloca i8*, align 8
  %e2.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %e1, i8** %e1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %e1.addr, metadata !107, metadata !DIExpression()), !dbg !108
  store i8* %e2, i8** %e2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %e2.addr, metadata !109, metadata !DIExpression()), !dbg !110
  call void @llvm.dbg.declare(metadata i32* %i, metadata !111, metadata !DIExpression()), !dbg !112
  %0 = load i8*, i8** %e1.addr, align 8, !dbg !113
  %1 = bitcast i8* %0 to i32*, !dbg !114
  %2 = load i32, i32* %1, align 4, !dbg !115
  store i32 %2, i32* %i, align 4, !dbg !112
  call void @llvm.dbg.declare(metadata i32* %j, metadata !116, metadata !DIExpression()), !dbg !117
  %3 = load i8*, i8** %e2.addr, align 8, !dbg !118
  %4 = bitcast i8* %3 to i32*, !dbg !119
  %5 = load i32, i32* %4, align 4, !dbg !120
  store i32 %5, i32* %j, align 4, !dbg !117
  %6 = load i32, i32* %i, align 4, !dbg !121
  %7 = load i32, i32* %j, align 4, !dbg !123
  %cmp = icmp slt i32 %6, %7, !dbg !124
  br i1 %cmp, label %if.then, label %if.end, !dbg !125

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !126
  br label %return, !dbg !126

if.end:                                           ; preds = %entry
  %8 = load i32, i32* %i, align 4, !dbg !127
  %9 = load i32, i32* %j, align 4, !dbg !129
  %cmp1 = icmp eq i32 %8, %9, !dbg !130
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !131

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !132
  br label %return, !dbg !132

if.end3:                                          ; preds = %if.end
  store i32 1, i32* %retval, align 4, !dbg !133
  br label %return, !dbg !133

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !134
  ret i32 %10, !dbg !134
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @treetable_conf_init(%struct.treetable_conf_s* %conf) #0 !dbg !135 {
entry:
  %conf.addr = alloca %struct.treetable_conf_s*, align 8
  store %struct.treetable_conf_s* %conf, %struct.treetable_conf_s** %conf.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s** %conf.addr, metadata !160, metadata !DIExpression()), !dbg !161
  %0 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !162
  %mem_alloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %0, i32 0, i32 1, !dbg !163
  store i8* (i64)* @malloc, i8* (i64)** %mem_alloc, align 8, !dbg !164
  %1 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !165
  %mem_calloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %1, i32 0, i32 2, !dbg !166
  store i8* (i64, i64)* @calloc, i8* (i64, i64)** %mem_calloc, align 8, !dbg !167
  %2 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !168
  %mem_free = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %2, i32 0, i32 3, !dbg !169
  store void (i8*)* @free, void (i8*)** %mem_free, align 8, !dbg !170
  %3 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !171
  %cmp = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %3, i32 0, i32 0, !dbg !172
  store i32 (i8*, i8*)* @cmp, i32 (i8*, i8*)** %cmp, align 8, !dbg !173
  ret void, !dbg !174
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_new(%struct.treetable_s** %tt) #0 !dbg !175 {
entry:
  %tt.addr = alloca %struct.treetable_s**, align 8
  %conf = alloca %struct.treetable_conf_s, align 8
  store %struct.treetable_s** %tt, %struct.treetable_s*** %tt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s*** %tt.addr, metadata !201, metadata !DIExpression()), !dbg !202
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s* %conf, metadata !203, metadata !DIExpression()), !dbg !204
  call void @treetable_conf_init(%struct.treetable_conf_s* %conf), !dbg !205
  %0 = load %struct.treetable_s**, %struct.treetable_s*** %tt.addr, align 8, !dbg !206
  %call = call i32 @treetable_new_conf(%struct.treetable_conf_s* %conf, %struct.treetable_s** %0), !dbg !207
  ret i32 %call, !dbg !208
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_new_conf(%struct.treetable_conf_s* %conf, %struct.treetable_s** %tt) #0 !dbg !209 {
entry:
  %retval = alloca i32, align 4
  %conf.addr = alloca %struct.treetable_conf_s*, align 8
  %tt.addr = alloca %struct.treetable_s**, align 8
  %table = alloca %struct.treetable_s*, align 8
  %sentinel = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_conf_s* %conf, %struct.treetable_conf_s** %conf.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s** %conf.addr, metadata !215, metadata !DIExpression()), !dbg !216
  store %struct.treetable_s** %tt, %struct.treetable_s*** %tt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s*** %tt.addr, metadata !217, metadata !DIExpression()), !dbg !218
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table, metadata !219, metadata !DIExpression()), !dbg !220
  %0 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !221
  %mem_calloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %0, i32 0, i32 2, !dbg !222
  %1 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc, align 8, !dbg !222
  %call = call i8* %1(i64 1, i64 56), !dbg !221
  %2 = bitcast i8* %call to %struct.treetable_s*, !dbg !221
  store %struct.treetable_s* %2, %struct.treetable_s** %table, align 8, !dbg !220
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !223
  %tobool = icmp ne %struct.treetable_s* %3, null, !dbg !223
  br i1 %tobool, label %if.end, label %if.then, !dbg !225

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !226
  br label %return, !dbg !226

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %sentinel, metadata !227, metadata !DIExpression()), !dbg !228
  %4 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !229
  %mem_calloc1 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %4, i32 0, i32 2, !dbg !230
  %5 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc1, align 8, !dbg !230
  %call2 = call i8* %5(i64 1, i64 48), !dbg !229
  %6 = bitcast i8* %call2 to %struct.rbnode_s*, !dbg !229
  store %struct.rbnode_s* %6, %struct.rbnode_s** %sentinel, align 8, !dbg !228
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !231
  %tobool3 = icmp ne %struct.rbnode_s* %7, null, !dbg !231
  br i1 %tobool3, label %if.end5, label %if.then4, !dbg !233

if.then4:                                         ; preds = %if.end
  %8 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !234
  %mem_free = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %8, i32 0, i32 3, !dbg !236
  %9 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !236
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !237
  %11 = bitcast %struct.treetable_s* %10 to i8*, !dbg !237
  call void %9(i8* %11), !dbg !234
  store i32 1, i32* %retval, align 4, !dbg !238
  br label %return, !dbg !238

if.end5:                                          ; preds = %if.end
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !239
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 2, !dbg !240
  store i8 1, i8* %color, align 8, !dbg !241
  %13 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !242
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %13, i32 0, i32 2, !dbg !243
  store i64 0, i64* %size, align 8, !dbg !244
  %14 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !245
  %cmp = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %14, i32 0, i32 0, !dbg !246
  %15 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp, align 8, !dbg !246
  %16 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !247
  %cmp6 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %16, i32 0, i32 3, !dbg !248
  store i32 (i8*, i8*)* %15, i32 (i8*, i8*)** %cmp6, align 8, !dbg !249
  %17 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !250
  %mem_alloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %17, i32 0, i32 1, !dbg !251
  %18 = load i8* (i64)*, i8* (i64)** %mem_alloc, align 8, !dbg !251
  %19 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !252
  %mem_alloc7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %19, i32 0, i32 4, !dbg !253
  store i8* (i64)* %18, i8* (i64)** %mem_alloc7, align 8, !dbg !254
  %20 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !255
  %mem_calloc8 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %20, i32 0, i32 2, !dbg !256
  %21 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc8, align 8, !dbg !256
  %22 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !257
  %mem_calloc9 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %22, i32 0, i32 5, !dbg !258
  store i8* (i64, i64)* %21, i8* (i64, i64)** %mem_calloc9, align 8, !dbg !259
  %23 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !260
  %mem_free10 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %23, i32 0, i32 3, !dbg !261
  %24 = load void (i8*)*, void (i8*)** %mem_free10, align 8, !dbg !261
  %25 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !262
  %mem_free11 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %25, i32 0, i32 6, !dbg !263
  store void (i8*)* %24, void (i8*)** %mem_free11, align 8, !dbg !264
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !265
  %27 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !266
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %27, i32 0, i32 0, !dbg !267
  store %struct.rbnode_s* %26, %struct.rbnode_s** %root, align 8, !dbg !268
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !269
  %29 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !270
  %sentinel12 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %29, i32 0, i32 1, !dbg !271
  store %struct.rbnode_s* %28, %struct.rbnode_s** %sentinel12, align 8, !dbg !272
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !273
  %31 = load %struct.treetable_s**, %struct.treetable_s*** %tt.addr, align 8, !dbg !274
  store %struct.treetable_s* %30, %struct.treetable_s** %31, align 8, !dbg !275
  store i32 0, i32* %retval, align 4, !dbg !276
  br label %return, !dbg !276

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %32 = load i32, i32* %retval, align 4, !dbg !277
  ret i32 %32, !dbg !277
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @treetable_destroy(%struct.treetable_s* %table) #0 !dbg !278 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !281, metadata !DIExpression()), !dbg !282
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !283
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !284
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !285
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !285
  call void @tree_destroy(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !286
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !287
  %mem_free = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %3, i32 0, i32 6, !dbg !288
  %4 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !288
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !289
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !290
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !290
  %7 = bitcast %struct.rbnode_s* %6 to i8*, !dbg !289
  call void %4(i8* %7), !dbg !287
  %8 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !291
  %mem_free1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %8, i32 0, i32 6, !dbg !292
  %9 = load void (i8*)*, void (i8*)** %mem_free1, align 8, !dbg !292
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !293
  %11 = bitcast %struct.treetable_s* %10 to i8*, !dbg !293
  call void %9(i8* %11), !dbg !291
  ret void, !dbg !294
}

; Function Attrs: noinline nounwind uwtable
define internal void @tree_destroy(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !295 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !298, metadata !DIExpression()), !dbg !299
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !300, metadata !DIExpression()), !dbg !301
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !302
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !304
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !305
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !305
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !306
  br i1 %cmp, label %return, label %if.end, !dbg !307

if.end:                                           ; preds = %entry
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !308
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !309
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !310
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !310
  call void @tree_destroy(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !311
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !312
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !313
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !314
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !314
  call void @tree_destroy(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !315
  %9 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !316
  %mem_free = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %9, i32 0, i32 6, !dbg !317
  %10 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !317
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !318
  %12 = bitcast %struct.rbnode_s* %11 to i8*, !dbg !318
  call void %10(i8* %12), !dbg !316
  br label %return, !dbg !319

return:                                           ; preds = %entry, %if.end
  ret void, !dbg !319
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get(%struct.treetable_s* %table, i8* %key, i8** %out) #0 !dbg !320 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %out.addr = alloca i8**, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !327, metadata !DIExpression()), !dbg !328
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !329, metadata !DIExpression()), !dbg !330
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !331, metadata !DIExpression()), !dbg !332
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !333, metadata !DIExpression()), !dbg !334
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !335
  %1 = load i8*, i8** %key.addr, align 8, !dbg !336
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !337
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !334
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !338
  %tobool = icmp ne %struct.rbnode_s* %2, null, !dbg !338
  br i1 %tobool, label %if.end, label %if.then, !dbg !340

if.then:                                          ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !341
  br label %return, !dbg !341

if.end:                                           ; preds = %entry
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !342
  %value = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %3, i32 0, i32 1, !dbg !343
  %4 = load i8*, i8** %value, align 8, !dbg !343
  %5 = load i8**, i8*** %out.addr, align 8, !dbg !344
  store i8* %4, i8** %5, align 8, !dbg !345
  store i32 0, i32* %retval, align 4, !dbg !346
  br label %return, !dbg !346

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !347
  ret i32 %6, !dbg !347
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %table, i8* %key) #0 !dbg !348 {
entry:
  %retval = alloca %struct.rbnode_s*, align 8
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %n = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  %cmp1 = alloca i32, align 4
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !351, metadata !DIExpression()), !dbg !352
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !353, metadata !DIExpression()), !dbg !354
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !355
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 2, !dbg !357
  %1 = load i64, i64* %size, align 8, !dbg !357
  %cmp = icmp eq i64 %1, 0, !dbg !358
  br i1 %cmp, label %if.then, label %if.end, !dbg !359

if.then:                                          ; preds = %entry
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !360
  br label %return, !dbg !360

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !361, metadata !DIExpression()), !dbg !362
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !363
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %2, i32 0, i32 0, !dbg !364
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !364
  store %struct.rbnode_s* %3, %struct.rbnode_s** %n, align 8, !dbg !362
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !365, metadata !DIExpression()), !dbg !366
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !367
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !368
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !368
  store %struct.rbnode_s* %5, %struct.rbnode_s** %s, align 8, !dbg !366
  call void @llvm.dbg.declare(metadata i32* %cmp1, metadata !369, metadata !DIExpression()), !dbg !370
  br label %do.body, !dbg !371

do.body:                                          ; preds = %do.cond, %if.end
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !372
  %cmp2 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %6, i32 0, i32 3, !dbg !374
  %7 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp2, align 8, !dbg !374
  %8 = load i8*, i8** %key.addr, align 8, !dbg !375
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !376
  %key3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 0, !dbg !377
  %10 = load i8*, i8** %key3, align 8, !dbg !377
  %call = call i32 %7(i8* %8, i8* %10), !dbg !372
  store i32 %call, i32* %cmp1, align 4, !dbg !378
  %11 = load i32, i32* %cmp1, align 4, !dbg !379
  %cmp4 = icmp slt i32 %11, 0, !dbg !381
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !382

if.then5:                                         ; preds = %do.body
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !383
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 4, !dbg !384
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !384
  store %struct.rbnode_s* %13, %struct.rbnode_s** %n, align 8, !dbg !385
  br label %do.cond, !dbg !386

if.else:                                          ; preds = %do.body
  %14 = load i32, i32* %cmp1, align 4, !dbg !387
  %cmp6 = icmp sgt i32 %14, 0, !dbg !389
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !390

if.then7:                                         ; preds = %if.else
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !391
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 5, !dbg !392
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !392
  store %struct.rbnode_s* %16, %struct.rbnode_s** %n, align 8, !dbg !393
  br label %do.cond

if.else8:                                         ; preds = %if.else
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !394
  store %struct.rbnode_s* %17, %struct.rbnode_s** %retval, align 8, !dbg !395
  br label %return, !dbg !395

do.cond:                                          ; preds = %if.then5, %if.then7
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !396
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !397
  %cmp11 = icmp ne %struct.rbnode_s* %18, %19, !dbg !398
  %20 = load i32, i32* %cmp1, align 4, !dbg !399
  %cmp12 = icmp ne i32 %20, 0, !dbg !399
  %21 = select i1 %cmp11, i1 %cmp12, i1 false, !dbg !399
  br i1 %21, label %do.body, label %do.end, !dbg !400, !llvm.loop !401

do.end:                                           ; preds = %do.cond
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !404
  br label %return, !dbg !404

return:                                           ; preds = %do.end, %if.else8, %if.then
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %retval, align 8, !dbg !405
  ret %struct.rbnode_s* %22, !dbg !405
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get_first_key(%struct.treetable_s* %table, i8** %out) #0 !dbg !406 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %out.addr = alloca i8**, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !409, metadata !DIExpression()), !dbg !410
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !411, metadata !DIExpression()), !dbg !412
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !413, metadata !DIExpression()), !dbg !414
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !415
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !416
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !417
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !417
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !418
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !414
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !419
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !421
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !422
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !422
  %cmp = icmp ne %struct.rbnode_s* %3, %5, !dbg !423
  br i1 %cmp, label %if.then, label %if.end, !dbg !424

if.then:                                          ; preds = %entry
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !425
  %key = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 0, !dbg !427
  %7 = load i8*, i8** %key, align 8, !dbg !427
  %8 = load i8**, i8*** %out.addr, align 8, !dbg !428
  store i8* %7, i8** %8, align 8, !dbg !429
  store i32 0, i32* %retval, align 4, !dbg !430
  br label %return, !dbg !430

if.end:                                           ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !431
  br label %return, !dbg !431

return:                                           ; preds = %if.end, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !432
  ret i32 %9, !dbg !432
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @tree_min(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !433 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !436, metadata !DIExpression()), !dbg !437
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !438, metadata !DIExpression()), !dbg !439
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !440, metadata !DIExpression()), !dbg !441
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !442
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !443
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !443
  store %struct.rbnode_s* %1, %struct.rbnode_s** %s, align 8, !dbg !441
  br label %while.cond, !dbg !444

while.cond:                                       ; preds = %while.body, %entry
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !445
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !446
  %cmp = icmp ne %struct.rbnode_s* %2, %3, !dbg !447
  br i1 %cmp, label %land.rhs, label %while.end, !dbg !448

land.rhs:                                         ; preds = %while.cond
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !449
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !450
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !450
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !451
  %cmp1 = icmp ne %struct.rbnode_s* %5, %6, !dbg !452
  br i1 %cmp1, label %while.body, label %while.end, !dbg !444

while.body:                                       ; preds = %land.rhs
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !453
  %left2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 4, !dbg !454
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %left2, align 8, !dbg !454
  store %struct.rbnode_s* %8, %struct.rbnode_s** %n.addr, align 8, !dbg !455
  br label %while.cond, !dbg !444, !llvm.loop !456

while.end:                                        ; preds = %while.cond, %land.rhs
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !457
  ret %struct.rbnode_s* %9, !dbg !458
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get_greater_than(%struct.treetable_s* %table, i8* %key, i8** %out) #0 !dbg !459 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %out.addr = alloca i8**, align 8
  %n = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !460, metadata !DIExpression()), !dbg !461
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !462, metadata !DIExpression()), !dbg !463
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !464, metadata !DIExpression()), !dbg !465
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !466, metadata !DIExpression()), !dbg !467
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !468
  %1 = load i8*, i8** %key.addr, align 8, !dbg !469
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !470
  store %struct.rbnode_s* %call, %struct.rbnode_s** %n, align 8, !dbg !467
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !471, metadata !DIExpression()), !dbg !472
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !473
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !474
  %call1 = call %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %2, %struct.rbnode_s* %3), !dbg !475
  store %struct.rbnode_s* %call1, %struct.rbnode_s** %s, align 8, !dbg !472
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !476
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !478
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !479
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !479
  %cmp = icmp ne %struct.rbnode_s* %4, %6, !dbg !480
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8
  %tobool = icmp ne %struct.rbnode_s* %7, null
  %or.cond = select i1 %cmp, i1 %tobool, i1 false, !dbg !481
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8
  %tobool3 = icmp ne %struct.rbnode_s* %8, null
  %or.cond1 = select i1 %or.cond, i1 %tobool3, i1 false, !dbg !481
  br i1 %or.cond1, label %if.then, label %if.end, !dbg !481

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !482
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 0, !dbg !484
  %10 = load i8*, i8** %key4, align 8, !dbg !484
  %11 = load i8**, i8*** %out.addr, align 8, !dbg !485
  store i8* %10, i8** %11, align 8, !dbg !486
  store i32 0, i32* %retval, align 4, !dbg !487
  br label %return, !dbg !487

if.end:                                           ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !488
  br label %return, !dbg !488

return:                                           ; preds = %if.end, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !489
  ret i32 %12, !dbg !489
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !490 {
entry:
  %retval = alloca %struct.rbnode_s*, align 8
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !491, metadata !DIExpression()), !dbg !492
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !493, metadata !DIExpression()), !dbg !494
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !495
  %cmp = icmp eq %struct.rbnode_s* %0, null, !dbg !497
  br i1 %cmp, label %if.then, label %if.end, !dbg !498

if.then:                                          ; preds = %entry
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !499
  br label %return, !dbg !499

if.end:                                           ; preds = %entry
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !500
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %1, i32 0, i32 5, !dbg !502
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !502
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !503
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %3, i32 0, i32 1, !dbg !504
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !504
  %cmp1 = icmp ne %struct.rbnode_s* %2, %4, !dbg !505
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !506

if.then2:                                         ; preds = %if.end
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !507
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !508
  %right3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 5, !dbg !509
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %right3, align 8, !dbg !509
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %5, %struct.rbnode_s* %7), !dbg !510
  store %struct.rbnode_s* %call, %struct.rbnode_s** %retval, align 8, !dbg !511
  br label %return, !dbg !511

if.end4:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !512, metadata !DIExpression()), !dbg !513
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !514
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %8, i32 0, i32 3, !dbg !515
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %parent, align 8, !dbg !515
  store %struct.rbnode_s* %9, %struct.rbnode_s** %y, align 8, !dbg !513
  br label %while.cond, !dbg !516

while.cond:                                       ; preds = %while.body, %if.end4
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !517
  %11 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !518
  %sentinel5 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %11, i32 0, i32 1, !dbg !519
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel5, align 8, !dbg !519
  %cmp6 = icmp ne %struct.rbnode_s* %10, %12, !dbg !520
  br i1 %cmp6, label %land.rhs, label %while.end, !dbg !521

land.rhs:                                         ; preds = %while.cond
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !522
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !523
  %right7 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 5, !dbg !524
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %right7, align 8, !dbg !524
  %cmp8 = icmp eq %struct.rbnode_s* %13, %15, !dbg !525
  br i1 %cmp8, label %while.body, label %while.end, !dbg !516

while.body:                                       ; preds = %land.rhs
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !526
  store %struct.rbnode_s* %16, %struct.rbnode_s** %x.addr, align 8, !dbg !528
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !529
  %parent9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 3, !dbg !530
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %parent9, align 8, !dbg !530
  store %struct.rbnode_s* %18, %struct.rbnode_s** %y, align 8, !dbg !531
  br label %while.cond, !dbg !516, !llvm.loop !532

while.end:                                        ; preds = %while.cond, %land.rhs
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !534
  store %struct.rbnode_s* %19, %struct.rbnode_s** %retval, align 8, !dbg !535
  br label %return, !dbg !535

return:                                           ; preds = %while.end, %if.then2, %if.then
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %retval, align 8, !dbg !536
  ret %struct.rbnode_s* %20, !dbg !536
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @treetable_size(%struct.treetable_s* %table) #0 !dbg !537 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !540, metadata !DIExpression()), !dbg !541
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !542
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 2, !dbg !543
  %1 = load i64, i64* %size, align 8, !dbg !543
  ret i64 %1, !dbg !544
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @treetable_contains_key(%struct.treetable_s* %table, i8* %key) #0 !dbg !545 {
entry:
  %retval = alloca i1, align 1
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !549, metadata !DIExpression()), !dbg !550
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !551, metadata !DIExpression()), !dbg !552
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !553, metadata !DIExpression()), !dbg !554
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !555
  %1 = load i8*, i8** %key.addr, align 8, !dbg !556
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !557
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !554
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !558
  %tobool = icmp ne %struct.rbnode_s* %2, null, !dbg !558
  br i1 %tobool, label %if.then, label %if.end, !dbg !560

if.then:                                          ; preds = %entry
  store i1 true, i1* %retval, align 1, !dbg !561
  br label %return, !dbg !561

if.end:                                           ; preds = %entry
  store i1 false, i1* %retval, align 1, !dbg !562
  br label %return, !dbg !562

return:                                           ; preds = %if.end, %if.then
  %3 = load i1, i1* %retval, align 1, !dbg !563
  ret i1 %3, !dbg !563
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @treetable_contains_value(%struct.treetable_s* %table, i8* %value) #0 !dbg !564 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %value.addr = alloca i8*, align 8
  %node = alloca %struct.rbnode_s*, align 8
  %o = alloca i64, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !567, metadata !DIExpression()), !dbg !568
  store i8* %value, i8** %value.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %value.addr, metadata !569, metadata !DIExpression()), !dbg !570
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !571, metadata !DIExpression()), !dbg !572
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !573
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !574
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !575
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !575
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !576
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !572
  call void @llvm.dbg.declare(metadata i64* %o, metadata !577, metadata !DIExpression()), !dbg !578
  store i64 0, i64* %o, align 8, !dbg !578
  br label %while.cond, !dbg !579

while.cond:                                       ; preds = %if.end, %entry
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !580
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !581
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !582
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !582
  %cmp = icmp ne %struct.rbnode_s* %3, %5, !dbg !583
  br i1 %cmp, label %while.body, label %while.end, !dbg !579

while.body:                                       ; preds = %while.cond
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !584
  %value1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 1, !dbg !587
  %7 = load i8*, i8** %value1, align 8, !dbg !587
  %8 = load i8*, i8** %value.addr, align 8, !dbg !588
  %cmp2 = icmp eq i8* %7, %8, !dbg !589
  br i1 %cmp2, label %if.then, label %if.end, !dbg !590

if.then:                                          ; preds = %while.body
  %9 = load i64, i64* %o, align 8, !dbg !591
  %inc = add i64 %9, 1, !dbg !591
  store i64 %inc, i64* %o, align 8, !dbg !591
  br label %if.end, !dbg !592

if.end:                                           ; preds = %if.then, %while.body
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !593
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !594
  %call3 = call %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %10, %struct.rbnode_s* %11), !dbg !595
  store %struct.rbnode_s* %call3, %struct.rbnode_s** %node, align 8, !dbg !596
  br label %while.cond, !dbg !579, !llvm.loop !597

while.end:                                        ; preds = %while.cond
  %12 = load i64, i64* %o, align 8, !dbg !599
  ret i64 %12, !dbg !600
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_add(%struct.treetable_s* %table, i8* %key, i8* %val) #0 !dbg !601 {
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
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !604, metadata !DIExpression()), !dbg !605
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !606, metadata !DIExpression()), !dbg !607
  store i8* %val, i8** %val.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %val.addr, metadata !608, metadata !DIExpression()), !dbg !609
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !610, metadata !DIExpression()), !dbg !611
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !612
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !613
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !613
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !611
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x, metadata !614, metadata !DIExpression()), !dbg !615
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !616
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %2, i32 0, i32 0, !dbg !617
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !617
  store %struct.rbnode_s* %3, %struct.rbnode_s** %x, align 8, !dbg !615
  call void @llvm.dbg.declare(metadata i32* %cmp, metadata !618, metadata !DIExpression()), !dbg !619
  br label %while.cond, !dbg !620

while.cond:                                       ; preds = %if.end9, %entry
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !621
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !622
  %sentinel1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !623
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel1, align 8, !dbg !623
  %cmp2 = icmp ne %struct.rbnode_s* %4, %6, !dbg !624
  br i1 %cmp2, label %while.body, label %while.end, !dbg !620

while.body:                                       ; preds = %while.cond
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !625
  %cmp3 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 3, !dbg !627
  %8 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp3, align 8, !dbg !627
  %9 = load i8*, i8** %key.addr, align 8, !dbg !628
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !629
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 0, !dbg !630
  %11 = load i8*, i8** %key4, align 8, !dbg !630
  %call = call i32 %8(i8* %9, i8* %11), !dbg !625
  store i32 %call, i32* %cmp, align 4, !dbg !631
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !632
  store %struct.rbnode_s* %12, %struct.rbnode_s** %y, align 8, !dbg !633
  %13 = load i32, i32* %cmp, align 4, !dbg !634
  %cmp5 = icmp slt i32 %13, 0, !dbg !636
  br i1 %cmp5, label %if.then, label %if.else, !dbg !637

if.then:                                          ; preds = %while.body
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !638
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 4, !dbg !640
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !640
  store %struct.rbnode_s* %15, %struct.rbnode_s** %x, align 8, !dbg !641
  br label %if.end9, !dbg !642

if.else:                                          ; preds = %while.body
  %16 = load i32, i32* %cmp, align 4, !dbg !643
  %cmp6 = icmp sgt i32 %16, 0, !dbg !645
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !646

if.then7:                                         ; preds = %if.else
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !647
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 5, !dbg !649
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !649
  store %struct.rbnode_s* %18, %struct.rbnode_s** %x, align 8, !dbg !650
  br label %if.end9

if.else8:                                         ; preds = %if.else
  %19 = load i8*, i8** %val.addr, align 8, !dbg !651
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !653
  %value = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %20, i32 0, i32 1, !dbg !654
  store i8* %19, i8** %value, align 8, !dbg !655
  store i32 0, i32* %retval, align 4, !dbg !656
  br label %return, !dbg !656

if.end9:                                          ; preds = %if.then7, %if.then
  br label %while.cond, !dbg !620, !llvm.loop !657

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !659, metadata !DIExpression()), !dbg !660
  %21 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !661
  %mem_alloc = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %21, i32 0, i32 4, !dbg !662
  %22 = load i8* (i64)*, i8* (i64)** %mem_alloc, align 8, !dbg !662
  %call10 = call i8* %22(i64 48), !dbg !661
  %23 = bitcast i8* %call10 to %struct.rbnode_s*, !dbg !661
  store %struct.rbnode_s* %23, %struct.rbnode_s** %n, align 8, !dbg !660
  %24 = load i8*, i8** %val.addr, align 8, !dbg !663
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !664
  %value11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %25, i32 0, i32 1, !dbg !665
  store i8* %24, i8** %value11, align 8, !dbg !666
  %26 = load i8*, i8** %key.addr, align 8, !dbg !667
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !668
  %key12 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 0, !dbg !669
  store i8* %26, i8** %key12, align 8, !dbg !670
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !671
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !672
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !673
  store %struct.rbnode_s* %28, %struct.rbnode_s** %parent, align 8, !dbg !674
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !675
  %sentinel13 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %30, i32 0, i32 1, !dbg !676
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel13, align 8, !dbg !676
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !677
  %left14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 4, !dbg !678
  store %struct.rbnode_s* %31, %struct.rbnode_s** %left14, align 8, !dbg !679
  %33 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !680
  %sentinel15 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %33, i32 0, i32 1, !dbg !681
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel15, align 8, !dbg !681
  %35 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !682
  %right16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %35, i32 0, i32 5, !dbg !683
  store %struct.rbnode_s* %34, %struct.rbnode_s** %right16, align 8, !dbg !684
  %36 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !685
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %36, i32 0, i32 2, !dbg !686
  %37 = load i64, i64* %size, align 8, !dbg !687
  %inc = add i64 %37, 1, !dbg !687
  store i64 %inc, i64* %size, align 8, !dbg !687
  %38 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !688
  %39 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !690
  %sentinel17 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %39, i32 0, i32 1, !dbg !691
  %40 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel17, align 8, !dbg !691
  %cmp18 = icmp eq %struct.rbnode_s* %38, %40, !dbg !692
  br i1 %cmp18, label %if.then19, label %if.else21, !dbg !693

if.then19:                                        ; preds = %while.end
  %41 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !694
  %42 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !696
  %root20 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %42, i32 0, i32 0, !dbg !697
  store %struct.rbnode_s* %41, %struct.rbnode_s** %root20, align 8, !dbg !698
  %43 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !699
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %43, i32 0, i32 2, !dbg !700
  store i8 1, i8* %color, align 8, !dbg !701
  br label %if.end32, !dbg !702

if.else21:                                        ; preds = %while.end
  %44 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !703
  %color22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %44, i32 0, i32 2, !dbg !705
  store i8 0, i8* %color22, align 8, !dbg !706
  %45 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !707
  %cmp23 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %45, i32 0, i32 3, !dbg !709
  %46 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp23, align 8, !dbg !709
  %47 = load i8*, i8** %key.addr, align 8, !dbg !710
  %48 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !711
  %key24 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %48, i32 0, i32 0, !dbg !712
  %49 = load i8*, i8** %key24, align 8, !dbg !712
  %call25 = call i32 %46(i8* %47, i8* %49), !dbg !707
  %cmp26 = icmp slt i32 %call25, 0, !dbg !713
  br i1 %cmp26, label %if.then27, label %if.else29, !dbg !714

if.then27:                                        ; preds = %if.else21
  %50 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !715
  %51 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !717
  %left28 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %51, i32 0, i32 4, !dbg !718
  store %struct.rbnode_s* %50, %struct.rbnode_s** %left28, align 8, !dbg !719
  br label %if.end31, !dbg !720

if.else29:                                        ; preds = %if.else21
  %52 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !721
  %53 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !723
  %right30 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %53, i32 0, i32 5, !dbg !724
  store %struct.rbnode_s* %52, %struct.rbnode_s** %right30, align 8, !dbg !725
  br label %if.end31

if.end31:                                         ; preds = %if.else29, %if.then27
  %54 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !726
  %55 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !727
  call void @rebalance_after_insert(%struct.treetable_s* %54, %struct.rbnode_s* %55), !dbg !728
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then19
  store i32 0, i32* %retval, align 4, !dbg !729
  br label %return, !dbg !729

return:                                           ; preds = %if.end32, %if.else8
  %56 = load i32, i32* %retval, align 4, !dbg !730
  ret i32 %56, !dbg !730
}

; Function Attrs: noinline nounwind uwtable
define internal void @rebalance_after_insert(%struct.treetable_s* %table, %struct.rbnode_s* %z) #0 !dbg !731 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %z.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !732, metadata !DIExpression()), !dbg !733
  store %struct.rbnode_s* %z, %struct.rbnode_s** %z.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %z.addr, metadata !734, metadata !DIExpression()), !dbg !735
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !736, metadata !DIExpression()), !dbg !737
  br label %while.cond, !dbg !738

while.cond:                                       ; preds = %if.end69, %entry
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !739
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 3, !dbg !740
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %parent, align 8, !dbg !740
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %1, i32 0, i32 2, !dbg !741
  %2 = load i8, i8* %color, align 8, !dbg !741
  %conv = sext i8 %2 to i32, !dbg !739
  %cmp = icmp eq i32 %conv, 0, !dbg !742
  br i1 %cmp, label %while.body, label %while.end, !dbg !738

while.body:                                       ; preds = %while.cond
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !743
  %parent2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %3, i32 0, i32 3, !dbg !746
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %parent2, align 8, !dbg !746
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !747
  %parent3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 3, !dbg !748
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %parent3, align 8, !dbg !748
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 3, !dbg !749
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !749
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 4, !dbg !750
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !750
  %cmp5 = icmp eq %struct.rbnode_s* %4, %8, !dbg !751
  br i1 %cmp5, label %if.then, label %if.else36, !dbg !752

if.then:                                          ; preds = %while.body
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !753
  %parent7 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 3, !dbg !755
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %parent7, align 8, !dbg !755
  %parent8 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 3, !dbg !756
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %parent8, align 8, !dbg !756
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 5, !dbg !757
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !757
  store %struct.rbnode_s* %12, %struct.rbnode_s** %y, align 8, !dbg !758
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !759
  %color9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %13, i32 0, i32 2, !dbg !761
  %14 = load i8, i8* %color9, align 8, !dbg !761
  %conv10 = sext i8 %14 to i32, !dbg !759
  %cmp11 = icmp eq i32 %conv10, 0, !dbg !762
  br i1 %cmp11, label %if.then13, label %if.else, !dbg !763

if.then13:                                        ; preds = %if.then
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !764
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !766
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !766
  %color15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %16, i32 0, i32 2, !dbg !767
  store i8 1, i8* %color15, align 8, !dbg !768
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !769
  %color16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 2, !dbg !770
  store i8 1, i8* %color16, align 8, !dbg !771
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !772
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %18, i32 0, i32 3, !dbg !773
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !773
  %parent18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %19, i32 0, i32 3, !dbg !774
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %parent18, align 8, !dbg !774
  %color19 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %20, i32 0, i32 2, !dbg !775
  store i8 0, i8* %color19, align 8, !dbg !776
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !777
  %parent20 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %21, i32 0, i32 3, !dbg !778
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %parent20, align 8, !dbg !778
  %parent21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !779
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent21, align 8, !dbg !779
  store %struct.rbnode_s* %23, %struct.rbnode_s** %z.addr, align 8, !dbg !780
  br label %if.end69, !dbg !781

if.else:                                          ; preds = %if.then
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !782
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !785
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %25, i32 0, i32 3, !dbg !786
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %parent22, align 8, !dbg !786
  %right23 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 5, !dbg !787
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %right23, align 8, !dbg !787
  %cmp24 = icmp eq %struct.rbnode_s* %24, %27, !dbg !788
  br i1 %cmp24, label %if.then26, label %if.end, !dbg !789

if.then26:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !790
  %parent27 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %28, i32 0, i32 3, !dbg !792
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %parent27, align 8, !dbg !792
  store %struct.rbnode_s* %29, %struct.rbnode_s** %z.addr, align 8, !dbg !793
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !794
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !795
  call void @rotate_left(%struct.treetable_s* %30, %struct.rbnode_s* %31), !dbg !796
  br label %if.end, !dbg !797

if.end:                                           ; preds = %if.then26, %if.else
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !798
  %parent28 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 3, !dbg !799
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %parent28, align 8, !dbg !799
  %color29 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %33, i32 0, i32 2, !dbg !800
  store i8 1, i8* %color29, align 8, !dbg !801
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !802
  %parent30 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !803
  %35 = load %struct.rbnode_s*, %struct.rbnode_s** %parent30, align 8, !dbg !803
  %parent31 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %35, i32 0, i32 3, !dbg !804
  %36 = load %struct.rbnode_s*, %struct.rbnode_s** %parent31, align 8, !dbg !804
  %color32 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %36, i32 0, i32 2, !dbg !805
  store i8 0, i8* %color32, align 8, !dbg !806
  %37 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !807
  %38 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !808
  %parent33 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %38, i32 0, i32 3, !dbg !809
  %39 = load %struct.rbnode_s*, %struct.rbnode_s** %parent33, align 8, !dbg !809
  %parent34 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %39, i32 0, i32 3, !dbg !810
  %40 = load %struct.rbnode_s*, %struct.rbnode_s** %parent34, align 8, !dbg !810
  call void @rotate_right(%struct.treetable_s* %37, %struct.rbnode_s* %40), !dbg !811
  br label %if.end69

if.else36:                                        ; preds = %while.body
  %41 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !812
  %parent37 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %41, i32 0, i32 3, !dbg !814
  %42 = load %struct.rbnode_s*, %struct.rbnode_s** %parent37, align 8, !dbg !814
  %parent38 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %42, i32 0, i32 3, !dbg !815
  %43 = load %struct.rbnode_s*, %struct.rbnode_s** %parent38, align 8, !dbg !815
  %left39 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %43, i32 0, i32 4, !dbg !816
  %44 = load %struct.rbnode_s*, %struct.rbnode_s** %left39, align 8, !dbg !816
  store %struct.rbnode_s* %44, %struct.rbnode_s** %y, align 8, !dbg !817
  %45 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !818
  %color40 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %45, i32 0, i32 2, !dbg !820
  %46 = load i8, i8* %color40, align 8, !dbg !820
  %conv41 = sext i8 %46 to i32, !dbg !818
  %cmp42 = icmp eq i32 %conv41, 0, !dbg !821
  br i1 %cmp42, label %if.then44, label %if.else53, !dbg !822

if.then44:                                        ; preds = %if.else36
  %47 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !823
  %parent45 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %47, i32 0, i32 3, !dbg !825
  %48 = load %struct.rbnode_s*, %struct.rbnode_s** %parent45, align 8, !dbg !825
  %color46 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %48, i32 0, i32 2, !dbg !826
  store i8 1, i8* %color46, align 8, !dbg !827
  %49 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !828
  %color47 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %49, i32 0, i32 2, !dbg !829
  store i8 1, i8* %color47, align 8, !dbg !830
  %50 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !831
  %parent48 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %50, i32 0, i32 3, !dbg !832
  %51 = load %struct.rbnode_s*, %struct.rbnode_s** %parent48, align 8, !dbg !832
  %parent49 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %51, i32 0, i32 3, !dbg !833
  %52 = load %struct.rbnode_s*, %struct.rbnode_s** %parent49, align 8, !dbg !833
  %color50 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %52, i32 0, i32 2, !dbg !834
  store i8 0, i8* %color50, align 8, !dbg !835
  %53 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !836
  %parent51 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %53, i32 0, i32 3, !dbg !837
  %54 = load %struct.rbnode_s*, %struct.rbnode_s** %parent51, align 8, !dbg !837
  %parent52 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %54, i32 0, i32 3, !dbg !838
  %55 = load %struct.rbnode_s*, %struct.rbnode_s** %parent52, align 8, !dbg !838
  store %struct.rbnode_s* %55, %struct.rbnode_s** %z.addr, align 8, !dbg !839
  br label %if.end69, !dbg !840

if.else53:                                        ; preds = %if.else36
  %56 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !841
  %57 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !844
  %parent54 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %57, i32 0, i32 3, !dbg !845
  %58 = load %struct.rbnode_s*, %struct.rbnode_s** %parent54, align 8, !dbg !845
  %left55 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %58, i32 0, i32 4, !dbg !846
  %59 = load %struct.rbnode_s*, %struct.rbnode_s** %left55, align 8, !dbg !846
  %cmp56 = icmp eq %struct.rbnode_s* %56, %59, !dbg !847
  br i1 %cmp56, label %if.then58, label %if.end60, !dbg !848

if.then58:                                        ; preds = %if.else53
  %60 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !849
  %parent59 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %60, i32 0, i32 3, !dbg !851
  %61 = load %struct.rbnode_s*, %struct.rbnode_s** %parent59, align 8, !dbg !851
  store %struct.rbnode_s* %61, %struct.rbnode_s** %z.addr, align 8, !dbg !852
  %62 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !853
  %63 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !854
  call void @rotate_right(%struct.treetable_s* %62, %struct.rbnode_s* %63), !dbg !855
  br label %if.end60, !dbg !856

if.end60:                                         ; preds = %if.then58, %if.else53
  %64 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !857
  %parent61 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %64, i32 0, i32 3, !dbg !858
  %65 = load %struct.rbnode_s*, %struct.rbnode_s** %parent61, align 8, !dbg !858
  %color62 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %65, i32 0, i32 2, !dbg !859
  store i8 1, i8* %color62, align 8, !dbg !860
  %66 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !861
  %parent63 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %66, i32 0, i32 3, !dbg !862
  %67 = load %struct.rbnode_s*, %struct.rbnode_s** %parent63, align 8, !dbg !862
  %parent64 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %67, i32 0, i32 3, !dbg !863
  %68 = load %struct.rbnode_s*, %struct.rbnode_s** %parent64, align 8, !dbg !863
  %color65 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %68, i32 0, i32 2, !dbg !864
  store i8 0, i8* %color65, align 8, !dbg !865
  %69 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !866
  %70 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !867
  %parent66 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %70, i32 0, i32 3, !dbg !868
  %71 = load %struct.rbnode_s*, %struct.rbnode_s** %parent66, align 8, !dbg !868
  %parent67 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %71, i32 0, i32 3, !dbg !869
  %72 = load %struct.rbnode_s*, %struct.rbnode_s** %parent67, align 8, !dbg !869
  call void @rotate_left(%struct.treetable_s* %69, %struct.rbnode_s* %72), !dbg !870
  br label %if.end69

if.end69:                                         ; preds = %if.then44, %if.end60, %if.then13, %if.end
  br label %while.cond, !dbg !738, !llvm.loop !871

while.end:                                        ; preds = %while.cond
  %73 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !873
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %73, i32 0, i32 0, !dbg !874
  %74 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !874
  %color70 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %74, i32 0, i32 2, !dbg !875
  store i8 1, i8* %color70, align 8, !dbg !876
  ret void, !dbg !877
}

; Function Attrs: noinline nounwind uwtable
define internal void @rotate_left(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !878 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !879, metadata !DIExpression()), !dbg !880
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !881, metadata !DIExpression()), !dbg !882
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !883, metadata !DIExpression()), !dbg !884
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !885
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 5, !dbg !886
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !886
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !884
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !887
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 4, !dbg !888
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !888
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !889
  %right1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 5, !dbg !890
  store %struct.rbnode_s* %3, %struct.rbnode_s** %right1, align 8, !dbg !891
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !892
  %left2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 4, !dbg !894
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %left2, align 8, !dbg !894
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !895
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 1, !dbg !896
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !896
  %cmp = icmp ne %struct.rbnode_s* %6, %8, !dbg !897
  br i1 %cmp, label %if.then, label %if.end, !dbg !898

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !899
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !900
  %left3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 4, !dbg !901
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %left3, align 8, !dbg !901
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 3, !dbg !902
  store %struct.rbnode_s* %9, %struct.rbnode_s** %parent, align 8, !dbg !903
  br label %if.end, !dbg !900

if.end:                                           ; preds = %if.then, %entry
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !904
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 3, !dbg !905
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !905
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !906
  %parent5 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 3, !dbg !907
  store %struct.rbnode_s* %13, %struct.rbnode_s** %parent5, align 8, !dbg !908
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !909
  %parent6 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !911
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent6, align 8, !dbg !911
  %17 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !912
  %sentinel7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !913
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel7, align 8, !dbg !913
  %cmp8 = icmp eq %struct.rbnode_s* %16, %18, !dbg !914
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !915

if.then9:                                         ; preds = %if.end
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !916
  %20 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !917
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %20, i32 0, i32 0, !dbg !918
  store %struct.rbnode_s* %19, %struct.rbnode_s** %root, align 8, !dbg !919
  br label %if.end20, !dbg !917

if.else:                                          ; preds = %if.end
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !920
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !922
  %parent10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !923
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent10, align 8, !dbg !923
  %left11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %23, i32 0, i32 4, !dbg !924
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %left11, align 8, !dbg !924
  %cmp12 = icmp eq %struct.rbnode_s* %21, %24, !dbg !925
  br i1 %cmp12, label %if.then13, label %if.else16, !dbg !926

if.then13:                                        ; preds = %if.else
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !927
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !928
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 3, !dbg !929
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !929
  %left15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 4, !dbg !930
  store %struct.rbnode_s* %25, %struct.rbnode_s** %left15, align 8, !dbg !931
  br label %if.end20, !dbg !928

if.else16:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !932
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !933
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !934
  %30 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !934
  %right18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %30, i32 0, i32 5, !dbg !935
  store %struct.rbnode_s* %28, %struct.rbnode_s** %right18, align 8, !dbg !936
  br label %if.end20

if.end20:                                         ; preds = %if.then13, %if.else16, %if.then9
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !937
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !938
  %left21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 4, !dbg !939
  store %struct.rbnode_s* %31, %struct.rbnode_s** %left21, align 8, !dbg !940
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !941
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !942
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !943
  store %struct.rbnode_s* %33, %struct.rbnode_s** %parent22, align 8, !dbg !944
  ret void, !dbg !945
}

; Function Attrs: noinline nounwind uwtable
define internal void @rotate_right(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !946 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !947, metadata !DIExpression()), !dbg !948
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !949, metadata !DIExpression()), !dbg !950
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !951, metadata !DIExpression()), !dbg !952
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !953
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 4, !dbg !954
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !954
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !952
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !955
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 5, !dbg !956
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !956
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !957
  %left1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !958
  store %struct.rbnode_s* %3, %struct.rbnode_s** %left1, align 8, !dbg !959
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !960
  %right2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 5, !dbg !962
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %right2, align 8, !dbg !962
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !963
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 1, !dbg !964
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !964
  %cmp = icmp ne %struct.rbnode_s* %6, %8, !dbg !965
  br i1 %cmp, label %if.then, label %if.end, !dbg !966

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !967
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !968
  %right3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 5, !dbg !969
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %right3, align 8, !dbg !969
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 3, !dbg !970
  store %struct.rbnode_s* %9, %struct.rbnode_s** %parent, align 8, !dbg !971
  br label %if.end, !dbg !968

if.end:                                           ; preds = %if.then, %entry
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !972
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 3, !dbg !973
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !973
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !974
  %parent5 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 3, !dbg !975
  store %struct.rbnode_s* %13, %struct.rbnode_s** %parent5, align 8, !dbg !976
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !977
  %parent6 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !979
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent6, align 8, !dbg !979
  %17 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !980
  %sentinel7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !981
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel7, align 8, !dbg !981
  %cmp8 = icmp eq %struct.rbnode_s* %16, %18, !dbg !982
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !983

if.then9:                                         ; preds = %if.end
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !984
  %20 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !985
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %20, i32 0, i32 0, !dbg !986
  store %struct.rbnode_s* %19, %struct.rbnode_s** %root, align 8, !dbg !987
  br label %if.end20, !dbg !985

if.else:                                          ; preds = %if.end
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !988
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !990
  %parent10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !991
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent10, align 8, !dbg !991
  %right11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %23, i32 0, i32 5, !dbg !992
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %right11, align 8, !dbg !992
  %cmp12 = icmp eq %struct.rbnode_s* %21, %24, !dbg !993
  br i1 %cmp12, label %if.then13, label %if.else16, !dbg !994

if.then13:                                        ; preds = %if.else
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !995
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !996
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 3, !dbg !997
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !997
  %right15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 5, !dbg !998
  store %struct.rbnode_s* %25, %struct.rbnode_s** %right15, align 8, !dbg !999
  br label %if.end20, !dbg !996

if.else16:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1000
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1001
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !1002
  %30 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !1002
  %left18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %30, i32 0, i32 4, !dbg !1003
  store %struct.rbnode_s* %28, %struct.rbnode_s** %left18, align 8, !dbg !1004
  br label %if.end20

if.end20:                                         ; preds = %if.then13, %if.else16, %if.then9
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1005
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1006
  %right21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 5, !dbg !1007
  store %struct.rbnode_s* %31, %struct.rbnode_s** %right21, align 8, !dbg !1008
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1009
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1010
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !1011
  store %struct.rbnode_s* %33, %struct.rbnode_s** %parent22, align 8, !dbg !1012
  ret void, !dbg !1013
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @balanced(%struct.treetable_s* %t) #0 !dbg !1014 {
entry:
  %t.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1017, metadata !DIExpression()), !dbg !1018
  %0 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1019
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1020
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !1021
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !1021
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 4, !dbg !1022
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1022
  %call = call i32 @height(%struct.treetable_s* %0, %struct.rbnode_s* %3), !dbg !1023
  %4 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1024
  %5 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1025
  %root1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 0, !dbg !1026
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %root1, align 8, !dbg !1026
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 5, !dbg !1027
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1027
  %call2 = call i32 @height(%struct.treetable_s* %4, %struct.rbnode_s* %7), !dbg !1028
  %sub = sub nsw i32 %call, %call2, !dbg !1029
  %call3 = call i32 @abs(i32 %sub) #8, !dbg !1030
  %cmp = icmp sle i32 %call3, 1, !dbg !1031
  %conv = zext i1 %cmp to i32, !dbg !1031
  ret i32 %conv, !dbg !1032
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @height(%struct.treetable_s* %t, %struct.rbnode_s* %node) #0 !dbg !1033 {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca %struct.treetable_s*, align 8
  %node.addr = alloca %struct.rbnode_s*, align 8
  %leftHeight = alloca i32, align 4
  %rightHeight = alloca i32, align 4
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1036, metadata !DIExpression()), !dbg !1037
  store %struct.rbnode_s* %node, %struct.rbnode_s** %node.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node.addr, metadata !1038, metadata !DIExpression()), !dbg !1039
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1040
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1042
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !1043
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1043
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !1044
  br i1 %cmp, label %if.then, label %if.end, !dbg !1045

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1046
  br label %return, !dbg !1046

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %leftHeight, metadata !1047, metadata !DIExpression()), !dbg !1048
  %3 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1049
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1050
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !1051
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1051
  %call = call i32 @height(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !1052
  store i32 %call, i32* %leftHeight, align 4, !dbg !1048
  call void @llvm.dbg.declare(metadata i32* %rightHeight, metadata !1053, metadata !DIExpression()), !dbg !1054
  %6 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1055
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1056
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !1057
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1057
  %call1 = call i32 @height(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !1058
  store i32 %call1, i32* %rightHeight, align 4, !dbg !1054
  %9 = load i32, i32* %leftHeight, align 4, !dbg !1059
  %10 = load i32, i32* %rightHeight, align 4, !dbg !1060
  %cmp2 = icmp sgt i32 %9, %10, !dbg !1061
  %11 = load i32, i32* %leftHeight, align 4, !dbg !1059
  %add = add nsw i32 %11, 1, !dbg !1059
  %12 = load i32, i32* %rightHeight, align 4, !dbg !1059
  %add3 = add nsw i32 %12, 1, !dbg !1059
  %cond = select i1 %cmp2, i32 %add, i32 %add3, !dbg !1059
  store i32 %cond, i32* %retval, align 4, !dbg !1062
  br label %return, !dbg !1062

return:                                           ; preds = %if.end, %if.then
  %13 = load i32, i32* %retval, align 4, !dbg !1063
  ret i32 %13, !dbg !1063
}

; Function Attrs: nounwind readnone willreturn
declare dso_local i32 @abs(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @sorted(%struct.treetable_s* %t) #0 !dbg !1064 {
entry:
  %t.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1065, metadata !DIExpression()), !dbg !1066
  %0 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1067
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1068
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !1069
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !1069
  %call = call i32 @isSorted(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !1070
  ret i32 %call, !dbg !1071
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @isSorted(%struct.treetable_s* %t, %struct.rbnode_s* %node) #0 !dbg !1072 {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca %struct.treetable_s*, align 8
  %node.addr = alloca %struct.rbnode_s*, align 8
  %maxLeft = alloca %struct.rbnode_s*, align 8
  %minRight = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1073, metadata !DIExpression()), !dbg !1074
  store %struct.rbnode_s* %node, %struct.rbnode_s** %node.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node.addr, metadata !1075, metadata !DIExpression()), !dbg !1076
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1077
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1079
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !1080
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1080
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !1081
  br i1 %cmp, label %if.then, label %if.end, !dbg !1082

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !1083
  br label %return, !dbg !1083

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %maxLeft, metadata !1084, metadata !DIExpression()), !dbg !1085
  %3 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1086
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1087
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !1088
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1088
  %call = call %struct.rbnode_s* @tree_max(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !1089
  store %struct.rbnode_s* %call, %struct.rbnode_s** %maxLeft, align 8, !dbg !1085
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %minRight, metadata !1090, metadata !DIExpression()), !dbg !1091
  %6 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1092
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1093
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !1094
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1094
  %call1 = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !1095
  store %struct.rbnode_s* %call1, %struct.rbnode_s** %minRight, align 8, !dbg !1091
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %maxLeft, align 8, !dbg !1096
  %10 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1098
  %sentinel2 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %10, i32 0, i32 1, !dbg !1099
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel2, align 8, !dbg !1099
  %cmp3 = icmp ne %struct.rbnode_s* %9, %11, !dbg !1100
  br i1 %cmp3, label %land.lhs.true, label %lor.lhs.false, !dbg !1101

land.lhs.true:                                    ; preds = %if.end
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1102
  %key = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 0, !dbg !1103
  %13 = load i8*, i8** %key, align 8, !dbg !1103
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %maxLeft, align 8, !dbg !1104
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 0, !dbg !1105
  %15 = load i8*, i8** %key4, align 8, !dbg !1105
  %cmp5 = icmp ult i8* %13, %15, !dbg !1106
  br i1 %cmp5, label %if.then12, label %lor.lhs.false, !dbg !1107

lor.lhs.false:                                    ; preds = %land.lhs.true, %if.end
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %minRight, align 8, !dbg !1108
  %17 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1109
  %sentinel6 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !1110
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel6, align 8, !dbg !1110
  %cmp7 = icmp ne %struct.rbnode_s* %16, %18, !dbg !1111
  br i1 %cmp7, label %land.lhs.true8, label %if.end13, !dbg !1112

land.lhs.true8:                                   ; preds = %lor.lhs.false
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1113
  %key9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %19, i32 0, i32 0, !dbg !1114
  %20 = load i8*, i8** %key9, align 8, !dbg !1114
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %minRight, align 8, !dbg !1115
  %key10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %21, i32 0, i32 0, !dbg !1116
  %22 = load i8*, i8** %key10, align 8, !dbg !1116
  %cmp11 = icmp ugt i8* %20, %22, !dbg !1117
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !1118

if.then12:                                        ; preds = %land.lhs.true8, %land.lhs.true
  store i32 0, i32* %retval, align 4, !dbg !1119
  br label %return, !dbg !1119

if.end13:                                         ; preds = %land.lhs.true8, %lor.lhs.false
  %23 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1120
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1121
  %left14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %24, i32 0, i32 4, !dbg !1122
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %left14, align 8, !dbg !1122
  %call15 = call i32 @isSorted(%struct.treetable_s* %23, %struct.rbnode_s* %25), !dbg !1123
  %tobool = icmp ne i32 %call15, 0, !dbg !1123
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !1124

land.rhs:                                         ; preds = %if.end13
  %26 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1125
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1126
  %right16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 5, !dbg !1127
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %right16, align 8, !dbg !1127
  %call17 = call i32 @isSorted(%struct.treetable_s* %26, %struct.rbnode_s* %28), !dbg !1128
  %tobool18 = icmp ne i32 %call17, 0, !dbg !1124
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end13
  %29 = phi i1 [ false, %if.end13 ], [ %tobool18, %land.rhs ], !dbg !1129
  %land.ext = zext i1 %29 to i32, !dbg !1124
  store i32 %land.ext, i32* %retval, align 4, !dbg !1130
  br label %return, !dbg !1130

return:                                           ; preds = %land.end, %if.then12, %if.then
  %30 = load i32, i32* %retval, align 4, !dbg !1131
  ret i32 %30, !dbg !1131
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @tree_max(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !1132 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !1133, metadata !DIExpression()), !dbg !1134
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !1135, metadata !DIExpression()), !dbg !1136
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !1137, metadata !DIExpression()), !dbg !1138
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !1139
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !1140
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1140
  store %struct.rbnode_s* %1, %struct.rbnode_s** %s, align 8, !dbg !1138
  br label %while.cond, !dbg !1141

while.cond:                                       ; preds = %while.body, %entry
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1142
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 5, !dbg !1143
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1143
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !1144
  %cmp = icmp ne %struct.rbnode_s* %3, %4, !dbg !1145
  br i1 %cmp, label %while.body, label %while.end, !dbg !1141

while.body:                                       ; preds = %while.cond
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1146
  %right1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 5, !dbg !1147
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %right1, align 8, !dbg !1147
  store %struct.rbnode_s* %6, %struct.rbnode_s** %n.addr, align 8, !dbg !1148
  br label %while.cond, !dbg !1141, !llvm.loop !1149

while.end:                                        ; preds = %while.cond
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1150
  ret %struct.rbnode_s* %7, !dbg !1151
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #0 !dbg !1152 {
entry:
  %destaddr.addr = alloca i8*, align 8
  %srcaddr.addr = alloca i8*, align 8
  %len.addr = alloca i64, align 8
  %dest = alloca i8*, align 8
  %src = alloca i8*, align 8
  store i8* %destaddr, i8** %destaddr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %destaddr.addr, metadata !1158, metadata !DIExpression()), !dbg !1159
  store i8* %srcaddr, i8** %srcaddr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %srcaddr.addr, metadata !1160, metadata !DIExpression()), !dbg !1161
  store i64 %len, i64* %len.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %len.addr, metadata !1162, metadata !DIExpression()), !dbg !1163
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !1164, metadata !DIExpression()), !dbg !1165
  %0 = load i8*, i8** %destaddr.addr, align 8, !dbg !1166
  store i8* %0, i8** %dest, align 8, !dbg !1165
  call void @llvm.dbg.declare(metadata i8** %src, metadata !1167, metadata !DIExpression()), !dbg !1170
  %1 = load i8*, i8** %srcaddr.addr, align 8, !dbg !1171
  store i8* %1, i8** %src, align 8, !dbg !1170
  br label %while.cond, !dbg !1172

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, i64* %len.addr, align 8, !dbg !1173
  %dec = add i64 %2, -1, !dbg !1173
  store i64 %dec, i64* %len.addr, align 8, !dbg !1173
  %cmp = icmp ugt i64 %2, 0, !dbg !1174
  br i1 %cmp, label %while.body, label %while.end, !dbg !1172

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %src, align 8, !dbg !1175
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1, !dbg !1175
  store i8* %incdec.ptr, i8** %src, align 8, !dbg !1175
  %4 = load i8, i8* %3, align 1, !dbg !1176
  %5 = load i8*, i8** %dest, align 8, !dbg !1177
  %incdec.ptr1 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !1177
  store i8* %incdec.ptr1, i8** %dest, align 8, !dbg !1177
  store i8 %4, i8* %5, align 1, !dbg !1178
  br label %while.cond, !dbg !1172, !llvm.loop !1179

while.end:                                        ; preds = %while.cond
  %6 = load i8*, i8** %destaddr.addr, align 8, !dbg !1180
  ret i8* %6, !dbg !1181
}

attributes #0 = { noinline nounwind uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind readnone willreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readnone willreturn }

!llvm.dbg.cu = !{!0, !6, !26}
!llvm.ident = !{!28, !28, !28}
!llvm.module.flags = !{!29, !30, !31, !32, !33}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "add_nodes.c", directory: "/home/klee/klee_src/examples/trabalho2/Ex2SymbTestSuite")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = distinct !DICompileUnit(language: DW_LANG_C99, file: !7, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !8, retainedTypes: !22, splitDebugInlining: false, nameTableKind: None)
!7 = !DIFile(filename: "treetable.c", directory: "/home/klee/klee_src/examples/trabalho2")
!8 = !{!9}
!9 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cc_stat", file: !10, line: 29, baseType: !11, size: 32, elements: !12)
!10 = !DIFile(filename: "./common.h", directory: "/home/klee/klee_src/examples/trabalho2")
!11 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!12 = !{!13, !14, !15, !16, !17, !18, !19, !20, !21}
!13 = !DIEnumerator(name: "CC_OK", value: 0)
!14 = !DIEnumerator(name: "CC_ERR_ALLOC", value: 1)
!15 = !DIEnumerator(name: "CC_ERR_INVALID_CAPACITY", value: 2)
!16 = !DIEnumerator(name: "CC_ERR_INVALID_RANGE", value: 3)
!17 = !DIEnumerator(name: "CC_ERR_MAX_CAPACITY", value: 4)
!18 = !DIEnumerator(name: "CC_ERR_KEY_NOT_FOUND", value: 6)
!19 = !DIEnumerator(name: "CC_ERR_VALUE_NOT_FOUND", value: 7)
!20 = !DIEnumerator(name: "CC_ERR_OUT_OF_RANGE", value: 8)
!21 = !DIEnumerator(name: "CC_ITER_END", value: 9)
!22 = !{!23, !25}
!23 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!24 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!26 = distinct !DICompileUnit(language: DW_LANG_C99, file: !27, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!27 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build130stp_z3/runtime/Freestanding")
!28 = !{!"clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)"}
!29 = !{i32 7, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{i32 7, !"uwtable", i32 1}
!33 = !{i32 7, !"frame-pointer", i32 2}
!34 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !35, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!35 = !DISubroutineType(types: !36)
!36 = !{!24}
!37 = !DILocalVariable(name: "table", scope: !34, file: !1, line: 8, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "TreeTable", file: !40, line: 30, baseType: !41)
!40 = !DIFile(filename: "./../treetable.h", directory: "/home/klee/klee_src/examples/trabalho2/Ex2SymbTestSuite")
!41 = !DICompositeType(tag: DW_TAG_structure_type, name: "treetable_s", file: !40, line: 30, flags: DIFlagFwdDecl)
!42 = !DILocation(line: 8, column: 16, scope: !34)
!43 = !DILocation(line: 9, column: 5, scope: !34)
!44 = !DILocalVariable(name: "key1", scope: !34, file: !1, line: 11, type: !24)
!45 = !DILocation(line: 11, column: 9, scope: !34)
!46 = !DILocalVariable(name: "key2", scope: !34, file: !1, line: 12, type: !24)
!47 = !DILocation(line: 12, column: 9, scope: !34)
!48 = !DILocalVariable(name: "value1", scope: !34, file: !1, line: 14, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !5, size: 32, elements: !50)
!50 = !{!51}
!51 = !DISubrange(count: 4)
!52 = !DILocation(line: 14, column: 10, scope: !34)
!53 = !DILocalVariable(name: "value2", scope: !34, file: !1, line: 15, type: !49)
!54 = !DILocation(line: 15, column: 10, scope: !34)
!55 = !DILocation(line: 17, column: 24, scope: !34)
!56 = !DILocation(line: 17, column: 5, scope: !34)
!57 = !DILocation(line: 18, column: 24, scope: !34)
!58 = !DILocation(line: 18, column: 5, scope: !34)
!59 = !DILocation(line: 20, column: 19, scope: !34)
!60 = !DILocation(line: 20, column: 26, scope: !34)
!61 = !DILocation(line: 20, column: 33, scope: !34)
!62 = !DILocation(line: 20, column: 5, scope: !34)
!63 = !DILocation(line: 21, column: 19, scope: !34)
!64 = !DILocation(line: 21, column: 26, scope: !34)
!65 = !DILocation(line: 21, column: 33, scope: !34)
!66 = !DILocation(line: 21, column: 5, scope: !34)
!67 = !DILocalVariable(name: "value", scope: !34, file: !1, line: 23, type: !25)
!68 = !DILocation(line: 23, column: 11, scope: !34)
!69 = !DILocation(line: 24, column: 9, scope: !70)
!70 = distinct !DILexicalBlock(scope: !34, file: !1, line: 24, column: 9)
!71 = !DILocation(line: 24, column: 17, scope: !70)
!72 = !DILocation(line: 24, column: 14, scope: !70)
!73 = !DILocation(line: 24, column: 22, scope: !70)
!74 = !DILocation(line: 24, column: 48, scope: !70)
!75 = !DILocation(line: 24, column: 55, scope: !70)
!76 = !DILocation(line: 24, column: 25, scope: !70)
!77 = !DILocation(line: 24, column: 9, scope: !34)
!78 = !DILocation(line: 25, column: 23, scope: !79)
!79 = distinct !DILexicalBlock(scope: !70, file: !1, line: 24, column: 62)
!80 = !DILocation(line: 25, column: 30, scope: !79)
!81 = !DILocation(line: 25, column: 9, scope: !79)
!82 = !DILocation(line: 26, column: 9, scope: !83)
!83 = distinct !DILexicalBlock(scope: !84, file: !1, line: 26, column: 9)
!84 = distinct !DILexicalBlock(scope: !79, file: !1, line: 26, column: 9)
!85 = !DILocation(line: 26, column: 9, scope: !84)
!86 = !DILocation(line: 29, column: 32, scope: !87)
!87 = distinct !DILexicalBlock(scope: !34, file: !1, line: 29, column: 9)
!88 = !DILocation(line: 29, column: 39, scope: !87)
!89 = !DILocation(line: 29, column: 9, scope: !87)
!90 = !DILocation(line: 29, column: 9, scope: !34)
!91 = !DILocation(line: 30, column: 23, scope: !92)
!92 = distinct !DILexicalBlock(scope: !87, file: !1, line: 29, column: 46)
!93 = !DILocation(line: 30, column: 30, scope: !92)
!94 = !DILocation(line: 30, column: 9, scope: !92)
!95 = !DILocation(line: 31, column: 9, scope: !96)
!96 = distinct !DILexicalBlock(scope: !97, file: !1, line: 31, column: 9)
!97 = distinct !DILexicalBlock(scope: !92, file: !1, line: 31, column: 9)
!98 = !DILocation(line: 31, column: 9, scope: !97)
!99 = !DILocation(line: 34, column: 23, scope: !34)
!100 = !DILocation(line: 34, column: 5, scope: !34)
!101 = !DILocation(line: 35, column: 1, scope: !34)
!102 = distinct !DISubprogram(name: "cmp", scope: !7, file: !7, line: 53, type: !103, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!103 = !DISubroutineType(types: !104)
!104 = !{!24, !105, !105}
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!107 = !DILocalVariable(name: "e1", arg: 1, scope: !102, file: !7, line: 53, type: !105)
!108 = !DILocation(line: 53, column: 21, scope: !102)
!109 = !DILocalVariable(name: "e2", arg: 2, scope: !102, file: !7, line: 53, type: !105)
!110 = !DILocation(line: 53, column: 37, scope: !102)
!111 = !DILocalVariable(name: "i", scope: !102, file: !7, line: 54, type: !24)
!112 = !DILocation(line: 54, column: 9, scope: !102)
!113 = !DILocation(line: 54, column: 22, scope: !102)
!114 = !DILocation(line: 54, column: 15, scope: !102)
!115 = !DILocation(line: 54, column: 13, scope: !102)
!116 = !DILocalVariable(name: "j", scope: !102, file: !7, line: 55, type: !24)
!117 = !DILocation(line: 55, column: 9, scope: !102)
!118 = !DILocation(line: 55, column: 22, scope: !102)
!119 = !DILocation(line: 55, column: 15, scope: !102)
!120 = !DILocation(line: 55, column: 13, scope: !102)
!121 = !DILocation(line: 57, column: 9, scope: !122)
!122 = distinct !DILexicalBlock(scope: !102, file: !7, line: 57, column: 9)
!123 = !DILocation(line: 57, column: 13, scope: !122)
!124 = !DILocation(line: 57, column: 11, scope: !122)
!125 = !DILocation(line: 57, column: 9, scope: !102)
!126 = !DILocation(line: 58, column: 9, scope: !122)
!127 = !DILocation(line: 59, column: 9, scope: !128)
!128 = distinct !DILexicalBlock(scope: !102, file: !7, line: 59, column: 9)
!129 = !DILocation(line: 59, column: 14, scope: !128)
!130 = !DILocation(line: 59, column: 11, scope: !128)
!131 = !DILocation(line: 59, column: 9, scope: !102)
!132 = !DILocation(line: 60, column: 9, scope: !128)
!133 = !DILocation(line: 61, column: 5, scope: !102)
!134 = !DILocation(line: 62, column: 1, scope: !102)
!135 = distinct !DISubprogram(name: "treetable_conf_init", scope: !7, file: !7, line: 70, type: !136, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!136 = !DISubroutineType(types: !137)
!137 = !{null, !138}
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DIDerivedType(tag: DW_TAG_typedef, name: "TreeTableConf", file: !140, line: 94, baseType: !141)
!140 = !DIFile(filename: "./treetable.h", directory: "/home/klee/klee_src/examples/trabalho2")
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "treetable_conf_s", file: !140, line: 89, size: 256, elements: !142)
!142 = !{!143, !145, !152, !156}
!143 = !DIDerivedType(tag: DW_TAG_member, name: "cmp", scope: !141, file: !140, line: 90, baseType: !144, size: 64)
!144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !103, size: 64)
!145 = !DIDerivedType(tag: DW_TAG_member, name: "mem_alloc", scope: !141, file: !140, line: 91, baseType: !146, size: 64, offset: 64)
!146 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !147, size: 64)
!147 = !DISubroutineType(types: !148)
!148 = !{!25, !149}
!149 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !150, line: 46, baseType: !151)
!150 = !DIFile(filename: "/tmp/llvm-130-install_O_D_A/lib/clang/13.0.1/include/stddef.h", directory: "")
!151 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "mem_calloc", scope: !141, file: !140, line: 92, baseType: !153, size: 64, offset: 128)
!153 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !154, size: 64)
!154 = !DISubroutineType(types: !155)
!155 = !{!25, !149, !149}
!156 = !DIDerivedType(tag: DW_TAG_member, name: "mem_free", scope: !141, file: !140, line: 93, baseType: !157, size: 64, offset: 192)
!157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !158, size: 64)
!158 = !DISubroutineType(types: !159)
!159 = !{null, !25}
!160 = !DILocalVariable(name: "conf", arg: 1, scope: !135, file: !7, line: 70, type: !138)
!161 = !DILocation(line: 70, column: 41, scope: !135)
!162 = !DILocation(line: 72, column: 5, scope: !135)
!163 = !DILocation(line: 72, column: 11, scope: !135)
!164 = !DILocation(line: 72, column: 22, scope: !135)
!165 = !DILocation(line: 73, column: 5, scope: !135)
!166 = !DILocation(line: 73, column: 11, scope: !135)
!167 = !DILocation(line: 73, column: 22, scope: !135)
!168 = !DILocation(line: 74, column: 5, scope: !135)
!169 = !DILocation(line: 74, column: 11, scope: !135)
!170 = !DILocation(line: 74, column: 22, scope: !135)
!171 = !DILocation(line: 75, column: 5, scope: !135)
!172 = !DILocation(line: 75, column: 11, scope: !135)
!173 = !DILocation(line: 75, column: 22, scope: !135)
!174 = !DILocation(line: 76, column: 1, scope: !135)
!175 = distinct !DISubprogram(name: "treetable_new", scope: !7, file: !7, line: 87, type: !176, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!176 = !DISubroutineType(types: !177)
!177 = !{!9, !178}
!178 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !179, size: 64)
!179 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !180, size: 64)
!180 = !DIDerivedType(tag: DW_TAG_typedef, name: "TreeTable", file: !140, line: 30, baseType: !181)
!181 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "treetable_s", file: !7, line: 30, size: 448, elements: !182)
!182 = !{!183, !195, !196, !197, !198, !199, !200}
!183 = !DIDerivedType(tag: DW_TAG_member, name: "root", scope: !181, file: !7, line: 31, baseType: !184, size: 64)
!184 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !185, size: 64)
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "RBNode", file: !140, line: 61, baseType: !186)
!186 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rbnode_s", file: !140, line: 37, size: 384, elements: !187)
!187 = !{!188, !189, !190, !191, !193, !194}
!188 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !186, file: !140, line: 40, baseType: !25, size: 64)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !186, file: !140, line: 44, baseType: !25, size: 64, offset: 64)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "color", scope: !186, file: !140, line: 48, baseType: !5, size: 8, offset: 128)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !186, file: !140, line: 52, baseType: !192, size: 64, offset: 192)
!192 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "left", scope: !186, file: !140, line: 56, baseType: !192, size: 64, offset: 256)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "right", scope: !186, file: !140, line: 60, baseType: !192, size: 64, offset: 320)
!195 = !DIDerivedType(tag: DW_TAG_member, name: "sentinel", scope: !181, file: !7, line: 32, baseType: !184, size: 64, offset: 64)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !181, file: !7, line: 33, baseType: !149, size: 64, offset: 128)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "cmp", scope: !181, file: !7, line: 35, baseType: !144, size: 64, offset: 192)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "mem_alloc", scope: !181, file: !7, line: 36, baseType: !146, size: 64, offset: 256)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "mem_calloc", scope: !181, file: !7, line: 37, baseType: !153, size: 64, offset: 320)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "mem_free", scope: !181, file: !7, line: 38, baseType: !157, size: 64, offset: 384)
!201 = !DILocalVariable(name: "tt", arg: 1, scope: !175, file: !7, line: 87, type: !178)
!202 = !DILocation(line: 87, column: 40, scope: !175)
!203 = !DILocalVariable(name: "conf", scope: !175, file: !7, line: 89, type: !139)
!204 = !DILocation(line: 89, column: 19, scope: !175)
!205 = !DILocation(line: 90, column: 5, scope: !175)
!206 = !DILocation(line: 91, column: 38, scope: !175)
!207 = !DILocation(line: 91, column: 12, scope: !175)
!208 = !DILocation(line: 91, column: 5, scope: !175)
!209 = distinct !DISubprogram(name: "treetable_new_conf", scope: !7, file: !7, line: 107, type: !210, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!210 = !DISubroutineType(types: !211)
!211 = !{!9, !212, !178}
!212 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !213)
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !214, size: 64)
!214 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !139)
!215 = !DILocalVariable(name: "conf", arg: 1, scope: !209, file: !7, line: 107, type: !212)
!216 = !DILocation(line: 107, column: 61, scope: !209)
!217 = !DILocalVariable(name: "tt", arg: 2, scope: !209, file: !7, line: 107, type: !178)
!218 = !DILocation(line: 107, column: 79, scope: !209)
!219 = !DILocalVariable(name: "table", scope: !209, file: !7, line: 109, type: !179)
!220 = !DILocation(line: 109, column: 16, scope: !209)
!221 = !DILocation(line: 109, column: 24, scope: !209)
!222 = !DILocation(line: 109, column: 30, scope: !209)
!223 = !DILocation(line: 111, column: 10, scope: !224)
!224 = distinct !DILexicalBlock(scope: !209, file: !7, line: 111, column: 9)
!225 = !DILocation(line: 111, column: 9, scope: !209)
!226 = !DILocation(line: 112, column: 9, scope: !224)
!227 = !DILocalVariable(name: "sentinel", scope: !209, file: !7, line: 114, type: !184)
!228 = !DILocation(line: 114, column: 13, scope: !209)
!229 = !DILocation(line: 114, column: 24, scope: !209)
!230 = !DILocation(line: 114, column: 30, scope: !209)
!231 = !DILocation(line: 116, column: 10, scope: !232)
!232 = distinct !DILexicalBlock(scope: !209, file: !7, line: 116, column: 9)
!233 = !DILocation(line: 116, column: 9, scope: !209)
!234 = !DILocation(line: 117, column: 9, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !7, line: 116, column: 20)
!236 = !DILocation(line: 117, column: 15, scope: !235)
!237 = !DILocation(line: 117, column: 24, scope: !235)
!238 = !DILocation(line: 118, column: 9, scope: !235)
!239 = !DILocation(line: 121, column: 5, scope: !209)
!240 = !DILocation(line: 121, column: 15, scope: !209)
!241 = !DILocation(line: 121, column: 23, scope: !209)
!242 = !DILocation(line: 123, column: 5, scope: !209)
!243 = !DILocation(line: 123, column: 12, scope: !209)
!244 = !DILocation(line: 123, column: 23, scope: !209)
!245 = !DILocation(line: 124, column: 25, scope: !209)
!246 = !DILocation(line: 124, column: 31, scope: !209)
!247 = !DILocation(line: 124, column: 5, scope: !209)
!248 = !DILocation(line: 124, column: 12, scope: !209)
!249 = !DILocation(line: 124, column: 23, scope: !209)
!250 = !DILocation(line: 125, column: 25, scope: !209)
!251 = !DILocation(line: 125, column: 31, scope: !209)
!252 = !DILocation(line: 125, column: 5, scope: !209)
!253 = !DILocation(line: 125, column: 12, scope: !209)
!254 = !DILocation(line: 125, column: 23, scope: !209)
!255 = !DILocation(line: 126, column: 25, scope: !209)
!256 = !DILocation(line: 126, column: 31, scope: !209)
!257 = !DILocation(line: 126, column: 5, scope: !209)
!258 = !DILocation(line: 126, column: 12, scope: !209)
!259 = !DILocation(line: 126, column: 23, scope: !209)
!260 = !DILocation(line: 127, column: 25, scope: !209)
!261 = !DILocation(line: 127, column: 31, scope: !209)
!262 = !DILocation(line: 127, column: 5, scope: !209)
!263 = !DILocation(line: 127, column: 12, scope: !209)
!264 = !DILocation(line: 127, column: 23, scope: !209)
!265 = !DILocation(line: 128, column: 25, scope: !209)
!266 = !DILocation(line: 128, column: 5, scope: !209)
!267 = !DILocation(line: 128, column: 12, scope: !209)
!268 = !DILocation(line: 128, column: 23, scope: !209)
!269 = !DILocation(line: 129, column: 25, scope: !209)
!270 = !DILocation(line: 129, column: 5, scope: !209)
!271 = !DILocation(line: 129, column: 12, scope: !209)
!272 = !DILocation(line: 129, column: 23, scope: !209)
!273 = !DILocation(line: 131, column: 11, scope: !209)
!274 = !DILocation(line: 131, column: 6, scope: !209)
!275 = !DILocation(line: 131, column: 9, scope: !209)
!276 = !DILocation(line: 132, column: 5, scope: !209)
!277 = !DILocation(line: 133, column: 1, scope: !209)
!278 = distinct !DISubprogram(name: "treetable_destroy", scope: !7, file: !7, line: 159, type: !279, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!279 = !DISubroutineType(types: !280)
!280 = !{null, !179}
!281 = !DILocalVariable(name: "table", arg: 1, scope: !278, file: !7, line: 159, type: !179)
!282 = !DILocation(line: 159, column: 35, scope: !278)
!283 = !DILocation(line: 161, column: 18, scope: !278)
!284 = !DILocation(line: 161, column: 25, scope: !278)
!285 = !DILocation(line: 161, column: 32, scope: !278)
!286 = !DILocation(line: 161, column: 5, scope: !278)
!287 = !DILocation(line: 163, column: 5, scope: !278)
!288 = !DILocation(line: 163, column: 12, scope: !278)
!289 = !DILocation(line: 163, column: 21, scope: !278)
!290 = !DILocation(line: 163, column: 28, scope: !278)
!291 = !DILocation(line: 164, column: 5, scope: !278)
!292 = !DILocation(line: 164, column: 12, scope: !278)
!293 = !DILocation(line: 164, column: 21, scope: !278)
!294 = !DILocation(line: 165, column: 1, scope: !278)
!295 = distinct !DISubprogram(name: "tree_destroy", scope: !7, file: !7, line: 141, type: !296, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !2)
!296 = !DISubroutineType(types: !297)
!297 = !{null, !179, !184}
!298 = !DILocalVariable(name: "table", arg: 1, scope: !295, file: !7, line: 141, type: !179)
!299 = !DILocation(line: 141, column: 37, scope: !295)
!300 = !DILocalVariable(name: "n", arg: 2, scope: !295, file: !7, line: 141, type: !184)
!301 = !DILocation(line: 141, column: 52, scope: !295)
!302 = !DILocation(line: 143, column: 9, scope: !303)
!303 = distinct !DILexicalBlock(scope: !295, file: !7, line: 143, column: 9)
!304 = !DILocation(line: 143, column: 14, scope: !303)
!305 = !DILocation(line: 143, column: 21, scope: !303)
!306 = !DILocation(line: 143, column: 11, scope: !303)
!307 = !DILocation(line: 143, column: 9, scope: !295)
!308 = !DILocation(line: 146, column: 18, scope: !295)
!309 = !DILocation(line: 146, column: 25, scope: !295)
!310 = !DILocation(line: 146, column: 28, scope: !295)
!311 = !DILocation(line: 146, column: 5, scope: !295)
!312 = !DILocation(line: 147, column: 18, scope: !295)
!313 = !DILocation(line: 147, column: 25, scope: !295)
!314 = !DILocation(line: 147, column: 28, scope: !295)
!315 = !DILocation(line: 147, column: 5, scope: !295)
!316 = !DILocation(line: 149, column: 5, scope: !295)
!317 = !DILocation(line: 149, column: 12, scope: !295)
!318 = !DILocation(line: 149, column: 21, scope: !295)
!319 = !DILocation(line: 150, column: 1, scope: !295)
!320 = distinct !DISubprogram(name: "treetable_get", scope: !7, file: !7, line: 177, type: !321, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!321 = !DISubroutineType(types: !322)
!322 = !{!9, !323, !105, !326}
!323 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !324)
!324 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !325, size: 64)
!325 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !180)
!326 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!327 = !DILocalVariable(name: "table", arg: 1, scope: !320, file: !7, line: 177, type: !323)
!328 = !DILocation(line: 177, column: 52, scope: !320)
!329 = !DILocalVariable(name: "key", arg: 2, scope: !320, file: !7, line: 177, type: !105)
!330 = !DILocation(line: 177, column: 71, scope: !320)
!331 = !DILocalVariable(name: "out", arg: 3, scope: !320, file: !7, line: 177, type: !326)
!332 = !DILocation(line: 177, column: 83, scope: !320)
!333 = !DILocalVariable(name: "node", scope: !320, file: !7, line: 179, type: !184)
!334 = !DILocation(line: 179, column: 13, scope: !320)
!335 = !DILocation(line: 179, column: 41, scope: !320)
!336 = !DILocation(line: 179, column: 48, scope: !320)
!337 = !DILocation(line: 179, column: 20, scope: !320)
!338 = !DILocation(line: 181, column: 10, scope: !339)
!339 = distinct !DILexicalBlock(scope: !320, file: !7, line: 181, column: 9)
!340 = !DILocation(line: 181, column: 9, scope: !320)
!341 = !DILocation(line: 182, column: 9, scope: !339)
!342 = !DILocation(line: 184, column: 12, scope: !320)
!343 = !DILocation(line: 184, column: 18, scope: !320)
!344 = !DILocation(line: 184, column: 6, scope: !320)
!345 = !DILocation(line: 184, column: 10, scope: !320)
!346 = !DILocation(line: 185, column: 5, scope: !320)
!347 = !DILocation(line: 186, column: 1, scope: !320)
!348 = distinct !DISubprogram(name: "get_tree_node_by_key", scope: !7, file: !7, line: 477, type: !349, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !2)
!349 = !DISubroutineType(types: !350)
!350 = !{!184, !323, !105}
!351 = !DILocalVariable(name: "table", arg: 1, scope: !348, file: !7, line: 477, type: !323)
!352 = !DILocation(line: 477, column: 61, scope: !348)
!353 = !DILocalVariable(name: "key", arg: 2, scope: !348, file: !7, line: 477, type: !105)
!354 = !DILocation(line: 477, column: 80, scope: !348)
!355 = !DILocation(line: 479, column: 9, scope: !356)
!356 = distinct !DILexicalBlock(scope: !348, file: !7, line: 479, column: 9)
!357 = !DILocation(line: 479, column: 16, scope: !356)
!358 = !DILocation(line: 479, column: 21, scope: !356)
!359 = !DILocation(line: 479, column: 9, scope: !348)
!360 = !DILocation(line: 480, column: 9, scope: !356)
!361 = !DILocalVariable(name: "n", scope: !348, file: !7, line: 482, type: !184)
!362 = !DILocation(line: 482, column: 13, scope: !348)
!363 = !DILocation(line: 482, column: 17, scope: !348)
!364 = !DILocation(line: 482, column: 24, scope: !348)
!365 = !DILocalVariable(name: "s", scope: !348, file: !7, line: 483, type: !184)
!366 = !DILocation(line: 483, column: 13, scope: !348)
!367 = !DILocation(line: 483, column: 17, scope: !348)
!368 = !DILocation(line: 483, column: 24, scope: !348)
!369 = !DILocalVariable(name: "cmp", scope: !348, file: !7, line: 485, type: !24)
!370 = !DILocation(line: 485, column: 9, scope: !348)
!371 = !DILocation(line: 486, column: 5, scope: !348)
!372 = !DILocation(line: 487, column: 15, scope: !373)
!373 = distinct !DILexicalBlock(scope: !348, file: !7, line: 486, column: 8)
!374 = !DILocation(line: 487, column: 22, scope: !373)
!375 = !DILocation(line: 487, column: 26, scope: !373)
!376 = !DILocation(line: 487, column: 31, scope: !373)
!377 = !DILocation(line: 487, column: 34, scope: !373)
!378 = !DILocation(line: 487, column: 13, scope: !373)
!379 = !DILocation(line: 489, column: 13, scope: !380)
!380 = distinct !DILexicalBlock(scope: !373, file: !7, line: 489, column: 13)
!381 = !DILocation(line: 489, column: 17, scope: !380)
!382 = !DILocation(line: 489, column: 13, scope: !373)
!383 = !DILocation(line: 490, column: 17, scope: !380)
!384 = !DILocation(line: 490, column: 20, scope: !380)
!385 = !DILocation(line: 490, column: 15, scope: !380)
!386 = !DILocation(line: 490, column: 13, scope: !380)
!387 = !DILocation(line: 491, column: 18, scope: !388)
!388 = distinct !DILexicalBlock(scope: !380, file: !7, line: 491, column: 18)
!389 = !DILocation(line: 491, column: 22, scope: !388)
!390 = !DILocation(line: 491, column: 18, scope: !380)
!391 = !DILocation(line: 492, column: 17, scope: !388)
!392 = !DILocation(line: 492, column: 20, scope: !388)
!393 = !DILocation(line: 492, column: 15, scope: !388)
!394 = !DILocation(line: 494, column: 20, scope: !388)
!395 = !DILocation(line: 494, column: 13, scope: !388)
!396 = !DILocation(line: 495, column: 14, scope: !348)
!397 = !DILocation(line: 495, column: 19, scope: !348)
!398 = !DILocation(line: 495, column: 16, scope: !348)
!399 = !DILocation(line: 495, column: 21, scope: !348)
!400 = !DILocation(line: 495, column: 5, scope: !373)
!401 = distinct !{!401, !371, !402, !403}
!402 = !DILocation(line: 495, column: 32, scope: !348)
!403 = !{!"llvm.loop.mustprogress"}
!404 = !DILocation(line: 497, column: 5, scope: !348)
!405 = !DILocation(line: 498, column: 1, scope: !348)
!406 = distinct !DISubprogram(name: "treetable_get_first_key", scope: !7, file: !7, line: 198, type: !407, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!407 = !DISubroutineType(types: !408)
!408 = !{!9, !323, !326}
!409 = !DILocalVariable(name: "table", arg: 1, scope: !406, file: !7, line: 198, type: !323)
!410 = !DILocation(line: 198, column: 62, scope: !406)
!411 = !DILocalVariable(name: "out", arg: 2, scope: !406, file: !7, line: 198, type: !326)
!412 = !DILocation(line: 198, column: 76, scope: !406)
!413 = !DILocalVariable(name: "node", scope: !406, file: !7, line: 200, type: !184)
!414 = !DILocation(line: 200, column: 13, scope: !406)
!415 = !DILocation(line: 200, column: 29, scope: !406)
!416 = !DILocation(line: 200, column: 36, scope: !406)
!417 = !DILocation(line: 200, column: 43, scope: !406)
!418 = !DILocation(line: 200, column: 20, scope: !406)
!419 = !DILocation(line: 202, column: 9, scope: !420)
!420 = distinct !DILexicalBlock(scope: !406, file: !7, line: 202, column: 9)
!421 = !DILocation(line: 202, column: 17, scope: !420)
!422 = !DILocation(line: 202, column: 24, scope: !420)
!423 = !DILocation(line: 202, column: 14, scope: !420)
!424 = !DILocation(line: 202, column: 9, scope: !406)
!425 = !DILocation(line: 203, column: 16, scope: !426)
!426 = distinct !DILexicalBlock(scope: !420, file: !7, line: 202, column: 34)
!427 = !DILocation(line: 203, column: 22, scope: !426)
!428 = !DILocation(line: 203, column: 10, scope: !426)
!429 = !DILocation(line: 203, column: 14, scope: !426)
!430 = !DILocation(line: 204, column: 9, scope: !426)
!431 = !DILocation(line: 207, column: 5, scope: !406)
!432 = !DILocation(line: 208, column: 1, scope: !406)
!433 = distinct !DISubprogram(name: "tree_min", scope: !7, file: !7, line: 391, type: !434, scopeLine: 392, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !2)
!434 = !DISubroutineType(types: !435)
!435 = !{!184, !323, !184}
!436 = !DILocalVariable(name: "table", arg: 1, scope: !433, file: !7, line: 391, type: !323)
!437 = !DILocation(line: 391, column: 56, scope: !433)
!438 = !DILocalVariable(name: "n", arg: 2, scope: !433, file: !7, line: 391, type: !184)
!439 = !DILocation(line: 391, column: 71, scope: !433)
!440 = !DILocalVariable(name: "s", scope: !433, file: !7, line: 393, type: !184)
!441 = !DILocation(line: 393, column: 13, scope: !433)
!442 = !DILocation(line: 393, column: 17, scope: !433)
!443 = !DILocation(line: 393, column: 24, scope: !433)
!444 = !DILocation(line: 396, column: 9, scope: !433)
!445 = !DILocation(line: 396, column: 16, scope: !433)
!446 = !DILocation(line: 396, column: 21, scope: !433)
!447 = !DILocation(line: 396, column: 18, scope: !433)
!448 = !DILocation(line: 396, column: 23, scope: !433)
!449 = !DILocation(line: 396, column: 26, scope: !433)
!450 = !DILocation(line: 396, column: 29, scope: !433)
!451 = !DILocation(line: 396, column: 37, scope: !433)
!452 = !DILocation(line: 396, column: 34, scope: !433)
!453 = !DILocation(line: 397, column: 17, scope: !433)
!454 = !DILocation(line: 397, column: 20, scope: !433)
!455 = !DILocation(line: 397, column: 15, scope: !433)
!456 = distinct !{!456, !444, !454, !403}
!457 = !DILocation(line: 399, column: 12, scope: !433)
!458 = !DILocation(line: 399, column: 5, scope: !433)
!459 = distinct !DISubprogram(name: "treetable_get_greater_than", scope: !7, file: !7, line: 220, type: !321, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!460 = !DILocalVariable(name: "table", arg: 1, scope: !459, file: !7, line: 220, type: !323)
!461 = !DILocation(line: 220, column: 65, scope: !459)
!462 = !DILocalVariable(name: "key", arg: 2, scope: !459, file: !7, line: 220, type: !105)
!463 = !DILocation(line: 220, column: 84, scope: !459)
!464 = !DILocalVariable(name: "out", arg: 3, scope: !459, file: !7, line: 220, type: !326)
!465 = !DILocation(line: 220, column: 96, scope: !459)
!466 = !DILocalVariable(name: "n", scope: !459, file: !7, line: 222, type: !184)
!467 = !DILocation(line: 222, column: 13, scope: !459)
!468 = !DILocation(line: 222, column: 38, scope: !459)
!469 = !DILocation(line: 222, column: 45, scope: !459)
!470 = !DILocation(line: 222, column: 17, scope: !459)
!471 = !DILocalVariable(name: "s", scope: !459, file: !7, line: 223, type: !184)
!472 = !DILocation(line: 223, column: 13, scope: !459)
!473 = !DILocation(line: 223, column: 36, scope: !459)
!474 = !DILocation(line: 223, column: 43, scope: !459)
!475 = !DILocation(line: 223, column: 17, scope: !459)
!476 = !DILocation(line: 226, column: 9, scope: !477)
!477 = distinct !DILexicalBlock(scope: !459, file: !7, line: 226, column: 9)
!478 = !DILocation(line: 226, column: 14, scope: !477)
!479 = !DILocation(line: 226, column: 21, scope: !477)
!480 = !DILocation(line: 226, column: 11, scope: !477)
!481 = !DILocation(line: 226, column: 30, scope: !477)
!482 = !DILocation(line: 227, column: 16, scope: !483)
!483 = distinct !DILexicalBlock(scope: !477, file: !7, line: 226, column: 41)
!484 = !DILocation(line: 227, column: 19, scope: !483)
!485 = !DILocation(line: 227, column: 10, scope: !483)
!486 = !DILocation(line: 227, column: 14, scope: !483)
!487 = !DILocation(line: 228, column: 9, scope: !483)
!488 = !DILocation(line: 230, column: 5, scope: !459)
!489 = !DILocation(line: 231, column: 1, scope: !459)
!490 = distinct !DISubprogram(name: "get_successor_node", scope: !7, file: !7, line: 508, type: !434, scopeLine: 509, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !2)
!491 = !DILocalVariable(name: "table", arg: 1, scope: !490, file: !7, line: 508, type: !323)
!492 = !DILocation(line: 508, column: 59, scope: !490)
!493 = !DILocalVariable(name: "x", arg: 2, scope: !490, file: !7, line: 508, type: !184)
!494 = !DILocation(line: 508, column: 74, scope: !490)
!495 = !DILocation(line: 510, column: 9, scope: !496)
!496 = distinct !DILexicalBlock(scope: !490, file: !7, line: 510, column: 9)
!497 = !DILocation(line: 510, column: 11, scope: !496)
!498 = !DILocation(line: 510, column: 9, scope: !490)
!499 = !DILocation(line: 511, column: 9, scope: !496)
!500 = !DILocation(line: 513, column: 9, scope: !501)
!501 = distinct !DILexicalBlock(scope: !490, file: !7, line: 513, column: 9)
!502 = !DILocation(line: 513, column: 12, scope: !501)
!503 = !DILocation(line: 513, column: 21, scope: !501)
!504 = !DILocation(line: 513, column: 28, scope: !501)
!505 = !DILocation(line: 513, column: 18, scope: !501)
!506 = !DILocation(line: 513, column: 9, scope: !490)
!507 = !DILocation(line: 514, column: 25, scope: !501)
!508 = !DILocation(line: 514, column: 32, scope: !501)
!509 = !DILocation(line: 514, column: 35, scope: !501)
!510 = !DILocation(line: 514, column: 16, scope: !501)
!511 = !DILocation(line: 514, column: 9, scope: !501)
!512 = !DILocalVariable(name: "y", scope: !490, file: !7, line: 516, type: !184)
!513 = !DILocation(line: 516, column: 13, scope: !490)
!514 = !DILocation(line: 516, column: 17, scope: !490)
!515 = !DILocation(line: 516, column: 20, scope: !490)
!516 = !DILocation(line: 518, column: 5, scope: !490)
!517 = !DILocation(line: 518, column: 12, scope: !490)
!518 = !DILocation(line: 518, column: 17, scope: !490)
!519 = !DILocation(line: 518, column: 24, scope: !490)
!520 = !DILocation(line: 518, column: 14, scope: !490)
!521 = !DILocation(line: 518, column: 33, scope: !490)
!522 = !DILocation(line: 518, column: 36, scope: !490)
!523 = !DILocation(line: 518, column: 41, scope: !490)
!524 = !DILocation(line: 518, column: 44, scope: !490)
!525 = !DILocation(line: 518, column: 38, scope: !490)
!526 = !DILocation(line: 519, column: 13, scope: !527)
!527 = distinct !DILexicalBlock(scope: !490, file: !7, line: 518, column: 51)
!528 = !DILocation(line: 519, column: 11, scope: !527)
!529 = !DILocation(line: 520, column: 13, scope: !527)
!530 = !DILocation(line: 520, column: 16, scope: !527)
!531 = !DILocation(line: 520, column: 11, scope: !527)
!532 = distinct !{!532, !516, !533, !403}
!533 = !DILocation(line: 521, column: 5, scope: !490)
!534 = !DILocation(line: 522, column: 12, scope: !490)
!535 = !DILocation(line: 522, column: 5, scope: !490)
!536 = !DILocation(line: 523, column: 1, scope: !490)
!537 = distinct !DISubprogram(name: "treetable_size", scope: !7, file: !7, line: 241, type: !538, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!538 = !DISubroutineType(types: !539)
!539 = !{!149, !323}
!540 = !DILocalVariable(name: "table", arg: 1, scope: !537, file: !7, line: 241, type: !323)
!541 = !DILocation(line: 241, column: 47, scope: !537)
!542 = !DILocation(line: 243, column: 12, scope: !537)
!543 = !DILocation(line: 243, column: 19, scope: !537)
!544 = !DILocation(line: 243, column: 5, scope: !537)
!545 = distinct !DISubprogram(name: "treetable_contains_key", scope: !7, file: !7, line: 254, type: !546, scopeLine: 255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!546 = !DISubroutineType(types: !547)
!547 = !{!548, !323, !105}
!548 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!549 = !DILocalVariable(name: "table", arg: 1, scope: !545, file: !7, line: 254, type: !323)
!550 = !DILocation(line: 254, column: 53, scope: !545)
!551 = !DILocalVariable(name: "key", arg: 2, scope: !545, file: !7, line: 254, type: !105)
!552 = !DILocation(line: 254, column: 72, scope: !545)
!553 = !DILocalVariable(name: "node", scope: !545, file: !7, line: 256, type: !184)
!554 = !DILocation(line: 256, column: 13, scope: !545)
!555 = !DILocation(line: 256, column: 41, scope: !545)
!556 = !DILocation(line: 256, column: 48, scope: !545)
!557 = !DILocation(line: 256, column: 20, scope: !545)
!558 = !DILocation(line: 258, column: 9, scope: !559)
!559 = distinct !DILexicalBlock(scope: !545, file: !7, line: 258, column: 9)
!560 = !DILocation(line: 258, column: 9, scope: !545)
!561 = !DILocation(line: 259, column: 9, scope: !559)
!562 = !DILocation(line: 261, column: 5, scope: !545)
!563 = !DILocation(line: 262, column: 1, scope: !545)
!564 = distinct !DISubprogram(name: "treetable_contains_value", scope: !7, file: !7, line: 272, type: !565, scopeLine: 273, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!565 = !DISubroutineType(types: !566)
!566 = !{!149, !323, !105}
!567 = !DILocalVariable(name: "table", arg: 1, scope: !564, file: !7, line: 272, type: !323)
!568 = !DILocation(line: 272, column: 57, scope: !564)
!569 = !DILocalVariable(name: "value", arg: 2, scope: !564, file: !7, line: 272, type: !105)
!570 = !DILocation(line: 272, column: 76, scope: !564)
!571 = !DILocalVariable(name: "node", scope: !564, file: !7, line: 274, type: !184)
!572 = !DILocation(line: 274, column: 13, scope: !564)
!573 = !DILocation(line: 274, column: 29, scope: !564)
!574 = !DILocation(line: 274, column: 36, scope: !564)
!575 = !DILocation(line: 274, column: 43, scope: !564)
!576 = !DILocation(line: 274, column: 20, scope: !564)
!577 = !DILocalVariable(name: "o", scope: !564, file: !7, line: 276, type: !149)
!578 = !DILocation(line: 276, column: 12, scope: !564)
!579 = !DILocation(line: 277, column: 5, scope: !564)
!580 = !DILocation(line: 277, column: 12, scope: !564)
!581 = !DILocation(line: 277, column: 20, scope: !564)
!582 = !DILocation(line: 277, column: 27, scope: !564)
!583 = !DILocation(line: 277, column: 17, scope: !564)
!584 = !DILocation(line: 278, column: 13, scope: !585)
!585 = distinct !DILexicalBlock(scope: !586, file: !7, line: 278, column: 13)
!586 = distinct !DILexicalBlock(scope: !564, file: !7, line: 277, column: 37)
!587 = !DILocation(line: 278, column: 19, scope: !585)
!588 = !DILocation(line: 278, column: 28, scope: !585)
!589 = !DILocation(line: 278, column: 25, scope: !585)
!590 = !DILocation(line: 278, column: 13, scope: !586)
!591 = !DILocation(line: 279, column: 14, scope: !585)
!592 = !DILocation(line: 279, column: 13, scope: !585)
!593 = !DILocation(line: 280, column: 35, scope: !586)
!594 = !DILocation(line: 280, column: 42, scope: !586)
!595 = !DILocation(line: 280, column: 16, scope: !586)
!596 = !DILocation(line: 280, column: 14, scope: !586)
!597 = distinct !{!597, !579, !598, !403}
!598 = !DILocation(line: 281, column: 5, scope: !564)
!599 = !DILocation(line: 282, column: 12, scope: !564)
!600 = !DILocation(line: 282, column: 5, scope: !564)
!601 = distinct !DISubprogram(name: "treetable_add", scope: !7, file: !7, line: 299, type: !602, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!602 = !DISubroutineType(types: !603)
!603 = !{!9, !179, !25, !25}
!604 = !DILocalVariable(name: "table", arg: 1, scope: !601, file: !7, line: 299, type: !179)
!605 = !DILocation(line: 299, column: 39, scope: !601)
!606 = !DILocalVariable(name: "key", arg: 2, scope: !601, file: !7, line: 299, type: !25)
!607 = !DILocation(line: 299, column: 52, scope: !601)
!608 = !DILocalVariable(name: "val", arg: 3, scope: !601, file: !7, line: 299, type: !25)
!609 = !DILocation(line: 299, column: 63, scope: !601)
!610 = !DILocalVariable(name: "y", scope: !601, file: !7, line: 301, type: !184)
!611 = !DILocation(line: 301, column: 13, scope: !601)
!612 = !DILocation(line: 301, column: 17, scope: !601)
!613 = !DILocation(line: 301, column: 24, scope: !601)
!614 = !DILocalVariable(name: "x", scope: !601, file: !7, line: 302, type: !184)
!615 = !DILocation(line: 302, column: 13, scope: !601)
!616 = !DILocation(line: 302, column: 17, scope: !601)
!617 = !DILocation(line: 302, column: 24, scope: !601)
!618 = !DILocalVariable(name: "cmp", scope: !601, file: !7, line: 304, type: !24)
!619 = !DILocation(line: 304, column: 9, scope: !601)
!620 = !DILocation(line: 305, column: 5, scope: !601)
!621 = !DILocation(line: 305, column: 12, scope: !601)
!622 = !DILocation(line: 305, column: 17, scope: !601)
!623 = !DILocation(line: 305, column: 24, scope: !601)
!624 = !DILocation(line: 305, column: 14, scope: !601)
!625 = !DILocation(line: 306, column: 15, scope: !626)
!626 = distinct !DILexicalBlock(scope: !601, file: !7, line: 305, column: 34)
!627 = !DILocation(line: 306, column: 22, scope: !626)
!628 = !DILocation(line: 306, column: 26, scope: !626)
!629 = !DILocation(line: 306, column: 31, scope: !626)
!630 = !DILocation(line: 306, column: 34, scope: !626)
!631 = !DILocation(line: 306, column: 13, scope: !626)
!632 = !DILocation(line: 307, column: 15, scope: !626)
!633 = !DILocation(line: 307, column: 13, scope: !626)
!634 = !DILocation(line: 309, column: 13, scope: !635)
!635 = distinct !DILexicalBlock(scope: !626, file: !7, line: 309, column: 13)
!636 = !DILocation(line: 309, column: 17, scope: !635)
!637 = !DILocation(line: 309, column: 13, scope: !626)
!638 = !DILocation(line: 310, column: 17, scope: !639)
!639 = distinct !DILexicalBlock(scope: !635, file: !7, line: 309, column: 22)
!640 = !DILocation(line: 310, column: 20, scope: !639)
!641 = !DILocation(line: 310, column: 15, scope: !639)
!642 = !DILocation(line: 311, column: 9, scope: !639)
!643 = !DILocation(line: 311, column: 20, scope: !644)
!644 = distinct !DILexicalBlock(scope: !635, file: !7, line: 311, column: 20)
!645 = !DILocation(line: 311, column: 24, scope: !644)
!646 = !DILocation(line: 311, column: 20, scope: !635)
!647 = !DILocation(line: 312, column: 17, scope: !648)
!648 = distinct !DILexicalBlock(scope: !644, file: !7, line: 311, column: 29)
!649 = !DILocation(line: 312, column: 20, scope: !648)
!650 = !DILocation(line: 312, column: 15, scope: !648)
!651 = !DILocation(line: 314, column: 24, scope: !652)
!652 = distinct !DILexicalBlock(scope: !644, file: !7, line: 313, column: 16)
!653 = !DILocation(line: 314, column: 13, scope: !652)
!654 = !DILocation(line: 314, column: 16, scope: !652)
!655 = !DILocation(line: 314, column: 22, scope: !652)
!656 = !DILocation(line: 315, column: 13, scope: !652)
!657 = distinct !{!657, !620, !658, !403}
!658 = !DILocation(line: 317, column: 5, scope: !601)
!659 = !DILocalVariable(name: "n", scope: !601, file: !7, line: 318, type: !184)
!660 = !DILocation(line: 318, column: 13, scope: !601)
!661 = !DILocation(line: 318, column: 17, scope: !601)
!662 = !DILocation(line: 318, column: 24, scope: !601)
!663 = !DILocation(line: 320, column: 17, scope: !601)
!664 = !DILocation(line: 320, column: 5, scope: !601)
!665 = !DILocation(line: 320, column: 8, scope: !601)
!666 = !DILocation(line: 320, column: 15, scope: !601)
!667 = !DILocation(line: 321, column: 17, scope: !601)
!668 = !DILocation(line: 321, column: 5, scope: !601)
!669 = !DILocation(line: 321, column: 8, scope: !601)
!670 = !DILocation(line: 321, column: 15, scope: !601)
!671 = !DILocation(line: 322, column: 17, scope: !601)
!672 = !DILocation(line: 322, column: 5, scope: !601)
!673 = !DILocation(line: 322, column: 8, scope: !601)
!674 = !DILocation(line: 322, column: 15, scope: !601)
!675 = !DILocation(line: 323, column: 17, scope: !601)
!676 = !DILocation(line: 323, column: 24, scope: !601)
!677 = !DILocation(line: 323, column: 5, scope: !601)
!678 = !DILocation(line: 323, column: 8, scope: !601)
!679 = !DILocation(line: 323, column: 15, scope: !601)
!680 = !DILocation(line: 324, column: 17, scope: !601)
!681 = !DILocation(line: 324, column: 24, scope: !601)
!682 = !DILocation(line: 324, column: 5, scope: !601)
!683 = !DILocation(line: 324, column: 8, scope: !601)
!684 = !DILocation(line: 324, column: 15, scope: !601)
!685 = !DILocation(line: 326, column: 5, scope: !601)
!686 = !DILocation(line: 326, column: 12, scope: !601)
!687 = !DILocation(line: 326, column: 16, scope: !601)
!688 = !DILocation(line: 328, column: 9, scope: !689)
!689 = distinct !DILexicalBlock(scope: !601, file: !7, line: 328, column: 9)
!690 = !DILocation(line: 328, column: 14, scope: !689)
!691 = !DILocation(line: 328, column: 21, scope: !689)
!692 = !DILocation(line: 328, column: 11, scope: !689)
!693 = !DILocation(line: 328, column: 9, scope: !601)
!694 = !DILocation(line: 329, column: 23, scope: !695)
!695 = distinct !DILexicalBlock(scope: !689, file: !7, line: 328, column: 31)
!696 = !DILocation(line: 329, column: 9, scope: !695)
!697 = !DILocation(line: 329, column: 16, scope: !695)
!698 = !DILocation(line: 329, column: 21, scope: !695)
!699 = !DILocation(line: 330, column: 9, scope: !695)
!700 = !DILocation(line: 330, column: 12, scope: !695)
!701 = !DILocation(line: 330, column: 21, scope: !695)
!702 = !DILocation(line: 331, column: 5, scope: !695)
!703 = !DILocation(line: 332, column: 9, scope: !704)
!704 = distinct !DILexicalBlock(scope: !689, file: !7, line: 331, column: 12)
!705 = !DILocation(line: 332, column: 12, scope: !704)
!706 = !DILocation(line: 332, column: 18, scope: !704)
!707 = !DILocation(line: 333, column: 13, scope: !708)
!708 = distinct !DILexicalBlock(scope: !704, file: !7, line: 333, column: 13)
!709 = !DILocation(line: 333, column: 20, scope: !708)
!710 = !DILocation(line: 333, column: 24, scope: !708)
!711 = !DILocation(line: 333, column: 29, scope: !708)
!712 = !DILocation(line: 333, column: 32, scope: !708)
!713 = !DILocation(line: 333, column: 37, scope: !708)
!714 = !DILocation(line: 333, column: 13, scope: !704)
!715 = !DILocation(line: 334, column: 23, scope: !716)
!716 = distinct !DILexicalBlock(scope: !708, file: !7, line: 333, column: 42)
!717 = !DILocation(line: 334, column: 13, scope: !716)
!718 = !DILocation(line: 334, column: 16, scope: !716)
!719 = !DILocation(line: 334, column: 21, scope: !716)
!720 = !DILocation(line: 335, column: 9, scope: !716)
!721 = !DILocation(line: 336, column: 24, scope: !722)
!722 = distinct !DILexicalBlock(scope: !708, file: !7, line: 335, column: 16)
!723 = !DILocation(line: 336, column: 13, scope: !722)
!724 = !DILocation(line: 336, column: 16, scope: !722)
!725 = !DILocation(line: 336, column: 22, scope: !722)
!726 = !DILocation(line: 338, column: 32, scope: !704)
!727 = !DILocation(line: 338, column: 39, scope: !704)
!728 = !DILocation(line: 338, column: 9, scope: !704)
!729 = !DILocation(line: 340, column: 5, scope: !601)
!730 = !DILocation(line: 341, column: 1, scope: !601)
!731 = distinct !DISubprogram(name: "rebalance_after_insert", scope: !7, file: !7, line: 349, type: !296, scopeLine: 350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !2)
!732 = !DILocalVariable(name: "table", arg: 1, scope: !731, file: !7, line: 349, type: !179)
!733 = !DILocation(line: 349, column: 47, scope: !731)
!734 = !DILocalVariable(name: "z", arg: 2, scope: !731, file: !7, line: 349, type: !184)
!735 = !DILocation(line: 349, column: 62, scope: !731)
!736 = !DILocalVariable(name: "y", scope: !731, file: !7, line: 351, type: !184)
!737 = !DILocation(line: 351, column: 13, scope: !731)
!738 = !DILocation(line: 353, column: 5, scope: !731)
!739 = !DILocation(line: 353, column: 12, scope: !731)
!740 = !DILocation(line: 353, column: 15, scope: !731)
!741 = !DILocation(line: 353, column: 23, scope: !731)
!742 = !DILocation(line: 353, column: 29, scope: !731)
!743 = !DILocation(line: 354, column: 13, scope: !744)
!744 = distinct !DILexicalBlock(scope: !745, file: !7, line: 354, column: 13)
!745 = distinct !DILexicalBlock(scope: !731, file: !7, line: 353, column: 40)
!746 = !DILocation(line: 354, column: 16, scope: !744)
!747 = !DILocation(line: 354, column: 26, scope: !744)
!748 = !DILocation(line: 354, column: 29, scope: !744)
!749 = !DILocation(line: 354, column: 37, scope: !744)
!750 = !DILocation(line: 354, column: 45, scope: !744)
!751 = !DILocation(line: 354, column: 23, scope: !744)
!752 = !DILocation(line: 354, column: 13, scope: !745)
!753 = !DILocation(line: 355, column: 17, scope: !754)
!754 = distinct !DILexicalBlock(scope: !744, file: !7, line: 354, column: 51)
!755 = !DILocation(line: 355, column: 20, scope: !754)
!756 = !DILocation(line: 355, column: 28, scope: !754)
!757 = !DILocation(line: 355, column: 36, scope: !754)
!758 = !DILocation(line: 355, column: 15, scope: !754)
!759 = !DILocation(line: 356, column: 17, scope: !760)
!760 = distinct !DILexicalBlock(scope: !754, file: !7, line: 356, column: 17)
!761 = !DILocation(line: 356, column: 20, scope: !760)
!762 = !DILocation(line: 356, column: 26, scope: !760)
!763 = !DILocation(line: 356, column: 17, scope: !754)
!764 = !DILocation(line: 357, column: 17, scope: !765)
!765 = distinct !DILexicalBlock(scope: !760, file: !7, line: 356, column: 37)
!766 = !DILocation(line: 357, column: 20, scope: !765)
!767 = !DILocation(line: 357, column: 28, scope: !765)
!768 = !DILocation(line: 357, column: 42, scope: !765)
!769 = !DILocation(line: 358, column: 17, scope: !765)
!770 = !DILocation(line: 358, column: 20, scope: !765)
!771 = !DILocation(line: 358, column: 42, scope: !765)
!772 = !DILocation(line: 359, column: 17, scope: !765)
!773 = !DILocation(line: 359, column: 20, scope: !765)
!774 = !DILocation(line: 359, column: 28, scope: !765)
!775 = !DILocation(line: 359, column: 36, scope: !765)
!776 = !DILocation(line: 359, column: 42, scope: !765)
!777 = !DILocation(line: 360, column: 21, scope: !765)
!778 = !DILocation(line: 360, column: 24, scope: !765)
!779 = !DILocation(line: 360, column: 32, scope: !765)
!780 = !DILocation(line: 360, column: 19, scope: !765)
!781 = !DILocation(line: 361, column: 13, scope: !765)
!782 = !DILocation(line: 362, column: 21, scope: !783)
!783 = distinct !DILexicalBlock(scope: !784, file: !7, line: 362, column: 21)
!784 = distinct !DILexicalBlock(scope: !760, file: !7, line: 361, column: 20)
!785 = !DILocation(line: 362, column: 26, scope: !783)
!786 = !DILocation(line: 362, column: 29, scope: !783)
!787 = !DILocation(line: 362, column: 37, scope: !783)
!788 = !DILocation(line: 362, column: 23, scope: !783)
!789 = !DILocation(line: 362, column: 21, scope: !784)
!790 = !DILocation(line: 363, column: 25, scope: !791)
!791 = distinct !DILexicalBlock(scope: !783, file: !7, line: 362, column: 44)
!792 = !DILocation(line: 363, column: 28, scope: !791)
!793 = !DILocation(line: 363, column: 23, scope: !791)
!794 = !DILocation(line: 364, column: 33, scope: !791)
!795 = !DILocation(line: 364, column: 40, scope: !791)
!796 = !DILocation(line: 364, column: 21, scope: !791)
!797 = !DILocation(line: 365, column: 17, scope: !791)
!798 = !DILocation(line: 366, column: 17, scope: !784)
!799 = !DILocation(line: 366, column: 20, scope: !784)
!800 = !DILocation(line: 366, column: 28, scope: !784)
!801 = !DILocation(line: 366, column: 42, scope: !784)
!802 = !DILocation(line: 367, column: 17, scope: !784)
!803 = !DILocation(line: 367, column: 20, scope: !784)
!804 = !DILocation(line: 367, column: 28, scope: !784)
!805 = !DILocation(line: 367, column: 36, scope: !784)
!806 = !DILocation(line: 367, column: 42, scope: !784)
!807 = !DILocation(line: 368, column: 30, scope: !784)
!808 = !DILocation(line: 368, column: 37, scope: !784)
!809 = !DILocation(line: 368, column: 40, scope: !784)
!810 = !DILocation(line: 368, column: 48, scope: !784)
!811 = !DILocation(line: 368, column: 17, scope: !784)
!812 = !DILocation(line: 371, column: 17, scope: !813)
!813 = distinct !DILexicalBlock(scope: !744, file: !7, line: 370, column: 16)
!814 = !DILocation(line: 371, column: 20, scope: !813)
!815 = !DILocation(line: 371, column: 28, scope: !813)
!816 = !DILocation(line: 371, column: 36, scope: !813)
!817 = !DILocation(line: 371, column: 15, scope: !813)
!818 = !DILocation(line: 372, column: 17, scope: !819)
!819 = distinct !DILexicalBlock(scope: !813, file: !7, line: 372, column: 17)
!820 = !DILocation(line: 372, column: 20, scope: !819)
!821 = !DILocation(line: 372, column: 26, scope: !819)
!822 = !DILocation(line: 372, column: 17, scope: !813)
!823 = !DILocation(line: 373, column: 17, scope: !824)
!824 = distinct !DILexicalBlock(scope: !819, file: !7, line: 372, column: 37)
!825 = !DILocation(line: 373, column: 20, scope: !824)
!826 = !DILocation(line: 373, column: 28, scope: !824)
!827 = !DILocation(line: 373, column: 42, scope: !824)
!828 = !DILocation(line: 374, column: 17, scope: !824)
!829 = !DILocation(line: 374, column: 20, scope: !824)
!830 = !DILocation(line: 374, column: 42, scope: !824)
!831 = !DILocation(line: 375, column: 17, scope: !824)
!832 = !DILocation(line: 375, column: 20, scope: !824)
!833 = !DILocation(line: 375, column: 28, scope: !824)
!834 = !DILocation(line: 375, column: 36, scope: !824)
!835 = !DILocation(line: 375, column: 42, scope: !824)
!836 = !DILocation(line: 376, column: 21, scope: !824)
!837 = !DILocation(line: 376, column: 24, scope: !824)
!838 = !DILocation(line: 376, column: 32, scope: !824)
!839 = !DILocation(line: 376, column: 19, scope: !824)
!840 = !DILocation(line: 377, column: 13, scope: !824)
!841 = !DILocation(line: 378, column: 21, scope: !842)
!842 = distinct !DILexicalBlock(scope: !843, file: !7, line: 378, column: 21)
!843 = distinct !DILexicalBlock(scope: !819, file: !7, line: 377, column: 20)
!844 = !DILocation(line: 378, column: 26, scope: !842)
!845 = !DILocation(line: 378, column: 29, scope: !842)
!846 = !DILocation(line: 378, column: 37, scope: !842)
!847 = !DILocation(line: 378, column: 23, scope: !842)
!848 = !DILocation(line: 378, column: 21, scope: !843)
!849 = !DILocation(line: 379, column: 25, scope: !850)
!850 = distinct !DILexicalBlock(scope: !842, file: !7, line: 378, column: 43)
!851 = !DILocation(line: 379, column: 28, scope: !850)
!852 = !DILocation(line: 379, column: 23, scope: !850)
!853 = !DILocation(line: 380, column: 34, scope: !850)
!854 = !DILocation(line: 380, column: 41, scope: !850)
!855 = !DILocation(line: 380, column: 21, scope: !850)
!856 = !DILocation(line: 381, column: 17, scope: !850)
!857 = !DILocation(line: 382, column: 17, scope: !843)
!858 = !DILocation(line: 382, column: 20, scope: !843)
!859 = !DILocation(line: 382, column: 28, scope: !843)
!860 = !DILocation(line: 382, column: 42, scope: !843)
!861 = !DILocation(line: 383, column: 17, scope: !843)
!862 = !DILocation(line: 383, column: 20, scope: !843)
!863 = !DILocation(line: 383, column: 28, scope: !843)
!864 = !DILocation(line: 383, column: 36, scope: !843)
!865 = !DILocation(line: 383, column: 42, scope: !843)
!866 = !DILocation(line: 384, column: 29, scope: !843)
!867 = !DILocation(line: 384, column: 36, scope: !843)
!868 = !DILocation(line: 384, column: 39, scope: !843)
!869 = !DILocation(line: 384, column: 47, scope: !843)
!870 = !DILocation(line: 384, column: 17, scope: !843)
!871 = distinct !{!871, !738, !872, !403}
!872 = !DILocation(line: 387, column: 5, scope: !731)
!873 = !DILocation(line: 388, column: 5, scope: !731)
!874 = !DILocation(line: 388, column: 12, scope: !731)
!875 = !DILocation(line: 388, column: 18, scope: !731)
!876 = !DILocation(line: 388, column: 24, scope: !731)
!877 = !DILocation(line: 389, column: 1, scope: !731)
!878 = distinct !DISubprogram(name: "rotate_left", scope: !7, file: !7, line: 447, type: !296, scopeLine: 448, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !2)
!879 = !DILocalVariable(name: "table", arg: 1, scope: !878, file: !7, line: 447, type: !179)
!880 = !DILocation(line: 447, column: 36, scope: !878)
!881 = !DILocalVariable(name: "x", arg: 2, scope: !878, file: !7, line: 447, type: !184)
!882 = !DILocation(line: 447, column: 51, scope: !878)
!883 = !DILocalVariable(name: "y", scope: !878, file: !7, line: 449, type: !184)
!884 = !DILocation(line: 449, column: 13, scope: !878)
!885 = !DILocation(line: 449, column: 17, scope: !878)
!886 = !DILocation(line: 449, column: 20, scope: !878)
!887 = !DILocation(line: 451, column: 16, scope: !878)
!888 = !DILocation(line: 451, column: 19, scope: !878)
!889 = !DILocation(line: 451, column: 5, scope: !878)
!890 = !DILocation(line: 451, column: 8, scope: !878)
!891 = !DILocation(line: 451, column: 14, scope: !878)
!892 = !DILocation(line: 453, column: 9, scope: !893)
!893 = distinct !DILexicalBlock(scope: !878, file: !7, line: 453, column: 9)
!894 = !DILocation(line: 453, column: 12, scope: !893)
!895 = !DILocation(line: 453, column: 20, scope: !893)
!896 = !DILocation(line: 453, column: 27, scope: !893)
!897 = !DILocation(line: 453, column: 17, scope: !893)
!898 = !DILocation(line: 453, column: 9, scope: !878)
!899 = !DILocation(line: 454, column: 27, scope: !893)
!900 = !DILocation(line: 454, column: 9, scope: !893)
!901 = !DILocation(line: 454, column: 12, scope: !893)
!902 = !DILocation(line: 454, column: 18, scope: !893)
!903 = !DILocation(line: 454, column: 25, scope: !893)
!904 = !DILocation(line: 456, column: 17, scope: !878)
!905 = !DILocation(line: 456, column: 20, scope: !878)
!906 = !DILocation(line: 456, column: 5, scope: !878)
!907 = !DILocation(line: 456, column: 8, scope: !878)
!908 = !DILocation(line: 456, column: 15, scope: !878)
!909 = !DILocation(line: 458, column: 9, scope: !910)
!910 = distinct !DILexicalBlock(scope: !878, file: !7, line: 458, column: 9)
!911 = !DILocation(line: 458, column: 12, scope: !910)
!912 = !DILocation(line: 458, column: 22, scope: !910)
!913 = !DILocation(line: 458, column: 29, scope: !910)
!914 = !DILocation(line: 458, column: 19, scope: !910)
!915 = !DILocation(line: 458, column: 9, scope: !878)
!916 = !DILocation(line: 459, column: 23, scope: !910)
!917 = !DILocation(line: 459, column: 9, scope: !910)
!918 = !DILocation(line: 459, column: 16, scope: !910)
!919 = !DILocation(line: 459, column: 21, scope: !910)
!920 = !DILocation(line: 460, column: 14, scope: !921)
!921 = distinct !DILexicalBlock(scope: !910, file: !7, line: 460, column: 14)
!922 = !DILocation(line: 460, column: 19, scope: !921)
!923 = !DILocation(line: 460, column: 22, scope: !921)
!924 = !DILocation(line: 460, column: 30, scope: !921)
!925 = !DILocation(line: 460, column: 16, scope: !921)
!926 = !DILocation(line: 460, column: 14, scope: !910)
!927 = !DILocation(line: 461, column: 27, scope: !921)
!928 = !DILocation(line: 461, column: 9, scope: !921)
!929 = !DILocation(line: 461, column: 12, scope: !921)
!930 = !DILocation(line: 461, column: 20, scope: !921)
!931 = !DILocation(line: 461, column: 25, scope: !921)
!932 = !DILocation(line: 463, column: 28, scope: !921)
!933 = !DILocation(line: 463, column: 9, scope: !921)
!934 = !DILocation(line: 463, column: 12, scope: !921)
!935 = !DILocation(line: 463, column: 20, scope: !921)
!936 = !DILocation(line: 463, column: 26, scope: !921)
!937 = !DILocation(line: 465, column: 17, scope: !878)
!938 = !DILocation(line: 465, column: 5, scope: !878)
!939 = !DILocation(line: 465, column: 8, scope: !878)
!940 = !DILocation(line: 465, column: 15, scope: !878)
!941 = !DILocation(line: 466, column: 17, scope: !878)
!942 = !DILocation(line: 466, column: 5, scope: !878)
!943 = !DILocation(line: 466, column: 8, scope: !878)
!944 = !DILocation(line: 466, column: 15, scope: !878)
!945 = !DILocation(line: 467, column: 1, scope: !878)
!946 = distinct !DISubprogram(name: "rotate_right", scope: !7, file: !7, line: 418, type: !296, scopeLine: 419, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !2)
!947 = !DILocalVariable(name: "table", arg: 1, scope: !946, file: !7, line: 418, type: !179)
!948 = !DILocation(line: 418, column: 37, scope: !946)
!949 = !DILocalVariable(name: "x", arg: 2, scope: !946, file: !7, line: 418, type: !184)
!950 = !DILocation(line: 418, column: 52, scope: !946)
!951 = !DILocalVariable(name: "y", scope: !946, file: !7, line: 420, type: !184)
!952 = !DILocation(line: 420, column: 13, scope: !946)
!953 = !DILocation(line: 420, column: 17, scope: !946)
!954 = !DILocation(line: 420, column: 20, scope: !946)
!955 = !DILocation(line: 422, column: 15, scope: !946)
!956 = !DILocation(line: 422, column: 18, scope: !946)
!957 = !DILocation(line: 422, column: 5, scope: !946)
!958 = !DILocation(line: 422, column: 8, scope: !946)
!959 = !DILocation(line: 422, column: 13, scope: !946)
!960 = !DILocation(line: 424, column: 9, scope: !961)
!961 = distinct !DILexicalBlock(scope: !946, file: !7, line: 424, column: 9)
!962 = !DILocation(line: 424, column: 12, scope: !961)
!963 = !DILocation(line: 424, column: 21, scope: !961)
!964 = !DILocation(line: 424, column: 28, scope: !961)
!965 = !DILocation(line: 424, column: 18, scope: !961)
!966 = !DILocation(line: 424, column: 9, scope: !946)
!967 = !DILocation(line: 425, column: 28, scope: !961)
!968 = !DILocation(line: 425, column: 9, scope: !961)
!969 = !DILocation(line: 425, column: 12, scope: !961)
!970 = !DILocation(line: 425, column: 19, scope: !961)
!971 = !DILocation(line: 425, column: 26, scope: !961)
!972 = !DILocation(line: 427, column: 17, scope: !946)
!973 = !DILocation(line: 427, column: 20, scope: !946)
!974 = !DILocation(line: 427, column: 5, scope: !946)
!975 = !DILocation(line: 427, column: 8, scope: !946)
!976 = !DILocation(line: 427, column: 15, scope: !946)
!977 = !DILocation(line: 429, column: 9, scope: !978)
!978 = distinct !DILexicalBlock(scope: !946, file: !7, line: 429, column: 9)
!979 = !DILocation(line: 429, column: 12, scope: !978)
!980 = !DILocation(line: 429, column: 22, scope: !978)
!981 = !DILocation(line: 429, column: 29, scope: !978)
!982 = !DILocation(line: 429, column: 19, scope: !978)
!983 = !DILocation(line: 429, column: 9, scope: !946)
!984 = !DILocation(line: 430, column: 23, scope: !978)
!985 = !DILocation(line: 430, column: 9, scope: !978)
!986 = !DILocation(line: 430, column: 16, scope: !978)
!987 = !DILocation(line: 430, column: 21, scope: !978)
!988 = !DILocation(line: 431, column: 14, scope: !989)
!989 = distinct !DILexicalBlock(scope: !978, file: !7, line: 431, column: 14)
!990 = !DILocation(line: 431, column: 19, scope: !989)
!991 = !DILocation(line: 431, column: 22, scope: !989)
!992 = !DILocation(line: 431, column: 30, scope: !989)
!993 = !DILocation(line: 431, column: 16, scope: !989)
!994 = !DILocation(line: 431, column: 14, scope: !978)
!995 = !DILocation(line: 432, column: 28, scope: !989)
!996 = !DILocation(line: 432, column: 9, scope: !989)
!997 = !DILocation(line: 432, column: 12, scope: !989)
!998 = !DILocation(line: 432, column: 20, scope: !989)
!999 = !DILocation(line: 432, column: 26, scope: !989)
!1000 = !DILocation(line: 434, column: 27, scope: !989)
!1001 = !DILocation(line: 434, column: 9, scope: !989)
!1002 = !DILocation(line: 434, column: 12, scope: !989)
!1003 = !DILocation(line: 434, column: 20, scope: !989)
!1004 = !DILocation(line: 434, column: 25, scope: !989)
!1005 = !DILocation(line: 436, column: 17, scope: !946)
!1006 = !DILocation(line: 436, column: 5, scope: !946)
!1007 = !DILocation(line: 436, column: 8, scope: !946)
!1008 = !DILocation(line: 436, column: 15, scope: !946)
!1009 = !DILocation(line: 437, column: 17, scope: !946)
!1010 = !DILocation(line: 437, column: 5, scope: !946)
!1011 = !DILocation(line: 437, column: 8, scope: !946)
!1012 = !DILocation(line: 437, column: 15, scope: !946)
!1013 = !DILocation(line: 438, column: 1, scope: !946)
!1014 = distinct !DISubprogram(name: "balanced", scope: !7, file: !7, line: 538, type: !1015, scopeLine: 538, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!1015 = !DISubroutineType(types: !1016)
!1016 = !{!24, !179}
!1017 = !DILocalVariable(name: "t", arg: 1, scope: !1014, file: !7, line: 538, type: !179)
!1018 = !DILocation(line: 538, column: 25, scope: !1014)
!1019 = !DILocation(line: 539, column: 23, scope: !1014)
!1020 = !DILocation(line: 539, column: 26, scope: !1014)
!1021 = !DILocation(line: 539, column: 29, scope: !1014)
!1022 = !DILocation(line: 539, column: 35, scope: !1014)
!1023 = !DILocation(line: 539, column: 16, scope: !1014)
!1024 = !DILocation(line: 539, column: 50, scope: !1014)
!1025 = !DILocation(line: 539, column: 53, scope: !1014)
!1026 = !DILocation(line: 539, column: 56, scope: !1014)
!1027 = !DILocation(line: 539, column: 62, scope: !1014)
!1028 = !DILocation(line: 539, column: 43, scope: !1014)
!1029 = !DILocation(line: 539, column: 41, scope: !1014)
!1030 = !DILocation(line: 539, column: 12, scope: !1014)
!1031 = !DILocation(line: 539, column: 70, scope: !1014)
!1032 = !DILocation(line: 539, column: 5, scope: !1014)
!1033 = distinct !DISubprogram(name: "height", scope: !7, file: !7, line: 527, type: !1034, scopeLine: 527, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !2)
!1034 = !DISubroutineType(types: !1035)
!1035 = !{!24, !179, !184}
!1036 = !DILocalVariable(name: "t", arg: 1, scope: !1033, file: !7, line: 527, type: !179)
!1037 = !DILocation(line: 527, column: 30, scope: !1033)
!1038 = !DILocalVariable(name: "node", arg: 2, scope: !1033, file: !7, line: 527, type: !184)
!1039 = !DILocation(line: 527, column: 41, scope: !1033)
!1040 = !DILocation(line: 529, column: 9, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !1033, file: !7, line: 529, column: 9)
!1042 = !DILocation(line: 529, column: 17, scope: !1041)
!1043 = !DILocation(line: 529, column: 20, scope: !1041)
!1044 = !DILocation(line: 529, column: 14, scope: !1041)
!1045 = !DILocation(line: 529, column: 9, scope: !1033)
!1046 = !DILocation(line: 530, column: 9, scope: !1041)
!1047 = !DILocalVariable(name: "leftHeight", scope: !1033, file: !7, line: 532, type: !24)
!1048 = !DILocation(line: 532, column: 9, scope: !1033)
!1049 = !DILocation(line: 532, column: 29, scope: !1033)
!1050 = !DILocation(line: 532, column: 32, scope: !1033)
!1051 = !DILocation(line: 532, column: 38, scope: !1033)
!1052 = !DILocation(line: 532, column: 22, scope: !1033)
!1053 = !DILocalVariable(name: "rightHeight", scope: !1033, file: !7, line: 533, type: !24)
!1054 = !DILocation(line: 533, column: 9, scope: !1033)
!1055 = !DILocation(line: 533, column: 30, scope: !1033)
!1056 = !DILocation(line: 533, column: 33, scope: !1033)
!1057 = !DILocation(line: 533, column: 39, scope: !1033)
!1058 = !DILocation(line: 533, column: 23, scope: !1033)
!1059 = !DILocation(line: 535, column: 12, scope: !1033)
!1060 = !DILocation(line: 535, column: 25, scope: !1033)
!1061 = !DILocation(line: 535, column: 23, scope: !1033)
!1062 = !DILocation(line: 535, column: 5, scope: !1033)
!1063 = !DILocation(line: 536, column: 1, scope: !1033)
!1064 = distinct !DISubprogram(name: "sorted", scope: !7, file: !7, line: 558, type: !1015, scopeLine: 558, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !6, retainedNodes: !2)
!1065 = !DILocalVariable(name: "t", arg: 1, scope: !1064, file: !7, line: 558, type: !179)
!1066 = !DILocation(line: 558, column: 23, scope: !1064)
!1067 = !DILocation(line: 559, column: 21, scope: !1064)
!1068 = !DILocation(line: 559, column: 24, scope: !1064)
!1069 = !DILocation(line: 559, column: 27, scope: !1064)
!1070 = !DILocation(line: 559, column: 12, scope: !1064)
!1071 = !DILocation(line: 559, column: 5, scope: !1064)
!1072 = distinct !DISubprogram(name: "isSorted", scope: !7, file: !7, line: 542, type: !1034, scopeLine: 542, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !2)
!1073 = !DILocalVariable(name: "t", arg: 1, scope: !1072, file: !7, line: 542, type: !179)
!1074 = !DILocation(line: 542, column: 32, scope: !1072)
!1075 = !DILocalVariable(name: "node", arg: 2, scope: !1072, file: !7, line: 542, type: !184)
!1076 = !DILocation(line: 542, column: 43, scope: !1072)
!1077 = !DILocation(line: 544, column: 9, scope: !1078)
!1078 = distinct !DILexicalBlock(scope: !1072, file: !7, line: 544, column: 9)
!1079 = !DILocation(line: 544, column: 17, scope: !1078)
!1080 = !DILocation(line: 544, column: 20, scope: !1078)
!1081 = !DILocation(line: 544, column: 14, scope: !1078)
!1082 = !DILocation(line: 544, column: 9, scope: !1072)
!1083 = !DILocation(line: 545, column: 9, scope: !1078)
!1084 = !DILocalVariable(name: "maxLeft", scope: !1072, file: !7, line: 547, type: !184)
!1085 = !DILocation(line: 547, column: 13, scope: !1072)
!1086 = !DILocation(line: 547, column: 32, scope: !1072)
!1087 = !DILocation(line: 547, column: 35, scope: !1072)
!1088 = !DILocation(line: 547, column: 41, scope: !1072)
!1089 = !DILocation(line: 547, column: 23, scope: !1072)
!1090 = !DILocalVariable(name: "minRight", scope: !1072, file: !7, line: 548, type: !184)
!1091 = !DILocation(line: 548, column: 13, scope: !1072)
!1092 = !DILocation(line: 548, column: 33, scope: !1072)
!1093 = !DILocation(line: 548, column: 36, scope: !1072)
!1094 = !DILocation(line: 548, column: 42, scope: !1072)
!1095 = !DILocation(line: 548, column: 24, scope: !1072)
!1096 = !DILocation(line: 550, column: 10, scope: !1097)
!1097 = distinct !DILexicalBlock(scope: !1072, file: !7, line: 550, column: 9)
!1098 = !DILocation(line: 550, column: 21, scope: !1097)
!1099 = !DILocation(line: 550, column: 24, scope: !1097)
!1100 = !DILocation(line: 550, column: 18, scope: !1097)
!1101 = !DILocation(line: 550, column: 33, scope: !1097)
!1102 = !DILocation(line: 550, column: 36, scope: !1097)
!1103 = !DILocation(line: 550, column: 42, scope: !1097)
!1104 = !DILocation(line: 550, column: 48, scope: !1097)
!1105 = !DILocation(line: 550, column: 57, scope: !1097)
!1106 = !DILocation(line: 550, column: 46, scope: !1097)
!1107 = !DILocation(line: 550, column: 62, scope: !1097)
!1108 = !DILocation(line: 551, column: 10, scope: !1097)
!1109 = !DILocation(line: 551, column: 22, scope: !1097)
!1110 = !DILocation(line: 551, column: 25, scope: !1097)
!1111 = !DILocation(line: 551, column: 19, scope: !1097)
!1112 = !DILocation(line: 551, column: 34, scope: !1097)
!1113 = !DILocation(line: 551, column: 38, scope: !1097)
!1114 = !DILocation(line: 551, column: 44, scope: !1097)
!1115 = !DILocation(line: 551, column: 50, scope: !1097)
!1116 = !DILocation(line: 551, column: 60, scope: !1097)
!1117 = !DILocation(line: 551, column: 48, scope: !1097)
!1118 = !DILocation(line: 550, column: 9, scope: !1072)
!1119 = !DILocation(line: 552, column: 9, scope: !1097)
!1120 = !DILocation(line: 554, column: 21, scope: !1072)
!1121 = !DILocation(line: 554, column: 24, scope: !1072)
!1122 = !DILocation(line: 554, column: 30, scope: !1072)
!1123 = !DILocation(line: 554, column: 12, scope: !1072)
!1124 = !DILocation(line: 554, column: 36, scope: !1072)
!1125 = !DILocation(line: 554, column: 48, scope: !1072)
!1126 = !DILocation(line: 554, column: 51, scope: !1072)
!1127 = !DILocation(line: 554, column: 57, scope: !1072)
!1128 = !DILocation(line: 554, column: 39, scope: !1072)
!1129 = !DILocation(line: 0, scope: !1072)
!1130 = !DILocation(line: 554, column: 5, scope: !1072)
!1131 = !DILocation(line: 556, column: 1, scope: !1072)
!1132 = distinct !DISubprogram(name: "tree_max", scope: !7, file: !7, line: 402, type: !434, scopeLine: 403, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !6, retainedNodes: !2)
!1133 = !DILocalVariable(name: "table", arg: 1, scope: !1132, file: !7, line: 402, type: !323)
!1134 = !DILocation(line: 402, column: 56, scope: !1132)
!1135 = !DILocalVariable(name: "n", arg: 2, scope: !1132, file: !7, line: 402, type: !184)
!1136 = !DILocation(line: 402, column: 71, scope: !1132)
!1137 = !DILocalVariable(name: "s", scope: !1132, file: !7, line: 404, type: !184)
!1138 = !DILocation(line: 404, column: 13, scope: !1132)
!1139 = !DILocation(line: 404, column: 17, scope: !1132)
!1140 = !DILocation(line: 404, column: 24, scope: !1132)
!1141 = !DILocation(line: 406, column: 5, scope: !1132)
!1142 = !DILocation(line: 406, column: 12, scope: !1132)
!1143 = !DILocation(line: 406, column: 15, scope: !1132)
!1144 = !DILocation(line: 406, column: 24, scope: !1132)
!1145 = !DILocation(line: 406, column: 21, scope: !1132)
!1146 = !DILocation(line: 407, column: 13, scope: !1132)
!1147 = !DILocation(line: 407, column: 16, scope: !1132)
!1148 = !DILocation(line: 407, column: 11, scope: !1132)
!1149 = distinct !{!1149, !1141, !1147, !403}
!1150 = !DILocation(line: 408, column: 12, scope: !1132)
!1151 = !DILocation(line: 408, column: 5, scope: !1132)
!1152 = distinct !DISubprogram(name: "memcpy", scope: !1153, file: !1153, line: 12, type: !1154, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !26, retainedNodes: !2)
!1153 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp")
!1154 = !DISubroutineType(types: !1155)
!1155 = !{!25, !25, !105, !1156}
!1156 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1157, line: 46, baseType: !151)
!1157 = !DIFile(filename: "llvm-130-install_O_D_A/lib/clang/13.0.1/include/stddef.h", directory: "/tmp")
!1158 = !DILocalVariable(name: "destaddr", arg: 1, scope: !1152, file: !1153, line: 12, type: !25)
!1159 = !DILocation(line: 12, column: 20, scope: !1152)
!1160 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !1152, file: !1153, line: 12, type: !105)
!1161 = !DILocation(line: 12, column: 42, scope: !1152)
!1162 = !DILocalVariable(name: "len", arg: 3, scope: !1152, file: !1153, line: 12, type: !1156)
!1163 = !DILocation(line: 12, column: 58, scope: !1152)
!1164 = !DILocalVariable(name: "dest", scope: !1152, file: !1153, line: 13, type: !4)
!1165 = !DILocation(line: 13, column: 9, scope: !1152)
!1166 = !DILocation(line: 13, column: 16, scope: !1152)
!1167 = !DILocalVariable(name: "src", scope: !1152, file: !1153, line: 14, type: !1168)
!1168 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1169, size: 64)
!1169 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!1170 = !DILocation(line: 14, column: 15, scope: !1152)
!1171 = !DILocation(line: 14, column: 21, scope: !1152)
!1172 = !DILocation(line: 16, column: 3, scope: !1152)
!1173 = !DILocation(line: 16, column: 13, scope: !1152)
!1174 = !DILocation(line: 16, column: 16, scope: !1152)
!1175 = !DILocation(line: 17, column: 19, scope: !1152)
!1176 = !DILocation(line: 17, column: 15, scope: !1152)
!1177 = !DILocation(line: 17, column: 10, scope: !1152)
!1178 = !DILocation(line: 17, column: 13, scope: !1152)
!1179 = distinct !{!1179, !1172, !1175, !403}
!1180 = !DILocation(line: 18, column: 10, scope: !1152)
!1181 = !DILocation(line: 18, column: 3, scope: !1152)
