int length = 1024;
char names[length*length] = fill_char_vector; //contains random characters
int numbers[length*length];
int sum = 0;

for(int i=0; i<length; i++){
	if(names[i] == 'x'){
		sum = sum + numbers[i]; //accumulate sum
	}
}