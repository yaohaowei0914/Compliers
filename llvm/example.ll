; ModuleID = 'example.c'
source_filename = "example.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [27 x i8] c"\E8\AF\B7\E8\BE\93\E5\85\A5\E6\95\B0\E7\BB\84\E7\9A\84\E5\A4\A7\E5\B0\8F: \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [28 x i8] c"\E8\AF\B7\E8\BE\93\E5\85\A5 %d \E4\B8\AA\E6\B5\AE\E7\82\B9\E6\95\B0:\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%f\00", align 1
@.str.4 = private unnamed_addr constant [24 x i8] c"\E6\95\B0\E7\BB\84\E4\B8\AD\E7\9A\84\E5\85\83\E7\B4\A0\E6\98\AF: \00", align 1
@.str.5 = private unnamed_addr constant [30 x i8] c"\0A\E6\95\B0\E7\BB\84\E7\9A\84\E5\B9\B3\E5\9D\87\E5\80\BC\E6\98\AF: %.2f\0A\00", align 1
@.str.6 = private unnamed_addr constant [6 x i8] c"%.2f \00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  store i32 0, ptr %1, align 4
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %8 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %2)
  %9 = load i32, ptr %2, align 4
  %10 = zext i32 %9 to i64
  %11 = call ptr @llvm.stacksave.p0()
  store ptr %11, ptr %3, align 8
  %12 = alloca float, i64 %10, align 16
  store i64 %10, ptr %4, align 8
  %13 = load i32, ptr %2, align 4
  %14 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %13)
  store i32 0, ptr %5, align 4
  br label %15

15:                                               ; preds = %24, %0
  %16 = load i32, ptr %5, align 4
  %17 = load i32, ptr %2, align 4
  %18 = icmp slt i32 %16, %17
  br i1 %18, label %19, label %27

19:                                               ; preds = %15
  %20 = load i32, ptr %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds float, ptr %12, i64 %21
  %23 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.3, ptr noundef %22)
  br label %24

24:                                               ; preds = %19
  %25 = load i32, ptr %5, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, ptr %5, align 4
  br label %15, !llvm.loop !6

27:                                               ; preds = %15
  %28 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  %29 = load i32, ptr %2, align 4
  call void @printArray(ptr noundef %12, i32 noundef %29)
  %30 = load i32, ptr %2, align 4
  %31 = call float @average(ptr noundef %12, i32 noundef %30)
  store float %31, ptr %6, align 4
  %32 = load float, ptr %6, align 4
  %33 = fpext float %32 to double
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, double noundef %33)
  store i32 0, ptr %1, align 4
  %35 = load ptr, ptr %3, align 8
  call void @llvm.stackrestore.p0(ptr %35)
  %36 = load i32, ptr %1, align 4
  ret i32 %36
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare ptr @llvm.stacksave.p0() #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @printArray(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store i32 0, ptr %5, align 4
  br label %6

6:                                                ; preds = %18, %2
  %7 = load i32, ptr %5, align 4
  %8 = load i32, ptr %4, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %21

10:                                               ; preds = %6
  %11 = load ptr, ptr %3, align 8
  %12 = load i32, ptr %5, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, ptr %11, i64 %13
  %15 = load float, ptr %14, align 4
  %16 = fpext float %15 to double
  %17 = call i32 (ptr, ...) @printf(ptr noundef @.str.6, double noundef %16)
  br label %18

18:                                               ; preds = %10
  %19 = load i32, ptr %5, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, ptr %5, align 4
  br label %6, !llvm.loop !8

21:                                               ; preds = %6
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local float @average(ptr noundef %0, i32 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca float, align 4
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 %1, ptr %4, align 4
  store float 0.000000e+00, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %7

7:                                                ; preds = %19, %2
  %8 = load i32, ptr %6, align 4
  %9 = load i32, ptr %4, align 4
  %10 = icmp slt i32 %8, %9
  br i1 %10, label %11, label %22

11:                                               ; preds = %7
  %12 = load ptr, ptr %3, align 8
  %13 = load i32, ptr %6, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds float, ptr %12, i64 %14
  %16 = load float, ptr %15, align 4
  %17 = load float, ptr %5, align 4
  %18 = fadd float %17, %16
  store float %18, ptr %5, align 4
  br label %19

19:                                               ; preds = %11
  %20 = load i32, ptr %6, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %6, align 4
  br label %7, !llvm.loop !9

22:                                               ; preds = %7
  %23 = load float, ptr %5, align 4
  %24 = load i32, ptr %4, align 4
  %25 = sitofp i32 %24 to float
  %26 = fdiv float %23, %25
  ret float %26
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.stackrestore.p0(ptr) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nocallback nofree nosync nounwind willreturn }

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
