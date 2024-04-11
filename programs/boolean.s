WeChat: cstutorcs
QQ: 749389476
Email: tutorcs@163.com
.text
    # test boolean logic instrctions

    addi $r1, $r0, 28       # 0x001c                        28
    addi $r2, $r0, -27      # 0xFFE5                        65509

    xor $r3, $r2, $r1       # 0xFFE5 ^ 0x001c == 0xFFF9     65509 ^ 28 == 65529
    xor $r4, $r2, $r3       # 0xFFE5 ^ 0xFFF9 == 0x001c     65509 ^ 65529 == 28

    and $r5, $r1, $r2       # 0x001c & 0xFFE5 == 0x0004     65509 & 26 == 4
    and $r6, $r3, $r2       # 0xFFF9 & 0xFFE5 == 0xFFE1     65529 & 65509 == 65505
    
    xor $r7, $r6, $r3       # 0xFFE1 ^ 0xFFF9 == 0x0018     65505 ^ 65529 == 24

    halt

.data
