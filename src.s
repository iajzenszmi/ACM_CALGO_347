	.file	"src.f"
	.text
	.globl	sort_
	.type	sort_, @function
sort_:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$72, %rsp
	movq	%rdi, -168(%rbp)
	movq	%rsi, -176(%rbp)
	movq	%rdx, -184(%rbp)
	movl	$1, -20(%rbp)
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -4(%rbp)
	movq	-184(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -8(%rbp)
.L22:
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	jge	.L31
	jmp	.L2
.L38:
	nop
.L2:
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
	movl	-8(%rbp), %edx
	movl	-4(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -28(%rbp)
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	movl	%eax, -24(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	cmpl	%eax, -24(%rbp)
	jge	.L32
	movl	-4(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %edx
	movq	-168(%rbp), %rax
	movl	%edx, (%rax,%rcx,4)
	movl	-4(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-168(%rbp), %rax
	movl	-24(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	movl	%eax, -24(%rbp)
	jmp	.L5
.L32:
	nop
.L5:
	movl	-8(%rbp), %eax
	movl	%eax, -16(%rbp)
	movl	-8(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L33
	movl	-8(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %edx
	movq	-168(%rbp), %rax
	movl	%edx, (%rax,%rcx,4)
	movl	-8(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-168(%rbp), %rax
	movl	-24(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	movl	%eax, -24(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	cmpl	%eax, -24(%rbp)
	jge	.L34
	movl	-4(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %edx
	movq	-168(%rbp), %rax
	movl	%edx, (%rax,%rcx,4)
	movl	-4(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-168(%rbp), %rax
	movl	-24(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	movl	%eax, -24(%rbp)
	jmp	.L9
.L35:
	nop
	movl	-12(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-16(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %edx
	movq	-168(%rbp), %rax
	movl	%edx, (%rax,%rcx,4)
	movl	-12(%rbp), %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-168(%rbp), %rax
	movl	-32(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	jmp	.L9
.L33:
	nop
	jmp	.L9
.L34:
	nop
.L9:
	subl	$1, -16(%rbp)
	movl	-16(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	cmpl	%eax, -24(%rbp)
	jge	.L10
	jmp	.L9
.L10:
	movl	-16(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	movl	%eax, -32(%rbp)
.L12:
	addl	$1, -12(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	cmpl	%eax, -24(%rbp)
	jle	.L11
	jmp	.L12
.L11:
	movl	-12(%rbp), %eax
	cmpl	-16(%rbp), %eax
	jle	.L35
	movl	-16(%rbp), %eax
	subl	-4(%rbp), %eax
	movl	%eax, %edx
	movl	-8(%rbp), %eax
	subl	-12(%rbp), %eax
	cmpl	%eax, %edx
	jle	.L36
	movl	-20(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-4(%rbp), %eax
	movl	%eax, -96(%rbp,%rdx,4)
	movl	-20(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-16(%rbp), %eax
	movl	%eax, -160(%rbp,%rdx,4)
	movl	-12(%rbp), %eax
	movl	%eax, -4(%rbp)
	addl	$1, -20(%rbp)
	jmp	.L17
.L36:
	nop
	movl	-20(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-12(%rbp), %eax
	movl	%eax, -96(%rbp,%rdx,4)
	movl	-20(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-8(%rbp), %eax
	movl	%eax, -160(%rbp,%rdx,4)
	movl	-16(%rbp), %eax
	movl	%eax, -8(%rbp)
	addl	$1, -20(%rbp)
	jmp	.L17
.L31:
	nop
	jmp	.L3
.L39:
	nop
.L3:
	subl	$1, -20(%rbp)
	cmpl	$0, -20(%rbp)
	je	.L37
	movl	-20(%rbp), %eax
	cltq
	subq	$1, %rax
	movl	-96(%rbp,%rax,4), %eax
	movl	%eax, -4(%rbp)
	movl	-20(%rbp), %eax
	cltq
	subq	$1, %rax
	movl	-160(%rbp,%rax,4), %eax
	movl	%eax, -8(%rbp)
.L17:
	movl	-8(%rbp), %eax
	subl	-4(%rbp), %eax
	movl	%eax, %edx
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, %edx
	jge	.L38
	movq	-176(%rbp), %rax
	movl	(%rax), %eax
	cmpl	%eax, -4(%rbp)
	jne	.L21
	jmp	.L22
.L21:
	subl	$1, -4(%rbp)
.L25:
	addl	$1, -4(%rbp)
	movl	-4(%rbp), %eax
	cmpl	-8(%rbp), %eax
	je	.L39
	movl	-4(%rbp), %eax
	addl	$1, %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	movl	%eax, -24(%rbp)
	movl	-4(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	cmpl	%eax, -24(%rbp)
	jl	.L24
	jmp	.L25
.L24:
	movl	-4(%rbp), %eax
	movl	%eax, -12(%rbp)
.L27:
	movl	-12(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movl	-12(%rbp), %eax
	addl	$1, %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %edx
	movq	-168(%rbp), %rax
	movl	%edx, (%rax,%rcx,4)
	subl	$1, -12(%rbp)
	movl	-12(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-168(%rbp), %rax
	movl	(%rax,%rdx,4), %eax
	cmpl	%eax, -24(%rbp)
	jge	.L26
	jmp	.L27
.L26:
	movl	-12(%rbp), %eax
	addl	$1, %eax
	cltq
	leaq	-1(%rax), %rcx
	movq	-168(%rbp), %rax
	movl	-24(%rbp), %edx
	movl	%edx, (%rax,%rcx,4)
	jmp	.L25
.L37:
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	sort_, .-sort_
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04.1) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
