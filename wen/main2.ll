; ModuleID = 'main.c'
source_filename = "main.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.1 = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nofree nounwind uwtable
define dso_local noundef i32 @main() local_unnamed_addr #0 {
  %1 = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %1) #3
  %2 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef nonnull @.str, ptr noundef nonnull %1)
  %3 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 0)
  %4 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef 1)
  %5 = load i32, ptr %1, align 4, !tbaa !5
  %6 = icmp sgt i32 %5, 1
  br i1 %6, label %7, label %43

7:                                                ; preds = %0
  %8 = add nsw i32 %5, -1
  %9 = add nsw i32 %5, -2
  %10 = and i32 %8, 7
  %11 = icmp ult i32 %9, 7
  br i1 %11, label %28, label %12

12:                                               ; preds = %7
  %13 = and i32 %8, -8
  br label %14

14:                                               ; preds = %14, %12
  %15 = phi i32 [ 0, %12 ], [ %24, %14 ]
  %16 = phi i32 [ 1, %12 ], [ %25, %14 ]
  %17 = phi i32 [ 0, %12 ], [ %26, %14 ]
  %18 = add nsw i32 %15, %16
  %19 = add nsw i32 %16, %18
  %20 = add nsw i32 %18, %19
  %21 = add nsw i32 %19, %20
  %22 = add nsw i32 %20, %21
  %23 = add nsw i32 %21, %22
  %24 = add nsw i32 %22, %23
  %25 = add nsw i32 %23, %24
  %26 = add i32 %17, 8
  %27 = icmp eq i32 %26, %13
  br i1 %27, label %28, label %14, !llvm.loop !9

28:                                               ; preds = %14, %7
  %29 = phi i32 [ undef, %7 ], [ %25, %14 ]
  %30 = phi i32 [ 0, %7 ], [ %24, %14 ]
  %31 = phi i32 [ 1, %7 ], [ %25, %14 ]
  %32 = icmp eq i32 %10, 0
  br i1 %32, label %40, label %33

33:                                               ; preds = %28, %33
  %34 = phi i32 [ %35, %33 ], [ %30, %28 ]
  %35 = phi i32 [ %37, %33 ], [ %31, %28 ]
  %36 = phi i32 [ %38, %33 ], [ 0, %28 ]
  %37 = add nsw i32 %34, %35
  %38 = add i32 %36, 1
  %39 = icmp eq i32 %38, %10
  br i1 %39, label %40, label %33, !llvm.loop !11

40:                                               ; preds = %33, %28
  %41 = phi i32 [ %29, %28 ], [ %37, %33 ]
  %42 = add nsw i32 %41, 3
  br label %43

43:                                               ; preds = %40, %0
  %44 = phi i32 [ 4, %0 ], [ %42, %40 ]
  %45 = call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i32 noundef %44)
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %1) #3
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nofree nounwind
declare noundef i32 @__isoc99_scanf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.unroll.disable"}
