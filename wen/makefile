# 声明伪目标
.PHONY: pre lexer ast-gcc ast-llvm cfg ir-gcc ir-llvm asm obj exe antiobj antiexe clean clean-all

# 预处理生成 main.i 文件
pre:
	gcc main.c -E -o main.i

# 词法分析输出 tokens
lexer:
	clang -E -Xclang -dump-tokens main.c

# 生成 main.c.003t.original 文件 (GCC AST)
ast-gcc:
	gcc -fdump-tree-original-raw main.c

# 生成 main.ll 文件 (LLVM AST)
ast-llvm:
	clang -E -Xclang -ast-dump main.c

# 生成 CFG 文件 (.dot)，可视化使用 Graphviz
cfg:
	gcc -O0 -fdump-tree-all-graph main.c

# 生成 RTL 文件，理解各阶段更迭过程
ir-gcc:
	gcc -O0 -fdump-rtl-all-graph main.c

# 生成 LLVM IR 文件
ir-llvm:
	clang -S -emit-llvm main.c

# 生成汇编代码 main.S
asm:
	gcc -O0 -o main.S -S -masm=att main.i

# 生成目标文件 main.o
obj:
	gcc -O0 -c -o main.o main.S

# 反汇编目标文件
antiobj:
	objdump -d main.o > main-anti-obj.S
	nm main.o > main-nm-obj.txt

# 生成可执行文件 main
exe:
	gcc -O0 -o main main.o

# 反汇编可执行文件
antiexe:
	objdump -d main > main-anti-exe.S
	nm main > main-nm-exe.txt

# 清理中间文件
clean:
	rm -rf *.c.*

# 清理所有生成的文件
clean-all:
	rm -rf *.c.* *.o *.S *.dot *.out *.txt *.ll *.i main
