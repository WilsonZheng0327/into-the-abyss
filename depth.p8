pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include main.lua
#include player.lua
#include magic_tile.lua
#include collision.lua
__gfx__
000000007777777700999a9000999a9000999a9000999a9000999a9000999a9000999a9000999a90000000000000000000000000000000000000000000000000
000000007777777700aaaaa000aaaaa000aaaaa000aaaaa000aaaaa000aaaaa000aaaaa0a0aaaaa0000000000000000000000000000000000000000000000000
007007007777777700aaf3a000aaf3a00aaf73a000af73a00aaf73a000af73a00aaf73a00aaf73a0000000000000000000000000000000000000000000000000
000770007777777700afffa000afffa0a00fffa00aafffa0a00fffa00aafffa0a00fffe0000fffe0000000000000000000000000000000000000000000000000
00077000777777770004f4000049f9400004f40f0044f4000004f40f0044f4000004f40000f4f40f000000000000000000000000000000000000000000000000
00700700777777770049794000f575f00049794000f979f00049794000f979f00049794000497940000000000000000000000000000000000000000000000000
000000007777777700f555f0000555000f055500000555000f055500000555000f0555f000055500000000000000000000000000000000000000000000000000
0000000077777777000f0f00000f0f0000f00f00000ff00000f00f00000ff00000f00f000000f0f0000000000000000000000000000000000000000000000000
00000000888888880000000000099000000000000009900088800888099777790000000000000000000000000000000000000000000000000000000000000000
00000000888888880000000000977900000999000097790080000008999999990000000000000000000000000000000000000000000000000000000000000000
000000008888888800099990097799900099799009997790800000089aaaaa940000000000000000000000000000000000000000000000000000000000000000
00000000888888880097799009999a900999779009499990000000009aaaaa940000000000000000000000000000000000000000000000000000000000000000
0000000088888888099994900949aa9009a999990949aa90000000009aaaaa940000000000000000000000000000000000000000000000000000000000000000
000000008888888809aa94900949a90009a944990099aa90800000089aaaaa940000000000000000000000000000000000000000000000000000000000000000
000000008888888809aa9900009990000099449000099900800000089aaaaa990000000000000000000000000000000000000000000000000000000000000000
00000000888888880999900000000000000999900000000088800888999999900000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb344444444443bb000bbbbbbbbbb000bb344444444443bbbb334444444433bb44444455554544444444444444444444
bbb3343bbbbbbbbbbbbbbbbbbbbbbbbbbb3444444d4433bb00bb333bb333bb00b33444444444443bb33444444444433b44444555555444444454444444444444
3334444333bbb333bbbbb3333333bb33bb33444444433bbb0b333433334333b0b34424444464443b334444444444443344445555555544444445444444444444
44444444433333443b3b334444433334bbb3444444433bbbbb344444444443bbb33444444444433b344444444444444344445555555444444554444444444444
444444444433444443b3444444444344bbb3344444443bbbb33444494444433bbb344444444443bb344444444444444344444555555544445555544454545544
444544444444445443b4444944444444bbb33444444433bbb34446444444443b0b333443334333b0444444444444444444445555555544445555555545555554
444444444d44444444334d4444444444bb334444445443bbb344444444f4443b00bb333bb333bb00444444444444444444444555555444445554555555565555
44444454444444444434444444444444bb344444444443bbbb344444444443bb000bbbbbbbbbb000444444444444444444445455554444445555555555555f55
45444444444444444444444444444444bb344444444443bb0bbbbb0000bbbb00bbbbb00000bbbbbb444444444444444444444555555544445565555555555f55
44444444444444d444d4444444444444b3444445444443bbbb333bb0bb3b3bb0b333bb000bb33333444444444444444444444555555554445555555555545555
44445444454444449444444445444f44b4444444444443bbb344493bb34433bb334333b0bb334434444444444444444444444556565554545555555545555554
44444444444433444443343344344444b34444444444443bb344443bb344443b446443bbb3344444444444444444444344445555555545444445555554545544
44444444443333344433b3b343333444b34445444444443bb346443bb347443b4444433bbb344444344444444444444344545f45555544444444455444444444
34444333333bbb33333bbbbb33bb3333bb3444444444444bbb33443bb374443b434433bb0b3334333344444444444433454555f5555444444444544444444444
b3433bbbbbbbbbbbbbbbbbbbbbbbbbbbbb3444444444443b0bb3b3bb0bb333bb33333bb000bb333bb33444444444433b444555555f5444444444454444444444
bbbbbbbbbbbbbbbbb00000bbbbbbbbbbbb344444444443bb00bbbb0000bbbbb0bbbbbb00000bbbbbbb333444444433bb44445555555444444444444444444444
000000000000000000003b000bb333b00b333b0000b333b0bbbbbbbbbb3443bb00bbb000bb34443b000000005555555544444555545544444444444455555555
00000000000000000003b000bb333b3bb3b333bbbb333b3bbbb3343bb33443bb0bb3bb00b334433b000000005055565544445555555444444444444455555555
0003300000000000000bb300b33b33333333b33bb33b333333344443b34443bbbb3333b0b344443b000000005555505644444555554544444444444455555555
03333300333330000003b000b3b3b3bbb48b333bb333b4bb44444444b344443bb33443bbb334443b000000005565555544445555555444444444444455555555
0333333333333300000b30003333333b3b4338333334334b44444444b344443bb344433bbb34433b000000005555555554545545545554544444444455555555
33333333333333000003b300b33b3b333843b43bb34b334333444433b344444bb344943b0b3333bb000000005655555555455555555555554444444455555555
334343334333330000033000b3333b3bb343433bb334343bb333333bb334443bb334433b00bb3bb0000000005555556545554555555455554444444455555555
33343343434343000000b3003b3b3330b33433b00b33433bbbbbbbbbbb3443bbb34443bb000bbb00000000005550555555555555555555554444444455555555
34343433343433000000000000000000000000000000000000000000000000000000000000000000000000000000000055555555555555554444444455555555
03444300444000000000000000000000000000000000000000000000000000000000000000000000000000000000000055554555555455544444444455555555
00044000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000055555555555554554444444455555555
00044000044000000000000000000000000000000000000000000000000000000000000000000000000000000000000045455545545545454444444455555555
00054000045000000000000000000000000000000000000000000000000000000000000000000000000000000000000044444555555544444444454456555555
00054000044400000000000000000000000000000000000000000000000000000000000000000000000000000000000044445455555444444454444455655555
09444900444440000000000000000000000000000000000000000000000000000000000000000000000000000000000044444555555544444444444455555555
94344494394434000000000000000000000000000000000000000000000000000000000000000000000000000000000044445545555444444444444455555555
da9acacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacaca8adadadadadadadadadadada
11666611111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
da9bcacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacaca8adadadadadadadadadadada
11661611111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0454455004f455500000000000000000000333333333300033333333333333333d222222222222d3bb344444444443bb0dddddd0222222225552525255555555
04f5454004f5454000000000000000000033ddd22ddd3300dd3dd2d3dd3333dd3d22222222d22dd3bb3444444d4433bbddd222dd222222225522252255555555
04f545500445f555000000000000000003ddd222222ddd3022d2222222dddd223dd2222222222d33bb33444444433b3bdd2ddd2d222222225555525252552525
0454545000455455000000000000000033d2222222222d33222222222222222233d22222222222d3b3d32442424dd3bbd2dd2d2d222222225552552222525555
044555500044554500000000000000003dd2222522222dd3222222222222222233dd2222222222d33b3dd2422422dd3bd2d2dd2d222222225525522252555252
004f5450005f555500000000000000003d222022222222d3222522222222202233dd222222222dd333dd222422243d33d2d2d2dd222222225555222225252225
004f4540044f555000000000000000003d222222224222d3222222222d2222223dd22222222022d33dd2242224222dd3d2dd2ddd222222225525522252522225
004f5550045f54500000000000000000322222222222222322222222222222223d222222222222d33dd2222222222dd30dddddd0222222225555255222222222
004455550054545000000000000000003222222222222223252222222222222233d2222222222d33000000000000000000000000222222252222222225525555
00f545450045f54000000000000000003d2225222222222322222202222222d23d22222022222d33000000000000000000000000225222255252222522255255
00f545400445f55000000000000000003d222222226222d322222222252222223222222222222d33000000000000000000000000222222222525222522225555
0454545004f5454000000000000000003dd2222222222dd322222222222222223d222222222222d3000000000000000000000000522222225255525222255255
0445555004f45450000000000000000033d2222222222d3322222222222222223d222d22222222d3000000000000000000000000522222222252555522552555
044f545004545550000000000000000003ddd022222ddd30d2222ddd222ddd2233d2222222222223000000000000000000000000222252225255252525255555
044f45400445555000000000000000000033ddd22ddd33003d2dd333ddd333dd33d22222222222d3000000000000000000000000225222225555555522522255
044f55500044545000000000000000000003333333333000333333333333333333d2222222222d33000000000000000000000000222222525555555525252555
__gff__
0000000000000000000000000000000000000404040700030000000000000000000000000000000000000000000000000000000000000000000000000000000003030303030303030303030303030303030303030303030303030303030303030000000000000303030300030303030300000000000000000000000003030303
0000000000000000000000000000000000000000000000000000000000000000000000000303030303030303030303030000000003030303030300000003030300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
4d5b525051534900000000000000000000000000000000000000000000000000000000000048515a7c7d5e7f6f6f6f7f6f7d5b49000000000000000000000000444c6f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5d550000000000000057000000000046476400000000000000000000000000000000000000626248525a7e7c5e7c6f6f7d5b4962000000000000000000000000545c6f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4d55000060610000006200000000594a4b425800000000000046470065630000000000000062620062485351535a5f5e5b4962620000000000000000005966434a4c6f00000000000001000000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6d4e42477071650000000000000000485249000000000064464a4b414243470000000000006262006200006262485152490062000000000059470000006262485a6c6f00000000000001010100010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
7f6f6d4b42414047006364630000006200620000000000464a7e6e7e7e6e4b470000000000620000620000626200000000000000000000006269000000620062447c6f00000000000000000101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
6f6f6f6d6e6e6e4b434042405800000000620000000000447e6e5b5351525a4500000000000000000000006200464700000000000000000062620000000046434a4c6f00000000000000010101010100000000000000000000000000000000000000000000000000000000000000000000000001010100000000000000000000
6f7f6f6f5d6e6e6e5b51504962000000006200000000464a6e6e55626363485158000000000000000068000000484b434347000000000000626200000000485a6e5c7f00000000000001010000000100000000000000000000000000000000000000000000000000000000000000000000000101000000000000000000000000
6f6f6f6f5d6e5b534962620062000000000000000000546e7e7e5562686463656300000000000000594900000062485a7e4b4347000000006262000000006248505a7c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010100000000000000000000000000
7d5e7c7d6e5b496200626200000000000000000064464a6e5b51556244434342470000000000000062620000006262485a6e7e5500000000626200000000620000444c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010000000000000000000000000000
5d7e5b5053496262006262000000006800000000464a5b5249626700546c6d4e4b470000000000006200000000626200447e6e4b434700006262000000464241434a4c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000
4d5b496200000000006200000000465500000063445b496262626700547c7d5e7e4b4700000000000000000000626200546e6e7e6e55000062000000464a7e4e4f4e6c00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000
4d450062000000000062000000004849000000464a4900620062690048525a4c6d4e4b41470000000000000000626200485a6e6e6e4b4700620000464a7e6c7d7c6f6f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101000000000000000000000000000000
5d5500620059580000000000000062620000005445620046470000006200444c7f6f6d7e4b434241470000000062000000446e7e6e6e5500000000544c4e6c6d7f6f7f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000
4d55000000620000000000000000620057000054496200544b42470062464a4c7f6f6f4e4e4e4e4e4b4147000000000000546e7e6e6e4b47000000444c6f6f6f6f6f6f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000
4d45000000620000000000000000620062000069006200446e6e4b43424a7e4c6f7f6f6f7f6f6f6f6d4e4e4043414042434a6e4e4f4f7e550000464a5c6f6f6f6f6f7f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000
4d55000000620000000000000000000062000000000000447e4f4e4f4e4f4e6c6f6f6f6f6f6f7f6f6f7f6f6d4e4f4e4f4e4e6c7f6f6f4d550000446c6c6f6f6f6f6f6f00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000000000000000000
4d4b476400006400000000000000000000004643470063545c7f6f7f6f6f7f6f6f6f6f6f6f6f6f6f6f6f6f6f6f7f6f6f7f6f6f7f7f6f4d450000447c6f6f7f6f6f6f6f01010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101010101
6d4e4b4042414347636563656400464342404a7e4b42404a4c6f6f6f6f6f6f6f6f6f6f6f6f6f6fafafafafafafafafafaf6f6f6f6f6f4d450000445c6f6f6f6f6f6f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000000000000000000000000000000
7f6f6d4f4e4f4e4b4041434243414a6c4e4f4e4e4e4f4e4e6cafafafafafafafafafafafafafaeadb7b7b7b7b7b7b7adbdafafafafaf4d550000447c7f6f6f6f7f6f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010101000000000000000000000000000000
6f6f6f6f6f6f6f4e4f4e4e4f4e4f4e7f6f6f6f6f6f6f6f6faeadbdb7b7bdadadadadadadadadb7b500000000000000b4b7adadadadbf4d450000485a7c6f7f6f6f6f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010001000000000000000000000000000000
afafafafafafafafafafafafafafafafafafafafafafafafbdb7b50000b4b7b7b7bdadadbda90000000000000000000000b4bdadadbf4d55000000444c6f6f6f6f6f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010101000001010101010000000000000000
adadadadbdadadadadadbdadadadadadadbdadadadadbdb7b50000000000000000b4b7b7b7b5000000000000000000000000b4bdadbf4d55000000444c7f6f7f6f6f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101000001000000010100000000000000
adadbdadbdb7b7b7b7b7b7b7b7b7bdadadadadadbdb7b500000000000000000000000000000000000000000000000000000000b4bdbf6d55000000444c7f6f6f6f6f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000001000000000100000000000000
bdadadbdb5000000000000000000b4b7b7b7b7b7b500000000000000000000000000000000000000000000000000000000000000b4bdafab0000464a4c6f7f6f6f6f0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000001000000000100000000000000
adadbdb500000101000101000000000000000000000000000000000000000000000000000000000000000000000000000000000000a8bdb90000444f6c6f6f6f01000000000000000000000000000000000000000000000000000000000000000000000000000100000000000000000001010101000000000100000000000000
bdadb90000000001010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000a8ada90000aaafaf6f6f6f01000000000000000000000000000000000000000000000000000000000000000000000000010100000000000000000101010101010101000100000000000000
adada90000010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a8adb90000a8adadbf6f6f01000000000000000000000000000000000000000000000000000000000000000000000001010000000000000000000100000000000001010101010000000000
adbdb50000010000010100000000000000000000000000000000000000000000000000000000000000000000000000000000000000b4bdb90000b8adadbdafaf01000000000000000000000000000000000000000000000000000000000000010100000101000000000000000000000100000000000000000000010000000000
bdb900000000000000010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000b4b50000a8adadadadad01000000000000000000000000000000000000000000000000000000000000000101000100000000000000000000000100000001010100000000010000000000
ada90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a8adadadadad01000000000000000000000000000000000000000000000000000000000000000001010100000000000000000000000100000001000100000000010000000000
bdb90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a8adadadadad01000000000000000000000000000000000000000000000000000000000000000000010000000000000000000000000100000001000100000000010000000000
adb90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000a4a6a7a7a6a6bdadadadadad01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000101000001000100000000010000000000
