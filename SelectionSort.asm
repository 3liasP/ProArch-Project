# A low-level implementation of the Selection Sort
# algorithm using RISC-V assembly-language
# Program needs the size of the array and its elements
# hardcoded, but they can be easily swapped by editing
# the source code
 
# This part is comparable to the start of main -function of the Java-program
addi sp, sp, 10000 # Add 10 000 into Stack Pointer
# Storing the array values into memory at address 0x0
# The is array now following:
# {27, 20, 18, 27, 75, 40, 57, 26, 97}
# Using temporary register t0 to temporarily hold the values
addi a0, x0, 0
addi t0, x0, 27 # Adding values, these immediates can be edited
sw t0, 0(a0)    # Store word (value of temp 0) into the corresponding address
addi t0, x0, 20 # Repeating the same steps for every element of the array
sw t0, 4(a0)
addi t0, x0, 18
sw t0, 8(a0)
addi t0, x0, 27
sw t0, 12(a0)
addi t0, x0, 75
sw t0, 16(a0)
addi t0, x0, 40
sw t0, 20(a0)
addi t0, x0, 57
sw t0, 24(a0)
addi t0, x0, 26
sw t0, 28(a0)
addi t0, x0, 97
sw t0, 32(a0)
# The array is now initialized, and the values of the elements are stored.
# Next, we add the length of the array into register a1
addi a1, x0, 9   # 9 is the length of "arr", in Java "arr.length"
 
# Here we have a Jump And Link to SEL_SORT and END_PROGRAM
# SEL_SORT will be running until the array is sorted
jal ra, SEL_SORT 
jal ra, END_PROGRAM
 
SEL_SORT:
addi sp, sp, -8 # -8 (1 word) from Stack Pointer
sw ra, 4(sp) # Initialize the Return Address
sw s0, 0(sp) # Initialize the address for "n"
addi t0, x0, 0 # Initialize i
addi t1, x0, 0 # Initialize j
addi t2, x0, 0 # Initialize min_index
addi s0, a1, 0  # Store n
addi a1, a1, -1 # Set n = n - 1
 
UNSORTED_ARRAY_LOOP: # The outer loop
beq t0, a1, END_UNSORTED_ARRAY_LOOP # in Java "for (int i = 0; i < n-1; i++)"
addi t2, t0, 0   # Set min_index = i
addi t1, t0, 1   # Set j = i + 1
 
SUBARRAY_LOOP: # The inner loop
beq t1, s0, END_SUBARRAY_LOOP # in Java "for (int j = i+1; j < n; j++)"
slli t5, t1, 2  # j * 4, moves the bits to left
add t6, a0, t5  # arr[j]
lw t4, 0(t6)    # Load arr[j]   
slli t5, t2, 2  # min_index * 4, moves the bits to left
add t6, a0, t5  # arr[min_index]
lw t3, 0(t6)    # Load arr[min_index] 
blt t3, t4, MIN_STAYS_SAME # if (arr[j] < arr[min_idx]), min_idx is not changed
addi t2, t1,0   # Set min_index = j
 
MIN_STAYS_SAME: # If min_index is not changed, we’ll go back to inner loop
addi t1, t1, 1  # Set j++
beq x0, x0, SUBARRAY_LOOP
 
END_SUBARRAY_LOOP: # When the inner loop has ended
slli t5, t2, 2    # min_index * 4, moves the bits to left
add t6, a0, t5    # arr[min_index]
lw t3, 0(t6)      # Load arr[min_index]  
slli t1, t0, 2    # i * 4, moves the bits to left
add t1, t1, a0    # arr[i] 
lw t4, 0(t1)      # Load arr[i]
sw t3, 0(t1)
sw t4, 0(t6)      # Swap the found minimum element with the first element
addi t0, t0, 1    # Set i++
beq x0, x0, UNSORTED_ARRAY_LOOP # Move to outer loop
 
END_UNSORTED_ARRAY_LOOP: 
lw s0, 0(sp)
lw ra, 4(sp)
addi sp, sp, 8
jalr x0, ra, 0
 
END_PROGRAM: # Jump to here happens after the array is fully sorted
