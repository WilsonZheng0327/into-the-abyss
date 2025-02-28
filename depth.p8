pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
#include main.lua
#include player.lua
#include magic_tile.lua
#include collision.lua
#include trial.lua
__gfx__
000000007777777700999a9000999a9000999a9000999a9000999a9000999a9000999a9000999a90000000000000000000000000000000000000000000000000
000000007777777700aaaaa000aaaaa000aaaaa000aaaaa000aaaaa000aaaaa000aaaaa0a0aaaaa0000055555500000000000000000000000000000000000000
007007007777777700aaf3a000aaf3a00aaf73a000af73a00aaf73a000af73a00aaf73a00aaf73a0000555666650000000000000000000000000000000000000
000770007777777700afffa000afffa0a00fffa00aafffa0a00fffa00aafffa0a00fffe0000fffe0000556666665000000000000000000000000000000000000
00077000777777770004f4000049f9400004f40f0044f4000004f40f0044f4000004f40000f4f40f005566666666500000000055550000000000000000000000
00700700777777770049794000f575f00049794000f979f00049794000f979f00049794000497940005566555566500000000556655500000000000000000000
000000007777777700f555f0000555000f055500000555000f055500000555000f0555f000055500005566555566500000005566666550000000002222200000
0000000077777777000f0f00000f0f0000f00f00000ff00000f00f00000ff00000f00f000000f0f00055666666665000000056665565500000000223ee220000
0000000088888888000000000009900000000000000990008880088809977779009aaa0000000000005565565556500000005556666655000000023beee20000
000000008888888800000000009779000009990000977900800000089999999909a009a000077000005566666666500000556655655655000000223222e22000
000000008888888800099990097799900099799009997790800000089aaaaa9409a009a0700990070055655556865000005666655666650000002ebeeeee2000
00000000888888880097799009999a900999779009499990000000009aaaaa94009aaa00970aa0790055666668885000055655565566655000002e322e2e2000
0000000088888888099994900949aa9009a999990949aa90000000009aaaaa940009a00099aaaa990055655566365000056666666656655000002eeeeeee2000
000000008888888809aa94900949a90009a944990099aa90800000089aaaaa940009a0009aaaaaa90055666433465000056655565565555000002ee222e32000
000000008888888809aa9900009990000099449000099900800000089aaaaa990009aa00999999990435664249444000556666666655665500002e3eeeeb2000
00000000888888880999900000000000000999900000000088800888999999900009a0000000000049449444444243005555555555555555000023b3ee3e2000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000221255000000000022125500000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00005215221200000000521522120000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000520000005500000052dddddd55000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00120000000022000012dddddddd2200000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0220000000000150022ddeddddddd150000111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
0150000000000250015dddedddddd2500001ccccccccc10000000000000000000000000000000000000000000000000000000000000000000000000000000000
0250000000000520025dddedddddd5200001c1111c11c10000000000000000000000000000000000000000000000000000000000000000000000000000000000
0220000000000150022ddeddddddd1500001ccccccccc10000000000000000000000000000000000000000000000000000000000000000000000000000000000
0550000000000220055dddddddded2200001c11c1111c10000000000000000000000000000000000000000000000000000000000000000000000000000000000
05200e0000000250052ddddeddedd2500001ccccccccc10000000000000000000000000000000000000000000000000000000000000000000000000000000000
0522000000e021500522dddedddd2150000111111111110000000000000000000000000000000000000000000000000000000000000000000000000000000000
055120e00e05155005512dedddd5155000000001c100000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0105251255215010010525125521501000000001c100000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5510552002250515551055200225051500000001c100000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1111155555511111111115555551111100000001c100000000000000000000000000000000000000000000000000000000000000000000000000000000000000
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
3434343334343300000000000000000000000000000000000000000000000000bb344444444443bb000000000000000055555555555555554444444455555555
0344430044400000000000000000000000000000000000000000000000000000bb3444444d4433bb000000000000000055554555555455544444444455555555
0004400004400000000000000000000000000000000000000000000000000000bb33444444433b3b000000000000000055555555555554554444444455555555
0004400004400000000000000000000000000000000000000000000000000000b3d32442424dd3bb000000000000000045455545545545454444444455555555
00054000045000000000000000000000000000000000000000000000000000003b3dd2422422dd3b000000000000000044444555555544444444454456555555
000540000444000000000000000000000000000000000000000000000000000033dd222422243d33000000000000000044445455555444444454444455655555
09444900444440000000000000000000000000000000000000000000000000003dd2242224222dd3000000000000000044444555555544444444444455555555
94344494394434000000000000000000000000000000000000000000000000003dd2222222222dd3000000000000000044445545555444444444444455555555
da9acacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacaca8adadbdadadadadbdadadbda
11666611111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
db9bcacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacacaca8adadadadbdadadadadadada
11661611111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1c1c111c111c111c1111111111111111111111111111111111111111ccc1cccc0000000000000000ccccccccc115111cc115111c00cccc00c000000c00555500
c1cc1c111c11c1c11c111111111111111c1111111c11111111111111ccc1cccccc000000000000ccccc5ccccc1c5c11cc115111c0cc0ccc0c000000c05555550
1111c11cc11cc1c111111c1111c1111111c111c111111111111111c111111111c70000000000007ccc1511ccc1c5c11cc115111c0c0000c0c000000c55555555
1c1c11111c111c1c1cc1111cc11c11c111111cc1111111c11c1111111ccccc1c0070000000000700c115111cc115111cc115111cc000000cc000000c55656555
c11111c111c111111111c1c11c1c1c111c11c11111c11111111cc1111ccccc1c0007000000007000c115111cc115111cc115111cc000000cc000000c55565555
111c1c1cc111c111c11c11c11111c11c11111c111c11111111111c11111111110000700000070000c115111cc115111cc115111cc000000cc000000c55656555
1c1c111c11c1cc1c1cc11c1111c11cc11111111111111c1111c11111ccc1cccc0111111001111110c115111cc115111cc115111cc000000cc000000c05555550
c111c111c11c111c11c11111c11c1111111c11111111111111111111ccc1cccc1166661111666611c115111cc115111cc115111cc000000cc000000c00555500
3454455304f455503333033333335333033533333333533333333333333333333d222222222222d300033333333330000dddddd0222222225552525255555555
34f5454304f5454053533335333335355553333303553330dd3dd2d3dd3333dd3d22222222d22dd30033ddd22ddd3300ddd222dd222222225522252255555555
34f545530445f5553535335353333553335333350033530022d2222222dddd223dd2222222222d3303ddd222222ddd30dd2ddd2d222222225555525252552525
345454530445545503335533353553303335335000000000222222222222222233d22222222222d333d2222222222d33d2dd2d2d222222225552552222525555
344555530444554503353333355033303333553300000000222222222222222233dd2222222222d33dd2222522222dd3d2d2dd2d222222225525522252555252
334f5453045f555500335333533333003335333300000000222522222222202233dd222222222dd33d222022222222d3d2d2d2dd222222225555222225252225
334f4543044f555000033533353330003353333300000000222222222d2222223dd22222222022d33d222222224222d3d2dd2ddd222222225525522252522225
334f5553045f54500000003333000000553333330000000022222222222222223d222222222222d332222222222222230dddddd0222222225555255222222222
004455550054545000000353353000000000035333300000252222222222222233d2222222222d33322222222222222300000000222222252222222225525555
00f545450045f5400003353333533000000035333353000022222202222222d23d22222022222d333d2225222222222300000000225222255252222522255255
00f545450445f5500033335335533300000350333533300022222222252222223222222222222d333d222222226222d300000000222222222525222522225555
0054545504f545400335353353353330000353335353500022222222222222223d222222222222d33dd2222222222dd300000000522222225255525222255255
0045555504f454500353530333053330000535353035300022222222222222223d222d22222222d333d2222222222d3300000000522222222252555522552555
004f54550454555005035333333353300003335333353000d2222ddd222ddd2233d222222222222303ddd022222ddd3000000000222252225255252525255555
000f454504455500333335333335505300003533335300003d2dd333ddd333dd33d22222222222d30033ddd22ddd330000000000225222225555555522522255
000f55550444540033333353335335330000033335300000333333333333333333d2222222222d33000333333333300000000000222222525555555525252555
111111110000000000000000000000002eeeeee27994444449999999999999999999999999999994444449970000000000000000000000000000000000000000
111cc11100050500000000000000000000000000979aaa449999999999999999999999999999999944aaa97f0000000000000000000000000000000000000000
11cccc1100005000000000000000000000000000ff74444ffffffffffffffffffffffffffffffffff444479f0000000000000000000000000000000000000000
1cc66cc10000400000000000000000000000000097a949449999f99999f9999999999f99999f999944949a7f0000000000000000000000000000000000000000
1c6556c10000400012eeeeeeeeeeee21000000007744a4444999f99999f9999999999f99999f9994444a44a70000000000000000000000000000000000000000
1c6556c1000040001c222222222222c100000000f7a44444ffffffffffffffffffffffffffffffff44444a7f0000000000000000000000000000000000000000
00000000000565001cc11cccccc11cc100000000997aa9499f99999f99999f9999f99999f99999f9949aa79f0000000000000000000000000000000000000000
0000000000005000111111111111111100000000997aa9499f99999f99999f9999f99999f99999f9949aa79f0000000000000000000000000000000000000000
aaaaaaaa00000000000000000000000000000000ff7aa94ffffffffffffffffffffffffffffffffff49aa7ff0000000000000000000000000000000000000000
a999999a00000000000000000000000000000000997aa9499999f99999f9999999999f99999f9999949aa79f0000000000000000000000000000000000000000
a999999a00000000000000000000000000000000997aa9499999f99999f9999999999f99999f9999949aa79f0000000000000000000000000000000000000000
a999999a00000000000000000000000000000000ff7aa94ffffffffffffffffffffffffffffffffff49aa7ff0000000000000000000000000000000000000000
a999999a00000000000000000000000000000000997aa9499f99999f99999f9999f99999f99999f9949aa79f0000000000000000000000000000000000000000
a999999a00000000000000000000000000000000997aa9499f99999f99999f9999f99999f99999f9949aa79f0000000000000000000000000000000000000000
a999999a00000000000000000000000000000000ff7aa94ffffffffffffffffffffffffffffffffff49aa7ff0000000000000000000000000000000000000000
aaaaaaaa00000000000000000000000000000000997aa9499999f99999f9999999999f99999f9999949aa79f0000000000000000000000000000000000000000
0000000000000000000000000000000000000000997aa9499999f99999f9999999999f99999f9999949aa79f99f9999999f99999000000000000000000000000
0000000000000000000000000000000000000000ff7aa94ffffffffffffffffffffffffffffffffff49aa7ffffffffffffffffff000000000000000000000000
0000000000000000000000000000000000000000997aa9499f99999f99999f9999f99999f99999f9949aa79f99999f999999f999000000000000000000000000
0000000000000000000000000000000000000000997aa9499f99999f99999f9999f99999f99999f9949aa79f99999f999999f999000000000000000000000000
0000000000000000000000000000000000000000ff7aa94ffffffffffffffffffffffffffffffffff49aa7ffffffffffffffffff000000000000000000000000
0000000000000000000000000000000000000000997aa9499999f99999f9999999999f99999f9999949aa79f9911111111111199000000000000000000000000
0000000000000000000000000000000000000000997aa9499999f99999f9999999999f99999f9999949aa79f91a1441991441a19000000000000000000000000
0000000000000000000000000000000000000000ff7aa94ffffffffffffffffffffffffffffffffff49aa7fff1a1111991111a1f000000000000000000000000
0000000000000000000000000000000000000000997aa9499f99999f99999f9999f99999f99999f9949aa79f91a9999119999a19000000000000000000000000
0000000000000000000000000000000000000000997aa9499f99999f99999f9999f99999f99999f9949aa79f91a1111aa1111a19000000000000000000000000
0000000000000000000000000000000000000000ff7aa94ffffffffffffffffffffffffffffffffff49aa7fff1a1441aa1441a1f000000000000000000000000
0000000000000000000000000000000000000000997aa9499999f99999f9999999999f99999f9999949aa79f91a1444114441a19000000000000000000000000
0000000000000000000000000000000000000000997aa9499999f99999f9999999999f99999f9999949aa79f91a1111111111a19000000000000000000000000
0000000000000000000000000000000000000000ff74444ffffffffffffffffffffffffffffffffff44447fff1aaaaaaaaaaaa1f000000000000000000000000
0000000000000000000000000000000000000000979aaa449f99999f99999f9999f99999f99999f944aaa97f91aa11111111aa19000000000000000000000000
0000000000000000000000000000000000000000799444444f99999f99999f9999f99999f99999f4444449979111199999911119000000000000000000000000
__gff__
0000000000000000000000000000000000000004040700030000000000000000404040400000000000000000000000004040404000000000000000000000000003030303030303030303030303030303030303030303030303030303030303030000000000000303030300030303030300000000000000000303000003030303
000000000000000000000000000000000303030303030303200003030300000b030003030300030303030303830303030000030303030303030303030003030303801010000000000000000000000000030000000000000000000000000000000000000000000000000000000000000000000000000000000000008888000000
__map__
4d5b52505153505352505a6e5b51535051505150535053515050515053525050515253505152515a7c7d5e7f6f6f6f7f6f7d5b505251505053525350515051535a4c6f6f6f9195919494919696949596969497979797979797979797979797979797979797979797979797979797979797979797979797979797979797979797
5d550000000000000000485149626262620000006200006262006200000000626200000062626248525a7e7c5e7c6f6f7d5b4962000062626262006262000000545c6f6f6f9290909195959500000000959797979797979797979797979700000000000000979797979797970000c000c000c000c000c000c097979700009797
4d55000060610000570000000062626246476400620000006246470065630062620000000062620062485351535a5f5e5b4962620000620062620062625966434a4c6f7f6f9092929595000000000000009f0000009a000000c000c0c00000000097979700979797000000000000000000000000000000000097000000000097
6d4e42477071650062000000000062594a4b425862000064464a4b414243476200000000006262006200006262485152490062000000620059470062626262485a6c6f6f6f9491909500000000000000009f0000009c000000000000000000000097c09700979797000000000000000000000000000000000000000000000097
7f6f6d4b42414047006364630000620048524900000000464a7e6e7e7e6e4b470000000000620000620000626200000000000000000000006269006200620062447c6f6f6f9191949500222300002425009f0000009b0000000000000000000000970097009797979f97979700000000000000979797970000000000c2c30097
6f6f6f6d6e6e6e4b434042405800620062006200000000447e6e5b5351525a4500000000000000000000006200464700000000000000000062620000000046434a4c6f7f6f9290919500323300003435009f0098009c000000000000000000000097000000979700000097970000970000000097000000000000009797979797
6f7f6f6f5d6e6e6e5b51504962000000000062000000464a6e6e55626363485158000000000000000068000000484b434347000000000000626200000000485a6e5c7f6f6f9590949395929392969696969797979797979700000000000000000097009797970000000000970000000000009700000000000000000097979797
6f6f6f6f5d6e5b534962620062000000000062000000546e7e7e5562686463656300000000000000594900000062485a7e4b4347000000006262000000006248505a7c6f6f969193959195939195939595959797979797979797979797979700009700000000000000000097acacacacacacacacacacacacacacacac97979797
7d5e7c7d6e5b496200626200000000000000000064464a6e5b51556244434342470000000000000062620000006262485a6e7e5500000000626200000000620000444c7f6f9196969195909394919695919796979797979797979797979797acac97979797979797979797979797979797979797979797979797979797979797
5d7e5b5053496262006262000000006800000000464a5b5249626700546c6d4e4b470000000000006200000000626200447e6e4b434700006262000000464241434a4c6f7f9591959193949590949195959596979797979797979797979797979797979797979797979797979797979797979797979797979797979797979797
4d5b496200000000006200000000465500000063445b496262626700547c7d5e7e4b4765000000000000000000626200546e6e7e6e55000062000000464a7e4e4f4e6c6f6f9093939494969196949194979797979797979797979797979797979797979797979797979797979797979797979797979797979797979797979797
4d450062000000000062000000004849000000464a4900620062690048525a4c6d4e4b41476365000000000000626200485a6e6e6e4b4700620000464a7e6c7d7c6f6f7f6f9194969190939493949094939397979797979797979797979797979797979797979797979797979797979797979797979797979797979797979797
5d5500620059580000000000000062620000005445620046470000006200444c7f6f6d7e4b4342414764000000620c0d00446e7e6e6e5500000000544c4e6c6d7f6f7f6f6f000000000000000000000000000097970000c40097d097000000000000000000000000000000000000000000000000000000000000000000000000
4d55000000620000000000000000620057000054496200544b42470062464a4c7f6f6f4e4e4e4e4e4b41476563631c1d64546e7e6e6e4b47000000444c6f6f6f6f6f6f00000000000000000000000000009700979797000000979700970000000000000000000000000000000000000000000000000000000000000000000000
4d45000000620000000000000000620062000069006200446e6e4b43424a7e4c6f7f6f6f7f6f6f6f6d4e4e4043414042434a6e4e4f4f7e550000464a5c6f6f6f6f6f7f00000000000000000000000000000000970097000000009700d00000000000000000000000000000000000000000000000000000000000000000000000
4d5500000a0b0000000000000000000062000000000000447e4f4e4f4e4f4e6c6f6f6f6f6f6f7f6f6f7f6f6d4e4f4e4f4e4e6c7f6f6f4d550000446c6c6f6f6f6f6f6f00000000000000000000000000000000d097970000009700d0000000000000000000000000000000000000000000000000000000000000000000000000
4d4b47641a1b6400000000000000000000004643470063545c7f6f7f6f6f7f6f6f6f6f7f6f6f6f6f6f6f6f6f6f7f6f6f7f6f6f7f7f6f4d450000447c6f6f7f6f6f6f6f0000000000000000000000000000d000009700000000009700d00000000000000000000000000000000000000000000000000000000000000000000000
6d4e4b4042414347636563656400464342404a7e4b42404a4c6f6f6f6f6f6f6f6f7f6f6f7f6f6fafafafafafafafafafaf6f6f6f6f6f4d450000445c6f6f6f6f6f6f00000000000000000000000000000000d09700d0000000009700d09700000000000000000000000000000000000000000000000000000000000000000000
7f6f6d4f4e4f4e4b4041434243414a6c4e4f4e4e4e4f4e4e6cafafafafafafafafafafafafafaeadb7b7b7b7b7b7b7adbdafafafafaf4d550000447c7f6f6f6f7f6f000000000000000000000000000000d00000979700000000d097d0d0d0d00000000000000000000000000000000000000000000000000000000000000000
6f6f6f6f6f6f6f4e4f4e4e4f4e4f4e7f6f6f6f6f6f6f6f6faeadbdb7b7bdadadbdadbdadadadb7bba1000000000000bab7adadadadbf4d450000485a7c6f7f6f6f6f00000000000000000000000000000000d0d09700000000970097d097d0d0d000000000000000000000000000000000000000000000000000000000000000
afafafafafafafafafafafafafafafafafafafafafafafafbdb7bb0000bab7b7b7bdadadbda90000b000acac0000000000babdadadbf4d55000000444c6f6f6f6f6f000000000000000000000000000000d000d0d000000000d097d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d000000000000000000000000000
adbdadadbdadadadadadbdadbdadadadadbdbdadbdadbdb7bb000000000000acacbab7b7b7bb0000b1000000000000000000babdadbf4d55000000444c7f6f7f6f6f0000000000000000000000000000d000d09700d0000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d000000000000000000000000000
adadbdadbdb7b7b7b7b7b7b7b7b7bdadbdadadadbdb7bbb1acac00000000acacac00b100a1000000a100000000acacac000000babdbf6d55000000444c7f6f6f6f6f000000000000000000000000000000d000d0d0d000000000000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d000000000000000000000000000
bdadadbdbb0000000000b1000000bab7b7b7b7b7bb0000a1acacac000000ac000000a100b0000000b00000000000acacac000000babdaf790000464a4c6f7f6f6f6f0000000000000000000000000000d0d00000d000000000000000000000c700000000000000c5c6c7c7c7c8c9cad0d0d0d000000000000000000000000000
adadbdbb000000000000a100000000000000a100000000b000acac000000ac000000b000a1000000b0000000000000000000000000a8bdb90000444f6c6f6f6f010000000000000000000000000000000000d0d0d0d0000000000000000000d7d8000000d80000d5d6d7d7d7d8d9dad0d0d0d000000000000000000000000000
bdadb900202100000000b000000000000000b000000000a1000000000000000000b2a0b3b000b2b3b1b2b300000000000000000000a8ada9000078afaf6f6f6f010000000000000000000000000000000000d0d0d0d00000e7000000000000e7e8000000e8e8e8e5e6e7ebece8e9ead0d0d0d000000000000000000000000000
adada9003031000000b2a0b3000000000000b100000000b0000000000000000000a2a4a3b0b4a4a4a0a4a4b5000000000000000000a8adb90000a8bdadbf6f6f0100000000000000000000000000000000d0d0d0d0d00000f7f80000f800f8f7f7f800f8f8f8f8f5f6f7fbfcf8f9fad0d0d0d000000000000000000000000000
adadbda6a7a6ab0000a4a4a400000000b2b3a100000000b000000000000000000000a500b100a2a4a4a4a300000000000000000000babdb90000b8adadbdafaf01000000000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d000000000000000000000000000
bdadadadbdb7bb0000a2a4a4b5000000a4a4a0a4a4b500b00000000000ac00000000b2a4a0a4b3a2a4a3000000000000000000000000babb0000a8adbdadadad01000000000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d000000000000000000000000000
adbdb6b7bb0000000000a4a300000000a2a4a4a4a4a4b3b100000000acacac000000a2a4a4a4a4b500000000acac00000000aaab000e0f000000a8bdadadbdad01000000000000000000000000000000d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d0d000000000000000000000000000
bdb900000000ac000000a50000ac000000a2a4a3a2a4a4a0a4b30000acacacac000000a2a4a4a300000000acacac00000000baadab1e1f000000a8adadbdadad01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
adb900000000acac00000000acacac000000000000a2a4a4a4a400acacacacacac000000a500000000acacacacacac00000000babda6a7a7a6a6bdadadadadad01000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__sfx__
0112000009135101250e135101250c135101250b135101250913510125071351012509135101250e135101250c135101250b135101250913510125071351012509135101250e135101250c135101250b13510125
011200000913510125071351012509135101250e135101250c135101250b13510125091351012507135101250e13515125131351512511135151250e13515125131351512511135151250c135151251013515125
011200000e135151250c1351512510135151250e13515125101351712515135171251413517125101351712515135171251413517125101351c1251a1351812517135151251413511125101350e1250c1350b125
011200000903009030090300903009030090301003010030100301003010030100300e0300e0300e0300e0300d0300b0300903009030090300903009030090300903009030090300903009030090300703007030
0112000009030090300b0300b0300903009030090300903004030040300903009030090300903009030090300e0300e0300e0300e0300e0300e03009030090300903009030050300503009030090300903009030
0112000004040040400004000040000400004004040040400304003040030400304003040030400604006040060400604004040040400b0400b0400b0400b0400b0400b040080400804008040080400804008040
011200000c0631530015300153000c063153132462500003246151532624625153130c0630000300000000000c063000032462500003246001530024615000000c0630000300000000000c063153132462500003
01120000246151530024625153130c0630000300000000000c063000032462500003246001530024615000000c0630000300000000000c063153132462500003246151531624625153130c063000030000000000
011200000c063000032462500003246001530024615000000c0630000300000000000c063153132462500003246151531624625153130c0630000300000000000c0630000324625246001d635153161862518600
011200001c1241c1221c1221c1221c1221c1221512215122151221512215122151221f1221f1221f1221f1221e1221c1221e1221e1221e1221e1221a1221a122181221812218122181221a1221c1221a1221a122
011200001a1221a12217122171221512215122151221512217122131221512215122151221512215122151251d1241d1221d1221d1221a1221a122211222112221122211221d1221d1221c1221c1221c1221c122
0112000018122181221c1221c1221c1221c1221c1221c1221b1221b1221b1221b1221c1221e1222412224122241222412223122211222312223122231222312220122201222312221122201221d1221c1221a125
01020000060700a0700f07013060180601b0501d040200000c0000000000000000000c000150002400000000240001500024000150000c0000000000000000000c0000000024000240001d000150001800018000
11060000185501c5501f5502455024500245000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000500005000050000000000000000000000
010d0000180751806524000150000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011000001616300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003
010d00001807513075240000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010d00000036500365003050030500305003050030500305003050030500305003050030500305003050030500305003050030500305003050030500305003050030500305003050030500305003050030500305
010c00001616316143000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000000000000000000000000000000000000000
010600000c1300000000000000000c1300000000000000000c13000000000000c1300c1300c1300c130001000c130000000c130001000c1300010000100001000010000100001000010000100000000000000000
010a05001a1221c1221a122191221a1222110221102211021f1021f1021f1021f1021f1021f1021e1021e1021e1021e1021c1021a1021c1021c1021c1021110215102171021810218102181021a1021c1021c102
01180000231222312223122231220000000000000000000021122211221c1221c1221a1221a1221a1221a1221a1021c1021a10217102131021d1021c1221c1222412224122241222412200000000000000000000
0118000023122231222112221122241222412224122241221c1021c102261222612228122281222a1222a1222a1222a1222a1222a12526122261222112221122211222112526122261221e1221e1221e1221e125
01180000000000000000000000000000000000000000000000000000000000000000000000000000000000002611226112261122611521112211121e1121e1121e1121e1151e1121e1121a1121a1121a1121a115
011800001a1221a122231222312221122211221f1221f122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
4d181600071350711517135171150e1350e115071000000017135171150e1350e115071350711517135171150e1350e1150000000000171351711512105121050910500000000000000000000000000000000000
051802000e1350e11517100000000e10000000071000000017100000000e10000000071000000017100000000e10010100000000000017100000000e100121001210509105000000000000000000000000000000
05180000071350711517135171150e1350e115071050000517135171150e1350e115071350711517135171150e1350e115000050000517135171150e1350e1150913509115181351811510135101150000500005
051800001813518115101351011509135091151813518115101351011500000000001813518115101351011502135021151813518115121351211500000000001813518115121351211502135021151813518115
051808001213512115000000000018135181151213512115000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0118080000000153001e1121e1121c1121c1121a1121a11200000246001530024600153000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01180800153002460026100261002410024100181221a122000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011800001f1221f1221f1221f12200000000001e1221e1221e1221e1221a1221a1221712217122171221712217122171220000200002131221312217122171221512215122151221512212122121221512215122
0118000015122151221c1221c1221a1221a1221a1221a1221a1221a122000000000000000000001a1221a122211222112221122211251e1221e1221a1221a1221a1221a125181221812215122151221512215125
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
001000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
011200060c000000000c000000000c000000000000000000000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003000030000300003
__music__
01 00090306
00 010a0407
02 020b0508
01 19594344
00 1a144344
01 1b154344
00 1c161744
00 1d181e1f
00 1b152044
00 1c161721
02 1d181e1f

