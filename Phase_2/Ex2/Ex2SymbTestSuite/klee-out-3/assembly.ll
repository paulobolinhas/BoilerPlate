; ModuleID = 'prog'
source_filename = "llvm-link"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.treetable_s = type { %struct.rbnode_s*, %struct.rbnode_s*, i64, i32 (i8*, i8*)*, i8* (i64)*, i8* (i64, i64)*, void (i8*)* }
%struct.rbnode_s = type { i8*, i8*, i8, %struct.rbnode_s*, %struct.rbnode_s*, %struct.rbnode_s* }
%struct.treetable_conf_s = type { i32 (i8*, i8*)*, i8* (i64)*, i8* (i64, i64)*, void (i8*)* }

@.str = private unnamed_addr constant [5 x i8] c"key1\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"key2\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"ccStat == CC_ERR_KEY_NOT_FOUND\00", align 1
@.str.3 = private unnamed_addr constant [16 x i8] c"get_first_key.c\00", align 1
@__PRETTY_FUNCTION__.main = private unnamed_addr constant [11 x i8] c"int main()\00", align 1
@.str.4 = private unnamed_addr constant [16 x i8] c"ccStat == CC_OK\00", align 1
@.str.5 = private unnamed_addr constant [25 x i8] c"*(int*)outputKey == key1\00", align 1
@.str.6 = private unnamed_addr constant [25 x i8] c"*(int*)outputKey == key2\00", align 1

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
  %ccStat = alloca i32, align 4
  %outputKey = alloca i8*, align 8
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
  call void @llvm.dbg.declare(metadata i32* %ccStat, metadata !63, metadata !DIExpression()), !dbg !64
  call void @llvm.dbg.declare(metadata i8** %outputKey, metadata !65, metadata !DIExpression()), !dbg !66
  %2 = bitcast i32* %key1 to i8*, !dbg !67
  call void @klee_make_symbolic(i8* %2, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0)), !dbg !68
  %3 = bitcast i32* %key2 to i8*, !dbg !69
  call void @klee_make_symbolic(i8* %3, i64 4, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i64 0, i64 0)), !dbg !70
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !71
  %call1 = call i32 @treetable_get_first_key(%struct.treetable_s* %4, i8** %outputKey), !dbg !72
  store i32 %call1, i32* %ccStat, align 4, !dbg !73
  %5 = load i32, i32* %ccStat, align 4, !dbg !74
  %cmp = icmp eq i32 %5, 6, !dbg !74
  br i1 %cmp, label %if.end, label %if.else, !dbg !77

if.else:                                          ; preds = %entry
  call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i32 27, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !74
  unreachable, !dbg !74

if.end:                                           ; preds = %entry
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !78
  %7 = bitcast i32* %key1 to i8*, !dbg !79
  %arraydecay = getelementptr inbounds [10 x i8], [10 x i8]* %value1, i64 0, i64 0, !dbg !80
  %call2 = call i32 @treetable_add(%struct.treetable_s* %6, i8* %7, i8* %arraydecay), !dbg !81
  %8 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !82
  %call3 = call i32 @treetable_get_first_key(%struct.treetable_s* %8, i8** %outputKey), !dbg !83
  store i32 %call3, i32* %ccStat, align 4, !dbg !84
  %9 = load i32, i32* %ccStat, align 4, !dbg !85
  %cmp4 = icmp eq i32 %9, 0, !dbg !85
  br i1 %cmp4, label %if.end7, label %if.else6, !dbg !88

if.else6:                                         ; preds = %if.end
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i32 31, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !85
  unreachable, !dbg !85

if.end7:                                          ; preds = %if.end
  %10 = load i8*, i8** %outputKey, align 8, !dbg !89
  %11 = bitcast i8* %10 to i32*, !dbg !89
  %12 = load i32, i32* %11, align 4, !dbg !89
  %13 = load i32, i32* %key1, align 4, !dbg !89
  %cmp8 = icmp eq i32 %12, %13, !dbg !89
  br i1 %cmp8, label %if.end11, label %if.else10, !dbg !92

if.else10:                                        ; preds = %if.end7
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i32 32, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !89
  unreachable, !dbg !89

if.end11:                                         ; preds = %if.end7
  %14 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !93
  %15 = bitcast i32* %key2 to i8*, !dbg !94
  %arraydecay12 = getelementptr inbounds [10 x i8], [10 x i8]* %value2, i64 0, i64 0, !dbg !95
  %call13 = call i32 @treetable_add(%struct.treetable_s* %14, i8* %15, i8* %arraydecay12), !dbg !96
  %16 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !97
  %call14 = call i32 @treetable_get_first_key(%struct.treetable_s* %16, i8** %outputKey), !dbg !98
  store i32 %call14, i32* %ccStat, align 4, !dbg !99
  %17 = load i32, i32* %ccStat, align 4, !dbg !100
  %cmp15 = icmp eq i32 %17, 0, !dbg !100
  br i1 %cmp15, label %if.end18, label %if.else17, !dbg !103

if.else17:                                        ; preds = %if.end11
  call void @__assert_fail(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i32 37, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !100
  unreachable, !dbg !100

if.end18:                                         ; preds = %if.end11
  %18 = load i32, i32* %key2, align 4, !dbg !104
  %19 = load i32, i32* %key1, align 4, !dbg !106
  %cmp19 = icmp sle i32 %18, %19, !dbg !107
  br i1 %cmp19, label %if.then20, label %if.else25, !dbg !108

if.then20:                                        ; preds = %if.end18
  %20 = load i8*, i8** %outputKey, align 8, !dbg !109
  %21 = bitcast i8* %20 to i32*, !dbg !109
  %22 = load i32, i32* %21, align 4, !dbg !109
  %23 = load i32, i32* %key2, align 4, !dbg !109
  %cmp21 = icmp eq i32 %22, %23, !dbg !109
  br i1 %cmp21, label %if.end30, label %if.else23, !dbg !113

if.else23:                                        ; preds = %if.then20
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i32 39, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !109
  unreachable, !dbg !109

if.else25:                                        ; preds = %if.end18
  %24 = load i8*, i8** %outputKey, align 8, !dbg !114
  %25 = bitcast i8* %24 to i32*, !dbg !114
  %26 = load i32, i32* %25, align 4, !dbg !114
  %27 = load i32, i32* %key1, align 4, !dbg !114
  %cmp26 = icmp eq i32 %26, %27, !dbg !114
  br i1 %cmp26, label %if.end30, label %if.else28, !dbg !118

if.else28:                                        ; preds = %if.else25
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.5, i64 0, i64 0), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.3, i64 0, i64 0), i32 41, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__PRETTY_FUNCTION__.main, i64 0, i64 0)) #6, !dbg !114
  unreachable, !dbg !114

if.end30:                                         ; preds = %if.else25, %if.then20
  %28 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !119
  call void @treetable_destroy(%struct.treetable_s* %28), !dbg !120
  %29 = load i32, i32* %retval, align 4, !dbg !121
  ret i32 %29, !dbg !121
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare dso_local void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noreturn nounwind
declare dso_local void @__assert_fail(i8*, i8*, i32, i8*) #3

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @cmp(i8* %e1, i8* %e2) #0 !dbg !122 {
entry:
  %retval = alloca i32, align 4
  %e1.addr = alloca i8*, align 8
  %e2.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i8* %e1, i8** %e1.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %e1.addr, metadata !127, metadata !DIExpression()), !dbg !128
  store i8* %e2, i8** %e2.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %e2.addr, metadata !129, metadata !DIExpression()), !dbg !130
  call void @llvm.dbg.declare(metadata i32* %i, metadata !131, metadata !DIExpression()), !dbg !132
  %0 = load i8*, i8** %e1.addr, align 8, !dbg !133
  %1 = bitcast i8* %0 to i32*, !dbg !134
  %2 = load i32, i32* %1, align 4, !dbg !135
  store i32 %2, i32* %i, align 4, !dbg !132
  call void @llvm.dbg.declare(metadata i32* %j, metadata !136, metadata !DIExpression()), !dbg !137
  %3 = load i8*, i8** %e2.addr, align 8, !dbg !138
  %4 = bitcast i8* %3 to i32*, !dbg !139
  %5 = load i32, i32* %4, align 4, !dbg !140
  store i32 %5, i32* %j, align 4, !dbg !137
  %6 = load i32, i32* %i, align 4, !dbg !141
  %7 = load i32, i32* %j, align 4, !dbg !143
  %cmp = icmp slt i32 %6, %7, !dbg !144
  br i1 %cmp, label %if.then, label %if.end, !dbg !145

if.then:                                          ; preds = %entry
  store i32 -1, i32* %retval, align 4, !dbg !146
  br label %return, !dbg !146

if.end:                                           ; preds = %entry
  %8 = load i32, i32* %i, align 4, !dbg !147
  %9 = load i32, i32* %j, align 4, !dbg !149
  %cmp1 = icmp eq i32 %8, %9, !dbg !150
  br i1 %cmp1, label %if.then2, label %if.end3, !dbg !151

if.then2:                                         ; preds = %if.end
  store i32 0, i32* %retval, align 4, !dbg !152
  br label %return, !dbg !152

if.end3:                                          ; preds = %if.end
  store i32 1, i32* %retval, align 4, !dbg !153
  br label %return, !dbg !153

return:                                           ; preds = %if.end3, %if.then2, %if.then
  %10 = load i32, i32* %retval, align 4, !dbg !154
  ret i32 %10, !dbg !154
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @treetable_conf_init(%struct.treetable_conf_s* %conf) #0 !dbg !155 {
entry:
  %conf.addr = alloca %struct.treetable_conf_s*, align 8
  store %struct.treetable_conf_s* %conf, %struct.treetable_conf_s** %conf.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s** %conf.addr, metadata !180, metadata !DIExpression()), !dbg !181
  %0 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !182
  %mem_alloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %0, i32 0, i32 1, !dbg !183
  store i8* (i64)* @malloc, i8* (i64)** %mem_alloc, align 8, !dbg !184
  %1 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !185
  %mem_calloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %1, i32 0, i32 2, !dbg !186
  store i8* (i64, i64)* @calloc, i8* (i64, i64)** %mem_calloc, align 8, !dbg !187
  %2 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !188
  %mem_free = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %2, i32 0, i32 3, !dbg !189
  store void (i8*)* @free, void (i8*)** %mem_free, align 8, !dbg !190
  %3 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !191
  %cmp = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %3, i32 0, i32 0, !dbg !192
  store i32 (i8*, i8*)* @cmp, i32 (i8*, i8*)** %cmp, align 8, !dbg !193
  ret void, !dbg !194
}

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @malloc(i64) #4

; Function Attrs: nounwind
declare dso_local noalias align 16 i8* @calloc(i64, i64) #4

; Function Attrs: nounwind
declare dso_local void @free(i8*) #4

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_new(%struct.treetable_s** %tt) #0 !dbg !195 {
entry:
  %tt.addr = alloca %struct.treetable_s**, align 8
  %conf = alloca %struct.treetable_conf_s, align 8
  store %struct.treetable_s** %tt, %struct.treetable_s*** %tt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s*** %tt.addr, metadata !221, metadata !DIExpression()), !dbg !222
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s* %conf, metadata !223, metadata !DIExpression()), !dbg !224
  call void @treetable_conf_init(%struct.treetable_conf_s* %conf), !dbg !225
  %0 = load %struct.treetable_s**, %struct.treetable_s*** %tt.addr, align 8, !dbg !226
  %call = call i32 @treetable_new_conf(%struct.treetable_conf_s* %conf, %struct.treetable_s** %0), !dbg !227
  ret i32 %call, !dbg !228
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_new_conf(%struct.treetable_conf_s* %conf, %struct.treetable_s** %tt) #0 !dbg !229 {
entry:
  %retval = alloca i32, align 4
  %conf.addr = alloca %struct.treetable_conf_s*, align 8
  %tt.addr = alloca %struct.treetable_s**, align 8
  %table = alloca %struct.treetable_s*, align 8
  %sentinel = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_conf_s* %conf, %struct.treetable_conf_s** %conf.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_conf_s** %conf.addr, metadata !235, metadata !DIExpression()), !dbg !236
  store %struct.treetable_s** %tt, %struct.treetable_s*** %tt.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s*** %tt.addr, metadata !237, metadata !DIExpression()), !dbg !238
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table, metadata !239, metadata !DIExpression()), !dbg !240
  %0 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !241
  %mem_calloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %0, i32 0, i32 2, !dbg !242
  %1 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc, align 8, !dbg !242
  %call = call i8* %1(i64 1, i64 56), !dbg !241
  %2 = bitcast i8* %call to %struct.treetable_s*, !dbg !241
  store %struct.treetable_s* %2, %struct.treetable_s** %table, align 8, !dbg !240
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !243
  %tobool = icmp ne %struct.treetable_s* %3, null, !dbg !243
  br i1 %tobool, label %if.end, label %if.then, !dbg !245

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !246
  br label %return, !dbg !246

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %sentinel, metadata !247, metadata !DIExpression()), !dbg !248
  %4 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !249
  %mem_calloc1 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %4, i32 0, i32 2, !dbg !250
  %5 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc1, align 8, !dbg !250
  %call2 = call i8* %5(i64 1, i64 48), !dbg !249
  %6 = bitcast i8* %call2 to %struct.rbnode_s*, !dbg !249
  store %struct.rbnode_s* %6, %struct.rbnode_s** %sentinel, align 8, !dbg !248
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !251
  %tobool3 = icmp ne %struct.rbnode_s* %7, null, !dbg !251
  br i1 %tobool3, label %if.end5, label %if.then4, !dbg !253

if.then4:                                         ; preds = %if.end
  %8 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !254
  %mem_free = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %8, i32 0, i32 3, !dbg !256
  %9 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !256
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !257
  %11 = bitcast %struct.treetable_s* %10 to i8*, !dbg !257
  call void %9(i8* %11), !dbg !254
  store i32 1, i32* %retval, align 4, !dbg !258
  br label %return, !dbg !258

if.end5:                                          ; preds = %if.end
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !259
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 2, !dbg !260
  store i8 1, i8* %color, align 8, !dbg !261
  %13 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !262
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %13, i32 0, i32 2, !dbg !263
  store i64 0, i64* %size, align 8, !dbg !264
  %14 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !265
  %cmp = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %14, i32 0, i32 0, !dbg !266
  %15 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp, align 8, !dbg !266
  %16 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !267
  %cmp6 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %16, i32 0, i32 3, !dbg !268
  store i32 (i8*, i8*)* %15, i32 (i8*, i8*)** %cmp6, align 8, !dbg !269
  %17 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !270
  %mem_alloc = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %17, i32 0, i32 1, !dbg !271
  %18 = load i8* (i64)*, i8* (i64)** %mem_alloc, align 8, !dbg !271
  %19 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !272
  %mem_alloc7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %19, i32 0, i32 4, !dbg !273
  store i8* (i64)* %18, i8* (i64)** %mem_alloc7, align 8, !dbg !274
  %20 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !275
  %mem_calloc8 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %20, i32 0, i32 2, !dbg !276
  %21 = load i8* (i64, i64)*, i8* (i64, i64)** %mem_calloc8, align 8, !dbg !276
  %22 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !277
  %mem_calloc9 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %22, i32 0, i32 5, !dbg !278
  store i8* (i64, i64)* %21, i8* (i64, i64)** %mem_calloc9, align 8, !dbg !279
  %23 = load %struct.treetable_conf_s*, %struct.treetable_conf_s** %conf.addr, align 8, !dbg !280
  %mem_free10 = getelementptr inbounds %struct.treetable_conf_s, %struct.treetable_conf_s* %23, i32 0, i32 3, !dbg !281
  %24 = load void (i8*)*, void (i8*)** %mem_free10, align 8, !dbg !281
  %25 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !282
  %mem_free11 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %25, i32 0, i32 6, !dbg !283
  store void (i8*)* %24, void (i8*)** %mem_free11, align 8, !dbg !284
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !285
  %27 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !286
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %27, i32 0, i32 0, !dbg !287
  store %struct.rbnode_s* %26, %struct.rbnode_s** %root, align 8, !dbg !288
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !289
  %29 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !290
  %sentinel12 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %29, i32 0, i32 1, !dbg !291
  store %struct.rbnode_s* %28, %struct.rbnode_s** %sentinel12, align 8, !dbg !292
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table, align 8, !dbg !293
  %31 = load %struct.treetable_s**, %struct.treetable_s*** %tt.addr, align 8, !dbg !294
  store %struct.treetable_s* %30, %struct.treetable_s** %31, align 8, !dbg !295
  store i32 0, i32* %retval, align 4, !dbg !296
  br label %return, !dbg !296

return:                                           ; preds = %if.end5, %if.then4, %if.then
  %32 = load i32, i32* %retval, align 4, !dbg !297
  ret i32 %32, !dbg !297
}

; Function Attrs: noinline nounwind uwtable
define dso_local void @treetable_destroy(%struct.treetable_s* %table) #0 !dbg !298 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !301, metadata !DIExpression()), !dbg !302
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !303
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !304
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !305
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !305
  call void @tree_destroy(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !306
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !307
  %mem_free = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %3, i32 0, i32 6, !dbg !308
  %4 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !308
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !309
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !310
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !310
  %7 = bitcast %struct.rbnode_s* %6 to i8*, !dbg !309
  call void %4(i8* %7), !dbg !307
  %8 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !311
  %mem_free1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %8, i32 0, i32 6, !dbg !312
  %9 = load void (i8*)*, void (i8*)** %mem_free1, align 8, !dbg !312
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !313
  %11 = bitcast %struct.treetable_s* %10 to i8*, !dbg !313
  call void %9(i8* %11), !dbg !311
  ret void, !dbg !314
}

; Function Attrs: noinline nounwind uwtable
define internal void @tree_destroy(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !315 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !318, metadata !DIExpression()), !dbg !319
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !320, metadata !DIExpression()), !dbg !321
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !322
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !324
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !325
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !325
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !326
  br i1 %cmp, label %return, label %if.end, !dbg !327

if.end:                                           ; preds = %entry
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !328
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !329
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !330
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !330
  call void @tree_destroy(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !331
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !332
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !333
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !334
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !334
  call void @tree_destroy(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !335
  %9 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !336
  %mem_free = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %9, i32 0, i32 6, !dbg !337
  %10 = load void (i8*)*, void (i8*)** %mem_free, align 8, !dbg !337
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !338
  %12 = bitcast %struct.rbnode_s* %11 to i8*, !dbg !338
  call void %10(i8* %12), !dbg !336
  br label %return, !dbg !339

return:                                           ; preds = %entry, %if.end
  ret void, !dbg !339
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get(%struct.treetable_s* %table, i8* %key, i8** %out) #0 !dbg !340 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %out.addr = alloca i8**, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !347, metadata !DIExpression()), !dbg !348
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !349, metadata !DIExpression()), !dbg !350
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !351, metadata !DIExpression()), !dbg !352
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !353, metadata !DIExpression()), !dbg !354
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !355
  %1 = load i8*, i8** %key.addr, align 8, !dbg !356
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !357
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !354
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !358
  %tobool = icmp ne %struct.rbnode_s* %2, null, !dbg !358
  br i1 %tobool, label %if.end, label %if.then, !dbg !360

if.then:                                          ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !361
  br label %return, !dbg !361

if.end:                                           ; preds = %entry
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !362
  %value = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %3, i32 0, i32 1, !dbg !363
  %4 = load i8*, i8** %value, align 8, !dbg !363
  %5 = load i8**, i8*** %out.addr, align 8, !dbg !364
  store i8* %4, i8** %5, align 8, !dbg !365
  store i32 0, i32* %retval, align 4, !dbg !366
  br label %return, !dbg !366

return:                                           ; preds = %if.end, %if.then
  %6 = load i32, i32* %retval, align 4, !dbg !367
  ret i32 %6, !dbg !367
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %table, i8* %key) #0 !dbg !368 {
entry:
  %retval = alloca %struct.rbnode_s*, align 8
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %n = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  %cmp1 = alloca i32, align 4
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !371, metadata !DIExpression()), !dbg !372
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !373, metadata !DIExpression()), !dbg !374
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !375
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 2, !dbg !377
  %1 = load i64, i64* %size, align 8, !dbg !377
  %cmp = icmp eq i64 %1, 0, !dbg !378
  br i1 %cmp, label %if.then, label %if.end, !dbg !379

if.then:                                          ; preds = %entry
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !380
  br label %return, !dbg !380

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !381, metadata !DIExpression()), !dbg !382
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !383
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %2, i32 0, i32 0, !dbg !384
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !384
  store %struct.rbnode_s* %3, %struct.rbnode_s** %n, align 8, !dbg !382
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !385, metadata !DIExpression()), !dbg !386
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !387
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !388
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !388
  store %struct.rbnode_s* %5, %struct.rbnode_s** %s, align 8, !dbg !386
  call void @llvm.dbg.declare(metadata i32* %cmp1, metadata !389, metadata !DIExpression()), !dbg !390
  br label %do.body, !dbg !391

do.body:                                          ; preds = %do.cond, %if.end
  %6 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !392
  %cmp2 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %6, i32 0, i32 3, !dbg !394
  %7 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp2, align 8, !dbg !394
  %8 = load i8*, i8** %key.addr, align 8, !dbg !395
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !396
  %key3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 0, !dbg !397
  %10 = load i8*, i8** %key3, align 8, !dbg !397
  %call = call i32 %7(i8* %8, i8* %10), !dbg !392
  store i32 %call, i32* %cmp1, align 4, !dbg !398
  %11 = load i32, i32* %cmp1, align 4, !dbg !399
  %cmp4 = icmp slt i32 %11, 0, !dbg !401
  br i1 %cmp4, label %if.then5, label %if.else, !dbg !402

if.then5:                                         ; preds = %do.body
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !403
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 4, !dbg !404
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !404
  store %struct.rbnode_s* %13, %struct.rbnode_s** %n, align 8, !dbg !405
  br label %do.cond, !dbg !406

if.else:                                          ; preds = %do.body
  %14 = load i32, i32* %cmp1, align 4, !dbg !407
  %cmp6 = icmp sgt i32 %14, 0, !dbg !409
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !410

if.then7:                                         ; preds = %if.else
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !411
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 5, !dbg !412
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !412
  store %struct.rbnode_s* %16, %struct.rbnode_s** %n, align 8, !dbg !413
  br label %do.cond

if.else8:                                         ; preds = %if.else
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !414
  store %struct.rbnode_s* %17, %struct.rbnode_s** %retval, align 8, !dbg !415
  br label %return, !dbg !415

do.cond:                                          ; preds = %if.then5, %if.then7
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !416
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !417
  %cmp11 = icmp ne %struct.rbnode_s* %18, %19, !dbg !418
  %20 = load i32, i32* %cmp1, align 4, !dbg !419
  %cmp12 = icmp ne i32 %20, 0, !dbg !419
  %21 = select i1 %cmp11, i1 %cmp12, i1 false, !dbg !419
  br i1 %21, label %do.body, label %do.end, !dbg !420, !llvm.loop !421

do.end:                                           ; preds = %do.cond
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !424
  br label %return, !dbg !424

return:                                           ; preds = %do.end, %if.else8, %if.then
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %retval, align 8, !dbg !425
  ret %struct.rbnode_s* %22, !dbg !425
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get_first_key(%struct.treetable_s* %table, i8** %out) #0 !dbg !426 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %out.addr = alloca i8**, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !429, metadata !DIExpression()), !dbg !430
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !431, metadata !DIExpression()), !dbg !432
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !433, metadata !DIExpression()), !dbg !434
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !435
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !436
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !437
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !437
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !438
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !434
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !439
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !441
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !442
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !442
  %cmp = icmp ne %struct.rbnode_s* %3, %5, !dbg !443
  br i1 %cmp, label %if.then, label %if.end, !dbg !444

if.then:                                          ; preds = %entry
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !445
  %key = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 0, !dbg !447
  %7 = load i8*, i8** %key, align 8, !dbg !447
  %8 = load i8**, i8*** %out.addr, align 8, !dbg !448
  store i8* %7, i8** %8, align 8, !dbg !449
  store i32 0, i32* %retval, align 4, !dbg !450
  br label %return, !dbg !450

if.end:                                           ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !451
  br label %return, !dbg !451

return:                                           ; preds = %if.end, %if.then
  %9 = load i32, i32* %retval, align 4, !dbg !452
  ret i32 %9, !dbg !452
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @tree_min(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !453 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !456, metadata !DIExpression()), !dbg !457
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !458, metadata !DIExpression()), !dbg !459
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !460, metadata !DIExpression()), !dbg !461
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !462
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !463
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !463
  store %struct.rbnode_s* %1, %struct.rbnode_s** %s, align 8, !dbg !461
  br label %while.cond, !dbg !464

while.cond:                                       ; preds = %while.body, %entry
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !465
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !466
  %cmp = icmp ne %struct.rbnode_s* %2, %3, !dbg !467
  br i1 %cmp, label %land.rhs, label %while.end, !dbg !468

land.rhs:                                         ; preds = %while.cond
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !469
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !470
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !470
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !471
  %cmp1 = icmp ne %struct.rbnode_s* %5, %6, !dbg !472
  br i1 %cmp1, label %while.body, label %while.end, !dbg !464

while.body:                                       ; preds = %land.rhs
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !473
  %left2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 4, !dbg !474
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %left2, align 8, !dbg !474
  store %struct.rbnode_s* %8, %struct.rbnode_s** %n.addr, align 8, !dbg !475
  br label %while.cond, !dbg !464, !llvm.loop !476

while.end:                                        ; preds = %while.cond, %land.rhs
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !477
  ret %struct.rbnode_s* %9, !dbg !478
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_get_greater_than(%struct.treetable_s* %table, i8* %key, i8** %out) #0 !dbg !479 {
entry:
  %retval = alloca i32, align 4
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %out.addr = alloca i8**, align 8
  %n = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !480, metadata !DIExpression()), !dbg !481
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !482, metadata !DIExpression()), !dbg !483
  store i8** %out, i8*** %out.addr, align 8
  call void @llvm.dbg.declare(metadata i8*** %out.addr, metadata !484, metadata !DIExpression()), !dbg !485
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !486, metadata !DIExpression()), !dbg !487
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !488
  %1 = load i8*, i8** %key.addr, align 8, !dbg !489
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !490
  store %struct.rbnode_s* %call, %struct.rbnode_s** %n, align 8, !dbg !487
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !491, metadata !DIExpression()), !dbg !492
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !493
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !494
  %call1 = call %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %2, %struct.rbnode_s* %3), !dbg !495
  store %struct.rbnode_s* %call1, %struct.rbnode_s** %s, align 8, !dbg !492
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !496
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !498
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !499
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !499
  %cmp = icmp ne %struct.rbnode_s* %4, %6, !dbg !500
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8
  %tobool = icmp ne %struct.rbnode_s* %7, null
  %or.cond = select i1 %cmp, i1 %tobool, i1 false, !dbg !501
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8
  %tobool3 = icmp ne %struct.rbnode_s* %8, null
  %or.cond1 = select i1 %or.cond, i1 %tobool3, i1 false, !dbg !501
  br i1 %or.cond1, label %if.then, label %if.end, !dbg !501

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !502
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 0, !dbg !504
  %10 = load i8*, i8** %key4, align 8, !dbg !504
  %11 = load i8**, i8*** %out.addr, align 8, !dbg !505
  store i8* %10, i8** %11, align 8, !dbg !506
  store i32 0, i32* %retval, align 4, !dbg !507
  br label %return, !dbg !507

if.end:                                           ; preds = %entry
  store i32 6, i32* %retval, align 4, !dbg !508
  br label %return, !dbg !508

return:                                           ; preds = %if.end, %if.then
  %12 = load i32, i32* %retval, align 4, !dbg !509
  ret i32 %12, !dbg !509
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !510 {
entry:
  %retval = alloca %struct.rbnode_s*, align 8
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !511, metadata !DIExpression()), !dbg !512
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !513, metadata !DIExpression()), !dbg !514
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !515
  %cmp = icmp eq %struct.rbnode_s* %0, null, !dbg !517
  br i1 %cmp, label %if.then, label %if.end, !dbg !518

if.then:                                          ; preds = %entry
  store %struct.rbnode_s* null, %struct.rbnode_s** %retval, align 8, !dbg !519
  br label %return, !dbg !519

if.end:                                           ; preds = %entry
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !520
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %1, i32 0, i32 5, !dbg !522
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !522
  %3 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !523
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %3, i32 0, i32 1, !dbg !524
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !524
  %cmp1 = icmp ne %struct.rbnode_s* %2, %4, !dbg !525
  br i1 %cmp1, label %if.then2, label %if.end4, !dbg !526

if.then2:                                         ; preds = %if.end
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !527
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !528
  %right3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 5, !dbg !529
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %right3, align 8, !dbg !529
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %5, %struct.rbnode_s* %7), !dbg !530
  store %struct.rbnode_s* %call, %struct.rbnode_s** %retval, align 8, !dbg !531
  br label %return, !dbg !531

if.end4:                                          ; preds = %if.end
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !532, metadata !DIExpression()), !dbg !533
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !534
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %8, i32 0, i32 3, !dbg !535
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %parent, align 8, !dbg !535
  store %struct.rbnode_s* %9, %struct.rbnode_s** %y, align 8, !dbg !533
  br label %while.cond, !dbg !536

while.cond:                                       ; preds = %while.body, %if.end4
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !537
  %11 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !538
  %sentinel5 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %11, i32 0, i32 1, !dbg !539
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel5, align 8, !dbg !539
  %cmp6 = icmp ne %struct.rbnode_s* %10, %12, !dbg !540
  br i1 %cmp6, label %land.rhs, label %while.end, !dbg !541

land.rhs:                                         ; preds = %while.cond
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !542
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !543
  %right7 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 5, !dbg !544
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %right7, align 8, !dbg !544
  %cmp8 = icmp eq %struct.rbnode_s* %13, %15, !dbg !545
  br i1 %cmp8, label %while.body, label %while.end, !dbg !536

while.body:                                       ; preds = %land.rhs
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !546
  store %struct.rbnode_s* %16, %struct.rbnode_s** %x.addr, align 8, !dbg !548
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !549
  %parent9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 3, !dbg !550
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %parent9, align 8, !dbg !550
  store %struct.rbnode_s* %18, %struct.rbnode_s** %y, align 8, !dbg !551
  br label %while.cond, !dbg !536, !llvm.loop !552

while.end:                                        ; preds = %while.cond, %land.rhs
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !554
  store %struct.rbnode_s* %19, %struct.rbnode_s** %retval, align 8, !dbg !555
  br label %return, !dbg !555

return:                                           ; preds = %while.end, %if.then2, %if.then
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %retval, align 8, !dbg !556
  ret %struct.rbnode_s* %20, !dbg !556
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @treetable_size(%struct.treetable_s* %table) #0 !dbg !557 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !560, metadata !DIExpression()), !dbg !561
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !562
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 2, !dbg !563
  %1 = load i64, i64* %size, align 8, !dbg !563
  ret i64 %1, !dbg !564
}

; Function Attrs: noinline nounwind uwtable
define dso_local zeroext i1 @treetable_contains_key(%struct.treetable_s* %table, i8* %key) #0 !dbg !565 {
entry:
  %retval = alloca i1, align 1
  %table.addr = alloca %struct.treetable_s*, align 8
  %key.addr = alloca i8*, align 8
  %node = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !569, metadata !DIExpression()), !dbg !570
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !571, metadata !DIExpression()), !dbg !572
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !573, metadata !DIExpression()), !dbg !574
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !575
  %1 = load i8*, i8** %key.addr, align 8, !dbg !576
  %call = call %struct.rbnode_s* @get_tree_node_by_key(%struct.treetable_s* %0, i8* %1), !dbg !577
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !574
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !578
  %tobool = icmp ne %struct.rbnode_s* %2, null, !dbg !578
  br i1 %tobool, label %if.then, label %if.end, !dbg !580

if.then:                                          ; preds = %entry
  store i1 true, i1* %retval, align 1, !dbg !581
  br label %return, !dbg !581

if.end:                                           ; preds = %entry
  store i1 false, i1* %retval, align 1, !dbg !582
  br label %return, !dbg !582

return:                                           ; preds = %if.end, %if.then
  %3 = load i1, i1* %retval, align 1, !dbg !583
  ret i1 %3, !dbg !583
}

; Function Attrs: noinline nounwind uwtable
define dso_local i64 @treetable_contains_value(%struct.treetable_s* %table, i8* %value) #0 !dbg !584 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %value.addr = alloca i8*, align 8
  %node = alloca %struct.rbnode_s*, align 8
  %o = alloca i64, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !587, metadata !DIExpression()), !dbg !588
  store i8* %value, i8** %value.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %value.addr, metadata !589, metadata !DIExpression()), !dbg !590
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node, metadata !591, metadata !DIExpression()), !dbg !592
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !593
  %1 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !594
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !595
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !595
  %call = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !596
  store %struct.rbnode_s* %call, %struct.rbnode_s** %node, align 8, !dbg !592
  call void @llvm.dbg.declare(metadata i64* %o, metadata !597, metadata !DIExpression()), !dbg !598
  store i64 0, i64* %o, align 8, !dbg !598
  br label %while.cond, !dbg !599

while.cond:                                       ; preds = %if.end, %entry
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !600
  %4 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !601
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %4, i32 0, i32 1, !dbg !602
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !602
  %cmp = icmp ne %struct.rbnode_s* %3, %5, !dbg !603
  br i1 %cmp, label %while.body, label %while.end, !dbg !599

while.body:                                       ; preds = %while.cond
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !604
  %value1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 1, !dbg !607
  %7 = load i8*, i8** %value1, align 8, !dbg !607
  %8 = load i8*, i8** %value.addr, align 8, !dbg !608
  %cmp2 = icmp eq i8* %7, %8, !dbg !609
  br i1 %cmp2, label %if.then, label %if.end, !dbg !610

if.then:                                          ; preds = %while.body
  %9 = load i64, i64* %o, align 8, !dbg !611
  %inc = add i64 %9, 1, !dbg !611
  store i64 %inc, i64* %o, align 8, !dbg !611
  br label %if.end, !dbg !612

if.end:                                           ; preds = %if.then, %while.body
  %10 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !613
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %node, align 8, !dbg !614
  %call3 = call %struct.rbnode_s* @get_successor_node(%struct.treetable_s* %10, %struct.rbnode_s* %11), !dbg !615
  store %struct.rbnode_s* %call3, %struct.rbnode_s** %node, align 8, !dbg !616
  br label %while.cond, !dbg !599, !llvm.loop !617

while.end:                                        ; preds = %while.cond
  %12 = load i64, i64* %o, align 8, !dbg !619
  ret i64 %12, !dbg !620
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @treetable_add(%struct.treetable_s* %table, i8* %key, i8* %val) #0 !dbg !621 {
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
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !624, metadata !DIExpression()), !dbg !625
  store i8* %key, i8** %key.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %key.addr, metadata !626, metadata !DIExpression()), !dbg !627
  store i8* %val, i8** %val.addr, align 8
  call void @llvm.dbg.declare(metadata i8** %val.addr, metadata !628, metadata !DIExpression()), !dbg !629
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !630, metadata !DIExpression()), !dbg !631
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !632
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !633
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !633
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !631
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x, metadata !634, metadata !DIExpression()), !dbg !635
  %2 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !636
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %2, i32 0, i32 0, !dbg !637
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !637
  store %struct.rbnode_s* %3, %struct.rbnode_s** %x, align 8, !dbg !635
  call void @llvm.dbg.declare(metadata i32* %cmp, metadata !638, metadata !DIExpression()), !dbg !639
  br label %while.cond, !dbg !640

while.cond:                                       ; preds = %if.end9, %entry
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !641
  %5 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !642
  %sentinel1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 1, !dbg !643
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel1, align 8, !dbg !643
  %cmp2 = icmp ne %struct.rbnode_s* %4, %6, !dbg !644
  br i1 %cmp2, label %while.body, label %while.end, !dbg !640

while.body:                                       ; preds = %while.cond
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !645
  %cmp3 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 3, !dbg !647
  %8 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp3, align 8, !dbg !647
  %9 = load i8*, i8** %key.addr, align 8, !dbg !648
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !649
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 0, !dbg !650
  %11 = load i8*, i8** %key4, align 8, !dbg !650
  %call = call i32 %8(i8* %9, i8* %11), !dbg !645
  store i32 %call, i32* %cmp, align 4, !dbg !651
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !652
  store %struct.rbnode_s* %12, %struct.rbnode_s** %y, align 8, !dbg !653
  %13 = load i32, i32* %cmp, align 4, !dbg !654
  %cmp5 = icmp slt i32 %13, 0, !dbg !656
  br i1 %cmp5, label %if.then, label %if.else, !dbg !657

if.then:                                          ; preds = %while.body
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !658
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 4, !dbg !660
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !660
  store %struct.rbnode_s* %15, %struct.rbnode_s** %x, align 8, !dbg !661
  br label %if.end9, !dbg !662

if.else:                                          ; preds = %while.body
  %16 = load i32, i32* %cmp, align 4, !dbg !663
  %cmp6 = icmp sgt i32 %16, 0, !dbg !665
  br i1 %cmp6, label %if.then7, label %if.else8, !dbg !666

if.then7:                                         ; preds = %if.else
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !667
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 5, !dbg !669
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !669
  store %struct.rbnode_s* %18, %struct.rbnode_s** %x, align 8, !dbg !670
  br label %if.end9

if.else8:                                         ; preds = %if.else
  %19 = load i8*, i8** %val.addr, align 8, !dbg !671
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %x, align 8, !dbg !673
  %value = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %20, i32 0, i32 1, !dbg !674
  store i8* %19, i8** %value, align 8, !dbg !675
  store i32 0, i32* %retval, align 4, !dbg !676
  br label %return, !dbg !676

if.end9:                                          ; preds = %if.then7, %if.then
  br label %while.cond, !dbg !640, !llvm.loop !677

while.end:                                        ; preds = %while.cond
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n, metadata !679, metadata !DIExpression()), !dbg !680
  %21 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !681
  %mem_alloc = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %21, i32 0, i32 4, !dbg !682
  %22 = load i8* (i64)*, i8* (i64)** %mem_alloc, align 8, !dbg !682
  %call10 = call i8* %22(i64 48), !dbg !681
  %23 = bitcast i8* %call10 to %struct.rbnode_s*, !dbg !681
  store %struct.rbnode_s* %23, %struct.rbnode_s** %n, align 8, !dbg !680
  %24 = load i8*, i8** %val.addr, align 8, !dbg !683
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !684
  %value11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %25, i32 0, i32 1, !dbg !685
  store i8* %24, i8** %value11, align 8, !dbg !686
  %26 = load i8*, i8** %key.addr, align 8, !dbg !687
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !688
  %key12 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 0, !dbg !689
  store i8* %26, i8** %key12, align 8, !dbg !690
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !691
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !692
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !693
  store %struct.rbnode_s* %28, %struct.rbnode_s** %parent, align 8, !dbg !694
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !695
  %sentinel13 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %30, i32 0, i32 1, !dbg !696
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel13, align 8, !dbg !696
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !697
  %left14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 4, !dbg !698
  store %struct.rbnode_s* %31, %struct.rbnode_s** %left14, align 8, !dbg !699
  %33 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !700
  %sentinel15 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %33, i32 0, i32 1, !dbg !701
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel15, align 8, !dbg !701
  %35 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !702
  %right16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %35, i32 0, i32 5, !dbg !703
  store %struct.rbnode_s* %34, %struct.rbnode_s** %right16, align 8, !dbg !704
  %36 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !705
  %size = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %36, i32 0, i32 2, !dbg !706
  %37 = load i64, i64* %size, align 8, !dbg !707
  %inc = add i64 %37, 1, !dbg !707
  store i64 %inc, i64* %size, align 8, !dbg !707
  %38 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !708
  %39 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !710
  %sentinel17 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %39, i32 0, i32 1, !dbg !711
  %40 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel17, align 8, !dbg !711
  %cmp18 = icmp eq %struct.rbnode_s* %38, %40, !dbg !712
  br i1 %cmp18, label %if.then19, label %if.else21, !dbg !713

if.then19:                                        ; preds = %while.end
  %41 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !714
  %42 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !716
  %root20 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %42, i32 0, i32 0, !dbg !717
  store %struct.rbnode_s* %41, %struct.rbnode_s** %root20, align 8, !dbg !718
  %43 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !719
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %43, i32 0, i32 2, !dbg !720
  store i8 1, i8* %color, align 8, !dbg !721
  br label %if.end32, !dbg !722

if.else21:                                        ; preds = %while.end
  %44 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !723
  %color22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %44, i32 0, i32 2, !dbg !725
  store i8 0, i8* %color22, align 8, !dbg !726
  %45 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !727
  %cmp23 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %45, i32 0, i32 3, !dbg !729
  %46 = load i32 (i8*, i8*)*, i32 (i8*, i8*)** %cmp23, align 8, !dbg !729
  %47 = load i8*, i8** %key.addr, align 8, !dbg !730
  %48 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !731
  %key24 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %48, i32 0, i32 0, !dbg !732
  %49 = load i8*, i8** %key24, align 8, !dbg !732
  %call25 = call i32 %46(i8* %47, i8* %49), !dbg !727
  %cmp26 = icmp slt i32 %call25, 0, !dbg !733
  br i1 %cmp26, label %if.then27, label %if.else29, !dbg !734

if.then27:                                        ; preds = %if.else21
  %50 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !735
  %51 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !737
  %left28 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %51, i32 0, i32 4, !dbg !738
  store %struct.rbnode_s* %50, %struct.rbnode_s** %left28, align 8, !dbg !739
  br label %if.end31, !dbg !740

if.else29:                                        ; preds = %if.else21
  %52 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !741
  %53 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !743
  %right30 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %53, i32 0, i32 5, !dbg !744
  store %struct.rbnode_s* %52, %struct.rbnode_s** %right30, align 8, !dbg !745
  br label %if.end31

if.end31:                                         ; preds = %if.else29, %if.then27
  %54 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !746
  %55 = load %struct.rbnode_s*, %struct.rbnode_s** %n, align 8, !dbg !747
  call void @rebalance_after_insert(%struct.treetable_s* %54, %struct.rbnode_s* %55), !dbg !748
  br label %if.end32

if.end32:                                         ; preds = %if.end31, %if.then19
  store i32 0, i32* %retval, align 4, !dbg !749
  br label %return, !dbg !749

return:                                           ; preds = %if.end32, %if.else8
  %56 = load i32, i32* %retval, align 4, !dbg !750
  ret i32 %56, !dbg !750
}

; Function Attrs: noinline nounwind uwtable
define internal void @rebalance_after_insert(%struct.treetable_s* %table, %struct.rbnode_s* %z) #0 !dbg !751 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %z.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !752, metadata !DIExpression()), !dbg !753
  store %struct.rbnode_s* %z, %struct.rbnode_s** %z.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %z.addr, metadata !754, metadata !DIExpression()), !dbg !755
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !756, metadata !DIExpression()), !dbg !757
  br label %while.cond, !dbg !758

while.cond:                                       ; preds = %if.end69, %entry
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !759
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 3, !dbg !760
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %parent, align 8, !dbg !760
  %color = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %1, i32 0, i32 2, !dbg !761
  %2 = load i8, i8* %color, align 8, !dbg !761
  %conv = sext i8 %2 to i32, !dbg !759
  %cmp = icmp eq i32 %conv, 0, !dbg !762
  br i1 %cmp, label %while.body, label %while.end, !dbg !758

while.body:                                       ; preds = %while.cond
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !763
  %parent2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %3, i32 0, i32 3, !dbg !766
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %parent2, align 8, !dbg !766
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !767
  %parent3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 3, !dbg !768
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %parent3, align 8, !dbg !768
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 3, !dbg !769
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !769
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 4, !dbg !770
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !770
  %cmp5 = icmp eq %struct.rbnode_s* %4, %8, !dbg !771
  br i1 %cmp5, label %if.then, label %if.else36, !dbg !772

if.then:                                          ; preds = %while.body
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !773
  %parent7 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %9, i32 0, i32 3, !dbg !775
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %parent7, align 8, !dbg !775
  %parent8 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 3, !dbg !776
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %parent8, align 8, !dbg !776
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 5, !dbg !777
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !777
  store %struct.rbnode_s* %12, %struct.rbnode_s** %y, align 8, !dbg !778
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !779
  %color9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %13, i32 0, i32 2, !dbg !781
  %14 = load i8, i8* %color9, align 8, !dbg !781
  %conv10 = sext i8 %14 to i32, !dbg !779
  %cmp11 = icmp eq i32 %conv10, 0, !dbg !782
  br i1 %cmp11, label %if.then13, label %if.else, !dbg !783

if.then13:                                        ; preds = %if.then
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !784
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !786
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !786
  %color15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %16, i32 0, i32 2, !dbg !787
  store i8 1, i8* %color15, align 8, !dbg !788
  %17 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !789
  %color16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %17, i32 0, i32 2, !dbg !790
  store i8 1, i8* %color16, align 8, !dbg !791
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !792
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %18, i32 0, i32 3, !dbg !793
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !793
  %parent18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %19, i32 0, i32 3, !dbg !794
  %20 = load %struct.rbnode_s*, %struct.rbnode_s** %parent18, align 8, !dbg !794
  %color19 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %20, i32 0, i32 2, !dbg !795
  store i8 0, i8* %color19, align 8, !dbg !796
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !797
  %parent20 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %21, i32 0, i32 3, !dbg !798
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %parent20, align 8, !dbg !798
  %parent21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !799
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent21, align 8, !dbg !799
  store %struct.rbnode_s* %23, %struct.rbnode_s** %z.addr, align 8, !dbg !800
  br label %if.end69, !dbg !801

if.else:                                          ; preds = %if.then
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !802
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !805
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %25, i32 0, i32 3, !dbg !806
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %parent22, align 8, !dbg !806
  %right23 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 5, !dbg !807
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %right23, align 8, !dbg !807
  %cmp24 = icmp eq %struct.rbnode_s* %24, %27, !dbg !808
  br i1 %cmp24, label %if.then26, label %if.end, !dbg !809

if.then26:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !810
  %parent27 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %28, i32 0, i32 3, !dbg !812
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %parent27, align 8, !dbg !812
  store %struct.rbnode_s* %29, %struct.rbnode_s** %z.addr, align 8, !dbg !813
  %30 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !814
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !815
  call void @rotate_left(%struct.treetable_s* %30, %struct.rbnode_s* %31), !dbg !816
  br label %if.end, !dbg !817

if.end:                                           ; preds = %if.then26, %if.else
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !818
  %parent28 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 3, !dbg !819
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %parent28, align 8, !dbg !819
  %color29 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %33, i32 0, i32 2, !dbg !820
  store i8 1, i8* %color29, align 8, !dbg !821
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !822
  %parent30 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !823
  %35 = load %struct.rbnode_s*, %struct.rbnode_s** %parent30, align 8, !dbg !823
  %parent31 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %35, i32 0, i32 3, !dbg !824
  %36 = load %struct.rbnode_s*, %struct.rbnode_s** %parent31, align 8, !dbg !824
  %color32 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %36, i32 0, i32 2, !dbg !825
  store i8 0, i8* %color32, align 8, !dbg !826
  %37 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !827
  %38 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !828
  %parent33 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %38, i32 0, i32 3, !dbg !829
  %39 = load %struct.rbnode_s*, %struct.rbnode_s** %parent33, align 8, !dbg !829
  %parent34 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %39, i32 0, i32 3, !dbg !830
  %40 = load %struct.rbnode_s*, %struct.rbnode_s** %parent34, align 8, !dbg !830
  call void @rotate_right(%struct.treetable_s* %37, %struct.rbnode_s* %40), !dbg !831
  br label %if.end69

if.else36:                                        ; preds = %while.body
  %41 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !832
  %parent37 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %41, i32 0, i32 3, !dbg !834
  %42 = load %struct.rbnode_s*, %struct.rbnode_s** %parent37, align 8, !dbg !834
  %parent38 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %42, i32 0, i32 3, !dbg !835
  %43 = load %struct.rbnode_s*, %struct.rbnode_s** %parent38, align 8, !dbg !835
  %left39 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %43, i32 0, i32 4, !dbg !836
  %44 = load %struct.rbnode_s*, %struct.rbnode_s** %left39, align 8, !dbg !836
  store %struct.rbnode_s* %44, %struct.rbnode_s** %y, align 8, !dbg !837
  %45 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !838
  %color40 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %45, i32 0, i32 2, !dbg !840
  %46 = load i8, i8* %color40, align 8, !dbg !840
  %conv41 = sext i8 %46 to i32, !dbg !838
  %cmp42 = icmp eq i32 %conv41, 0, !dbg !841
  br i1 %cmp42, label %if.then44, label %if.else53, !dbg !842

if.then44:                                        ; preds = %if.else36
  %47 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !843
  %parent45 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %47, i32 0, i32 3, !dbg !845
  %48 = load %struct.rbnode_s*, %struct.rbnode_s** %parent45, align 8, !dbg !845
  %color46 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %48, i32 0, i32 2, !dbg !846
  store i8 1, i8* %color46, align 8, !dbg !847
  %49 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !848
  %color47 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %49, i32 0, i32 2, !dbg !849
  store i8 1, i8* %color47, align 8, !dbg !850
  %50 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !851
  %parent48 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %50, i32 0, i32 3, !dbg !852
  %51 = load %struct.rbnode_s*, %struct.rbnode_s** %parent48, align 8, !dbg !852
  %parent49 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %51, i32 0, i32 3, !dbg !853
  %52 = load %struct.rbnode_s*, %struct.rbnode_s** %parent49, align 8, !dbg !853
  %color50 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %52, i32 0, i32 2, !dbg !854
  store i8 0, i8* %color50, align 8, !dbg !855
  %53 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !856
  %parent51 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %53, i32 0, i32 3, !dbg !857
  %54 = load %struct.rbnode_s*, %struct.rbnode_s** %parent51, align 8, !dbg !857
  %parent52 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %54, i32 0, i32 3, !dbg !858
  %55 = load %struct.rbnode_s*, %struct.rbnode_s** %parent52, align 8, !dbg !858
  store %struct.rbnode_s* %55, %struct.rbnode_s** %z.addr, align 8, !dbg !859
  br label %if.end69, !dbg !860

if.else53:                                        ; preds = %if.else36
  %56 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !861
  %57 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !864
  %parent54 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %57, i32 0, i32 3, !dbg !865
  %58 = load %struct.rbnode_s*, %struct.rbnode_s** %parent54, align 8, !dbg !865
  %left55 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %58, i32 0, i32 4, !dbg !866
  %59 = load %struct.rbnode_s*, %struct.rbnode_s** %left55, align 8, !dbg !866
  %cmp56 = icmp eq %struct.rbnode_s* %56, %59, !dbg !867
  br i1 %cmp56, label %if.then58, label %if.end60, !dbg !868

if.then58:                                        ; preds = %if.else53
  %60 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !869
  %parent59 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %60, i32 0, i32 3, !dbg !871
  %61 = load %struct.rbnode_s*, %struct.rbnode_s** %parent59, align 8, !dbg !871
  store %struct.rbnode_s* %61, %struct.rbnode_s** %z.addr, align 8, !dbg !872
  %62 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !873
  %63 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !874
  call void @rotate_right(%struct.treetable_s* %62, %struct.rbnode_s* %63), !dbg !875
  br label %if.end60, !dbg !876

if.end60:                                         ; preds = %if.then58, %if.else53
  %64 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !877
  %parent61 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %64, i32 0, i32 3, !dbg !878
  %65 = load %struct.rbnode_s*, %struct.rbnode_s** %parent61, align 8, !dbg !878
  %color62 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %65, i32 0, i32 2, !dbg !879
  store i8 1, i8* %color62, align 8, !dbg !880
  %66 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !881
  %parent63 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %66, i32 0, i32 3, !dbg !882
  %67 = load %struct.rbnode_s*, %struct.rbnode_s** %parent63, align 8, !dbg !882
  %parent64 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %67, i32 0, i32 3, !dbg !883
  %68 = load %struct.rbnode_s*, %struct.rbnode_s** %parent64, align 8, !dbg !883
  %color65 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %68, i32 0, i32 2, !dbg !884
  store i8 0, i8* %color65, align 8, !dbg !885
  %69 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !886
  %70 = load %struct.rbnode_s*, %struct.rbnode_s** %z.addr, align 8, !dbg !887
  %parent66 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %70, i32 0, i32 3, !dbg !888
  %71 = load %struct.rbnode_s*, %struct.rbnode_s** %parent66, align 8, !dbg !888
  %parent67 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %71, i32 0, i32 3, !dbg !889
  %72 = load %struct.rbnode_s*, %struct.rbnode_s** %parent67, align 8, !dbg !889
  call void @rotate_left(%struct.treetable_s* %69, %struct.rbnode_s* %72), !dbg !890
  br label %if.end69

if.end69:                                         ; preds = %if.then44, %if.end60, %if.then13, %if.end
  br label %while.cond, !dbg !758, !llvm.loop !891

while.end:                                        ; preds = %while.cond
  %73 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !893
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %73, i32 0, i32 0, !dbg !894
  %74 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !894
  %color70 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %74, i32 0, i32 2, !dbg !895
  store i8 1, i8* %color70, align 8, !dbg !896
  ret void, !dbg !897
}

; Function Attrs: noinline nounwind uwtable
define internal void @rotate_left(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !898 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !899, metadata !DIExpression()), !dbg !900
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !901, metadata !DIExpression()), !dbg !902
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !903, metadata !DIExpression()), !dbg !904
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !905
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 5, !dbg !906
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !906
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !904
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !907
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 4, !dbg !908
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !908
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !909
  %right1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 5, !dbg !910
  store %struct.rbnode_s* %3, %struct.rbnode_s** %right1, align 8, !dbg !911
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !912
  %left2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 4, !dbg !914
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %left2, align 8, !dbg !914
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !915
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 1, !dbg !916
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !916
  %cmp = icmp ne %struct.rbnode_s* %6, %8, !dbg !917
  br i1 %cmp, label %if.then, label %if.end, !dbg !918

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !919
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !920
  %left3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 4, !dbg !921
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %left3, align 8, !dbg !921
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 3, !dbg !922
  store %struct.rbnode_s* %9, %struct.rbnode_s** %parent, align 8, !dbg !923
  br label %if.end, !dbg !920

if.end:                                           ; preds = %if.then, %entry
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !924
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 3, !dbg !925
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !925
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !926
  %parent5 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 3, !dbg !927
  store %struct.rbnode_s* %13, %struct.rbnode_s** %parent5, align 8, !dbg !928
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !929
  %parent6 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !931
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent6, align 8, !dbg !931
  %17 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !932
  %sentinel7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !933
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel7, align 8, !dbg !933
  %cmp8 = icmp eq %struct.rbnode_s* %16, %18, !dbg !934
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !935

if.then9:                                         ; preds = %if.end
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !936
  %20 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !937
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %20, i32 0, i32 0, !dbg !938
  store %struct.rbnode_s* %19, %struct.rbnode_s** %root, align 8, !dbg !939
  br label %if.end20, !dbg !937

if.else:                                          ; preds = %if.end
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !940
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !942
  %parent10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !943
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent10, align 8, !dbg !943
  %left11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %23, i32 0, i32 4, !dbg !944
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %left11, align 8, !dbg !944
  %cmp12 = icmp eq %struct.rbnode_s* %21, %24, !dbg !945
  br i1 %cmp12, label %if.then13, label %if.else16, !dbg !946

if.then13:                                        ; preds = %if.else
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !947
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !948
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 3, !dbg !949
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !949
  %left15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 4, !dbg !950
  store %struct.rbnode_s* %25, %struct.rbnode_s** %left15, align 8, !dbg !951
  br label %if.end20, !dbg !948

if.else16:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !952
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !953
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !954
  %30 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !954
  %right18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %30, i32 0, i32 5, !dbg !955
  store %struct.rbnode_s* %28, %struct.rbnode_s** %right18, align 8, !dbg !956
  br label %if.end20

if.end20:                                         ; preds = %if.then13, %if.else16, %if.then9
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !957
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !958
  %left21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 4, !dbg !959
  store %struct.rbnode_s* %31, %struct.rbnode_s** %left21, align 8, !dbg !960
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !961
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !962
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !963
  store %struct.rbnode_s* %33, %struct.rbnode_s** %parent22, align 8, !dbg !964
  ret void, !dbg !965
}

; Function Attrs: noinline nounwind uwtable
define internal void @rotate_right(%struct.treetable_s* %table, %struct.rbnode_s* %x) #0 !dbg !966 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %x.addr = alloca %struct.rbnode_s*, align 8
  %y = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !967, metadata !DIExpression()), !dbg !968
  store %struct.rbnode_s* %x, %struct.rbnode_s** %x.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %x.addr, metadata !969, metadata !DIExpression()), !dbg !970
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %y, metadata !971, metadata !DIExpression()), !dbg !972
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !973
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %0, i32 0, i32 4, !dbg !974
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !974
  store %struct.rbnode_s* %1, %struct.rbnode_s** %y, align 8, !dbg !972
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !975
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 5, !dbg !976
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !976
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !977
  %left1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !978
  store %struct.rbnode_s* %3, %struct.rbnode_s** %left1, align 8, !dbg !979
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !980
  %right2 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 5, !dbg !982
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %right2, align 8, !dbg !982
  %7 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !983
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %7, i32 0, i32 1, !dbg !984
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !984
  %cmp = icmp ne %struct.rbnode_s* %6, %8, !dbg !985
  br i1 %cmp, label %if.then, label %if.end, !dbg !986

if.then:                                          ; preds = %entry
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !987
  %10 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !988
  %right3 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %10, i32 0, i32 5, !dbg !989
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %right3, align 8, !dbg !989
  %parent = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %11, i32 0, i32 3, !dbg !990
  store %struct.rbnode_s* %9, %struct.rbnode_s** %parent, align 8, !dbg !991
  br label %if.end, !dbg !988

if.end:                                           ; preds = %if.then, %entry
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !992
  %parent4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 3, !dbg !993
  %13 = load %struct.rbnode_s*, %struct.rbnode_s** %parent4, align 8, !dbg !993
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !994
  %parent5 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 3, !dbg !995
  store %struct.rbnode_s* %13, %struct.rbnode_s** %parent5, align 8, !dbg !996
  %15 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !997
  %parent6 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %15, i32 0, i32 3, !dbg !999
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %parent6, align 8, !dbg !999
  %17 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !1000
  %sentinel7 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !1001
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel7, align 8, !dbg !1001
  %cmp8 = icmp eq %struct.rbnode_s* %16, %18, !dbg !1002
  br i1 %cmp8, label %if.then9, label %if.else, !dbg !1003

if.then9:                                         ; preds = %if.end
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1004
  %20 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !1005
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %20, i32 0, i32 0, !dbg !1006
  store %struct.rbnode_s* %19, %struct.rbnode_s** %root, align 8, !dbg !1007
  br label %if.end20, !dbg !1005

if.else:                                          ; preds = %if.end
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1008
  %22 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1010
  %parent10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %22, i32 0, i32 3, !dbg !1011
  %23 = load %struct.rbnode_s*, %struct.rbnode_s** %parent10, align 8, !dbg !1011
  %right11 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %23, i32 0, i32 5, !dbg !1012
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %right11, align 8, !dbg !1012
  %cmp12 = icmp eq %struct.rbnode_s* %21, %24, !dbg !1013
  br i1 %cmp12, label %if.then13, label %if.else16, !dbg !1014

if.then13:                                        ; preds = %if.else
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1015
  %26 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1016
  %parent14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %26, i32 0, i32 3, !dbg !1017
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %parent14, align 8, !dbg !1017
  %right15 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 5, !dbg !1018
  store %struct.rbnode_s* %25, %struct.rbnode_s** %right15, align 8, !dbg !1019
  br label %if.end20, !dbg !1016

if.else16:                                        ; preds = %if.else
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1020
  %29 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1021
  %parent17 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %29, i32 0, i32 3, !dbg !1022
  %30 = load %struct.rbnode_s*, %struct.rbnode_s** %parent17, align 8, !dbg !1022
  %left18 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %30, i32 0, i32 4, !dbg !1023
  store %struct.rbnode_s* %28, %struct.rbnode_s** %left18, align 8, !dbg !1024
  br label %if.end20

if.end20:                                         ; preds = %if.then13, %if.else16, %if.then9
  %31 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1025
  %32 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1026
  %right21 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %32, i32 0, i32 5, !dbg !1027
  store %struct.rbnode_s* %31, %struct.rbnode_s** %right21, align 8, !dbg !1028
  %33 = load %struct.rbnode_s*, %struct.rbnode_s** %y, align 8, !dbg !1029
  %34 = load %struct.rbnode_s*, %struct.rbnode_s** %x.addr, align 8, !dbg !1030
  %parent22 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %34, i32 0, i32 3, !dbg !1031
  store %struct.rbnode_s* %33, %struct.rbnode_s** %parent22, align 8, !dbg !1032
  ret void, !dbg !1033
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @balanced(%struct.treetable_s* %t) #0 !dbg !1034 {
entry:
  %t.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1037, metadata !DIExpression()), !dbg !1038
  %0 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1039
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1040
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !1041
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !1041
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 4, !dbg !1042
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1042
  %call = call i32 @height(%struct.treetable_s* %0, %struct.rbnode_s* %3), !dbg !1043
  %4 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1044
  %5 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1045
  %root1 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %5, i32 0, i32 0, !dbg !1046
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %root1, align 8, !dbg !1046
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %6, i32 0, i32 5, !dbg !1047
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1047
  %call2 = call i32 @height(%struct.treetable_s* %4, %struct.rbnode_s* %7), !dbg !1048
  %sub = sub nsw i32 %call, %call2, !dbg !1049
  %call3 = call i32 @abs(i32 %sub) #7, !dbg !1050
  %cmp = icmp sle i32 %call3, 1, !dbg !1051
  %conv = zext i1 %cmp to i32, !dbg !1051
  ret i32 %conv, !dbg !1052
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @height(%struct.treetable_s* %t, %struct.rbnode_s* %node) #0 !dbg !1053 {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca %struct.treetable_s*, align 8
  %node.addr = alloca %struct.rbnode_s*, align 8
  %leftHeight = alloca i32, align 4
  %rightHeight = alloca i32, align 4
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1056, metadata !DIExpression()), !dbg !1057
  store %struct.rbnode_s* %node, %struct.rbnode_s** %node.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node.addr, metadata !1058, metadata !DIExpression()), !dbg !1059
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1060
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1062
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !1063
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1063
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !1064
  br i1 %cmp, label %if.then, label %if.end, !dbg !1065

if.then:                                          ; preds = %entry
  store i32 0, i32* %retval, align 4, !dbg !1066
  br label %return, !dbg !1066

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata i32* %leftHeight, metadata !1067, metadata !DIExpression()), !dbg !1068
  %3 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1069
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1070
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !1071
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1071
  %call = call i32 @height(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !1072
  store i32 %call, i32* %leftHeight, align 4, !dbg !1068
  call void @llvm.dbg.declare(metadata i32* %rightHeight, metadata !1073, metadata !DIExpression()), !dbg !1074
  %6 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1075
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1076
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !1077
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1077
  %call1 = call i32 @height(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !1078
  store i32 %call1, i32* %rightHeight, align 4, !dbg !1074
  %9 = load i32, i32* %leftHeight, align 4, !dbg !1079
  %10 = load i32, i32* %rightHeight, align 4, !dbg !1080
  %cmp2 = icmp sgt i32 %9, %10, !dbg !1081
  %11 = load i32, i32* %leftHeight, align 4, !dbg !1079
  %add = add nsw i32 %11, 1, !dbg !1079
  %12 = load i32, i32* %rightHeight, align 4, !dbg !1079
  %add3 = add nsw i32 %12, 1, !dbg !1079
  %cond = select i1 %cmp2, i32 %add, i32 %add3, !dbg !1079
  store i32 %cond, i32* %retval, align 4, !dbg !1082
  br label %return, !dbg !1082

return:                                           ; preds = %if.end, %if.then
  %13 = load i32, i32* %retval, align 4, !dbg !1083
  ret i32 %13, !dbg !1083
}

; Function Attrs: nounwind readnone willreturn
declare dso_local i32 @abs(i32) #5

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @sorted(%struct.treetable_s* %t) #0 !dbg !1084 {
entry:
  %t.addr = alloca %struct.treetable_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1085, metadata !DIExpression()), !dbg !1086
  %0 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1087
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1088
  %root = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 0, !dbg !1089
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %root, align 8, !dbg !1089
  %call = call i32 @isSorted(%struct.treetable_s* %0, %struct.rbnode_s* %2), !dbg !1090
  ret i32 %call, !dbg !1091
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @isSorted(%struct.treetable_s* %t, %struct.rbnode_s* %node) #0 !dbg !1092 {
entry:
  %retval = alloca i32, align 4
  %t.addr = alloca %struct.treetable_s*, align 8
  %node.addr = alloca %struct.rbnode_s*, align 8
  %maxLeft = alloca %struct.rbnode_s*, align 8
  %minRight = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %t, %struct.treetable_s** %t.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %t.addr, metadata !1093, metadata !DIExpression()), !dbg !1094
  store %struct.rbnode_s* %node, %struct.rbnode_s** %node.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %node.addr, metadata !1095, metadata !DIExpression()), !dbg !1096
  %0 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1097
  %1 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1099
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %1, i32 0, i32 1, !dbg !1100
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1100
  %cmp = icmp eq %struct.rbnode_s* %0, %2, !dbg !1101
  br i1 %cmp, label %if.then, label %if.end, !dbg !1102

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval, align 4, !dbg !1103
  br label %return, !dbg !1103

if.end:                                           ; preds = %entry
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %maxLeft, metadata !1104, metadata !DIExpression()), !dbg !1105
  %3 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1106
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1107
  %left = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %4, i32 0, i32 4, !dbg !1108
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %left, align 8, !dbg !1108
  %call = call %struct.rbnode_s* @tree_max(%struct.treetable_s* %3, %struct.rbnode_s* %5), !dbg !1109
  store %struct.rbnode_s* %call, %struct.rbnode_s** %maxLeft, align 8, !dbg !1105
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %minRight, metadata !1110, metadata !DIExpression()), !dbg !1111
  %6 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1112
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1113
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %7, i32 0, i32 5, !dbg !1114
  %8 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1114
  %call1 = call %struct.rbnode_s* @tree_min(%struct.treetable_s* %6, %struct.rbnode_s* %8), !dbg !1115
  store %struct.rbnode_s* %call1, %struct.rbnode_s** %minRight, align 8, !dbg !1111
  %9 = load %struct.rbnode_s*, %struct.rbnode_s** %maxLeft, align 8, !dbg !1116
  %10 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1118
  %sentinel2 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %10, i32 0, i32 1, !dbg !1119
  %11 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel2, align 8, !dbg !1119
  %cmp3 = icmp ne %struct.rbnode_s* %9, %11, !dbg !1120
  br i1 %cmp3, label %land.lhs.true, label %lor.lhs.false, !dbg !1121

land.lhs.true:                                    ; preds = %if.end
  %12 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1122
  %key = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %12, i32 0, i32 0, !dbg !1123
  %13 = load i8*, i8** %key, align 8, !dbg !1123
  %14 = load %struct.rbnode_s*, %struct.rbnode_s** %maxLeft, align 8, !dbg !1124
  %key4 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %14, i32 0, i32 0, !dbg !1125
  %15 = load i8*, i8** %key4, align 8, !dbg !1125
  %cmp5 = icmp ult i8* %13, %15, !dbg !1126
  br i1 %cmp5, label %if.then12, label %lor.lhs.false, !dbg !1127

lor.lhs.false:                                    ; preds = %land.lhs.true, %if.end
  %16 = load %struct.rbnode_s*, %struct.rbnode_s** %minRight, align 8, !dbg !1128
  %17 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1129
  %sentinel6 = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %17, i32 0, i32 1, !dbg !1130
  %18 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel6, align 8, !dbg !1130
  %cmp7 = icmp ne %struct.rbnode_s* %16, %18, !dbg !1131
  br i1 %cmp7, label %land.lhs.true8, label %if.end13, !dbg !1132

land.lhs.true8:                                   ; preds = %lor.lhs.false
  %19 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1133
  %key9 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %19, i32 0, i32 0, !dbg !1134
  %20 = load i8*, i8** %key9, align 8, !dbg !1134
  %21 = load %struct.rbnode_s*, %struct.rbnode_s** %minRight, align 8, !dbg !1135
  %key10 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %21, i32 0, i32 0, !dbg !1136
  %22 = load i8*, i8** %key10, align 8, !dbg !1136
  %cmp11 = icmp ugt i8* %20, %22, !dbg !1137
  br i1 %cmp11, label %if.then12, label %if.end13, !dbg !1138

if.then12:                                        ; preds = %land.lhs.true8, %land.lhs.true
  store i32 0, i32* %retval, align 4, !dbg !1139
  br label %return, !dbg !1139

if.end13:                                         ; preds = %land.lhs.true8, %lor.lhs.false
  %23 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1140
  %24 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1141
  %left14 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %24, i32 0, i32 4, !dbg !1142
  %25 = load %struct.rbnode_s*, %struct.rbnode_s** %left14, align 8, !dbg !1142
  %call15 = call i32 @isSorted(%struct.treetable_s* %23, %struct.rbnode_s* %25), !dbg !1143
  %tobool = icmp ne i32 %call15, 0, !dbg !1143
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !1144

land.rhs:                                         ; preds = %if.end13
  %26 = load %struct.treetable_s*, %struct.treetable_s** %t.addr, align 8, !dbg !1145
  %27 = load %struct.rbnode_s*, %struct.rbnode_s** %node.addr, align 8, !dbg !1146
  %right16 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %27, i32 0, i32 5, !dbg !1147
  %28 = load %struct.rbnode_s*, %struct.rbnode_s** %right16, align 8, !dbg !1147
  %call17 = call i32 @isSorted(%struct.treetable_s* %26, %struct.rbnode_s* %28), !dbg !1148
  %tobool18 = icmp ne i32 %call17, 0, !dbg !1144
  br label %land.end

land.end:                                         ; preds = %land.rhs, %if.end13
  %29 = phi i1 [ false, %if.end13 ], [ %tobool18, %land.rhs ], !dbg !1149
  %land.ext = zext i1 %29 to i32, !dbg !1144
  store i32 %land.ext, i32* %retval, align 4, !dbg !1150
  br label %return, !dbg !1150

return:                                           ; preds = %land.end, %if.then12, %if.then
  %30 = load i32, i32* %retval, align 4, !dbg !1151
  ret i32 %30, !dbg !1151
}

; Function Attrs: noinline nounwind uwtable
define internal %struct.rbnode_s* @tree_max(%struct.treetable_s* %table, %struct.rbnode_s* %n) #0 !dbg !1152 {
entry:
  %table.addr = alloca %struct.treetable_s*, align 8
  %n.addr = alloca %struct.rbnode_s*, align 8
  %s = alloca %struct.rbnode_s*, align 8
  store %struct.treetable_s* %table, %struct.treetable_s** %table.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.treetable_s** %table.addr, metadata !1153, metadata !DIExpression()), !dbg !1154
  store %struct.rbnode_s* %n, %struct.rbnode_s** %n.addr, align 8
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %n.addr, metadata !1155, metadata !DIExpression()), !dbg !1156
  call void @llvm.dbg.declare(metadata %struct.rbnode_s** %s, metadata !1157, metadata !DIExpression()), !dbg !1158
  %0 = load %struct.treetable_s*, %struct.treetable_s** %table.addr, align 8, !dbg !1159
  %sentinel = getelementptr inbounds %struct.treetable_s, %struct.treetable_s* %0, i32 0, i32 1, !dbg !1160
  %1 = load %struct.rbnode_s*, %struct.rbnode_s** %sentinel, align 8, !dbg !1160
  store %struct.rbnode_s* %1, %struct.rbnode_s** %s, align 8, !dbg !1158
  br label %while.cond, !dbg !1161

while.cond:                                       ; preds = %while.body, %entry
  %2 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1162
  %right = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %2, i32 0, i32 5, !dbg !1163
  %3 = load %struct.rbnode_s*, %struct.rbnode_s** %right, align 8, !dbg !1163
  %4 = load %struct.rbnode_s*, %struct.rbnode_s** %s, align 8, !dbg !1164
  %cmp = icmp ne %struct.rbnode_s* %3, %4, !dbg !1165
  br i1 %cmp, label %while.body, label %while.end, !dbg !1161

while.body:                                       ; preds = %while.cond
  %5 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1166
  %right1 = getelementptr inbounds %struct.rbnode_s, %struct.rbnode_s* %5, i32 0, i32 5, !dbg !1167
  %6 = load %struct.rbnode_s*, %struct.rbnode_s** %right1, align 8, !dbg !1167
  store %struct.rbnode_s* %6, %struct.rbnode_s** %n.addr, align 8, !dbg !1168
  br label %while.cond, !dbg !1161, !llvm.loop !1169

while.end:                                        ; preds = %while.cond
  %7 = load %struct.rbnode_s*, %struct.rbnode_s** %n.addr, align 8, !dbg !1170
  ret %struct.rbnode_s* %7, !dbg !1171
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
!1 = !DIFile(filename: "get_first_key.c", directory: "/home/klee/klee_src/examples/trabalho2/Ex2SymbTestSuite")
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
!63 = !DILocalVariable(name: "ccStat", scope: !32, file: !1, line: 19, type: !18)
!64 = !DILocation(line: 19, column: 9, scope: !32)
!65 = !DILocalVariable(name: "outputKey", scope: !32, file: !1, line: 20, type: !25)
!66 = !DILocation(line: 20, column: 11, scope: !32)
!67 = !DILocation(line: 22, column: 24, scope: !32)
!68 = !DILocation(line: 22, column: 5, scope: !32)
!69 = !DILocation(line: 23, column: 24, scope: !32)
!70 = !DILocation(line: 23, column: 5, scope: !32)
!71 = !DILocation(line: 26, column: 38, scope: !32)
!72 = !DILocation(line: 26, column: 14, scope: !32)
!73 = !DILocation(line: 26, column: 12, scope: !32)
!74 = !DILocation(line: 27, column: 5, scope: !75)
!75 = distinct !DILexicalBlock(scope: !76, file: !1, line: 27, column: 5)
!76 = distinct !DILexicalBlock(scope: !32, file: !1, line: 27, column: 5)
!77 = !DILocation(line: 27, column: 5, scope: !76)
!78 = !DILocation(line: 29, column: 19, scope: !32)
!79 = !DILocation(line: 29, column: 26, scope: !32)
!80 = !DILocation(line: 29, column: 33, scope: !32)
!81 = !DILocation(line: 29, column: 5, scope: !32)
!82 = !DILocation(line: 30, column: 38, scope: !32)
!83 = !DILocation(line: 30, column: 14, scope: !32)
!84 = !DILocation(line: 30, column: 12, scope: !32)
!85 = !DILocation(line: 31, column: 5, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !1, line: 31, column: 5)
!87 = distinct !DILexicalBlock(scope: !32, file: !1, line: 31, column: 5)
!88 = !DILocation(line: 31, column: 5, scope: !87)
!89 = !DILocation(line: 32, column: 5, scope: !90)
!90 = distinct !DILexicalBlock(scope: !91, file: !1, line: 32, column: 5)
!91 = distinct !DILexicalBlock(scope: !32, file: !1, line: 32, column: 5)
!92 = !DILocation(line: 32, column: 5, scope: !91)
!93 = !DILocation(line: 35, column: 19, scope: !32)
!94 = !DILocation(line: 35, column: 26, scope: !32)
!95 = !DILocation(line: 35, column: 33, scope: !32)
!96 = !DILocation(line: 35, column: 5, scope: !32)
!97 = !DILocation(line: 36, column: 38, scope: !32)
!98 = !DILocation(line: 36, column: 14, scope: !32)
!99 = !DILocation(line: 36, column: 12, scope: !32)
!100 = !DILocation(line: 37, column: 5, scope: !101)
!101 = distinct !DILexicalBlock(scope: !102, file: !1, line: 37, column: 5)
!102 = distinct !DILexicalBlock(scope: !32, file: !1, line: 37, column: 5)
!103 = !DILocation(line: 37, column: 5, scope: !102)
!104 = !DILocation(line: 38, column: 9, scope: !105)
!105 = distinct !DILexicalBlock(scope: !32, file: !1, line: 38, column: 9)
!106 = !DILocation(line: 38, column: 17, scope: !105)
!107 = !DILocation(line: 38, column: 14, scope: !105)
!108 = !DILocation(line: 38, column: 9, scope: !32)
!109 = !DILocation(line: 39, column: 9, scope: !110)
!110 = distinct !DILexicalBlock(scope: !111, file: !1, line: 39, column: 9)
!111 = distinct !DILexicalBlock(scope: !112, file: !1, line: 39, column: 9)
!112 = distinct !DILexicalBlock(scope: !105, file: !1, line: 38, column: 23)
!113 = !DILocation(line: 39, column: 9, scope: !111)
!114 = !DILocation(line: 41, column: 9, scope: !115)
!115 = distinct !DILexicalBlock(scope: !116, file: !1, line: 41, column: 9)
!116 = distinct !DILexicalBlock(scope: !117, file: !1, line: 41, column: 9)
!117 = distinct !DILexicalBlock(scope: !105, file: !1, line: 40, column: 12)
!118 = !DILocation(line: 41, column: 9, scope: !116)
!119 = !DILocation(line: 44, column: 23, scope: !32)
!120 = !DILocation(line: 44, column: 5, scope: !32)
!121 = !DILocation(line: 45, column: 1, scope: !32)
!122 = distinct !DISubprogram(name: "cmp", scope: !20, file: !20, line: 53, type: !123, scopeLine: 53, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!123 = !DISubroutineType(types: !124)
!124 = !{!18, !125, !125}
!125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !126, size: 64)
!126 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!127 = !DILocalVariable(name: "e1", arg: 1, scope: !122, file: !20, line: 53, type: !125)
!128 = !DILocation(line: 53, column: 21, scope: !122)
!129 = !DILocalVariable(name: "e2", arg: 2, scope: !122, file: !20, line: 53, type: !125)
!130 = !DILocation(line: 53, column: 37, scope: !122)
!131 = !DILocalVariable(name: "i", scope: !122, file: !20, line: 54, type: !18)
!132 = !DILocation(line: 54, column: 9, scope: !122)
!133 = !DILocation(line: 54, column: 22, scope: !122)
!134 = !DILocation(line: 54, column: 15, scope: !122)
!135 = !DILocation(line: 54, column: 13, scope: !122)
!136 = !DILocalVariable(name: "j", scope: !122, file: !20, line: 55, type: !18)
!137 = !DILocation(line: 55, column: 9, scope: !122)
!138 = !DILocation(line: 55, column: 22, scope: !122)
!139 = !DILocation(line: 55, column: 15, scope: !122)
!140 = !DILocation(line: 55, column: 13, scope: !122)
!141 = !DILocation(line: 57, column: 9, scope: !142)
!142 = distinct !DILexicalBlock(scope: !122, file: !20, line: 57, column: 9)
!143 = !DILocation(line: 57, column: 13, scope: !142)
!144 = !DILocation(line: 57, column: 11, scope: !142)
!145 = !DILocation(line: 57, column: 9, scope: !122)
!146 = !DILocation(line: 58, column: 9, scope: !142)
!147 = !DILocation(line: 59, column: 9, scope: !148)
!148 = distinct !DILexicalBlock(scope: !122, file: !20, line: 59, column: 9)
!149 = !DILocation(line: 59, column: 14, scope: !148)
!150 = !DILocation(line: 59, column: 11, scope: !148)
!151 = !DILocation(line: 59, column: 9, scope: !122)
!152 = !DILocation(line: 60, column: 9, scope: !148)
!153 = !DILocation(line: 61, column: 5, scope: !122)
!154 = !DILocation(line: 62, column: 1, scope: !122)
!155 = distinct !DISubprogram(name: "treetable_conf_init", scope: !20, file: !20, line: 70, type: !156, scopeLine: 71, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!156 = !DISubroutineType(types: !157)
!157 = !{null, !158}
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "TreeTableConf", file: !160, line: 94, baseType: !161)
!160 = !DIFile(filename: "./treetable.h", directory: "/home/klee/klee_src/examples/trabalho2")
!161 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "treetable_conf_s", file: !160, line: 89, size: 256, elements: !162)
!162 = !{!163, !165, !172, !176}
!163 = !DIDerivedType(tag: DW_TAG_member, name: "cmp", scope: !161, file: !160, line: 90, baseType: !164, size: 64)
!164 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !123, size: 64)
!165 = !DIDerivedType(tag: DW_TAG_member, name: "mem_alloc", scope: !161, file: !160, line: 91, baseType: !166, size: 64, offset: 64)
!166 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !167, size: 64)
!167 = !DISubroutineType(types: !168)
!168 = !{!25, !169}
!169 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !170, line: 46, baseType: !171)
!170 = !DIFile(filename: "/tmp/llvm-130-install_O_D_A/lib/clang/13.0.1/include/stddef.h", directory: "")
!171 = !DIBasicType(name: "long unsigned int", size: 64, encoding: DW_ATE_unsigned)
!172 = !DIDerivedType(tag: DW_TAG_member, name: "mem_calloc", scope: !161, file: !160, line: 92, baseType: !173, size: 64, offset: 128)
!173 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !174, size: 64)
!174 = !DISubroutineType(types: !175)
!175 = !{!25, !169, !169}
!176 = !DIDerivedType(tag: DW_TAG_member, name: "mem_free", scope: !161, file: !160, line: 93, baseType: !177, size: 64, offset: 192)
!177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !178, size: 64)
!178 = !DISubroutineType(types: !179)
!179 = !{null, !25}
!180 = !DILocalVariable(name: "conf", arg: 1, scope: !155, file: !20, line: 70, type: !158)
!181 = !DILocation(line: 70, column: 41, scope: !155)
!182 = !DILocation(line: 72, column: 5, scope: !155)
!183 = !DILocation(line: 72, column: 11, scope: !155)
!184 = !DILocation(line: 72, column: 22, scope: !155)
!185 = !DILocation(line: 73, column: 5, scope: !155)
!186 = !DILocation(line: 73, column: 11, scope: !155)
!187 = !DILocation(line: 73, column: 22, scope: !155)
!188 = !DILocation(line: 74, column: 5, scope: !155)
!189 = !DILocation(line: 74, column: 11, scope: !155)
!190 = !DILocation(line: 74, column: 22, scope: !155)
!191 = !DILocation(line: 75, column: 5, scope: !155)
!192 = !DILocation(line: 75, column: 11, scope: !155)
!193 = !DILocation(line: 75, column: 22, scope: !155)
!194 = !DILocation(line: 76, column: 1, scope: !155)
!195 = distinct !DISubprogram(name: "treetable_new", scope: !20, file: !20, line: 87, type: !196, scopeLine: 88, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!196 = !DISubroutineType(types: !197)
!197 = !{!22, !198}
!198 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !199, size: 64)
!199 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !200, size: 64)
!200 = !DIDerivedType(tag: DW_TAG_typedef, name: "TreeTable", file: !160, line: 30, baseType: !201)
!201 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "treetable_s", file: !20, line: 30, size: 448, elements: !202)
!202 = !{!203, !215, !216, !217, !218, !219, !220}
!203 = !DIDerivedType(tag: DW_TAG_member, name: "root", scope: !201, file: !20, line: 31, baseType: !204, size: 64)
!204 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !205, size: 64)
!205 = !DIDerivedType(tag: DW_TAG_typedef, name: "RBNode", file: !160, line: 61, baseType: !206)
!206 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rbnode_s", file: !160, line: 37, size: 384, elements: !207)
!207 = !{!208, !209, !210, !211, !213, !214}
!208 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !206, file: !160, line: 40, baseType: !25, size: 64)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !206, file: !160, line: 44, baseType: !25, size: 64, offset: 64)
!210 = !DIDerivedType(tag: DW_TAG_member, name: "color", scope: !206, file: !160, line: 48, baseType: !57, size: 8, offset: 128)
!211 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !206, file: !160, line: 52, baseType: !212, size: 64, offset: 192)
!212 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !206, size: 64)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "left", scope: !206, file: !160, line: 56, baseType: !212, size: 64, offset: 256)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "right", scope: !206, file: !160, line: 60, baseType: !212, size: 64, offset: 320)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "sentinel", scope: !201, file: !20, line: 32, baseType: !204, size: 64, offset: 64)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "size", scope: !201, file: !20, line: 33, baseType: !169, size: 64, offset: 128)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "cmp", scope: !201, file: !20, line: 35, baseType: !164, size: 64, offset: 192)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "mem_alloc", scope: !201, file: !20, line: 36, baseType: !166, size: 64, offset: 256)
!219 = !DIDerivedType(tag: DW_TAG_member, name: "mem_calloc", scope: !201, file: !20, line: 37, baseType: !173, size: 64, offset: 320)
!220 = !DIDerivedType(tag: DW_TAG_member, name: "mem_free", scope: !201, file: !20, line: 38, baseType: !177, size: 64, offset: 384)
!221 = !DILocalVariable(name: "tt", arg: 1, scope: !195, file: !20, line: 87, type: !198)
!222 = !DILocation(line: 87, column: 40, scope: !195)
!223 = !DILocalVariable(name: "conf", scope: !195, file: !20, line: 89, type: !159)
!224 = !DILocation(line: 89, column: 19, scope: !195)
!225 = !DILocation(line: 90, column: 5, scope: !195)
!226 = !DILocation(line: 91, column: 38, scope: !195)
!227 = !DILocation(line: 91, column: 12, scope: !195)
!228 = !DILocation(line: 91, column: 5, scope: !195)
!229 = distinct !DISubprogram(name: "treetable_new_conf", scope: !20, file: !20, line: 107, type: !230, scopeLine: 108, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!230 = !DISubroutineType(types: !231)
!231 = !{!22, !232, !198}
!232 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !233)
!233 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !234, size: 64)
!234 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !159)
!235 = !DILocalVariable(name: "conf", arg: 1, scope: !229, file: !20, line: 107, type: !232)
!236 = !DILocation(line: 107, column: 61, scope: !229)
!237 = !DILocalVariable(name: "tt", arg: 2, scope: !229, file: !20, line: 107, type: !198)
!238 = !DILocation(line: 107, column: 79, scope: !229)
!239 = !DILocalVariable(name: "table", scope: !229, file: !20, line: 109, type: !199)
!240 = !DILocation(line: 109, column: 16, scope: !229)
!241 = !DILocation(line: 109, column: 24, scope: !229)
!242 = !DILocation(line: 109, column: 30, scope: !229)
!243 = !DILocation(line: 111, column: 10, scope: !244)
!244 = distinct !DILexicalBlock(scope: !229, file: !20, line: 111, column: 9)
!245 = !DILocation(line: 111, column: 9, scope: !229)
!246 = !DILocation(line: 112, column: 9, scope: !244)
!247 = !DILocalVariable(name: "sentinel", scope: !229, file: !20, line: 114, type: !204)
!248 = !DILocation(line: 114, column: 13, scope: !229)
!249 = !DILocation(line: 114, column: 24, scope: !229)
!250 = !DILocation(line: 114, column: 30, scope: !229)
!251 = !DILocation(line: 116, column: 10, scope: !252)
!252 = distinct !DILexicalBlock(scope: !229, file: !20, line: 116, column: 9)
!253 = !DILocation(line: 116, column: 9, scope: !229)
!254 = !DILocation(line: 117, column: 9, scope: !255)
!255 = distinct !DILexicalBlock(scope: !252, file: !20, line: 116, column: 20)
!256 = !DILocation(line: 117, column: 15, scope: !255)
!257 = !DILocation(line: 117, column: 24, scope: !255)
!258 = !DILocation(line: 118, column: 9, scope: !255)
!259 = !DILocation(line: 121, column: 5, scope: !229)
!260 = !DILocation(line: 121, column: 15, scope: !229)
!261 = !DILocation(line: 121, column: 23, scope: !229)
!262 = !DILocation(line: 123, column: 5, scope: !229)
!263 = !DILocation(line: 123, column: 12, scope: !229)
!264 = !DILocation(line: 123, column: 23, scope: !229)
!265 = !DILocation(line: 124, column: 25, scope: !229)
!266 = !DILocation(line: 124, column: 31, scope: !229)
!267 = !DILocation(line: 124, column: 5, scope: !229)
!268 = !DILocation(line: 124, column: 12, scope: !229)
!269 = !DILocation(line: 124, column: 23, scope: !229)
!270 = !DILocation(line: 125, column: 25, scope: !229)
!271 = !DILocation(line: 125, column: 31, scope: !229)
!272 = !DILocation(line: 125, column: 5, scope: !229)
!273 = !DILocation(line: 125, column: 12, scope: !229)
!274 = !DILocation(line: 125, column: 23, scope: !229)
!275 = !DILocation(line: 126, column: 25, scope: !229)
!276 = !DILocation(line: 126, column: 31, scope: !229)
!277 = !DILocation(line: 126, column: 5, scope: !229)
!278 = !DILocation(line: 126, column: 12, scope: !229)
!279 = !DILocation(line: 126, column: 23, scope: !229)
!280 = !DILocation(line: 127, column: 25, scope: !229)
!281 = !DILocation(line: 127, column: 31, scope: !229)
!282 = !DILocation(line: 127, column: 5, scope: !229)
!283 = !DILocation(line: 127, column: 12, scope: !229)
!284 = !DILocation(line: 127, column: 23, scope: !229)
!285 = !DILocation(line: 128, column: 25, scope: !229)
!286 = !DILocation(line: 128, column: 5, scope: !229)
!287 = !DILocation(line: 128, column: 12, scope: !229)
!288 = !DILocation(line: 128, column: 23, scope: !229)
!289 = !DILocation(line: 129, column: 25, scope: !229)
!290 = !DILocation(line: 129, column: 5, scope: !229)
!291 = !DILocation(line: 129, column: 12, scope: !229)
!292 = !DILocation(line: 129, column: 23, scope: !229)
!293 = !DILocation(line: 131, column: 11, scope: !229)
!294 = !DILocation(line: 131, column: 6, scope: !229)
!295 = !DILocation(line: 131, column: 9, scope: !229)
!296 = !DILocation(line: 132, column: 5, scope: !229)
!297 = !DILocation(line: 133, column: 1, scope: !229)
!298 = distinct !DISubprogram(name: "treetable_destroy", scope: !20, file: !20, line: 159, type: !299, scopeLine: 160, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!299 = !DISubroutineType(types: !300)
!300 = !{null, !199}
!301 = !DILocalVariable(name: "table", arg: 1, scope: !298, file: !20, line: 159, type: !199)
!302 = !DILocation(line: 159, column: 35, scope: !298)
!303 = !DILocation(line: 161, column: 18, scope: !298)
!304 = !DILocation(line: 161, column: 25, scope: !298)
!305 = !DILocation(line: 161, column: 32, scope: !298)
!306 = !DILocation(line: 161, column: 5, scope: !298)
!307 = !DILocation(line: 163, column: 5, scope: !298)
!308 = !DILocation(line: 163, column: 12, scope: !298)
!309 = !DILocation(line: 163, column: 21, scope: !298)
!310 = !DILocation(line: 163, column: 28, scope: !298)
!311 = !DILocation(line: 164, column: 5, scope: !298)
!312 = !DILocation(line: 164, column: 12, scope: !298)
!313 = !DILocation(line: 164, column: 21, scope: !298)
!314 = !DILocation(line: 165, column: 1, scope: !298)
!315 = distinct !DISubprogram(name: "tree_destroy", scope: !20, file: !20, line: 141, type: !316, scopeLine: 142, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!316 = !DISubroutineType(types: !317)
!317 = !{null, !199, !204}
!318 = !DILocalVariable(name: "table", arg: 1, scope: !315, file: !20, line: 141, type: !199)
!319 = !DILocation(line: 141, column: 37, scope: !315)
!320 = !DILocalVariable(name: "n", arg: 2, scope: !315, file: !20, line: 141, type: !204)
!321 = !DILocation(line: 141, column: 52, scope: !315)
!322 = !DILocation(line: 143, column: 9, scope: !323)
!323 = distinct !DILexicalBlock(scope: !315, file: !20, line: 143, column: 9)
!324 = !DILocation(line: 143, column: 14, scope: !323)
!325 = !DILocation(line: 143, column: 21, scope: !323)
!326 = !DILocation(line: 143, column: 11, scope: !323)
!327 = !DILocation(line: 143, column: 9, scope: !315)
!328 = !DILocation(line: 146, column: 18, scope: !315)
!329 = !DILocation(line: 146, column: 25, scope: !315)
!330 = !DILocation(line: 146, column: 28, scope: !315)
!331 = !DILocation(line: 146, column: 5, scope: !315)
!332 = !DILocation(line: 147, column: 18, scope: !315)
!333 = !DILocation(line: 147, column: 25, scope: !315)
!334 = !DILocation(line: 147, column: 28, scope: !315)
!335 = !DILocation(line: 147, column: 5, scope: !315)
!336 = !DILocation(line: 149, column: 5, scope: !315)
!337 = !DILocation(line: 149, column: 12, scope: !315)
!338 = !DILocation(line: 149, column: 21, scope: !315)
!339 = !DILocation(line: 150, column: 1, scope: !315)
!340 = distinct !DISubprogram(name: "treetable_get", scope: !20, file: !20, line: 177, type: !341, scopeLine: 178, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!341 = !DISubroutineType(types: !342)
!342 = !{!22, !343, !125, !346}
!343 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !344)
!344 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !345, size: 64)
!345 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !200)
!346 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !25, size: 64)
!347 = !DILocalVariable(name: "table", arg: 1, scope: !340, file: !20, line: 177, type: !343)
!348 = !DILocation(line: 177, column: 52, scope: !340)
!349 = !DILocalVariable(name: "key", arg: 2, scope: !340, file: !20, line: 177, type: !125)
!350 = !DILocation(line: 177, column: 71, scope: !340)
!351 = !DILocalVariable(name: "out", arg: 3, scope: !340, file: !20, line: 177, type: !346)
!352 = !DILocation(line: 177, column: 83, scope: !340)
!353 = !DILocalVariable(name: "node", scope: !340, file: !20, line: 179, type: !204)
!354 = !DILocation(line: 179, column: 13, scope: !340)
!355 = !DILocation(line: 179, column: 41, scope: !340)
!356 = !DILocation(line: 179, column: 48, scope: !340)
!357 = !DILocation(line: 179, column: 20, scope: !340)
!358 = !DILocation(line: 181, column: 10, scope: !359)
!359 = distinct !DILexicalBlock(scope: !340, file: !20, line: 181, column: 9)
!360 = !DILocation(line: 181, column: 9, scope: !340)
!361 = !DILocation(line: 182, column: 9, scope: !359)
!362 = !DILocation(line: 184, column: 12, scope: !340)
!363 = !DILocation(line: 184, column: 18, scope: !340)
!364 = !DILocation(line: 184, column: 6, scope: !340)
!365 = !DILocation(line: 184, column: 10, scope: !340)
!366 = !DILocation(line: 185, column: 5, scope: !340)
!367 = !DILocation(line: 186, column: 1, scope: !340)
!368 = distinct !DISubprogram(name: "get_tree_node_by_key", scope: !20, file: !20, line: 477, type: !369, scopeLine: 478, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!369 = !DISubroutineType(types: !370)
!370 = !{!204, !343, !125}
!371 = !DILocalVariable(name: "table", arg: 1, scope: !368, file: !20, line: 477, type: !343)
!372 = !DILocation(line: 477, column: 61, scope: !368)
!373 = !DILocalVariable(name: "key", arg: 2, scope: !368, file: !20, line: 477, type: !125)
!374 = !DILocation(line: 477, column: 80, scope: !368)
!375 = !DILocation(line: 479, column: 9, scope: !376)
!376 = distinct !DILexicalBlock(scope: !368, file: !20, line: 479, column: 9)
!377 = !DILocation(line: 479, column: 16, scope: !376)
!378 = !DILocation(line: 479, column: 21, scope: !376)
!379 = !DILocation(line: 479, column: 9, scope: !368)
!380 = !DILocation(line: 480, column: 9, scope: !376)
!381 = !DILocalVariable(name: "n", scope: !368, file: !20, line: 482, type: !204)
!382 = !DILocation(line: 482, column: 13, scope: !368)
!383 = !DILocation(line: 482, column: 17, scope: !368)
!384 = !DILocation(line: 482, column: 24, scope: !368)
!385 = !DILocalVariable(name: "s", scope: !368, file: !20, line: 483, type: !204)
!386 = !DILocation(line: 483, column: 13, scope: !368)
!387 = !DILocation(line: 483, column: 17, scope: !368)
!388 = !DILocation(line: 483, column: 24, scope: !368)
!389 = !DILocalVariable(name: "cmp", scope: !368, file: !20, line: 485, type: !18)
!390 = !DILocation(line: 485, column: 9, scope: !368)
!391 = !DILocation(line: 486, column: 5, scope: !368)
!392 = !DILocation(line: 487, column: 15, scope: !393)
!393 = distinct !DILexicalBlock(scope: !368, file: !20, line: 486, column: 8)
!394 = !DILocation(line: 487, column: 22, scope: !393)
!395 = !DILocation(line: 487, column: 26, scope: !393)
!396 = !DILocation(line: 487, column: 31, scope: !393)
!397 = !DILocation(line: 487, column: 34, scope: !393)
!398 = !DILocation(line: 487, column: 13, scope: !393)
!399 = !DILocation(line: 489, column: 13, scope: !400)
!400 = distinct !DILexicalBlock(scope: !393, file: !20, line: 489, column: 13)
!401 = !DILocation(line: 489, column: 17, scope: !400)
!402 = !DILocation(line: 489, column: 13, scope: !393)
!403 = !DILocation(line: 490, column: 17, scope: !400)
!404 = !DILocation(line: 490, column: 20, scope: !400)
!405 = !DILocation(line: 490, column: 15, scope: !400)
!406 = !DILocation(line: 490, column: 13, scope: !400)
!407 = !DILocation(line: 491, column: 18, scope: !408)
!408 = distinct !DILexicalBlock(scope: !400, file: !20, line: 491, column: 18)
!409 = !DILocation(line: 491, column: 22, scope: !408)
!410 = !DILocation(line: 491, column: 18, scope: !400)
!411 = !DILocation(line: 492, column: 17, scope: !408)
!412 = !DILocation(line: 492, column: 20, scope: !408)
!413 = !DILocation(line: 492, column: 15, scope: !408)
!414 = !DILocation(line: 494, column: 20, scope: !408)
!415 = !DILocation(line: 494, column: 13, scope: !408)
!416 = !DILocation(line: 495, column: 14, scope: !368)
!417 = !DILocation(line: 495, column: 19, scope: !368)
!418 = !DILocation(line: 495, column: 16, scope: !368)
!419 = !DILocation(line: 495, column: 21, scope: !368)
!420 = !DILocation(line: 495, column: 5, scope: !393)
!421 = distinct !{!421, !391, !422, !423}
!422 = !DILocation(line: 495, column: 32, scope: !368)
!423 = !{!"llvm.loop.mustprogress"}
!424 = !DILocation(line: 497, column: 5, scope: !368)
!425 = !DILocation(line: 498, column: 1, scope: !368)
!426 = distinct !DISubprogram(name: "treetable_get_first_key", scope: !20, file: !20, line: 198, type: !427, scopeLine: 199, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!427 = !DISubroutineType(types: !428)
!428 = !{!22, !343, !346}
!429 = !DILocalVariable(name: "table", arg: 1, scope: !426, file: !20, line: 198, type: !343)
!430 = !DILocation(line: 198, column: 62, scope: !426)
!431 = !DILocalVariable(name: "out", arg: 2, scope: !426, file: !20, line: 198, type: !346)
!432 = !DILocation(line: 198, column: 76, scope: !426)
!433 = !DILocalVariable(name: "node", scope: !426, file: !20, line: 200, type: !204)
!434 = !DILocation(line: 200, column: 13, scope: !426)
!435 = !DILocation(line: 200, column: 29, scope: !426)
!436 = !DILocation(line: 200, column: 36, scope: !426)
!437 = !DILocation(line: 200, column: 43, scope: !426)
!438 = !DILocation(line: 200, column: 20, scope: !426)
!439 = !DILocation(line: 202, column: 9, scope: !440)
!440 = distinct !DILexicalBlock(scope: !426, file: !20, line: 202, column: 9)
!441 = !DILocation(line: 202, column: 17, scope: !440)
!442 = !DILocation(line: 202, column: 24, scope: !440)
!443 = !DILocation(line: 202, column: 14, scope: !440)
!444 = !DILocation(line: 202, column: 9, scope: !426)
!445 = !DILocation(line: 203, column: 16, scope: !446)
!446 = distinct !DILexicalBlock(scope: !440, file: !20, line: 202, column: 34)
!447 = !DILocation(line: 203, column: 22, scope: !446)
!448 = !DILocation(line: 203, column: 10, scope: !446)
!449 = !DILocation(line: 203, column: 14, scope: !446)
!450 = !DILocation(line: 204, column: 9, scope: !446)
!451 = !DILocation(line: 207, column: 5, scope: !426)
!452 = !DILocation(line: 208, column: 1, scope: !426)
!453 = distinct !DISubprogram(name: "tree_min", scope: !20, file: !20, line: 391, type: !454, scopeLine: 392, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!454 = !DISubroutineType(types: !455)
!455 = !{!204, !343, !204}
!456 = !DILocalVariable(name: "table", arg: 1, scope: !453, file: !20, line: 391, type: !343)
!457 = !DILocation(line: 391, column: 56, scope: !453)
!458 = !DILocalVariable(name: "n", arg: 2, scope: !453, file: !20, line: 391, type: !204)
!459 = !DILocation(line: 391, column: 71, scope: !453)
!460 = !DILocalVariable(name: "s", scope: !453, file: !20, line: 393, type: !204)
!461 = !DILocation(line: 393, column: 13, scope: !453)
!462 = !DILocation(line: 393, column: 17, scope: !453)
!463 = !DILocation(line: 393, column: 24, scope: !453)
!464 = !DILocation(line: 396, column: 9, scope: !453)
!465 = !DILocation(line: 396, column: 16, scope: !453)
!466 = !DILocation(line: 396, column: 21, scope: !453)
!467 = !DILocation(line: 396, column: 18, scope: !453)
!468 = !DILocation(line: 396, column: 23, scope: !453)
!469 = !DILocation(line: 396, column: 26, scope: !453)
!470 = !DILocation(line: 396, column: 29, scope: !453)
!471 = !DILocation(line: 396, column: 37, scope: !453)
!472 = !DILocation(line: 396, column: 34, scope: !453)
!473 = !DILocation(line: 397, column: 17, scope: !453)
!474 = !DILocation(line: 397, column: 20, scope: !453)
!475 = !DILocation(line: 397, column: 15, scope: !453)
!476 = distinct !{!476, !464, !474, !423}
!477 = !DILocation(line: 399, column: 12, scope: !453)
!478 = !DILocation(line: 399, column: 5, scope: !453)
!479 = distinct !DISubprogram(name: "treetable_get_greater_than", scope: !20, file: !20, line: 220, type: !341, scopeLine: 221, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!480 = !DILocalVariable(name: "table", arg: 1, scope: !479, file: !20, line: 220, type: !343)
!481 = !DILocation(line: 220, column: 65, scope: !479)
!482 = !DILocalVariable(name: "key", arg: 2, scope: !479, file: !20, line: 220, type: !125)
!483 = !DILocation(line: 220, column: 84, scope: !479)
!484 = !DILocalVariable(name: "out", arg: 3, scope: !479, file: !20, line: 220, type: !346)
!485 = !DILocation(line: 220, column: 96, scope: !479)
!486 = !DILocalVariable(name: "n", scope: !479, file: !20, line: 222, type: !204)
!487 = !DILocation(line: 222, column: 13, scope: !479)
!488 = !DILocation(line: 222, column: 38, scope: !479)
!489 = !DILocation(line: 222, column: 45, scope: !479)
!490 = !DILocation(line: 222, column: 17, scope: !479)
!491 = !DILocalVariable(name: "s", scope: !479, file: !20, line: 223, type: !204)
!492 = !DILocation(line: 223, column: 13, scope: !479)
!493 = !DILocation(line: 223, column: 36, scope: !479)
!494 = !DILocation(line: 223, column: 43, scope: !479)
!495 = !DILocation(line: 223, column: 17, scope: !479)
!496 = !DILocation(line: 226, column: 9, scope: !497)
!497 = distinct !DILexicalBlock(scope: !479, file: !20, line: 226, column: 9)
!498 = !DILocation(line: 226, column: 14, scope: !497)
!499 = !DILocation(line: 226, column: 21, scope: !497)
!500 = !DILocation(line: 226, column: 11, scope: !497)
!501 = !DILocation(line: 226, column: 30, scope: !497)
!502 = !DILocation(line: 227, column: 16, scope: !503)
!503 = distinct !DILexicalBlock(scope: !497, file: !20, line: 226, column: 41)
!504 = !DILocation(line: 227, column: 19, scope: !503)
!505 = !DILocation(line: 227, column: 10, scope: !503)
!506 = !DILocation(line: 227, column: 14, scope: !503)
!507 = !DILocation(line: 228, column: 9, scope: !503)
!508 = !DILocation(line: 230, column: 5, scope: !479)
!509 = !DILocation(line: 231, column: 1, scope: !479)
!510 = distinct !DISubprogram(name: "get_successor_node", scope: !20, file: !20, line: 508, type: !454, scopeLine: 509, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!511 = !DILocalVariable(name: "table", arg: 1, scope: !510, file: !20, line: 508, type: !343)
!512 = !DILocation(line: 508, column: 59, scope: !510)
!513 = !DILocalVariable(name: "x", arg: 2, scope: !510, file: !20, line: 508, type: !204)
!514 = !DILocation(line: 508, column: 74, scope: !510)
!515 = !DILocation(line: 510, column: 9, scope: !516)
!516 = distinct !DILexicalBlock(scope: !510, file: !20, line: 510, column: 9)
!517 = !DILocation(line: 510, column: 11, scope: !516)
!518 = !DILocation(line: 510, column: 9, scope: !510)
!519 = !DILocation(line: 511, column: 9, scope: !516)
!520 = !DILocation(line: 513, column: 9, scope: !521)
!521 = distinct !DILexicalBlock(scope: !510, file: !20, line: 513, column: 9)
!522 = !DILocation(line: 513, column: 12, scope: !521)
!523 = !DILocation(line: 513, column: 21, scope: !521)
!524 = !DILocation(line: 513, column: 28, scope: !521)
!525 = !DILocation(line: 513, column: 18, scope: !521)
!526 = !DILocation(line: 513, column: 9, scope: !510)
!527 = !DILocation(line: 514, column: 25, scope: !521)
!528 = !DILocation(line: 514, column: 32, scope: !521)
!529 = !DILocation(line: 514, column: 35, scope: !521)
!530 = !DILocation(line: 514, column: 16, scope: !521)
!531 = !DILocation(line: 514, column: 9, scope: !521)
!532 = !DILocalVariable(name: "y", scope: !510, file: !20, line: 516, type: !204)
!533 = !DILocation(line: 516, column: 13, scope: !510)
!534 = !DILocation(line: 516, column: 17, scope: !510)
!535 = !DILocation(line: 516, column: 20, scope: !510)
!536 = !DILocation(line: 518, column: 5, scope: !510)
!537 = !DILocation(line: 518, column: 12, scope: !510)
!538 = !DILocation(line: 518, column: 17, scope: !510)
!539 = !DILocation(line: 518, column: 24, scope: !510)
!540 = !DILocation(line: 518, column: 14, scope: !510)
!541 = !DILocation(line: 518, column: 33, scope: !510)
!542 = !DILocation(line: 518, column: 36, scope: !510)
!543 = !DILocation(line: 518, column: 41, scope: !510)
!544 = !DILocation(line: 518, column: 44, scope: !510)
!545 = !DILocation(line: 518, column: 38, scope: !510)
!546 = !DILocation(line: 519, column: 13, scope: !547)
!547 = distinct !DILexicalBlock(scope: !510, file: !20, line: 518, column: 51)
!548 = !DILocation(line: 519, column: 11, scope: !547)
!549 = !DILocation(line: 520, column: 13, scope: !547)
!550 = !DILocation(line: 520, column: 16, scope: !547)
!551 = !DILocation(line: 520, column: 11, scope: !547)
!552 = distinct !{!552, !536, !553, !423}
!553 = !DILocation(line: 521, column: 5, scope: !510)
!554 = !DILocation(line: 522, column: 12, scope: !510)
!555 = !DILocation(line: 522, column: 5, scope: !510)
!556 = !DILocation(line: 523, column: 1, scope: !510)
!557 = distinct !DISubprogram(name: "treetable_size", scope: !20, file: !20, line: 241, type: !558, scopeLine: 242, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!558 = !DISubroutineType(types: !559)
!559 = !{!169, !343}
!560 = !DILocalVariable(name: "table", arg: 1, scope: !557, file: !20, line: 241, type: !343)
!561 = !DILocation(line: 241, column: 47, scope: !557)
!562 = !DILocation(line: 243, column: 12, scope: !557)
!563 = !DILocation(line: 243, column: 19, scope: !557)
!564 = !DILocation(line: 243, column: 5, scope: !557)
!565 = distinct !DISubprogram(name: "treetable_contains_key", scope: !20, file: !20, line: 254, type: !566, scopeLine: 255, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!566 = !DISubroutineType(types: !567)
!567 = !{!568, !343, !125}
!568 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!569 = !DILocalVariable(name: "table", arg: 1, scope: !565, file: !20, line: 254, type: !343)
!570 = !DILocation(line: 254, column: 53, scope: !565)
!571 = !DILocalVariable(name: "key", arg: 2, scope: !565, file: !20, line: 254, type: !125)
!572 = !DILocation(line: 254, column: 72, scope: !565)
!573 = !DILocalVariable(name: "node", scope: !565, file: !20, line: 256, type: !204)
!574 = !DILocation(line: 256, column: 13, scope: !565)
!575 = !DILocation(line: 256, column: 41, scope: !565)
!576 = !DILocation(line: 256, column: 48, scope: !565)
!577 = !DILocation(line: 256, column: 20, scope: !565)
!578 = !DILocation(line: 258, column: 9, scope: !579)
!579 = distinct !DILexicalBlock(scope: !565, file: !20, line: 258, column: 9)
!580 = !DILocation(line: 258, column: 9, scope: !565)
!581 = !DILocation(line: 259, column: 9, scope: !579)
!582 = !DILocation(line: 261, column: 5, scope: !565)
!583 = !DILocation(line: 262, column: 1, scope: !565)
!584 = distinct !DISubprogram(name: "treetable_contains_value", scope: !20, file: !20, line: 272, type: !585, scopeLine: 273, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!585 = !DISubroutineType(types: !586)
!586 = !{!169, !343, !125}
!587 = !DILocalVariable(name: "table", arg: 1, scope: !584, file: !20, line: 272, type: !343)
!588 = !DILocation(line: 272, column: 57, scope: !584)
!589 = !DILocalVariable(name: "value", arg: 2, scope: !584, file: !20, line: 272, type: !125)
!590 = !DILocation(line: 272, column: 76, scope: !584)
!591 = !DILocalVariable(name: "node", scope: !584, file: !20, line: 274, type: !204)
!592 = !DILocation(line: 274, column: 13, scope: !584)
!593 = !DILocation(line: 274, column: 29, scope: !584)
!594 = !DILocation(line: 274, column: 36, scope: !584)
!595 = !DILocation(line: 274, column: 43, scope: !584)
!596 = !DILocation(line: 274, column: 20, scope: !584)
!597 = !DILocalVariable(name: "o", scope: !584, file: !20, line: 276, type: !169)
!598 = !DILocation(line: 276, column: 12, scope: !584)
!599 = !DILocation(line: 277, column: 5, scope: !584)
!600 = !DILocation(line: 277, column: 12, scope: !584)
!601 = !DILocation(line: 277, column: 20, scope: !584)
!602 = !DILocation(line: 277, column: 27, scope: !584)
!603 = !DILocation(line: 277, column: 17, scope: !584)
!604 = !DILocation(line: 278, column: 13, scope: !605)
!605 = distinct !DILexicalBlock(scope: !606, file: !20, line: 278, column: 13)
!606 = distinct !DILexicalBlock(scope: !584, file: !20, line: 277, column: 37)
!607 = !DILocation(line: 278, column: 19, scope: !605)
!608 = !DILocation(line: 278, column: 28, scope: !605)
!609 = !DILocation(line: 278, column: 25, scope: !605)
!610 = !DILocation(line: 278, column: 13, scope: !606)
!611 = !DILocation(line: 279, column: 14, scope: !605)
!612 = !DILocation(line: 279, column: 13, scope: !605)
!613 = !DILocation(line: 280, column: 35, scope: !606)
!614 = !DILocation(line: 280, column: 42, scope: !606)
!615 = !DILocation(line: 280, column: 16, scope: !606)
!616 = !DILocation(line: 280, column: 14, scope: !606)
!617 = distinct !{!617, !599, !618, !423}
!618 = !DILocation(line: 281, column: 5, scope: !584)
!619 = !DILocation(line: 282, column: 12, scope: !584)
!620 = !DILocation(line: 282, column: 5, scope: !584)
!621 = distinct !DISubprogram(name: "treetable_add", scope: !20, file: !20, line: 299, type: !622, scopeLine: 300, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!622 = !DISubroutineType(types: !623)
!623 = !{!22, !199, !25, !25}
!624 = !DILocalVariable(name: "table", arg: 1, scope: !621, file: !20, line: 299, type: !199)
!625 = !DILocation(line: 299, column: 39, scope: !621)
!626 = !DILocalVariable(name: "key", arg: 2, scope: !621, file: !20, line: 299, type: !25)
!627 = !DILocation(line: 299, column: 52, scope: !621)
!628 = !DILocalVariable(name: "val", arg: 3, scope: !621, file: !20, line: 299, type: !25)
!629 = !DILocation(line: 299, column: 63, scope: !621)
!630 = !DILocalVariable(name: "y", scope: !621, file: !20, line: 301, type: !204)
!631 = !DILocation(line: 301, column: 13, scope: !621)
!632 = !DILocation(line: 301, column: 17, scope: !621)
!633 = !DILocation(line: 301, column: 24, scope: !621)
!634 = !DILocalVariable(name: "x", scope: !621, file: !20, line: 302, type: !204)
!635 = !DILocation(line: 302, column: 13, scope: !621)
!636 = !DILocation(line: 302, column: 17, scope: !621)
!637 = !DILocation(line: 302, column: 24, scope: !621)
!638 = !DILocalVariable(name: "cmp", scope: !621, file: !20, line: 304, type: !18)
!639 = !DILocation(line: 304, column: 9, scope: !621)
!640 = !DILocation(line: 305, column: 5, scope: !621)
!641 = !DILocation(line: 305, column: 12, scope: !621)
!642 = !DILocation(line: 305, column: 17, scope: !621)
!643 = !DILocation(line: 305, column: 24, scope: !621)
!644 = !DILocation(line: 305, column: 14, scope: !621)
!645 = !DILocation(line: 306, column: 15, scope: !646)
!646 = distinct !DILexicalBlock(scope: !621, file: !20, line: 305, column: 34)
!647 = !DILocation(line: 306, column: 22, scope: !646)
!648 = !DILocation(line: 306, column: 26, scope: !646)
!649 = !DILocation(line: 306, column: 31, scope: !646)
!650 = !DILocation(line: 306, column: 34, scope: !646)
!651 = !DILocation(line: 306, column: 13, scope: !646)
!652 = !DILocation(line: 307, column: 15, scope: !646)
!653 = !DILocation(line: 307, column: 13, scope: !646)
!654 = !DILocation(line: 309, column: 13, scope: !655)
!655 = distinct !DILexicalBlock(scope: !646, file: !20, line: 309, column: 13)
!656 = !DILocation(line: 309, column: 17, scope: !655)
!657 = !DILocation(line: 309, column: 13, scope: !646)
!658 = !DILocation(line: 310, column: 17, scope: !659)
!659 = distinct !DILexicalBlock(scope: !655, file: !20, line: 309, column: 22)
!660 = !DILocation(line: 310, column: 20, scope: !659)
!661 = !DILocation(line: 310, column: 15, scope: !659)
!662 = !DILocation(line: 311, column: 9, scope: !659)
!663 = !DILocation(line: 311, column: 20, scope: !664)
!664 = distinct !DILexicalBlock(scope: !655, file: !20, line: 311, column: 20)
!665 = !DILocation(line: 311, column: 24, scope: !664)
!666 = !DILocation(line: 311, column: 20, scope: !655)
!667 = !DILocation(line: 312, column: 17, scope: !668)
!668 = distinct !DILexicalBlock(scope: !664, file: !20, line: 311, column: 29)
!669 = !DILocation(line: 312, column: 20, scope: !668)
!670 = !DILocation(line: 312, column: 15, scope: !668)
!671 = !DILocation(line: 314, column: 24, scope: !672)
!672 = distinct !DILexicalBlock(scope: !664, file: !20, line: 313, column: 16)
!673 = !DILocation(line: 314, column: 13, scope: !672)
!674 = !DILocation(line: 314, column: 16, scope: !672)
!675 = !DILocation(line: 314, column: 22, scope: !672)
!676 = !DILocation(line: 315, column: 13, scope: !672)
!677 = distinct !{!677, !640, !678, !423}
!678 = !DILocation(line: 317, column: 5, scope: !621)
!679 = !DILocalVariable(name: "n", scope: !621, file: !20, line: 318, type: !204)
!680 = !DILocation(line: 318, column: 13, scope: !621)
!681 = !DILocation(line: 318, column: 17, scope: !621)
!682 = !DILocation(line: 318, column: 24, scope: !621)
!683 = !DILocation(line: 320, column: 17, scope: !621)
!684 = !DILocation(line: 320, column: 5, scope: !621)
!685 = !DILocation(line: 320, column: 8, scope: !621)
!686 = !DILocation(line: 320, column: 15, scope: !621)
!687 = !DILocation(line: 321, column: 17, scope: !621)
!688 = !DILocation(line: 321, column: 5, scope: !621)
!689 = !DILocation(line: 321, column: 8, scope: !621)
!690 = !DILocation(line: 321, column: 15, scope: !621)
!691 = !DILocation(line: 322, column: 17, scope: !621)
!692 = !DILocation(line: 322, column: 5, scope: !621)
!693 = !DILocation(line: 322, column: 8, scope: !621)
!694 = !DILocation(line: 322, column: 15, scope: !621)
!695 = !DILocation(line: 323, column: 17, scope: !621)
!696 = !DILocation(line: 323, column: 24, scope: !621)
!697 = !DILocation(line: 323, column: 5, scope: !621)
!698 = !DILocation(line: 323, column: 8, scope: !621)
!699 = !DILocation(line: 323, column: 15, scope: !621)
!700 = !DILocation(line: 324, column: 17, scope: !621)
!701 = !DILocation(line: 324, column: 24, scope: !621)
!702 = !DILocation(line: 324, column: 5, scope: !621)
!703 = !DILocation(line: 324, column: 8, scope: !621)
!704 = !DILocation(line: 324, column: 15, scope: !621)
!705 = !DILocation(line: 326, column: 5, scope: !621)
!706 = !DILocation(line: 326, column: 12, scope: !621)
!707 = !DILocation(line: 326, column: 16, scope: !621)
!708 = !DILocation(line: 328, column: 9, scope: !709)
!709 = distinct !DILexicalBlock(scope: !621, file: !20, line: 328, column: 9)
!710 = !DILocation(line: 328, column: 14, scope: !709)
!711 = !DILocation(line: 328, column: 21, scope: !709)
!712 = !DILocation(line: 328, column: 11, scope: !709)
!713 = !DILocation(line: 328, column: 9, scope: !621)
!714 = !DILocation(line: 329, column: 23, scope: !715)
!715 = distinct !DILexicalBlock(scope: !709, file: !20, line: 328, column: 31)
!716 = !DILocation(line: 329, column: 9, scope: !715)
!717 = !DILocation(line: 329, column: 16, scope: !715)
!718 = !DILocation(line: 329, column: 21, scope: !715)
!719 = !DILocation(line: 330, column: 9, scope: !715)
!720 = !DILocation(line: 330, column: 12, scope: !715)
!721 = !DILocation(line: 330, column: 21, scope: !715)
!722 = !DILocation(line: 331, column: 5, scope: !715)
!723 = !DILocation(line: 332, column: 9, scope: !724)
!724 = distinct !DILexicalBlock(scope: !709, file: !20, line: 331, column: 12)
!725 = !DILocation(line: 332, column: 12, scope: !724)
!726 = !DILocation(line: 332, column: 18, scope: !724)
!727 = !DILocation(line: 333, column: 13, scope: !728)
!728 = distinct !DILexicalBlock(scope: !724, file: !20, line: 333, column: 13)
!729 = !DILocation(line: 333, column: 20, scope: !728)
!730 = !DILocation(line: 333, column: 24, scope: !728)
!731 = !DILocation(line: 333, column: 29, scope: !728)
!732 = !DILocation(line: 333, column: 32, scope: !728)
!733 = !DILocation(line: 333, column: 37, scope: !728)
!734 = !DILocation(line: 333, column: 13, scope: !724)
!735 = !DILocation(line: 334, column: 23, scope: !736)
!736 = distinct !DILexicalBlock(scope: !728, file: !20, line: 333, column: 42)
!737 = !DILocation(line: 334, column: 13, scope: !736)
!738 = !DILocation(line: 334, column: 16, scope: !736)
!739 = !DILocation(line: 334, column: 21, scope: !736)
!740 = !DILocation(line: 335, column: 9, scope: !736)
!741 = !DILocation(line: 336, column: 24, scope: !742)
!742 = distinct !DILexicalBlock(scope: !728, file: !20, line: 335, column: 16)
!743 = !DILocation(line: 336, column: 13, scope: !742)
!744 = !DILocation(line: 336, column: 16, scope: !742)
!745 = !DILocation(line: 336, column: 22, scope: !742)
!746 = !DILocation(line: 338, column: 32, scope: !724)
!747 = !DILocation(line: 338, column: 39, scope: !724)
!748 = !DILocation(line: 338, column: 9, scope: !724)
!749 = !DILocation(line: 340, column: 5, scope: !621)
!750 = !DILocation(line: 341, column: 1, scope: !621)
!751 = distinct !DISubprogram(name: "rebalance_after_insert", scope: !20, file: !20, line: 349, type: !316, scopeLine: 350, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!752 = !DILocalVariable(name: "table", arg: 1, scope: !751, file: !20, line: 349, type: !199)
!753 = !DILocation(line: 349, column: 47, scope: !751)
!754 = !DILocalVariable(name: "z", arg: 2, scope: !751, file: !20, line: 349, type: !204)
!755 = !DILocation(line: 349, column: 62, scope: !751)
!756 = !DILocalVariable(name: "y", scope: !751, file: !20, line: 351, type: !204)
!757 = !DILocation(line: 351, column: 13, scope: !751)
!758 = !DILocation(line: 353, column: 5, scope: !751)
!759 = !DILocation(line: 353, column: 12, scope: !751)
!760 = !DILocation(line: 353, column: 15, scope: !751)
!761 = !DILocation(line: 353, column: 23, scope: !751)
!762 = !DILocation(line: 353, column: 29, scope: !751)
!763 = !DILocation(line: 354, column: 13, scope: !764)
!764 = distinct !DILexicalBlock(scope: !765, file: !20, line: 354, column: 13)
!765 = distinct !DILexicalBlock(scope: !751, file: !20, line: 353, column: 40)
!766 = !DILocation(line: 354, column: 16, scope: !764)
!767 = !DILocation(line: 354, column: 26, scope: !764)
!768 = !DILocation(line: 354, column: 29, scope: !764)
!769 = !DILocation(line: 354, column: 37, scope: !764)
!770 = !DILocation(line: 354, column: 45, scope: !764)
!771 = !DILocation(line: 354, column: 23, scope: !764)
!772 = !DILocation(line: 354, column: 13, scope: !765)
!773 = !DILocation(line: 355, column: 17, scope: !774)
!774 = distinct !DILexicalBlock(scope: !764, file: !20, line: 354, column: 51)
!775 = !DILocation(line: 355, column: 20, scope: !774)
!776 = !DILocation(line: 355, column: 28, scope: !774)
!777 = !DILocation(line: 355, column: 36, scope: !774)
!778 = !DILocation(line: 355, column: 15, scope: !774)
!779 = !DILocation(line: 356, column: 17, scope: !780)
!780 = distinct !DILexicalBlock(scope: !774, file: !20, line: 356, column: 17)
!781 = !DILocation(line: 356, column: 20, scope: !780)
!782 = !DILocation(line: 356, column: 26, scope: !780)
!783 = !DILocation(line: 356, column: 17, scope: !774)
!784 = !DILocation(line: 357, column: 17, scope: !785)
!785 = distinct !DILexicalBlock(scope: !780, file: !20, line: 356, column: 37)
!786 = !DILocation(line: 357, column: 20, scope: !785)
!787 = !DILocation(line: 357, column: 28, scope: !785)
!788 = !DILocation(line: 357, column: 42, scope: !785)
!789 = !DILocation(line: 358, column: 17, scope: !785)
!790 = !DILocation(line: 358, column: 20, scope: !785)
!791 = !DILocation(line: 358, column: 42, scope: !785)
!792 = !DILocation(line: 359, column: 17, scope: !785)
!793 = !DILocation(line: 359, column: 20, scope: !785)
!794 = !DILocation(line: 359, column: 28, scope: !785)
!795 = !DILocation(line: 359, column: 36, scope: !785)
!796 = !DILocation(line: 359, column: 42, scope: !785)
!797 = !DILocation(line: 360, column: 21, scope: !785)
!798 = !DILocation(line: 360, column: 24, scope: !785)
!799 = !DILocation(line: 360, column: 32, scope: !785)
!800 = !DILocation(line: 360, column: 19, scope: !785)
!801 = !DILocation(line: 361, column: 13, scope: !785)
!802 = !DILocation(line: 362, column: 21, scope: !803)
!803 = distinct !DILexicalBlock(scope: !804, file: !20, line: 362, column: 21)
!804 = distinct !DILexicalBlock(scope: !780, file: !20, line: 361, column: 20)
!805 = !DILocation(line: 362, column: 26, scope: !803)
!806 = !DILocation(line: 362, column: 29, scope: !803)
!807 = !DILocation(line: 362, column: 37, scope: !803)
!808 = !DILocation(line: 362, column: 23, scope: !803)
!809 = !DILocation(line: 362, column: 21, scope: !804)
!810 = !DILocation(line: 363, column: 25, scope: !811)
!811 = distinct !DILexicalBlock(scope: !803, file: !20, line: 362, column: 44)
!812 = !DILocation(line: 363, column: 28, scope: !811)
!813 = !DILocation(line: 363, column: 23, scope: !811)
!814 = !DILocation(line: 364, column: 33, scope: !811)
!815 = !DILocation(line: 364, column: 40, scope: !811)
!816 = !DILocation(line: 364, column: 21, scope: !811)
!817 = !DILocation(line: 365, column: 17, scope: !811)
!818 = !DILocation(line: 366, column: 17, scope: !804)
!819 = !DILocation(line: 366, column: 20, scope: !804)
!820 = !DILocation(line: 366, column: 28, scope: !804)
!821 = !DILocation(line: 366, column: 42, scope: !804)
!822 = !DILocation(line: 367, column: 17, scope: !804)
!823 = !DILocation(line: 367, column: 20, scope: !804)
!824 = !DILocation(line: 367, column: 28, scope: !804)
!825 = !DILocation(line: 367, column: 36, scope: !804)
!826 = !DILocation(line: 367, column: 42, scope: !804)
!827 = !DILocation(line: 368, column: 30, scope: !804)
!828 = !DILocation(line: 368, column: 37, scope: !804)
!829 = !DILocation(line: 368, column: 40, scope: !804)
!830 = !DILocation(line: 368, column: 48, scope: !804)
!831 = !DILocation(line: 368, column: 17, scope: !804)
!832 = !DILocation(line: 371, column: 17, scope: !833)
!833 = distinct !DILexicalBlock(scope: !764, file: !20, line: 370, column: 16)
!834 = !DILocation(line: 371, column: 20, scope: !833)
!835 = !DILocation(line: 371, column: 28, scope: !833)
!836 = !DILocation(line: 371, column: 36, scope: !833)
!837 = !DILocation(line: 371, column: 15, scope: !833)
!838 = !DILocation(line: 372, column: 17, scope: !839)
!839 = distinct !DILexicalBlock(scope: !833, file: !20, line: 372, column: 17)
!840 = !DILocation(line: 372, column: 20, scope: !839)
!841 = !DILocation(line: 372, column: 26, scope: !839)
!842 = !DILocation(line: 372, column: 17, scope: !833)
!843 = !DILocation(line: 373, column: 17, scope: !844)
!844 = distinct !DILexicalBlock(scope: !839, file: !20, line: 372, column: 37)
!845 = !DILocation(line: 373, column: 20, scope: !844)
!846 = !DILocation(line: 373, column: 28, scope: !844)
!847 = !DILocation(line: 373, column: 42, scope: !844)
!848 = !DILocation(line: 374, column: 17, scope: !844)
!849 = !DILocation(line: 374, column: 20, scope: !844)
!850 = !DILocation(line: 374, column: 42, scope: !844)
!851 = !DILocation(line: 375, column: 17, scope: !844)
!852 = !DILocation(line: 375, column: 20, scope: !844)
!853 = !DILocation(line: 375, column: 28, scope: !844)
!854 = !DILocation(line: 375, column: 36, scope: !844)
!855 = !DILocation(line: 375, column: 42, scope: !844)
!856 = !DILocation(line: 376, column: 21, scope: !844)
!857 = !DILocation(line: 376, column: 24, scope: !844)
!858 = !DILocation(line: 376, column: 32, scope: !844)
!859 = !DILocation(line: 376, column: 19, scope: !844)
!860 = !DILocation(line: 377, column: 13, scope: !844)
!861 = !DILocation(line: 378, column: 21, scope: !862)
!862 = distinct !DILexicalBlock(scope: !863, file: !20, line: 378, column: 21)
!863 = distinct !DILexicalBlock(scope: !839, file: !20, line: 377, column: 20)
!864 = !DILocation(line: 378, column: 26, scope: !862)
!865 = !DILocation(line: 378, column: 29, scope: !862)
!866 = !DILocation(line: 378, column: 37, scope: !862)
!867 = !DILocation(line: 378, column: 23, scope: !862)
!868 = !DILocation(line: 378, column: 21, scope: !863)
!869 = !DILocation(line: 379, column: 25, scope: !870)
!870 = distinct !DILexicalBlock(scope: !862, file: !20, line: 378, column: 43)
!871 = !DILocation(line: 379, column: 28, scope: !870)
!872 = !DILocation(line: 379, column: 23, scope: !870)
!873 = !DILocation(line: 380, column: 34, scope: !870)
!874 = !DILocation(line: 380, column: 41, scope: !870)
!875 = !DILocation(line: 380, column: 21, scope: !870)
!876 = !DILocation(line: 381, column: 17, scope: !870)
!877 = !DILocation(line: 382, column: 17, scope: !863)
!878 = !DILocation(line: 382, column: 20, scope: !863)
!879 = !DILocation(line: 382, column: 28, scope: !863)
!880 = !DILocation(line: 382, column: 42, scope: !863)
!881 = !DILocation(line: 383, column: 17, scope: !863)
!882 = !DILocation(line: 383, column: 20, scope: !863)
!883 = !DILocation(line: 383, column: 28, scope: !863)
!884 = !DILocation(line: 383, column: 36, scope: !863)
!885 = !DILocation(line: 383, column: 42, scope: !863)
!886 = !DILocation(line: 384, column: 29, scope: !863)
!887 = !DILocation(line: 384, column: 36, scope: !863)
!888 = !DILocation(line: 384, column: 39, scope: !863)
!889 = !DILocation(line: 384, column: 47, scope: !863)
!890 = !DILocation(line: 384, column: 17, scope: !863)
!891 = distinct !{!891, !758, !892, !423}
!892 = !DILocation(line: 387, column: 5, scope: !751)
!893 = !DILocation(line: 388, column: 5, scope: !751)
!894 = !DILocation(line: 388, column: 12, scope: !751)
!895 = !DILocation(line: 388, column: 18, scope: !751)
!896 = !DILocation(line: 388, column: 24, scope: !751)
!897 = !DILocation(line: 389, column: 1, scope: !751)
!898 = distinct !DISubprogram(name: "rotate_left", scope: !20, file: !20, line: 447, type: !316, scopeLine: 448, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!899 = !DILocalVariable(name: "table", arg: 1, scope: !898, file: !20, line: 447, type: !199)
!900 = !DILocation(line: 447, column: 36, scope: !898)
!901 = !DILocalVariable(name: "x", arg: 2, scope: !898, file: !20, line: 447, type: !204)
!902 = !DILocation(line: 447, column: 51, scope: !898)
!903 = !DILocalVariable(name: "y", scope: !898, file: !20, line: 449, type: !204)
!904 = !DILocation(line: 449, column: 13, scope: !898)
!905 = !DILocation(line: 449, column: 17, scope: !898)
!906 = !DILocation(line: 449, column: 20, scope: !898)
!907 = !DILocation(line: 451, column: 16, scope: !898)
!908 = !DILocation(line: 451, column: 19, scope: !898)
!909 = !DILocation(line: 451, column: 5, scope: !898)
!910 = !DILocation(line: 451, column: 8, scope: !898)
!911 = !DILocation(line: 451, column: 14, scope: !898)
!912 = !DILocation(line: 453, column: 9, scope: !913)
!913 = distinct !DILexicalBlock(scope: !898, file: !20, line: 453, column: 9)
!914 = !DILocation(line: 453, column: 12, scope: !913)
!915 = !DILocation(line: 453, column: 20, scope: !913)
!916 = !DILocation(line: 453, column: 27, scope: !913)
!917 = !DILocation(line: 453, column: 17, scope: !913)
!918 = !DILocation(line: 453, column: 9, scope: !898)
!919 = !DILocation(line: 454, column: 27, scope: !913)
!920 = !DILocation(line: 454, column: 9, scope: !913)
!921 = !DILocation(line: 454, column: 12, scope: !913)
!922 = !DILocation(line: 454, column: 18, scope: !913)
!923 = !DILocation(line: 454, column: 25, scope: !913)
!924 = !DILocation(line: 456, column: 17, scope: !898)
!925 = !DILocation(line: 456, column: 20, scope: !898)
!926 = !DILocation(line: 456, column: 5, scope: !898)
!927 = !DILocation(line: 456, column: 8, scope: !898)
!928 = !DILocation(line: 456, column: 15, scope: !898)
!929 = !DILocation(line: 458, column: 9, scope: !930)
!930 = distinct !DILexicalBlock(scope: !898, file: !20, line: 458, column: 9)
!931 = !DILocation(line: 458, column: 12, scope: !930)
!932 = !DILocation(line: 458, column: 22, scope: !930)
!933 = !DILocation(line: 458, column: 29, scope: !930)
!934 = !DILocation(line: 458, column: 19, scope: !930)
!935 = !DILocation(line: 458, column: 9, scope: !898)
!936 = !DILocation(line: 459, column: 23, scope: !930)
!937 = !DILocation(line: 459, column: 9, scope: !930)
!938 = !DILocation(line: 459, column: 16, scope: !930)
!939 = !DILocation(line: 459, column: 21, scope: !930)
!940 = !DILocation(line: 460, column: 14, scope: !941)
!941 = distinct !DILexicalBlock(scope: !930, file: !20, line: 460, column: 14)
!942 = !DILocation(line: 460, column: 19, scope: !941)
!943 = !DILocation(line: 460, column: 22, scope: !941)
!944 = !DILocation(line: 460, column: 30, scope: !941)
!945 = !DILocation(line: 460, column: 16, scope: !941)
!946 = !DILocation(line: 460, column: 14, scope: !930)
!947 = !DILocation(line: 461, column: 27, scope: !941)
!948 = !DILocation(line: 461, column: 9, scope: !941)
!949 = !DILocation(line: 461, column: 12, scope: !941)
!950 = !DILocation(line: 461, column: 20, scope: !941)
!951 = !DILocation(line: 461, column: 25, scope: !941)
!952 = !DILocation(line: 463, column: 28, scope: !941)
!953 = !DILocation(line: 463, column: 9, scope: !941)
!954 = !DILocation(line: 463, column: 12, scope: !941)
!955 = !DILocation(line: 463, column: 20, scope: !941)
!956 = !DILocation(line: 463, column: 26, scope: !941)
!957 = !DILocation(line: 465, column: 17, scope: !898)
!958 = !DILocation(line: 465, column: 5, scope: !898)
!959 = !DILocation(line: 465, column: 8, scope: !898)
!960 = !DILocation(line: 465, column: 15, scope: !898)
!961 = !DILocation(line: 466, column: 17, scope: !898)
!962 = !DILocation(line: 466, column: 5, scope: !898)
!963 = !DILocation(line: 466, column: 8, scope: !898)
!964 = !DILocation(line: 466, column: 15, scope: !898)
!965 = !DILocation(line: 467, column: 1, scope: !898)
!966 = distinct !DISubprogram(name: "rotate_right", scope: !20, file: !20, line: 418, type: !316, scopeLine: 419, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!967 = !DILocalVariable(name: "table", arg: 1, scope: !966, file: !20, line: 418, type: !199)
!968 = !DILocation(line: 418, column: 37, scope: !966)
!969 = !DILocalVariable(name: "x", arg: 2, scope: !966, file: !20, line: 418, type: !204)
!970 = !DILocation(line: 418, column: 52, scope: !966)
!971 = !DILocalVariable(name: "y", scope: !966, file: !20, line: 420, type: !204)
!972 = !DILocation(line: 420, column: 13, scope: !966)
!973 = !DILocation(line: 420, column: 17, scope: !966)
!974 = !DILocation(line: 420, column: 20, scope: !966)
!975 = !DILocation(line: 422, column: 15, scope: !966)
!976 = !DILocation(line: 422, column: 18, scope: !966)
!977 = !DILocation(line: 422, column: 5, scope: !966)
!978 = !DILocation(line: 422, column: 8, scope: !966)
!979 = !DILocation(line: 422, column: 13, scope: !966)
!980 = !DILocation(line: 424, column: 9, scope: !981)
!981 = distinct !DILexicalBlock(scope: !966, file: !20, line: 424, column: 9)
!982 = !DILocation(line: 424, column: 12, scope: !981)
!983 = !DILocation(line: 424, column: 21, scope: !981)
!984 = !DILocation(line: 424, column: 28, scope: !981)
!985 = !DILocation(line: 424, column: 18, scope: !981)
!986 = !DILocation(line: 424, column: 9, scope: !966)
!987 = !DILocation(line: 425, column: 28, scope: !981)
!988 = !DILocation(line: 425, column: 9, scope: !981)
!989 = !DILocation(line: 425, column: 12, scope: !981)
!990 = !DILocation(line: 425, column: 19, scope: !981)
!991 = !DILocation(line: 425, column: 26, scope: !981)
!992 = !DILocation(line: 427, column: 17, scope: !966)
!993 = !DILocation(line: 427, column: 20, scope: !966)
!994 = !DILocation(line: 427, column: 5, scope: !966)
!995 = !DILocation(line: 427, column: 8, scope: !966)
!996 = !DILocation(line: 427, column: 15, scope: !966)
!997 = !DILocation(line: 429, column: 9, scope: !998)
!998 = distinct !DILexicalBlock(scope: !966, file: !20, line: 429, column: 9)
!999 = !DILocation(line: 429, column: 12, scope: !998)
!1000 = !DILocation(line: 429, column: 22, scope: !998)
!1001 = !DILocation(line: 429, column: 29, scope: !998)
!1002 = !DILocation(line: 429, column: 19, scope: !998)
!1003 = !DILocation(line: 429, column: 9, scope: !966)
!1004 = !DILocation(line: 430, column: 23, scope: !998)
!1005 = !DILocation(line: 430, column: 9, scope: !998)
!1006 = !DILocation(line: 430, column: 16, scope: !998)
!1007 = !DILocation(line: 430, column: 21, scope: !998)
!1008 = !DILocation(line: 431, column: 14, scope: !1009)
!1009 = distinct !DILexicalBlock(scope: !998, file: !20, line: 431, column: 14)
!1010 = !DILocation(line: 431, column: 19, scope: !1009)
!1011 = !DILocation(line: 431, column: 22, scope: !1009)
!1012 = !DILocation(line: 431, column: 30, scope: !1009)
!1013 = !DILocation(line: 431, column: 16, scope: !1009)
!1014 = !DILocation(line: 431, column: 14, scope: !998)
!1015 = !DILocation(line: 432, column: 28, scope: !1009)
!1016 = !DILocation(line: 432, column: 9, scope: !1009)
!1017 = !DILocation(line: 432, column: 12, scope: !1009)
!1018 = !DILocation(line: 432, column: 20, scope: !1009)
!1019 = !DILocation(line: 432, column: 26, scope: !1009)
!1020 = !DILocation(line: 434, column: 27, scope: !1009)
!1021 = !DILocation(line: 434, column: 9, scope: !1009)
!1022 = !DILocation(line: 434, column: 12, scope: !1009)
!1023 = !DILocation(line: 434, column: 20, scope: !1009)
!1024 = !DILocation(line: 434, column: 25, scope: !1009)
!1025 = !DILocation(line: 436, column: 17, scope: !966)
!1026 = !DILocation(line: 436, column: 5, scope: !966)
!1027 = !DILocation(line: 436, column: 8, scope: !966)
!1028 = !DILocation(line: 436, column: 15, scope: !966)
!1029 = !DILocation(line: 437, column: 17, scope: !966)
!1030 = !DILocation(line: 437, column: 5, scope: !966)
!1031 = !DILocation(line: 437, column: 8, scope: !966)
!1032 = !DILocation(line: 437, column: 15, scope: !966)
!1033 = !DILocation(line: 438, column: 1, scope: !966)
!1034 = distinct !DISubprogram(name: "balanced", scope: !20, file: !20, line: 538, type: !1035, scopeLine: 538, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!1035 = !DISubroutineType(types: !1036)
!1036 = !{!18, !199}
!1037 = !DILocalVariable(name: "t", arg: 1, scope: !1034, file: !20, line: 538, type: !199)
!1038 = !DILocation(line: 538, column: 25, scope: !1034)
!1039 = !DILocation(line: 539, column: 23, scope: !1034)
!1040 = !DILocation(line: 539, column: 26, scope: !1034)
!1041 = !DILocation(line: 539, column: 29, scope: !1034)
!1042 = !DILocation(line: 539, column: 35, scope: !1034)
!1043 = !DILocation(line: 539, column: 16, scope: !1034)
!1044 = !DILocation(line: 539, column: 50, scope: !1034)
!1045 = !DILocation(line: 539, column: 53, scope: !1034)
!1046 = !DILocation(line: 539, column: 56, scope: !1034)
!1047 = !DILocation(line: 539, column: 62, scope: !1034)
!1048 = !DILocation(line: 539, column: 43, scope: !1034)
!1049 = !DILocation(line: 539, column: 41, scope: !1034)
!1050 = !DILocation(line: 539, column: 12, scope: !1034)
!1051 = !DILocation(line: 539, column: 70, scope: !1034)
!1052 = !DILocation(line: 539, column: 5, scope: !1034)
!1053 = distinct !DISubprogram(name: "height", scope: !20, file: !20, line: 527, type: !1054, scopeLine: 527, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!1054 = !DISubroutineType(types: !1055)
!1055 = !{!18, !199, !204}
!1056 = !DILocalVariable(name: "t", arg: 1, scope: !1053, file: !20, line: 527, type: !199)
!1057 = !DILocation(line: 527, column: 30, scope: !1053)
!1058 = !DILocalVariable(name: "node", arg: 2, scope: !1053, file: !20, line: 527, type: !204)
!1059 = !DILocation(line: 527, column: 41, scope: !1053)
!1060 = !DILocation(line: 529, column: 9, scope: !1061)
!1061 = distinct !DILexicalBlock(scope: !1053, file: !20, line: 529, column: 9)
!1062 = !DILocation(line: 529, column: 17, scope: !1061)
!1063 = !DILocation(line: 529, column: 20, scope: !1061)
!1064 = !DILocation(line: 529, column: 14, scope: !1061)
!1065 = !DILocation(line: 529, column: 9, scope: !1053)
!1066 = !DILocation(line: 530, column: 9, scope: !1061)
!1067 = !DILocalVariable(name: "leftHeight", scope: !1053, file: !20, line: 532, type: !18)
!1068 = !DILocation(line: 532, column: 9, scope: !1053)
!1069 = !DILocation(line: 532, column: 29, scope: !1053)
!1070 = !DILocation(line: 532, column: 32, scope: !1053)
!1071 = !DILocation(line: 532, column: 38, scope: !1053)
!1072 = !DILocation(line: 532, column: 22, scope: !1053)
!1073 = !DILocalVariable(name: "rightHeight", scope: !1053, file: !20, line: 533, type: !18)
!1074 = !DILocation(line: 533, column: 9, scope: !1053)
!1075 = !DILocation(line: 533, column: 30, scope: !1053)
!1076 = !DILocation(line: 533, column: 33, scope: !1053)
!1077 = !DILocation(line: 533, column: 39, scope: !1053)
!1078 = !DILocation(line: 533, column: 23, scope: !1053)
!1079 = !DILocation(line: 535, column: 12, scope: !1053)
!1080 = !DILocation(line: 535, column: 25, scope: !1053)
!1081 = !DILocation(line: 535, column: 23, scope: !1053)
!1082 = !DILocation(line: 535, column: 5, scope: !1053)
!1083 = !DILocation(line: 536, column: 1, scope: !1053)
!1084 = distinct !DISubprogram(name: "sorted", scope: !20, file: !20, line: 558, type: !1035, scopeLine: 558, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !19, retainedNodes: !35)
!1085 = !DILocalVariable(name: "t", arg: 1, scope: !1084, file: !20, line: 558, type: !199)
!1086 = !DILocation(line: 558, column: 23, scope: !1084)
!1087 = !DILocation(line: 559, column: 21, scope: !1084)
!1088 = !DILocation(line: 559, column: 24, scope: !1084)
!1089 = !DILocation(line: 559, column: 27, scope: !1084)
!1090 = !DILocation(line: 559, column: 12, scope: !1084)
!1091 = !DILocation(line: 559, column: 5, scope: !1084)
!1092 = distinct !DISubprogram(name: "isSorted", scope: !20, file: !20, line: 542, type: !1054, scopeLine: 542, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!1093 = !DILocalVariable(name: "t", arg: 1, scope: !1092, file: !20, line: 542, type: !199)
!1094 = !DILocation(line: 542, column: 32, scope: !1092)
!1095 = !DILocalVariable(name: "node", arg: 2, scope: !1092, file: !20, line: 542, type: !204)
!1096 = !DILocation(line: 542, column: 43, scope: !1092)
!1097 = !DILocation(line: 544, column: 9, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1092, file: !20, line: 544, column: 9)
!1099 = !DILocation(line: 544, column: 17, scope: !1098)
!1100 = !DILocation(line: 544, column: 20, scope: !1098)
!1101 = !DILocation(line: 544, column: 14, scope: !1098)
!1102 = !DILocation(line: 544, column: 9, scope: !1092)
!1103 = !DILocation(line: 545, column: 9, scope: !1098)
!1104 = !DILocalVariable(name: "maxLeft", scope: !1092, file: !20, line: 547, type: !204)
!1105 = !DILocation(line: 547, column: 13, scope: !1092)
!1106 = !DILocation(line: 547, column: 32, scope: !1092)
!1107 = !DILocation(line: 547, column: 35, scope: !1092)
!1108 = !DILocation(line: 547, column: 41, scope: !1092)
!1109 = !DILocation(line: 547, column: 23, scope: !1092)
!1110 = !DILocalVariable(name: "minRight", scope: !1092, file: !20, line: 548, type: !204)
!1111 = !DILocation(line: 548, column: 13, scope: !1092)
!1112 = !DILocation(line: 548, column: 33, scope: !1092)
!1113 = !DILocation(line: 548, column: 36, scope: !1092)
!1114 = !DILocation(line: 548, column: 42, scope: !1092)
!1115 = !DILocation(line: 548, column: 24, scope: !1092)
!1116 = !DILocation(line: 550, column: 10, scope: !1117)
!1117 = distinct !DILexicalBlock(scope: !1092, file: !20, line: 550, column: 9)
!1118 = !DILocation(line: 550, column: 21, scope: !1117)
!1119 = !DILocation(line: 550, column: 24, scope: !1117)
!1120 = !DILocation(line: 550, column: 18, scope: !1117)
!1121 = !DILocation(line: 550, column: 33, scope: !1117)
!1122 = !DILocation(line: 550, column: 36, scope: !1117)
!1123 = !DILocation(line: 550, column: 42, scope: !1117)
!1124 = !DILocation(line: 550, column: 48, scope: !1117)
!1125 = !DILocation(line: 550, column: 57, scope: !1117)
!1126 = !DILocation(line: 550, column: 46, scope: !1117)
!1127 = !DILocation(line: 550, column: 62, scope: !1117)
!1128 = !DILocation(line: 551, column: 10, scope: !1117)
!1129 = !DILocation(line: 551, column: 22, scope: !1117)
!1130 = !DILocation(line: 551, column: 25, scope: !1117)
!1131 = !DILocation(line: 551, column: 19, scope: !1117)
!1132 = !DILocation(line: 551, column: 34, scope: !1117)
!1133 = !DILocation(line: 551, column: 38, scope: !1117)
!1134 = !DILocation(line: 551, column: 44, scope: !1117)
!1135 = !DILocation(line: 551, column: 50, scope: !1117)
!1136 = !DILocation(line: 551, column: 60, scope: !1117)
!1137 = !DILocation(line: 551, column: 48, scope: !1117)
!1138 = !DILocation(line: 550, column: 9, scope: !1092)
!1139 = !DILocation(line: 552, column: 9, scope: !1117)
!1140 = !DILocation(line: 554, column: 21, scope: !1092)
!1141 = !DILocation(line: 554, column: 24, scope: !1092)
!1142 = !DILocation(line: 554, column: 30, scope: !1092)
!1143 = !DILocation(line: 554, column: 12, scope: !1092)
!1144 = !DILocation(line: 554, column: 36, scope: !1092)
!1145 = !DILocation(line: 554, column: 48, scope: !1092)
!1146 = !DILocation(line: 554, column: 51, scope: !1092)
!1147 = !DILocation(line: 554, column: 57, scope: !1092)
!1148 = !DILocation(line: 554, column: 39, scope: !1092)
!1149 = !DILocation(line: 0, scope: !1092)
!1150 = !DILocation(line: 554, column: 5, scope: !1092)
!1151 = !DILocation(line: 556, column: 1, scope: !1092)
!1152 = distinct !DISubprogram(name: "tree_max", scope: !20, file: !20, line: 402, type: !454, scopeLine: 403, flags: DIFlagPrototyped, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition, unit: !19, retainedNodes: !35)
!1153 = !DILocalVariable(name: "table", arg: 1, scope: !1152, file: !20, line: 402, type: !343)
!1154 = !DILocation(line: 402, column: 56, scope: !1152)
!1155 = !DILocalVariable(name: "n", arg: 2, scope: !1152, file: !20, line: 402, type: !204)
!1156 = !DILocation(line: 402, column: 71, scope: !1152)
!1157 = !DILocalVariable(name: "s", scope: !1152, file: !20, line: 404, type: !204)
!1158 = !DILocation(line: 404, column: 13, scope: !1152)
!1159 = !DILocation(line: 404, column: 17, scope: !1152)
!1160 = !DILocation(line: 404, column: 24, scope: !1152)
!1161 = !DILocation(line: 406, column: 5, scope: !1152)
!1162 = !DILocation(line: 406, column: 12, scope: !1152)
!1163 = !DILocation(line: 406, column: 15, scope: !1152)
!1164 = !DILocation(line: 406, column: 24, scope: !1152)
!1165 = !DILocation(line: 406, column: 21, scope: !1152)
!1166 = !DILocation(line: 407, column: 13, scope: !1152)
!1167 = !DILocation(line: 407, column: 16, scope: !1152)
!1168 = !DILocation(line: 407, column: 11, scope: !1152)
!1169 = distinct !{!1169, !1161, !1167, !423}
!1170 = !DILocation(line: 408, column: 12, scope: !1152)
!1171 = !DILocation(line: 408, column: 5, scope: !1152)
