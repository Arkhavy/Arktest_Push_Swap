# Push_Swap Arktester
This tester is my first ever bash script, if something does not work correctly, feel free to mention it to me !

### How to use it ?
1. git clone https://github.com/Arkhavy/Ark_Push_Swap_Tester.git where your binary is located
2. Make sure your checker and your binary exist
3. Rename the checker in the script if needed *(default is checker_Mac)*
4. cd Push_Swap_arktester
5. bash ark_push_swap_test.sh
6. Brace yourself

#### If you have KOs
Each test has a number assigned to it. You can then check the corresponding line in the file of the test.
*Example : if you KO on test 8 of the Parsing test, you can go in **comb/parsing_test.txt** and check line 8 manually*
*I will add in the future a file that will get all combinations that gives you a KO / CKO so you don't have to check things the hard way ;)*

![Arktester scores](https://cdn.discordapp.com/attachments/910254981377052682/928245366279782430/Screen_Shot_2022-01-05_at_12.15.13_PM.png)

## ATTENTION
- The script is currently a Work In Progress
- **The script might give you some random CKO, feel free to launch it again two or more times**
- There is more than 4500 tests done, hope your body is ready *(and your terminal too)*
- I will add some flags in the future to do only some tests and not everything
- I will add a trace in the future to show where it doesn't work and help solve your problems
- Norm test and timeout tests are currently non existent, they will be added in the future
- Since timeout test does not exist yet, **if the script get stuck in an infinite loop**, it's your fault !
- Any feedback is appreciated, any idea for more features too !
