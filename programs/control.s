WeChat: cstutorcs
QQ: 749389476
Email: tutorcs@163.com
.text
    # test bgt, beq, jal, j, jr instructions
    # $r5 will have the 'test number' before each branch/jump
    # if $r6 is ever non-zero, something screwed up. (other failure conditions are also possible, of course)
    addi $r1, $r0, 11
    addi $r2, $r0, 12
    addi $r3, $r0, 12
    addi $r4, $r0, 13

    addi $r5, $r0, 1            # TEST 1
    bgt $r1, $r2, fail1         # 11 > 12: branch is *NOT* taken
    
    addi $r5, $r0, 2            # TEST 2
    bgt $r4, $r3, gt_equal      # 13 > 12: branch is taken
    
    # TEST FAIL if you get here
    addi $r6, $r0, 22           # shouldn't be executed
    halt                        # shouldn't be executed
    
    
gt_equal:
    addi $r5, $r0, 3            # TEST 3
    bgt  $r2, $r3, fail1        # 12 < 12: branch is *NOT* taken

    addi $r5, $r0, 4            # TEST 4
    bgt $r4, $r1, gt_neg        # 14 < 11: branch is taken
    
    # TEST FAIL if you get here
    addi $r6, $r0, 23           # shouldn't be executed
    halt                        # shouldn't be executed

gt_neg:
    addi $r1, $r0, -1

    addi $r5, $r0, 5            # TEST 5
    bgt $r1, $r4, fail1         # -1 > 13: branch is *NOT* taken
    
    addi $r5, $r0, 6            # TEST 6
    bgt $r4, $r1, beq_test      # 13 > -1: branch is taken
    
    # TEST FAIL if you get here
    addi $r6, $r0, 24           # shouldn't be executed
    halt                        # shouldn't be executed

fail1:
    # TEST FAIL if you get here
    addi $r6, $r0, 30           # shouldn't be executed
    halt                        # shouldn't be executed

beq_test:
    addi $r5, $r0, 7            # TEST 7
    beq $r4, $r3, fail2         # 14 == 12: branch is *NOT* taken
    
    addi $r5, $r0, 8            # TEST 8
    beq $r2, $r3, jump_test     # 13 == 13: branch is taken
    
    # TEST FAIL if you get here
    addi $r6, $r0, 26           # shouldn't be executed
    halt                        # shouldn't be executed
    
jump_test:
    addi $r5, $r0, 9            # TEST 9
    j jal_test                  # jump over the following fail code
    
    # TEST FAIL if you get here
    addi $r6, $r0, 27           # shouldn't be executed
    halt                        # shouldn't be executed
    
jal_test:
    addi $r5, $r0, 10           # TEST 10
    jal my_func                 # procedure call
    # we should return here after my_func
    
    # END OF TESTS
    addi $r5, $r0, 12           # set r5 to 12 in celebration
    halt                        # Natural end of program (halt loops forever here)

my_func:
    addi $r1, $r1, 2            # increment $r1 from -1 up to +1
    addi $r5, $r0, 11           # TEST 11
    jr $r7                      # return
    
    # TEST FAIL if you get here
    addi $r6, $r0, 29           # shouldn't be executed
    halt                        # shouldn't be executed


fail2:
    # TEST FAIL if you get here
    addi $r6, $r0, 31           # shouldn't be executed
    halt                        # shouldn't be executed

.data
