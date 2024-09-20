; ModuleID = 'node.c'
source_filename = "node.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Node = type { i32, ptr }

@.str = private unnamed_addr constant [7 x i8] c"%d -> \00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"NULL\0A\00", align 1
@.str.2 = private unnamed_addr constant [62 x i8] c"\E8\AF\B7\E8\BE\93\E5\85\A5\E6\95\B0\E5\AD\97\EF\BC\8C\E6\AF\8F\E8\A1\8C\E4\B8\80\E4\B8\AA\EF\BC\8C\E8\BE\93\E5\85\A5\E7\A9\BA\E8\A1\8C\E7\BB\93\E6\9D\9F\E8\BE\93\E5\85\A5\EF\BC\9A\0A\00", align 1
@stdin = external global ptr, align 8
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.4 = private unnamed_addr constant [50 x i8] c"\E8\BE\93\E5\85\A5\E6\97\A0\E6\95\88\EF\BC\8C\E8\AF\B7\E8\BE\93\E5\85\A5\E4\B8\80\E4\B8\AA\E6\9C\89\E6\95\88\E7\9A\84\E6\95\B4\E6\95\B0\E3\80\82\0A\00", align 1
@.str.5 = private unnamed_addr constant [26 x i8] c"\E9\93\BE\E8\A1\A8\E4\B8\AD\E7\9A\84\E6\95\B0\E5\AD\97\E4\B8\BA\EF\BC\9A\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local ptr @createNode(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  store i32 %0, ptr %2, align 4
  %4 = call noalias ptr @malloc(i64 noundef 16) #4
  store ptr %4, ptr %3, align 8
  %5 = load i32, ptr %2, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = getelementptr inbounds %struct.Node, ptr %6, i32 0, i32 0
  store i32 %5, ptr %7, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = getelementptr inbounds %struct.Node, ptr %8, i32 0, i32 1
  store ptr null, ptr %9, align 8
  %10 = load ptr, ptr %3, align 8
  ret ptr %10
}

; Function Attrs: nounwind allocsize(0)
declare noalias ptr @malloc(i64 noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @insertAtHead(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  %6 = load i32, ptr %4, align 4
  %7 = call ptr @createNode(i32 noundef %6)
  store ptr %7, ptr %5, align 8
  %8 = load ptr, ptr %3, align 8
  %9 = load ptr, ptr %8, align 8
  %10 = load ptr, ptr %5, align 8
  %11 = getelementptr inbounds %struct.Node, ptr %10, i32 0, i32 1
  store ptr %9, ptr %11, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = load ptr, ptr %3, align 8
  store ptr %12, ptr %13, align 8
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printList(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  store ptr %4, ptr %3, align 8
  br label %5

5:                                                ; preds = %8, %1
  %6 = load ptr, ptr %3, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %8, label %16

8:                                                ; preds = %5
  %9 = load ptr, ptr %3, align 8
  %10 = getelementptr inbounds %struct.Node, ptr %9, i32 0, i32 0
  %11 = load i32, ptr %10, align 8
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef %11)
  %13 = load ptr, ptr %3, align 8
  %14 = getelementptr inbounds %struct.Node, ptr %13, i32 0, i32 1
  %15 = load ptr, ptr %14, align 8
  store ptr %15, ptr %3, align 8
  br label %5, !llvm.loop !6

16:                                               ; preds = %5
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @freeList(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  br label %4

4:                                                ; preds = %7, %1
  %5 = load ptr, ptr %2, align 8
  %6 = icmp ne ptr %5, null
  br i1 %6, label %7, label %13

7:                                                ; preds = %4
  %8 = load ptr, ptr %2, align 8
  store ptr %8, ptr %3, align 8
  %9 = load ptr, ptr %2, align 8
  %10 = getelementptr inbounds %struct.Node, ptr %9, i32 0, i32 1
  %11 = load ptr, ptr %10, align 8
  store ptr %11, ptr %2, align 8
  %12 = load ptr, ptr %3, align 8
  call void @free(ptr noundef %12) #5
  br label %4, !llvm.loop !8

13:                                               ; preds = %4
  ret void
}

; Function Attrs: nounwind
declare void @free(ptr noundef) #3

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca ptr, align 8
  %3 = alloca [100 x i8], align 16
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store ptr null, ptr %2, align 8
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  br label %6

6:                                                ; preds = %26, %0
  %7 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %8 = load ptr, ptr @stdin, align 8
  %9 = call ptr @fgets(ptr noundef %7, i32 noundef 100, ptr noundef %8)
  %10 = icmp ne ptr %9, null
  br i1 %10, label %11, label %16

11:                                               ; preds = %6
  %12 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %13 = load i8, ptr %12, align 16
  %14 = sext i8 %13 to i32
  %15 = icmp ne i32 %14, 10
  br label %16

16:                                               ; preds = %11, %6
  %17 = phi i1 [ false, %6 ], [ %15, %11 ]
  br i1 %17, label %18, label %27

18:                                               ; preds = %16
  %19 = getelementptr inbounds [100 x i8], ptr %3, i64 0, i64 0
  %20 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef %19, ptr noundef @.str.3, ptr noundef %4) #5
  %21 = icmp eq i32 %20, 1
  br i1 %21, label %22, label %24

22:                                               ; preds = %18
  %23 = load i32, ptr %4, align 4
  call void @insertAtHead(ptr noundef %2, i32 noundef %23)
  br label %26

24:                                               ; preds = %18
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  br label %26

26:                                               ; preds = %24, %22
  br label %6, !llvm.loop !9

27:                                               ; preds = %16
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.5)
  %29 = load ptr, ptr %2, align 8
  call void @printList(ptr noundef %29)
  %30 = load ptr, ptr %2, align 8
  call void @freeList(ptr noundef %30)
  ret i32 0
}

declare ptr @fgets(ptr noundef, i32 noundef, ptr noundef) #2

; Function Attrs: nounwind
declare i32 @__isoc99_sscanf(ptr noundef, ptr noundef, ...) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind allocsize(0) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
