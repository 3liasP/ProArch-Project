# Project for Processor Architectures (DTEK0063-3003)

## _Selection sort of integer array in RISC-V Assembly_


## Problem description
The goal of my RISC-V assembly project is to create a selection sort algorithm in RISC-V assembly-language. The assembly program needs to be able to initialize and sort an array of integers. Size of the array and its items (integers) are hard coded into the assembly program. The items of the array can be changed by editing the source code, simply changing the integers added on rows 12 - 31:

``addi t0, x0, [insert value here]``

And the size of the array can be changed at row 33:

``addi a1, x0, [insert value here]``

Selection sort is an in-place comparison sorting algorithm, which means that it only reads the array elements through a single abstract comparison operation (in this case "less than") that determines which of two elements should occur first in the final sorted array. It's time complexity is _O(n^2)_ which makes it quite inefficient on larger arrays, however, in this case and regarding the needed complexity for this project, it performs reasonably well.

The algorithm divides the array in two parts: The sorted subarray of items which is built up from left to right at the left (start) of the array. The unsorted subarray constains remaining unsorted items that occupy the rest of the array. The algorithm proces by finding the smalles element in the unsorted subarray and swaps it with the leftmost unsorted element, and moving the sublist boundaries one element to the right.

This implementation of selection sort sorts the array into ascending order.


## High level implementation
I have written examples of the functionality with a high-level programming language, in this case in Java. There are two High level implementations of the program, one for demonstration purposes and the one I've recreated in RISC-V assembly. ``The SelectionSort.java`` demonstrates the functionality of the program to the user. When run, the user can see the unsorted and sorted arrays printed into the terminal. However, I am going to base my RISC-V assembly program on the more straight-forward ``SimplerSelectionSort.java``, since it doesn't print arrays or use any other functions (or classes) besides the main-function. The ``SelectionSort.java`` is shown only to demonstrate the functionality of the ``simpleBubbleSort.java`` to the user.

I drew a flowchart of the selection sort to demonstrate it's functionality:
![flowchart of the selection sort](C:\Users\tekku\Documents\Yliopisto\Informaatioteknologia\Prosessoriarkkitehtuurit\ProjectExample\ProjectSelectionSort\UML\flowchart.png)



## About the Interpreter
The Cornell CS3410 RISC-V Interpreter is developed as a part teaching aid, and it allows us to run a CPU from 32 to 256 hz clock frequnecy. It allows only a limited set of instructions:

- Arithmetics: ADD, ADDI, SUB
- Logical: AND,ANDI,OR,ORI, XOR,XORI
- Sets: SLT, SLTI, SLTU, SLTIU
- Shifts: SRA, SRAI, SRL, SRLISLL, SLLI
- Memory: LW, SW, LB, SB
- PC: LUI, AUIPC
- Jumps: JAL, JALR
- Branches: BEQ, BNE,BLT, BGE, BLTU, BGEU

Therefore, I'm not able to use all the available "pseudoinstructions" or other instructions defined in the RISC-V Instruction Set Manual. These include e.g. "LI", load immediate, or "MV" to copy a register. However, these can be expanded into [real instructions](https://www.riscfive.com/2022/04/28/risc-v-assembly-tutorial/).