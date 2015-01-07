.globl update
	.type	update, @function
update:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movl	12(%ebp), %eax
	imull	16(%ebp), %eax
	movl	$4, 4(%esp)
	movl	%eax, (%esp)
	call	calloc
	movl	%eax, -28(%ebp)
	movl	$0, -16(%ebp)		#series of initializations to 0
	movl	$0, -12(%ebp)
	movl	$0, -24(%ebp)
	jmp	countLoopPrepLayer1
countLoopPrepLayer2:
	movl	$0, -20(%ebp)
	jmp	loopCheck
countBoard:
	pushl	%ecx			#need to push %ecx for loop instruction to work
	movl	$0, -16(%ebp)
	cmpl	$0, -20(%ebp)
	je	countIf2
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	subl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	movl	%eax, -16(%ebp)
countIf2:
	cmpl	$0, -24(%ebp)
	je	countIf3
	movl	-24(%ebp), %eax
	subl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	%eax, -16(%ebp)
countIf3:
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	je	countIf4
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	addl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	%eax, -16(%ebp)
countIf4:
	movl	16(%ebp), %eax
	subl	$1, %eax
	cmpl	-24(%ebp), %eax
	je	countIf5
	movl	-24(%ebp), %eax
	addl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	%eax, -16(%ebp)
countIf5:
	cmpl	$0, -24(%ebp)
	je	countIf6
	cmpl	$0, -20(%ebp)
	je	countIf6
	movl	-24(%ebp), %eax
	subl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	subl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	%eax, -16(%ebp)
countIf6:
	movl	16(%ebp), %eax
	subl	$1, %eax
	cmpl	-24(%ebp), %eax
	je	countIf7
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	je	countIf7
	movl	-24(%ebp), %eax
	addl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	addl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	%eax, -16(%ebp)
	jmp	countIf7
countWaypoint:
	jmp	countBoard
countIf7:
	movl	16(%ebp), %eax
	subl	$1, %eax
	cmpl	-24(%ebp), %eax
	je	countIf8
	cmpl	$0, -20(%ebp)
	je	countIf8
	movl	-24(%ebp), %eax
	addl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	subl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	%eax, -16(%ebp)
countIf8:
	cmpl	$0, -24(%ebp)
	je	looper
	movl	12(%ebp), %eax
	subl	$1, %eax
	cmpl	-20(%ebp), %eax
	je	looper
	movl	-24(%ebp), %eax
	subl	$1, %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	addl	$1, %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	addl	%eax, -16(%ebp)
looper:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	-28(%ebp), %eax
	movl	-16(%ebp), %edx
	movl	%edx, (%eax)
	addl	$1, -12(%ebp)
	popl	%ecx
	loop	countWaypoint
	addl	$1, -20(%ebp)
loopCheck:
	movl	12(%ebp), %ecx
	movl	-20(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	countBoard
	addl	$1, -24(%ebp)
countLoopPrepLayer1:
	movl	-24(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	countLoopPrepLayer2
	movl	$0, -12(%ebp)
	movl	$0, -24(%ebp)
	jmp	exitPath
updatePrep:
	movl	$0, -20(%ebp)
	jmp	updateLoopCheck
updateBoard:
	pushl	%ecx
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	-28(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jg	updateIf2
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	updateIf2
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$0, (%eax)
updateIf2:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	-28(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jle	updateIf3
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	cmpl	$1, %eax
	jne	updateIf3
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$0, (%eax)
	jmp	updateIf3
waypoint:
	jmp	updateBoard
updateIf3:
	movl	-12(%ebp), %eax
	sall	$2, %eax
	addl	-28(%ebp), %eax
	movl	(%eax), %eax
	cmpl	$3, %eax
	jne	updateLooper
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	(%eax), %eax
	testl	%eax, %eax
	jne	updateLooper
	movl	-24(%ebp), %eax
	sall	$2, %eax
	addl	8(%ebp), %eax
	movl	(%eax), %eax
	movl	-20(%ebp), %edx
	sall	$2, %edx
	addl	%edx, %eax
	movl	$1, (%eax)
updateLooper:
	addl	$1, -12(%ebp)
	popl	%ecx
	loop	waypoint
	addl	$1, -20(%ebp)
updateLoopCheck:
	movl	12(%ebp), %ecx
	movl	-20(%ebp), %eax
	cmpl	12(%ebp), %eax
	jl	updateBoard
	addl	$1, -24(%ebp)
exitPath:
	movl	-24(%ebp), %eax
	cmpl	16(%ebp), %eax
	jl	updatePrep
	leave				#pre return stack pop
	ret
