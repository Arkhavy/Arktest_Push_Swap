# Push_Swap Arktester
This tester is my first ever bash script, if something does not work correctly, feel free to mention it to me !

### How to use it ?
1. git clone https://github.com/Arkhavy/Ark_Push_Swap_Tester.git where your binary is located
2. Make sure your checker and your binary exist
3. Rename the checker in the script if needed *(default is checker_Mac)*
4. cd Ark_Push_Swap_Tester
5. ./arktest.sh
6. Brace yourself

### The tester has flags !
- If you launch the script without flags, it will do all tests (Currently 6912 tests, it might take some time)
- You can use different flags to do only some tests and not all of them !
	- **./arktest.sh -p** will only do parsing tests *(42 tests)*
	- **./arktest.sh -s** will only do 3 digits and 5 digits tests *(126 tests)*
	- **./arktest.sh -m** will only do 100 digits tests *(500 tests)*
	- **./arktest.sh -l** will only do 500 digits tests *(500 tests)*
	- **./arktest.sh -os** will do 3, 4, 5, 6, 7, 8, 9 digits tests *(2370 tests)*
	- **./arktest.sh -om** will do 10, 25, 50, 75, 100 digits tests *(2500 tests)*
	- **./arktest.sh -ol** will do 200, 300, 400, 500 digits tests *(2000 tests)*
	- You can use multiple flags at the same time !
		- **./arktest.sh -p -s -ol** as example will then do **parsing, 3, 5, 200, 300, 400, 500** digits tests !
	- **./arktest.sh -i** will show you informations about results of tests

### There is a trace and additional infos !
- If you have any **Checker KOs, Checker Errors, Timeout, TMIs, Leaks, Crash**, it will be listed in the __**trace.txt**__ created at the start of the script !
- Every series of test has its own **best, average and worst** displayed at the end of each series.
	- You can then see which line gave you the best or worst result and the average of the whole batch of test !

![Arktester scores](https://cdn.discordapp.com/attachments/779263099609022464/936987502898741248/Screen_Shot_2022-01-29_at_3.13.15_PM.png)

![Arktester example](https://cdn.discordapp.com/attachments/779263099609022464/936988273123942421/Screen_Shot_2022-01-29_at_3.16.24_PM.png)

## ATTENTION
- The script is currently a Work In Progress
- There is currently 6912 tests done, hope your body is ready *(and your terminal too)*
- Norm test, leak tests, crash tests and timeout tests are currently non existent, they will be added in the future
- Since timeout test does not exist yet, **if the script get stuck in an infinite loop**, it's your fault !
- Any feedback is appreciated, any idea for more features too !
