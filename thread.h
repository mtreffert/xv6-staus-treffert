#include "types.h"
#include "user.h"


int thread_create(void*(*start_routine)(void *), void *arg){
	
	//Allocate stack using process heap
	void * stack = malloc(4096);

	//create new thread
	if(fork_thread(stack) == 0){
		//if we are in the child, call to routine
		printf(2, "HERE\n");
		start_routine(arg);			
			
	}
	
	return 0;
}

void thread_wait(){
	
	int pid = wait_thread();
	//free(
	printf(2, "EXITING PID %d\n", pid);
	return;
}
