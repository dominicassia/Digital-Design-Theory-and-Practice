# Verilog — *Computer Engineering 270*

[[ Website ]](https://doma.media)[[ EDA-Playgrounds ]](https://www.edaplayground.com/playgrounds/user/206309)[[ Class ]](https://bulletins.psu.edu/university-course-descriptions/undergraduate/cmpen/)
   
<br>

## Assignments

*Breadboard Labs: 1-5, Verilog Labs: 6-11*

|       Assignment     |       Description          |
| ---------------------|--------------------------- | 
| [Lab 01](/Lab-01)    | Lighting an LED, Breadboard & Oscilloscope usage |
| [Lab 02](/Lab-02)    | Working with a digital integrated circuit (IC) |
| [Lab 03](/Lab-03)    | Boolean Algebra, DeMorgan's Law |
| [Lab 04](/Lab-04)    | K-Map & Validation |
| [Lab 05](/Lab-05)    | Combinational logic timing hazards |
| [Lab 06](/Lab-06)    | Intro to Verilog, One bit comparator |
| [Lab 07](/Lab-07)    | Mutilplexer, Comparator, Ripple-carry adder, Divisor, Two's Comp. converter |
| [Lab 08](/Lab-08)    | Flip Flops and Excitation tables |
| [Lab 09](/Lab-09)    | Linear feedback shift register |
| [Lab 10](/Lab-10)    | State machines |
| [Lab 11](/Lab-11)    | Gameboy state machine |


## Table of Contents

- [ What is Verilog?               ](#1)
- [ Coding Structures              ](#2)
- [ — Basic Syntax                 ](#2.1)
- [ — — Variables                  ](#2.1.1)
- [ — — IO                         ](#2.1.2)
- [ — — Modules                    ](#2.1.3)
- [ — — Wires                      ](#2.1.4)
- [ — Gate Level                   ](#2.2)
- [ — Data Flow                    ](#2.3)
- [ — Behaviorial / Algorithmic    ](#2.4)
- [ — Switch Level                 ](#2.5)

<br>

<a name="1"></a>

## What is Verilog?
Verilog is a hardware description language (HDL), which is different from a software language (SL) such as Python or C++. SLs compile into low level code which tells the hardware what to do in order to achieve the software's task. HDLs are used with chips such as FPGAs (Field Programmable Gate Arrays), which have reconfigureable internal logic registers. HDLs can configure these registers to act as described in the code, essentially specifying what type of logic gate should be at what register.

<br>

<a name="2"></a>

## Coding Structures
There are four different techniques to programming a FPGA with Verilog, along with some basics.
**This class only previews the first three coding techniques*

<br>

<a name="2.1"></a>

### Basic Syntax


<a name="2.1.1"></a>

#### *Variables*

Verilog variables are similar to any other language, but offer more options when specifying. Say we wanted the varaible name 'A' to be equal to 12. We can specify this value either as '12' or specify the bits which compose 12: 1100. The syntax goes as follows:

``` verilog
    parameter A = 12;
    parameter A = 4'b1100;
```
*Also written as:*

``` verilog
    parameter A = 12, B = 4'b1100;
```

The ```4'b``` represents the four binary bits that will be used to store the integers following. Parameter is specifying a variable that will be used *within* the module (we will touch on this later). There are many sytaxical prefixes that accompany declarations depending on use case.

Despite using IO, which we discuss in the next section, the square brace scheme and registers are fundamental for verilog.

Some examples:

``` verilog
    reg [1:0] A = 2'b11;    // register A = 2 bit binary 11
    
    assign A = x xor y      // variable A = 2 input XOR, taking in x and y 
```
*This readme doesn't get into full detail, refer to [documentation](https://verilogguide.readthedocs.io/en/latest/verilog/datatype.html)*

<br>

<a name="2.1.2"></a>

##### *IO*

Input and output is most commonly used inside of a module. Declaring input and output inside of a module goes as follows: 

``` verilog
input input_1, input_2;
output my_output;
```

When declaring IO within a module, it is important that the variable names correspond to that in the module's argument. 

<br>

<a name="2.1.3"></a>

##### *Modules*
Verilog views FPGAs as a multitude of 'modules', which act in a similar fashion to functions in a software language. It is common in computer engineering to simplify devices to block diagrams, i.e. taking a top down view of all components. A module functions as a block which takes input, completes a process, and delivers output. Inside said module is where the following structures can be implemented to produce output. 

``` verilog
module my_module(input_1, input_2, my_output);

input input_1, input_2;
output my_output;
...
endmodule
```

It is important to keep in mind that modules are general structures that can be reused, and implemented inside of and adjacent to other modules. 

<br>

<a name="2.1.4"></a>

##### *Wires* 
Wires are a fundamental concept used in verilog. A wire's simple purpose within Verilog is to make a connection between two devices, whether that be logic gates, flip-flops, etc. Declaring a wire goes as follows:

``` verilog
wire wire_1, wire_2;
```

A wire can be used to feed the output of two modules into another module. This application may be practical in designing a counter. In this example, we can assume we receive input 1 through 4 and output OUTPUT. 

``` verilog
// Define wires
wire wire_1, wire_2;

// Define module 1
module m_1(input_1, input_2, wire_1);
...
endmodule

// Define module 2
module m_2(input_3, input_4, wire_2);
...
endmodule

// Define module 3
module m_3(wire_1, wire_2, OUTPUT);
...
endmodule
```

</br>

<a name="2.2"></a>

### Gate Level
This coding style is the most fundamental way of programming a FPGA. Gate level coding is essentially describing each gate needed within the chip, along with assigning connecting wires. Declaring a two input AND gate goes as follows:

``` verilog
and my_and_gate(my_output, input_1, input_2);
```

Declarations of other gate varieties follow the same pattern. 

</br>

<a name="2.3"></a>

### Data Flow

<a name="2.4"></a>

### Behaviorial / Algorithmic 

<a name="2.5"></a>

### Switch Level


[dominicassia/CE-270 is licensed under the GNU General Public License v3.0](/LICENSE)
