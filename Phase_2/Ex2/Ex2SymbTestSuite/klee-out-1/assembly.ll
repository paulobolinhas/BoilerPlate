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
@.str.2 = private unnamed_addr constant [31 x i8] c"ccStat == CC_ERR_KEY_NOT_FOUND\00", align 1
@.str.3 = private unnamed_addr constant [11 x i8] c"get_keys.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"ccStat == CC_OK\00", align 1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @main() #0 !dbg !34 {
entry:
  %table = alloca %struct.treetable_s*, align 8
  %key1 = alloca i32, align 4
  %key2 = alloca i32, align 4
  %value1 = alloca [4 x i8], align 1
  %value2 = alloca [4 x i8], align 1
  %ccStat = alloca i32, align 4
  %valueObtained = alloca i8*, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table, metadata !37, metadata !DIExpression()), !dbg !42
  %call = call i32 @treetable_new(%struct.treetable_s** %table), !dbg !43
  call void @llvm.dbg.declare(metadata i32* %key1, metadata !44, metadata !DIExpression()), !dbg !45
  call void @llvm.dbg.declare(metadata i32* %key2, metadata !46, metadata !DIExpression()), !dbg !47
  call void @llvm.dbg.declare(metadata [4 x i8]* %value1, metadata !48, metadata !DIExpression()), !dbg !53
  %0 = bitcast [4 x i8]* %value1 to i8*, !dbg !53
  %1 = call i8* @memcpy(i8* %0, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__const.main.value1, i32 0, i32 0), i64 4), !dbg !53
  call void @llvm.dbg.declare(metadata [4 x i8]* %value2, metadata !54, metadata !DIExpression()), !dbg !55
  %2 = bitcast [4 x i8]* %value2 to i8*, !dbg !55
  %3 = call i8* @memcpy(i8* %2, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @__const.main.value2, i32 0, i32 0), i64 4), !dbg !55
  call void @llvm.dbg.declare(metadata i32* %ccStat, metadata !56, metadata !DIExpression()), !dbg !57
  call void @llvm.dbg.declare(metadata i8** %valueObtained, metadata !58, metadata !DIExpression()), !dbg !59
  %4 = bitcast i32* %key1 to i8*, !dbg !60
  call void @klee_make_symbolic(i8* %4, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !61
  %5 = bitcast i32* %key2 to i8*, !dbg !62
  call void @klee_make_symbolic(i8* %5, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !63
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !64
  %7 = bitcast i32* %key2 to i8*, !dbg !65
  %call1 = call i32 @treetable_get(%struct.treetable_s* %6, i8* %7, i8** %valueObtained), !dbg !66
  store i32 %call1, i32* %ccStat, align 4, !dbg !67
  %8 = load i32, i32* %ccStat, align 4, !dbg !68
  %cmp = icmp eq i32 %8, 6, !dbg !68
  br i1 %cmp, label %if.end, label %if.else, !dbg !71

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 24, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #7, !dbg !68
  unreachable, !dbg !68

if.end:                                           ; preds = %entry
  %9 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !72
  %10 = bitcast i32* %key1 to i8*, !dbg !73
  %arraydecay = getelementptr inbounds [4 x i8], [4 x i8]* %value1, i64 0, i64 0, !dbg !74
  %call2 = call i32 @treetable_add(%struct.treetable_s* %9, i8* %10, i8* %arraydecay), !dbg !75
  %11 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !76
  %12 = bitcast i32* %key1 to i8*, !dbg !77
  %call3 = call i32 @treetable_get(%struct.treetable_s* %11, i8* %12, i8** %valueObtained), !dbg !78
  store i32 %call3, i32* %ccStat, align 4, !dbg !79
  %13 = load i32, i32* %ccStat, align 4, !dbg !80
  %cmp4 = icmp eq i32 %13, 0, !dbg !80
  br i1 %cmp4, label %if.end7, label %if.else6, !dbg !83

if.else6:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.3, i64 0, i64 0), i32 29, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #7, !dbg !80
  unreachable, !dbg !80

if.end7:                                          ; preds = %if.end
  %14 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !84
  call void @treetable_destroy(%struct.treetable_s* %14), !dbg !85
  ret i32 0, !dbg !86
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #3

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @cmp(i8* %e1, i8* %e2) #0 !dbg !87 {
entry:
  %retval = alloca i32, align 4
  %e1.addr = alloca i8*, align 8
  %e2.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %e1, i8** %e1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %e1.addr, metadata !92, metadata !DIExpression()), !dbg !93
  store i8* %e2, i8** %e2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %e2.addr, metadata !94, metadata !DIExpression()), !dbg !95
  call void @llvm.dbg.declare(metadata i32* %i, metadata !96, metadata !DIExpression()), !dbg !97
  %0 = load i8*, i8** %e1.addr, align 8, !dbg !98
  %1 = bitcast i8* %0 to i32*, !dbg !99
  %2 = load i32, i32* %1, align 4, !dbg !100
  store i32 %2, i32* %i, align 4, !dbg !97
  call void @llvm.dbg.declare(metadata i32* %j, metadata !101, metadata !DIExpression()), !dbg !102
  %3 = load i8*, i8** %e2.addr, align 8, !dbg !103
  %4 = bitcast i8* %3 to i32*, !dbg !104
  %5 = load i32, i32* %4, align 4, !dbg !105
  store i32 %5, i32* %j, align 4, !dbg !102
  %6 = load i32, i32* %i, align 4, !dbg !106
  %7 = load i32, i32* %j, align 4, !dbg !108
  %cmp = icmp slt i32 %6, %7, !dbg !109
  br i1 %cmp, label %if.then, label %if.end, !dbg !110

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !111
  br label %return, !dbg !111

if.end:                                           ; preds = %entry
  %8 = load i32, i32* %i, align 4, !dbg !112
  %9 = load i32, i32* %j, align 4, !dbg !114
  %cmp1 = icmp eq i32 %8, %9, !dbg !115
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !116

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !117
  br label %return, !dbg !117

if.end3:                                          ; preds = %if.end
  store i32 1, i32* %retval, align 4, !dbg !118
  br label %return, !dbg !118

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !119
  ret i32 %10, !dbg !119
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @treetable_conf_init(%struct.treetable_conf_s* %conf) #0 !dbg !120 {
entry:
  %conf.addr = alloca %struct.treetable_conf_s*, align 8
  store %struct.treetable_conf_s* %conf, %struct.treetable_conf_s** %conf.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s** %conf.addr, metadata !145, metadata !DIExpression()), !dbg !146
  %0 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !147
  %mem_alloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %0, i32 0, i32 1, !dbg !148
  store i8* (i64)* @malloc, i8* (i64)** %mem_alloc, align 8, !dbg !149
  %1 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !150
  %mem_calloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %1, i32 0, i32 2, !dbg !151
  store i8* (i64, i64)* @calloc, i8* (i64, i64)** %mem_calloc, align 8, !dbg !152
  %2 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !153
  %mem_free = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %2, i32 0, i32 3, !dbg !154
  store void (i8*)* @free, void (i8*)** %mem_free, align 8, !dbg !155
  %3 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !156
  %cmp = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %3, i32 0, i32 0, !dbg !157
  store i32 (i8*, i8*)* @cmp, i32 (i8*, i8*)** %cmp, align 8, !dbg !158
  ret void, !dbg !159
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #5

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #5

; Function Attrs: nounwind
declare dso_local void @free(i8*) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_new(%struct.treetable_s** %tt) #0 !dbg !160 {
entry:
  %tt.addr = alloca %struct.treetable_s**, align 8
  %conf = alloca %struct.treetable_conf_s, align 8
  store %struct.treetable_s** %tt, %struct.treetable_s*** %tt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s*** %tt.addr, metadata !186, metadata !DIExpression()), !dbg !187
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s* %conf, metadata !188, metadata !DIExpression()), !dbg !189
  call void @treetable_conf_init(%struct.treetable_conf_s* %conf), !dbg !190
  %0 = load %struct.treetable_s**, %struct.treetable_s*** %tt.addr, align 8, !dbg !191
  %call = call i32 @treetable_new_conf(%struct.treetable_conf_s* %conf, %struct.treetable_s** %0), !dbg !192
  ret i32 %call, !dbg !193
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_new_conf(%struct.treetable_conf_s* %conf, %struct.treetable_s** %tt) #0 !dbg !194 {
entry:
  %retval = alloca i32, align 4
  %conf.addr = alloca %struct.treetable_conf_s*, align 8
  %tt.addr = alloca %struct.treetable_s**, align 8
  %table = alloca %struct.treetable_s*, align 8
  %sentinel = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_conf_s* %conf, %struct.treetable_conf_s** %conf.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s** %conf.addr, metadata !200, metadata !DIExpression()), !dbg !201
  store %struct.treetable_s** %tt, %struct.treetable_s*** %tt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s*** %tt.addr, metadata !202, metadata !DIExpression()), !dbg !203
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table, metadata !204, metadata !DIExpression()), !dbg !205
  %0 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !206
  %mem_calloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %0, i32 0, i32 2, !dbg !207
  %1 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc, align 8, !dbg !207
  %call = call i8* %1(i64 1, i64 56), !dbg !206
  %2 = bitcast i8* %call to %struct.treetable_s*, !dbg !206
  store %struct.treetable_s* %2, %struct.treetable_s** %table, align 8, !dbg !205
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !208
  %tobool = icmp ne %struct.treetable_s* %3, null, !dbg !208
  br i1 %tobool, label %if.end, label %if.then, !dbg !210

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !211
  br label %return, !dbg !211

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %sentinel, metadata !212, metadata !DIExpression()), !dbg !213
  %4 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !214
  %mem_calloc1 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %4, i32 0, i32 2, !dbg !215
  %5 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc1, align 8, !dbg !215
  %call2 = call i8* %5(i64 1, i64 48), !dbg !214
  %6 = bitcast i8* %call2 to %struct.rbnode_s*, !dbg !214
  store %struct.rbnode_s* %6, %struct.rbnode_s** %sentinel, align 8, !dbg !213
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !216
  %tobool3 = icmp ne %struct.rbnode_s* %7, null, !dbg !216
  br i1 %tobool3, label %if.end5, label %if.then4, !dbg !218

if.then4:                                         ; preds = %if.end
  %8 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !219
  %mem_free = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %8, i32 0, i32 3, !dbg !221
  %9 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !221
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !222
  %11 = bitcast %struct.treetable_s* %10 to i8*, !dbg !222
  call void %9(i8* %11), !dbg !219
  store i32 1, i32* %retval, align 4, !dbg !223
  br label %return, !dbg !223

if.end5:                                          ; preds = %if.end
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !224
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 2, !dbg !225
  store i8 1, i8* %color, align 8, !dbg !226
  %13 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !227
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %13, i32 0, i32 2, !dbg !228
  store i64 0, i64* %size, align 8, !dbg !229
  %14 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !230
  %cmp = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %14, i32 0, i32 0, !dbg !231
  %15 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp, align 8, !dbg !231
  %16 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !232
  %cmp6 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %16, i32 0, i32 3, !dbg !233
  store i32 (i8*, i8*)* %15, i32 (i8*, i8*)** %cmp6, align 8, !dbg !234
  %17 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !235
  %mem_alloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %17, i32 0, i32 1, !dbg !236
  %18 = load i8* (i64)*, i8* (i64)** %mem_alloc, align 8, !dbg !236
  %19 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !237
  %mem_alloc7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %19, i32 0, i32 4, !dbg !238
  store i8* (i64)* %18, i8* (i64)** %mem_alloc7, align 8, !dbg !239
  %20 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !240
  %mem_calloc8 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %20, i32 0, i32 2, !dbg !241
  %21 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc8, align 8, !dbg !241
  %22 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !242
  %mem_calloc9 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %22, i32 0, i32 5, !dbg !243
  store i8* (i64, i64)* %21, i8* (i64, i64)** %mem_calloc9, align 8, !dbg !244
  %23 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !245
  %mem_free10 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %23, i32 0, i32 3, !dbg !246
  %24 = load void (i8*)*, void (i8*)** %mem_free10, align 8, !dbg !246
  %25 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !247
  %mem_free11 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %25, i32 0, i32 6, !dbg !248
  store void (i8*)* %24, void (i8*)** %mem_free11, align 8, !dbg !249
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !250
  %27 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !251
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %27, i32 0, i32 0, !dbg !252
  store %struct.rbnode_s* %26, %struct.rbnode_s** %root, align 8, !dbg !253
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !254
  %29 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !255
  %sentinel12 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %29, i32 0, i32 1, !dbg !256
  store %struct.rbnode_s* %28, %struct.rbnode_s** %sentinel12, align 8, !dbg !257
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !258
  %31 = load %struct.treetable_s**, %struct.treetable_s*** %tt.addr, align 8, !dbg !259
  store %struct.treetable_s* %30, %struct.treetable_s** %31, align 8, !dbg !260
  store i32 0, i32* %retval, align 4, !dbg !261
  br label %return, !dbg !261

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %32 = load i32, i32* %retval, align 4, !dbg !262
  ret i32 %32, !dbg !262
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @treetable_destroy(%struct.treetable_s* %table) #0 !dbg !263 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !266, metadata !DIExpression()), !dbg !267
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !268
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !269
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !270
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !270
  call void @tree_destroy(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !271
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !272
  %mem_free = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %3, i32 0, i32 6, !dbg !273
  %4 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !273
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !274
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !275
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !275
  %7 = bitcast %struct.rbnode_s* %6 to i8*, !dbg !274
  call void %4(i8* %7), !dbg !272
  %8 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !276
  %mem_free1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %8, i32 0, i32 6, !dbg !277
  %9 = load void (i8*)*, void (i8*)** %mem_free1, align 8, !dbg !277
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !278
  %11 = bitcast %struct.treetable_s* %10 to i8*, !dbg !278
  call void %9(i8* %11), !dbg !276
  ret void, !dbg !279
}

; Function Attrs: noinline nounwind uwtable
define internal void @tree_destroy(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !280 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !283, metadata !DIExpression()), !dbg !284
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !285, metadata !DIExpression()), !dbg !286
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !287
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !289
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !290
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !290
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !291
  br i1 %cmp, label %return, label %if.end, !dbg !292

if.end:                                           ; preds = %entry
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !293
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !294
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !295
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !295
  call void @tree_destroy(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !296
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !297
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !298
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !299
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !299
  call void @tree_destroy(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !300
  %9 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !301
  %mem_free = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %9, i32 0, i32 6, !dbg !302
  %10 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !302
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !303
  %12 = bitcast %struct.rbnode_s* %11 to i8*, !dbg !303
  call void %10(i8* %12), !dbg !301
  br label %return, !dbg !304

return:                                           ; preds = %entry, %if.end
  ret void, !dbg !304
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get(%struct.treetable_s* %table, i8* %key, i8** %out) #0 !dbg !305 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %out.addr = alloca i8**, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !312, metadata !DIExpression()), !dbg !313
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !314, metadata !DIExpression()), !dbg !315
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !316, metadata !DIExpression()), !dbg !317
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !318, metadata !DIExpression()), !dbg !319
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !320
  %1 = load i8*, i8** %key.addr, align 8, !dbg !321
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !322
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !319
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !323
  %tobool = icmp ne %struct.rbnode_s* %2, null, !dbg !323
  br i1 %tobool, label %if.end, label %if.then, !dbg !325

if.then:                                          ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !326
  br label %return, !dbg !326

if.end:                                           ; preds = %entry
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !327
  %value = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %3, i32 0, i32 1, !dbg !328
  %4 = load i8*, i8** %value, align 8, !dbg !328
  %5 = load i8**, i8*** %out.addr, align 8, !dbg !329
  store i8* %4, i8** %5, align 8, !dbg !330
  store i32 0, i32* %retval, align 4, !dbg !331
  br label %return, !dbg !331

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !332
  ret i32 %6, !dbg !332
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %table, i8* %key) #0 !dbg !333 {
entry:
  %retval = alloca %struct.rbnode_s*, align 8
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %n = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  %cmp1 = alloca i32, align 4
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !336, metadata !DIExpression()), !dbg !337
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !338, metadata !DIExpression()), !dbg !339
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !340
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 2, !dbg !342
  %1 = load i64, i64* %size, align 8, !dbg !342
  %cmp = icmp eq i64 %1, 0, !dbg !343
  br i1 %cmp, label %if.then, label %if.end, !dbg !344

if.then:                                          ; preds = %entry
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !345
  br label %return, !dbg !345

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !346, metadata !DIExpression()), !dbg !347
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !348
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %2, i32 0, i32 0, !dbg !349
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !349
  store %struct.rbnode_s* %3, %struct.rbnode_s** %n, align 8, !dbg !347
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !350, metadata !DIExpression()), !dbg !351
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !352
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !353
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !353
  store %struct.rbnode_s* %5, %struct.rbnode_s** %s, align 8, !dbg !351
  call void @llvm.dbg.declare(metadata i32* %cmp1, metadata !354, metadata !DIExpression()), !dbg !355
  br label %do.body, !dbg !356

do.body:                                          ; preds = %do.cond, %if.end
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !357
  %cmp2 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %6, i32 0, i32 3, !dbg !359
  %7 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp2, align 8, !dbg !359
  %8 = load i8*, i8** %key.addr, align 8, !dbg !360
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !361
  %key3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 0, !dbg !362
  %10 = load i8*, i8** %key3, align 8, !dbg !362
  %call = call i32 %7(i8* %8, i8* %10), !dbg !357
  store i32 %call, i32* %cmp1, align 4, !dbg !363
  %11 = load i32, i32* %cmp1, align 4, !dbg !364
  %cmp4 = icmp slt i32 %11, 0, !dbg !366
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !367

if.then5:                                         ; preds = %do.body
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !368
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 4, !dbg !369
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !369
  store %struct.rbnode_s* %13, %struct.rbnode_s** %n, align 8, !dbg !370
  br label %do.cond, !dbg !371

if.else:                                          ; preds = %do.body
  %14 = load i32, i32* %cmp1, align 4, !dbg !372
  %cmp6 = icmp sgt i32 %14, 0, !dbg !374
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !375

if.then7:                                         ; preds = %if.else
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !376
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 5, !dbg !377
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !377
  store %struct.rbnode_s* %16, %struct.rbnode_s** %n, align 8, !dbg !378
  br label %do.cond

if.else8:                                         ; preds = %if.else
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !379
  store %struct.rbnode_s* %17, %struct.rbnode_s** %retval, align 8, !dbg !380
  br label %return, !dbg !380

do.cond:                                          ; preds = %if.then5, %if.then7
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !381
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !382
  %cmp11 = icmp ne %struct.rbnode_s* %18, %19, !dbg !383
  %20 = load i32, i32* %cmp1, align 4, !dbg !384
  %cmp12 = icmp ne i32 %20, 0, !dbg !384
  %21 = select i1 %cmp11, i1 %cmp12, i1 false, !dbg !384
  br i1 %21, label %do.body, label %do.end, !dbg !385, !llvm.loop !386

do.end:                                           ; preds = %do.cond
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !389
  br label %return, !dbg !389

return:                                           ; preds = %do.end, %if.else8, %if.then
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %retval, align 8, !dbg !390
  ret %struct.rbnode_s* %22, !dbg !390
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get_first_key(%struct.treetable_s* %table, i8** %out) #0 !dbg !391 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %out.addr = alloca i8**, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !394, metadata !DIExpression()), !dbg !395
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !396, metadata !DIExpression()), !dbg !397
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !398, metadata !DIExpression()), !dbg !399
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !400
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !401
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !402
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !402
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !403
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !399
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !404
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !406
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !407
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !407
  %cmp = icmp ne %struct.rbnode_s* %3, %5, !dbg !408
  br i1 %cmp, label %if.then, label %if.end, !dbg !409

if.then:                                          ; preds = %entry
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !410
  %key = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 0, !dbg !412
  %7 = load i8*, i8** %key, align 8, !dbg !412
  %8 = load i8**, i8*** %out.addr, align 8, !dbg !413
  store i8* %7, i8** %8, align 8, !dbg !414
  store i32 0, i32* %retval, align 4, !dbg !415
  br label %return, !dbg !415

if.end:                                           ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !416
  br label %return, !dbg !416

return:                                           ; preds = %if.end, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !417
  ret i32 %9, !dbg !417
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @tree_min(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !418 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !421, metadata !DIExpression()), !dbg !422
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !423, metadata !DIExpression()), !dbg !424
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !425, metadata !DIExpression()), !dbg !426
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !427
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !428
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !428
  store %struct.rbnode_s* %1, %struct.rbnode_s** %s, align 8, !dbg !426
  br label %while.cond, !dbg !429

while.cond:                                       ; preds = %while.body, %entry
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !430
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !431
  %cmp = icmp ne %struct.rbnode_s* %2, %3, !dbg !432
  br i1 %cmp, label %land.rhs, label %while.end, !dbg !433

land.rhs:                                         ; preds = %while.cond
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !434
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !435
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !435
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !436
  %cmp1 = icmp ne %struct.rbnode_s* %5, %6, !dbg !437
  br i1 %cmp1, label %while.body, label %while.end, !dbg !429

while.body:                                       ; preds = %land.rhs
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !438
  %left2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 4, !dbg !439
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %left2, align 8, !dbg !439
  store %struct.rbnode_s* %8, %struct.rbnode_s** %n.addr, align 8, !dbg !440
  br label %while.cond, !dbg !429, !llvm.loop !441

while.end:                                        ; preds = %while.cond, %land.rhs
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !442
  ret %struct.rbnode_s* %9, !dbg !443
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get_greater_than(%struct.treetable_s* %table, i8* %key, i8** %out) #0 !dbg !444 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %out.addr = alloca i8**, align 8
  %n = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !445, metadata !DIExpression()), !dbg !446
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !447, metadata !DIExpression()), !dbg !448
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !449, metadata !DIExpression()), !dbg !450
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !451, metadata !DIExpression()), !dbg !452
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !453
  %1 = load i8*, i8** %key.addr, align 8, !dbg !454
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !455
  store %struct.rbnode_s* %call, %struct.rbnode_s** %n, align 8, !dbg !452
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !456, metadata !DIExpression()), !dbg !457
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !458
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !459
  %call1 = call %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %2, %struct.rbnode_s* %3), !dbg !460
  store %struct.rbnode_s* %call1, %struct.rbnode_s** %s, align 8, !dbg !457
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !461
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !463
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !464
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !464
  %cmp = icmp ne %struct.rbnode_s* %4, %6, !dbg !465
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8
  %tobool = icmp ne %struct.rbnode_s* %7, null
  %or.cond = select i1 %cmp, i1 %tobool, i1 false, !dbg !466
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8
  %tobool3 = icmp ne %struct.rbnode_s* %8, null
  %or.cond1 = select i1 %or.cond, i1 %tobool3, i1 false, !dbg !466
  br i1 %or.cond1, label %if.then, label %if.end, !dbg !466

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !467
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 0, !dbg !469
  %10 = load i8*, i8** %key4, align 8, !dbg !469
  %11 = load i8**, i8*** %out.addr, align 8, !dbg !470
  store i8* %10, i8** %11, align 8, !dbg !471
  store i32 0, i32* %retval, align 4, !dbg !472
  br label %return, !dbg !472

if.end:                                           ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !473
  br label %return, !dbg !473

return:                                           ; preds = %if.end, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !474
  ret i32 %12, !dbg !474
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !475 {
entry:
  %retval = alloca %struct.rbnode_s*, align 8
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !476, metadata !DIExpression()), !dbg !477
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !478, metadata !DIExpression()), !dbg !479
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !480
  %cmp = icmp eq %struct.rbnode_s* %0, null, !dbg !482
  br i1 %cmp, label %if.then, label %if.end, !dbg !483

if.then:                                          ; preds = %entry
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !484
  br label %return, !dbg !484

if.end:                                           ; preds = %entry
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !485
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %1, i32 0, i32 5, !dbg !487
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !487
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !488
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %3, i32 0, i32 1, !dbg !489
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !489
  %cmp1 = icmp ne %struct.rbnode_s* %2, %4, !dbg !490
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !491

if.then2:                                         ; preds = %if.end
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !492
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !493
  %right3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 5, !dbg !494
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %right3, align 8, !dbg !494
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %5, %struct.rbnode_s* %7), !dbg !495
  store %struct.rbnode_s* %call, %struct.rbnode_s** %retval, align 8, !dbg !496
  br label %return, !dbg !496

if.end4:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !497, metadata !DIExpression()), !dbg !498
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !499
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %8, i32 0, i32 3, !dbg !500
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %parent, align 8, !dbg !500
  store %struct.rbnode_s* %9, %struct.rbnode_s** %y, align 8, !dbg !498
  br label %while.cond, !dbg !501

while.cond:                                       ; preds = %while.body, %if.end4
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !502
  %11 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !503
  %sentinel5 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %11, i32 0, i32 1, !dbg !504
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel5, align 8, !dbg !504
  %cmp6 = icmp ne %struct.rbnode_s* %10, %12, !dbg !505
  br i1 %cmp6, label %land.rhs, label %while.end, !dbg !506

land.rhs:                                         ; preds = %while.cond
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !507
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !508
  %right7 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 5, !dbg !509
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %right7, align 8, !dbg !509
  %cmp8 = icmp eq %struct.rbnode_s* %13, %15, !dbg !510
  br i1 %cmp8, label %while.body, label %while.end, !dbg !501

while.body:                                       ; preds = %land.rhs
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !511
  store %struct.rbnode_s* %16, %struct.rbnode_s** %x.addr, align 8, !dbg !513
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !514
  %parent9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 3, !dbg !515
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %parent9, align 8, !dbg !515
  store %struct.rbnode_s* %18, %struct.rbnode_s** %y, align 8, !dbg !516
  br label %while.cond, !dbg !501, !llvm.loop !517

while.end:                                        ; preds = %while.cond, %land.rhs
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !519
  store %struct.rbnode_s* %19, %struct.rbnode_s** %retval, align 8, !dbg !520
  br label %return, !dbg !520

return:                                           ; preds = %while.end, %if.then2, %if.then
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %retval, align 8, !dbg !521
  ret %struct.rbnode_s* %20, !dbg !521
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @treetable_size(%struct.treetable_s* %table) #0 !dbg !522 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !525, metadata !DIExpression()), !dbg !526
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !527
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 2, !dbg !528
  %1 = load i64, i64* %size, align 8, !dbg !528
  ret i64 %1, !dbg !529
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @treetable_contains_key(%struct.treetable_s* %table, i8* %key) #0 !dbg !530 {
entry:
  %retval = alloca i1, align 1
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !534, metadata !DIExpression()), !dbg !535
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !536, metadata !DIExpression()), !dbg !537
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !538, metadata !DIExpression()), !dbg !539
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !540
  %1 = load i8*, i8** %key.addr, align 8, !dbg !541
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !542
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !539
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !543
  %tobool = icmp ne %struct.rbnode_s* %2, null, !dbg !543
  br i1 %tobool, label %if.then, label %if.end, !dbg !545

if.then:                                          ; preds = %entry
  store i1 true, i1* %retval, align 1, !dbg !546
  br label %return, !dbg !546

if.end:                                           ; preds = %entry
  store i1 false, i1* %retval, align 1, !dbg !547
  br label %return, !dbg !547

return:                                           ; preds = %if.end, %if.then
  %3 = load i1, i1* %retval, align 1, !dbg !548
  ret i1 %3, !dbg !548
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @treetable_contains_value(%struct.treetable_s* %table, i8* %value) #0 !dbg !549 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %value.addr = alloca i8*, align 8
  %node = alloca %struct.rbnode_s*, align 8
  %o = alloca i64, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !552, metadata !DIExpression()), !dbg !553
  store i8* %value, i8** %value.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %value.addr, metadata !554, metadata !DIExpression()), !dbg !555
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !556, metadata !DIExpression()), !dbg !557
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !558
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !559
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !560
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !560
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !561
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !557
  call void @llvm.dbg.declare(metadata i64* %o, metadata !562, metadata !DIExpression()), !dbg !563
  store i64 0, i64* %o, align 8, !dbg !563
  br label %while.cond, !dbg !564

while.cond:                                       ; preds = %if.end, %entry
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !565
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !566
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !567
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !567
  %cmp = icmp ne %struct.rbnode_s* %3, %5, !dbg !568
  br i1 %cmp, label %while.body, label %while.end, !dbg !564

while.body:                                       ; preds = %while.cond
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !569
  %value1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 1, !dbg !572
  %7 = load i8*, i8** %value1, align 8, !dbg !572
  %8 = load i8*, i8** %value.addr, align 8, !dbg !573
  %cmp2 = icmp eq i8* %7, %8, !dbg !574
  br i1 %cmp2, label %if.then, label %if.end, !dbg !575

if.then:                                          ; preds = %while.body
  %9 = load i64, i64* %o, align 8, !dbg !576
  %inc = add i64 %9, 1, !dbg !576
  store i64 %inc, i64* %o, align 8, !dbg !576
  br label %if.end, !dbg !577

if.end:                                           ; preds = %if.then, %while.body
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !578
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !579
  %call3 = call %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %10, %struct.rbnode_s* %11), !dbg !580
  store %struct.rbnode_s* %call3, %struct.rbnode_s** %node, align 8, !dbg !581
  br label %while.cond, !dbg !564, !llvm.loop !582

while.end:                                        ; preds = %while.cond
  %12 = load i64, i64* %o, align 8, !dbg !584
  ret i64 %12, !dbg !585
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_add(%struct.treetable_s* %table, i8* %key, i8* %val) #0 !dbg !586 {
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
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !589, metadata !DIExpression()), !dbg !590
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !591, metadata !DIExpression()), !dbg !592
  store i8* %val, i8** %val.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %val.addr, metadata !593, metadata !DIExpression()), !dbg !594
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !595, metadata !DIExpression()), !dbg !596
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !597
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !598
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !598
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !596
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x, metadata !599, metadata !DIExpression()), !dbg !600
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !601
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %2, i32 0, i32 0, !dbg !602
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !602
  store %struct.rbnode_s* %3, %struct.rbnode_s** %x, align 8, !dbg !600
  call void @llvm.dbg.declare(metadata i32* %cmp, metadata !603, metadata !DIExpression()), !dbg !604
  br label %while.cond, !dbg !605

while.cond:                                       ; preds = %if.end9, %entry
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !606
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !607
  %sentinel1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !608
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel1, align 8, !dbg !608
  %cmp2 = icmp ne %struct.rbnode_s* %4, %6, !dbg !609
  br i1 %cmp2, label %while.body, label %while.end, !dbg !605

while.body:                                       ; preds = %while.cond
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !610
  %cmp3 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 3, !dbg !612
  %8 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp3, align 8, !dbg !612
  %9 = load i8*, i8** %key.addr, align 8, !dbg !613
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !614
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 0, !dbg !615
  %11 = load i8*, i8** %key4, align 8, !dbg !615
  %call = call i32 %8(i8* %9, i8* %11), !dbg !610
  store i32 %call, i32* %cmp, align 4, !dbg !616
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !617
  store %struct.rbnode_s* %12, %struct.rbnode_s** %y, align 8, !dbg !618
  %13 = load i32, i32* %cmp, align 4, !dbg !619
  %cmp5 = icmp slt i32 %13, 0, !dbg !621
  br i1 %cmp5, label %if.then, label %if.else, !dbg !622

if.then:                                          ; preds = %while.body
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !623
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 4, !dbg !625
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !625
  store %struct.rbnode_s* %15, %struct.rbnode_s** %x, align 8, !dbg !626
  br label %if.end9, !dbg !627

if.else:                                          ; preds = %while.body
  %16 = load i32, i32* %cmp, align 4, !dbg !628
  %cmp6 = icmp sgt i32 %16, 0, !dbg !630
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !631

if.then7:                                         ; preds = %if.else
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !632
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 5, !dbg !634
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !634
  store %struct.rbnode_s* %18, %struct.rbnode_s** %x, align 8, !dbg !635
  br label %if.end9

if.else8:                                         ; preds = %if.else
  %19 = load i8*, i8** %val.addr, align 8, !dbg !636
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !638
  %value = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %20, i32 0, i32 1, !dbg !639
  store i8* %19, i8** %value, align 8, !dbg !640
  store i32 0, i32* %retval, align 4, !dbg !641
  br label %return, !dbg !641

if.end9:                                          ; preds = %if.then7, %if.then
  br label %while.cond, !dbg !605, !llvm.loop !642

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !644, metadata !DIExpression()), !dbg !645
  %21 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !646
  %mem_alloc = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %21, i32 0, i32 4, !dbg !647
  %22 = load i8* (i64)*, i8* (i64)** %mem_alloc, align 8, !dbg !647
  %call10 = call i8* %22(i64 48), !dbg !646
  %23 = bitcast i8* %call10 to %struct.rbnode_s*, !dbg !646
  store %struct.rbnode_s* %23, %struct.rbnode_s** %n, align 8, !dbg !645
  %24 = load i8*, i8** %val.addr, align 8, !dbg !648
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !649
  %value11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %25, i32 0, i32 1, !dbg !650
  store i8* %24, i8** %value11, align 8, !dbg !651
  %26 = load i8*, i8** %key.addr, align 8, !dbg !652
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !653
  %key12 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 0, !dbg !654
  store i8* %26, i8** %key12, align 8, !dbg !655
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !656
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !657
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !658
  store %struct.rbnode_s* %28, %struct.rbnode_s** %parent, align 8, !dbg !659
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !660
  %sentinel13 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %30, i32 0, i32 1, !dbg !661
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel13, align 8, !dbg !661
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !662
  %left14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 4, !dbg !663
  store %struct.rbnode_s* %31, %struct.rbnode_s** %left14, align 8, !dbg !664
  %33 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !665
  %sentinel15 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %33, i32 0, i32 1, !dbg !666
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel15, align 8, !dbg !666
  %35 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !667
  %right16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %35, i32 0, i32 5, !dbg !668
  store %struct.rbnode_s* %34, %struct.rbnode_s** %right16, align 8, !dbg !669
  %36 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !670
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %36, i32 0, i32 2, !dbg !671
  %37 = load i64, i64* %size, align 8, !dbg !672
  %inc = add i64 %37, 1, !dbg !672
  store i64 %inc, i64* %size, align 8, !dbg !672
  %38 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !673
  %39 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !675
  %sentinel17 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %39, i32 0, i32 1, !dbg !676
  %40 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel17, align 8, !dbg !676
  %cmp18 = icmp eq %struct.rbnode_s* %38, %40, !dbg !677
  br i1 %cmp18, label %if.then19, label %if.else21, !dbg !678

if.then19:                                        ; preds = %while.end
  %41 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !679
  %42 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !681
  %root20 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %42, i32 0, i32 0, !dbg !682
  store %struct.rbnode_s* %41, %struct.rbnode_s** %root20, align 8, !dbg !683
  %43 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !684
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %43, i32 0, i32 2, !dbg !685
  store i8 1, i8* %color, align 8, !dbg !686
  br label %if.end32, !dbg !687

if.else21:                                        ; preds = %while.end
  %44 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !688
  %color22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %44, i32 0, i32 2, !dbg !690
  store i8 0, i8* %color22, align 8, !dbg !691
  %45 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !692
  %cmp23 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %45, i32 0, i32 3, !dbg !694
  %46 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp23, align 8, !dbg !694
  %47 = load i8*, i8** %key.addr, align 8, !dbg !695
  %48 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !696
  %key24 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %48, i32 0, i32 0, !dbg !697
  %49 = load i8*, i8** %key24, align 8, !dbg !697
  %call25 = call i32 %46(i8* %47, i8* %49), !dbg !692
  %cmp26 = icmp slt i32 %call25, 0, !dbg !698
  br i1 %cmp26, label %if.then27, label %if.else29, !dbg !699

if.then27:                                        ; preds = %if.else21
  %50 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !700
  %51 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !702
  %left28 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %51, i32 0, i32 4, !dbg !703
  store %struct.rbnode_s* %50, %struct.rbnode_s** %left28, align 8, !dbg !704
  br label %if.end31, !dbg !705

if.else29:                                        ; preds = %if.else21
  %52 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !706
  %53 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !708
  %right30 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %53, i32 0, i32 5, !dbg !709
  store %struct.rbnode_s* %52, %struct.rbnode_s** %right30, align 8, !dbg !710
  br label %if.end31

if.end31:                                         ; preds = %if.else29, %if.then27
  %54 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !711
  %55 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !712
  call void @rebalance_after_insert(%struct.treetable_s* %54, %struct.rbnode_s* %55), !dbg !713
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then19
  store i32 0, i32* %retval, align 4, !dbg !714
  br label %return, !dbg !714

return:                                           ; preds = %if.end32, %if.else8
  %56 = load i32, i32* %retval, align 4, !dbg !715
  ret i32 %56, !dbg !715
}

; Function Attrs: noinline nounwind uwtable
define internal void @rebalance_after_insert(%struct.treetable_s* %table, %struct.rbnode_s* %z) #0 !dbg !716 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %z.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !717, metadata !DIExpression()), !dbg !718
  store %struct.rbnode_s* %z, %struct.rbnode_s** %z.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %z.addr, metadata !719, metadata !DIExpression()), !dbg !720
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !721, metadata !DIExpression()), !dbg !722
  br label %while.cond, !dbg !723

while.cond:                                       ; preds = %if.end69, %entry
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !724
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 3, !dbg !725
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %parent, align 8, !dbg !725
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %1, i32 0, i32 2, !dbg !726
  %2 = load i8, i8* %color, align 8, !dbg !726
  %conv = sext i8 %2 to i32, !dbg !724
  %cmp = icmp eq i32 %conv, 0, !dbg !727
  br i1 %cmp, label %while.body, label %while.end, !dbg !723

while.body:                                       ; preds = %while.cond
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !728
  %parent2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %3, i32 0, i32 3, !dbg !731
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %parent2, align 8, !dbg !731
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !732
  %parent3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 3, !dbg !733
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %parent3, align 8, !dbg !733
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 3, !dbg !734
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !734
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 4, !dbg !735
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !735
  %cmp5 = icmp eq %struct.rbnode_s* %4, %8, !dbg !736
  br i1 %cmp5, label %if.then, label %if.else36, !dbg !737

if.then:                                          ; preds = %while.body
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !738
  %parent7 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 3, !dbg !740
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %parent7, align 8, !dbg !740
  %parent8 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 3, !dbg !741
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %parent8, align 8, !dbg !741
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 5, !dbg !742
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !742
  store %struct.rbnode_s* %12, %struct.rbnode_s** %y, align 8, !dbg !743
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !744
  %color9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %13, i32 0, i32 2, !dbg !746
  %14 = load i8, i8* %color9, align 8, !dbg !746
  %conv10 = sext i8 %14 to i32, !dbg !744
  %cmp11 = icmp eq i32 %conv10, 0, !dbg !747
  br i1 %cmp11, label %if.then13, label %if.else, !dbg !748

if.then13:                                        ; preds = %if.then
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !749
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !751
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !751
  %color15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %16, i32 0, i32 2, !dbg !752
  store i8 1, i8* %color15, align 8, !dbg !753
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !754
  %color16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 2, !dbg !755
  store i8 1, i8* %color16, align 8, !dbg !756
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !757
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %18, i32 0, i32 3, !dbg !758
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !758
  %parent18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %19, i32 0, i32 3, !dbg !759
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %parent18, align 8, !dbg !759
  %color19 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %20, i32 0, i32 2, !dbg !760
  store i8 0, i8* %color19, align 8, !dbg !761
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !762
  %parent20 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %21, i32 0, i32 3, !dbg !763
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %parent20, align 8, !dbg !763
  %parent21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !764
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent21, align 8, !dbg !764
  store %struct.rbnode_s* %23, %struct.rbnode_s** %z.addr, align 8, !dbg !765
  br label %if.end69, !dbg !766

if.else:                                          ; preds = %if.then
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !767
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !770
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %25, i32 0, i32 3, !dbg !771
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %parent22, align 8, !dbg !771
  %right23 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 5, !dbg !772
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %right23, align 8, !dbg !772
  %cmp24 = icmp eq %struct.rbnode_s* %24, %27, !dbg !773
  br i1 %cmp24, label %if.then26, label %if.end, !dbg !774

if.then26:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !775
  %parent27 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %28, i32 0, i32 3, !dbg !777
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %parent27, align 8, !dbg !777
  store %struct.rbnode_s* %29, %struct.rbnode_s** %z.addr, align 8, !dbg !778
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !779
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !780
  call void @rotate_left(%struct.treetable_s* %30, %struct.rbnode_s* %31), !dbg !781
  br label %if.end, !dbg !782

if.end:                                           ; preds = %if.then26, %if.else
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !783
  %parent28 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 3, !dbg !784
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %parent28, align 8, !dbg !784
  %color29 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %33, i32 0, i32 2, !dbg !785
  store i8 1, i8* %color29, align 8, !dbg !786
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !787
  %parent30 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !788
  %35 = load %struct.rbnode_s*, %struct.rbnode_s** %parent30, align 8, !dbg !788
  %parent31 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %35, i32 0, i32 3, !dbg !789
  %36 = load %struct.rbnode_s*, %struct.rbnode_s** %parent31, align 8, !dbg !789
  %color32 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %36, i32 0, i32 2, !dbg !790
  store i8 0, i8* %color32, align 8, !dbg !791
  %37 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !792
  %38 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !793
  %parent33 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %38, i32 0, i32 3, !dbg !794
  %39 = load %struct.rbnode_s*, %struct.rbnode_s** %parent33, align 8, !dbg !794
  %parent34 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %39, i32 0, i32 3, !dbg !795
  %40 = load %struct.rbnode_s*, %struct.rbnode_s** %parent34, align 8, !dbg !795
  call void @rotate_right(%struct.treetable_s* %37, %struct.rbnode_s* %40), !dbg !796
  br label %if.end69

if.else36:                                        ; preds = %while.body
  %41 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !797
  %parent37 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %41, i32 0, i32 3, !dbg !799
  %42 = load %struct.rbnode_s*, %struct.rbnode_s** %parent37, align 8, !dbg !799
  %parent38 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %42, i32 0, i32 3, !dbg !800
  %43 = load %struct.rbnode_s*, %struct.rbnode_s** %parent38, align 8, !dbg !800
  %left39 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %43, i32 0, i32 4, !dbg !801
  %44 = load %struct.rbnode_s*, %struct.rbnode_s** %left39, align 8, !dbg !801
  store %struct.rbnode_s* %44, %struct.rbnode_s** %y, align 8, !dbg !802
  %45 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !803
  %color40 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %45, i32 0, i32 2, !dbg !805
  %46 = load i8, i8* %color40, align 8, !dbg !805
  %conv41 = sext i8 %46 to i32, !dbg !803
  %cmp42 = icmp eq i32 %conv41, 0, !dbg !806
  br i1 %cmp42, label %if.then44, label %if.else53, !dbg !807

if.then44:                                        ; preds = %if.else36
  %47 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !808
  %parent45 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %47, i32 0, i32 3, !dbg !810
  %48 = load %struct.rbnode_s*, %struct.rbnode_s** %parent45, align 8, !dbg !810
  %color46 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %48, i32 0, i32 2, !dbg !811
  store i8 1, i8* %color46, align 8, !dbg !812
  %49 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !813
  %color47 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %49, i32 0, i32 2, !dbg !814
  store i8 1, i8* %color47, align 8, !dbg !815
  %50 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !816
  %parent48 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %50, i32 0, i32 3, !dbg !817
  %51 = load %struct.rbnode_s*, %struct.rbnode_s** %parent48, align 8, !dbg !817
  %parent49 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %51, i32 0, i32 3, !dbg !818
  %52 = load %struct.rbnode_s*, %struct.rbnode_s** %parent49, align 8, !dbg !818
  %color50 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %52, i32 0, i32 2, !dbg !819
  store i8 0, i8* %color50, align 8, !dbg !820
  %53 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !821
  %parent51 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %53, i32 0, i32 3, !dbg !822
  %54 = load %struct.rbnode_s*, %struct.rbnode_s** %parent51, align 8, !dbg !822
  %parent52 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %54, i32 0, i32 3, !dbg !823
  %55 = load %struct.rbnode_s*, %struct.rbnode_s** %parent52, align 8, !dbg !823
  store %struct.rbnode_s* %55, %struct.rbnode_s** %z.addr, align 8, !dbg !824
  br label %if.end69, !dbg !825

if.else53:                                        ; preds = %if.else36
  %56 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !826
  %57 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !829
  %parent54 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %57, i32 0, i32 3, !dbg !830
  %58 = load %struct.rbnode_s*, %struct.rbnode_s** %parent54, align 8, !dbg !830
  %left55 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %58, i32 0, i32 4, !dbg !831
  %59 = load %struct.rbnode_s*, %struct.rbnode_s** %left55, align 8, !dbg !831
  %cmp56 = icmp eq %struct.rbnode_s* %56, %59, !dbg !832
  br i1 %cmp56, label %if.then58, label %if.end60, !dbg !833

if.then58:                                        ; preds = %if.else53
  %60 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !834
  %parent59 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %60, i32 0, i32 3, !dbg !836
  %61 = load %struct.rbnode_s*, %struct.rbnode_s** %parent59, align 8, !dbg !836
  store %struct.rbnode_s* %61, %struct.rbnode_s** %z.addr, align 8, !dbg !837
  %62 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !838
  %63 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !839
  call void @rotate_right(%struct.treetable_s* %62, %struct.rbnode_s* %63), !dbg !840
  br label %if.end60, !dbg !841

if.end60:                                         ; preds = %if.then58, %if.else53
  %64 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !842
  %parent61 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %64, i32 0, i32 3, !dbg !843
  %65 = load %struct.rbnode_s*, %struct.rbnode_s** %parent61, align 8, !dbg !843
  %color62 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %65, i32 0, i32 2, !dbg !844
  store i8 1, i8* %color62, align 8, !dbg !845
  %66 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !846
  %parent63 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %66, i32 0, i32 3, !dbg !847
  %67 = load %struct.rbnode_s*, %struct.rbnode_s** %parent63, align 8, !dbg !847
  %parent64 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %67, i32 0, i32 3, !dbg !848
  %68 = load %struct.rbnode_s*, %struct.rbnode_s** %parent64, align 8, !dbg !848
  %color65 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %68, i32 0, i32 2, !dbg !849
  store i8 0, i8* %color65, align 8, !dbg !850
  %69 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !851
  %70 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !852
  %parent66 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %70, i32 0, i32 3, !dbg !853
  %71 = load %struct.rbnode_s*, %struct.rbnode_s** %parent66, align 8, !dbg !853
  %parent67 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %71, i32 0, i32 3, !dbg !854
  %72 = load %struct.rbnode_s*, %struct.rbnode_s** %parent67, align 8, !dbg !854
  call void @rotate_left(%struct.treetable_s* %69, %struct.rbnode_s* %72), !dbg !855
  br label %if.end69

if.end69:                                         ; preds = %if.then44, %if.end60, %if.then13, %if.end
  br label %while.cond, !dbg !723, !llvm.loop !856

while.end:                                        ; preds = %while.cond
  %73 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !858
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %73, i32 0, i32 0, !dbg !859
  %74 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !859
  %color70 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %74, i32 0, i32 2, !dbg !860
  store i8 1, i8* %color70, align 8, !dbg !861
  ret void, !dbg !862
}

; Function Attrs: noinline nounwind uwtable
define internal void @rotate_left(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !863 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !864, metadata !DIExpression()), !dbg !865
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !866, metadata !DIExpression()), !dbg !867
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !868, metadata !DIExpression()), !dbg !869
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !870
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 5, !dbg !871
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !871
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !869
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !872
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 4, !dbg !873
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !873
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !874
  %right1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 5, !dbg !875
  store %struct.rbnode_s* %3, %struct.rbnode_s** %right1, align 8, !dbg !876
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !877
  %left2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 4, !dbg !879
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %left2, align 8, !dbg !879
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !880
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 1, !dbg !881
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !881
  %cmp = icmp ne %struct.rbnode_s* %6, %8, !dbg !882
  br i1 %cmp, label %if.then, label %if.end, !dbg !883

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !884
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !885
  %left3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 4, !dbg !886
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %left3, align 8, !dbg !886
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 3, !dbg !887
  store %struct.rbnode_s* %9, %struct.rbnode_s** %parent, align 8, !dbg !888
  br label %if.end, !dbg !885

if.end:                                           ; preds = %if.then, %entry
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !889
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 3, !dbg !890
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !890
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !891
  %parent5 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 3, !dbg !892
  store %struct.rbnode_s* %13, %struct.rbnode_s** %parent5, align 8, !dbg !893
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !894
  %parent6 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !896
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent6, align 8, !dbg !896
  %17 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !897
  %sentinel7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !898
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel7, align 8, !dbg !898
  %cmp8 = icmp eq %struct.rbnode_s* %16, %18, !dbg !899
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !900

if.then9:                                         ; preds = %if.end
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !901
  %20 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !902
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %20, i32 0, i32 0, !dbg !903
  store %struct.rbnode_s* %19, %struct.rbnode_s** %root, align 8, !dbg !904
  br label %if.end20, !dbg !902

if.else:                                          ; preds = %if.end
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !905
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !907
  %parent10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !908
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent10, align 8, !dbg !908
  %left11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %23, i32 0, i32 4, !dbg !909
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %left11, align 8, !dbg !909
  %cmp12 = icmp eq %struct.rbnode_s* %21, %24, !dbg !910
  br i1 %cmp12, label %if.then13, label %if.else16, !dbg !911

if.then13:                                        ; preds = %if.else
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !912
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !913
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 3, !dbg !914
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !914
  %left15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 4, !dbg !915
  store %struct.rbnode_s* %25, %struct.rbnode_s** %left15, align 8, !dbg !916
  br label %if.end20, !dbg !913

if.else16:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !917
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !918
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !919
  %30 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !919
  %right18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %30, i32 0, i32 5, !dbg !920
  store %struct.rbnode_s* %28, %struct.rbnode_s** %right18, align 8, !dbg !921
  br label %if.end20

if.end20:                                         ; preds = %if.then13, %if.else16, %if.then9
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !922
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !923
  %left21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 4, !dbg !924
  store %struct.rbnode_s* %31, %struct.rbnode_s** %left21, align 8, !dbg !925
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !926
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !927
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !928
  store %struct.rbnode_s* %33, %struct.rbnode_s** %parent22, align 8, !dbg !929
  ret void, !dbg !930
}

; Function Attrs: noinline nounwind uwtable
define internal void @rotate_right(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !931 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !932, metadata !DIExpression()), !dbg !933
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !934, metadata !DIExpression()), !dbg !935
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !936, metadata !DIExpression()), !dbg !937
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !938
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 4, !dbg !939
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !939
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !937
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !940
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 5, !dbg !941
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !941
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !942
  %left1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !943
  store %struct.rbnode_s* %3, %struct.rbnode_s** %left1, align 8, !dbg !944
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !945
  %right2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 5, !dbg !947
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %right2, align 8, !dbg !947
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !948
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 1, !dbg !949
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !949
  %cmp = icmp ne %struct.rbnode_s* %6, %8, !dbg !950
  br i1 %cmp, label %if.then, label %if.end, !dbg !951

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !952
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !953
  %right3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 5, !dbg !954
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %right3, align 8, !dbg !954
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 3, !dbg !955
  store %struct.rbnode_s* %9, %struct.rbnode_s** %parent, align 8, !dbg !956
  br label %if.end, !dbg !953

if.end:                                           ; preds = %if.then, %entry
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !957
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 3, !dbg !958
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !958
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !959
  %parent5 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 3, !dbg !960
  store %struct.rbnode_s* %13, %struct.rbnode_s** %parent5, align 8, !dbg !961
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !962
  %parent6 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !964
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent6, align 8, !dbg !964
  %17 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !965
  %sentinel7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !966
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel7, align 8, !dbg !966
  %cmp8 = icmp eq %struct.rbnode_s* %16, %18, !dbg !967
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !968

if.then9:                                         ; preds = %if.end
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !969
  %20 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !970
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %20, i32 0, i32 0, !dbg !971
  store %struct.rbnode_s* %19, %struct.rbnode_s** %root, align 8, !dbg !972
  br label %if.end20, !dbg !970

if.else:                                          ; preds = %if.end
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !973
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !975
  %parent10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !976
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent10, align 8, !dbg !976
  %right11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %23, i32 0, i32 5, !dbg !977
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %right11, align 8, !dbg !977
  %cmp12 = icmp eq %struct.rbnode_s* %21, %24, !dbg !978
  br i1 %cmp12, label %if.then13, label %if.else16, !dbg !979

if.then13:                                        ; preds = %if.else
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !980
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !981
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 3, !dbg !982
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !982
  %right15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 5, !dbg !983
  store %struct.rbnode_s* %25, %struct.rbnode_s** %right15, align 8, !dbg !984
  br label %if.end20, !dbg !981

if.else16:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !985
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !986
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !987
  %30 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !987
  %left18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %30, i32 0, i32 4, !dbg !988
  store %struct.rbnode_s* %28, %struct.rbnode_s** %left18, align 8, !dbg !989
  br label %if.end20

if.end20:                                         ; preds = %if.then13, %if.else16, %if.then9
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !990
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !991
  %right21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 5, !dbg !992
  store %struct.rbnode_s* %31, %struct.rbnode_s** %right21, align 8, !dbg !993
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !994
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !995
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !996
  store %struct.rbnode_s* %33, %struct.rbnode_s** %parent22, align 8, !dbg !997
  ret void, !dbg !998
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @balanced(%struct.treetable_s* %t) #0 !dbg !999 {
entry:
  %t.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1002, metadata !DIExpression()), !dbg !1003
  %0 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1004
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1005
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !1006
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !1006
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 4, !dbg !1007
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1007
  %call = call i32 @height(%struct.treetable_s* %0, %struct.rbnode_s* %3), !dbg !1008
  %4 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1009
  %5 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1010
  %root1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 0, !dbg !1011
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %root1, align 8, !dbg !1011
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 5, !dbg !1012
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1012
  %call2 = call i32 @height(%struct.treetable_s* %4, %struct.rbnode_s* %7), !dbg !1013
  %sub = sub nsw i32 %call, %call2, !dbg !1014
  %call3 = call i32 @abs(i32 %sub) #8, !dbg !1015
  %cmp = icmp sle i32 %call3, 1, !dbg !1016
  %conv = zext i1 %cmp to i32, !dbg !1016
  ret i32 %conv, !dbg !1017
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @height(%struct.treetable_s* %t, %struct.rbnode_s* %node) #0 !dbg !1018 {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca %struct.treetable_s*, align 8
  %node.addr = alloca %struct.rbnode_s*, align 8
  %leftHeight = alloca i32, align 4
  %rightHeight = alloca i32, align 4
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1021, metadata !DIExpression()), !dbg !1022
  store %struct.rbnode_s* %node, %struct.rbnode_s** %node.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node.addr, metadata !1023, metadata !DIExpression()), !dbg !1024
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1025
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1027
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !1028
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1028
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !1029
  br i1 %cmp, label %if.then, label %if.end, !dbg !1030

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1031
  br label %return, !dbg !1031

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %leftHeight, metadata !1032, metadata !DIExpression()), !dbg !1033
  %3 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1034
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1035
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !1036
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1036
  %call = call i32 @height(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !1037
  store i32 %call, i32* %leftHeight, align 4, !dbg !1033
  call void @llvm.dbg.declare(metadata i32* %rightHeight, metadata !1038, metadata !DIExpression()), !dbg !1039
  %6 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1040
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1041
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !1042
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1042
  %call1 = call i32 @height(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !1043
  store i32 %call1, i32* %rightHeight, align 4, !dbg !1039
  %9 = load i32, i32* %leftHeight, align 4, !dbg !1044
  %10 = load i32, i32* %rightHeight, align 4, !dbg !1045
  %cmp2 = icmp sgt i32 %9, %10, !dbg !1046
  %11 = load i32, i32* %leftHeight, align 4, !dbg !1044
  %add = add nsw i32 %11, 1, !dbg !1044
  %12 = load i32, i32* %rightHeight, align 4, !dbg !1044
  %add3 = add nsw i32 %12, 1, !dbg !1044
  %cond = select i1 %cmp2, i32 %add, i32 %add3, !dbg !1044
  store i32 %cond, i32* %retval, align 4, !dbg !1047
  br label %return, !dbg !1047

return:                                           ; preds = %if.end, %if.then
  %13 = load i32, i32* %retval, align 4, !dbg !1048
  ret i32 %13, !dbg !1048
}

; Function Attrs: nounwind readnone willreturn
declare dso_local i32 @abs(i32) #6

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @sorted(%struct.treetable_s* %t) #0 !dbg !1049 {
entry:
  %t.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1050, metadata !DIExpression()), !dbg !1051
  %0 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1052
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1053
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !1054
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !1054
  %call = call i32 @isSorted(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !1055
  ret i32 %call, !dbg !1056
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @isSorted(%struct.treetable_s* %t, %struct.rbnode_s* %node) #0 !dbg !1057 {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca %struct.treetable_s*, align 8
  %node.addr = alloca %struct.rbnode_s*, align 8
  %maxLeft = alloca %struct.rbnode_s*, align 8
  %minRight = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1058, metadata !DIExpression()), !dbg !1059
  store %struct.rbnode_s* %node, %struct.rbnode_s** %node.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node.addr, metadata !1060, metadata !DIExpression()), !dbg !1061
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1062
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1064
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !1065
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1065
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !1066
  br i1 %cmp, label %if.then, label %if.end, !dbg !1067

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !1068
  br label %return, !dbg !1068

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %maxLeft, metadata !1069, metadata !DIExpression()), !dbg !1070
  %3 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1071
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1072
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !1073
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1073
  %call = call %struct.rbnode_s* @tree_max(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !1074
  store %struct.rbnode_s* %call, %struct.rbnode_s** %maxLeft, align 8, !dbg !1070
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %minRight, metadata !1075, metadata !DIExpression()), !dbg !1076
  %6 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1077
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1078
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !1079
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1079
  %call1 = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !1080
  store %struct.rbnode_s* %call1, %struct.rbnode_s** %minRight, align 8, !dbg !1076
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %maxLeft, align 8, !dbg !1081
  %10 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1083
  %sentinel2 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %10, i32 0, i32 1, !dbg !1084
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel2, align 8, !dbg !1084
  %cmp3 = icmp ne %struct.rbnode_s* %9, %11, !dbg !1085
  br i1 %cmp3, label %land.lhs.true, label %lor.lhs.false, !dbg !1086

land.lhs.true:                                    ; preds = %if.end
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1087
  %key = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 0, !dbg !1088
  %13 = load i8*, i8** %key, align 8, !dbg !1088
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %maxLeft, align 8, !dbg !1089
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 0, !dbg !1090
  %15 = load i8*, i8** %key4, align 8, !dbg !1090
  %cmp5 = icmp ult i8* %13, %15, !dbg !1091
  br i1 %cmp5, label %if.then12, label %lor.lhs.false, !dbg !1092

lor.lhs.false:                                    ; preds = %land.lhs.true, %if.end
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %minRight, align 8, !dbg !1093
  %17 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1094
  %sentinel6 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !1095
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel6, align 8, !dbg !1095
  %cmp7 = icmp ne %struct.rbnode_s* %16, %18, !dbg !1096
  br i1 %cmp7, label %land.lhs.true8, label %if.end13, !dbg !1097

land.lhs.true8:                                   ; preds = %lor.lhs.false
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1098
  %key9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %19, i32 0, i32 0, !dbg !1099
  %20 = load i8*, i8** %key9, align 8, !dbg !1099
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %minRight, align 8, !dbg !1100
  %key10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %21, i32 0, i32 0, !dbg !1101
  %22 = load i8*, i8** %key10, align 8, !dbg !1101
  %cmp11 = icmp ugt i8* %20, %22, !dbg !1102
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !1103

if.then12:                                        ; preds = %land.lhs.true8, %land.lhs.true
  store i32 0, i32* %retval, align 4, !dbg !1104
  br label %return, !dbg !1104

if.end13:                                         ; preds = %land.lhs.true8, %lor.lhs.false
  %23 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1105
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1106
  %left14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %24, i32 0, i32 4, !dbg !1107
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %left14, align 8, !dbg !1107
  %call15 = call i32 @isSorted(%struct.treetable_s* %23, %struct.rbnode_s* %25), !dbg !1108
  %tobool = icmp ne i32 %call15, 0, !dbg !1108
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !1109

land.rhs:                                         ; preds = %if.end13
  %26 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1110
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1111
  %right16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 5, !dbg !1112
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %right16, align 8, !dbg !1112
  %call17 = call i32 @isSorted(%struct.treetable_s* %26, %struct.rbnode_s* %28), !dbg !1113
  %tobool18 = icmp ne i32 %call17, 0, !dbg !1109
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end13
  %29 = phi i1 [ false, %if.end13 ], [ %tobool18, %land.rhs ], !dbg !1114
  %land.ext = zext i1 %29 to i32, !dbg !1109
  store i32 %land.ext, i32* %retval, align 4, !dbg !1115
  br label %return, !dbg !1115

return:                                           ; preds = %land.end, %if.then12, %if.then
  %30 = load i32, i32* %retval, align 4, !dbg !1116
  ret i32 %30, !dbg !1116
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @tree_max(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !1117 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !1118, metadata !DIExpression()), !dbg !1119
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !1120, metadata !DIExpression()), !dbg !1121
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !1122, metadata !DIExpression()), !dbg !1123
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !1124
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !1125
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1125
  store %struct.rbnode_s* %1, %struct.rbnode_s** %s, align 8, !dbg !1123
  br label %while.cond, !dbg !1126

while.cond:                                       ; preds = %while.body, %entry
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1127
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 5, !dbg !1128
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1128
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !1129
  %cmp = icmp ne %struct.rbnode_s* %3, %4, !dbg !1130
  br i1 %cmp, label %while.body, label %while.end, !dbg !1126

while.body:                                       ; preds = %while.cond
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1131
  %right1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 5, !dbg !1132
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %right1, align 8, !dbg !1132
  store %struct.rbnode_s* %6, %struct.rbnode_s** %n.addr, align 8, !dbg !1133
  br label %while.cond, !dbg !1126, !llvm.loop !1134

while.end:                                        ; preds = %while.cond
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1135
  ret %struct.rbnode_s* %7, !dbg !1136
}

; Function Attrs: noinline nounwind uwtable
define dso_local i8* @memcpy(i8* %destaddr, i8* %srcaddr, i64 %len) #0 !dbg !1137 {
entry:
  %destaddr.addr = alloca i8*, align 8
  %srcaddr.addr = alloca i8*, align 8
  %len.addr = alloca i64, align 8
  %dest = alloca i8*, align 8
  %src = alloca i8*, align 8
  store i8* %destaddr, i8** %destaddr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %destaddr.addr, metadata !1143, metadata !DIExpression()), !dbg !1144
  store i8* %srcaddr, i8** %srcaddr.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %srcaddr.addr, metadata !1145, metadata !DIExpression()), !dbg !1146
  store i64 %len, i64* %len.addr, align 8
  call void @llvm.dbg.declare(metadata i64* %len.addr, metadata !1147, metadata !DIExpression()), !dbg !1148
  call void @llvm.dbg.declare(metadata i8** %dest, metadata !1149, metadata !DIExpression()), !dbg !1151
  %0 = load i8*, i8** %destaddr.addr, align 8, !dbg !1152
  store i8* %0, i8** %dest, align 8, !dbg !1151
  call void @llvm.dbg.declare(metadata i8** %src, metadata !1153, metadata !DIExpression()), !dbg !1156
  %1 = load i8*, i8** %srcaddr.addr, align 8, !dbg !1157
  store i8* %1, i8** %src, align 8, !dbg !1156
  br label %while.cond, !dbg !1158

while.cond:                                       ; preds = %while.body, %entry
  %2 = load i64, i64* %len.addr, align 8, !dbg !1159
  %dec = add i64 %2, -1, !dbg !1159
  store i64 %dec, i64* %len.addr, align 8, !dbg !1159
  %cmp = icmp ugt i64 %2, 0, !dbg !1160
  br i1 %cmp, label %while.body, label %while.end, !dbg !1158

while.body:                                       ; preds = %while.cond
  %3 = load i8*, i8** %src, align 8, !dbg !1161
  %incdec.ptr = getelementptr inbounds i8, i8* %3, i32 1, !dbg !1161
  store i8* %incdec.ptr, i8** %src, align 8, !dbg !1161
  %4 = load i8, i8* %3, align 1, !dbg !1162
  %5 = load i8*, i8** %dest, align 8, !dbg !1163
  %incdec.ptr1 = getelementptr inbounds i8, i8* %5, i32 1, !dbg !1163
  store i8* %incdec.ptr1, i8** %dest, align 8, !dbg !1163
  store i8 %4, i8* %5, align 1, !dbg !1164
  br label %while.cond, !dbg !1158, !llvm.loop !1165

while.end:                                        ; preds = %while.cond
  %6 = load i8*, i8** %destaddr.addr, align 8, !dbg !1166
  ret i8* %6, !dbg !1167
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

!llvm.dbg.cu = !{!0, !16, !25}
!llvm.ident = !{!28, !28, !28}
!llvm.module.flags = !{!29, !30, !31, !32, !33}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "get_keys.c", directory: "/home/klee/klee_src/examples/trabalho2/Ex2SymbTestSuite")
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
!16 = distinct !DICompileUnit(language: DW_LANG_C99, file: !17, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !18, retainedTypes: !21, splitDebugInlining: false, nameTableKind: None)
!17 = !DIFile(filename: "treetable.c", directory: "/home/klee/klee_src/examples/trabalho2")
!18 = !{!19}
!19 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "cc_stat", file: !20, line: 29, baseType: !5, size: 32, elements: !6)
!20 = !DIFile(filename: "./common.h", directory: "/home/klee/klee_src/examples/trabalho2")
!21 = !{!22, !24}
!22 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !23, size: 64)
!23 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = distinct !DICompileUnit(language: DW_LANG_C99, file: !26, producer: "clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !27, splitDebugInlining: false, nameTableKind: None)
!26 = !DIFile(filename: "/tmp/klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp/klee_build130stp_z3/runtime/Freestanding")
!27 = !{}
!28 = !{!"clang version 13.0.1 (https://github.com/llvm/llvm-project.git 75e33f71c2dae584b13a7d1186ae0a038ba98838)"}
!29 = !{i32 7, !"Dwarf Version", i32 4}
!30 = !{i32 2, !"Debug Info Version", i32 3}
!31 = !{i32 1, !"wchar_size", i32 4}
!32 = !{i32 7, !"uwtable", i32 1}
!33 = !{i32 7, !"frame-pointer", i32 2}
!34 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !35, scopeLine: 6, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !27)
!35 = !DISubroutineType(types: !36)
!36 = !{!23}
!37 = !DILocalVariable(name: "table", scope: !34, file: !1, line: 8, type: !38)
!38 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !39, size: 64)
!39 = !DIDerivedType(tag: DW_TAG_typedef, name: "TreeTable", file: !40, line: 30, baseType: !41)
!40 = !DIFile(filename: "./../treetable.h", directory: "/home/klee/klee_src/examples/trabalho2/Ex2SymbTestSuite")
!41 = !DICompositeType(tag: DW_TAG_structure_type, name: "treetable_s", file: !40, line: 30, flags: DIFlagFwdDecl)
!42 = !DILocation(line: 8, column: 16, scope: !34)
!43 = !DILocation(line: 9, column: 5, scope: !34)
!44 = !DILocalVariable(name: "key1", scope: !34, file: !1, line: 11, type: !23)
!45 = !DILocation(line: 11, column: 9, scope: !34)
!46 = !DILocalVariable(name: "key2", scope: !34, file: !1, line: 12, type: !23)
!47 = !DILocation(line: 12, column: 9, scope: !34)
!48 = !DILocalVariable(name: "value1", scope: !34, file: !1, line: 14, type: !49)
!49 = !DICompositeType(tag: DW_TAG_array_type, baseType: !50, size: 32, elements: !51)
!50 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!51 = !{!52}
!52 = !DISubrange(count: 4)
!53 = !DILocation(line: 14, column: 10, scope: !34)
!54 = !DILocalVariable(name: "value2", scope: !34, file: !1, line: 15, type: !49)
!55 = !DILocation(line: 15, column: 10, scope: !34)
!56 = !DILocalVariable(name: "ccStat", scope: !34, file: !1, line: 17, type: !23)
!57 = !DILocation(line: 17, column: 9, scope: !34)
!58 = !DILocalVariable(name: "valueObtained", scope: !34, file: !1, line: 18, type: !24)
!59 = !DILocation(line: 18, column: 11, scope: !34)
!60 = !DILocation(line: 20, column: 24, scope: !34)
!61 = !DILocation(line: 20, column: 5, scope: !34)
!62 = !DILocation(line: 21, column: 24, scope: !34)
!63 = !DILocation(line: 21, column: 5, scope: !34)
!64 = !DILocation(line: 23, column: 28, scope: !34)
!65 = !DILocation(line: 23, column: 35, scope: !34)
!66 = !DILocation(line: 23, column: 14, scope: !34)
!67 = !DILocation(line: 23, column: 12, scope: !34)
!68 = !DILocation(line: 24, column: 5, scope: !69)
!69 = distinct !DILexicalBlock(scope: !70, file: !1, line: 24, column: 5)
!70 = distinct !DILexicalBlock(scope: !34, file: !1, line: 24, column: 5)
!71 = !DILocation(line: 24, column: 5, scope: !70)
!72 = !DILocation(line: 26, column: 19, scope: !34)
!73 = !DILocation(line: 26, column: 26, scope: !34)
!74 = !DILocation(line: 26, column: 33, scope: !34)
!75 = !DILocation(line: 26, column: 5, scope: !34)
!76 = !DILocation(line: 28, column: 28, scope: !34)
!77 = !DILocation(line: 28, column: 35, scope: !34)
!78 = !DILocation(line: 28, column: 14, scope: !34)
!79 = !DILocation(line: 28, column: 12, scope: !34)
!80 = !DILocation(line: 29, column: 5, scope: !81)
!81 = distinct !DILexicalBlock(scope: !82, file: !1, line: 29, column: 5)
!82 = distinct !DILexicalBlock(scope: !34, file: !1, line: 29, column: 5)
!83 = !DILocation(line: 29, column: 5, scope: !82)
!84 = !DILocation(line: 31, column: 23, scope: !34)
!85 = !DILocation(line: 31, column: 5, scope: !34)
!86 = !DILocation(line: 32, column: 1, scope: !34)
!87 = distinct !DISubprogram(name: "cmp", scope: !17, file: !17, line: 53, type: !88, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!88 = !DISubroutineType(types: !89)
!89 = !{!23, !90, !90}
!90 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !91, size: 64)
!91 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!92 = !DILocalVariable(name: "e1", arg: 1, scope: !87, file: !17, line: 53, type: !90)
!93 = !DILocation(line: 53, column: 21, scope: !87)
!94 = !DILocalVariable(name: "e2", arg: 2, scope: !87, file: !17, line: 53, type: !90)
!95 = !DILocation(line: 53, column: 37, scope: !87)
!96 = !DILocalVariable(name: "i", scope: !87, file: !17, line: 54, type: !23)
!97 = !DILocation(line: 54, column: 9, scope: !87)
!98 = !DILocation(line: 54, column: 22, scope: !87)
!99 = !DILocation(line: 54, column: 15, scope: !87)
!100 = !DILocation(line: 54, column: 13, scope: !87)
!101 = !DILocalVariable(name: "j", scope: !87, file: !17, line: 55, type: !23)
!102 = !DILocation(line: 55, column: 9, scope: !87)
!103 = !DILocation(line: 55, column: 22, scope: !87)
!104 = !DILocation(line: 55, column: 15, scope: !87)
!105 = !DILocation(line: 55, column: 13, scope: !87)
!106 = !DILocation(line: 57, column: 9, scope: !107)
!107 = distinct !DILexicalBlock(scope: !87, file: !17, line: 57, column: 9)
!108 = !DILocation(line: 57, column: 13, scope: !107)
!109 = !DILocation(line: 57, column: 11, scope: !107)
!110 = !DILocation(line: 57, column: 9, scope: !87)
!111 = !DILocation(line: 58, column: 9, scope: !107)
!112 = !DILocation(line: 59, column: 9, scope: !113)
!113 = distinct !DILexicalBlock(scope: !87, file: !17, line: 59, column: 9)
!114 = !DILocation(line: 59, column: 14, scope: !113)
!115 = !DILocation(line: 59, column: 11, scope: !113)
!116 = !DILocation(line: 59, column: 9, scope: !87)
!117 = !DILocation(line: 60, column: 9, scope: !113)
!118 = !DILocation(line: 61, column: 5, scope: !87)
!119 = !DILocation(line: 62, column: 1, scope: !87)
!120 = distinct !DISubprogram(name: "treetable_conf_init", scope: !17, file: !17, line: 70, type: !121, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!121 = !DISubroutineType(types: !122)
!122 = !{null, !123}
!123 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!124 = !DIDerivedType(tag: DW_TAG_typedef, name: "TreeTableConf", file: !125, line: 94, baseType: !126)
!125 = !DIFile(filename: "./treetable.h", directory: "/home/klee/klee_src/examples/trabalho2")
!126 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "treetable_conf_s", file: !125, line: 89, size: 256, elements: !127)
!127 = !{!128, !130, !137, !141}
!128 = !DIDerivedType(tag: DW_TAG_member, name: "cmp", scope: !126, file: !125, line: 90, baseType: !129, size: 64)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_member, name: "mem_alloc", scope: !126, file: !125, line: 91, baseType: !131, size: 64, offset: 64)
!131 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !132, size: 64)
!132 = !DISubroutineType(types: !133)
!133 = !{!24, !134}
!134 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !135, line: 46, baseType: !136)
!135 = !DIFile(filename: "/tmp/llvm-130-install_O_D_A/lib/clang/13.0.1/include/stddef.h", directory: "")
!136 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!137 = !DIDerivedType(tag: DW_TAG_member, name: "mem_calloc", scope: !126, file: !125, line: 92, baseType: !138, size: 64, offset: 128)
!138 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !139, size: 64)
!139 = !DISubroutineType(types: !140)
!140 = !{!24, !134, !134}
!141 = !DIDerivedType(tag: DW_TAG_member, name: "mem_free", scope: !126, file: !125, line: 93, baseType: !142, size: 64, offset: 192)
!142 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!143 = !DISubroutineType(types: !144)
!144 = !{null, !24}
!145 = !DILocalVariable(name: "conf", arg: 1, scope: !120, file: !17, line: 70, type: !123)
!146 = !DILocation(line: 70, column: 41, scope: !120)
!147 = !DILocation(line: 72, column: 5, scope: !120)
!148 = !DILocation(line: 72, column: 11, scope: !120)
!149 = !DILocation(line: 72, column: 22, scope: !120)
!150 = !DILocation(line: 73, column: 5, scope: !120)
!151 = !DILocation(line: 73, column: 11, scope: !120)
!152 = !DILocation(line: 73, column: 22, scope: !120)
!153 = !DILocation(line: 74, column: 5, scope: !120)
!154 = !DILocation(line: 74, column: 11, scope: !120)
!155 = !DILocation(line: 74, column: 22, scope: !120)
!156 = !DILocation(line: 75, column: 5, scope: !120)
!157 = !DILocation(line: 75, column: 11, scope: !120)
!158 = !DILocation(line: 75, column: 22, scope: !120)
!159 = !DILocation(line: 76, column: 1, scope: !120)
!160 = distinct !DISubprogram(name: "treetable_new", scope: !17, file: !17, line: 87, type: !161, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!161 = !DISubroutineType(types: !162)
!162 = !{!19, !163}
!163 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !164, size: 64)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !165, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_typedef, name: "TreeTable", file: !125, line: 30, baseType: !166)
!166 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "treetable_s", file: !17, line: 30, size: 448, elements: !167)
!167 = !{!168, !180, !181, !182, !183, !184, !185}
!168 = !DIDerivedType(tag: DW_TAG_member, name: "root", scope: !166, file: !17, line: 31, baseType: !169, size: 64)
!169 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !170, size: 64)
!170 = !DIDerivedType(tag: DW_TAG_typedef, name: "RBNode", file: !125, line: 61, baseType: !171)
!171 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rbnode_s", file: !125, line: 37, size: 384, elements: !172)
!172 = !{!173, !174, !175, !176, !178, !179}
!173 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !171, file: !125, line: 40, baseType: !24, size: 64)
!174 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !171, file: !125, line: 44, baseType: !24, size: 64, offset: 64)
!175 = !DIDerivedType(tag: DW_TAG_member, name: "color", scope: !171, file: !125, line: 48, baseType: !50, size: 8, offset: 128)
!176 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !171, file: !125, line: 52, baseType: !177, size: 64, offset: 192)
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !171, size: 64)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "left", scope: !171, file: !125, line: 56, baseType: !177, size: 64, offset: 256)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "right", scope: !171, file: !125, line: 60, baseType: !177, size: 64, offset: 320)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "sentinel", scope: !166, file: !17, line: 32, baseType: !169, size: 64, offset: 64)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !166, file: !17, line: 33, baseType: !134, size: 64, offset: 128)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "cmp", scope: !166, file: !17, line: 35, baseType: !129, size: 64, offset: 192)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "mem_alloc", scope: !166, file: !17, line: 36, baseType: !131, size: 64, offset: 256)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "mem_calloc", scope: !166, file: !17, line: 37, baseType: !138, size: 64, offset: 320)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "mem_free", scope: !166, file: !17, line: 38, baseType: !142, size: 64, offset: 384)
!186 = !DILocalVariable(name: "tt", arg: 1, scope: !160, file: !17, line: 87, type: !163)
!187 = !DILocation(line: 87, column: 40, scope: !160)
!188 = !DILocalVariable(name: "conf", scope: !160, file: !17, line: 89, type: !124)
!189 = !DILocation(line: 89, column: 19, scope: !160)
!190 = !DILocation(line: 90, column: 5, scope: !160)
!191 = !DILocation(line: 91, column: 38, scope: !160)
!192 = !DILocation(line: 91, column: 12, scope: !160)
!193 = !DILocation(line: 91, column: 5, scope: !160)
!194 = distinct !DISubprogram(name: "treetable_new_conf", scope: !17, file: !17, line: 107, type: !195, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!195 = !DISubroutineType(types: !196)
!196 = !{!19, !197, !163}
!197 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !198)
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64)
!199 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !124)
!200 = !DILocalVariable(name: "conf", arg: 1, scope: !194, file: !17, line: 107, type: !197)
!201 = !DILocation(line: 107, column: 61, scope: !194)
!202 = !DILocalVariable(name: "tt", arg: 2, scope: !194, file: !17, line: 107, type: !163)
!203 = !DILocation(line: 107, column: 79, scope: !194)
!204 = !DILocalVariable(name: "table", scope: !194, file: !17, line: 109, type: !164)
!205 = !DILocation(line: 109, column: 16, scope: !194)
!206 = !DILocation(line: 109, column: 24, scope: !194)
!207 = !DILocation(line: 109, column: 30, scope: !194)
!208 = !DILocation(line: 111, column: 10, scope: !209)
!209 = distinct !DILexicalBlock(scope: !194, file: !17, line: 111, column: 9)
!210 = !DILocation(line: 111, column: 9, scope: !194)
!211 = !DILocation(line: 112, column: 9, scope: !209)
!212 = !DILocalVariable(name: "sentinel", scope: !194, file: !17, line: 114, type: !169)
!213 = !DILocation(line: 114, column: 13, scope: !194)
!214 = !DILocation(line: 114, column: 24, scope: !194)
!215 = !DILocation(line: 114, column: 30, scope: !194)
!216 = !DILocation(line: 116, column: 10, scope: !217)
!217 = distinct !DILexicalBlock(scope: !194, file: !17, line: 116, column: 9)
!218 = !DILocation(line: 116, column: 9, scope: !194)
!219 = !DILocation(line: 117, column: 9, scope: !220)
!220 = distinct !DILexicalBlock(scope: !217, file: !17, line: 116, column: 20)
!221 = !DILocation(line: 117, column: 15, scope: !220)
!222 = !DILocation(line: 117, column: 24, scope: !220)
!223 = !DILocation(line: 118, column: 9, scope: !220)
!224 = !DILocation(line: 121, column: 5, scope: !194)
!225 = !DILocation(line: 121, column: 15, scope: !194)
!226 = !DILocation(line: 121, column: 23, scope: !194)
!227 = !DILocation(line: 123, column: 5, scope: !194)
!228 = !DILocation(line: 123, column: 12, scope: !194)
!229 = !DILocation(line: 123, column: 23, scope: !194)
!230 = !DILocation(line: 124, column: 25, scope: !194)
!231 = !DILocation(line: 124, column: 31, scope: !194)
!232 = !DILocation(line: 124, column: 5, scope: !194)
!233 = !DILocation(line: 124, column: 12, scope: !194)
!234 = !DILocation(line: 124, column: 23, scope: !194)
!235 = !DILocation(line: 125, column: 25, scope: !194)
!236 = !DILocation(line: 125, column: 31, scope: !194)
!237 = !DILocation(line: 125, column: 5, scope: !194)
!238 = !DILocation(line: 125, column: 12, scope: !194)
!239 = !DILocation(line: 125, column: 23, scope: !194)
!240 = !DILocation(line: 126, column: 25, scope: !194)
!241 = !DILocation(line: 126, column: 31, scope: !194)
!242 = !DILocation(line: 126, column: 5, scope: !194)
!243 = !DILocation(line: 126, column: 12, scope: !194)
!244 = !DILocation(line: 126, column: 23, scope: !194)
!245 = !DILocation(line: 127, column: 25, scope: !194)
!246 = !DILocation(line: 127, column: 31, scope: !194)
!247 = !DILocation(line: 127, column: 5, scope: !194)
!248 = !DILocation(line: 127, column: 12, scope: !194)
!249 = !DILocation(line: 127, column: 23, scope: !194)
!250 = !DILocation(line: 128, column: 25, scope: !194)
!251 = !DILocation(line: 128, column: 5, scope: !194)
!252 = !DILocation(line: 128, column: 12, scope: !194)
!253 = !DILocation(line: 128, column: 23, scope: !194)
!254 = !DILocation(line: 129, column: 25, scope: !194)
!255 = !DILocation(line: 129, column: 5, scope: !194)
!256 = !DILocation(line: 129, column: 12, scope: !194)
!257 = !DILocation(line: 129, column: 23, scope: !194)
!258 = !DILocation(line: 131, column: 11, scope: !194)
!259 = !DILocation(line: 131, column: 6, scope: !194)
!260 = !DILocation(line: 131, column: 9, scope: !194)
!261 = !DILocation(line: 132, column: 5, scope: !194)
!262 = !DILocation(line: 133, column: 1, scope: !194)
!263 = distinct !DISubprogram(name: "treetable_destroy", scope: !17, file: !17, line: 159, type: !264, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!264 = !DISubroutineType(types: !265)
!265 = !{null, !164}
!266 = !DILocalVariable(name: "table", arg: 1, scope: !263, file: !17, line: 159, type: !164)
!267 = !DILocation(line: 159, column: 35, scope: !263)
!268 = !DILocation(line: 161, column: 18, scope: !263)
!269 = !DILocation(line: 161, column: 25, scope: !263)
!270 = !DILocation(line: 161, column: 32, scope: !263)
!271 = !DILocation(line: 161, column: 5, scope: !263)
!272 = !DILocation(line: 163, column: 5, scope: !263)
!273 = !DILocation(line: 163, column: 12, scope: !263)
!274 = !DILocation(line: 163, column: 21, scope: !263)
!275 = !DILocation(line: 163, column: 28, scope: !263)
!276 = !DILocation(line: 164, column: 5, scope: !263)
!277 = !DILocation(line: 164, column: 12, scope: !263)
!278 = !DILocation(line: 164, column: 21, scope: !263)
!279 = !DILocation(line: 165, column: 1, scope: !263)
!280 = distinct !DISubprogram(name: "tree_destroy", scope: !17, file: !17, line: 141, type: !281, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !27)
!281 = !DISubroutineType(types: !282)
!282 = !{null, !164, !169}
!283 = !DILocalVariable(name: "table", arg: 1, scope: !280, file: !17, line: 141, type: !164)
!284 = !DILocation(line: 141, column: 37, scope: !280)
!285 = !DILocalVariable(name: "n", arg: 2, scope: !280, file: !17, line: 141, type: !169)
!286 = !DILocation(line: 141, column: 52, scope: !280)
!287 = !DILocation(line: 143, column: 9, scope: !288)
!288 = distinct !DILexicalBlock(scope: !280, file: !17, line: 143, column: 9)
!289 = !DILocation(line: 143, column: 14, scope: !288)
!290 = !DILocation(line: 143, column: 21, scope: !288)
!291 = !DILocation(line: 143, column: 11, scope: !288)
!292 = !DILocation(line: 143, column: 9, scope: !280)
!293 = !DILocation(line: 146, column: 18, scope: !280)
!294 = !DILocation(line: 146, column: 25, scope: !280)
!295 = !DILocation(line: 146, column: 28, scope: !280)
!296 = !DILocation(line: 146, column: 5, scope: !280)
!297 = !DILocation(line: 147, column: 18, scope: !280)
!298 = !DILocation(line: 147, column: 25, scope: !280)
!299 = !DILocation(line: 147, column: 28, scope: !280)
!300 = !DILocation(line: 147, column: 5, scope: !280)
!301 = !DILocation(line: 149, column: 5, scope: !280)
!302 = !DILocation(line: 149, column: 12, scope: !280)
!303 = !DILocation(line: 149, column: 21, scope: !280)
!304 = !DILocation(line: 150, column: 1, scope: !280)
!305 = distinct !DISubprogram(name: "treetable_get", scope: !17, file: !17, line: 177, type: !306, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!306 = !DISubroutineType(types: !307)
!307 = !{!19, !308, !90, !311}
!308 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !309)
!309 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !310, size: 64)
!310 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !165)
!311 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !24, size: 64)
!312 = !DILocalVariable(name: "table", arg: 1, scope: !305, file: !17, line: 177, type: !308)
!313 = !DILocation(line: 177, column: 52, scope: !305)
!314 = !DILocalVariable(name: "key", arg: 2, scope: !305, file: !17, line: 177, type: !90)
!315 = !DILocation(line: 177, column: 71, scope: !305)
!316 = !DILocalVariable(name: "out", arg: 3, scope: !305, file: !17, line: 177, type: !311)
!317 = !DILocation(line: 177, column: 83, scope: !305)
!318 = !DILocalVariable(name: "node", scope: !305, file: !17, line: 179, type: !169)
!319 = !DILocation(line: 179, column: 13, scope: !305)
!320 = !DILocation(line: 179, column: 41, scope: !305)
!321 = !DILocation(line: 179, column: 48, scope: !305)
!322 = !DILocation(line: 179, column: 20, scope: !305)
!323 = !DILocation(line: 181, column: 10, scope: !324)
!324 = distinct !DILexicalBlock(scope: !305, file: !17, line: 181, column: 9)
!325 = !DILocation(line: 181, column: 9, scope: !305)
!326 = !DILocation(line: 182, column: 9, scope: !324)
!327 = !DILocation(line: 184, column: 12, scope: !305)
!328 = !DILocation(line: 184, column: 18, scope: !305)
!329 = !DILocation(line: 184, column: 6, scope: !305)
!330 = !DILocation(line: 184, column: 10, scope: !305)
!331 = !DILocation(line: 185, column: 5, scope: !305)
!332 = !DILocation(line: 186, column: 1, scope: !305)
!333 = distinct !DISubprogram(name: "get_tree_node_by_key", scope: !17, file: !17, line: 477, type: !334, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !27)
!334 = !DISubroutineType(types: !335)
!335 = !{!169, !308, !90}
!336 = !DILocalVariable(name: "table", arg: 1, scope: !333, file: !17, line: 477, type: !308)
!337 = !DILocation(line: 477, column: 61, scope: !333)
!338 = !DILocalVariable(name: "key", arg: 2, scope: !333, file: !17, line: 477, type: !90)
!339 = !DILocation(line: 477, column: 80, scope: !333)
!340 = !DILocation(line: 479, column: 9, scope: !341)
!341 = distinct !DILexicalBlock(scope: !333, file: !17, line: 479, column: 9)
!342 = !DILocation(line: 479, column: 16, scope: !341)
!343 = !DILocation(line: 479, column: 21, scope: !341)
!344 = !DILocation(line: 479, column: 9, scope: !333)
!345 = !DILocation(line: 480, column: 9, scope: !341)
!346 = !DILocalVariable(name: "n", scope: !333, file: !17, line: 482, type: !169)
!347 = !DILocation(line: 482, column: 13, scope: !333)
!348 = !DILocation(line: 482, column: 17, scope: !333)
!349 = !DILocation(line: 482, column: 24, scope: !333)
!350 = !DILocalVariable(name: "s", scope: !333, file: !17, line: 483, type: !169)
!351 = !DILocation(line: 483, column: 13, scope: !333)
!352 = !DILocation(line: 483, column: 17, scope: !333)
!353 = !DILocation(line: 483, column: 24, scope: !333)
!354 = !DILocalVariable(name: "cmp", scope: !333, file: !17, line: 485, type: !23)
!355 = !DILocation(line: 485, column: 9, scope: !333)
!356 = !DILocation(line: 486, column: 5, scope: !333)
!357 = !DILocation(line: 487, column: 15, scope: !358)
!358 = distinct !DILexicalBlock(scope: !333, file: !17, line: 486, column: 8)
!359 = !DILocation(line: 487, column: 22, scope: !358)
!360 = !DILocation(line: 487, column: 26, scope: !358)
!361 = !DILocation(line: 487, column: 31, scope: !358)
!362 = !DILocation(line: 487, column: 34, scope: !358)
!363 = !DILocation(line: 487, column: 13, scope: !358)
!364 = !DILocation(line: 489, column: 13, scope: !365)
!365 = distinct !DILexicalBlock(scope: !358, file: !17, line: 489, column: 13)
!366 = !DILocation(line: 489, column: 17, scope: !365)
!367 = !DILocation(line: 489, column: 13, scope: !358)
!368 = !DILocation(line: 490, column: 17, scope: !365)
!369 = !DILocation(line: 490, column: 20, scope: !365)
!370 = !DILocation(line: 490, column: 15, scope: !365)
!371 = !DILocation(line: 490, column: 13, scope: !365)
!372 = !DILocation(line: 491, column: 18, scope: !373)
!373 = distinct !DILexicalBlock(scope: !365, file: !17, line: 491, column: 18)
!374 = !DILocation(line: 491, column: 22, scope: !373)
!375 = !DILocation(line: 491, column: 18, scope: !365)
!376 = !DILocation(line: 492, column: 17, scope: !373)
!377 = !DILocation(line: 492, column: 20, scope: !373)
!378 = !DILocation(line: 492, column: 15, scope: !373)
!379 = !DILocation(line: 494, column: 20, scope: !373)
!380 = !DILocation(line: 494, column: 13, scope: !373)
!381 = !DILocation(line: 495, column: 14, scope: !333)
!382 = !DILocation(line: 495, column: 19, scope: !333)
!383 = !DILocation(line: 495, column: 16, scope: !333)
!384 = !DILocation(line: 495, column: 21, scope: !333)
!385 = !DILocation(line: 495, column: 5, scope: !358)
!386 = distinct !{!386, !356, !387, !388}
!387 = !DILocation(line: 495, column: 32, scope: !333)
!388 = !{!"llvm.loop.mustprogress"}
!389 = !DILocation(line: 497, column: 5, scope: !333)
!390 = !DILocation(line: 498, column: 1, scope: !333)
!391 = distinct !DISubprogram(name: "treetable_get_first_key", scope: !17, file: !17, line: 198, type: !392, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!392 = !DISubroutineType(types: !393)
!393 = !{!19, !308, !311}
!394 = !DILocalVariable(name: "table", arg: 1, scope: !391, file: !17, line: 198, type: !308)
!395 = !DILocation(line: 198, column: 62, scope: !391)
!396 = !DILocalVariable(name: "out", arg: 2, scope: !391, file: !17, line: 198, type: !311)
!397 = !DILocation(line: 198, column: 76, scope: !391)
!398 = !DILocalVariable(name: "node", scope: !391, file: !17, line: 200, type: !169)
!399 = !DILocation(line: 200, column: 13, scope: !391)
!400 = !DILocation(line: 200, column: 29, scope: !391)
!401 = !DILocation(line: 200, column: 36, scope: !391)
!402 = !DILocation(line: 200, column: 43, scope: !391)
!403 = !DILocation(line: 200, column: 20, scope: !391)
!404 = !DILocation(line: 202, column: 9, scope: !405)
!405 = distinct !DILexicalBlock(scope: !391, file: !17, line: 202, column: 9)
!406 = !DILocation(line: 202, column: 17, scope: !405)
!407 = !DILocation(line: 202, column: 24, scope: !405)
!408 = !DILocation(line: 202, column: 14, scope: !405)
!409 = !DILocation(line: 202, column: 9, scope: !391)
!410 = !DILocation(line: 203, column: 16, scope: !411)
!411 = distinct !DILexicalBlock(scope: !405, file: !17, line: 202, column: 34)
!412 = !DILocation(line: 203, column: 22, scope: !411)
!413 = !DILocation(line: 203, column: 10, scope: !411)
!414 = !DILocation(line: 203, column: 14, scope: !411)
!415 = !DILocation(line: 204, column: 9, scope: !411)
!416 = !DILocation(line: 207, column: 5, scope: !391)
!417 = !DILocation(line: 208, column: 1, scope: !391)
!418 = distinct !DISubprogram(name: "tree_min", scope: !17, file: !17, line: 391, type: !419, scopeLine: 392, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !27)
!419 = !DISubroutineType(types: !420)
!420 = !{!169, !308, !169}
!421 = !DILocalVariable(name: "table", arg: 1, scope: !418, file: !17, line: 391, type: !308)
!422 = !DILocation(line: 391, column: 56, scope: !418)
!423 = !DILocalVariable(name: "n", arg: 2, scope: !418, file: !17, line: 391, type: !169)
!424 = !DILocation(line: 391, column: 71, scope: !418)
!425 = !DILocalVariable(name: "s", scope: !418, file: !17, line: 393, type: !169)
!426 = !DILocation(line: 393, column: 13, scope: !418)
!427 = !DILocation(line: 393, column: 17, scope: !418)
!428 = !DILocation(line: 393, column: 24, scope: !418)
!429 = !DILocation(line: 396, column: 9, scope: !418)
!430 = !DILocation(line: 396, column: 16, scope: !418)
!431 = !DILocation(line: 396, column: 21, scope: !418)
!432 = !DILocation(line: 396, column: 18, scope: !418)
!433 = !DILocation(line: 396, column: 23, scope: !418)
!434 = !DILocation(line: 396, column: 26, scope: !418)
!435 = !DILocation(line: 396, column: 29, scope: !418)
!436 = !DILocation(line: 396, column: 37, scope: !418)
!437 = !DILocation(line: 396, column: 34, scope: !418)
!438 = !DILocation(line: 397, column: 17, scope: !418)
!439 = !DILocation(line: 397, column: 20, scope: !418)
!440 = !DILocation(line: 397, column: 15, scope: !418)
!441 = distinct !{!441, !429, !439, !388}
!442 = !DILocation(line: 399, column: 12, scope: !418)
!443 = !DILocation(line: 399, column: 5, scope: !418)
!444 = distinct !DISubprogram(name: "treetable_get_greater_than", scope: !17, file: !17, line: 220, type: !306, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!445 = !DILocalVariable(name: "table", arg: 1, scope: !444, file: !17, line: 220, type: !308)
!446 = !DILocation(line: 220, column: 65, scope: !444)
!447 = !DILocalVariable(name: "key", arg: 2, scope: !444, file: !17, line: 220, type: !90)
!448 = !DILocation(line: 220, column: 84, scope: !444)
!449 = !DILocalVariable(name: "out", arg: 3, scope: !444, file: !17, line: 220, type: !311)
!450 = !DILocation(line: 220, column: 96, scope: !444)
!451 = !DILocalVariable(name: "n", scope: !444, file: !17, line: 222, type: !169)
!452 = !DILocation(line: 222, column: 13, scope: !444)
!453 = !DILocation(line: 222, column: 38, scope: !444)
!454 = !DILocation(line: 222, column: 45, scope: !444)
!455 = !DILocation(line: 222, column: 17, scope: !444)
!456 = !DILocalVariable(name: "s", scope: !444, file: !17, line: 223, type: !169)
!457 = !DILocation(line: 223, column: 13, scope: !444)
!458 = !DILocation(line: 223, column: 36, scope: !444)
!459 = !DILocation(line: 223, column: 43, scope: !444)
!460 = !DILocation(line: 223, column: 17, scope: !444)
!461 = !DILocation(line: 226, column: 9, scope: !462)
!462 = distinct !DILexicalBlock(scope: !444, file: !17, line: 226, column: 9)
!463 = !DILocation(line: 226, column: 14, scope: !462)
!464 = !DILocation(line: 226, column: 21, scope: !462)
!465 = !DILocation(line: 226, column: 11, scope: !462)
!466 = !DILocation(line: 226, column: 30, scope: !462)
!467 = !DILocation(line: 227, column: 16, scope: !468)
!468 = distinct !DILexicalBlock(scope: !462, file: !17, line: 226, column: 41)
!469 = !DILocation(line: 227, column: 19, scope: !468)
!470 = !DILocation(line: 227, column: 10, scope: !468)
!471 = !DILocation(line: 227, column: 14, scope: !468)
!472 = !DILocation(line: 228, column: 9, scope: !468)
!473 = !DILocation(line: 230, column: 5, scope: !444)
!474 = !DILocation(line: 231, column: 1, scope: !444)
!475 = distinct !DISubprogram(name: "get_successor_node", scope: !17, file: !17, line: 508, type: !419, scopeLine: 509, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !27)
!476 = !DILocalVariable(name: "table", arg: 1, scope: !475, file: !17, line: 508, type: !308)
!477 = !DILocation(line: 508, column: 59, scope: !475)
!478 = !DILocalVariable(name: "x", arg: 2, scope: !475, file: !17, line: 508, type: !169)
!479 = !DILocation(line: 508, column: 74, scope: !475)
!480 = !DILocation(line: 510, column: 9, scope: !481)
!481 = distinct !DILexicalBlock(scope: !475, file: !17, line: 510, column: 9)
!482 = !DILocation(line: 510, column: 11, scope: !481)
!483 = !DILocation(line: 510, column: 9, scope: !475)
!484 = !DILocation(line: 511, column: 9, scope: !481)
!485 = !DILocation(line: 513, column: 9, scope: !486)
!486 = distinct !DILexicalBlock(scope: !475, file: !17, line: 513, column: 9)
!487 = !DILocation(line: 513, column: 12, scope: !486)
!488 = !DILocation(line: 513, column: 21, scope: !486)
!489 = !DILocation(line: 513, column: 28, scope: !486)
!490 = !DILocation(line: 513, column: 18, scope: !486)
!491 = !DILocation(line: 513, column: 9, scope: !475)
!492 = !DILocation(line: 514, column: 25, scope: !486)
!493 = !DILocation(line: 514, column: 32, scope: !486)
!494 = !DILocation(line: 514, column: 35, scope: !486)
!495 = !DILocation(line: 514, column: 16, scope: !486)
!496 = !DILocation(line: 514, column: 9, scope: !486)
!497 = !DILocalVariable(name: "y", scope: !475, file: !17, line: 516, type: !169)
!498 = !DILocation(line: 516, column: 13, scope: !475)
!499 = !DILocation(line: 516, column: 17, scope: !475)
!500 = !DILocation(line: 516, column: 20, scope: !475)
!501 = !DILocation(line: 518, column: 5, scope: !475)
!502 = !DILocation(line: 518, column: 12, scope: !475)
!503 = !DILocation(line: 518, column: 17, scope: !475)
!504 = !DILocation(line: 518, column: 24, scope: !475)
!505 = !DILocation(line: 518, column: 14, scope: !475)
!506 = !DILocation(line: 518, column: 33, scope: !475)
!507 = !DILocation(line: 518, column: 36, scope: !475)
!508 = !DILocation(line: 518, column: 41, scope: !475)
!509 = !DILocation(line: 518, column: 44, scope: !475)
!510 = !DILocation(line: 518, column: 38, scope: !475)
!511 = !DILocation(line: 519, column: 13, scope: !512)
!512 = distinct !DILexicalBlock(scope: !475, file: !17, line: 518, column: 51)
!513 = !DILocation(line: 519, column: 11, scope: !512)
!514 = !DILocation(line: 520, column: 13, scope: !512)
!515 = !DILocation(line: 520, column: 16, scope: !512)
!516 = !DILocation(line: 520, column: 11, scope: !512)
!517 = distinct !{!517, !501, !518, !388}
!518 = !DILocation(line: 521, column: 5, scope: !475)
!519 = !DILocation(line: 522, column: 12, scope: !475)
!520 = !DILocation(line: 522, column: 5, scope: !475)
!521 = !DILocation(line: 523, column: 1, scope: !475)
!522 = distinct !DISubprogram(name: "treetable_size", scope: !17, file: !17, line: 241, type: !523, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!523 = !DISubroutineType(types: !524)
!524 = !{!134, !308}
!525 = !DILocalVariable(name: "table", arg: 1, scope: !522, file: !17, line: 241, type: !308)
!526 = !DILocation(line: 241, column: 47, scope: !522)
!527 = !DILocation(line: 243, column: 12, scope: !522)
!528 = !DILocation(line: 243, column: 19, scope: !522)
!529 = !DILocation(line: 243, column: 5, scope: !522)
!530 = distinct !DISubprogram(name: "treetable_contains_key", scope: !17, file: !17, line: 254, type: !531, scopeLine: 255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!531 = !DISubroutineType(types: !532)
!532 = !{!533, !308, !90}
!533 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!534 = !DILocalVariable(name: "table", arg: 1, scope: !530, file: !17, line: 254, type: !308)
!535 = !DILocation(line: 254, column: 53, scope: !530)
!536 = !DILocalVariable(name: "key", arg: 2, scope: !530, file: !17, line: 254, type: !90)
!537 = !DILocation(line: 254, column: 72, scope: !530)
!538 = !DILocalVariable(name: "node", scope: !530, file: !17, line: 256, type: !169)
!539 = !DILocation(line: 256, column: 13, scope: !530)
!540 = !DILocation(line: 256, column: 41, scope: !530)
!541 = !DILocation(line: 256, column: 48, scope: !530)
!542 = !DILocation(line: 256, column: 20, scope: !530)
!543 = !DILocation(line: 258, column: 9, scope: !544)
!544 = distinct !DILexicalBlock(scope: !530, file: !17, line: 258, column: 9)
!545 = !DILocation(line: 258, column: 9, scope: !530)
!546 = !DILocation(line: 259, column: 9, scope: !544)
!547 = !DILocation(line: 261, column: 5, scope: !530)
!548 = !DILocation(line: 262, column: 1, scope: !530)
!549 = distinct !DISubprogram(name: "treetable_contains_value", scope: !17, file: !17, line: 272, type: !550, scopeLine: 273, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!550 = !DISubroutineType(types: !551)
!551 = !{!134, !308, !90}
!552 = !DILocalVariable(name: "table", arg: 1, scope: !549, file: !17, line: 272, type: !308)
!553 = !DILocation(line: 272, column: 57, scope: !549)
!554 = !DILocalVariable(name: "value", arg: 2, scope: !549, file: !17, line: 272, type: !90)
!555 = !DILocation(line: 272, column: 76, scope: !549)
!556 = !DILocalVariable(name: "node", scope: !549, file: !17, line: 274, type: !169)
!557 = !DILocation(line: 274, column: 13, scope: !549)
!558 = !DILocation(line: 274, column: 29, scope: !549)
!559 = !DILocation(line: 274, column: 36, scope: !549)
!560 = !DILocation(line: 274, column: 43, scope: !549)
!561 = !DILocation(line: 274, column: 20, scope: !549)
!562 = !DILocalVariable(name: "o", scope: !549, file: !17, line: 276, type: !134)
!563 = !DILocation(line: 276, column: 12, scope: !549)
!564 = !DILocation(line: 277, column: 5, scope: !549)
!565 = !DILocation(line: 277, column: 12, scope: !549)
!566 = !DILocation(line: 277, column: 20, scope: !549)
!567 = !DILocation(line: 277, column: 27, scope: !549)
!568 = !DILocation(line: 277, column: 17, scope: !549)
!569 = !DILocation(line: 278, column: 13, scope: !570)
!570 = distinct !DILexicalBlock(scope: !571, file: !17, line: 278, column: 13)
!571 = distinct !DILexicalBlock(scope: !549, file: !17, line: 277, column: 37)
!572 = !DILocation(line: 278, column: 19, scope: !570)
!573 = !DILocation(line: 278, column: 28, scope: !570)
!574 = !DILocation(line: 278, column: 25, scope: !570)
!575 = !DILocation(line: 278, column: 13, scope: !571)
!576 = !DILocation(line: 279, column: 14, scope: !570)
!577 = !DILocation(line: 279, column: 13, scope: !570)
!578 = !DILocation(line: 280, column: 35, scope: !571)
!579 = !DILocation(line: 280, column: 42, scope: !571)
!580 = !DILocation(line: 280, column: 16, scope: !571)
!581 = !DILocation(line: 280, column: 14, scope: !571)
!582 = distinct !{!582, !564, !583, !388}
!583 = !DILocation(line: 281, column: 5, scope: !549)
!584 = !DILocation(line: 282, column: 12, scope: !549)
!585 = !DILocation(line: 282, column: 5, scope: !549)
!586 = distinct !DISubprogram(name: "treetable_add", scope: !17, file: !17, line: 299, type: !587, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!587 = !DISubroutineType(types: !588)
!588 = !{!19, !164, !24, !24}
!589 = !DILocalVariable(name: "table", arg: 1, scope: !586, file: !17, line: 299, type: !164)
!590 = !DILocation(line: 299, column: 39, scope: !586)
!591 = !DILocalVariable(name: "key", arg: 2, scope: !586, file: !17, line: 299, type: !24)
!592 = !DILocation(line: 299, column: 52, scope: !586)
!593 = !DILocalVariable(name: "val", arg: 3, scope: !586, file: !17, line: 299, type: !24)
!594 = !DILocation(line: 299, column: 63, scope: !586)
!595 = !DILocalVariable(name: "y", scope: !586, file: !17, line: 301, type: !169)
!596 = !DILocation(line: 301, column: 13, scope: !586)
!597 = !DILocation(line: 301, column: 17, scope: !586)
!598 = !DILocation(line: 301, column: 24, scope: !586)
!599 = !DILocalVariable(name: "x", scope: !586, file: !17, line: 302, type: !169)
!600 = !DILocation(line: 302, column: 13, scope: !586)
!601 = !DILocation(line: 302, column: 17, scope: !586)
!602 = !DILocation(line: 302, column: 24, scope: !586)
!603 = !DILocalVariable(name: "cmp", scope: !586, file: !17, line: 304, type: !23)
!604 = !DILocation(line: 304, column: 9, scope: !586)
!605 = !DILocation(line: 305, column: 5, scope: !586)
!606 = !DILocation(line: 305, column: 12, scope: !586)
!607 = !DILocation(line: 305, column: 17, scope: !586)
!608 = !DILocation(line: 305, column: 24, scope: !586)
!609 = !DILocation(line: 305, column: 14, scope: !586)
!610 = !DILocation(line: 306, column: 15, scope: !611)
!611 = distinct !DILexicalBlock(scope: !586, file: !17, line: 305, column: 34)
!612 = !DILocation(line: 306, column: 22, scope: !611)
!613 = !DILocation(line: 306, column: 26, scope: !611)
!614 = !DILocation(line: 306, column: 31, scope: !611)
!615 = !DILocation(line: 306, column: 34, scope: !611)
!616 = !DILocation(line: 306, column: 13, scope: !611)
!617 = !DILocation(line: 307, column: 15, scope: !611)
!618 = !DILocation(line: 307, column: 13, scope: !611)
!619 = !DILocation(line: 309, column: 13, scope: !620)
!620 = distinct !DILexicalBlock(scope: !611, file: !17, line: 309, column: 13)
!621 = !DILocation(line: 309, column: 17, scope: !620)
!622 = !DILocation(line: 309, column: 13, scope: !611)
!623 = !DILocation(line: 310, column: 17, scope: !624)
!624 = distinct !DILexicalBlock(scope: !620, file: !17, line: 309, column: 22)
!625 = !DILocation(line: 310, column: 20, scope: !624)
!626 = !DILocation(line: 310, column: 15, scope: !624)
!627 = !DILocation(line: 311, column: 9, scope: !624)
!628 = !DILocation(line: 311, column: 20, scope: !629)
!629 = distinct !DILexicalBlock(scope: !620, file: !17, line: 311, column: 20)
!630 = !DILocation(line: 311, column: 24, scope: !629)
!631 = !DILocation(line: 311, column: 20, scope: !620)
!632 = !DILocation(line: 312, column: 17, scope: !633)
!633 = distinct !DILexicalBlock(scope: !629, file: !17, line: 311, column: 29)
!634 = !DILocation(line: 312, column: 20, scope: !633)
!635 = !DILocation(line: 312, column: 15, scope: !633)
!636 = !DILocation(line: 314, column: 24, scope: !637)
!637 = distinct !DILexicalBlock(scope: !629, file: !17, line: 313, column: 16)
!638 = !DILocation(line: 314, column: 13, scope: !637)
!639 = !DILocation(line: 314, column: 16, scope: !637)
!640 = !DILocation(line: 314, column: 22, scope: !637)
!641 = !DILocation(line: 315, column: 13, scope: !637)
!642 = distinct !{!642, !605, !643, !388}
!643 = !DILocation(line: 317, column: 5, scope: !586)
!644 = !DILocalVariable(name: "n", scope: !586, file: !17, line: 318, type: !169)
!645 = !DILocation(line: 318, column: 13, scope: !586)
!646 = !DILocation(line: 318, column: 17, scope: !586)
!647 = !DILocation(line: 318, column: 24, scope: !586)
!648 = !DILocation(line: 320, column: 17, scope: !586)
!649 = !DILocation(line: 320, column: 5, scope: !586)
!650 = !DILocation(line: 320, column: 8, scope: !586)
!651 = !DILocation(line: 320, column: 15, scope: !586)
!652 = !DILocation(line: 321, column: 17, scope: !586)
!653 = !DILocation(line: 321, column: 5, scope: !586)
!654 = !DILocation(line: 321, column: 8, scope: !586)
!655 = !DILocation(line: 321, column: 15, scope: !586)
!656 = !DILocation(line: 322, column: 17, scope: !586)
!657 = !DILocation(line: 322, column: 5, scope: !586)
!658 = !DILocation(line: 322, column: 8, scope: !586)
!659 = !DILocation(line: 322, column: 15, scope: !586)
!660 = !DILocation(line: 323, column: 17, scope: !586)
!661 = !DILocation(line: 323, column: 24, scope: !586)
!662 = !DILocation(line: 323, column: 5, scope: !586)
!663 = !DILocation(line: 323, column: 8, scope: !586)
!664 = !DILocation(line: 323, column: 15, scope: !586)
!665 = !DILocation(line: 324, column: 17, scope: !586)
!666 = !DILocation(line: 324, column: 24, scope: !586)
!667 = !DILocation(line: 324, column: 5, scope: !586)
!668 = !DILocation(line: 324, column: 8, scope: !586)
!669 = !DILocation(line: 324, column: 15, scope: !586)
!670 = !DILocation(line: 326, column: 5, scope: !586)
!671 = !DILocation(line: 326, column: 12, scope: !586)
!672 = !DILocation(line: 326, column: 16, scope: !586)
!673 = !DILocation(line: 328, column: 9, scope: !674)
!674 = distinct !DILexicalBlock(scope: !586, file: !17, line: 328, column: 9)
!675 = !DILocation(line: 328, column: 14, scope: !674)
!676 = !DILocation(line: 328, column: 21, scope: !674)
!677 = !DILocation(line: 328, column: 11, scope: !674)
!678 = !DILocation(line: 328, column: 9, scope: !586)
!679 = !DILocation(line: 329, column: 23, scope: !680)
!680 = distinct !DILexicalBlock(scope: !674, file: !17, line: 328, column: 31)
!681 = !DILocation(line: 329, column: 9, scope: !680)
!682 = !DILocation(line: 329, column: 16, scope: !680)
!683 = !DILocation(line: 329, column: 21, scope: !680)
!684 = !DILocation(line: 330, column: 9, scope: !680)
!685 = !DILocation(line: 330, column: 12, scope: !680)
!686 = !DILocation(line: 330, column: 21, scope: !680)
!687 = !DILocation(line: 331, column: 5, scope: !680)
!688 = !DILocation(line: 332, column: 9, scope: !689)
!689 = distinct !DILexicalBlock(scope: !674, file: !17, line: 331, column: 12)
!690 = !DILocation(line: 332, column: 12, scope: !689)
!691 = !DILocation(line: 332, column: 18, scope: !689)
!692 = !DILocation(line: 333, column: 13, scope: !693)
!693 = distinct !DILexicalBlock(scope: !689, file: !17, line: 333, column: 13)
!694 = !DILocation(line: 333, column: 20, scope: !693)
!695 = !DILocation(line: 333, column: 24, scope: !693)
!696 = !DILocation(line: 333, column: 29, scope: !693)
!697 = !DILocation(line: 333, column: 32, scope: !693)
!698 = !DILocation(line: 333, column: 37, scope: !693)
!699 = !DILocation(line: 333, column: 13, scope: !689)
!700 = !DILocation(line: 334, column: 23, scope: !701)
!701 = distinct !DILexicalBlock(scope: !693, file: !17, line: 333, column: 42)
!702 = !DILocation(line: 334, column: 13, scope: !701)
!703 = !DILocation(line: 334, column: 16, scope: !701)
!704 = !DILocation(line: 334, column: 21, scope: !701)
!705 = !DILocation(line: 335, column: 9, scope: !701)
!706 = !DILocation(line: 336, column: 24, scope: !707)
!707 = distinct !DILexicalBlock(scope: !693, file: !17, line: 335, column: 16)
!708 = !DILocation(line: 336, column: 13, scope: !707)
!709 = !DILocation(line: 336, column: 16, scope: !707)
!710 = !DILocation(line: 336, column: 22, scope: !707)
!711 = !DILocation(line: 338, column: 32, scope: !689)
!712 = !DILocation(line: 338, column: 39, scope: !689)
!713 = !DILocation(line: 338, column: 9, scope: !689)
!714 = !DILocation(line: 340, column: 5, scope: !586)
!715 = !DILocation(line: 341, column: 1, scope: !586)
!716 = distinct !DISubprogram(name: "rebalance_after_insert", scope: !17, file: !17, line: 349, type: !281, scopeLine: 350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !27)
!717 = !DILocalVariable(name: "table", arg: 1, scope: !716, file: !17, line: 349, type: !164)
!718 = !DILocation(line: 349, column: 47, scope: !716)
!719 = !DILocalVariable(name: "z", arg: 2, scope: !716, file: !17, line: 349, type: !169)
!720 = !DILocation(line: 349, column: 62, scope: !716)
!721 = !DILocalVariable(name: "y", scope: !716, file: !17, line: 351, type: !169)
!722 = !DILocation(line: 351, column: 13, scope: !716)
!723 = !DILocation(line: 353, column: 5, scope: !716)
!724 = !DILocation(line: 353, column: 12, scope: !716)
!725 = !DILocation(line: 353, column: 15, scope: !716)
!726 = !DILocation(line: 353, column: 23, scope: !716)
!727 = !DILocation(line: 353, column: 29, scope: !716)
!728 = !DILocation(line: 354, column: 13, scope: !729)
!729 = distinct !DILexicalBlock(scope: !730, file: !17, line: 354, column: 13)
!730 = distinct !DILexicalBlock(scope: !716, file: !17, line: 353, column: 40)
!731 = !DILocation(line: 354, column: 16, scope: !729)
!732 = !DILocation(line: 354, column: 26, scope: !729)
!733 = !DILocation(line: 354, column: 29, scope: !729)
!734 = !DILocation(line: 354, column: 37, scope: !729)
!735 = !DILocation(line: 354, column: 45, scope: !729)
!736 = !DILocation(line: 354, column: 23, scope: !729)
!737 = !DILocation(line: 354, column: 13, scope: !730)
!738 = !DILocation(line: 355, column: 17, scope: !739)
!739 = distinct !DILexicalBlock(scope: !729, file: !17, line: 354, column: 51)
!740 = !DILocation(line: 355, column: 20, scope: !739)
!741 = !DILocation(line: 355, column: 28, scope: !739)
!742 = !DILocation(line: 355, column: 36, scope: !739)
!743 = !DILocation(line: 355, column: 15, scope: !739)
!744 = !DILocation(line: 356, column: 17, scope: !745)
!745 = distinct !DILexicalBlock(scope: !739, file: !17, line: 356, column: 17)
!746 = !DILocation(line: 356, column: 20, scope: !745)
!747 = !DILocation(line: 356, column: 26, scope: !745)
!748 = !DILocation(line: 356, column: 17, scope: !739)
!749 = !DILocation(line: 357, column: 17, scope: !750)
!750 = distinct !DILexicalBlock(scope: !745, file: !17, line: 356, column: 37)
!751 = !DILocation(line: 357, column: 20, scope: !750)
!752 = !DILocation(line: 357, column: 28, scope: !750)
!753 = !DILocation(line: 357, column: 42, scope: !750)
!754 = !DILocation(line: 358, column: 17, scope: !750)
!755 = !DILocation(line: 358, column: 20, scope: !750)
!756 = !DILocation(line: 358, column: 42, scope: !750)
!757 = !DILocation(line: 359, column: 17, scope: !750)
!758 = !DILocation(line: 359, column: 20, scope: !750)
!759 = !DILocation(line: 359, column: 28, scope: !750)
!760 = !DILocation(line: 359, column: 36, scope: !750)
!761 = !DILocation(line: 359, column: 42, scope: !750)
!762 = !DILocation(line: 360, column: 21, scope: !750)
!763 = !DILocation(line: 360, column: 24, scope: !750)
!764 = !DILocation(line: 360, column: 32, scope: !750)
!765 = !DILocation(line: 360, column: 19, scope: !750)
!766 = !DILocation(line: 361, column: 13, scope: !750)
!767 = !DILocation(line: 362, column: 21, scope: !768)
!768 = distinct !DILexicalBlock(scope: !769, file: !17, line: 362, column: 21)
!769 = distinct !DILexicalBlock(scope: !745, file: !17, line: 361, column: 20)
!770 = !DILocation(line: 362, column: 26, scope: !768)
!771 = !DILocation(line: 362, column: 29, scope: !768)
!772 = !DILocation(line: 362, column: 37, scope: !768)
!773 = !DILocation(line: 362, column: 23, scope: !768)
!774 = !DILocation(line: 362, column: 21, scope: !769)
!775 = !DILocation(line: 363, column: 25, scope: !776)
!776 = distinct !DILexicalBlock(scope: !768, file: !17, line: 362, column: 44)
!777 = !DILocation(line: 363, column: 28, scope: !776)
!778 = !DILocation(line: 363, column: 23, scope: !776)
!779 = !DILocation(line: 364, column: 33, scope: !776)
!780 = !DILocation(line: 364, column: 40, scope: !776)
!781 = !DILocation(line: 364, column: 21, scope: !776)
!782 = !DILocation(line: 365, column: 17, scope: !776)
!783 = !DILocation(line: 366, column: 17, scope: !769)
!784 = !DILocation(line: 366, column: 20, scope: !769)
!785 = !DILocation(line: 366, column: 28, scope: !769)
!786 = !DILocation(line: 366, column: 42, scope: !769)
!787 = !DILocation(line: 367, column: 17, scope: !769)
!788 = !DILocation(line: 367, column: 20, scope: !769)
!789 = !DILocation(line: 367, column: 28, scope: !769)
!790 = !DILocation(line: 367, column: 36, scope: !769)
!791 = !DILocation(line: 367, column: 42, scope: !769)
!792 = !DILocation(line: 368, column: 30, scope: !769)
!793 = !DILocation(line: 368, column: 37, scope: !769)
!794 = !DILocation(line: 368, column: 40, scope: !769)
!795 = !DILocation(line: 368, column: 48, scope: !769)
!796 = !DILocation(line: 368, column: 17, scope: !769)
!797 = !DILocation(line: 371, column: 17, scope: !798)
!798 = distinct !DILexicalBlock(scope: !729, file: !17, line: 370, column: 16)
!799 = !DILocation(line: 371, column: 20, scope: !798)
!800 = !DILocation(line: 371, column: 28, scope: !798)
!801 = !DILocation(line: 371, column: 36, scope: !798)
!802 = !DILocation(line: 371, column: 15, scope: !798)
!803 = !DILocation(line: 372, column: 17, scope: !804)
!804 = distinct !DILexicalBlock(scope: !798, file: !17, line: 372, column: 17)
!805 = !DILocation(line: 372, column: 20, scope: !804)
!806 = !DILocation(line: 372, column: 26, scope: !804)
!807 = !DILocation(line: 372, column: 17, scope: !798)
!808 = !DILocation(line: 373, column: 17, scope: !809)
!809 = distinct !DILexicalBlock(scope: !804, file: !17, line: 372, column: 37)
!810 = !DILocation(line: 373, column: 20, scope: !809)
!811 = !DILocation(line: 373, column: 28, scope: !809)
!812 = !DILocation(line: 373, column: 42, scope: !809)
!813 = !DILocation(line: 374, column: 17, scope: !809)
!814 = !DILocation(line: 374, column: 20, scope: !809)
!815 = !DILocation(line: 374, column: 42, scope: !809)
!816 = !DILocation(line: 375, column: 17, scope: !809)
!817 = !DILocation(line: 375, column: 20, scope: !809)
!818 = !DILocation(line: 375, column: 28, scope: !809)
!819 = !DILocation(line: 375, column: 36, scope: !809)
!820 = !DILocation(line: 375, column: 42, scope: !809)
!821 = !DILocation(line: 376, column: 21, scope: !809)
!822 = !DILocation(line: 376, column: 24, scope: !809)
!823 = !DILocation(line: 376, column: 32, scope: !809)
!824 = !DILocation(line: 376, column: 19, scope: !809)
!825 = !DILocation(line: 377, column: 13, scope: !809)
!826 = !DILocation(line: 378, column: 21, scope: !827)
!827 = distinct !DILexicalBlock(scope: !828, file: !17, line: 378, column: 21)
!828 = distinct !DILexicalBlock(scope: !804, file: !17, line: 377, column: 20)
!829 = !DILocation(line: 378, column: 26, scope: !827)
!830 = !DILocation(line: 378, column: 29, scope: !827)
!831 = !DILocation(line: 378, column: 37, scope: !827)
!832 = !DILocation(line: 378, column: 23, scope: !827)
!833 = !DILocation(line: 378, column: 21, scope: !828)
!834 = !DILocation(line: 379, column: 25, scope: !835)
!835 = distinct !DILexicalBlock(scope: !827, file: !17, line: 378, column: 43)
!836 = !DILocation(line: 379, column: 28, scope: !835)
!837 = !DILocation(line: 379, column: 23, scope: !835)
!838 = !DILocation(line: 380, column: 34, scope: !835)
!839 = !DILocation(line: 380, column: 41, scope: !835)
!840 = !DILocation(line: 380, column: 21, scope: !835)
!841 = !DILocation(line: 381, column: 17, scope: !835)
!842 = !DILocation(line: 382, column: 17, scope: !828)
!843 = !DILocation(line: 382, column: 20, scope: !828)
!844 = !DILocation(line: 382, column: 28, scope: !828)
!845 = !DILocation(line: 382, column: 42, scope: !828)
!846 = !DILocation(line: 383, column: 17, scope: !828)
!847 = !DILocation(line: 383, column: 20, scope: !828)
!848 = !DILocation(line: 383, column: 28, scope: !828)
!849 = !DILocation(line: 383, column: 36, scope: !828)
!850 = !DILocation(line: 383, column: 42, scope: !828)
!851 = !DILocation(line: 384, column: 29, scope: !828)
!852 = !DILocation(line: 384, column: 36, scope: !828)
!853 = !DILocation(line: 384, column: 39, scope: !828)
!854 = !DILocation(line: 384, column: 47, scope: !828)
!855 = !DILocation(line: 384, column: 17, scope: !828)
!856 = distinct !{!856, !723, !857, !388}
!857 = !DILocation(line: 387, column: 5, scope: !716)
!858 = !DILocation(line: 388, column: 5, scope: !716)
!859 = !DILocation(line: 388, column: 12, scope: !716)
!860 = !DILocation(line: 388, column: 18, scope: !716)
!861 = !DILocation(line: 388, column: 24, scope: !716)
!862 = !DILocation(line: 389, column: 1, scope: !716)
!863 = distinct !DISubprogram(name: "rotate_left", scope: !17, file: !17, line: 447, type: !281, scopeLine: 448, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !27)
!864 = !DILocalVariable(name: "table", arg: 1, scope: !863, file: !17, line: 447, type: !164)
!865 = !DILocation(line: 447, column: 36, scope: !863)
!866 = !DILocalVariable(name: "x", arg: 2, scope: !863, file: !17, line: 447, type: !169)
!867 = !DILocation(line: 447, column: 51, scope: !863)
!868 = !DILocalVariable(name: "y", scope: !863, file: !17, line: 449, type: !169)
!869 = !DILocation(line: 449, column: 13, scope: !863)
!870 = !DILocation(line: 449, column: 17, scope: !863)
!871 = !DILocation(line: 449, column: 20, scope: !863)
!872 = !DILocation(line: 451, column: 16, scope: !863)
!873 = !DILocation(line: 451, column: 19, scope: !863)
!874 = !DILocation(line: 451, column: 5, scope: !863)
!875 = !DILocation(line: 451, column: 8, scope: !863)
!876 = !DILocation(line: 451, column: 14, scope: !863)
!877 = !DILocation(line: 453, column: 9, scope: !878)
!878 = distinct !DILexicalBlock(scope: !863, file: !17, line: 453, column: 9)
!879 = !DILocation(line: 453, column: 12, scope: !878)
!880 = !DILocation(line: 453, column: 20, scope: !878)
!881 = !DILocation(line: 453, column: 27, scope: !878)
!882 = !DILocation(line: 453, column: 17, scope: !878)
!883 = !DILocation(line: 453, column: 9, scope: !863)
!884 = !DILocation(line: 454, column: 27, scope: !878)
!885 = !DILocation(line: 454, column: 9, scope: !878)
!886 = !DILocation(line: 454, column: 12, scope: !878)
!887 = !DILocation(line: 454, column: 18, scope: !878)
!888 = !DILocation(line: 454, column: 25, scope: !878)
!889 = !DILocation(line: 456, column: 17, scope: !863)
!890 = !DILocation(line: 456, column: 20, scope: !863)
!891 = !DILocation(line: 456, column: 5, scope: !863)
!892 = !DILocation(line: 456, column: 8, scope: !863)
!893 = !DILocation(line: 456, column: 15, scope: !863)
!894 = !DILocation(line: 458, column: 9, scope: !895)
!895 = distinct !DILexicalBlock(scope: !863, file: !17, line: 458, column: 9)
!896 = !DILocation(line: 458, column: 12, scope: !895)
!897 = !DILocation(line: 458, column: 22, scope: !895)
!898 = !DILocation(line: 458, column: 29, scope: !895)
!899 = !DILocation(line: 458, column: 19, scope: !895)
!900 = !DILocation(line: 458, column: 9, scope: !863)
!901 = !DILocation(line: 459, column: 23, scope: !895)
!902 = !DILocation(line: 459, column: 9, scope: !895)
!903 = !DILocation(line: 459, column: 16, scope: !895)
!904 = !DILocation(line: 459, column: 21, scope: !895)
!905 = !DILocation(line: 460, column: 14, scope: !906)
!906 = distinct !DILexicalBlock(scope: !895, file: !17, line: 460, column: 14)
!907 = !DILocation(line: 460, column: 19, scope: !906)
!908 = !DILocation(line: 460, column: 22, scope: !906)
!909 = !DILocation(line: 460, column: 30, scope: !906)
!910 = !DILocation(line: 460, column: 16, scope: !906)
!911 = !DILocation(line: 460, column: 14, scope: !895)
!912 = !DILocation(line: 461, column: 27, scope: !906)
!913 = !DILocation(line: 461, column: 9, scope: !906)
!914 = !DILocation(line: 461, column: 12, scope: !906)
!915 = !DILocation(line: 461, column: 20, scope: !906)
!916 = !DILocation(line: 461, column: 25, scope: !906)
!917 = !DILocation(line: 463, column: 28, scope: !906)
!918 = !DILocation(line: 463, column: 9, scope: !906)
!919 = !DILocation(line: 463, column: 12, scope: !906)
!920 = !DILocation(line: 463, column: 20, scope: !906)
!921 = !DILocation(line: 463, column: 26, scope: !906)
!922 = !DILocation(line: 465, column: 17, scope: !863)
!923 = !DILocation(line: 465, column: 5, scope: !863)
!924 = !DILocation(line: 465, column: 8, scope: !863)
!925 = !DILocation(line: 465, column: 15, scope: !863)
!926 = !DILocation(line: 466, column: 17, scope: !863)
!927 = !DILocation(line: 466, column: 5, scope: !863)
!928 = !DILocation(line: 466, column: 8, scope: !863)
!929 = !DILocation(line: 466, column: 15, scope: !863)
!930 = !DILocation(line: 467, column: 1, scope: !863)
!931 = distinct !DISubprogram(name: "rotate_right", scope: !17, file: !17, line: 418, type: !281, scopeLine: 419, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !27)
!932 = !DILocalVariable(name: "table", arg: 1, scope: !931, file: !17, line: 418, type: !164)
!933 = !DILocation(line: 418, column: 37, scope: !931)
!934 = !DILocalVariable(name: "x", arg: 2, scope: !931, file: !17, line: 418, type: !169)
!935 = !DILocation(line: 418, column: 52, scope: !931)
!936 = !DILocalVariable(name: "y", scope: !931, file: !17, line: 420, type: !169)
!937 = !DILocation(line: 420, column: 13, scope: !931)
!938 = !DILocation(line: 420, column: 17, scope: !931)
!939 = !DILocation(line: 420, column: 20, scope: !931)
!940 = !DILocation(line: 422, column: 15, scope: !931)
!941 = !DILocation(line: 422, column: 18, scope: !931)
!942 = !DILocation(line: 422, column: 5, scope: !931)
!943 = !DILocation(line: 422, column: 8, scope: !931)
!944 = !DILocation(line: 422, column: 13, scope: !931)
!945 = !DILocation(line: 424, column: 9, scope: !946)
!946 = distinct !DILexicalBlock(scope: !931, file: !17, line: 424, column: 9)
!947 = !DILocation(line: 424, column: 12, scope: !946)
!948 = !DILocation(line: 424, column: 21, scope: !946)
!949 = !DILocation(line: 424, column: 28, scope: !946)
!950 = !DILocation(line: 424, column: 18, scope: !946)
!951 = !DILocation(line: 424, column: 9, scope: !931)
!952 = !DILocation(line: 425, column: 28, scope: !946)
!953 = !DILocation(line: 425, column: 9, scope: !946)
!954 = !DILocation(line: 425, column: 12, scope: !946)
!955 = !DILocation(line: 425, column: 19, scope: !946)
!956 = !DILocation(line: 425, column: 26, scope: !946)
!957 = !DILocation(line: 427, column: 17, scope: !931)
!958 = !DILocation(line: 427, column: 20, scope: !931)
!959 = !DILocation(line: 427, column: 5, scope: !931)
!960 = !DILocation(line: 427, column: 8, scope: !931)
!961 = !DILocation(line: 427, column: 15, scope: !931)
!962 = !DILocation(line: 429, column: 9, scope: !963)
!963 = distinct !DILexicalBlock(scope: !931, file: !17, line: 429, column: 9)
!964 = !DILocation(line: 429, column: 12, scope: !963)
!965 = !DILocation(line: 429, column: 22, scope: !963)
!966 = !DILocation(line: 429, column: 29, scope: !963)
!967 = !DILocation(line: 429, column: 19, scope: !963)
!968 = !DILocation(line: 429, column: 9, scope: !931)
!969 = !DILocation(line: 430, column: 23, scope: !963)
!970 = !DILocation(line: 430, column: 9, scope: !963)
!971 = !DILocation(line: 430, column: 16, scope: !963)
!972 = !DILocation(line: 430, column: 21, scope: !963)
!973 = !DILocation(line: 431, column: 14, scope: !974)
!974 = distinct !DILexicalBlock(scope: !963, file: !17, line: 431, column: 14)
!975 = !DILocation(line: 431, column: 19, scope: !974)
!976 = !DILocation(line: 431, column: 22, scope: !974)
!977 = !DILocation(line: 431, column: 30, scope: !974)
!978 = !DILocation(line: 431, column: 16, scope: !974)
!979 = !DILocation(line: 431, column: 14, scope: !963)
!980 = !DILocation(line: 432, column: 28, scope: !974)
!981 = !DILocation(line: 432, column: 9, scope: !974)
!982 = !DILocation(line: 432, column: 12, scope: !974)
!983 = !DILocation(line: 432, column: 20, scope: !974)
!984 = !DILocation(line: 432, column: 26, scope: !974)
!985 = !DILocation(line: 434, column: 27, scope: !974)
!986 = !DILocation(line: 434, column: 9, scope: !974)
!987 = !DILocation(line: 434, column: 12, scope: !974)
!988 = !DILocation(line: 434, column: 20, scope: !974)
!989 = !DILocation(line: 434, column: 25, scope: !974)
!990 = !DILocation(line: 436, column: 17, scope: !931)
!991 = !DILocation(line: 436, column: 5, scope: !931)
!992 = !DILocation(line: 436, column: 8, scope: !931)
!993 = !DILocation(line: 436, column: 15, scope: !931)
!994 = !DILocation(line: 437, column: 17, scope: !931)
!995 = !DILocation(line: 437, column: 5, scope: !931)
!996 = !DILocation(line: 437, column: 8, scope: !931)
!997 = !DILocation(line: 437, column: 15, scope: !931)
!998 = !DILocation(line: 438, column: 1, scope: !931)
!999 = distinct !DISubprogram(name: "balanced", scope: !17, file: !17, line: 538, type: !1000, scopeLine: 538, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!1000 = !DISubroutineType(types: !1001)
!1001 = !{!23, !164}
!1002 = !DILocalVariable(name: "t", arg: 1, scope: !999, file: !17, line: 538, type: !164)
!1003 = !DILocation(line: 538, column: 25, scope: !999)
!1004 = !DILocation(line: 539, column: 23, scope: !999)
!1005 = !DILocation(line: 539, column: 26, scope: !999)
!1006 = !DILocation(line: 539, column: 29, scope: !999)
!1007 = !DILocation(line: 539, column: 35, scope: !999)
!1008 = !DILocation(line: 539, column: 16, scope: !999)
!1009 = !DILocation(line: 539, column: 50, scope: !999)
!1010 = !DILocation(line: 539, column: 53, scope: !999)
!1011 = !DILocation(line: 539, column: 56, scope: !999)
!1012 = !DILocation(line: 539, column: 62, scope: !999)
!1013 = !DILocation(line: 539, column: 43, scope: !999)
!1014 = !DILocation(line: 539, column: 41, scope: !999)
!1015 = !DILocation(line: 539, column: 12, scope: !999)
!1016 = !DILocation(line: 539, column: 70, scope: !999)
!1017 = !DILocation(line: 539, column: 5, scope: !999)
!1018 = distinct !DISubprogram(name: "height", scope: !17, file: !17, line: 527, type: !1019, scopeLine: 527, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !27)
!1019 = !DISubroutineType(types: !1020)
!1020 = !{!23, !164, !169}
!1021 = !DILocalVariable(name: "t", arg: 1, scope: !1018, file: !17, line: 527, type: !164)
!1022 = !DILocation(line: 527, column: 30, scope: !1018)
!1023 = !DILocalVariable(name: "node", arg: 2, scope: !1018, file: !17, line: 527, type: !169)
!1024 = !DILocation(line: 527, column: 41, scope: !1018)
!1025 = !DILocation(line: 529, column: 9, scope: !1026)
!1026 = distinct !DILexicalBlock(scope: !1018, file: !17, line: 529, column: 9)
!1027 = !DILocation(line: 529, column: 17, scope: !1026)
!1028 = !DILocation(line: 529, column: 20, scope: !1026)
!1029 = !DILocation(line: 529, column: 14, scope: !1026)
!1030 = !DILocation(line: 529, column: 9, scope: !1018)
!1031 = !DILocation(line: 530, column: 9, scope: !1026)
!1032 = !DILocalVariable(name: "leftHeight", scope: !1018, file: !17, line: 532, type: !23)
!1033 = !DILocation(line: 532, column: 9, scope: !1018)
!1034 = !DILocation(line: 532, column: 29, scope: !1018)
!1035 = !DILocation(line: 532, column: 32, scope: !1018)
!1036 = !DILocation(line: 532, column: 38, scope: !1018)
!1037 = !DILocation(line: 532, column: 22, scope: !1018)
!1038 = !DILocalVariable(name: "rightHeight", scope: !1018, file: !17, line: 533, type: !23)
!1039 = !DILocation(line: 533, column: 9, scope: !1018)
!1040 = !DILocation(line: 533, column: 30, scope: !1018)
!1041 = !DILocation(line: 533, column: 33, scope: !1018)
!1042 = !DILocation(line: 533, column: 39, scope: !1018)
!1043 = !DILocation(line: 533, column: 23, scope: !1018)
!1044 = !DILocation(line: 535, column: 12, scope: !1018)
!1045 = !DILocation(line: 535, column: 25, scope: !1018)
!1046 = !DILocation(line: 535, column: 23, scope: !1018)
!1047 = !DILocation(line: 535, column: 5, scope: !1018)
!1048 = !DILocation(line: 536, column: 1, scope: !1018)
!1049 = distinct !DISubprogram(name: "sorted", scope: !17, file: !17, line: 558, type: !1000, scopeLine: 558, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !16, retainedNodes: !27)
!1050 = !DILocalVariable(name: "t", arg: 1, scope: !1049, file: !17, line: 558, type: !164)
!1051 = !DILocation(line: 558, column: 23, scope: !1049)
!1052 = !DILocation(line: 559, column: 21, scope: !1049)
!1053 = !DILocation(line: 559, column: 24, scope: !1049)
!1054 = !DILocation(line: 559, column: 27, scope: !1049)
!1055 = !DILocation(line: 559, column: 12, scope: !1049)
!1056 = !DILocation(line: 559, column: 5, scope: !1049)
!1057 = distinct !DISubprogram(name: "isSorted", scope: !17, file: !17, line: 542, type: !1019, scopeLine: 542, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !27)
!1058 = !DILocalVariable(name: "t", arg: 1, scope: !1057, file: !17, line: 542, type: !164)
!1059 = !DILocation(line: 542, column: 32, scope: !1057)
!1060 = !DILocalVariable(name: "node", arg: 2, scope: !1057, file: !17, line: 542, type: !169)
!1061 = !DILocation(line: 542, column: 43, scope: !1057)
!1062 = !DILocation(line: 544, column: 9, scope: !1063)
!1063 = distinct !DILexicalBlock(scope: !1057, file: !17, line: 544, column: 9)
!1064 = !DILocation(line: 544, column: 17, scope: !1063)
!1065 = !DILocation(line: 544, column: 20, scope: !1063)
!1066 = !DILocation(line: 544, column: 14, scope: !1063)
!1067 = !DILocation(line: 544, column: 9, scope: !1057)
!1068 = !DILocation(line: 545, column: 9, scope: !1063)
!1069 = !DILocalVariable(name: "maxLeft", scope: !1057, file: !17, line: 547, type: !169)
!1070 = !DILocation(line: 547, column: 13, scope: !1057)
!1071 = !DILocation(line: 547, column: 32, scope: !1057)
!1072 = !DILocation(line: 547, column: 35, scope: !1057)
!1073 = !DILocation(line: 547, column: 41, scope: !1057)
!1074 = !DILocation(line: 547, column: 23, scope: !1057)
!1075 = !DILocalVariable(name: "minRight", scope: !1057, file: !17, line: 548, type: !169)
!1076 = !DILocation(line: 548, column: 13, scope: !1057)
!1077 = !DILocation(line: 548, column: 33, scope: !1057)
!1078 = !DILocation(line: 548, column: 36, scope: !1057)
!1079 = !DILocation(line: 548, column: 42, scope: !1057)
!1080 = !DILocation(line: 548, column: 24, scope: !1057)
!1081 = !DILocation(line: 550, column: 10, scope: !1082)
!1082 = distinct !DILexicalBlock(scope: !1057, file: !17, line: 550, column: 9)
!1083 = !DILocation(line: 550, column: 21, scope: !1082)
!1084 = !DILocation(line: 550, column: 24, scope: !1082)
!1085 = !DILocation(line: 550, column: 18, scope: !1082)
!1086 = !DILocation(line: 550, column: 33, scope: !1082)
!1087 = !DILocation(line: 550, column: 36, scope: !1082)
!1088 = !DILocation(line: 550, column: 42, scope: !1082)
!1089 = !DILocation(line: 550, column: 48, scope: !1082)
!1090 = !DILocation(line: 550, column: 57, scope: !1082)
!1091 = !DILocation(line: 550, column: 46, scope: !1082)
!1092 = !DILocation(line: 550, column: 62, scope: !1082)
!1093 = !DILocation(line: 551, column: 10, scope: !1082)
!1094 = !DILocation(line: 551, column: 22, scope: !1082)
!1095 = !DILocation(line: 551, column: 25, scope: !1082)
!1096 = !DILocation(line: 551, column: 19, scope: !1082)
!1097 = !DILocation(line: 551, column: 34, scope: !1082)
!1098 = !DILocation(line: 551, column: 38, scope: !1082)
!1099 = !DILocation(line: 551, column: 44, scope: !1082)
!1100 = !DILocation(line: 551, column: 50, scope: !1082)
!1101 = !DILocation(line: 551, column: 60, scope: !1082)
!1102 = !DILocation(line: 551, column: 48, scope: !1082)
!1103 = !DILocation(line: 550, column: 9, scope: !1057)
!1104 = !DILocation(line: 552, column: 9, scope: !1082)
!1105 = !DILocation(line: 554, column: 21, scope: !1057)
!1106 = !DILocation(line: 554, column: 24, scope: !1057)
!1107 = !DILocation(line: 554, column: 30, scope: !1057)
!1108 = !DILocation(line: 554, column: 12, scope: !1057)
!1109 = !DILocation(line: 554, column: 36, scope: !1057)
!1110 = !DILocation(line: 554, column: 48, scope: !1057)
!1111 = !DILocation(line: 554, column: 51, scope: !1057)
!1112 = !DILocation(line: 554, column: 57, scope: !1057)
!1113 = !DILocation(line: 554, column: 39, scope: !1057)
!1114 = !DILocation(line: 0, scope: !1057)
!1115 = !DILocation(line: 554, column: 5, scope: !1057)
!1116 = !DILocation(line: 556, column: 1, scope: !1057)
!1117 = distinct !DISubprogram(name: "tree_max", scope: !17, file: !17, line: 402, type: !419, scopeLine: 403, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !16, retainedNodes: !27)
!1118 = !DILocalVariable(name: "table", arg: 1, scope: !1117, file: !17, line: 402, type: !308)
!1119 = !DILocation(line: 402, column: 56, scope: !1117)
!1120 = !DILocalVariable(name: "n", arg: 2, scope: !1117, file: !17, line: 402, type: !169)
!1121 = !DILocation(line: 402, column: 71, scope: !1117)
!1122 = !DILocalVariable(name: "s", scope: !1117, file: !17, line: 404, type: !169)
!1123 = !DILocation(line: 404, column: 13, scope: !1117)
!1124 = !DILocation(line: 404, column: 17, scope: !1117)
!1125 = !DILocation(line: 404, column: 24, scope: !1117)
!1126 = !DILocation(line: 406, column: 5, scope: !1117)
!1127 = !DILocation(line: 406, column: 12, scope: !1117)
!1128 = !DILocation(line: 406, column: 15, scope: !1117)
!1129 = !DILocation(line: 406, column: 24, scope: !1117)
!1130 = !DILocation(line: 406, column: 21, scope: !1117)
!1131 = !DILocation(line: 407, column: 13, scope: !1117)
!1132 = !DILocation(line: 407, column: 16, scope: !1117)
!1133 = !DILocation(line: 407, column: 11, scope: !1117)
!1134 = distinct !{!1134, !1126, !1132, !388}
!1135 = !DILocation(line: 408, column: 12, scope: !1117)
!1136 = !DILocation(line: 408, column: 5, scope: !1117)
!1137 = distinct !DISubprogram(name: "memcpy", scope: !1138, file: !1138, line: 12, type: !1139, scopeLine: 12, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !25, retainedNodes: !27)
!1138 = !DIFile(filename: "klee_src/runtime/Freestanding/memcpy.c", directory: "/tmp")
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!24, !24, !90, !1141}
!1141 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !1142, line: 46, baseType: !136)
!1142 = !DIFile(filename: "llvm-130-install_O_D_A/lib/clang/13.0.1/include/stddef.h", directory: "/tmp")
!1143 = !DILocalVariable(name: "destaddr", arg: 1, scope: !1137, file: !1138, line: 12, type: !24)
!1144 = !DILocation(line: 12, column: 20, scope: !1137)
!1145 = !DILocalVariable(name: "srcaddr", arg: 2, scope: !1137, file: !1138, line: 12, type: !90)
!1146 = !DILocation(line: 12, column: 42, scope: !1137)
!1147 = !DILocalVariable(name: "len", arg: 3, scope: !1137, file: !1138, line: 12, type: !1141)
!1148 = !DILocation(line: 12, column: 58, scope: !1137)
!1149 = !DILocalVariable(name: "dest", scope: !1137, file: !1138, line: 13, type: !1150)
!1150 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!1151 = !DILocation(line: 13, column: 9, scope: !1137)
!1152 = !DILocation(line: 13, column: 16, scope: !1137)
!1153 = !DILocalVariable(name: "src", scope: !1137, file: !1138, line: 14, type: !1154)
!1154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1155, size: 64)
!1155 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !50)
!1156 = !DILocation(line: 14, column: 15, scope: !1137)
!1157 = !DILocation(line: 14, column: 21, scope: !1137)
!1158 = !DILocation(line: 16, column: 3, scope: !1137)
!1159 = !DILocation(line: 16, column: 13, scope: !1137)
!1160 = !DILocation(line: 16, column: 16, scope: !1137)
!1161 = !DILocation(line: 17, column: 19, scope: !1137)
!1162 = !DILocation(line: 17, column: 15, scope: !1137)
!1163 = !DILocation(line: 17, column: 10, scope: !1137)
!1164 = !DILocation(line: 17, column: 13, scope: !1137)
!1165 = distinct !{!1165, !1158, !1161, !388}
!1166 = !DILocation(line: 18, column: 10, scope: !1137)
!1167 = !DILocation(line: 18, column: 3, scope: !1137)
