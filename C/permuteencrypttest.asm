
permuteencrypttest.exe:     file format pei-i386


Disassembly of section .text:

00401000 <__gnu_exception_handler@4>:
  401000:	53                   	push   ebx
  401001:	83 ec 18             	sub    esp,0x18
  401004:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  401008:	8b 00                	mov    eax,DWORD PTR [eax]
  40100a:	8b 00                	mov    eax,DWORD PTR [eax]
  40100c:	3d 91 00 00 c0       	cmp    eax,0xc0000091
  401011:	77 4d                	ja     401060 <__gnu_exception_handler@4+0x60>
  401013:	3d 8d 00 00 c0       	cmp    eax,0xc000008d
  401018:	73 5b                	jae    401075 <__gnu_exception_handler@4+0x75>
  40101a:	3d 05 00 00 c0       	cmp    eax,0xc0000005
  40101f:	0f 85 8e 00 00 00    	jne    4010b3 <__gnu_exception_handler@4+0xb3>
  401025:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  40102c:	00 
  40102d:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  401034:	e8 67 70 00 00       	call   4080a0 <_signal>
  401039:	83 f8 01             	cmp    eax,0x1
  40103c:	0f 84 c1 00 00 00    	je     401103 <__gnu_exception_handler@4+0x103>
  401042:	85 c0                	test   eax,eax
  401044:	0f 85 a6 00 00 00    	jne    4010f0 <__gnu_exception_handler@4+0xf0>
  40104a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401050:	31 c0                	xor    eax,eax
  401052:	83 c4 18             	add    esp,0x18
  401055:	5b                   	pop    ebx
  401056:	c2 04 00             	ret    0x4
  401059:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401060:	3d 94 00 00 c0       	cmp    eax,0xc0000094
  401065:	74 19                	je     401080 <__gnu_exception_handler@4+0x80>
  401067:	3d 96 00 00 c0       	cmp    eax,0xc0000096
  40106c:	74 4c                	je     4010ba <__gnu_exception_handler@4+0xba>
  40106e:	3d 93 00 00 c0       	cmp    eax,0xc0000093
  401073:	75 db                	jne    401050 <__gnu_exception_handler@4+0x50>
  401075:	bb 01 00 00 00       	mov    ebx,0x1
  40107a:	eb 06                	jmp    401082 <__gnu_exception_handler@4+0x82>
  40107c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401080:	31 db                	xor    ebx,ebx
  401082:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  401089:	00 
  40108a:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  401091:	e8 0a 70 00 00       	call   4080a0 <_signal>
  401096:	83 f8 01             	cmp    eax,0x1
  401099:	0f 84 a1 00 00 00    	je     401140 <__gnu_exception_handler@4+0x140>
  40109f:	85 c0                	test   eax,eax
  4010a1:	74 ad                	je     401050 <__gnu_exception_handler@4+0x50>
  4010a3:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  4010aa:	ff d0                	call   eax
  4010ac:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4010b1:	eb 9f                	jmp    401052 <__gnu_exception_handler@4+0x52>
  4010b3:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
  4010b8:	75 96                	jne    401050 <__gnu_exception_handler@4+0x50>
  4010ba:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  4010c1:	00 
  4010c2:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  4010c9:	e8 d2 6f 00 00       	call   4080a0 <_signal>
  4010ce:	83 f8 01             	cmp    eax,0x1
  4010d1:	74 4c                	je     40111f <__gnu_exception_handler@4+0x11f>
  4010d3:	85 c0                	test   eax,eax
  4010d5:	0f 84 75 ff ff ff    	je     401050 <__gnu_exception_handler@4+0x50>
  4010db:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  4010e2:	ff d0                	call   eax
  4010e4:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4010e9:	e9 64 ff ff ff       	jmp    401052 <__gnu_exception_handler@4+0x52>
  4010ee:	66 90                	xchg   ax,ax
  4010f0:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  4010f7:	ff d0                	call   eax
  4010f9:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4010fe:	e9 4f ff ff ff       	jmp    401052 <__gnu_exception_handler@4+0x52>
  401103:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  40110a:	00 
  40110b:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  401112:	e8 89 6f 00 00       	call   4080a0 <_signal>
  401117:	83 c8 ff             	or     eax,0xffffffff
  40111a:	e9 33 ff ff ff       	jmp    401052 <__gnu_exception_handler@4+0x52>
  40111f:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401126:	00 
  401127:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  40112e:	e8 6d 6f 00 00       	call   4080a0 <_signal>
  401133:	83 c8 ff             	or     eax,0xffffffff
  401136:	e9 17 ff ff ff       	jmp    401052 <__gnu_exception_handler@4+0x52>
  40113b:	90                   	nop
  40113c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401140:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401147:	00 
  401148:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  40114f:	e8 4c 6f 00 00       	call   4080a0 <_signal>
  401154:	85 db                	test   ebx,ebx
  401156:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40115b:	0f 84 f1 fe ff ff    	je     401052 <__gnu_exception_handler@4+0x52>
  401161:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401165:	e8 36 05 00 00       	call   4016a0 <__fpreset>
  40116a:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  40116e:	e9 df fe ff ff       	jmp    401052 <__gnu_exception_handler@4+0x52>
  401173:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401179:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401180 <___mingw_CRTStartup>:
  401180:	55                   	push   ebp
  401181:	89 e5                	mov    ebp,esp
  401183:	53                   	push   ebx
  401184:	83 ec 14             	sub    esp,0x14
  401187:	a1 80 a0 40 00       	mov    eax,ds:0x40a080
  40118c:	85 c0                	test   eax,eax
  40118e:	74 1c                	je     4011ac <___mingw_CRTStartup+0x2c>
  401190:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  401197:	00 
  401198:	c7 44 24 04 02 00 00 	mov    DWORD PTR [esp+0x4],0x2
  40119f:	00 
  4011a0:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  4011a7:	ff d0                	call   eax
  4011a9:	83 ec 0c             	sub    esp,0xc
  4011ac:	c7 04 24 00 10 40 00 	mov    DWORD PTR [esp],0x401000
  4011b3:	e8 e0 6f 00 00       	call   408198 <_SetUnhandledExceptionFilter@4>
  4011b8:	83 ec 04             	sub    esp,0x4
  4011bb:	e8 f0 04 00 00       	call   4016b0 <___cpu_features_init>
  4011c0:	e8 db 04 00 00       	call   4016a0 <__fpreset>
  4011c5:	e8 c6 05 00 00       	call   401790 <__setargv>
  4011ca:	a1 30 d0 40 00       	mov    eax,ds:0x40d030
  4011cf:	85 c0                	test   eax,eax
  4011d1:	74 42                	je     401215 <___mingw_CRTStartup+0x95>
  4011d3:	8b 1d cc e1 40 00    	mov    ebx,DWORD PTR ds:0x40e1cc
  4011d9:	a3 00 90 40 00       	mov    ds:0x409000,eax
  4011de:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4011e2:	8b 43 10             	mov    eax,DWORD PTR [ebx+0x10]
  4011e5:	89 04 24             	mov    DWORD PTR [esp],eax
  4011e8:	e8 bb 6e 00 00       	call   4080a8 <__setmode>
  4011ed:	a1 30 d0 40 00       	mov    eax,ds:0x40d030
  4011f2:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4011f6:	8b 43 30             	mov    eax,DWORD PTR [ebx+0x30]
  4011f9:	89 04 24             	mov    DWORD PTR [esp],eax
  4011fc:	e8 a7 6e 00 00       	call   4080a8 <__setmode>
  401201:	a1 30 d0 40 00       	mov    eax,ds:0x40d030
  401206:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40120a:	8b 43 50             	mov    eax,DWORD PTR [ebx+0x50]
  40120d:	89 04 24             	mov    DWORD PTR [esp],eax
  401210:	e8 93 6e 00 00       	call   4080a8 <__setmode>
  401215:	e8 96 6e 00 00       	call   4080b0 <___p__fmode>
  40121a:	8b 15 00 90 40 00    	mov    edx,DWORD PTR ds:0x409000
  401220:	89 10                	mov    DWORD PTR [eax],edx
  401222:	e8 b9 09 00 00       	call   401be0 <__pei386_runtime_relocator>
  401227:	83 e4 f0             	and    esp,0xfffffff0
  40122a:	e8 11 0c 00 00       	call   401e40 <___main>
  40122f:	e8 84 6e 00 00       	call   4080b8 <___p__environ>
  401234:	8b 00                	mov    eax,DWORD PTR [eax]
  401236:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40123a:	a1 00 d0 40 00       	mov    eax,ds:0x40d000
  40123f:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401243:	a1 04 d0 40 00       	mov    eax,ds:0x40d004
  401248:	89 04 24             	mov    DWORD PTR [esp],eax
  40124b:	e8 60 72 00 00       	call   4084b0 <_main>
  401250:	89 c3                	mov    ebx,eax
  401252:	e8 69 6e 00 00       	call   4080c0 <__cexit>
  401257:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40125a:	e8 41 6f 00 00       	call   4081a0 <_ExitProcess@4>
  40125f:	90                   	nop

00401260 <__mingw32_init_mainargs>:
  401260:	83 ec 3c             	sub    esp,0x3c
  401263:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  401267:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40126b:	a1 04 90 40 00       	mov    eax,ds:0x409004
  401270:	c7 44 24 04 00 d0 40 	mov    DWORD PTR [esp+0x4],0x40d000
  401277:	00 
  401278:	c7 04 24 04 d0 40 00 	mov    DWORD PTR [esp],0x40d004
  40127f:	c7 44 24 2c 00 00 00 	mov    DWORD PTR [esp+0x2c],0x0
  401286:	00 
  401287:	83 e0 01             	and    eax,0x1
  40128a:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40128e:	8d 44 24 28          	lea    eax,[esp+0x28]
  401292:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401296:	e8 2d 6e 00 00       	call   4080c8 <___getmainargs>
  40129b:	83 c4 3c             	add    esp,0x3c
  40129e:	c3                   	ret    
  40129f:	90                   	nop

004012a0 <_mainCRTStartup>:
  4012a0:	83 ec 1c             	sub    esp,0x1c
  4012a3:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  4012aa:	ff 15 bc e1 40 00    	call   DWORD PTR ds:0x40e1bc
  4012b0:	e8 cb fe ff ff       	call   401180 <___mingw_CRTStartup>
  4012b5:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4012b9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004012c0 <_WinMainCRTStartup>:
  4012c0:	83 ec 1c             	sub    esp,0x1c
  4012c3:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  4012ca:	ff 15 bc e1 40 00    	call   DWORD PTR ds:0x40e1bc
  4012d0:	e8 ab fe ff ff       	call   401180 <___mingw_CRTStartup>
  4012d5:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4012d9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004012e0 <_atexit>:
  4012e0:	a1 dc e1 40 00       	mov    eax,ds:0x40e1dc
  4012e5:	ff e0                	jmp    eax
  4012e7:	89 f6                	mov    esi,esi
  4012e9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004012f0 <__onexit>:
  4012f0:	a1 d0 e1 40 00       	mov    eax,ds:0x40e1d0
  4012f5:	ff e0                	jmp    eax
  4012f7:	90                   	nop
  4012f8:	90                   	nop
  4012f9:	90                   	nop
  4012fa:	90                   	nop
  4012fb:	90                   	nop
  4012fc:	90                   	nop
  4012fd:	90                   	nop
  4012fe:	90                   	nop
  4012ff:	90                   	nop

00401300 <___gcc_register_frame>:
  401300:	55                   	push   ebp
  401301:	89 e5                	mov    ebp,esp
  401303:	83 ec 18             	sub    esp,0x18
  401306:	c7 04 24 00 a0 40 00 	mov    DWORD PTR [esp],0x40a000
  40130d:	e8 96 6e 00 00       	call   4081a8 <_GetModuleHandleA@4>
  401312:	ba 00 00 00 00       	mov    edx,0x0
  401317:	83 ec 04             	sub    esp,0x4
  40131a:	85 c0                	test   eax,eax
  40131c:	74 15                	je     401333 <___gcc_register_frame+0x33>
  40131e:	c7 44 24 04 13 a0 40 	mov    DWORD PTR [esp+0x4],0x40a013
  401325:	00 
  401326:	89 04 24             	mov    DWORD PTR [esp],eax
  401329:	e8 82 6e 00 00       	call   4081b0 <_GetProcAddress@8>
  40132e:	83 ec 08             	sub    esp,0x8
  401331:	89 c2                	mov    edx,eax
  401333:	85 d2                	test   edx,edx
  401335:	74 11                	je     401348 <___gcc_register_frame+0x48>
  401337:	c7 44 24 04 08 d0 40 	mov    DWORD PTR [esp+0x4],0x40d008
  40133e:	00 
  40133f:	c7 04 24 c0 b0 40 00 	mov    DWORD PTR [esp],0x40b0c0
  401346:	ff d2                	call   edx
  401348:	a1 24 90 40 00       	mov    eax,ds:0x409024
  40134d:	85 c0                	test   eax,eax
  40134f:	74 3a                	je     40138b <___gcc_register_frame+0x8b>
  401351:	c7 04 24 29 a0 40 00 	mov    DWORD PTR [esp],0x40a029
  401358:	e8 4b 6e 00 00       	call   4081a8 <_GetModuleHandleA@4>
  40135d:	ba 00 00 00 00       	mov    edx,0x0
  401362:	83 ec 04             	sub    esp,0x4
  401365:	85 c0                	test   eax,eax
  401367:	74 15                	je     40137e <___gcc_register_frame+0x7e>
  401369:	c7 44 24 04 37 a0 40 	mov    DWORD PTR [esp+0x4],0x40a037
  401370:	00 
  401371:	89 04 24             	mov    DWORD PTR [esp],eax
  401374:	e8 37 6e 00 00       	call   4081b0 <_GetProcAddress@8>
  401379:	83 ec 08             	sub    esp,0x8
  40137c:	89 c2                	mov    edx,eax
  40137e:	85 d2                	test   edx,edx
  401380:	74 09                	je     40138b <___gcc_register_frame+0x8b>
  401382:	c7 04 24 24 90 40 00 	mov    DWORD PTR [esp],0x409024
  401389:	ff d2                	call   edx
  40138b:	c9                   	leave  
  40138c:	c3                   	ret    
  40138d:	8d 76 00             	lea    esi,[esi+0x0]

00401390 <___gcc_deregister_frame>:
  401390:	55                   	push   ebp
  401391:	89 e5                	mov    ebp,esp
  401393:	83 ec 18             	sub    esp,0x18
  401396:	c7 04 24 00 a0 40 00 	mov    DWORD PTR [esp],0x40a000
  40139d:	e8 06 6e 00 00       	call   4081a8 <_GetModuleHandleA@4>
  4013a2:	ba 00 00 00 00       	mov    edx,0x0
  4013a7:	83 ec 04             	sub    esp,0x4
  4013aa:	85 c0                	test   eax,eax
  4013ac:	74 15                	je     4013c3 <___gcc_deregister_frame+0x33>
  4013ae:	c7 44 24 04 4b a0 40 	mov    DWORD PTR [esp+0x4],0x40a04b
  4013b5:	00 
  4013b6:	89 04 24             	mov    DWORD PTR [esp],eax
  4013b9:	e8 f2 6d 00 00       	call   4081b0 <_GetProcAddress@8>
  4013be:	83 ec 08             	sub    esp,0x8
  4013c1:	89 c2                	mov    edx,eax
  4013c3:	85 d2                	test   edx,edx
  4013c5:	74 09                	je     4013d0 <___gcc_deregister_frame+0x40>
  4013c7:	c7 04 24 c0 b0 40 00 	mov    DWORD PTR [esp],0x40b0c0
  4013ce:	ff d2                	call   edx
  4013d0:	c9                   	leave  
  4013d1:	c3                   	ret    
  4013d2:	90                   	nop
  4013d3:	90                   	nop
  4013d4:	90                   	nop
  4013d5:	90                   	nop
  4013d6:	90                   	nop
  4013d7:	90                   	nop
  4013d8:	90                   	nop
  4013d9:	90                   	nop
  4013da:	90                   	nop
  4013db:	90                   	nop
  4013dc:	90                   	nop
  4013dd:	90                   	nop
  4013de:	90                   	nop
  4013df:	90                   	nop

004013e0 <_key_schedule>:
  4013e0:	55                   	push   ebp
  4013e1:	57                   	push   edi
  4013e2:	56                   	push   esi
  4013e3:	53                   	push   ebx
  4013e4:	83 ec 14             	sub    esp,0x14
  4013e7:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4013eb:	8b 74 24 2c          	mov    esi,DWORD PTR [esp+0x2c]
  4013ef:	8b 10                	mov    edx,DWORD PTR [eax]
  4013f1:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  4013f4:	8d 7e 30             	lea    edi,[esi+0x30]
  4013f7:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
  4013fa:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4013fd:	89 7c 24 10          	mov    DWORD PTR [esp+0x10],edi
  401401:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  401405:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  401409:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40140d:	89 14 24             	mov    DWORD PTR [esp],edx
  401410:	89 df                	mov    edi,ebx
  401412:	89 c5                	mov    ebp,eax
  401414:	31 cf                	xor    edi,ecx
  401416:	31 dd                	xor    ebp,ebx
  401418:	31 c7                	xor    edi,eax
  40141a:	01 d7                	add    edi,edx
  40141c:	89 ea                	mov    edx,ebp
  40141e:	21 ca                	and    edx,ecx
  401420:	c1 cf 1f             	ror    edi,0x1f
  401423:	31 c2                	xor    edx,eax
  401425:	31 fa                	xor    edx,edi
  401427:	c1 ca 15             	ror    edx,0x15
  40142a:	89 d7                	mov    edi,edx
  40142c:	31 d5                	xor    ebp,edx
  40142e:	31 c7                	xor    edi,eax
  401430:	01 cd                	add    ebp,ecx
  401432:	89 f9                	mov    ecx,edi
  401434:	21 d9                	and    ecx,ebx
  401436:	c1 cd 1e             	ror    ebp,0x1e
  401439:	31 d1                	xor    ecx,edx
  40143b:	31 e9                	xor    ecx,ebp
  40143d:	c1 c9 19             	ror    ecx,0x19
  401440:	89 cd                	mov    ebp,ecx
  401442:	31 cf                	xor    edi,ecx
  401444:	31 d5                	xor    ebp,edx
  401446:	01 df                	add    edi,ebx
  401448:	89 eb                	mov    ebx,ebp
  40144a:	21 c3                	and    ebx,eax
  40144c:	c1 cf 1d             	ror    edi,0x1d
  40144f:	31 cb                	xor    ebx,ecx
  401451:	31 fb                	xor    ebx,edi
  401453:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
  401457:	c1 cb 11             	ror    ebx,0x11
  40145a:	31 dd                	xor    ebp,ebx
  40145c:	01 c5                	add    ebp,eax
  40145e:	89 d8                	mov    eax,ebx
  401460:	31 c8                	xor    eax,ecx
  401462:	21 d0                	and    eax,edx
  401464:	31 d8                	xor    eax,ebx
  401466:	c1 cd 1b             	ror    ebp,0x1b
  401469:	31 e8                	xor    eax,ebp
  40146b:	c1 c8 0f             	ror    eax,0xf
  40146e:	33 14 24             	xor    edx,DWORD PTR [esp]
  401471:	83 c6 10             	add    esi,0x10
  401474:	33 4c 24 04          	xor    ecx,DWORD PTR [esp+0x4]
  401478:	33 5c 24 08          	xor    ebx,DWORD PTR [esp+0x8]
  40147c:	33 44 24 0c          	xor    eax,DWORD PTR [esp+0xc]
  401480:	89 56 f0             	mov    DWORD PTR [esi-0x10],edx
  401483:	89 4e f4             	mov    DWORD PTR [esi-0xc],ecx
  401486:	89 5e f8             	mov    DWORD PTR [esi-0x8],ebx
  401489:	89 46 fc             	mov    DWORD PTR [esi-0x4],eax
  40148c:	8b 3f                	mov    edi,DWORD PTR [edi]
  40148e:	31 fa                	xor    edx,edi
  401490:	89 3c 24             	mov    DWORD PTR [esp],edi
  401493:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
  401497:	8b 7f 04             	mov    edi,DWORD PTR [edi+0x4]
  40149a:	31 f9                	xor    ecx,edi
  40149c:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4014a0:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
  4014a4:	8b 7f 08             	mov    edi,DWORD PTR [edi+0x8]
  4014a7:	31 fb                	xor    ebx,edi
  4014a9:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  4014ad:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
  4014b1:	8b 7f 0c             	mov    edi,DWORD PTR [edi+0xc]
  4014b4:	31 f8                	xor    eax,edi
  4014b6:	3b 74 24 10          	cmp    esi,DWORD PTR [esp+0x10]
  4014ba:	89 7c 24 0c          	mov    DWORD PTR [esp+0xc],edi
  4014be:	0f 85 4c ff ff ff    	jne    401410 <_key_schedule+0x30>
  4014c4:	83 c4 14             	add    esp,0x14
  4014c7:	5b                   	pop    ebx
  4014c8:	5e                   	pop    esi
  4014c9:	5f                   	pop    edi
  4014ca:	5d                   	pop    ebp
  4014cb:	c3                   	ret    
  4014cc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

004014d0 <_encrypt>:
  4014d0:	55                   	push   ebp
  4014d1:	57                   	push   edi
  4014d2:	56                   	push   esi
  4014d3:	53                   	push   ebx
  4014d4:	83 ec 3c             	sub    esp,0x3c
  4014d7:	8b 6c 24 50          	mov    ebp,DWORD PTR [esp+0x50]
  4014db:	8d 44 24 0c          	lea    eax,[esp+0xc]
  4014df:	8b 4d 04             	mov    ecx,DWORD PTR [ebp+0x4]
  4014e2:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
  4014e5:	8b 5d 00             	mov    ebx,DWORD PTR [ebp+0x0]
  4014e8:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  4014eb:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4014ef:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  4014f3:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  4014f7:	89 04 24             	mov    DWORD PTR [esp],eax
  4014fa:	e8 e1 fe ff ff       	call   4013e0 <_key_schedule>
  4014ff:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  401503:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  401507:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  40150b:	33 5c 24 0c          	xor    ebx,DWORD PTR [esp+0xc]
  40150f:	33 4c 24 10          	xor    ecx,DWORD PTR [esp+0x10]
  401513:	31 f0                	xor    eax,esi
  401515:	be 03 00 00 00       	mov    esi,0x3
  40151a:	31 fa                	xor    edx,edi
  40151c:	89 6c 24 50          	mov    DWORD PTR [esp+0x50],ebp
  401520:	89 f5                	mov    ebp,esi
  401522:	89 d6                	mov    esi,edx
  401524:	89 c7                	mov    edi,eax
  401526:	31 ce                	xor    esi,ecx
  401528:	31 d7                	xor    edi,edx
  40152a:	31 c6                	xor    esi,eax
  40152c:	01 de                	add    esi,ebx
  40152e:	89 fb                	mov    ebx,edi
  401530:	21 cb                	and    ebx,ecx
  401532:	c1 ce 1f             	ror    esi,0x1f
  401535:	31 c3                	xor    ebx,eax
  401537:	31 f3                	xor    ebx,esi
  401539:	c1 cb 15             	ror    ebx,0x15
  40153c:	89 de                	mov    esi,ebx
  40153e:	31 df                	xor    edi,ebx
  401540:	31 c6                	xor    esi,eax
  401542:	01 cf                	add    edi,ecx
  401544:	89 f1                	mov    ecx,esi
  401546:	21 d1                	and    ecx,edx
  401548:	c1 cf 1e             	ror    edi,0x1e
  40154b:	31 d9                	xor    ecx,ebx
  40154d:	31 f9                	xor    ecx,edi
  40154f:	c1 c9 19             	ror    ecx,0x19
  401552:	89 cf                	mov    edi,ecx
  401554:	31 ce                	xor    esi,ecx
  401556:	31 df                	xor    edi,ebx
  401558:	01 d6                	add    esi,edx
  40155a:	89 fa                	mov    edx,edi
  40155c:	21 c2                	and    edx,eax
  40155e:	c1 ce 1d             	ror    esi,0x1d
  401561:	31 ca                	xor    edx,ecx
  401563:	31 f2                	xor    edx,esi
  401565:	c1 ca 11             	ror    edx,0x11
  401568:	31 d7                	xor    edi,edx
  40156a:	01 c7                	add    edi,eax
  40156c:	89 d0                	mov    eax,edx
  40156e:	31 c8                	xor    eax,ecx
  401570:	21 d8                	and    eax,ebx
  401572:	c1 cf 1b             	ror    edi,0x1b
  401575:	31 d0                	xor    eax,edx
  401577:	31 f8                	xor    eax,edi
  401579:	c1 c8 0f             	ror    eax,0xf
  40157c:	83 ed 01             	sub    ebp,0x1
  40157f:	75 a1                	jne    401522 <_encrypt+0x52>
  401581:	8b 6c 24 50          	mov    ebp,DWORD PTR [esp+0x50]
  401585:	33 5c 24 1c          	xor    ebx,DWORD PTR [esp+0x1c]
  401589:	33 4c 24 20          	xor    ecx,DWORD PTR [esp+0x20]
  40158d:	33 54 24 24          	xor    edx,DWORD PTR [esp+0x24]
  401591:	33 44 24 28          	xor    eax,DWORD PTR [esp+0x28]
  401595:	89 5d 00             	mov    DWORD PTR [ebp+0x0],ebx
  401598:	89 4d 04             	mov    DWORD PTR [ebp+0x4],ecx
  40159b:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
  40159e:	89 45 0c             	mov    DWORD PTR [ebp+0xc],eax
  4015a1:	83 c4 3c             	add    esp,0x3c
  4015a4:	5b                   	pop    ebx
  4015a5:	5e                   	pop    esi
  4015a6:	5f                   	pop    edi
  4015a7:	5d                   	pop    ebp
  4015a8:	c3                   	ret    
  4015a9:	90                   	nop
  4015aa:	90                   	nop
  4015ab:	90                   	nop
  4015ac:	90                   	nop
  4015ad:	90                   	nop
  4015ae:	90                   	nop
  4015af:	90                   	nop

004015b0 <___dyn_tls_dtor@12>:
  4015b0:	83 ec 1c             	sub    esp,0x1c
  4015b3:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  4015b7:	85 c0                	test   eax,eax
  4015b9:	74 15                	je     4015d0 <___dyn_tls_dtor@12+0x20>
  4015bb:	83 f8 03             	cmp    eax,0x3
  4015be:	74 10                	je     4015d0 <___dyn_tls_dtor@12+0x20>
  4015c0:	b8 01 00 00 00       	mov    eax,0x1
  4015c5:	83 c4 1c             	add    esp,0x1c
  4015c8:	c2 0c 00             	ret    0xc
  4015cb:	90                   	nop
  4015cc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4015d0:	8b 54 24 28          	mov    edx,DWORD PTR [esp+0x28]
  4015d4:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4015d8:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4015dc:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  4015e0:	89 04 24             	mov    DWORD PTR [esp],eax
  4015e3:	e8 18 0a 00 00       	call   402000 <___mingw_TLScallback>
  4015e8:	b8 01 00 00 00       	mov    eax,0x1
  4015ed:	83 c4 1c             	add    esp,0x1c
  4015f0:	c2 0c 00             	ret    0xc
  4015f3:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4015f9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401600 <___dyn_tls_init@12>:
  401600:	56                   	push   esi
  401601:	53                   	push   ebx
  401602:	83 ec 14             	sub    esp,0x14
  401605:	83 3d 40 d0 40 00 02 	cmp    DWORD PTR ds:0x40d040,0x2
  40160c:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  401610:	74 0a                	je     40161c <___dyn_tls_init@12+0x1c>
  401612:	c7 05 40 d0 40 00 02 	mov    DWORD PTR ds:0x40d040,0x2
  401619:	00 00 00 
  40161c:	83 f8 02             	cmp    eax,0x2
  40161f:	74 12                	je     401633 <___dyn_tls_init@12+0x33>
  401621:	83 f8 01             	cmp    eax,0x1
  401624:	74 42                	je     401668 <___dyn_tls_init@12+0x68>
  401626:	83 c4 14             	add    esp,0x14
  401629:	b8 01 00 00 00       	mov    eax,0x1
  40162e:	5b                   	pop    ebx
  40162f:	5e                   	pop    esi
  401630:	c2 0c 00             	ret    0xc
  401633:	be 14 f0 40 00       	mov    esi,0x40f014
  401638:	81 ee 14 f0 40 00    	sub    esi,0x40f014
  40163e:	c1 fe 02             	sar    esi,0x2
  401641:	85 f6                	test   esi,esi
  401643:	7e e1                	jle    401626 <___dyn_tls_init@12+0x26>
  401645:	31 db                	xor    ebx,ebx
  401647:	8b 04 9d 14 f0 40 00 	mov    eax,DWORD PTR [ebx*4+0x40f014]
  40164e:	85 c0                	test   eax,eax
  401650:	74 02                	je     401654 <___dyn_tls_init@12+0x54>
  401652:	ff d0                	call   eax
  401654:	83 c3 01             	add    ebx,0x1
  401657:	39 f3                	cmp    ebx,esi
  401659:	75 ec                	jne    401647 <___dyn_tls_init@12+0x47>
  40165b:	83 c4 14             	add    esp,0x14
  40165e:	b8 01 00 00 00       	mov    eax,0x1
  401663:	5b                   	pop    ebx
  401664:	5e                   	pop    esi
  401665:	c2 0c 00             	ret    0xc
  401668:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  40166c:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401673:	00 
  401674:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401678:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  40167c:	89 04 24             	mov    DWORD PTR [esp],eax
  40167f:	e8 7c 09 00 00       	call   402000 <___mingw_TLScallback>
  401684:	eb a0                	jmp    401626 <___dyn_tls_init@12+0x26>
  401686:	8d 76 00             	lea    esi,[esi+0x0]
  401689:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401690 <___tlregdtor>:
  401690:	31 c0                	xor    eax,eax
  401692:	c3                   	ret    
  401693:	90                   	nop
  401694:	90                   	nop
  401695:	90                   	nop
  401696:	90                   	nop
  401697:	90                   	nop
  401698:	90                   	nop
  401699:	90                   	nop
  40169a:	90                   	nop
  40169b:	90                   	nop
  40169c:	90                   	nop
  40169d:	90                   	nop
  40169e:	90                   	nop
  40169f:	90                   	nop

004016a0 <__fpreset>:
  4016a0:	db e3                	fninit 
  4016a2:	c3                   	ret    
  4016a3:	90                   	nop
  4016a4:	90                   	nop
  4016a5:	90                   	nop
  4016a6:	90                   	nop
  4016a7:	90                   	nop
  4016a8:	90                   	nop
  4016a9:	90                   	nop
  4016aa:	90                   	nop
  4016ab:	90                   	nop
  4016ac:	90                   	nop
  4016ad:	90                   	nop
  4016ae:	90                   	nop
  4016af:	90                   	nop

004016b0 <___cpu_features_init>:
  4016b0:	9c                   	pushf  
  4016b1:	9c                   	pushf  
  4016b2:	58                   	pop    eax
  4016b3:	89 c2                	mov    edx,eax
  4016b5:	35 00 00 20 00       	xor    eax,0x200000
  4016ba:	50                   	push   eax
  4016bb:	9d                   	popf   
  4016bc:	9c                   	pushf  
  4016bd:	58                   	pop    eax
  4016be:	9d                   	popf   
  4016bf:	31 d0                	xor    eax,edx
  4016c1:	a9 00 00 20 00       	test   eax,0x200000
  4016c6:	0f 84 a5 00 00 00    	je     401771 <___cpu_features_init+0xc1>
  4016cc:	53                   	push   ebx
  4016cd:	31 c0                	xor    eax,eax
  4016cf:	0f a2                	cpuid  
  4016d1:	85 c0                	test   eax,eax
  4016d3:	0f 84 97 00 00 00    	je     401770 <___cpu_features_init+0xc0>
  4016d9:	b8 01 00 00 00       	mov    eax,0x1
  4016de:	0f a2                	cpuid  
  4016e0:	f6 c6 01             	test   dh,0x1
  4016e3:	74 07                	je     4016ec <___cpu_features_init+0x3c>
  4016e5:	83 0d 34 d0 40 00 01 	or     DWORD PTR ds:0x40d034,0x1
  4016ec:	f6 c6 80             	test   dh,0x80
  4016ef:	74 07                	je     4016f8 <___cpu_features_init+0x48>
  4016f1:	83 0d 34 d0 40 00 02 	or     DWORD PTR ds:0x40d034,0x2
  4016f8:	f7 c2 00 00 80 00    	test   edx,0x800000
  4016fe:	74 07                	je     401707 <___cpu_features_init+0x57>
  401700:	83 0d 34 d0 40 00 04 	or     DWORD PTR ds:0x40d034,0x4
  401707:	f7 c2 00 00 00 01    	test   edx,0x1000000
  40170d:	74 07                	je     401716 <___cpu_features_init+0x66>
  40170f:	83 0d 34 d0 40 00 08 	or     DWORD PTR ds:0x40d034,0x8
  401716:	f7 c2 00 00 00 02    	test   edx,0x2000000
  40171c:	74 07                	je     401725 <___cpu_features_init+0x75>
  40171e:	83 0d 34 d0 40 00 10 	or     DWORD PTR ds:0x40d034,0x10
  401725:	81 e2 00 00 00 04    	and    edx,0x4000000
  40172b:	74 07                	je     401734 <___cpu_features_init+0x84>
  40172d:	83 0d 34 d0 40 00 20 	or     DWORD PTR ds:0x40d034,0x20
  401734:	f6 c1 01             	test   cl,0x1
  401737:	74 07                	je     401740 <___cpu_features_init+0x90>
  401739:	83 0d 34 d0 40 00 40 	or     DWORD PTR ds:0x40d034,0x40
  401740:	80 e5 20             	and    ch,0x20
  401743:	75 2e                	jne    401773 <___cpu_features_init+0xc3>
  401745:	b8 00 00 00 80       	mov    eax,0x80000000
  40174a:	0f a2                	cpuid  
  40174c:	3d 00 00 00 80       	cmp    eax,0x80000000
  401751:	76 1d                	jbe    401770 <___cpu_features_init+0xc0>
  401753:	b8 01 00 00 80       	mov    eax,0x80000001
  401758:	0f a2                	cpuid  
  40175a:	85 d2                	test   edx,edx
  40175c:	78 22                	js     401780 <___cpu_features_init+0xd0>
  40175e:	81 e2 00 00 00 40    	and    edx,0x40000000
  401764:	74 0a                	je     401770 <___cpu_features_init+0xc0>
  401766:	81 0d 34 d0 40 00 00 	or     DWORD PTR ds:0x40d034,0x200
  40176d:	02 00 00 
  401770:	5b                   	pop    ebx
  401771:	f3 c3                	repz ret 
  401773:	81 0d 34 d0 40 00 80 	or     DWORD PTR ds:0x40d034,0x80
  40177a:	00 00 00 
  40177d:	eb c6                	jmp    401745 <___cpu_features_init+0x95>
  40177f:	90                   	nop
  401780:	81 0d 34 d0 40 00 00 	or     DWORD PTR ds:0x40d034,0x100
  401787:	01 00 00 
  40178a:	eb d2                	jmp    40175e <___cpu_features_init+0xae>
  40178c:	90                   	nop
  40178d:	90                   	nop
  40178e:	90                   	nop
  40178f:	90                   	nop

00401790 <__setargv>:
  401790:	55                   	push   ebp
  401791:	89 e5                	mov    ebp,esp
  401793:	57                   	push   edi
  401794:	56                   	push   esi
  401795:	53                   	push   ebx
  401796:	83 ec 4c             	sub    esp,0x4c
  401799:	f6 05 04 90 40 00 02 	test   BYTE PTR ds:0x409004,0x2
  4017a0:	0f 84 ba 02 00 00    	je     401a60 <__setargv+0x2d0>
  4017a6:	e8 0d 6a 00 00       	call   4081b8 <_GetCommandLineA@0>
  4017ab:	89 65 c0             	mov    DWORD PTR [ebp-0x40],esp
  4017ae:	89 04 24             	mov    DWORD PTR [esp],eax
  4017b1:	89 c6                	mov    esi,eax
  4017b3:	e8 28 69 00 00       	call   4080e0 <_strlen>
  4017b8:	8d 44 00 11          	lea    eax,[eax+eax*1+0x11]
  4017bc:	83 e0 f0             	and    eax,0xfffffff0
  4017bf:	e8 dc 08 00 00       	call   4020a0 <___chkstk_ms>
  4017c4:	29 c4                	sub    esp,eax
  4017c6:	8d 44 24 10          	lea    eax,[esp+0x10]
  4017ca:	89 c2                	mov    edx,eax
  4017cc:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  4017cf:	a1 04 90 40 00       	mov    eax,ds:0x409004
  4017d4:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  4017db:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
  4017e2:	c7 45 cc 00 00 00 00 	mov    DWORD PTR [ebp-0x34],0x0
  4017e9:	83 e0 40             	and    eax,0x40
  4017ec:	83 f8 01             	cmp    eax,0x1
  4017ef:	19 c0                	sbb    eax,eax
  4017f1:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  4017f4:	31 c0                	xor    eax,eax
  4017f6:	81 65 c8 00 c0 ff ff 	and    DWORD PTR [ebp-0x38],0xffffc000
  4017fd:	81 45 c8 10 40 00 00 	add    DWORD PTR [ebp-0x38],0x4010
  401804:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
  401807:	83 c6 01             	add    esi,0x1
  40180a:	0f b6 5e ff          	movzx  ebx,BYTE PTR [esi-0x1]
  40180e:	0f be cb             	movsx  ecx,bl
  401811:	85 c9                	test   ecx,ecx
  401813:	74 7b                	je     401890 <__setargv+0x100>
  401815:	80 fb 3f             	cmp    bl,0x3f
  401818:	0f 84 13 01 00 00    	je     401931 <__setargv+0x1a1>
  40181e:	0f 8f ec 00 00 00    	jg     401910 <__setargv+0x180>
  401824:	80 fb 27             	cmp    bl,0x27
  401827:	0f 84 e3 01 00 00    	je     401a10 <__setargv+0x280>
  40182d:	80 fb 2a             	cmp    bl,0x2a
  401830:	0f 84 fb 00 00 00    	je     401931 <__setargv+0x1a1>
  401836:	80 fb 22             	cmp    bl,0x22
  401839:	0f 85 36 01 00 00    	jne    401975 <__setargv+0x1e5>
  40183f:	89 c3                	mov    ebx,eax
  401841:	d1 fb                	sar    ebx,1
  401843:	0f 84 3e 02 00 00    	je     401a87 <__setargv+0x2f7>
  401849:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  40184c:	01 d3                	add    ebx,edx
  40184e:	66 90                	xchg   ax,ax
  401850:	83 c2 01             	add    edx,0x1
  401853:	39 da                	cmp    edx,ebx
  401855:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  401859:	75 f5                	jne    401850 <__setargv+0xc0>
  40185b:	a8 01                	test   al,0x1
  40185d:	0f 85 93 00 00 00    	jne    4018f6 <__setargv+0x166>
  401863:	83 7d d0 27          	cmp    DWORD PTR [ebp-0x30],0x27
  401867:	0f 84 89 00 00 00    	je     4018f6 <__setargv+0x166>
  40186d:	83 c6 01             	add    esi,0x1
  401870:	31 c0                	xor    eax,eax
  401872:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
  401875:	0f b6 5e ff          	movzx  ebx,BYTE PTR [esi-0x1]
  401879:	31 4d d0             	xor    DWORD PTR [ebp-0x30],ecx
  40187c:	c7 45 cc 01 00 00 00 	mov    DWORD PTR [ebp-0x34],0x1
  401883:	0f be cb             	movsx  ecx,bl
  401886:	85 c9                	test   ecx,ecx
  401888:	75 8b                	jne    401815 <__setargv+0x85>
  40188a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401890:	85 c0                	test   eax,eax
  401892:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  401895:	0f 84 f4 01 00 00    	je     401a8f <__setargv+0x2ff>
  40189b:	01 d0                	add    eax,edx
  40189d:	8d 76 00             	lea    esi,[esi+0x0]
  4018a0:	83 c2 01             	add    edx,0x1
  4018a3:	39 c2                	cmp    edx,eax
  4018a5:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  4018a9:	75 f5                	jne    4018a0 <__setargv+0x110>
  4018ab:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  4018ae:	85 d2                	test   edx,edx
  4018b0:	75 05                	jne    4018b7 <__setargv+0x127>
  4018b2:	39 45 c4             	cmp    DWORD PTR [ebp-0x3c],eax
  4018b5:	73 24                	jae    4018db <__setargv+0x14b>
  4018b7:	c6 00 00             	mov    BYTE PTR [eax],0x0
  4018ba:	8d 45 d8             	lea    eax,[ebp-0x28]
  4018bd:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4018c1:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4018c8:	00 
  4018c9:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  4018cc:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4018d0:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
  4018d3:	89 04 24             	mov    DWORD PTR [esp],eax
  4018d6:	e8 f5 13 00 00       	call   402cd0 <___mingw_glob>
  4018db:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4018de:	a3 04 d0 40 00       	mov    ds:0x40d004,eax
  4018e3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4018e6:	a3 00 d0 40 00       	mov    ds:0x40d000,eax
  4018eb:	8b 65 c0             	mov    esp,DWORD PTR [ebp-0x40]
  4018ee:	8d 65 f4             	lea    esp,[ebp-0xc]
  4018f1:	5b                   	pop    ebx
  4018f2:	5e                   	pop    esi
  4018f3:	5f                   	pop    edi
  4018f4:	5d                   	pop    ebp
  4018f5:	c3                   	ret    
  4018f6:	8d 43 01             	lea    eax,[ebx+0x1]
  4018f9:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  4018fc:	31 c0                	xor    eax,eax
  4018fe:	c6 03 22             	mov    BYTE PTR [ebx],0x22
  401901:	c7 45 cc 01 00 00 00 	mov    DWORD PTR [ebp-0x34],0x1
  401908:	e9 fa fe ff ff       	jmp    401807 <__setargv+0x77>
  40190d:	8d 76 00             	lea    esi,[esi+0x0]
  401910:	80 fb 5c             	cmp    bl,0x5c
  401913:	0f 84 3f 01 00 00    	je     401a58 <__setargv+0x2c8>
  401919:	80 fb 7f             	cmp    bl,0x7f
  40191c:	74 13                	je     401931 <__setargv+0x1a1>
  40191e:	80 fb 5b             	cmp    bl,0x5b
  401921:	75 52                	jne    401975 <__setargv+0x1e5>
  401923:	f6 05 04 90 40 00 20 	test   BYTE PTR ds:0x409004,0x20
  40192a:	bf 01 00 00 00       	mov    edi,0x1
  40192f:	74 0a                	je     40193b <__setargv+0x1ab>
  401931:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  401934:	85 d2                	test   edx,edx
  401936:	0f 95 c2             	setne  dl
  401939:	89 d7                	mov    edi,edx
  40193b:	85 c0                	test   eax,eax
  40193d:	0f 84 34 01 00 00    	je     401a77 <__setargv+0x2e7>
  401943:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  401946:	01 d0                	add    eax,edx
  401948:	83 c2 01             	add    edx,0x1
  40194b:	39 c2                	cmp    edx,eax
  40194d:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  401951:	75 f5                	jne    401948 <__setargv+0x1b8>
  401953:	89 fa                	mov    edx,edi
  401955:	84 d2                	test   dl,dl
  401957:	0f 85 a3 00 00 00    	jne    401a00 <__setargv+0x270>
  40195d:	83 f9 7f             	cmp    ecx,0x7f
  401960:	0f 84 9a 00 00 00    	je     401a00 <__setargv+0x270>
  401966:	8d 48 01             	lea    ecx,[eax+0x1]
  401969:	88 18                	mov    BYTE PTR [eax],bl
  40196b:	31 c0                	xor    eax,eax
  40196d:	89 4d d4             	mov    DWORD PTR [ebp-0x2c],ecx
  401970:	e9 92 fe ff ff       	jmp    401807 <__setargv+0x77>
  401975:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
  401978:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  40197b:	01 c7                	add    edi,eax
  40197d:	85 c0                	test   eax,eax
  40197f:	0f 84 fa 00 00 00    	je     401a7f <__setargv+0x2ef>
  401985:	83 c2 01             	add    edx,0x1
  401988:	39 fa                	cmp    edx,edi
  40198a:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  40198e:	75 f5                	jne    401985 <__setargv+0x1f5>
  401990:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  401993:	85 c0                	test   eax,eax
  401995:	75 59                	jne    4019f0 <__setargv+0x260>
  401997:	89 0c 24             	mov    DWORD PTR [esp],ecx
  40199a:	e8 49 67 00 00       	call   4080e8 <_isspace>
  40199f:	85 c0                	test   eax,eax
  4019a1:	74 4d                	je     4019f0 <__setargv+0x260>
  4019a3:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  4019a6:	85 c9                	test   ecx,ecx
  4019a8:	75 09                	jne    4019b3 <__setargv+0x223>
  4019aa:	39 7d c4             	cmp    DWORD PTR [ebp-0x3c],edi
  4019ad:	0f 83 ba 00 00 00    	jae    401a6d <__setargv+0x2dd>
  4019b3:	8d 45 d8             	lea    eax,[ebp-0x28]
  4019b6:	c6 07 00             	mov    BYTE PTR [edi],0x0
  4019b9:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4019bd:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4019c4:	00 
  4019c5:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  4019c8:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4019cc:	8b 7d c4             	mov    edi,DWORD PTR [ebp-0x3c]
  4019cf:	89 3c 24             	mov    DWORD PTR [esp],edi
  4019d2:	e8 f9 12 00 00       	call   402cd0 <___mingw_glob>
  4019d7:	31 c0                	xor    eax,eax
  4019d9:	83 4d c8 01          	or     DWORD PTR [ebp-0x38],0x1
  4019dd:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
  4019e0:	c7 45 cc 00 00 00 00 	mov    DWORD PTR [ebp-0x34],0x0
  4019e7:	e9 1b fe ff ff       	jmp    401807 <__setargv+0x77>
  4019ec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4019f0:	8d 47 01             	lea    eax,[edi+0x1]
  4019f3:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  4019f6:	31 c0                	xor    eax,eax
  4019f8:	88 1f                	mov    BYTE PTR [edi],bl
  4019fa:	e9 08 fe ff ff       	jmp    401807 <__setargv+0x77>
  4019ff:	90                   	nop
  401a00:	c6 00 7f             	mov    BYTE PTR [eax],0x7f
  401a03:	83 c0 01             	add    eax,0x1
  401a06:	e9 5b ff ff ff       	jmp    401966 <__setargv+0x1d6>
  401a0b:	90                   	nop
  401a0c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401a10:	f6 05 04 90 40 00 10 	test   BYTE PTR ds:0x409004,0x10
  401a17:	0f 84 58 ff ff ff    	je     401975 <__setargv+0x1e5>
  401a1d:	89 c3                	mov    ebx,eax
  401a1f:	d1 fb                	sar    ebx,1
  401a21:	74 73                	je     401a96 <__setargv+0x306>
  401a23:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  401a26:	01 d3                	add    ebx,edx
  401a28:	83 c2 01             	add    edx,0x1
  401a2b:	39 da                	cmp    edx,ebx
  401a2d:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  401a31:	75 f5                	jne    401a28 <__setargv+0x298>
  401a33:	a8 01                	test   al,0x1
  401a35:	75 0a                	jne    401a41 <__setargv+0x2b1>
  401a37:	83 7d d0 22          	cmp    DWORD PTR [ebp-0x30],0x22
  401a3b:	0f 85 2c fe ff ff    	jne    40186d <__setargv+0xdd>
  401a41:	8d 43 01             	lea    eax,[ebx+0x1]
  401a44:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  401a47:	31 c0                	xor    eax,eax
  401a49:	c6 03 27             	mov    BYTE PTR [ebx],0x27
  401a4c:	c7 45 cc 01 00 00 00 	mov    DWORD PTR [ebp-0x34],0x1
  401a53:	e9 af fd ff ff       	jmp    401807 <__setargv+0x77>
  401a58:	83 c0 01             	add    eax,0x1
  401a5b:	e9 a7 fd ff ff       	jmp    401807 <__setargv+0x77>
  401a60:	e8 fb f7 ff ff       	call   401260 <__mingw32_init_mainargs>
  401a65:	8d 65 f4             	lea    esp,[ebp-0xc]
  401a68:	5b                   	pop    ebx
  401a69:	5e                   	pop    esi
  401a6a:	5f                   	pop    edi
  401a6b:	5d                   	pop    ebp
  401a6c:	c3                   	ret    
  401a6d:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
  401a70:	31 c0                	xor    eax,eax
  401a72:	e9 90 fd ff ff       	jmp    401807 <__setargv+0x77>
  401a77:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  401a7a:	e9 d4 fe ff ff       	jmp    401953 <__setargv+0x1c3>
  401a7f:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
  401a82:	e9 09 ff ff ff       	jmp    401990 <__setargv+0x200>
  401a87:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
  401a8a:	e9 cc fd ff ff       	jmp    40185b <__setargv+0xcb>
  401a8f:	89 d0                	mov    eax,edx
  401a91:	e9 15 fe ff ff       	jmp    4018ab <__setargv+0x11b>
  401a96:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
  401a99:	eb 98                	jmp    401a33 <__setargv+0x2a3>
  401a9b:	90                   	nop
  401a9c:	90                   	nop
  401a9d:	90                   	nop
  401a9e:	90                   	nop
  401a9f:	90                   	nop

00401aa0 <___report_error>:
  401aa0:	56                   	push   esi
  401aa1:	53                   	push   ebx
  401aa2:	83 ec 14             	sub    esp,0x14
  401aa5:	a1 cc e1 40 00       	mov    eax,ds:0x40e1cc
  401aaa:	c7 44 24 08 17 00 00 	mov    DWORD PTR [esp+0x8],0x17
  401ab1:	00 
  401ab2:	8d 74 24 24          	lea    esi,[esp+0x24]
  401ab6:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401abd:	00 
  401abe:	c7 04 24 84 a0 40 00 	mov    DWORD PTR [esp],0x40a084
  401ac5:	8d 58 40             	lea    ebx,[eax+0x40]
  401ac8:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  401acc:	e8 1f 66 00 00       	call   4080f0 <_fwrite>
  401ad1:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  401ad5:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  401ad9:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401adc:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401ae0:	e8 13 66 00 00       	call   4080f8 <_vfprintf>
  401ae5:	e8 16 66 00 00       	call   408100 <_abort>
  401aea:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

00401af0 <___write_memory.part.0>:
  401af0:	55                   	push   ebp
  401af1:	89 e5                	mov    ebp,esp
  401af3:	57                   	push   edi
  401af4:	89 cf                	mov    edi,ecx
  401af6:	56                   	push   esi
  401af7:	89 d6                	mov    esi,edx
  401af9:	53                   	push   ebx
  401afa:	89 c3                	mov    ebx,eax
  401afc:	83 ec 4c             	sub    esp,0x4c
  401aff:	8d 45 cc             	lea    eax,[ebp-0x34]
  401b02:	c7 44 24 08 1c 00 00 	mov    DWORD PTR [esp+0x8],0x1c
  401b09:	00 
  401b0a:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401b0e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401b11:	e8 aa 66 00 00       	call   4081c0 <_VirtualQuery@12>
  401b16:	83 ec 0c             	sub    esp,0xc
  401b19:	85 c0                	test   eax,eax
  401b1b:	0f 84 9a 00 00 00    	je     401bbb <___write_memory.part.0+0xcb>
  401b21:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  401b24:	83 f8 04             	cmp    eax,0x4
  401b27:	75 18                	jne    401b41 <___write_memory.part.0+0x51>
  401b29:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  401b2d:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  401b31:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401b34:	e8 cf 65 00 00       	call   408108 <_memcpy>
  401b39:	8d 65 f4             	lea    esp,[ebp-0xc]
  401b3c:	5b                   	pop    ebx
  401b3d:	5e                   	pop    esi
  401b3e:	5f                   	pop    edi
  401b3f:	5d                   	pop    ebp
  401b40:	c3                   	ret    
  401b41:	83 f8 40             	cmp    eax,0x40
  401b44:	74 e3                	je     401b29 <___write_memory.part.0+0x39>
  401b46:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  401b49:	8d 55 c8             	lea    edx,[ebp-0x38]
  401b4c:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  401b50:	c7 44 24 08 40 00 00 	mov    DWORD PTR [esp+0x8],0x40
  401b57:	00 
  401b58:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
  401b5b:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401b5f:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  401b62:	89 04 24             	mov    DWORD PTR [esp],eax
  401b65:	e8 5e 66 00 00       	call   4081c8 <_VirtualProtect@16>
  401b6a:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
  401b6d:	89 4d c0             	mov    DWORD PTR [ebp-0x40],ecx
  401b70:	83 ec 10             	sub    esp,0x10
  401b73:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  401b77:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  401b7b:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401b7e:	e8 85 65 00 00       	call   408108 <_memcpy>
  401b83:	8b 4d c0             	mov    ecx,DWORD PTR [ebp-0x40]
  401b86:	83 f9 04             	cmp    ecx,0x4
  401b89:	74 ae                	je     401b39 <___write_memory.part.0+0x49>
  401b8b:	83 f9 40             	cmp    ecx,0x40
  401b8e:	74 a9                	je     401b39 <___write_memory.part.0+0x49>
  401b90:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  401b93:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  401b96:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401b9a:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  401b9d:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  401ba1:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401ba5:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  401ba8:	89 04 24             	mov    DWORD PTR [esp],eax
  401bab:	e8 18 66 00 00       	call   4081c8 <_VirtualProtect@16>
  401bb0:	83 ec 10             	sub    esp,0x10
  401bb3:	8d 65 f4             	lea    esp,[ebp-0xc]
  401bb6:	5b                   	pop    ebx
  401bb7:	5e                   	pop    esi
  401bb8:	5f                   	pop    edi
  401bb9:	5d                   	pop    ebp
  401bba:	c3                   	ret    
  401bbb:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  401bbf:	c7 44 24 04 1c 00 00 	mov    DWORD PTR [esp+0x4],0x1c
  401bc6:	00 
  401bc7:	c7 04 24 9c a0 40 00 	mov    DWORD PTR [esp],0x40a09c
  401bce:	e8 cd fe ff ff       	call   401aa0 <___report_error>
  401bd3:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401bd9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401be0 <__pei386_runtime_relocator>:
  401be0:	a1 38 d0 40 00       	mov    eax,ds:0x40d038
  401be5:	85 c0                	test   eax,eax
  401be7:	74 07                	je     401bf0 <__pei386_runtime_relocator+0x10>
  401be9:	c3                   	ret    
  401bea:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401bf0:	b8 40 a7 40 00       	mov    eax,0x40a740
  401bf5:	2d 40 a7 40 00       	sub    eax,0x40a740
  401bfa:	83 f8 07             	cmp    eax,0x7
  401bfd:	c7 05 38 d0 40 00 01 	mov    DWORD PTR ds:0x40d038,0x1
  401c04:	00 00 00 
  401c07:	7e e0                	jle    401be9 <__pei386_runtime_relocator+0x9>
  401c09:	57                   	push   edi
  401c0a:	56                   	push   esi
  401c0b:	53                   	push   ebx
  401c0c:	83 ec 20             	sub    esp,0x20
  401c0f:	83 f8 0b             	cmp    eax,0xb
  401c12:	0f 8e de 00 00 00    	jle    401cf6 <__pei386_runtime_relocator+0x116>
  401c18:	8b 35 40 a7 40 00    	mov    esi,DWORD PTR ds:0x40a740
  401c1e:	85 f6                	test   esi,esi
  401c20:	0f 85 8a 00 00 00    	jne    401cb0 <__pei386_runtime_relocator+0xd0>
  401c26:	8b 1d 44 a7 40 00    	mov    ebx,DWORD PTR ds:0x40a744
  401c2c:	85 db                	test   ebx,ebx
  401c2e:	0f 85 7c 00 00 00    	jne    401cb0 <__pei386_runtime_relocator+0xd0>
  401c34:	8b 0d 48 a7 40 00    	mov    ecx,DWORD PTR ds:0x40a748
  401c3a:	bb 4c a7 40 00       	mov    ebx,0x40a74c
  401c3f:	85 c9                	test   ecx,ecx
  401c41:	0f 84 b4 00 00 00    	je     401cfb <__pei386_runtime_relocator+0x11b>
  401c47:	bb 40 a7 40 00       	mov    ebx,0x40a740
  401c4c:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  401c4f:	83 f8 01             	cmp    eax,0x1
  401c52:	0f 85 49 01 00 00    	jne    401da1 <__pei386_runtime_relocator+0x1c1>
  401c58:	83 c3 0c             	add    ebx,0xc
  401c5b:	81 fb 40 a7 40 00    	cmp    ebx,0x40a740
  401c61:	0f 83 88 00 00 00    	jae    401cef <__pei386_runtime_relocator+0x10f>
  401c67:	0f b6 53 08          	movzx  edx,BYTE PTR [ebx+0x8]
  401c6b:	8b 73 04             	mov    esi,DWORD PTR [ebx+0x4]
  401c6e:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  401c70:	83 fa 10             	cmp    edx,0x10
  401c73:	8d 86 00 00 40 00    	lea    eax,[esi+0x400000]
  401c79:	8b b9 00 00 40 00    	mov    edi,DWORD PTR [ecx+0x400000]
  401c7f:	0f 84 8b 00 00 00    	je     401d10 <__pei386_runtime_relocator+0x130>
  401c85:	83 fa 20             	cmp    edx,0x20
  401c88:	0f 84 f2 00 00 00    	je     401d80 <__pei386_runtime_relocator+0x1a0>
  401c8e:	83 fa 08             	cmp    edx,0x8
  401c91:	0f 84 af 00 00 00    	je     401d46 <__pei386_runtime_relocator+0x166>
  401c97:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  401c9b:	c7 04 24 04 a1 40 00 	mov    DWORD PTR [esp],0x40a104
  401ca2:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [esp+0x1c],0x0
  401ca9:	00 
  401caa:	e8 f1 fd ff ff       	call   401aa0 <___report_error>
  401caf:	90                   	nop
  401cb0:	bb 40 a7 40 00       	mov    ebx,0x40a740
  401cb5:	81 fb 40 a7 40 00    	cmp    ebx,0x40a740
  401cbb:	73 32                	jae    401cef <__pei386_runtime_relocator+0x10f>
  401cbd:	8d 76 00             	lea    esi,[esi+0x0]
  401cc0:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
  401cc3:	b9 04 00 00 00       	mov    ecx,0x4
  401cc8:	83 c3 08             	add    ebx,0x8
  401ccb:	8d 82 00 00 40 00    	lea    eax,[edx+0x400000]
  401cd1:	8b 92 00 00 40 00    	mov    edx,DWORD PTR [edx+0x400000]
  401cd7:	03 53 f8             	add    edx,DWORD PTR [ebx-0x8]
  401cda:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  401cde:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401ce2:	e8 09 fe ff ff       	call   401af0 <___write_memory.part.0>
  401ce7:	81 fb 40 a7 40 00    	cmp    ebx,0x40a740
  401ced:	72 d1                	jb     401cc0 <__pei386_runtime_relocator+0xe0>
  401cef:	83 c4 20             	add    esp,0x20
  401cf2:	5b                   	pop    ebx
  401cf3:	5e                   	pop    esi
  401cf4:	5f                   	pop    edi
  401cf5:	c3                   	ret    
  401cf6:	bb 40 a7 40 00       	mov    ebx,0x40a740
  401cfb:	8b 13                	mov    edx,DWORD PTR [ebx]
  401cfd:	85 d2                	test   edx,edx
  401cff:	75 b4                	jne    401cb5 <__pei386_runtime_relocator+0xd5>
  401d01:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  401d04:	85 c0                	test   eax,eax
  401d06:	0f 84 40 ff ff ff    	je     401c4c <__pei386_runtime_relocator+0x6c>
  401d0c:	eb a7                	jmp    401cb5 <__pei386_runtime_relocator+0xd5>
  401d0e:	66 90                	xchg   ax,ax
  401d10:	0f b7 b6 00 00 40 00 	movzx  esi,WORD PTR [esi+0x400000]
  401d17:	66 85 f6             	test   si,si
  401d1a:	0f b7 d6             	movzx  edx,si
  401d1d:	79 06                	jns    401d25 <__pei386_runtime_relocator+0x145>
  401d1f:	81 ca 00 00 ff ff    	or     edx,0xffff0000
  401d25:	29 ca                	sub    edx,ecx
  401d27:	b9 02 00 00 00       	mov    ecx,0x2
  401d2c:	81 ea 00 00 40 00    	sub    edx,0x400000
  401d32:	01 fa                	add    edx,edi
  401d34:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  401d38:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401d3c:	e8 af fd ff ff       	call   401af0 <___write_memory.part.0>
  401d41:	e9 12 ff ff ff       	jmp    401c58 <__pei386_runtime_relocator+0x78>
  401d46:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  401d49:	84 d2                	test   dl,dl
  401d4b:	0f b6 f2             	movzx  esi,dl
  401d4e:	79 06                	jns    401d56 <__pei386_runtime_relocator+0x176>
  401d50:	81 ce 00 ff ff ff    	or     esi,0xffffff00
  401d56:	81 ee 00 00 40 00    	sub    esi,0x400000
  401d5c:	89 f2                	mov    edx,esi
  401d5e:	29 ca                	sub    edx,ecx
  401d60:	b9 01 00 00 00       	mov    ecx,0x1
  401d65:	01 fa                	add    edx,edi
  401d67:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  401d6b:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401d6f:	e8 7c fd ff ff       	call   401af0 <___write_memory.part.0>
  401d74:	e9 df fe ff ff       	jmp    401c58 <__pei386_runtime_relocator+0x78>
  401d79:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401d80:	81 c1 00 00 40 00    	add    ecx,0x400000
  401d86:	29 cf                	sub    edi,ecx
  401d88:	b9 04 00 00 00       	mov    ecx,0x4
  401d8d:	03 38                	add    edi,DWORD PTR [eax]
  401d8f:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401d93:	89 7c 24 1c          	mov    DWORD PTR [esp+0x1c],edi
  401d97:	e8 54 fd ff ff       	call   401af0 <___write_memory.part.0>
  401d9c:	e9 b7 fe ff ff       	jmp    401c58 <__pei386_runtime_relocator+0x78>
  401da1:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401da5:	c7 04 24 d0 a0 40 00 	mov    DWORD PTR [esp],0x40a0d0
  401dac:	e8 ef fc ff ff       	call   401aa0 <___report_error>
  401db1:	90                   	nop
  401db2:	90                   	nop
  401db3:	90                   	nop
  401db4:	90                   	nop
  401db5:	90                   	nop
  401db6:	90                   	nop
  401db7:	90                   	nop
  401db8:	90                   	nop
  401db9:	90                   	nop
  401dba:	90                   	nop
  401dbb:	90                   	nop
  401dbc:	90                   	nop
  401dbd:	90                   	nop
  401dbe:	90                   	nop
  401dbf:	90                   	nop

00401dc0 <___do_global_dtors>:
  401dc0:	a1 08 90 40 00       	mov    eax,ds:0x409008
  401dc5:	8b 00                	mov    eax,DWORD PTR [eax]
  401dc7:	85 c0                	test   eax,eax
  401dc9:	74 1f                	je     401dea <___do_global_dtors+0x2a>
  401dcb:	83 ec 0c             	sub    esp,0xc
  401dce:	66 90                	xchg   ax,ax
  401dd0:	ff d0                	call   eax
  401dd2:	a1 08 90 40 00       	mov    eax,ds:0x409008
  401dd7:	8d 50 04             	lea    edx,[eax+0x4]
  401dda:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401ddd:	89 15 08 90 40 00    	mov    DWORD PTR ds:0x409008,edx
  401de3:	85 c0                	test   eax,eax
  401de5:	75 e9                	jne    401dd0 <___do_global_dtors+0x10>
  401de7:	83 c4 0c             	add    esp,0xc
  401dea:	f3 c3                	repz ret 
  401dec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00401df0 <___do_global_ctors>:
  401df0:	53                   	push   ebx
  401df1:	83 ec 18             	sub    esp,0x18
  401df4:	8b 1d 60 85 40 00    	mov    ebx,DWORD PTR ds:0x408560
  401dfa:	83 fb ff             	cmp    ebx,0xffffffff
  401dfd:	74 24                	je     401e23 <___do_global_ctors+0x33>
  401dff:	85 db                	test   ebx,ebx
  401e01:	74 0f                	je     401e12 <___do_global_ctors+0x22>
  401e03:	ff 14 9d 60 85 40 00 	call   DWORD PTR [ebx*4+0x408560]
  401e0a:	83 eb 01             	sub    ebx,0x1
  401e0d:	8d 76 00             	lea    esi,[esi+0x0]
  401e10:	75 f1                	jne    401e03 <___do_global_ctors+0x13>
  401e12:	c7 04 24 c0 1d 40 00 	mov    DWORD PTR [esp],0x401dc0
  401e19:	e8 c2 f4 ff ff       	call   4012e0 <_atexit>
  401e1e:	83 c4 18             	add    esp,0x18
  401e21:	5b                   	pop    ebx
  401e22:	c3                   	ret    
  401e23:	31 db                	xor    ebx,ebx
  401e25:	eb 02                	jmp    401e29 <___do_global_ctors+0x39>
  401e27:	89 c3                	mov    ebx,eax
  401e29:	8d 43 01             	lea    eax,[ebx+0x1]
  401e2c:	8b 14 85 60 85 40 00 	mov    edx,DWORD PTR [eax*4+0x408560]
  401e33:	85 d2                	test   edx,edx
  401e35:	75 f0                	jne    401e27 <___do_global_ctors+0x37>
  401e37:	eb c6                	jmp    401dff <___do_global_ctors+0xf>
  401e39:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00401e40 <___main>:
  401e40:	8b 0d 3c d0 40 00    	mov    ecx,DWORD PTR ds:0x40d03c
  401e46:	85 c9                	test   ecx,ecx
  401e48:	74 06                	je     401e50 <___main+0x10>
  401e4a:	f3 c3                	repz ret 
  401e4c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401e50:	c7 05 3c d0 40 00 01 	mov    DWORD PTR ds:0x40d03c,0x1
  401e57:	00 00 00 
  401e5a:	eb 94                	jmp    401df0 <___do_global_ctors>
  401e5c:	90                   	nop
  401e5d:	90                   	nop
  401e5e:	90                   	nop
  401e5f:	90                   	nop

00401e60 <___mingwthr_run_key_dtors.part.0>:
  401e60:	55                   	push   ebp
  401e61:	89 e5                	mov    ebp,esp
  401e63:	56                   	push   esi
  401e64:	53                   	push   ebx
  401e65:	83 ec 10             	sub    esp,0x10
  401e68:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401e6f:	e8 5c 63 00 00       	call   4081d0 <_EnterCriticalSection@4>
  401e74:	8b 1d 44 d0 40 00    	mov    ebx,DWORD PTR ds:0x40d044
  401e7a:	83 ec 04             	sub    esp,0x4
  401e7d:	85 db                	test   ebx,ebx
  401e7f:	74 2b                	je     401eac <___mingwthr_run_key_dtors.part.0+0x4c>
  401e81:	8b 03                	mov    eax,DWORD PTR [ebx]
  401e83:	89 04 24             	mov    DWORD PTR [esp],eax
  401e86:	e8 4d 63 00 00       	call   4081d8 <_TlsGetValue@4>
  401e8b:	83 ec 04             	sub    esp,0x4
  401e8e:	89 c6                	mov    esi,eax
  401e90:	e8 4b 63 00 00       	call   4081e0 <_GetLastError@0>
  401e95:	85 c0                	test   eax,eax
  401e97:	75 0c                	jne    401ea5 <___mingwthr_run_key_dtors.part.0+0x45>
  401e99:	85 f6                	test   esi,esi
  401e9b:	74 08                	je     401ea5 <___mingwthr_run_key_dtors.part.0+0x45>
  401e9d:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  401ea0:	89 34 24             	mov    DWORD PTR [esp],esi
  401ea3:	ff d0                	call   eax
  401ea5:	8b 5b 08             	mov    ebx,DWORD PTR [ebx+0x8]
  401ea8:	85 db                	test   ebx,ebx
  401eaa:	75 d5                	jne    401e81 <___mingwthr_run_key_dtors.part.0+0x21>
  401eac:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401eb3:	e8 30 63 00 00       	call   4081e8 <_LeaveCriticalSection@4>
  401eb8:	83 ec 04             	sub    esp,0x4
  401ebb:	8d 65 f8             	lea    esp,[ebp-0x8]
  401ebe:	5b                   	pop    ebx
  401ebf:	5e                   	pop    esi
  401ec0:	5d                   	pop    ebp
  401ec1:	c3                   	ret    
  401ec2:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401ec9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401ed0 <____w64_mingwthr_add_key_dtor>:
  401ed0:	55                   	push   ebp
  401ed1:	89 e5                	mov    ebp,esp
  401ed3:	56                   	push   esi
  401ed4:	31 f6                	xor    esi,esi
  401ed6:	53                   	push   ebx
  401ed7:	83 ec 10             	sub    esp,0x10
  401eda:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  401edf:	85 c0                	test   eax,eax
  401ee1:	75 0d                	jne    401ef0 <____w64_mingwthr_add_key_dtor+0x20>
  401ee3:	8d 65 f8             	lea    esp,[ebp-0x8]
  401ee6:	89 f0                	mov    eax,esi
  401ee8:	5b                   	pop    ebx
  401ee9:	5e                   	pop    esi
  401eea:	5d                   	pop    ebp
  401eeb:	c3                   	ret    
  401eec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401ef0:	c7 44 24 04 0c 00 00 	mov    DWORD PTR [esp+0x4],0xc
  401ef7:	00 
  401ef8:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  401eff:	e8 0c 62 00 00       	call   408110 <_calloc>
  401f04:	85 c0                	test   eax,eax
  401f06:	89 c3                	mov    ebx,eax
  401f08:	74 40                	je     401f4a <____w64_mingwthr_add_key_dtor+0x7a>
  401f0a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401f0d:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401f14:	89 03                	mov    DWORD PTR [ebx],eax
  401f16:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  401f19:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
  401f1c:	e8 af 62 00 00       	call   4081d0 <_EnterCriticalSection@4>
  401f21:	a1 44 d0 40 00       	mov    eax,ds:0x40d044
  401f26:	89 1d 44 d0 40 00    	mov    DWORD PTR ds:0x40d044,ebx
  401f2c:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  401f2f:	83 ec 04             	sub    esp,0x4
  401f32:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401f39:	e8 aa 62 00 00       	call   4081e8 <_LeaveCriticalSection@4>
  401f3e:	89 f0                	mov    eax,esi
  401f40:	83 ec 04             	sub    esp,0x4
  401f43:	8d 65 f8             	lea    esp,[ebp-0x8]
  401f46:	5b                   	pop    ebx
  401f47:	5e                   	pop    esi
  401f48:	5d                   	pop    ebp
  401f49:	c3                   	ret    
  401f4a:	be ff ff ff ff       	mov    esi,0xffffffff
  401f4f:	eb 92                	jmp    401ee3 <____w64_mingwthr_add_key_dtor+0x13>
  401f51:	eb 0d                	jmp    401f60 <____w64_mingwthr_remove_key_dtor>
  401f53:	90                   	nop
  401f54:	90                   	nop
  401f55:	90                   	nop
  401f56:	90                   	nop
  401f57:	90                   	nop
  401f58:	90                   	nop
  401f59:	90                   	nop
  401f5a:	90                   	nop
  401f5b:	90                   	nop
  401f5c:	90                   	nop
  401f5d:	90                   	nop
  401f5e:	90                   	nop
  401f5f:	90                   	nop

00401f60 <____w64_mingwthr_remove_key_dtor>:
  401f60:	55                   	push   ebp
  401f61:	89 e5                	mov    ebp,esp
  401f63:	53                   	push   ebx
  401f64:	83 ec 14             	sub    esp,0x14
  401f67:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  401f6c:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  401f6f:	85 c0                	test   eax,eax
  401f71:	75 0d                	jne    401f80 <____w64_mingwthr_remove_key_dtor+0x20>
  401f73:	31 c0                	xor    eax,eax
  401f75:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  401f78:	c9                   	leave  
  401f79:	c3                   	ret    
  401f7a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401f80:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401f87:	e8 44 62 00 00       	call   4081d0 <_EnterCriticalSection@4>
  401f8c:	8b 15 44 d0 40 00    	mov    edx,DWORD PTR ds:0x40d044
  401f92:	83 ec 04             	sub    esp,0x4
  401f95:	85 d2                	test   edx,edx
  401f97:	74 17                	je     401fb0 <____w64_mingwthr_remove_key_dtor+0x50>
  401f99:	8b 02                	mov    eax,DWORD PTR [edx]
  401f9b:	39 d8                	cmp    eax,ebx
  401f9d:	75 0a                	jne    401fa9 <____w64_mingwthr_remove_key_dtor+0x49>
  401f9f:	eb 44                	jmp    401fe5 <____w64_mingwthr_remove_key_dtor+0x85>
  401fa1:	8b 08                	mov    ecx,DWORD PTR [eax]
  401fa3:	39 d9                	cmp    ecx,ebx
  401fa5:	74 1f                	je     401fc6 <____w64_mingwthr_remove_key_dtor+0x66>
  401fa7:	89 c2                	mov    edx,eax
  401fa9:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
  401fac:	85 c0                	test   eax,eax
  401fae:	75 f1                	jne    401fa1 <____w64_mingwthr_remove_key_dtor+0x41>
  401fb0:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401fb7:	e8 2c 62 00 00       	call   4081e8 <_LeaveCriticalSection@4>
  401fbc:	83 ec 04             	sub    esp,0x4
  401fbf:	31 c0                	xor    eax,eax
  401fc1:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  401fc4:	c9                   	leave  
  401fc5:	c3                   	ret    
  401fc6:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
  401fc9:	89 4a 08             	mov    DWORD PTR [edx+0x8],ecx
  401fcc:	89 04 24             	mov    DWORD PTR [esp],eax
  401fcf:	e8 44 61 00 00       	call   408118 <_free>
  401fd4:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401fdb:	e8 08 62 00 00       	call   4081e8 <_LeaveCriticalSection@4>
  401fe0:	83 ec 04             	sub    esp,0x4
  401fe3:	eb da                	jmp    401fbf <____w64_mingwthr_remove_key_dtor+0x5f>
  401fe5:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
  401fe8:	a3 44 d0 40 00       	mov    ds:0x40d044,eax
  401fed:	89 d0                	mov    eax,edx
  401fef:	eb db                	jmp    401fcc <____w64_mingwthr_remove_key_dtor+0x6c>
  401ff1:	eb 0d                	jmp    402000 <___mingw_TLScallback>
  401ff3:	90                   	nop
  401ff4:	90                   	nop
  401ff5:	90                   	nop
  401ff6:	90                   	nop
  401ff7:	90                   	nop
  401ff8:	90                   	nop
  401ff9:	90                   	nop
  401ffa:	90                   	nop
  401ffb:	90                   	nop
  401ffc:	90                   	nop
  401ffd:	90                   	nop
  401ffe:	90                   	nop
  401fff:	90                   	nop

00402000 <___mingw_TLScallback>:
  402000:	55                   	push   ebp
  402001:	89 e5                	mov    ebp,esp
  402003:	83 ec 18             	sub    esp,0x18
  402006:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  402009:	83 f8 01             	cmp    eax,0x1
  40200c:	74 45                	je     402053 <___mingw_TLScallback+0x53>
  40200e:	72 15                	jb     402025 <___mingw_TLScallback+0x25>
  402010:	83 f8 03             	cmp    eax,0x3
  402013:	75 09                	jne    40201e <___mingw_TLScallback+0x1e>
  402015:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  40201a:	85 c0                	test   eax,eax
  40201c:	75 63                	jne    402081 <___mingw_TLScallback+0x81>
  40201e:	b8 01 00 00 00       	mov    eax,0x1
  402023:	c9                   	leave  
  402024:	c3                   	ret    
  402025:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  40202a:	85 c0                	test   eax,eax
  40202c:	75 5a                	jne    402088 <___mingw_TLScallback+0x88>
  40202e:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  402033:	83 f8 01             	cmp    eax,0x1
  402036:	75 e6                	jne    40201e <___mingw_TLScallback+0x1e>
  402038:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  40203f:	c7 05 48 d0 40 00 00 	mov    DWORD PTR ds:0x40d048,0x0
  402046:	00 00 00 
  402049:	e8 a2 61 00 00       	call   4081f0 <_DeleteCriticalSection@4>
  40204e:	83 ec 04             	sub    esp,0x4
  402051:	eb cb                	jmp    40201e <___mingw_TLScallback+0x1e>
  402053:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  402058:	85 c0                	test   eax,eax
  40205a:	74 14                	je     402070 <___mingw_TLScallback+0x70>
  40205c:	c7 05 48 d0 40 00 01 	mov    DWORD PTR ds:0x40d048,0x1
  402063:	00 00 00 
  402066:	b8 01 00 00 00       	mov    eax,0x1
  40206b:	c9                   	leave  
  40206c:	c3                   	ret    
  40206d:	8d 76 00             	lea    esi,[esi+0x0]
  402070:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  402077:	e8 7c 61 00 00       	call   4081f8 <_InitializeCriticalSection@4>
  40207c:	83 ec 04             	sub    esp,0x4
  40207f:	eb db                	jmp    40205c <___mingw_TLScallback+0x5c>
  402081:	e8 da fd ff ff       	call   401e60 <___mingwthr_run_key_dtors.part.0>
  402086:	eb 96                	jmp    40201e <___mingw_TLScallback+0x1e>
  402088:	90                   	nop
  402089:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402090:	e8 cb fd ff ff       	call   401e60 <___mingwthr_run_key_dtors.part.0>
  402095:	eb 97                	jmp    40202e <___mingw_TLScallback+0x2e>
  402097:	90                   	nop
  402098:	90                   	nop
  402099:	90                   	nop
  40209a:	90                   	nop
  40209b:	90                   	nop
  40209c:	90                   	nop
  40209d:	90                   	nop
  40209e:	90                   	nop
  40209f:	90                   	nop

004020a0 <___chkstk_ms>:
  4020a0:	51                   	push   ecx
  4020a1:	50                   	push   eax
  4020a2:	3d 00 10 00 00       	cmp    eax,0x1000
  4020a7:	8d 4c 24 0c          	lea    ecx,[esp+0xc]
  4020ab:	72 15                	jb     4020c2 <___chkstk_ms+0x22>
  4020ad:	81 e9 00 10 00 00    	sub    ecx,0x1000
  4020b3:	83 09 00             	or     DWORD PTR [ecx],0x0
  4020b6:	2d 00 10 00 00       	sub    eax,0x1000
  4020bb:	3d 00 10 00 00       	cmp    eax,0x1000
  4020c0:	77 eb                	ja     4020ad <___chkstk_ms+0xd>
  4020c2:	29 c1                	sub    ecx,eax
  4020c4:	83 09 00             	or     DWORD PTR [ecx],0x0
  4020c7:	58                   	pop    eax
  4020c8:	59                   	pop    ecx
  4020c9:	c3                   	ret    
  4020ca:	90                   	nop
  4020cb:	90                   	nop

004020cc <.text>:
  4020cc:	66 90                	xchg   ax,ax
  4020ce:	66 90                	xchg   ax,ax

004020d0 <_is_glob_pattern>:
  4020d0:	57                   	push   edi
  4020d1:	85 c0                	test   eax,eax
  4020d3:	56                   	push   esi
  4020d4:	53                   	push   ebx
  4020d5:	89 c3                	mov    ebx,eax
  4020d7:	74 44                	je     40211d <_is_glob_pattern+0x4d>
  4020d9:	0f be 0b             	movsx  ecx,BYTE PTR [ebx]
  4020dc:	89 d6                	mov    esi,edx
  4020de:	31 c0                	xor    eax,eax
  4020e0:	83 e6 20             	and    esi,0x20
  4020e3:	8d 53 01             	lea    edx,[ebx+0x1]
  4020e6:	85 c9                	test   ecx,ecx
  4020e8:	74 33                	je     40211d <_is_glob_pattern+0x4d>
  4020ea:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4020f0:	85 f6                	test   esi,esi
  4020f2:	89 f7                	mov    edi,esi
  4020f4:	75 05                	jne    4020fb <_is_glob_pattern+0x2b>
  4020f6:	83 f9 7f             	cmp    ecx,0x7f
  4020f9:	74 45                	je     402140 <_is_glob_pattern+0x70>
  4020fb:	85 c0                	test   eax,eax
  4020fd:	75 26                	jne    402125 <_is_glob_pattern+0x55>
  4020ff:	83 f9 3f             	cmp    ecx,0x3f
  402102:	74 51                	je     402155 <_is_glob_pattern+0x85>
  402104:	83 f9 2a             	cmp    ecx,0x2a
  402107:	74 4c                	je     402155 <_is_glob_pattern+0x85>
  402109:	31 c0                	xor    eax,eax
  40210b:	83 f9 5b             	cmp    ecx,0x5b
  40210e:	0f 94 c0             	sete   al
  402111:	89 d3                	mov    ebx,edx
  402113:	0f be 0b             	movsx  ecx,BYTE PTR [ebx]
  402116:	8d 53 01             	lea    edx,[ebx+0x1]
  402119:	85 c9                	test   ecx,ecx
  40211b:	75 d3                	jne    4020f0 <_is_glob_pattern+0x20>
  40211d:	31 ff                	xor    edi,edi
  40211f:	89 f8                	mov    eax,edi
  402121:	5b                   	pop    ebx
  402122:	5e                   	pop    esi
  402123:	5f                   	pop    edi
  402124:	c3                   	ret    
  402125:	83 f9 5d             	cmp    ecx,0x5d
  402128:	74 26                	je     402150 <_is_glob_pattern+0x80>
  40212a:	83 f9 21             	cmp    ecx,0x21
  40212d:	89 d3                	mov    ebx,edx
  40212f:	0f 95 c1             	setne  cl
  402132:	0f b6 c9             	movzx  ecx,cl
  402135:	01 c8                	add    eax,ecx
  402137:	eb da                	jmp    402113 <_is_glob_pattern+0x43>
  402139:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402140:	80 7b 01 00          	cmp    BYTE PTR [ebx+0x1],0x0
  402144:	8d 53 02             	lea    edx,[ebx+0x2]
  402147:	75 b2                	jne    4020fb <_is_glob_pattern+0x2b>
  402149:	eb d4                	jmp    40211f <_is_glob_pattern+0x4f>
  40214b:	90                   	nop
  40214c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402150:	83 f8 01             	cmp    eax,0x1
  402153:	7e d5                	jle    40212a <_is_glob_pattern+0x5a>
  402155:	bf 01 00 00 00       	mov    edi,0x1
  40215a:	89 f8                	mov    eax,edi
  40215c:	5b                   	pop    ebx
  40215d:	5e                   	pop    esi
  40215e:	5f                   	pop    edi
  40215f:	c3                   	ret    

00402160 <_glob_in_set>:
  402160:	55                   	push   ebp
  402161:	57                   	push   edi
  402162:	56                   	push   esi
  402163:	53                   	push   ebx
  402164:	83 ec 04             	sub    esp,0x4
  402167:	0f b6 18             	movzx  ebx,BYTE PTR [eax]
  40216a:	89 0c 24             	mov    DWORD PTR [esp],ecx
  40216d:	0f be fb             	movsx  edi,bl
  402170:	83 ff 5d             	cmp    edi,0x5d
  402173:	0f 84 d7 00 00 00    	je     402250 <_glob_in_set+0xf0>
  402179:	83 ff 2d             	cmp    edi,0x2d
  40217c:	89 d9                	mov    ecx,ebx
  40217e:	75 2e                	jne    4021ae <_glob_in_set+0x4e>
  402180:	e9 cb 00 00 00       	jmp    402250 <_glob_in_set+0xf0>
  402185:	85 db                	test   ebx,ebx
  402187:	0f 84 b3 00 00 00    	je     402240 <_glob_in_set+0xe0>
  40218d:	83 fb 5c             	cmp    ebx,0x5c
  402190:	0f 84 aa 00 00 00    	je     402240 <_glob_in_set+0xe0>
  402196:	83 fb 2f             	cmp    ebx,0x2f
  402199:	0f 84 a1 00 00 00    	je     402240 <_glob_in_set+0xe0>
  40219f:	89 df                	mov    edi,ebx
  4021a1:	0f b6 0e             	movzx  ecx,BYTE PTR [esi]
  4021a4:	89 f0                	mov    eax,esi
  4021a6:	39 d7                	cmp    edi,edx
  4021a8:	0f 84 ca 00 00 00    	je     402278 <_glob_in_set+0x118>
  4021ae:	0f be d9             	movsx  ebx,cl
  4021b1:	83 fb 5d             	cmp    ebx,0x5d
  4021b4:	8d 70 01             	lea    esi,[eax+0x1]
  4021b7:	0f 84 83 00 00 00    	je     402240 <_glob_in_set+0xe0>
  4021bd:	83 fb 2d             	cmp    ebx,0x2d
  4021c0:	75 c3                	jne    402185 <_glob_in_set+0x25>
  4021c2:	0f b6 58 01          	movzx  ebx,BYTE PTR [eax+0x1]
  4021c6:	80 fb 5d             	cmp    bl,0x5d
  4021c9:	0f 84 95 00 00 00    	je     402264 <_glob_in_set+0x104>
  4021cf:	0f be eb             	movsx  ebp,bl
  4021d2:	85 ed                	test   ebp,ebp
  4021d4:	89 eb                	mov    ebx,ebp
  4021d6:	74 68                	je     402240 <_glob_in_set+0xe0>
  4021d8:	39 ef                	cmp    edi,ebp
  4021da:	8d 70 02             	lea    esi,[eax+0x2]
  4021dd:	0f 8d 85 01 00 00    	jge    402368 <_glob_in_set+0x208>
  4021e3:	39 d7                	cmp    edi,edx
  4021e5:	8d 47 01             	lea    eax,[edi+0x1]
  4021e8:	75 14                	jne    4021fe <_glob_in_set+0x9e>
  4021ea:	e9 c1 00 00 00       	jmp    4022b0 <_glob_in_set+0x150>
  4021ef:	90                   	nop
  4021f0:	83 c0 01             	add    eax,0x1
  4021f3:	8d 78 ff             	lea    edi,[eax-0x1]
  4021f6:	39 fa                	cmp    edx,edi
  4021f8:	0f 84 b2 00 00 00    	je     4022b0 <_glob_in_set+0x150>
  4021fe:	39 c5                	cmp    ebp,eax
  402200:	7f ee                	jg     4021f0 <_glob_in_set+0x90>
  402202:	39 c5                	cmp    ebp,eax
  402204:	7d 87                	jge    40218d <_glob_in_set+0x2d>
  402206:	39 c2                	cmp    edx,eax
  402208:	74 15                	je     40221f <_glob_in_set+0xbf>
  40220a:	83 c5 01             	add    ebp,0x1
  40220d:	8d 76 00             	lea    esi,[esi+0x0]
  402210:	39 e8                	cmp    eax,ebp
  402212:	0f 84 75 ff ff ff    	je     40218d <_glob_in_set+0x2d>
  402218:	83 e8 01             	sub    eax,0x1
  40221b:	39 c2                	cmp    edx,eax
  40221d:	75 f1                	jne    402210 <_glob_in_set+0xb0>
  40221f:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
  402222:	83 e1 20             	and    ecx,0x20
  402225:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  402228:	3c 5d                	cmp    al,0x5d
  40222a:	0f 84 a3 00 00 00    	je     4022d3 <_glob_in_set+0x173>
  402230:	3c 7f                	cmp    al,0x7f
  402232:	0f 84 bd 00 00 00    	je     4022f5 <_glob_in_set+0x195>
  402238:	83 c6 01             	add    esi,0x1
  40223b:	84 c0                	test   al,al
  40223d:	75 e6                	jne    402225 <_glob_in_set+0xc5>
  40223f:	90                   	nop
  402240:	83 c4 04             	add    esp,0x4
  402243:	31 c0                	xor    eax,eax
  402245:	5b                   	pop    ebx
  402246:	5e                   	pop    esi
  402247:	5f                   	pop    edi
  402248:	5d                   	pop    ebp
  402249:	c3                   	ret    
  40224a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402250:	39 d7                	cmp    edi,edx
  402252:	0f 84 b8 00 00 00    	je     402310 <_glob_in_set+0x1b0>
  402258:	0f b6 48 01          	movzx  ecx,BYTE PTR [eax+0x1]
  40225c:	83 c0 01             	add    eax,0x1
  40225f:	e9 4a ff ff ff       	jmp    4021ae <_glob_in_set+0x4e>
  402264:	bf 2d 00 00 00       	mov    edi,0x2d
  402269:	89 f0                	mov    eax,esi
  40226b:	39 d7                	cmp    edi,edx
  40226d:	b9 5d 00 00 00       	mov    ecx,0x5d
  402272:	0f 85 36 ff ff ff    	jne    4021ae <_glob_in_set+0x4e>
  402278:	8b 14 24             	mov    edx,DWORD PTR [esp]
  40227b:	83 e2 20             	and    edx,0x20
  40227e:	eb 0a                	jmp    40228a <_glob_in_set+0x12a>
  402280:	83 c0 01             	add    eax,0x1
  402283:	84 c9                	test   cl,cl
  402285:	74 b9                	je     402240 <_glob_in_set+0xe0>
  402287:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
  40228a:	80 f9 5d             	cmp    cl,0x5d
  40228d:	0f 84 c2 00 00 00    	je     402355 <_glob_in_set+0x1f5>
  402293:	80 f9 7f             	cmp    cl,0x7f
  402296:	75 e8                	jne    402280 <_glob_in_set+0x120>
  402298:	85 d2                	test   edx,edx
  40229a:	0f 85 c0 00 00 00    	jne    402360 <_glob_in_set+0x200>
  4022a0:	0f b6 48 01          	movzx  ecx,BYTE PTR [eax+0x1]
  4022a4:	83 c0 01             	add    eax,0x1
  4022a7:	eb d7                	jmp    402280 <_glob_in_set+0x120>
  4022a9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4022b0:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
  4022b3:	83 e1 20             	and    ecx,0x20
  4022b6:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  4022b9:	3c 5d                	cmp    al,0x5d
  4022bb:	74 16                	je     4022d3 <_glob_in_set+0x173>
  4022bd:	3c 7f                	cmp    al,0x7f
  4022bf:	74 1f                	je     4022e0 <_glob_in_set+0x180>
  4022c1:	83 c6 01             	add    esi,0x1
  4022c4:	84 c0                	test   al,al
  4022c6:	0f 84 74 ff ff ff    	je     402240 <_glob_in_set+0xe0>
  4022cc:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  4022cf:	3c 5d                	cmp    al,0x5d
  4022d1:	75 ea                	jne    4022bd <_glob_in_set+0x15d>
  4022d3:	83 c4 04             	add    esp,0x4
  4022d6:	5b                   	pop    ebx
  4022d7:	8d 46 01             	lea    eax,[esi+0x1]
  4022da:	5e                   	pop    esi
  4022db:	5f                   	pop    edi
  4022dc:	5d                   	pop    ebp
  4022dd:	c3                   	ret    
  4022de:	66 90                	xchg   ax,ax
  4022e0:	85 c9                	test   ecx,ecx
  4022e2:	75 0c                	jne    4022f0 <_glob_in_set+0x190>
  4022e4:	0f b6 46 01          	movzx  eax,BYTE PTR [esi+0x1]
  4022e8:	83 c6 01             	add    esi,0x1
  4022eb:	eb d4                	jmp    4022c1 <_glob_in_set+0x161>
  4022ed:	8d 76 00             	lea    esi,[esi+0x0]
  4022f0:	83 c6 01             	add    esi,0x1
  4022f3:	eb c1                	jmp    4022b6 <_glob_in_set+0x156>
  4022f5:	85 c9                	test   ecx,ecx
  4022f7:	75 0c                	jne    402305 <_glob_in_set+0x1a5>
  4022f9:	0f b6 46 01          	movzx  eax,BYTE PTR [esi+0x1]
  4022fd:	83 c6 01             	add    esi,0x1
  402300:	e9 33 ff ff ff       	jmp    402238 <_glob_in_set+0xd8>
  402305:	83 c6 01             	add    esi,0x1
  402308:	e9 18 ff ff ff       	jmp    402225 <_glob_in_set+0xc5>
  40230d:	8d 76 00             	lea    esi,[esi+0x0]
  402310:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
  402313:	83 c0 01             	add    eax,0x1
  402316:	83 e1 20             	and    ecx,0x20
  402319:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402320:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  402323:	80 fa 5d             	cmp    dl,0x5d
  402326:	74 2d                	je     402355 <_glob_in_set+0x1f5>
  402328:	80 fa 7f             	cmp    dl,0x7f
  40232b:	74 13                	je     402340 <_glob_in_set+0x1e0>
  40232d:	83 c0 01             	add    eax,0x1
  402330:	84 d2                	test   dl,dl
  402332:	75 ec                	jne    402320 <_glob_in_set+0x1c0>
  402334:	e9 07 ff ff ff       	jmp    402240 <_glob_in_set+0xe0>
  402339:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402340:	85 c9                	test   ecx,ecx
  402342:	75 0c                	jne    402350 <_glob_in_set+0x1f0>
  402344:	0f b6 50 01          	movzx  edx,BYTE PTR [eax+0x1]
  402348:	83 c0 01             	add    eax,0x1
  40234b:	eb e0                	jmp    40232d <_glob_in_set+0x1cd>
  40234d:	8d 76 00             	lea    esi,[esi+0x0]
  402350:	83 c0 01             	add    eax,0x1
  402353:	eb cb                	jmp    402320 <_glob_in_set+0x1c0>
  402355:	83 c4 04             	add    esp,0x4
  402358:	83 c0 01             	add    eax,0x1
  40235b:	5b                   	pop    ebx
  40235c:	5e                   	pop    esi
  40235d:	5f                   	pop    edi
  40235e:	5d                   	pop    ebp
  40235f:	c3                   	ret    
  402360:	83 c0 01             	add    eax,0x1
  402363:	e9 1f ff ff ff       	jmp    402287 <_glob_in_set+0x127>
  402368:	89 f8                	mov    eax,edi
  40236a:	e9 93 fe ff ff       	jmp    402202 <_glob_in_set+0xa2>
  40236f:	90                   	nop

00402370 <_glob_initialise>:
  402370:	55                   	push   ebp
  402371:	57                   	push   edi
  402372:	56                   	push   esi
  402373:	89 c6                	mov    esi,eax
  402375:	53                   	push   ebx
  402376:	83 ec 1c             	sub    esp,0x1c
  402379:	85 c0                	test   eax,eax
  40237b:	74 47                	je     4023c4 <_glob_initialise+0x54>
  40237d:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  402380:	8d 78 01             	lea    edi,[eax+0x1]
  402383:	8d 2c bd 00 00 00 00 	lea    ebp,[edi*4+0x0]
  40238a:	89 2c 24             	mov    DWORD PTR [esp],ebp
  40238d:	e8 8e 5d 00 00       	call   408120 <_malloc>
  402392:	89 c3                	mov    ebx,eax
  402394:	85 db                	test   ebx,ebx
  402396:	89 46 08             	mov    DWORD PTR [esi+0x8],eax
  402399:	b8 03 00 00 00       	mov    eax,0x3
  40239e:	74 26                	je     4023c6 <_glob_initialise+0x56>
  4023a0:	85 ff                	test   edi,edi
  4023a2:	89 fa                	mov    edx,edi
  4023a4:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
  4023ab:	7e 17                	jle    4023c4 <_glob_initialise+0x54>
  4023ad:	8d 4d fc             	lea    ecx,[ebp-0x4]
  4023b0:	eb 03                	jmp    4023b5 <_glob_initialise+0x45>
  4023b2:	8b 5e 08             	mov    ebx,DWORD PTR [esi+0x8]
  4023b5:	c7 04 0b 00 00 00 00 	mov    DWORD PTR [ebx+ecx*1],0x0
  4023bc:	83 e9 04             	sub    ecx,0x4
  4023bf:	83 ea 01             	sub    edx,0x1
  4023c2:	75 ee                	jne    4023b2 <_glob_initialise+0x42>
  4023c4:	31 c0                	xor    eax,eax
  4023c6:	83 c4 1c             	add    esp,0x1c
  4023c9:	5b                   	pop    ebx
  4023ca:	5e                   	pop    esi
  4023cb:	5f                   	pop    edi
  4023cc:	5d                   	pop    ebp
  4023cd:	c3                   	ret    
  4023ce:	66 90                	xchg   ax,ax

004023d0 <_glob_strcmp>:
  4023d0:	55                   	push   ebp
  4023d1:	57                   	push   edi
  4023d2:	89 c7                	mov    edi,eax
  4023d4:	56                   	push   esi
  4023d5:	53                   	push   ebx
  4023d6:	83 ec 2c             	sub    esp,0x2c
  4023d9:	80 3a 2e             	cmp    BYTE PTR [edx],0x2e
  4023dc:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  4023e0:	0f 84 5a 01 00 00    	je     402540 <_glob_strcmp+0x170>
  4023e6:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
  4023e9:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
  4023ed:	8d 6a 01             	lea    ebp,[edx+0x1]
  4023f0:	89 f0                	mov    eax,esi
  4023f2:	83 e0 20             	and    eax,0x20
  4023f5:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  4023f9:	89 f0                	mov    eax,esi
  4023fb:	25 00 40 00 00       	and    eax,0x4000
  402400:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  402404:	0f be d1             	movsx  edx,cl
  402407:	85 d2                	test   edx,edx
  402409:	8d 75 ff             	lea    esi,[ebp-0x1]
  40240c:	8d 47 01             	lea    eax,[edi+0x1]
  40240f:	0f 84 70 01 00 00    	je     402585 <_glob_strcmp+0x1b5>
  402415:	80 f9 3f             	cmp    cl,0x3f
  402418:	0f 84 e4 00 00 00    	je     402502 <_glob_strcmp+0x132>
  40241e:	80 f9 5b             	cmp    cl,0x5b
  402421:	0f 84 ab 00 00 00    	je     4024d2 <_glob_strcmp+0x102>
  402427:	80 f9 2a             	cmp    cl,0x2a
  40242a:	74 5c                	je     402488 <_glob_strcmp+0xb8>
  40242c:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
  402430:	85 c9                	test   ecx,ecx
  402432:	0f 84 d8 00 00 00    	je     402510 <_glob_strcmp+0x140>
  402438:	89 c7                	mov    edi,eax
  40243a:	0f be 5d ff          	movsx  ebx,BYTE PTR [ebp-0x1]
  40243e:	84 db                	test   bl,bl
  402440:	0f 84 92 01 00 00    	je     4025d8 <_glob_strcmp+0x208>
  402446:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  40244a:	85 c0                	test   eax,eax
  40244c:	0f 85 de 00 00 00    	jne    402530 <_glob_strcmp+0x160>
  402452:	89 14 24             	mov    DWORD PTR [esp],edx
  402455:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  402459:	e8 ca 5c 00 00       	call   408128 <_tolower>
  40245e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  402461:	89 c6                	mov    esi,eax
  402463:	e8 c0 5c 00 00       	call   408128 <_tolower>
  402468:	8b 54 24 1c          	mov    edx,DWORD PTR [esp+0x1c]
  40246c:	29 c6                	sub    esi,eax
  40246e:	85 f6                	test   esi,esi
  402470:	0f 84 81 00 00 00    	je     4024f7 <_glob_strcmp+0x127>
  402476:	89 d0                	mov    eax,edx
  402478:	29 d8                	sub    eax,ebx
  40247a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402480:	83 c4 2c             	add    esp,0x2c
  402483:	5b                   	pop    ebx
  402484:	5e                   	pop    esi
  402485:	5f                   	pop    edi
  402486:	5d                   	pop    ebp
  402487:	c3                   	ret    
  402488:	0f b6 57 01          	movzx  edx,BYTE PTR [edi+0x1]
  40248c:	89 c3                	mov    ebx,eax
  40248e:	80 fa 2a             	cmp    dl,0x2a
  402491:	75 0b                	jne    40249e <_glob_strcmp+0xce>
  402493:	83 c3 01             	add    ebx,0x1
  402496:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
  402499:	80 fa 2a             	cmp    dl,0x2a
  40249c:	74 f5                	je     402493 <_glob_strcmp+0xc3>
  40249e:	31 c0                	xor    eax,eax
  4024a0:	84 d2                	test   dl,dl
  4024a2:	74 dc                	je     402480 <_glob_strcmp+0xb0>
  4024a4:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
  4024a8:	81 cf 00 00 01 00    	or     edi,0x10000
  4024ae:	eb 09                	jmp    4024b9 <_glob_strcmp+0xe9>
  4024b0:	83 c6 01             	add    esi,0x1
  4024b3:	80 7e ff 00          	cmp    BYTE PTR [esi-0x1],0x0
  4024b7:	74 c7                	je     402480 <_glob_strcmp+0xb0>
  4024b9:	89 f9                	mov    ecx,edi
  4024bb:	89 f2                	mov    edx,esi
  4024bd:	89 d8                	mov    eax,ebx
  4024bf:	e8 0c ff ff ff       	call   4023d0 <_glob_strcmp>
  4024c4:	85 c0                	test   eax,eax
  4024c6:	75 e8                	jne    4024b0 <_glob_strcmp+0xe0>
  4024c8:	83 c4 2c             	add    esp,0x2c
  4024cb:	31 c0                	xor    eax,eax
  4024cd:	5b                   	pop    ebx
  4024ce:	5e                   	pop    esi
  4024cf:	5f                   	pop    edi
  4024d0:	5d                   	pop    ebp
  4024d1:	c3                   	ret    
  4024d2:	0f be 55 ff          	movsx  edx,BYTE PTR [ebp-0x1]
  4024d6:	85 d2                	test   edx,edx
  4024d8:	0f 84 0b 01 00 00    	je     4025e9 <_glob_strcmp+0x219>
  4024de:	80 7f 01 21          	cmp    BYTE PTR [edi+0x1],0x21
  4024e2:	74 7c                	je     402560 <_glob_strcmp+0x190>
  4024e4:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
  4024e8:	e8 73 fc ff ff       	call   402160 <_glob_in_set>
  4024ed:	85 c0                	test   eax,eax
  4024ef:	89 c7                	mov    edi,eax
  4024f1:	0f 84 d7 00 00 00    	je     4025ce <_glob_strcmp+0x1fe>
  4024f7:	0f b6 0f             	movzx  ecx,BYTE PTR [edi]
  4024fa:	83 c5 01             	add    ebp,0x1
  4024fd:	e9 02 ff ff ff       	jmp    402404 <_glob_strcmp+0x34>
  402502:	80 7d ff 00          	cmp    BYTE PTR [ebp-0x1],0x0
  402506:	0f 84 d3 00 00 00    	je     4025df <_glob_strcmp+0x20f>
  40250c:	89 c7                	mov    edi,eax
  40250e:	eb e7                	jmp    4024f7 <_glob_strcmp+0x127>
  402510:	83 fa 7f             	cmp    edx,0x7f
  402513:	0f 85 1f ff ff ff    	jne    402438 <_glob_strcmp+0x68>
  402519:	0f be 57 01          	movsx  edx,BYTE PTR [edi+0x1]
  40251d:	83 c7 02             	add    edi,0x2
  402520:	85 d2                	test   edx,edx
  402522:	0f 85 12 ff ff ff    	jne    40243a <_glob_strcmp+0x6a>
  402528:	e9 0b ff ff ff       	jmp    402438 <_glob_strcmp+0x68>
  40252d:	8d 76 00             	lea    esi,[esi+0x0]
  402530:	89 d6                	mov    esi,edx
  402532:	29 de                	sub    esi,ebx
  402534:	e9 35 ff ff ff       	jmp    40246e <_glob_strcmp+0x9e>
  402539:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402540:	0f be 00             	movsx  eax,BYTE PTR [eax]
  402543:	3c 2e                	cmp    al,0x2e
  402545:	74 32                	je     402579 <_glob_strcmp+0x1a9>
  402547:	89 c1                	mov    ecx,eax
  402549:	83 e8 2e             	sub    eax,0x2e
  40254c:	f7 44 24 10 00 00 01 	test   DWORD PTR [esp+0x10],0x10000
  402553:	00 
  402554:	0f 85 8f fe ff ff    	jne    4023e9 <_glob_strcmp+0x19>
  40255a:	e9 21 ff ff ff       	jmp    402480 <_glob_strcmp+0xb0>
  40255f:	90                   	nop
  402560:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
  402564:	8d 5f 02             	lea    ebx,[edi+0x2]
  402567:	89 d8                	mov    eax,ebx
  402569:	e8 f2 fb ff ff       	call   402160 <_glob_in_set>
  40256e:	85 c0                	test   eax,eax
  402570:	74 1d                	je     40258f <_glob_strcmp+0x1bf>
  402572:	89 df                	mov    edi,ebx
  402574:	e9 7e ff ff ff       	jmp    4024f7 <_glob_strcmp+0x127>
  402579:	b9 2e 00 00 00       	mov    ecx,0x2e
  40257e:	66 90                	xchg   ax,ax
  402580:	e9 64 fe ff ff       	jmp    4023e9 <_glob_strcmp+0x19>
  402585:	0f be 06             	movsx  eax,BYTE PTR [esi]
  402588:	f7 d8                	neg    eax
  40258a:	e9 f1 fe ff ff       	jmp    402480 <_glob_strcmp+0xb0>
  40258f:	0f b6 47 02          	movzx  eax,BYTE PTR [edi+0x2]
  402593:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  402597:	3c 5d                	cmp    al,0x5d
  402599:	75 0f                	jne    4025aa <_glob_strcmp+0x1da>
  40259b:	eb 56                	jmp    4025f3 <_glob_strcmp+0x223>
  40259d:	8d 76 00             	lea    esi,[esi+0x0]
  4025a0:	83 c3 01             	add    ebx,0x1
  4025a3:	84 c0                	test   al,al
  4025a5:	74 27                	je     4025ce <_glob_strcmp+0x1fe>
  4025a7:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  4025aa:	3c 5d                	cmp    al,0x5d
  4025ac:	74 16                	je     4025c4 <_glob_strcmp+0x1f4>
  4025ae:	3c 7f                	cmp    al,0x7f
  4025b0:	75 ee                	jne    4025a0 <_glob_strcmp+0x1d0>
  4025b2:	85 d2                	test   edx,edx
  4025b4:	75 09                	jne    4025bf <_glob_strcmp+0x1ef>
  4025b6:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  4025ba:	83 c3 01             	add    ebx,0x1
  4025bd:	eb e1                	jmp    4025a0 <_glob_strcmp+0x1d0>
  4025bf:	83 c3 01             	add    ebx,0x1
  4025c2:	eb e3                	jmp    4025a7 <_glob_strcmp+0x1d7>
  4025c4:	83 c3 01             	add    ebx,0x1
  4025c7:	89 df                	mov    edi,ebx
  4025c9:	e9 29 ff ff ff       	jmp    4024f7 <_glob_strcmp+0x127>
  4025ce:	b8 5d 00 00 00       	mov    eax,0x5d
  4025d3:	e9 a8 fe ff ff       	jmp    402480 <_glob_strcmp+0xb0>
  4025d8:	31 db                	xor    ebx,ebx
  4025da:	e9 97 fe ff ff       	jmp    402476 <_glob_strcmp+0xa6>
  4025df:	b8 3f 00 00 00       	mov    eax,0x3f
  4025e4:	e9 97 fe ff ff       	jmp    402480 <_glob_strcmp+0xb0>
  4025e9:	b8 5b 00 00 00       	mov    eax,0x5b
  4025ee:	e9 8d fe ff ff       	jmp    402480 <_glob_strcmp+0xb0>
  4025f3:	8d 5f 03             	lea    ebx,[edi+0x3]
  4025f6:	0f b6 47 03          	movzx  eax,BYTE PTR [edi+0x3]
  4025fa:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  4025fe:	eb aa                	jmp    4025aa <_glob_strcmp+0x1da>

00402600 <_glob_registry.part.1>:
  402600:	57                   	push   edi
  402601:	89 c7                	mov    edi,eax
  402603:	56                   	push   esi
  402604:	53                   	push   ebx
  402605:	83 ec 10             	sub    esp,0x10
  402608:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40260b:	8b 4f 0c             	mov    ecx,DWORD PTR [edi+0xc]
  40260e:	85 c0                	test   eax,eax
  402610:	8d 70 ff             	lea    esi,[eax-0x1]
  402613:	8d 1c 8d 00 00 00 00 	lea    ebx,[ecx*4+0x0]
  40261a:	7e 1d                	jle    402639 <_glob_registry.part.1+0x39>
  40261c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402620:	8b 57 08             	mov    edx,DWORD PTR [edi+0x8]
  402623:	83 ee 01             	sub    esi,0x1
  402626:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  402629:	83 c3 04             	add    ebx,0x4
  40262c:	89 14 24             	mov    DWORD PTR [esp],edx
  40262f:	e8 e4 5a 00 00       	call   408118 <_free>
  402634:	83 fe ff             	cmp    esi,0xffffffff
  402637:	75 e7                	jne    402620 <_glob_registry.part.1+0x20>
  402639:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  40263c:	89 04 24             	mov    DWORD PTR [esp],eax
  40263f:	e8 d4 5a 00 00       	call   408118 <_free>
  402644:	83 c4 10             	add    esp,0x10
  402647:	31 c0                	xor    eax,eax
  402649:	5b                   	pop    ebx
  40264a:	5e                   	pop    esi
  40264b:	5f                   	pop    edi
  40264c:	c3                   	ret    
  40264d:	8d 76 00             	lea    esi,[esi+0x0]

00402650 <_glob_store_entry.part.2>:
  402650:	57                   	push   edi
  402651:	56                   	push   esi
  402652:	89 c6                	mov    esi,eax
  402654:	53                   	push   ebx
  402655:	89 d3                	mov    ebx,edx
  402657:	83 ec 10             	sub    esp,0x10
  40265a:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
  40265d:	03 53 0c             	add    edx,DWORD PTR [ebx+0xc]
  402660:	8d 04 95 08 00 00 00 	lea    eax,[edx*4+0x8]
  402667:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40266b:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  40266e:	89 04 24             	mov    DWORD PTR [esp],eax
  402671:	e8 ba 5a 00 00       	call   408130 <_realloc>
  402676:	85 c0                	test   eax,eax
  402678:	89 c2                	mov    edx,eax
  40267a:	74 29                	je     4026a5 <_glob_store_entry.part.2+0x55>
  40267c:	8b 7b 04             	mov    edi,DWORD PTR [ebx+0x4]
  40267f:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  402682:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
  402685:	8d 4f 01             	lea    ecx,[edi+0x1]
  402688:	01 c7                	add    edi,eax
  40268a:	01 c8                	add    eax,ecx
  40268c:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  40268f:	89 34 ba             	mov    DWORD PTR [edx+edi*4],esi
  402692:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  402695:	c7 04 82 00 00 00 00 	mov    DWORD PTR [edx+eax*4],0x0
  40269c:	83 c4 10             	add    esp,0x10
  40269f:	31 c0                	xor    eax,eax
  4026a1:	5b                   	pop    ebx
  4026a2:	5e                   	pop    esi
  4026a3:	5f                   	pop    edi
  4026a4:	c3                   	ret    
  4026a5:	83 c4 10             	add    esp,0x10
  4026a8:	b8 01 00 00 00       	mov    eax,0x1
  4026ad:	5b                   	pop    ebx
  4026ae:	5e                   	pop    esi
  4026af:	5f                   	pop    edi
  4026b0:	c3                   	ret    
  4026b1:	eb 0d                	jmp    4026c0 <_glob_store_entry>
  4026b3:	90                   	nop
  4026b4:	90                   	nop
  4026b5:	90                   	nop
  4026b6:	90                   	nop
  4026b7:	90                   	nop
  4026b8:	90                   	nop
  4026b9:	90                   	nop
  4026ba:	90                   	nop
  4026bb:	90                   	nop
  4026bc:	90                   	nop
  4026bd:	90                   	nop
  4026be:	90                   	nop
  4026bf:	90                   	nop

004026c0 <_glob_store_entry>:
  4026c0:	85 c0                	test   eax,eax
  4026c2:	75 0c                	jne    4026d0 <_glob_store_entry+0x10>
  4026c4:	b8 01 00 00 00       	mov    eax,0x1
  4026c9:	c3                   	ret    
  4026ca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4026d0:	85 d2                	test   edx,edx
  4026d2:	74 f0                	je     4026c4 <_glob_store_entry+0x4>
  4026d4:	e9 77 ff ff ff       	jmp    402650 <_glob_store_entry.part.2>
  4026d9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

004026e0 <_glob_store_collated_entries>:
  4026e0:	56                   	push   esi
  4026e1:	89 d6                	mov    esi,edx
  4026e3:	53                   	push   ebx
  4026e4:	89 c3                	mov    ebx,eax
  4026e6:	83 ec 14             	sub    esp,0x14
  4026e9:	8b 00                	mov    eax,DWORD PTR [eax]
  4026eb:	85 c0                	test   eax,eax
  4026ed:	74 05                	je     4026f4 <_glob_store_collated_entries+0x14>
  4026ef:	e8 ec ff ff ff       	call   4026e0 <_glob_store_collated_entries>
  4026f4:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4026f7:	89 f2                	mov    edx,esi
  4026f9:	e8 c2 ff ff ff       	call   4026c0 <_glob_store_entry>
  4026fe:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  402701:	85 c0                	test   eax,eax
  402703:	74 07                	je     40270c <_glob_store_collated_entries+0x2c>
  402705:	89 f2                	mov    edx,esi
  402707:	e8 d4 ff ff ff       	call   4026e0 <_glob_store_collated_entries>
  40270c:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40270f:	e8 04 5a 00 00       	call   408118 <_free>
  402714:	83 c4 14             	add    esp,0x14
  402717:	5b                   	pop    ebx
  402718:	5e                   	pop    esi
  402719:	c3                   	ret    
  40271a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

00402720 <_glob_match>:
  402720:	55                   	push   ebp
  402721:	89 e5                	mov    ebp,esp
  402723:	57                   	push   edi
  402724:	56                   	push   esi
  402725:	53                   	push   ebx
  402726:	89 c3                	mov    ebx,eax
  402728:	83 ec 6c             	sub    esp,0x6c
  40272b:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
  40272e:	89 4d a4             	mov    DWORD PTR [ebp-0x5c],ecx
  402731:	89 04 24             	mov    DWORD PTR [esp],eax
  402734:	e8 a7 59 00 00       	call   4080e0 <_strlen>
  402739:	8d 50 01             	lea    edx,[eax+0x1]
  40273c:	83 c0 10             	add    eax,0x10
  40273f:	83 e0 f0             	and    eax,0xfffffff0
  402742:	e8 59 f9 ff ff       	call   4020a0 <___chkstk_ms>
  402747:	29 c4                	sub    esp,eax
  402749:	8d 44 24 0c          	lea    eax,[esp+0xc]
  40274d:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  402751:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  402755:	89 04 24             	mov    DWORD PTR [esp],eax
  402758:	e8 ab 59 00 00       	call   408108 <_memcpy>
  40275d:	89 04 24             	mov    DWORD PTR [esp],eax
  402760:	e8 4b 06 00 00       	call   402db0 <___mingw_dirname>
  402765:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  40276c:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  40276f:	8d 45 d8             	lea    eax,[ebp-0x28]
  402772:	e8 f9 fb ff ff       	call   402370 <_glob_initialise>
  402777:	85 c0                	test   eax,eax
  402779:	74 08                	je     402783 <_glob_match+0x63>
  40277b:	8d 65 f4             	lea    esp,[ebp-0xc]
  40277e:	5b                   	pop    ebx
  40277f:	5e                   	pop    esi
  402780:	5f                   	pop    edi
  402781:	5d                   	pop    ebp
  402782:	c3                   	ret    
  402783:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  402786:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402789:	e8 42 f9 ff ff       	call   4020d0 <_is_glob_pattern>
  40278e:	85 c0                	test   eax,eax
  402790:	0f 84 5a 02 00 00    	je     4029f0 <_glob_match+0x2d0>
  402796:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  402799:	8d 45 d8             	lea    eax,[ebp-0x28]
  40279c:	89 04 24             	mov    DWORD PTR [esp],eax
  40279f:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  4027a2:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  4027a5:	80 ce 80             	or     dh,0x80
  4027a8:	e8 73 ff ff ff       	call   402720 <_glob_match>
  4027ad:	85 c0                	test   eax,eax
  4027af:	75 ca                	jne    40277b <_glob_match+0x5b>
  4027b1:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  4027b5:	3c 5c                	cmp    al,0x5c
  4027b7:	0f 84 5b 03 00 00    	je     402b18 <_glob_match+0x3f8>
  4027bd:	3c 2f                	cmp    al,0x2f
  4027bf:	0f 84 53 03 00 00    	je     402b18 <_glob_match+0x3f8>
  4027c5:	8b 75 b8             	mov    esi,DWORD PTR [ebp-0x48]
  4027c8:	bf 30 a1 40 00       	mov    edi,0x40a130
  4027cd:	b9 02 00 00 00       	mov    ecx,0x2
  4027d2:	f3 a6                	repz cmps BYTE PTR ds:[esi],BYTE PTR es:[edi]
  4027d4:	0f 85 3e 03 00 00    	jne    402b18 <_glob_match+0x3f8>
  4027da:	c6 45 a3 5c          	mov    BYTE PTR [ebp-0x5d],0x5c
  4027de:	f6 45 cc 10          	test   BYTE PTR [ebp-0x34],0x10
  4027e2:	89 5d c0             	mov    DWORD PTR [ebp-0x40],ebx
  4027e5:	c7 45 b8 00 00 00 00 	mov    DWORD PTR [ebp-0x48],0x0
  4027ec:	0f 85 33 04 00 00    	jne    402c25 <_glob_match+0x505>
  4027f2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4027f5:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  4027f8:	8b 00                	mov    eax,DWORD PTR [eax]
  4027fa:	85 c0                	test   eax,eax
  4027fc:	0f 84 71 04 00 00    	je     402c73 <_glob_match+0x553>
  402802:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  402805:	c7 45 c4 02 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x2
  40280c:	89 cf                	mov    edi,ecx
  40280e:	83 e7 04             	and    edi,0x4
  402811:	89 7d 98             	mov    DWORD PTR [ebp-0x68],edi
  402814:	89 cf                	mov    edi,ecx
  402816:	81 e7 00 80 00 00    	and    edi,0x8000
  40281c:	89 7d d0             	mov    DWORD PTR [ebp-0x30],edi
  40281f:	90                   	nop
  402820:	83 7d c4 01          	cmp    DWORD PTR [ebp-0x3c],0x1
  402824:	0f 84 58 02 00 00    	je     402a82 <_glob_match+0x362>
  40282a:	89 04 24             	mov    DWORD PTR [esp],eax
  40282d:	e8 ee 0a 00 00       	call   403320 <___mingw_opendir>
  402832:	85 c0                	test   eax,eax
  402834:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  402837:	0f 84 76 03 00 00    	je     402bb3 <_glob_match+0x493>
  40283d:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402840:	85 c0                	test   eax,eax
  402842:	0f 84 bd 03 00 00    	je     402c05 <_glob_match+0x4e5>
  402848:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  40284b:	8b 00                	mov    eax,DWORD PTR [eax]
  40284d:	89 04 24             	mov    DWORD PTR [esp],eax
  402850:	e8 8b 58 00 00       	call   4080e0 <_strlen>
  402855:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  402858:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  40285b:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
  402862:	83 e0 40             	and    eax,0x40
  402865:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  402868:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  40286b:	89 04 24             	mov    DWORD PTR [esp],eax
  40286e:	e8 4d 0c 00 00       	call   4034c0 <___mingw_readdir>
  402873:	85 c0                	test   eax,eax
  402875:	89 c6                	mov    esi,eax
  402877:	0f 84 e8 01 00 00    	je     402a65 <_glob_match+0x345>
  40287d:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  402880:	85 c0                	test   eax,eax
  402882:	74 06                	je     40288a <_glob_match+0x16a>
  402884:	83 7e 08 10          	cmp    DWORD PTR [esi+0x8],0x10
  402888:	75 de                	jne    402868 <_glob_match+0x148>
  40288a:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  40288d:	8d 5e 0c             	lea    ebx,[esi+0xc]
  402890:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  402893:	89 da                	mov    edx,ebx
  402895:	e8 36 fb ff ff       	call   4023d0 <_glob_strcmp>
  40289a:	85 c0                	test   eax,eax
  40289c:	75 ca                	jne    402868 <_glob_match+0x148>
  40289e:	0f b7 56 06          	movzx  edx,WORD PTR [esi+0x6]
  4028a2:	8b 4d b4             	mov    ecx,DWORD PTR [ebp-0x4c]
  4028a5:	89 65 b0             	mov    DWORD PTR [ebp-0x50],esp
  4028a8:	8d 44 11 11          	lea    eax,[ecx+edx*1+0x11]
  4028ac:	83 e0 f0             	and    eax,0xfffffff0
  4028af:	e8 ec f7 ff ff       	call   4020a0 <___chkstk_ms>
  4028b4:	29 c4                	sub    esp,eax
  4028b6:	31 c0                	xor    eax,eax
  4028b8:	8d 7c 24 0c          	lea    edi,[esp+0xc]
  4028bc:	85 c9                	test   ecx,ecx
  4028be:	89 7d ac             	mov    DWORD PTR [ebp-0x54],edi
  4028c1:	0f 85 ed 01 00 00    	jne    402ab4 <_glob_match+0x394>
  4028c7:	83 c2 01             	add    edx,0x1
  4028ca:	01 f8                	add    eax,edi
  4028cc:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  4028d0:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  4028d4:	89 e3                	mov    ebx,esp
  4028d6:	89 04 24             	mov    DWORD PTR [esp],eax
  4028d9:	e8 2a 58 00 00       	call   408108 <_memcpy>
  4028de:	89 3c 24             	mov    DWORD PTR [esp],edi
  4028e1:	e8 fa 57 00 00       	call   4080e0 <_strlen>
  4028e6:	83 c0 10             	add    eax,0x10
  4028e9:	83 e0 f0             	and    eax,0xfffffff0
  4028ec:	e8 af f7 ff ff       	call   4020a0 <___chkstk_ms>
  4028f1:	8b 75 ac             	mov    esi,DWORD PTR [ebp-0x54]
  4028f4:	29 c4                	sub    esp,eax
  4028f6:	8d 4c 24 0c          	lea    ecx,[esp+0xc]
  4028fa:	89 ca                	mov    edx,ecx
  4028fc:	eb 0f                	jmp    40290d <_glob_match+0x1ed>
  4028fe:	66 90                	xchg   ax,ax
  402900:	83 c2 01             	add    edx,0x1
  402903:	83 c6 01             	add    esi,0x1
  402906:	84 c0                	test   al,al
  402908:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  40290b:	74 1b                	je     402928 <_glob_match+0x208>
  40290d:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  402910:	3c 7f                	cmp    al,0x7f
  402912:	75 ec                	jne    402900 <_glob_match+0x1e0>
  402914:	0f b6 46 01          	movzx  eax,BYTE PTR [esi+0x1]
  402918:	83 c6 01             	add    esi,0x1
  40291b:	83 c2 01             	add    edx,0x1
  40291e:	83 c6 01             	add    esi,0x1
  402921:	84 c0                	test   al,al
  402923:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  402926:	75 e5                	jne    40290d <_glob_match+0x1ed>
  402928:	89 0c 24             	mov    DWORD PTR [esp],ecx
  40292b:	e8 70 5b 00 00       	call   4084a0 <_strdup>
  402930:	89 dc                	mov    esp,ebx
  402932:	85 c0                	test   eax,eax
  402934:	89 c6                	mov    esi,eax
  402936:	0f 84 c6 01 00 00    	je     402b02 <_glob_match+0x3e2>
  40293c:	31 c0                	xor    eax,eax
  40293e:	83 7d c4 02          	cmp    DWORD PTR [ebp-0x3c],0x2
  402942:	0f 94 c0             	sete   al
  402945:	83 e8 01             	sub    eax,0x1
  402948:	21 45 c4             	and    DWORD PTR [ebp-0x3c],eax
  40294b:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  40294e:	85 c0                	test   eax,eax
  402950:	0f 85 9d 01 00 00    	jne    402af3 <_glob_match+0x3d3>
  402956:	8b 5d bc             	mov    ebx,DWORD PTR [ebp-0x44]
  402959:	85 db                	test   ebx,ebx
  40295b:	0f 84 bb 02 00 00    	je     402c1c <_glob_match+0x4fc>
  402961:	8b 7d cc             	mov    edi,DWORD PTR [ebp-0x34]
  402964:	81 e7 00 40 00 00    	and    edi,0x4000
  40296a:	eb 18                	jmp    402984 <_glob_match+0x264>
  40296c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402970:	e8 c3 57 00 00       	call   408138 <_strcoll>
  402975:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  402977:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
  40297a:	85 c0                	test   eax,eax
  40297c:	7e 22                	jle    4029a0 <_glob_match+0x280>
  40297e:	85 d2                	test   edx,edx
  402980:	74 24                	je     4029a6 <_glob_match+0x286>
  402982:	89 d3                	mov    ebx,edx
  402984:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  402987:	85 ff                	test   edi,edi
  402989:	89 34 24             	mov    DWORD PTR [esp],esi
  40298c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  402990:	75 de                	jne    402970 <_glob_match+0x250>
  402992:	e8 11 5b 00 00       	call   4084a8 <_stricoll>
  402997:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  402999:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
  40299c:	85 c0                	test   eax,eax
  40299e:	7f de                	jg     40297e <_glob_match+0x25e>
  4029a0:	89 ca                	mov    edx,ecx
  4029a2:	85 d2                	test   edx,edx
  4029a4:	75 dc                	jne    402982 <_glob_match+0x262>
  4029a6:	89 c1                	mov    ecx,eax
  4029a8:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  4029ab:	c7 04 24 0c 00 00 00 	mov    DWORD PTR [esp],0xc
  4029b2:	e8 69 57 00 00       	call   408120 <_malloc>
  4029b7:	85 c0                	test   eax,eax
  4029b9:	74 22                	je     4029dd <_glob_match+0x2bd>
  4029bb:	85 db                	test   ebx,ebx
  4029bd:	89 70 08             	mov    DWORD PTR [eax+0x8],esi
  4029c0:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
  4029c7:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  4029cd:	74 0e                	je     4029dd <_glob_match+0x2bd>
  4029cf:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  4029d2:	85 c9                	test   ecx,ecx
  4029d4:	0f 8e 16 02 00 00    	jle    402bf0 <_glob_match+0x4d0>
  4029da:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
  4029dd:	8b 7d bc             	mov    edi,DWORD PTR [ebp-0x44]
  4029e0:	85 ff                	test   edi,edi
  4029e2:	0f 84 15 02 00 00    	je     402bfd <_glob_match+0x4dd>
  4029e8:	8b 65 b0             	mov    esp,DWORD PTR [ebp-0x50]
  4029eb:	e9 78 fe ff ff       	jmp    402868 <_glob_match+0x148>
  4029f0:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  4029f3:	89 e6                	mov    esi,esp
  4029f5:	89 04 24             	mov    DWORD PTR [esp],eax
  4029f8:	e8 e3 56 00 00       	call   4080e0 <_strlen>
  4029fd:	83 c0 10             	add    eax,0x10
  402a00:	83 e0 f0             	and    eax,0xfffffff0
  402a03:	e8 98 f6 ff ff       	call   4020a0 <___chkstk_ms>
  402a08:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
  402a0b:	29 c4                	sub    esp,eax
  402a0d:	8d 7c 24 0c          	lea    edi,[esp+0xc]
  402a11:	89 f9                	mov    ecx,edi
  402a13:	eb 0d                	jmp    402a22 <_glob_match+0x302>
  402a15:	83 c1 01             	add    ecx,0x1
  402a18:	83 c2 01             	add    edx,0x1
  402a1b:	84 c0                	test   al,al
  402a1d:	88 41 ff             	mov    BYTE PTR [ecx-0x1],al
  402a20:	74 1b                	je     402a3d <_glob_match+0x31d>
  402a22:	0f b6 02             	movzx  eax,BYTE PTR [edx]
  402a25:	3c 7f                	cmp    al,0x7f
  402a27:	75 ec                	jne    402a15 <_glob_match+0x2f5>
  402a29:	0f b6 42 01          	movzx  eax,BYTE PTR [edx+0x1]
  402a2d:	83 c2 01             	add    edx,0x1
  402a30:	83 c1 01             	add    ecx,0x1
  402a33:	83 c2 01             	add    edx,0x1
  402a36:	84 c0                	test   al,al
  402a38:	88 41 ff             	mov    BYTE PTR [ecx-0x1],al
  402a3b:	75 e5                	jne    402a22 <_glob_match+0x302>
  402a3d:	89 3c 24             	mov    DWORD PTR [esp],edi
  402a40:	e8 5b 5a 00 00       	call   4084a0 <_strdup>
  402a45:	89 f4                	mov    esp,esi
  402a47:	89 c1                	mov    ecx,eax
  402a49:	b8 01 00 00 00       	mov    eax,0x1
  402a4e:	85 c9                	test   ecx,ecx
  402a50:	0f 84 25 fd ff ff    	je     40277b <_glob_match+0x5b>
  402a56:	8d 55 d8             	lea    edx,[ebp-0x28]
  402a59:	89 c8                	mov    eax,ecx
  402a5b:	e8 f0 fb ff ff       	call   402650 <_glob_store_entry.part.2>
  402a60:	e9 48 fd ff ff       	jmp    4027ad <_glob_match+0x8d>
  402a65:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  402a68:	89 04 24             	mov    DWORD PTR [esp],eax
  402a6b:	e8 a0 0a 00 00       	call   403510 <___mingw_closedir>
  402a70:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
  402a73:	85 f6                	test   esi,esi
  402a75:	74 0b                	je     402a82 <_glob_match+0x362>
  402a77:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402a7a:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  402a7d:	e8 5e fc ff ff       	call   4026e0 <_glob_store_collated_entries>
  402a82:	83 45 c8 04          	add    DWORD PTR [ebp-0x38],0x4
  402a86:	8b 7d c8             	mov    edi,DWORD PTR [ebp-0x38]
  402a89:	8b 47 fc             	mov    eax,DWORD PTR [edi-0x4]
  402a8c:	89 04 24             	mov    DWORD PTR [esp],eax
  402a8f:	e8 84 56 00 00       	call   408118 <_free>
  402a94:	8b 07                	mov    eax,DWORD PTR [edi]
  402a96:	85 c0                	test   eax,eax
  402a98:	0f 85 82 fd ff ff    	jne    402820 <_glob_match+0x100>
  402a9e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402aa1:	89 04 24             	mov    DWORD PTR [esp],eax
  402aa4:	e8 6f 56 00 00       	call   408118 <_free>
  402aa9:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
  402aac:	8d 65 f4             	lea    esp,[ebp-0xc]
  402aaf:	5b                   	pop    ebx
  402ab0:	5e                   	pop    esi
  402ab1:	5f                   	pop    edi
  402ab2:	5d                   	pop    ebp
  402ab3:	c3                   	ret    
  402ab4:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  402ab7:	8b 75 b4             	mov    esi,DWORD PTR [ebp-0x4c]
  402aba:	89 55 9c             	mov    DWORD PTR [ebp-0x64],edx
  402abd:	8b 00                	mov    eax,DWORD PTR [eax]
  402abf:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  402ac3:	89 3c 24             	mov    DWORD PTR [esp],edi
  402ac6:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  402aca:	e8 39 56 00 00       	call   408108 <_memcpy>
  402acf:	0f b6 44 34 0b       	movzx  eax,BYTE PTR [esp+esi*1+0xb]
  402ad4:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  402ad7:	3c 5c                	cmp    al,0x5c
  402ad9:	74 35                	je     402b10 <_glob_match+0x3f0>
  402adb:	3c 2f                	cmp    al,0x2f
  402add:	74 31                	je     402b10 <_glob_match+0x3f0>
  402adf:	8b 75 b4             	mov    esi,DWORD PTR [ebp-0x4c]
  402ae2:	0f b6 4d a3          	movzx  ecx,BYTE PTR [ebp-0x5d]
  402ae6:	89 f0                	mov    eax,esi
  402ae8:	83 c0 01             	add    eax,0x1
  402aeb:	88 0c 37             	mov    BYTE PTR [edi+esi*1],cl
  402aee:	e9 d4 fd ff ff       	jmp    4028c7 <_glob_match+0x1a7>
  402af3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402af6:	89 f0                	mov    eax,esi
  402af8:	e8 c3 fb ff ff       	call   4026c0 <_glob_store_entry>
  402afd:	e9 e6 fe ff ff       	jmp    4029e8 <_glob_match+0x2c8>
  402b02:	c7 45 c4 03 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x3
  402b09:	e9 da fe ff ff       	jmp    4029e8 <_glob_match+0x2c8>
  402b0e:	66 90                	xchg   ax,ax
  402b10:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  402b13:	e9 af fd ff ff       	jmp    4028c7 <_glob_match+0x1a7>
  402b18:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402b1b:	89 04 24             	mov    DWORD PTR [esp],eax
  402b1e:	e8 bd 55 00 00       	call   4080e0 <_strlen>
  402b23:	01 d8                	add    eax,ebx
  402b25:	39 c3                	cmp    ebx,eax
  402b27:	0f 83 94 01 00 00    	jae    402cc1 <_glob_match+0x5a1>
  402b2d:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  402b30:	80 fa 2f             	cmp    dl,0x2f
  402b33:	0f 84 7d 01 00 00    	je     402cb6 <_glob_match+0x596>
  402b39:	80 fa 5c             	cmp    dl,0x5c
  402b3c:	75 1d                	jne    402b5b <_glob_match+0x43b>
  402b3e:	66 90                	xchg   ax,ax
  402b40:	e9 71 01 00 00       	jmp    402cb6 <_glob_match+0x596>
  402b45:	0f b6 40 ff          	movzx  eax,BYTE PTR [eax-0x1]
  402b49:	3c 5c                	cmp    al,0x5c
  402b4b:	0f 84 c0 00 00 00    	je     402c11 <_glob_match+0x4f1>
  402b51:	3c 2f                	cmp    al,0x2f
  402b53:	0f 84 b8 00 00 00    	je     402c11 <_glob_match+0x4f1>
  402b59:	89 d0                	mov    eax,edx
  402b5b:	8d 50 ff             	lea    edx,[eax-0x1]
  402b5e:	39 da                	cmp    edx,ebx
  402b60:	75 e3                	jne    402b45 <_glob_match+0x425>
  402b62:	0f b6 40 ff          	movzx  eax,BYTE PTR [eax-0x1]
  402b66:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
  402b69:	88 45 a3             	mov    BYTE PTR [ebp-0x5d],al
  402b6c:	80 7d a3 5c          	cmp    BYTE PTR [ebp-0x5d],0x5c
  402b70:	0f 85 0c 01 00 00    	jne    402c82 <_glob_match+0x562>
  402b76:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  402b79:	0f b6 4d a3          	movzx  ecx,BYTE PTR [ebp-0x5d]
  402b7d:	83 c0 01             	add    eax,0x1
  402b80:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  402b83:	80 fa 5c             	cmp    dl,0x5c
  402b86:	75 0d                	jne    402b95 <_glob_match+0x475>
  402b88:	83 c0 01             	add    eax,0x1
  402b8b:	89 d1                	mov    ecx,edx
  402b8d:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  402b90:	80 fa 5c             	cmp    dl,0x5c
  402b93:	74 f3                	je     402b88 <_glob_match+0x468>
  402b95:	80 fa 2f             	cmp    dl,0x2f
  402b98:	74 ee                	je     402b88 <_glob_match+0x468>
  402b9a:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  402b9d:	88 4d a3             	mov    BYTE PTR [ebp-0x5d],cl
  402ba0:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402ba3:	85 c0                	test   eax,eax
  402ba5:	0f 85 47 fc ff ff    	jne    4027f2 <_glob_match+0xd2>
  402bab:	8b 5d c0             	mov    ebx,DWORD PTR [ebp-0x40]
  402bae:	e9 2b fc ff ff       	jmp    4027de <_glob_match+0xbe>
  402bb3:	8b 5d 98             	mov    ebx,DWORD PTR [ebp-0x68]
  402bb6:	85 db                	test   ebx,ebx
  402bb8:	75 28                	jne    402be2 <_glob_match+0x4c2>
  402bba:	8b 7d a4             	mov    edi,DWORD PTR [ebp-0x5c]
  402bbd:	85 ff                	test   edi,edi
  402bbf:	0f 84 bd fe ff ff    	je     402a82 <_glob_match+0x362>
  402bc5:	e8 76 55 00 00       	call   408140 <__errno>
  402bca:	8b 00                	mov    eax,DWORD PTR [eax]
  402bcc:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  402bd0:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  402bd3:	8b 00                	mov    eax,DWORD PTR [eax]
  402bd5:	89 04 24             	mov    DWORD PTR [esp],eax
  402bd8:	ff d7                	call   edi
  402bda:	85 c0                	test   eax,eax
  402bdc:	0f 84 a0 fe ff ff    	je     402a82 <_glob_match+0x362>
  402be2:	c7 45 c4 01 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x1
  402be9:	e9 94 fe ff ff       	jmp    402a82 <_glob_match+0x362>
  402bee:	66 90                	xchg   ax,ax
  402bf0:	8b 7d bc             	mov    edi,DWORD PTR [ebp-0x44]
  402bf3:	89 03                	mov    DWORD PTR [ebx],eax
  402bf5:	85 ff                	test   edi,edi
  402bf7:	0f 85 eb fd ff ff    	jne    4029e8 <_glob_match+0x2c8>
  402bfd:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  402c00:	e9 e3 fd ff ff       	jmp    4029e8 <_glob_match+0x2c8>
  402c05:	c7 45 b4 00 00 00 00 	mov    DWORD PTR [ebp-0x4c],0x0
  402c0c:	e9 47 fc ff ff       	jmp    402858 <_glob_match+0x138>
  402c11:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
  402c14:	88 45 a3             	mov    BYTE PTR [ebp-0x5d],al
  402c17:	e9 50 ff ff ff       	jmp    402b6c <_glob_match+0x44c>
  402c1c:	31 db                	xor    ebx,ebx
  402c1e:	31 c9                	xor    ecx,ecx
  402c20:	e9 83 fd ff ff       	jmp    4029a8 <_glob_match+0x288>
  402c25:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  402c28:	89 d8                	mov    eax,ebx
  402c2a:	e8 a1 f4 ff ff       	call   4020d0 <_is_glob_pattern>
  402c2f:	85 c0                	test   eax,eax
  402c31:	0f 85 bb fb ff ff    	jne    4027f2 <_glob_match+0xd2>
  402c37:	89 1c 24             	mov    DWORD PTR [esp],ebx
  402c3a:	89 e6                	mov    esi,esp
  402c3c:	e8 9f 54 00 00       	call   4080e0 <_strlen>
  402c41:	83 c0 10             	add    eax,0x10
  402c44:	83 e0 f0             	and    eax,0xfffffff0
  402c47:	e8 54 f4 ff ff       	call   4020a0 <___chkstk_ms>
  402c4c:	29 c4                	sub    esp,eax
  402c4e:	8d 4c 24 0c          	lea    ecx,[esp+0xc]
  402c52:	89 ca                	mov    edx,ecx
  402c54:	eb 0d                	jmp    402c63 <_glob_match+0x543>
  402c56:	83 c2 01             	add    edx,0x1
  402c59:	83 c3 01             	add    ebx,0x1
  402c5c:	84 c0                	test   al,al
  402c5e:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  402c61:	74 32                	je     402c95 <_glob_match+0x575>
  402c63:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  402c66:	3c 7f                	cmp    al,0x7f
  402c68:	75 ec                	jne    402c56 <_glob_match+0x536>
  402c6a:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  402c6e:	83 c3 01             	add    ebx,0x1
  402c71:	eb e3                	jmp    402c56 <_glob_match+0x536>
  402c73:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  402c76:	c7 45 c4 02 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x2
  402c7d:	e9 1f fe ff ff       	jmp    402aa1 <_glob_match+0x381>
  402c82:	80 7d a3 2f          	cmp    BYTE PTR [ebp-0x5d],0x2f
  402c86:	0f 84 ea fe ff ff    	je     402b76 <_glob_match+0x456>
  402c8c:	c6 45 a3 5c          	mov    BYTE PTR [ebp-0x5d],0x5c
  402c90:	e9 0b ff ff ff       	jmp    402ba0 <_glob_match+0x480>
  402c95:	89 0c 24             	mov    DWORD PTR [esp],ecx
  402c98:	e8 03 58 00 00       	call   4084a0 <_strdup>
  402c9d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402ca0:	89 f4                	mov    esp,esi
  402ca2:	e8 19 fa ff ff       	call   4026c0 <_glob_store_entry>
  402ca7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402caa:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x0
  402cb1:	e9 eb fd ff ff       	jmp    402aa1 <_glob_match+0x381>
  402cb6:	88 55 a3             	mov    BYTE PTR [ebp-0x5d],dl
  402cb9:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  402cbc:	e9 ab fe ff ff       	jmp    402b6c <_glob_match+0x44c>
  402cc1:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
  402cc4:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  402cc7:	88 4d a3             	mov    BYTE PTR [ebp-0x5d],cl
  402cca:	e9 9d fe ff ff       	jmp    402b6c <_glob_match+0x44c>
  402ccf:	90                   	nop

00402cd0 <___mingw_glob>:
  402cd0:	55                   	push   ebp
  402cd1:	89 e5                	mov    ebp,esp
  402cd3:	57                   	push   edi
  402cd4:	56                   	push   esi
  402cd5:	53                   	push   ebx
  402cd6:	83 ec 1c             	sub    esp,0x1c
  402cd9:	8b 75 14             	mov    esi,DWORD PTR [ebp+0x14]
  402cdc:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  402cdf:	81 3e 32 a1 40 00    	cmp    DWORD PTR [esi],0x40a132
  402ce5:	74 0d                	je     402cf4 <___mingw_glob+0x24>
  402ce7:	89 f0                	mov    eax,esi
  402ce9:	e8 82 f6 ff ff       	call   402370 <_glob_initialise>
  402cee:	c7 06 32 a1 40 00    	mov    DWORD PTR [esi],0x40a132
  402cf4:	89 34 24             	mov    DWORD PTR [esp],esi
  402cf7:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
  402cfa:	89 d8                	mov    eax,ebx
  402cfc:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  402cff:	e8 1c fa ff ff       	call   402720 <_glob_match>
  402d04:	83 f8 02             	cmp    eax,0x2
  402d07:	89 c7                	mov    edi,eax
  402d09:	74 0a                	je     402d15 <___mingw_glob+0x45>
  402d0b:	8d 65 f4             	lea    esp,[ebp-0xc]
  402d0e:	89 f8                	mov    eax,edi
  402d10:	5b                   	pop    ebx
  402d11:	5e                   	pop    esi
  402d12:	5f                   	pop    edi
  402d13:	5d                   	pop    ebp
  402d14:	c3                   	ret    
  402d15:	f6 45 0c 10          	test   BYTE PTR [ebp+0xc],0x10
  402d19:	74 f0                	je     402d0b <___mingw_glob+0x3b>
  402d1b:	89 65 e4             	mov    DWORD PTR [ebp-0x1c],esp
  402d1e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  402d21:	e8 ba 53 00 00       	call   4080e0 <_strlen>
  402d26:	83 c0 10             	add    eax,0x10
  402d29:	83 e0 f0             	and    eax,0xfffffff0
  402d2c:	e8 6f f3 ff ff       	call   4020a0 <___chkstk_ms>
  402d31:	29 c4                	sub    esp,eax
  402d33:	8d 4c 24 04          	lea    ecx,[esp+0x4]
  402d37:	89 ca                	mov    edx,ecx
  402d39:	eb 12                	jmp    402d4d <___mingw_glob+0x7d>
  402d3b:	90                   	nop
  402d3c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402d40:	83 c2 01             	add    edx,0x1
  402d43:	83 c3 01             	add    ebx,0x1
  402d46:	84 c0                	test   al,al
  402d48:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  402d4b:	74 1b                	je     402d68 <___mingw_glob+0x98>
  402d4d:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  402d50:	3c 7f                	cmp    al,0x7f
  402d52:	75 ec                	jne    402d40 <___mingw_glob+0x70>
  402d54:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  402d58:	83 c3 01             	add    ebx,0x1
  402d5b:	83 c2 01             	add    edx,0x1
  402d5e:	83 c3 01             	add    ebx,0x1
  402d61:	84 c0                	test   al,al
  402d63:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  402d66:	75 e5                	jne    402d4d <___mingw_glob+0x7d>
  402d68:	89 0c 24             	mov    DWORD PTR [esp],ecx
  402d6b:	e8 30 57 00 00       	call   4084a0 <_strdup>
  402d70:	8b 65 e4             	mov    esp,DWORD PTR [ebp-0x1c]
  402d73:	89 f2                	mov    edx,esi
  402d75:	e8 46 f9 ff ff       	call   4026c0 <_glob_store_entry>
  402d7a:	8d 65 f4             	lea    esp,[ebp-0xc]
  402d7d:	89 f8                	mov    eax,edi
  402d7f:	5b                   	pop    ebx
  402d80:	5e                   	pop    esi
  402d81:	5f                   	pop    edi
  402d82:	5d                   	pop    ebp
  402d83:	c3                   	ret    
  402d84:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402d8a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00402d90 <___mingw_globfree>:
  402d90:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  402d94:	81 38 32 a1 40 00    	cmp    DWORD PTR [eax],0x40a132
  402d9a:	74 04                	je     402da0 <___mingw_globfree+0x10>
  402d9c:	f3 c3                	repz ret 
  402d9e:	66 90                	xchg   ax,ax
  402da0:	e9 5b f8 ff ff       	jmp    402600 <_glob_registry.part.1>
  402da5:	90                   	nop
  402da6:	90                   	nop
  402da7:	90                   	nop
  402da8:	90                   	nop
  402da9:	90                   	nop
  402daa:	90                   	nop
  402dab:	90                   	nop
  402dac:	90                   	nop
  402dad:	90                   	nop
  402dae:	90                   	nop
  402daf:	90                   	nop

00402db0 <___mingw_dirname>:
  402db0:	55                   	push   ebp
  402db1:	89 e5                	mov    ebp,esp
  402db3:	57                   	push   edi
  402db4:	56                   	push   esi
  402db5:	53                   	push   ebx
  402db6:	83 ec 3c             	sub    esp,0x3c
  402db9:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  402dbc:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  402dc3:	00 
  402dc4:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  402dcb:	e8 78 53 00 00       	call   408148 <_setlocale>
  402dd0:	85 c0                	test   eax,eax
  402dd2:	89 c3                	mov    ebx,eax
  402dd4:	74 0a                	je     402de0 <___mingw_dirname+0x30>
  402dd6:	89 04 24             	mov    DWORD PTR [esp],eax
  402dd9:	e8 c2 56 00 00       	call   4084a0 <_strdup>
  402dde:	89 c3                	mov    ebx,eax
  402de0:	c7 44 24 04 44 a1 40 	mov    DWORD PTR [esp+0x4],0x40a144
  402de7:	00 
  402de8:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  402def:	e8 54 53 00 00       	call   408148 <_setlocale>
  402df4:	85 f6                	test   esi,esi
  402df6:	74 05                	je     402dfd <___mingw_dirname+0x4d>
  402df8:	80 3e 00             	cmp    BYTE PTR [esi],0x0
  402dfb:	75 73                	jne    402e70 <___mingw_dirname+0xc0>
  402dfd:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  402e04:	00 
  402e05:	c7 44 24 04 46 a1 40 	mov    DWORD PTR [esp+0x4],0x40a146
  402e0c:	00 
  402e0d:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  402e14:	e8 37 53 00 00       	call   408150 <_wcstombs>
  402e19:	8d 70 01             	lea    esi,[eax+0x1]
  402e1c:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  402e20:	a1 68 d0 40 00       	mov    eax,ds:0x40d068
  402e25:	89 04 24             	mov    DWORD PTR [esp],eax
  402e28:	e8 03 53 00 00       	call   408130 <_realloc>
  402e2d:	a3 68 d0 40 00       	mov    ds:0x40d068,eax
  402e32:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  402e36:	c7 44 24 04 46 a1 40 	mov    DWORD PTR [esp+0x4],0x40a146
  402e3d:	00 
  402e3e:	89 04 24             	mov    DWORD PTR [esp],eax
  402e41:	e8 0a 53 00 00       	call   408150 <_wcstombs>
  402e46:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  402e4a:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  402e51:	e8 f2 52 00 00       	call   408148 <_setlocale>
  402e56:	89 1c 24             	mov    DWORD PTR [esp],ebx
  402e59:	e8 ba 52 00 00       	call   408118 <_free>
  402e5e:	a1 68 d0 40 00       	mov    eax,ds:0x40d068
  402e63:	8d 65 f4             	lea    esp,[ebp-0xc]
  402e66:	5b                   	pop    ebx
  402e67:	5e                   	pop    esi
  402e68:	5f                   	pop    edi
  402e69:	5d                   	pop    ebp
  402e6a:	c3                   	ret    
  402e6b:	90                   	nop
  402e6c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402e70:	89 65 d4             	mov    DWORD PTR [ebp-0x2c],esp
  402e73:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  402e7a:	00 
  402e7b:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  402e7f:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  402e86:	e8 cd 52 00 00       	call   408158 <_mbstowcs>
  402e8b:	89 c2                	mov    edx,eax
  402e8d:	8d 44 00 12          	lea    eax,[eax+eax*1+0x12]
  402e91:	83 e0 f0             	and    eax,0xfffffff0
  402e94:	e8 07 f2 ff ff       	call   4020a0 <___chkstk_ms>
  402e99:	29 c4                	sub    esp,eax
  402e9b:	8d 44 24 0d          	lea    eax,[esp+0xd]
  402e9f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  402ea2:	d1 6d e4             	shr    DWORD PTR [ebp-0x1c],1
  402ea5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  402ea8:	01 c0                	add    eax,eax
  402eaa:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  402ead:	89 c7                	mov    edi,eax
  402eaf:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  402eb3:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  402eb7:	89 04 24             	mov    DWORD PTR [esp],eax
  402eba:	e8 99 52 00 00       	call   408158 <_mbstowcs>
  402ebf:	31 c9                	xor    ecx,ecx
  402ec1:	66 89 0c 47          	mov    WORD PTR [edi+eax*2],cx
  402ec5:	83 f8 01             	cmp    eax,0x1
  402ec8:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  402ecb:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  402ece:	0f b7 04 00          	movzx  eax,WORD PTR [eax+eax*1]
  402ed2:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
  402ed6:	0f 86 f2 00 00 00    	jbe    402fce <___mingw_dirname+0x21e>
  402edc:	66 83 f8 5c          	cmp    ax,0x5c
  402ee0:	74 0a                	je     402eec <___mingw_dirname+0x13c>
  402ee2:	66 83 f8 2f          	cmp    ax,0x2f
  402ee6:	0f 85 0a 01 00 00    	jne    402ff6 <___mingw_dirname+0x246>
  402eec:	8b 7d e0             	mov    edi,DWORD PTR [ebp-0x20]
  402eef:	89 7d dc             	mov    DWORD PTR [ebp-0x24],edi
  402ef2:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
  402ef5:	66 3b 44 3f 02       	cmp    ax,WORD PTR [edi+edi*1+0x2]
  402efa:	0f 84 4f 02 00 00    	je     40314f <___mingw_dirname+0x39f>
  402f00:	0f b7 45 da          	movzx  eax,WORD PTR [ebp-0x26]
  402f04:	66 85 c0             	test   ax,ax
  402f07:	0f 84 fa 01 00 00    	je     403107 <___mingw_dirname+0x357>
  402f0d:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
  402f10:	89 d7                	mov    edi,edx
  402f12:	eb 14                	jmp    402f28 <___mingw_dirname+0x178>
  402f14:	66 83 f8 2f          	cmp    ax,0x2f
  402f18:	74 20                	je     402f3a <___mingw_dirname+0x18a>
  402f1a:	0f b7 42 02          	movzx  eax,WORD PTR [edx+0x2]
  402f1e:	8d 4a 02             	lea    ecx,[edx+0x2]
  402f21:	66 85 c0             	test   ax,ax
  402f24:	74 36                	je     402f5c <___mingw_dirname+0x1ac>
  402f26:	89 ca                	mov    edx,ecx
  402f28:	66 83 f8 5c          	cmp    ax,0x5c
  402f2c:	75 e6                	jne    402f14 <___mingw_dirname+0x164>
  402f2e:	0f b7 02             	movzx  eax,WORD PTR [edx]
  402f31:	66 83 f8 5c          	cmp    ax,0x5c
  402f35:	75 0c                	jne    402f43 <___mingw_dirname+0x193>
  402f37:	83 c2 02             	add    edx,0x2
  402f3a:	0f b7 02             	movzx  eax,WORD PTR [edx]
  402f3d:	66 83 f8 5c          	cmp    ax,0x5c
  402f41:	74 f4                	je     402f37 <___mingw_dirname+0x187>
  402f43:	66 83 f8 2f          	cmp    ax,0x2f
  402f47:	74 ee                	je     402f37 <___mingw_dirname+0x187>
  402f49:	66 85 c0             	test   ax,ax
  402f4c:	74 0e                	je     402f5c <___mingw_dirname+0x1ac>
  402f4e:	0f b7 42 02          	movzx  eax,WORD PTR [edx+0x2]
  402f52:	89 d7                	mov    edi,edx
  402f54:	8d 4a 02             	lea    ecx,[edx+0x2]
  402f57:	66 85 c0             	test   ax,ax
  402f5a:	75 ca                	jne    402f26 <___mingw_dirname+0x176>
  402f5c:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  402f5f:	39 f9                	cmp    ecx,edi
  402f61:	72 7e                	jb     402fe1 <___mingw_dirname+0x231>
  402f63:	66 83 7d da 5c       	cmp    WORD PTR [ebp-0x26],0x5c
  402f68:	74 0b                	je     402f75 <___mingw_dirname+0x1c5>
  402f6a:	66 83 7d da 2f       	cmp    WORD PTR [ebp-0x26],0x2f
  402f6f:	0f 85 ba 01 00 00    	jne    40312f <___mingw_dirname+0x37f>
  402f75:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  402f78:	83 c0 02             	add    eax,0x2
  402f7b:	31 d2                	xor    edx,edx
  402f7d:	66 89 10             	mov    WORD PTR [eax],dx
  402f80:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  402f87:	00 
  402f88:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402f8b:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  402f92:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  402f96:	e8 b5 51 00 00       	call   408150 <_wcstombs>
  402f9b:	8d 78 01             	lea    edi,[eax+0x1]
  402f9e:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  402fa2:	a1 68 d0 40 00       	mov    eax,ds:0x40d068
  402fa7:	89 04 24             	mov    DWORD PTR [esp],eax
  402faa:	e8 81 51 00 00       	call   408130 <_realloc>
  402faf:	a3 68 d0 40 00       	mov    ds:0x40d068,eax
  402fb4:	89 c6                	mov    esi,eax
  402fb6:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  402fba:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402fbd:	89 34 24             	mov    DWORD PTR [esp],esi
  402fc0:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  402fc4:	e8 87 51 00 00       	call   408150 <_wcstombs>
  402fc9:	e9 e9 00 00 00       	jmp    4030b7 <___mingw_dirname+0x307>
  402fce:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402fd1:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  402fd4:	e9 27 ff ff ff       	jmp    402f00 <___mingw_dirname+0x150>
  402fd9:	66 83 fa 2f          	cmp    dx,0x2f
  402fdd:	75 46                	jne    403025 <___mingw_dirname+0x275>
  402fdf:	89 c7                	mov    edi,eax
  402fe1:	8d 47 fe             	lea    eax,[edi-0x2]
  402fe4:	39 c1                	cmp    ecx,eax
  402fe6:	73 3d                	jae    403025 <___mingw_dirname+0x275>
  402fe8:	0f b7 57 fe          	movzx  edx,WORD PTR [edi-0x2]
  402fec:	66 83 fa 5c          	cmp    dx,0x5c
  402ff0:	75 e7                	jne    402fd9 <___mingw_dirname+0x229>
  402ff2:	89 c7                	mov    edi,eax
  402ff4:	eb eb                	jmp    402fe1 <___mingw_dirname+0x231>
  402ff6:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402ff9:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  402ffc:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  402fff:	66 83 7c 00 02 3a    	cmp    WORD PTR [eax+eax*1+0x2],0x3a
  403005:	0f 85 f5 fe ff ff    	jne    402f00 <___mingw_dirname+0x150>
  40300b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  40300e:	83 c0 04             	add    eax,0x4
  403011:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  403014:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403017:	0f b7 44 00 04       	movzx  eax,WORD PTR [eax+eax*1+0x4]
  40301c:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
  403020:	e9 db fe ff ff       	jmp    402f00 <___mingw_dirname+0x150>
  403025:	39 45 dc             	cmp    DWORD PTR [ebp-0x24],eax
  403028:	0f 84 37 01 00 00    	je     403165 <___mingw_dirname+0x3b5>
  40302e:	31 d2                	xor    edx,edx
  403030:	66 89 50 02          	mov    WORD PTR [eax+0x2],dx
  403034:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403037:	0f b7 14 00          	movzx  edx,WORD PTR [eax+eax*1]
  40303b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  40303e:	66 83 fa 5c          	cmp    dx,0x5c
  403042:	0f 85 c7 00 00 00    	jne    40310f <___mingw_dirname+0x35f>
  403048:	83 c0 02             	add    eax,0x2
  40304b:	0f b7 08             	movzx  ecx,WORD PTR [eax]
  40304e:	66 83 f9 5c          	cmp    cx,0x5c
  403052:	74 f4                	je     403048 <___mingw_dirname+0x298>
  403054:	66 83 f9 2f          	cmp    cx,0x2f
  403058:	74 ee                	je     403048 <___mingw_dirname+0x298>
  40305a:	89 c1                	mov    ecx,eax
  40305c:	2b 4d e0             	sub    ecx,DWORD PTR [ebp-0x20]
  40305f:	83 f9 05             	cmp    ecx,0x5
  403062:	0f 8e b1 00 00 00    	jle    403119 <___mingw_dirname+0x369>
  403068:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  40306b:	89 c1                	mov    ecx,eax
  40306d:	66 85 d2             	test   dx,dx
  403070:	74 21                	je     403093 <___mingw_dirname+0x2e3>
  403072:	83 c1 02             	add    ecx,0x2
  403075:	66 83 fa 2f          	cmp    dx,0x2f
  403079:	66 89 51 fe          	mov    WORD PTR [ecx-0x2],dx
  40307d:	74 63                	je     4030e2 <___mingw_dirname+0x332>
  40307f:	66 83 38 5c          	cmp    WORD PTR [eax],0x5c
  403083:	8d 78 02             	lea    edi,[eax+0x2]
  403086:	74 58                	je     4030e0 <___mingw_dirname+0x330>
  403088:	0f b7 50 02          	movzx  edx,WORD PTR [eax+0x2]
  40308c:	89 f8                	mov    eax,edi
  40308e:	66 85 d2             	test   dx,dx
  403091:	75 df                	jne    403072 <___mingw_dirname+0x2c2>
  403093:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  403096:	31 ff                	xor    edi,edi
  403098:	66 89 39             	mov    WORD PTR [ecx],di
  40309b:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40309f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4030a2:	89 34 24             	mov    DWORD PTR [esp],esi
  4030a5:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4030a9:	e8 a2 50 00 00       	call   408150 <_wcstombs>
  4030ae:	83 f8 ff             	cmp    eax,0xffffffff
  4030b1:	74 04                	je     4030b7 <___mingw_dirname+0x307>
  4030b3:	c6 04 06 00          	mov    BYTE PTR [esi+eax*1],0x0
  4030b7:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  4030bb:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  4030c2:	e8 81 50 00 00       	call   408148 <_setlocale>
  4030c7:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4030ca:	e8 49 50 00 00       	call   408118 <_free>
  4030cf:	8b 65 d4             	mov    esp,DWORD PTR [ebp-0x2c]
  4030d2:	8d 65 f4             	lea    esp,[ebp-0xc]
  4030d5:	5b                   	pop    ebx
  4030d6:	89 f0                	mov    eax,esi
  4030d8:	5e                   	pop    esi
  4030d9:	5f                   	pop    edi
  4030da:	5d                   	pop    ebp
  4030db:	c3                   	ret    
  4030dc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4030e0:	89 f8                	mov    eax,edi
  4030e2:	0f b7 10             	movzx  edx,WORD PTR [eax]
  4030e5:	66 83 fa 2f          	cmp    dx,0x2f
  4030e9:	75 59                	jne    403144 <___mingw_dirname+0x394>
  4030eb:	90                   	nop
  4030ec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4030f0:	83 c0 02             	add    eax,0x2
  4030f3:	0f b7 10             	movzx  edx,WORD PTR [eax]
  4030f6:	66 83 fa 5c          	cmp    dx,0x5c
  4030fa:	74 f4                	je     4030f0 <___mingw_dirname+0x340>
  4030fc:	66 83 fa 2f          	cmp    dx,0x2f
  403100:	74 ee                	je     4030f0 <___mingw_dirname+0x340>
  403102:	e9 66 ff ff ff       	jmp    40306d <___mingw_dirname+0x2bd>
  403107:	8b 65 d4             	mov    esp,DWORD PTR [ebp-0x2c]
  40310a:	e9 ee fc ff ff       	jmp    402dfd <___mingw_dirname+0x4d>
  40310f:	66 83 fa 2f          	cmp    dx,0x2f
  403113:	0f 84 2f ff ff ff    	je     403048 <___mingw_dirname+0x298>
  403119:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
  40311c:	66 39 54 3f 02       	cmp    WORD PTR [edi+edi*1+0x2],dx
  403121:	0f 85 41 ff ff ff    	jne    403068 <___mingw_dirname+0x2b8>
  403127:	0f b7 10             	movzx  edx,WORD PTR [eax]
  40312a:	e9 3c ff ff ff       	jmp    40306b <___mingw_dirname+0x2bb>
  40312f:	8b 7d dc             	mov    edi,DWORD PTR [ebp-0x24]
  403132:	b9 2e 00 00 00       	mov    ecx,0x2e
  403137:	89 f8                	mov    eax,edi
  403139:	83 c0 02             	add    eax,0x2
  40313c:	66 89 0f             	mov    WORD PTR [edi],cx
  40313f:	e9 37 fe ff ff       	jmp    402f7b <___mingw_dirname+0x1cb>
  403144:	66 83 fa 5c          	cmp    dx,0x5c
  403148:	74 a6                	je     4030f0 <___mingw_dirname+0x340>
  40314a:	e9 1e ff ff ff       	jmp    40306d <___mingw_dirname+0x2bd>
  40314f:	66 83 7c 3f 04 00    	cmp    WORD PTR [edi+edi*1+0x4],0x0
  403155:	0f 85 a5 fd ff ff    	jne    402f00 <___mingw_dirname+0x150>
  40315b:	90                   	nop
  40315c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403160:	e9 52 ff ff ff       	jmp    4030b7 <___mingw_dirname+0x307>
  403165:	66 83 7d da 5c       	cmp    WORD PTR [ebp-0x26],0x5c
  40316a:	74 0e                	je     40317a <___mingw_dirname+0x3ca>
  40316c:	66 83 7d da 2f       	cmp    WORD PTR [ebp-0x26],0x2f
  403171:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  403174:	0f 85 b4 fe ff ff    	jne    40302e <___mingw_dirname+0x27e>
  40317a:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  40317d:	0f b7 4d da          	movzx  ecx,WORD PTR [ebp-0x26]
  403181:	66 39 48 02          	cmp    WORD PTR [eax+0x2],cx
  403185:	0f 85 a3 fe ff ff    	jne    40302e <___mingw_dirname+0x27e>
  40318b:	0f b7 50 04          	movzx  edx,WORD PTR [eax+0x4]
  40318f:	66 83 fa 2f          	cmp    dx,0x2f
  403193:	0f 84 95 fe ff ff    	je     40302e <___mingw_dirname+0x27e>
  403199:	66 83 fa 5c          	cmp    dx,0x5c
  40319d:	89 f8                	mov    eax,edi
  40319f:	0f 85 89 fe ff ff    	jne    40302e <___mingw_dirname+0x27e>
  4031a5:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4031a8:	e9 81 fe ff ff       	jmp    40302e <___mingw_dirname+0x27e>
  4031ad:	90                   	nop
  4031ae:	90                   	nop
  4031af:	90                   	nop

004031b0 <_dirent_findnext>:
  4031b0:	55                   	push   ebp
  4031b1:	89 e5                	mov    ebp,esp
  4031b3:	56                   	push   esi
  4031b4:	89 d6                	mov    esi,edx
  4031b6:	53                   	push   ebx
  4031b7:	81 ec 50 01 00 00    	sub    esp,0x150
  4031bd:	8d 95 b8 fe ff ff    	lea    edx,[ebp-0x148]
  4031c3:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4031c7:	89 04 24             	mov    DWORD PTR [esp],eax
  4031ca:	e8 31 50 00 00       	call   408200 <_FindNextFileA@8>
  4031cf:	83 ec 08             	sub    esp,0x8
  4031d2:	85 c0                	test   eax,eax
  4031d4:	89 c3                	mov    ebx,eax
  4031d6:	75 20                	jne    4031f8 <_dirent_findnext+0x48>
  4031d8:	e8 03 50 00 00       	call   4081e0 <_GetLastError@0>
  4031dd:	31 db                	xor    ebx,ebx
  4031df:	83 f8 12             	cmp    eax,0x12
  4031e2:	74 0b                	je     4031ef <_dirent_findnext+0x3f>
  4031e4:	e8 57 4f 00 00       	call   408140 <__errno>
  4031e9:	c7 00 02 00 00 00    	mov    DWORD PTR [eax],0x2
  4031ef:	8d 65 f8             	lea    esp,[ebp-0x8]
  4031f2:	89 d8                	mov    eax,ebx
  4031f4:	5b                   	pop    ebx
  4031f5:	5e                   	pop    esi
  4031f6:	5d                   	pop    ebp
  4031f7:	c3                   	ret    
  4031f8:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
  4031fe:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  403202:	8d 46 0c             	lea    eax,[esi+0xc]
  403205:	c7 44 24 08 4c a1 40 	mov    DWORD PTR [esp+0x8],0x40a14c
  40320c:	00 
  40320d:	c7 44 24 04 04 01 00 	mov    DWORD PTR [esp+0x4],0x104
  403214:	00 
  403215:	89 04 24             	mov    DWORD PTR [esp],eax
  403218:	e8 43 04 00 00       	call   403660 <___mingw_snprintf>
  40321d:	66 89 46 06          	mov    WORD PTR [esi+0x6],ax
  403221:	8b 85 b8 fe ff ff    	mov    eax,DWORD PTR [ebp-0x148]
  403227:	24 58                	and    al,0x58
  403229:	83 f8 10             	cmp    eax,0x10
  40322c:	76 12                	jbe    403240 <_dirent_findnext+0x90>
  40322e:	c7 46 08 18 00 00 00 	mov    DWORD PTR [esi+0x8],0x18
  403235:	8d 65 f8             	lea    esp,[ebp-0x8]
  403238:	89 d8                	mov    eax,ebx
  40323a:	5b                   	pop    ebx
  40323b:	5e                   	pop    esi
  40323c:	5d                   	pop    ebp
  40323d:	c3                   	ret    
  40323e:	66 90                	xchg   ax,ax
  403240:	89 46 08             	mov    DWORD PTR [esi+0x8],eax
  403243:	8d 65 f8             	lea    esp,[ebp-0x8]
  403246:	89 d8                	mov    eax,ebx
  403248:	5b                   	pop    ebx
  403249:	5e                   	pop    esi
  40324a:	5d                   	pop    ebp
  40324b:	c3                   	ret    
  40324c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00403250 <_dirent_findfirst>:
  403250:	55                   	push   ebp
  403251:	89 e5                	mov    ebp,esp
  403253:	56                   	push   esi
  403254:	53                   	push   ebx
  403255:	89 d3                	mov    ebx,edx
  403257:	81 ec 50 01 00 00    	sub    esp,0x150
  40325d:	8d 95 b8 fe ff ff    	lea    edx,[ebp-0x148]
  403263:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  403267:	89 04 24             	mov    DWORD PTR [esp],eax
  40326a:	e8 99 4f 00 00       	call   408208 <_FindFirstFileA@8>
  40326f:	83 ec 08             	sub    esp,0x8
  403272:	83 f8 ff             	cmp    eax,0xffffffff
  403275:	89 c6                	mov    esi,eax
  403277:	74 4a                	je     4032c3 <_dirent_findfirst+0x73>
  403279:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
  40327f:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  403283:	8d 43 0c             	lea    eax,[ebx+0xc]
  403286:	c7 44 24 08 4c a1 40 	mov    DWORD PTR [esp+0x8],0x40a14c
  40328d:	00 
  40328e:	c7 44 24 04 04 01 00 	mov    DWORD PTR [esp+0x4],0x104
  403295:	00 
  403296:	89 04 24             	mov    DWORD PTR [esp],eax
  403299:	e8 c2 03 00 00       	call   403660 <___mingw_snprintf>
  40329e:	8b 8d b8 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x148]
  4032a4:	80 e1 58             	and    cl,0x58
  4032a7:	83 f9 10             	cmp    ecx,0x10
  4032aa:	66 89 43 06          	mov    WORD PTR [ebx+0x6],ax
  4032ae:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  4032b1:	76 07                	jbe    4032ba <_dirent_findfirst+0x6a>
  4032b3:	c7 43 08 18 00 00 00 	mov    DWORD PTR [ebx+0x8],0x18
  4032ba:	8d 65 f8             	lea    esp,[ebp-0x8]
  4032bd:	89 f0                	mov    eax,esi
  4032bf:	5b                   	pop    ebx
  4032c0:	5e                   	pop    esi
  4032c1:	5d                   	pop    ebp
  4032c2:	c3                   	ret    
  4032c3:	e8 78 4e 00 00       	call   408140 <__errno>
  4032c8:	89 c3                	mov    ebx,eax
  4032ca:	e8 11 4f 00 00       	call   4081e0 <_GetLastError@0>
  4032cf:	83 f8 03             	cmp    eax,0x3
  4032d2:	89 03                	mov    DWORD PTR [ebx],eax
  4032d4:	74 2a                	je     403300 <_dirent_findfirst+0xb0>
  4032d6:	e8 65 4e 00 00       	call   408140 <__errno>
  4032db:	81 38 0b 01 00 00    	cmp    DWORD PTR [eax],0x10b
  4032e1:	74 2d                	je     403310 <_dirent_findfirst+0xc0>
  4032e3:	e8 58 4e 00 00       	call   408140 <__errno>
  4032e8:	83 38 02             	cmp    DWORD PTR [eax],0x2
  4032eb:	74 cd                	je     4032ba <_dirent_findfirst+0x6a>
  4032ed:	8d 76 00             	lea    esi,[esi+0x0]
  4032f0:	e8 4b 4e 00 00       	call   408140 <__errno>
  4032f5:	c7 00 16 00 00 00    	mov    DWORD PTR [eax],0x16
  4032fb:	eb bd                	jmp    4032ba <_dirent_findfirst+0x6a>
  4032fd:	8d 76 00             	lea    esi,[esi+0x0]
  403300:	e8 3b 4e 00 00       	call   408140 <__errno>
  403305:	c7 00 02 00 00 00    	mov    DWORD PTR [eax],0x2
  40330b:	eb ad                	jmp    4032ba <_dirent_findfirst+0x6a>
  40330d:	8d 76 00             	lea    esi,[esi+0x0]
  403310:	e8 2b 4e 00 00       	call   408140 <__errno>
  403315:	c7 00 14 00 00 00    	mov    DWORD PTR [eax],0x14
  40331b:	eb 9d                	jmp    4032ba <_dirent_findfirst+0x6a>
  40331d:	8d 76 00             	lea    esi,[esi+0x0]

00403320 <___mingw_opendir>:
  403320:	55                   	push   ebp
  403321:	57                   	push   edi
  403322:	56                   	push   esi
  403323:	53                   	push   ebx
  403324:	81 ec 2c 01 00 00    	sub    esp,0x12c
  40332a:	8b 84 24 40 01 00 00 	mov    eax,DWORD PTR [esp+0x140]
  403331:	85 c0                	test   eax,eax
  403333:	0f 84 67 01 00 00    	je     4034a0 <___mingw_opendir+0x180>
  403339:	80 38 00             	cmp    BYTE PTR [eax],0x0
  40333c:	0f 84 40 01 00 00    	je     403482 <___mingw_opendir+0x162>
  403342:	8d 7c 24 1c          	lea    edi,[esp+0x1c]
  403346:	c7 44 24 08 04 01 00 	mov    DWORD PTR [esp+0x8],0x104
  40334d:	00 
  40334e:	89 fb                	mov    ebx,edi
  403350:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  403354:	89 3c 24             	mov    DWORD PTR [esp],edi
  403357:	e8 04 4e 00 00       	call   408160 <__fullpath>
  40335c:	80 7c 24 1c 00       	cmp    BYTE PTR [esp+0x1c],0x0
  403361:	74 5d                	je     4033c0 <___mingw_opendir+0xa0>
  403363:	8b 13                	mov    edx,DWORD PTR [ebx]
  403365:	83 c3 04             	add    ebx,0x4
  403368:	8d 82 ff fe fe fe    	lea    eax,[edx-0x1010101]
  40336e:	f7 d2                	not    edx
  403370:	21 d0                	and    eax,edx
  403372:	25 80 80 80 80       	and    eax,0x80808080
  403377:	74 ea                	je     403363 <___mingw_opendir+0x43>
  403379:	a9 80 80 00 00       	test   eax,0x8080
  40337e:	0f 84 df 00 00 00    	je     403463 <___mingw_opendir+0x143>
  403384:	00 c0                	add    al,al
  403386:	83 db 03             	sbb    ebx,0x3
  403389:	29 fb                	sub    ebx,edi
  40338b:	0f b6 44 1c 1b       	movzx  eax,BYTE PTR [esp+ebx*1+0x1b]
  403390:	3c 5c                	cmp    al,0x5c
  403392:	74 50                	je     4033e4 <___mingw_opendir+0xc4>
  403394:	3c 2f                	cmp    al,0x2f
  403396:	74 4c                	je     4033e4 <___mingw_opendir+0xc4>
  403398:	b9 5c 00 00 00       	mov    ecx,0x5c
  40339d:	66 89 0c 1f          	mov    WORD PTR [edi+ebx*1],cx
  4033a1:	89 fb                	mov    ebx,edi
  4033a3:	8b 13                	mov    edx,DWORD PTR [ebx]
  4033a5:	83 c3 04             	add    ebx,0x4
  4033a8:	8d 82 ff fe fe fe    	lea    eax,[edx-0x1010101]
  4033ae:	f7 d2                	not    edx
  4033b0:	21 d0                	and    eax,edx
  4033b2:	25 80 80 80 80       	and    eax,0x80808080
  4033b7:	74 ea                	je     4033a3 <___mingw_opendir+0x83>
  4033b9:	eb 1b                	jmp    4033d6 <___mingw_opendir+0xb6>
  4033bb:	90                   	nop
  4033bc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4033c0:	8b 13                	mov    edx,DWORD PTR [ebx]
  4033c2:	83 c3 04             	add    ebx,0x4
  4033c5:	8d 82 ff fe fe fe    	lea    eax,[edx-0x1010101]
  4033cb:	f7 d2                	not    edx
  4033cd:	21 d0                	and    eax,edx
  4033cf:	25 80 80 80 80       	and    eax,0x80808080
  4033d4:	74 ea                	je     4033c0 <___mingw_opendir+0xa0>
  4033d6:	a9 80 80 00 00       	test   eax,0x8080
  4033db:	74 7b                	je     403458 <___mingw_opendir+0x138>
  4033dd:	00 c0                	add    al,al
  4033df:	83 db 03             	sbb    ebx,0x3
  4033e2:	29 fb                	sub    ebx,edi
  4033e4:	ba 2a 00 00 00       	mov    edx,0x2a
  4033e9:	8d 83 1d 01 00 00    	lea    eax,[ebx+0x11d]
  4033ef:	66 89 14 1f          	mov    WORD PTR [edi+ebx*1],dx
  4033f3:	89 04 24             	mov    DWORD PTR [esp],eax
  4033f6:	e8 25 4d 00 00       	call   408120 <_malloc>
  4033fb:	85 c0                	test   eax,eax
  4033fd:	89 c6                	mov    esi,eax
  4033ff:	0f 84 8c 00 00 00    	je     403491 <___mingw_opendir+0x171>
  403405:	8d a8 18 01 00 00    	lea    ebp,[eax+0x118]
  40340b:	83 c3 02             	add    ebx,0x2
  40340e:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  403412:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  403416:	89 2c 24             	mov    DWORD PTR [esp],ebp
  403419:	e8 ea 4c 00 00       	call   408108 <_memcpy>
  40341e:	89 f2                	mov    edx,esi
  403420:	89 e8                	mov    eax,ebp
  403422:	e8 29 fe ff ff       	call   403250 <_dirent_findfirst>
  403427:	83 f8 ff             	cmp    eax,0xffffffff
  40342a:	89 86 10 01 00 00    	mov    DWORD PTR [esi+0x110],eax
  403430:	74 7d                	je     4034af <___mingw_opendir+0x18f>
  403432:	b8 10 01 00 00       	mov    eax,0x110
  403437:	66 89 46 04          	mov    WORD PTR [esi+0x4],ax
  40343b:	89 f0                	mov    eax,esi
  40343d:	c7 86 14 01 00 00 00 	mov    DWORD PTR [esi+0x114],0x0
  403444:	00 00 00 
  403447:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
  40344d:	81 c4 2c 01 00 00    	add    esp,0x12c
  403453:	5b                   	pop    ebx
  403454:	5e                   	pop    esi
  403455:	5f                   	pop    edi
  403456:	5d                   	pop    ebp
  403457:	c3                   	ret    
  403458:	c1 e8 10             	shr    eax,0x10
  40345b:	83 c3 02             	add    ebx,0x2
  40345e:	e9 7a ff ff ff       	jmp    4033dd <___mingw_opendir+0xbd>
  403463:	c1 e8 10             	shr    eax,0x10
  403466:	83 c3 02             	add    ebx,0x2
  403469:	00 c0                	add    al,al
  40346b:	83 db 03             	sbb    ebx,0x3
  40346e:	29 fb                	sub    ebx,edi
  403470:	0f b6 44 1c 1b       	movzx  eax,BYTE PTR [esp+ebx*1+0x1b]
  403475:	3c 5c                	cmp    al,0x5c
  403477:	0f 84 67 ff ff ff    	je     4033e4 <___mingw_opendir+0xc4>
  40347d:	e9 12 ff ff ff       	jmp    403394 <___mingw_opendir+0x74>
  403482:	e8 b9 4c 00 00       	call   408140 <__errno>
  403487:	c7 00 02 00 00 00    	mov    DWORD PTR [eax],0x2
  40348d:	31 c0                	xor    eax,eax
  40348f:	eb bc                	jmp    40344d <___mingw_opendir+0x12d>
  403491:	e8 aa 4c 00 00       	call   408140 <__errno>
  403496:	c7 00 0c 00 00 00    	mov    DWORD PTR [eax],0xc
  40349c:	31 c0                	xor    eax,eax
  40349e:	eb ad                	jmp    40344d <___mingw_opendir+0x12d>
  4034a0:	e8 9b 4c 00 00       	call   408140 <__errno>
  4034a5:	c7 00 16 00 00 00    	mov    DWORD PTR [eax],0x16
  4034ab:	31 c0                	xor    eax,eax
  4034ad:	eb 9e                	jmp    40344d <___mingw_opendir+0x12d>
  4034af:	89 34 24             	mov    DWORD PTR [esp],esi
  4034b2:	e8 61 4c 00 00       	call   408118 <_free>
  4034b7:	31 c0                	xor    eax,eax
  4034b9:	eb 92                	jmp    40344d <___mingw_opendir+0x12d>
  4034bb:	90                   	nop
  4034bc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

004034c0 <___mingw_readdir>:
  4034c0:	53                   	push   ebx
  4034c1:	83 ec 08             	sub    esp,0x8
  4034c4:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
  4034c8:	85 db                	test   ebx,ebx
  4034ca:	74 2b                	je     4034f7 <___mingw_readdir+0x37>
  4034cc:	8b 83 14 01 00 00    	mov    eax,DWORD PTR [ebx+0x114]
  4034d2:	8d 50 01             	lea    edx,[eax+0x1]
  4034d5:	85 c0                	test   eax,eax
  4034d7:	89 93 14 01 00 00    	mov    DWORD PTR [ebx+0x114],edx
  4034dd:	7e 11                	jle    4034f0 <___mingw_readdir+0x30>
  4034df:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  4034e5:	89 da                	mov    edx,ebx
  4034e7:	e8 c4 fc ff ff       	call   4031b0 <_dirent_findnext>
  4034ec:	85 c0                	test   eax,eax
  4034ee:	74 02                	je     4034f2 <___mingw_readdir+0x32>
  4034f0:	89 d8                	mov    eax,ebx
  4034f2:	83 c4 08             	add    esp,0x8
  4034f5:	5b                   	pop    ebx
  4034f6:	c3                   	ret    
  4034f7:	e8 44 4c 00 00       	call   408140 <__errno>
  4034fc:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  403502:	31 c0                	xor    eax,eax
  403504:	eb ec                	jmp    4034f2 <___mingw_readdir+0x32>
  403506:	8d 76 00             	lea    esi,[esi+0x0]
  403509:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00403510 <___mingw_closedir>:
  403510:	55                   	push   ebp
  403511:	89 e5                	mov    ebp,esp
  403513:	53                   	push   ebx
  403514:	83 ec 14             	sub    esp,0x14
  403517:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  40351a:	85 db                	test   ebx,ebx
  40351c:	74 24                	je     403542 <___mingw_closedir+0x32>
  40351e:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  403524:	89 04 24             	mov    DWORD PTR [esp],eax
  403527:	e8 e4 4c 00 00       	call   408210 <_FindClose@4>
  40352c:	83 ec 04             	sub    esp,0x4
  40352f:	85 c0                	test   eax,eax
  403531:	74 0f                	je     403542 <___mingw_closedir+0x32>
  403533:	89 1c 24             	mov    DWORD PTR [esp],ebx
  403536:	e8 dd 4b 00 00       	call   408118 <_free>
  40353b:	31 c0                	xor    eax,eax
  40353d:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  403540:	c9                   	leave  
  403541:	c3                   	ret    
  403542:	e8 f9 4b 00 00       	call   408140 <__errno>
  403547:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  40354d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403552:	eb e9                	jmp    40353d <___mingw_closedir+0x2d>
  403554:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  40355a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00403560 <___mingw_rewinddir>:
  403560:	55                   	push   ebp
  403561:	89 e5                	mov    ebp,esp
  403563:	53                   	push   ebx
  403564:	83 ec 14             	sub    esp,0x14
  403567:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  40356a:	85 db                	test   ebx,ebx
  40356c:	74 15                	je     403583 <___mingw_rewinddir+0x23>
  40356e:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  403574:	89 04 24             	mov    DWORD PTR [esp],eax
  403577:	e8 94 4c 00 00       	call   408210 <_FindClose@4>
  40357c:	83 ec 04             	sub    esp,0x4
  40357f:	85 c0                	test   eax,eax
  403581:	75 10                	jne    403593 <___mingw_rewinddir+0x33>
  403583:	e8 b8 4b 00 00       	call   408140 <__errno>
  403588:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  40358e:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  403591:	c9                   	leave  
  403592:	c3                   	ret    
  403593:	8d 83 18 01 00 00    	lea    eax,[ebx+0x118]
  403599:	89 da                	mov    edx,ebx
  40359b:	e8 b0 fc ff ff       	call   403250 <_dirent_findfirst>
  4035a0:	83 f8 ff             	cmp    eax,0xffffffff
  4035a3:	89 83 10 01 00 00    	mov    DWORD PTR [ebx+0x110],eax
  4035a9:	74 e3                	je     40358e <___mingw_rewinddir+0x2e>
  4035ab:	c7 83 14 01 00 00 00 	mov    DWORD PTR [ebx+0x114],0x0
  4035b2:	00 00 00 
  4035b5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  4035b8:	c9                   	leave  
  4035b9:	c3                   	ret    
  4035ba:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

004035c0 <___mingw_telldir>:
  4035c0:	83 ec 0c             	sub    esp,0xc
  4035c3:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  4035c7:	85 c0                	test   eax,eax
  4035c9:	74 0a                	je     4035d5 <___mingw_telldir+0x15>
  4035cb:	8b 80 14 01 00 00    	mov    eax,DWORD PTR [eax+0x114]
  4035d1:	83 c4 0c             	add    esp,0xc
  4035d4:	c3                   	ret    
  4035d5:	e8 66 4b 00 00       	call   408140 <__errno>
  4035da:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  4035e0:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4035e5:	eb ea                	jmp    4035d1 <___mingw_telldir+0x11>
  4035e7:	89 f6                	mov    esi,esi
  4035e9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004035f0 <___mingw_seekdir>:
  4035f0:	56                   	push   esi
  4035f1:	53                   	push   ebx
  4035f2:	83 ec 14             	sub    esp,0x14
  4035f5:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  4035f9:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
  4035fd:	85 f6                	test   esi,esi
  4035ff:	78 41                	js     403642 <___mingw_seekdir+0x52>
  403601:	89 1c 24             	mov    DWORD PTR [esp],ebx
  403604:	e8 57 ff ff ff       	call   403560 <___mingw_rewinddir>
  403609:	85 f6                	test   esi,esi
  40360b:	74 2f                	je     40363c <___mingw_seekdir+0x4c>
  40360d:	83 bb 10 01 00 00 ff 	cmp    DWORD PTR [ebx+0x110],0xffffffff
  403614:	75 13                	jne    403629 <___mingw_seekdir+0x39>
  403616:	eb 24                	jmp    40363c <___mingw_seekdir+0x4c>
  403618:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  40361e:	89 da                	mov    edx,ebx
  403620:	e8 8b fb ff ff       	call   4031b0 <_dirent_findnext>
  403625:	85 c0                	test   eax,eax
  403627:	74 13                	je     40363c <___mingw_seekdir+0x4c>
  403629:	8b 83 14 01 00 00    	mov    eax,DWORD PTR [ebx+0x114]
  40362f:	83 c0 01             	add    eax,0x1
  403632:	39 c6                	cmp    esi,eax
  403634:	89 83 14 01 00 00    	mov    DWORD PTR [ebx+0x114],eax
  40363a:	7f dc                	jg     403618 <___mingw_seekdir+0x28>
  40363c:	83 c4 14             	add    esp,0x14
  40363f:	5b                   	pop    ebx
  403640:	5e                   	pop    esi
  403641:	c3                   	ret    
  403642:	e8 f9 4a 00 00       	call   408140 <__errno>
  403647:	c7 00 16 00 00 00    	mov    DWORD PTR [eax],0x16
  40364d:	83 c4 14             	add    esp,0x14
  403650:	5b                   	pop    ebx
  403651:	5e                   	pop    esi
  403652:	c3                   	ret    
  403653:	90                   	nop
  403654:	90                   	nop
  403655:	90                   	nop
  403656:	90                   	nop
  403657:	90                   	nop
  403658:	90                   	nop
  403659:	90                   	nop
  40365a:	90                   	nop
  40365b:	90                   	nop
  40365c:	90                   	nop
  40365d:	90                   	nop
  40365e:	90                   	nop
  40365f:	90                   	nop

00403660 <___mingw_snprintf>:
  403660:	83 ec 1c             	sub    esp,0x1c
  403663:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  403667:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40366b:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  40366f:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  403673:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  403677:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40367b:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  40367f:	89 04 24             	mov    DWORD PTR [esp],eax
  403682:	e8 09 00 00 00       	call   403690 <___mingw_vsnprintf>
  403687:	83 c4 1c             	add    esp,0x1c
  40368a:	c3                   	ret    
  40368b:	90                   	nop
  40368c:	90                   	nop
  40368d:	90                   	nop
  40368e:	90                   	nop
  40368f:	90                   	nop

00403690 <___mingw_vsnprintf>:
  403690:	56                   	push   esi
  403691:	53                   	push   ebx
  403692:	83 ec 24             	sub    esp,0x24
  403695:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  403699:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  40369d:	8b 54 24 38          	mov    edx,DWORD PTR [esp+0x38]
  4036a1:	8b 4c 24 3c          	mov    ecx,DWORD PTR [esp+0x3c]
  4036a5:	85 c0                	test   eax,eax
  4036a7:	74 37                	je     4036e0 <___mingw_vsnprintf+0x50>
  4036a9:	8d 70 ff             	lea    esi,[eax-0x1]
  4036ac:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  4036b0:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  4036b4:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  4036b8:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  4036bc:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  4036c3:	e8 e8 15 00 00       	call   404cb0 <___mingw_pformat>
  4036c8:	39 f0                	cmp    eax,esi
  4036ca:	89 c2                	mov    edx,eax
  4036cc:	77 0a                	ja     4036d8 <___mingw_vsnprintf+0x48>
  4036ce:	c6 04 13 00          	mov    BYTE PTR [ebx+edx*1],0x0
  4036d2:	83 c4 24             	add    esp,0x24
  4036d5:	5b                   	pop    ebx
  4036d6:	5e                   	pop    esi
  4036d7:	c3                   	ret    
  4036d8:	89 f2                	mov    edx,esi
  4036da:	eb f2                	jmp    4036ce <___mingw_vsnprintf+0x3e>
  4036dc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4036e0:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  4036e4:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  4036e8:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  4036ec:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4036f3:	00 
  4036f4:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  4036fb:	e8 b0 15 00 00       	call   404cb0 <___mingw_pformat>
  403700:	83 c4 24             	add    esp,0x24
  403703:	5b                   	pop    ebx
  403704:	5e                   	pop    esi
  403705:	c3                   	ret    
  403706:	90                   	nop
  403707:	90                   	nop
  403708:	90                   	nop
  403709:	90                   	nop
  40370a:	90                   	nop
  40370b:	90                   	nop
  40370c:	90                   	nop
  40370d:	90                   	nop
  40370e:	90                   	nop
  40370f:	90                   	nop

00403710 <___pformat_cvt>:
  403710:	53                   	push   ebx
  403711:	89 c1                	mov    ecx,eax
  403713:	83 ec 48             	sub    esp,0x48
  403716:	8b 44 24 50          	mov    eax,DWORD PTR [esp+0x50]
  40371a:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  40371e:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  403722:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  403726:	8b 44 24 58          	mov    eax,DWORD PTR [esp+0x58]
  40372a:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
  40372e:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  403732:	db 6c 24 20          	fld    TBYTE PTR [esp+0x20]
  403736:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  40373a:	d9 e5                	fxam   
  40373c:	9b df e0             	fstsw  ax
  40373f:	dd d8                	fstp   st(0)
  403741:	f6 c4 01             	test   ah,0x1
  403744:	74 1a                	je     403760 <___pformat_cvt+0x50>
  403746:	f6 c4 04             	test   ah,0x4
  403749:	0f 84 91 00 00 00    	je     4037e0 <___pformat_cvt+0xd0>
  40374f:	c7 44 24 38 03 00 00 	mov    DWORD PTR [esp+0x38],0x3
  403756:	00 
  403757:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  40375c:	31 c0                	xor    eax,eax
  40375e:	eb 14                	jmp    403774 <___pformat_cvt+0x64>
  403760:	f6 c4 04             	test   ah,0x4
  403763:	75 5c                	jne    4037c1 <___pformat_cvt+0xb1>
  403765:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  40376a:	31 c0                	xor    eax,eax
  40376c:	c7 44 24 38 00 00 00 	mov    DWORD PTR [esp+0x38],0x0
  403773:	00 
  403774:	81 e2 00 80 00 00    	and    edx,0x8000
  40377a:	8b 5c 24 68          	mov    ebx,DWORD PTR [esp+0x68]
  40377e:	89 13                	mov    DWORD PTR [ebx],edx
  403780:	8d 54 24 3c          	lea    edx,[esp+0x3c]
  403784:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  403788:	8b 54 24 64          	mov    edx,DWORD PTR [esp+0x64]
  40378c:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  403790:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  403794:	c7 04 24 0c 90 40 00 	mov    DWORD PTR [esp],0x40900c
  40379b:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  40379f:	8b 54 24 60          	mov    edx,DWORD PTR [esp+0x60]
  4037a3:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  4037a7:	8d 54 24 38          	lea    edx,[esp+0x38]
  4037ab:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  4037af:	8d 54 24 20          	lea    edx,[esp+0x20]
  4037b3:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  4037b7:	e8 64 1e 00 00       	call   405620 <___gdtoa>
  4037bc:	83 c4 48             	add    esp,0x48
  4037bf:	5b                   	pop    ebx
  4037c0:	c3                   	ret    
  4037c1:	f6 c4 40             	test   ah,0x40
  4037c4:	74 2a                	je     4037f0 <___pformat_cvt+0xe0>
  4037c6:	c7 44 24 38 02 00 00 	mov    DWORD PTR [esp+0x38],0x2
  4037cd:	00 
  4037ce:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  4037d3:	b8 c3 bf ff ff       	mov    eax,0xffffbfc3
  4037d8:	eb 9a                	jmp    403774 <___pformat_cvt+0x64>
  4037da:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4037e0:	c7 44 24 38 04 00 00 	mov    DWORD PTR [esp+0x38],0x4
  4037e7:	00 
  4037e8:	31 c0                	xor    eax,eax
  4037ea:	31 d2                	xor    edx,edx
  4037ec:	eb 8c                	jmp    40377a <___pformat_cvt+0x6a>
  4037ee:	66 90                	xchg   ax,ax
  4037f0:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  4037f5:	c7 44 24 38 01 00 00 	mov    DWORD PTR [esp+0x38],0x1
  4037fc:	00 
  4037fd:	89 d0                	mov    eax,edx
  4037ff:	25 ff 7f 00 00       	and    eax,0x7fff
  403804:	2d 3e 40 00 00       	sub    eax,0x403e
  403809:	e9 66 ff ff ff       	jmp    403774 <___pformat_cvt+0x64>
  40380e:	66 90                	xchg   ax,ax

00403810 <___pformat_putc>:
  403810:	53                   	push   ebx
  403811:	83 ec 18             	sub    esp,0x18
  403814:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
  403817:	f6 c5 20             	test   ch,0x20
  40381a:	75 08                	jne    403824 <___pformat_putc+0x14>
  40381c:	8b 5a 18             	mov    ebx,DWORD PTR [edx+0x18]
  40381f:	39 5a 1c             	cmp    DWORD PTR [edx+0x1c],ebx
  403822:	7e 10                	jle    403834 <___pformat_putc+0x24>
  403824:	80 e5 10             	and    ch,0x10
  403827:	75 17                	jne    403840 <___pformat_putc+0x30>
  403829:	8b 1a                	mov    ebx,DWORD PTR [edx]
  40382b:	8b 4a 18             	mov    ecx,DWORD PTR [edx+0x18]
  40382e:	88 04 0b             	mov    BYTE PTR [ebx+ecx*1],al
  403831:	8b 5a 18             	mov    ebx,DWORD PTR [edx+0x18]
  403834:	83 c3 01             	add    ebx,0x1
  403837:	89 5a 18             	mov    DWORD PTR [edx+0x18],ebx
  40383a:	83 c4 18             	add    esp,0x18
  40383d:	5b                   	pop    ebx
  40383e:	c3                   	ret    
  40383f:	90                   	nop
  403840:	8b 0a                	mov    ecx,DWORD PTR [edx]
  403842:	89 04 24             	mov    DWORD PTR [esp],eax
  403845:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  403849:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  40384d:	e8 16 49 00 00       	call   408168 <_fputc>
  403852:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  403856:	8b 5a 18             	mov    ebx,DWORD PTR [edx+0x18]
  403859:	83 c3 01             	add    ebx,0x1
  40385c:	89 5a 18             	mov    DWORD PTR [edx+0x18],ebx
  40385f:	83 c4 18             	add    esp,0x18
  403862:	5b                   	pop    ebx
  403863:	c3                   	ret    
  403864:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  40386a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00403870 <___pformat_wputchars>:
  403870:	55                   	push   ebp
  403871:	57                   	push   edi
  403872:	56                   	push   esi
  403873:	89 d6                	mov    esi,edx
  403875:	53                   	push   ebx
  403876:	89 cb                	mov    ebx,ecx
  403878:	83 ec 4c             	sub    esp,0x4c
  40387b:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  40387f:	8d 6c 24 30          	lea    ebp,[esp+0x30]
  403883:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  403887:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40388b:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  403892:	00 
  403893:	89 2c 24             	mov    DWORD PTR [esp],ebp
  403896:	e8 b5 32 00 00       	call   406b50 <_wcrtomb>
  40389b:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
  40389e:	85 c0                	test   eax,eax
  4038a0:	78 08                	js     4038aa <___pformat_wputchars+0x3a>
  4038a2:	39 c6                	cmp    esi,eax
  4038a4:	0f 8f c7 00 00 00    	jg     403971 <___pformat_wputchars+0x101>
  4038aa:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4038ad:	39 c6                	cmp    esi,eax
  4038af:	0f 8d 8c 00 00 00    	jge    403941 <___pformat_wputchars+0xd1>
  4038b5:	29 f0                	sub    eax,esi
  4038b7:	85 c0                	test   eax,eax
  4038b9:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  4038bc:	7e 0a                	jle    4038c8 <___pformat_wputchars+0x58>
  4038be:	f6 43 05 04          	test   BYTE PTR [ebx+0x5],0x4
  4038c2:	0f 84 85 00 00 00    	je     40394d <___pformat_wputchars+0xdd>
  4038c8:	89 74 24 1c          	mov    DWORD PTR [esp+0x1c],esi
  4038cc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4038d0:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  4038d4:	85 c0                	test   eax,eax
  4038d6:	7e 54                	jle    40392c <___pformat_wputchars+0xbc>
  4038d8:	83 44 24 18 02       	add    DWORD PTR [esp+0x18],0x2
  4038dd:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4038e1:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4038e5:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  4038e9:	0f b7 40 fe          	movzx  eax,WORD PTR [eax-0x2]
  4038ed:	89 2c 24             	mov    DWORD PTR [esp],ebp
  4038f0:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4038f4:	e8 57 32 00 00       	call   406b50 <_wcrtomb>
  4038f9:	85 c0                	test   eax,eax
  4038fb:	7e 2f                	jle    40392c <___pformat_wputchars+0xbc>
  4038fd:	8d 74 05 00          	lea    esi,[ebp+eax*1+0x0]
  403901:	89 ef                	mov    edi,ebp
  403903:	83 c7 01             	add    edi,0x1
  403906:	0f be 47 ff          	movsx  eax,BYTE PTR [edi-0x1]
  40390a:	89 da                	mov    edx,ebx
  40390c:	e8 ff fe ff ff       	call   403810 <___pformat_putc>
  403911:	39 f7                	cmp    edi,esi
  403913:	75 ee                	jne    403903 <___pformat_wputchars+0x93>
  403915:	83 6c 24 1c 01       	sub    DWORD PTR [esp+0x1c],0x1
  40391a:	eb b4                	jmp    4038d0 <___pformat_wputchars+0x60>
  40391c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403920:	89 da                	mov    edx,ebx
  403922:	b8 20 00 00 00       	mov    eax,0x20
  403927:	e8 e4 fe ff ff       	call   403810 <___pformat_putc>
  40392c:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  40392f:	8d 50 ff             	lea    edx,[eax-0x1]
  403932:	85 c0                	test   eax,eax
  403934:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403937:	7f e7                	jg     403920 <___pformat_wputchars+0xb0>
  403939:	83 c4 4c             	add    esp,0x4c
  40393c:	5b                   	pop    ebx
  40393d:	5e                   	pop    esi
  40393e:	5f                   	pop    edi
  40393f:	5d                   	pop    ebp
  403940:	c3                   	ret    
  403941:	c7 43 08 ff ff ff ff 	mov    DWORD PTR [ebx+0x8],0xffffffff
  403948:	e9 7b ff ff ff       	jmp    4038c8 <___pformat_wputchars+0x58>
  40394d:	83 e8 01             	sub    eax,0x1
  403950:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  403953:	89 da                	mov    edx,ebx
  403955:	b8 20 00 00 00       	mov    eax,0x20
  40395a:	e8 b1 fe ff ff       	call   403810 <___pformat_putc>
  40395f:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403962:	8d 50 ff             	lea    edx,[eax-0x1]
  403965:	85 c0                	test   eax,eax
  403967:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  40396a:	75 e7                	jne    403953 <___pformat_wputchars+0xe3>
  40396c:	e9 57 ff ff ff       	jmp    4038c8 <___pformat_wputchars+0x58>
  403971:	89 c6                	mov    esi,eax
  403973:	e9 32 ff ff ff       	jmp    4038aa <___pformat_wputchars+0x3a>
  403978:	90                   	nop
  403979:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00403980 <___pformat_putchars>:
  403980:	57                   	push   edi
  403981:	89 c7                	mov    edi,eax
  403983:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
  403986:	56                   	push   esi
  403987:	89 d6                	mov    esi,edx
  403989:	53                   	push   ebx
  40398a:	89 cb                	mov    ebx,ecx
  40398c:	85 c0                	test   eax,eax
  40398e:	78 08                	js     403998 <___pformat_putchars+0x18>
  403990:	39 c2                	cmp    edx,eax
  403992:	0f 8f 88 00 00 00    	jg     403a20 <___pformat_putchars+0xa0>
  403998:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  40399b:	39 c6                	cmp    esi,eax
  40399d:	7d 71                	jge    403a10 <___pformat_putchars+0x90>
  40399f:	29 f0                	sub    eax,esi
  4039a1:	85 c0                	test   eax,eax
  4039a3:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  4039a6:	7e 25                	jle    4039cd <___pformat_putchars+0x4d>
  4039a8:	f6 43 05 04          	test   BYTE PTR [ebx+0x5],0x4
  4039ac:	75 1f                	jne    4039cd <___pformat_putchars+0x4d>
  4039ae:	83 e8 01             	sub    eax,0x1
  4039b1:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  4039b4:	89 da                	mov    edx,ebx
  4039b6:	b8 20 00 00 00       	mov    eax,0x20
  4039bb:	e8 50 fe ff ff       	call   403810 <___pformat_putc>
  4039c0:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4039c3:	8d 50 ff             	lea    edx,[eax-0x1]
  4039c6:	85 c0                	test   eax,eax
  4039c8:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  4039cb:	75 e7                	jne    4039b4 <___pformat_putchars+0x34>
  4039cd:	85 f6                	test   esi,esi
  4039cf:	74 2c                	je     4039fd <___pformat_putchars+0x7d>
  4039d1:	83 c7 01             	add    edi,0x1
  4039d4:	0f be 47 ff          	movsx  eax,BYTE PTR [edi-0x1]
  4039d8:	89 da                	mov    edx,ebx
  4039da:	e8 31 fe ff ff       	call   403810 <___pformat_putc>
  4039df:	83 ee 01             	sub    esi,0x1
  4039e2:	75 ed                	jne    4039d1 <___pformat_putchars+0x51>
  4039e4:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4039e7:	8d 50 ff             	lea    edx,[eax-0x1]
  4039ea:	85 c0                	test   eax,eax
  4039ec:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  4039ef:	7e 19                	jle    403a0a <___pformat_putchars+0x8a>
  4039f1:	89 da                	mov    edx,ebx
  4039f3:	b8 20 00 00 00       	mov    eax,0x20
  4039f8:	e8 13 fe ff ff       	call   403810 <___pformat_putc>
  4039fd:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403a00:	8d 50 ff             	lea    edx,[eax-0x1]
  403a03:	85 c0                	test   eax,eax
  403a05:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403a08:	7f e7                	jg     4039f1 <___pformat_putchars+0x71>
  403a0a:	5b                   	pop    ebx
  403a0b:	5e                   	pop    esi
  403a0c:	5f                   	pop    edi
  403a0d:	c3                   	ret    
  403a0e:	66 90                	xchg   ax,ax
  403a10:	c7 43 08 ff ff ff ff 	mov    DWORD PTR [ebx+0x8],0xffffffff
  403a17:	eb b4                	jmp    4039cd <___pformat_putchars+0x4d>
  403a19:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  403a20:	89 c6                	mov    esi,eax
  403a22:	e9 71 ff ff ff       	jmp    403998 <___pformat_putchars+0x18>
  403a27:	89 f6                	mov    esi,esi
  403a29:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00403a30 <___pformat_emit_inf_or_nan>:
  403a30:	55                   	push   ebp
  403a31:	57                   	push   edi
  403a32:	56                   	push   esi
  403a33:	53                   	push   ebx
  403a34:	83 ec 1c             	sub    esp,0x1c
  403a37:	85 c0                	test   eax,eax
  403a39:	c7 41 0c ff ff ff ff 	mov    DWORD PTR [ecx+0xc],0xffffffff
  403a40:	74 3e                	je     403a80 <___pformat_emit_inf_or_nan+0x50>
  403a42:	8b 69 04             	mov    ebp,DWORD PTR [ecx+0x4]
  403a45:	8d 7c 24 0d          	lea    edi,[esp+0xd]
  403a49:	c6 44 24 0c 2d       	mov    BYTE PTR [esp+0xc],0x2d
  403a4e:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403a52:	83 e5 20             	and    ebp,0x20
  403a55:	31 f6                	xor    esi,esi
  403a57:	0f b6 1c 32          	movzx  ebx,BYTE PTR [edx+esi*1]
  403a5b:	83 e3 df             	and    ebx,0xffffffdf
  403a5e:	09 eb                	or     ebx,ebp
  403a60:	88 1c 37             	mov    BYTE PTR [edi+esi*1],bl
  403a63:	83 c6 01             	add    esi,0x1
  403a66:	83 fe 03             	cmp    esi,0x3
  403a69:	75 ec                	jne    403a57 <___pformat_emit_inf_or_nan+0x27>
  403a6b:	8d 57 03             	lea    edx,[edi+0x3]
  403a6e:	29 c2                	sub    edx,eax
  403a70:	e8 0b ff ff ff       	call   403980 <___pformat_putchars>
  403a75:	83 c4 1c             	add    esp,0x1c
  403a78:	5b                   	pop    ebx
  403a79:	5e                   	pop    esi
  403a7a:	5f                   	pop    edi
  403a7b:	5d                   	pop    ebp
  403a7c:	c3                   	ret    
  403a7d:	8d 76 00             	lea    esi,[esi+0x0]
  403a80:	8b 69 04             	mov    ebp,DWORD PTR [ecx+0x4]
  403a83:	f7 c5 00 01 00 00    	test   ebp,0x100
  403a89:	74 15                	je     403aa0 <___pformat_emit_inf_or_nan+0x70>
  403a8b:	c6 44 24 0c 2b       	mov    BYTE PTR [esp+0xc],0x2b
  403a90:	8d 7c 24 0d          	lea    edi,[esp+0xd]
  403a94:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403a98:	eb b8                	jmp    403a52 <___pformat_emit_inf_or_nan+0x22>
  403a9a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  403aa0:	f7 c5 40 00 00 00    	test   ebp,0x40
  403aa6:	74 0f                	je     403ab7 <___pformat_emit_inf_or_nan+0x87>
  403aa8:	c6 44 24 0c 20       	mov    BYTE PTR [esp+0xc],0x20
  403aad:	8d 7c 24 0d          	lea    edi,[esp+0xd]
  403ab1:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403ab5:	eb 9b                	jmp    403a52 <___pformat_emit_inf_or_nan+0x22>
  403ab7:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403abb:	89 c7                	mov    edi,eax
  403abd:	eb 93                	jmp    403a52 <___pformat_emit_inf_or_nan+0x22>
  403abf:	90                   	nop

00403ac0 <___pformat_int>:
  403ac0:	55                   	push   ebp
  403ac1:	89 e5                	mov    ebp,esp
  403ac3:	57                   	push   edi
  403ac4:	89 d7                	mov    edi,edx
  403ac6:	56                   	push   esi
  403ac7:	89 c6                	mov    esi,eax
  403ac9:	53                   	push   ebx
  403aca:	89 cb                	mov    ebx,ecx
  403acc:	83 ec 2c             	sub    esp,0x2c
  403acf:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
  403ad2:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  403ad5:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  403ad8:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  403adb:	89 d0                	mov    eax,edx
  403add:	c1 f8 1f             	sar    eax,0x1f
  403ae0:	f7 d0                	not    eax
  403ae2:	21 d0                	and    eax,edx
  403ae4:	83 c0 17             	add    eax,0x17
  403ae7:	39 c8                	cmp    eax,ecx
  403ae9:	7d 02                	jge    403aed <___pformat_int+0x2d>
  403aeb:	89 c8                	mov    eax,ecx
  403aed:	83 c0 0f             	add    eax,0xf
  403af0:	83 e0 f0             	and    eax,0xfffffff0
  403af3:	e8 a8 e5 ff ff       	call   4020a0 <___chkstk_ms>
  403af8:	29 c4                	sub    esp,eax
  403afa:	8d 44 24 10          	lea    eax,[esp+0x10]
  403afe:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  403b01:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  403b04:	a8 80                	test   al,0x80
  403b06:	74 0d                	je     403b15 <___pformat_int+0x55>
  403b08:	85 ff                	test   edi,edi
  403b0a:	0f 88 b0 01 00 00    	js     403cc0 <___pformat_int+0x200>
  403b10:	24 7f                	and    al,0x7f
  403b12:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
  403b15:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  403b18:	8b 7d d8             	mov    edi,DWORD PTR [ebp-0x28]
  403b1b:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
  403b1e:	89 c8                	mov    eax,ecx
  403b20:	09 f8                	or     eax,edi
  403b22:	74 5d                	je     403b81 <___pformat_int+0xc1>
  403b24:	89 5d d8             	mov    DWORD PTR [ebp-0x28],ebx
  403b27:	89 cb                	mov    ebx,ecx
  403b29:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  403b30:	89 3c 24             	mov    DWORD PTR [esp],edi
  403b33:	83 c6 01             	add    esi,0x1
  403b36:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  403b3a:	c7 44 24 08 0a 00 00 	mov    DWORD PTR [esp+0x8],0xa
  403b41:	00 
  403b42:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  403b49:	00 
  403b4a:	e8 f1 46 00 00       	call   408240 <___umoddi3>
  403b4f:	83 c0 30             	add    eax,0x30
  403b52:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  403b55:	89 3c 24             	mov    DWORD PTR [esp],edi
  403b58:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  403b5c:	c7 44 24 08 0a 00 00 	mov    DWORD PTR [esp+0x8],0xa
  403b63:	00 
  403b64:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  403b6b:	00 
  403b6c:	e8 1f 48 00 00       	call   408390 <___udivdi3>
  403b71:	89 c7                	mov    edi,eax
  403b73:	89 d0                	mov    eax,edx
  403b75:	09 f8                	or     eax,edi
  403b77:	89 d3                	mov    ebx,edx
  403b79:	75 b5                	jne    403b30 <___pformat_int+0x70>
  403b7b:	8b 5d d8             	mov    ebx,DWORD PTR [ebp-0x28]
  403b7e:	8b 53 0c             	mov    edx,DWORD PTR [ebx+0xc]
  403b81:	85 d2                	test   edx,edx
  403b83:	89 f7                	mov    edi,esi
  403b85:	7e 19                	jle    403ba0 <___pformat_int+0xe0>
  403b87:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403b8a:	29 f0                	sub    eax,esi
  403b8c:	01 c2                	add    edx,eax
  403b8e:	85 d2                	test   edx,edx
  403b90:	7e 0e                	jle    403ba0 <___pformat_int+0xe0>
  403b92:	8d 3c 16             	lea    edi,[esi+edx*1]
  403b95:	83 c6 01             	add    esi,0x1
  403b98:	39 fe                	cmp    esi,edi
  403b9a:	c6 46 ff 30          	mov    BYTE PTR [esi-0x1],0x30
  403b9e:	75 f5                	jne    403b95 <___pformat_int+0xd5>
  403ba0:	3b 7d e4             	cmp    edi,DWORD PTR [ebp-0x1c]
  403ba3:	0f 84 29 01 00 00    	je     403cd2 <___pformat_int+0x212>
  403ba9:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403bac:	85 c0                	test   eax,eax
  403bae:	7e 59                	jle    403c09 <___pformat_int+0x149>
  403bb0:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  403bb3:	29 fa                	sub    edx,edi
  403bb5:	01 c2                	add    edx,eax
  403bb7:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  403bba:	85 d2                	test   edx,edx
  403bbc:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403bbf:	7e 4b                	jle    403c0c <___pformat_int+0x14c>
  403bc1:	a9 c0 01 00 00       	test   eax,0x1c0
  403bc6:	74 06                	je     403bce <___pformat_int+0x10e>
  403bc8:	83 ea 01             	sub    edx,0x1
  403bcb:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403bce:	8b 53 0c             	mov    edx,DWORD PTR [ebx+0xc]
  403bd1:	85 d2                	test   edx,edx
  403bd3:	0f 88 a7 00 00 00    	js     403c80 <___pformat_int+0x1c0>
  403bd9:	f6 c4 04             	test   ah,0x4
  403bdc:	75 2e                	jne    403c0c <___pformat_int+0x14c>
  403bde:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  403be1:	8d 4a ff             	lea    ecx,[edx-0x1]
  403be4:	85 d2                	test   edx,edx
  403be6:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  403be9:	7e 21                	jle    403c0c <___pformat_int+0x14c>
  403beb:	90                   	nop
  403bec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403bf0:	89 da                	mov    edx,ebx
  403bf2:	b8 20 00 00 00       	mov    eax,0x20
  403bf7:	e8 14 fc ff ff       	call   403810 <___pformat_putc>
  403bfc:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403bff:	8d 50 ff             	lea    edx,[eax-0x1]
  403c02:	85 c0                	test   eax,eax
  403c04:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403c07:	7f e7                	jg     403bf0 <___pformat_int+0x130>
  403c09:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  403c0c:	a8 80                	test   al,0x80
  403c0e:	74 51                	je     403c61 <___pformat_int+0x1a1>
  403c10:	8d 77 01             	lea    esi,[edi+0x1]
  403c13:	c6 07 2d             	mov    BYTE PTR [edi],0x2d
  403c16:	39 75 e4             	cmp    DWORD PTR [ebp-0x1c],esi
  403c19:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
  403c1c:	73 2e                	jae    403c4c <___pformat_int+0x18c>
  403c1e:	66 90                	xchg   ax,ax
  403c20:	83 ee 01             	sub    esi,0x1
  403c23:	0f be 06             	movsx  eax,BYTE PTR [esi]
  403c26:	89 da                	mov    edx,ebx
  403c28:	e8 e3 fb ff ff       	call   403810 <___pformat_putc>
  403c2d:	39 fe                	cmp    esi,edi
  403c2f:	75 ef                	jne    403c20 <___pformat_int+0x160>
  403c31:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403c34:	8d 50 ff             	lea    edx,[eax-0x1]
  403c37:	85 c0                	test   eax,eax
  403c39:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403c3c:	7e 1b                	jle    403c59 <___pformat_int+0x199>
  403c3e:	66 90                	xchg   ax,ax
  403c40:	89 da                	mov    edx,ebx
  403c42:	b8 20 00 00 00       	mov    eax,0x20
  403c47:	e8 c4 fb ff ff       	call   403810 <___pformat_putc>
  403c4c:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403c4f:	8d 50 ff             	lea    edx,[eax-0x1]
  403c52:	85 c0                	test   eax,eax
  403c54:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403c57:	7f e7                	jg     403c40 <___pformat_int+0x180>
  403c59:	8d 65 f4             	lea    esp,[ebp-0xc]
  403c5c:	5b                   	pop    ebx
  403c5d:	5e                   	pop    esi
  403c5e:	5f                   	pop    edi
  403c5f:	5d                   	pop    ebp
  403c60:	c3                   	ret    
  403c61:	f6 c4 01             	test   ah,0x1
  403c64:	74 0a                	je     403c70 <___pformat_int+0x1b0>
  403c66:	8d 77 01             	lea    esi,[edi+0x1]
  403c69:	c6 07 2b             	mov    BYTE PTR [edi],0x2b
  403c6c:	eb a8                	jmp    403c16 <___pformat_int+0x156>
  403c6e:	66 90                	xchg   ax,ax
  403c70:	a8 40                	test   al,0x40
  403c72:	89 fe                	mov    esi,edi
  403c74:	74 a0                	je     403c16 <___pformat_int+0x156>
  403c76:	83 c6 01             	add    esi,0x1
  403c79:	c6 07 20             	mov    BYTE PTR [edi],0x20
  403c7c:	eb 98                	jmp    403c16 <___pformat_int+0x156>
  403c7e:	66 90                	xchg   ax,ax
  403c80:	89 c2                	mov    edx,eax
  403c82:	81 e2 00 06 00 00    	and    edx,0x600
  403c88:	81 fa 00 02 00 00    	cmp    edx,0x200
  403c8e:	0f 85 45 ff ff ff    	jne    403bd9 <___pformat_int+0x119>
  403c94:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  403c97:	8d 4a ff             	lea    ecx,[edx-0x1]
  403c9a:	85 d2                	test   edx,edx
  403c9c:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  403c9f:	0f 8e 67 ff ff ff    	jle    403c0c <___pformat_int+0x14c>
  403ca5:	83 c7 01             	add    edi,0x1
  403ca8:	c6 47 ff 30          	mov    BYTE PTR [edi-0x1],0x30
  403cac:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403caf:	8d 50 ff             	lea    edx,[eax-0x1]
  403cb2:	85 c0                	test   eax,eax
  403cb4:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403cb7:	7f ec                	jg     403ca5 <___pformat_int+0x1e5>
  403cb9:	e9 4b ff ff ff       	jmp    403c09 <___pformat_int+0x149>
  403cbe:	66 90                	xchg   ax,ax
  403cc0:	f7 de                	neg    esi
  403cc2:	83 d7 00             	adc    edi,0x0
  403cc5:	f7 df                	neg    edi
  403cc7:	89 75 d8             	mov    DWORD PTR [ebp-0x28],esi
  403cca:	89 7d dc             	mov    DWORD PTR [ebp-0x24],edi
  403ccd:	e9 43 fe ff ff       	jmp    403b15 <___pformat_int+0x55>
  403cd2:	8b 4b 0c             	mov    ecx,DWORD PTR [ebx+0xc]
  403cd5:	85 c9                	test   ecx,ecx
  403cd7:	0f 84 cc fe ff ff    	je     403ba9 <___pformat_int+0xe9>
  403cdd:	c6 07 30             	mov    BYTE PTR [edi],0x30
  403ce0:	83 c7 01             	add    edi,0x1
  403ce3:	e9 c1 fe ff ff       	jmp    403ba9 <___pformat_int+0xe9>
  403ce8:	90                   	nop
  403ce9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00403cf0 <___pformat_xint>:
  403cf0:	55                   	push   ebp
  403cf1:	89 e5                	mov    ebp,esp
  403cf3:	57                   	push   edi
  403cf4:	89 cf                	mov    edi,ecx
  403cf6:	56                   	push   esi
  403cf7:	89 d6                	mov    esi,edx
  403cf9:	53                   	push   ebx
  403cfa:	83 ec 2c             	sub    esp,0x2c
  403cfd:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
  403d00:	31 d2                	xor    edx,edx
  403d02:	83 f8 6f             	cmp    eax,0x6f
  403d05:	0f 94 c2             	sete   dl
  403d08:	83 ea 01             	sub    edx,0x1
  403d0b:	83 e2 fa             	and    edx,0xfffffffa
  403d0e:	89 4d d4             	mov    DWORD PTR [ebp-0x2c],ecx
  403d11:	31 c9                	xor    ecx,ecx
  403d13:	83 f8 6f             	cmp    eax,0x6f
  403d16:	0f 95 c1             	setne  cl
  403d19:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  403d1c:	89 c8                	mov    eax,ecx
  403d1e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  403d21:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403d24:	8d 1c cd 07 00 00 00 	lea    ebx,[ecx*8+0x7]
  403d2b:	89 5d d0             	mov    DWORD PTR [ebp-0x30],ebx
  403d2e:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  403d31:	83 45 e4 03          	add    DWORD PTR [ebp-0x1c],0x3
  403d35:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  403d38:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  403d3b:	89 d8                	mov    eax,ebx
  403d3d:	c1 f8 1f             	sar    eax,0x1f
  403d40:	f7 d0                	not    eax
  403d42:	21 d8                	and    eax,ebx
  403d44:	8d 44 02 18          	lea    eax,[edx+eax*1+0x18]
  403d48:	39 c8                	cmp    eax,ecx
  403d4a:	7d 02                	jge    403d4e <___pformat_xint+0x5e>
  403d4c:	89 c8                	mov    eax,ecx
  403d4e:	83 c0 0f             	add    eax,0xf
  403d51:	83 e0 f0             	and    eax,0xfffffff0
  403d54:	e8 47 e3 ff ff       	call   4020a0 <___chkstk_ms>
  403d59:	29 c4                	sub    esp,eax
  403d5b:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  403d5e:	0b 45 dc             	or     eax,DWORD PTR [ebp-0x24]
  403d61:	89 65 e0             	mov    DWORD PTR [ebp-0x20],esp
  403d64:	0f 84 4a 02 00 00    	je     403fb4 <___pformat_xint+0x2c4>
  403d6a:	0f b6 4d d8          	movzx  ecx,BYTE PTR [ebp-0x28]
  403d6e:	89 e0                	mov    eax,esp
  403d70:	0f b6 5d d0          	movzx  ebx,BYTE PTR [ebp-0x30]
  403d74:	83 e1 20             	and    ecx,0x20
  403d77:	88 4d dc             	mov    BYTE PTR [ebp-0x24],cl
  403d7a:	eb 1f                	jmp    403d9b <___pformat_xint+0xab>
  403d7c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403d80:	88 48 ff             	mov    BYTE PTR [eax-0x1],cl
  403d83:	0f b6 4d e4          	movzx  ecx,BYTE PTR [ebp-0x1c]
  403d87:	0f ad fe             	shrd   esi,edi,cl
  403d8a:	d3 ef                	shr    edi,cl
  403d8c:	f6 c1 20             	test   cl,0x20
  403d8f:	74 04                	je     403d95 <___pformat_xint+0xa5>
  403d91:	89 fe                	mov    esi,edi
  403d93:	31 ff                	xor    edi,edi
  403d95:	89 f9                	mov    ecx,edi
  403d97:	09 f1                	or     ecx,esi
  403d99:	74 1a                	je     403db5 <___pformat_xint+0xc5>
  403d9b:	89 f2                	mov    edx,esi
  403d9d:	83 c0 01             	add    eax,0x1
  403da0:	21 da                	and    edx,ebx
  403da2:	8d 4a 30             	lea    ecx,[edx+0x30]
  403da5:	80 f9 39             	cmp    cl,0x39
  403da8:	7e d6                	jle    403d80 <___pformat_xint+0x90>
  403daa:	83 c2 37             	add    edx,0x37
  403dad:	0a 55 dc             	or     dl,BYTE PTR [ebp-0x24]
  403db0:	88 50 ff             	mov    BYTE PTR [eax-0x1],dl
  403db3:	eb ce                	jmp    403d83 <___pformat_xint+0x93>
  403db5:	39 45 e0             	cmp    DWORD PTR [ebp-0x20],eax
  403db8:	0f 84 f0 01 00 00    	je     403fae <___pformat_xint+0x2be>
  403dbe:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  403dc1:	8b 5f 0c             	mov    ebx,DWORD PTR [edi+0xc]
  403dc4:	85 db                	test   ebx,ebx
  403dc6:	0f 8e a5 01 00 00    	jle    403f71 <___pformat_xint+0x281>
  403dcc:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
  403dcf:	29 c1                	sub    ecx,eax
  403dd1:	01 cb                	add    ebx,ecx
  403dd3:	85 db                	test   ebx,ebx
  403dd5:	0f 8e 96 01 00 00    	jle    403f71 <___pformat_xint+0x281>
  403ddb:	8d 3c 18             	lea    edi,[eax+ebx*1]
  403dde:	66 90                	xchg   ax,ax
  403de0:	83 c0 01             	add    eax,0x1
  403de3:	39 f8                	cmp    eax,edi
  403de5:	c6 40 ff 30          	mov    BYTE PTR [eax-0x1],0x30
  403de9:	75 f5                	jne    403de0 <___pformat_xint+0xf0>
  403deb:	3b 7d e0             	cmp    edi,DWORD PTR [ebp-0x20]
  403dee:	0f 84 a1 01 00 00    	je     403f95 <___pformat_xint+0x2a5>
  403df4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403df7:	8b 70 08             	mov    esi,DWORD PTR [eax+0x8]
  403dfa:	89 f8                	mov    eax,edi
  403dfc:	2b 45 e0             	sub    eax,DWORD PTR [ebp-0x20]
  403dff:	39 c6                	cmp    esi,eax
  403e01:	0f 8e a9 00 00 00    	jle    403eb0 <___pformat_xint+0x1c0>
  403e07:	29 c6                	sub    esi,eax
  403e09:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e0c:	85 f6                	test   esi,esi
  403e0e:	89 70 08             	mov    DWORD PTR [eax+0x8],esi
  403e11:	7e 21                	jle    403e34 <___pformat_xint+0x144>
  403e13:	83 7d d8 6f          	cmp    DWORD PTR [ebp-0x28],0x6f
  403e17:	74 0d                	je     403e26 <___pformat_xint+0x136>
  403e19:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e1c:	f6 40 05 08          	test   BYTE PTR [eax+0x5],0x8
  403e20:	0f 85 00 01 00 00    	jne    403f26 <___pformat_xint+0x236>
  403e26:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e29:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  403e2c:	85 db                	test   ebx,ebx
  403e2e:	0f 88 09 01 00 00    	js     403f3d <___pformat_xint+0x24d>
  403e34:	8d 46 ff             	lea    eax,[esi-0x1]
  403e37:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  403e3a:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403e3d:	83 7d d8 6f          	cmp    DWORD PTR [ebp-0x28],0x6f
  403e41:	89 c3                	mov    ebx,eax
  403e43:	74 0d                	je     403e52 <___pformat_xint+0x162>
  403e45:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e48:	f6 40 05 08          	test   BYTE PTR [eax+0x5],0x8
  403e4c:	0f 85 be 00 00 00    	jne    403f10 <___pformat_xint+0x220>
  403e52:	85 f6                	test   esi,esi
  403e54:	7e 09                	jle    403e5f <___pformat_xint+0x16f>
  403e56:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e59:	f6 40 05 04          	test   BYTE PTR [eax+0x5],0x4
  403e5d:	74 71                	je     403ed0 <___pformat_xint+0x1e0>
  403e5f:	3b 7d e0             	cmp    edi,DWORD PTR [ebp-0x20]
  403e62:	76 25                	jbe    403e89 <___pformat_xint+0x199>
  403e64:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
  403e67:	8b 75 e0             	mov    esi,DWORD PTR [ebp-0x20]
  403e6a:	89 5d e0             	mov    DWORD PTR [ebp-0x20],ebx
  403e6d:	89 fb                	mov    ebx,edi
  403e6f:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  403e72:	83 eb 01             	sub    ebx,0x1
  403e75:	0f be 03             	movsx  eax,BYTE PTR [ebx]
  403e78:	89 fa                	mov    edx,edi
  403e7a:	e8 91 f9 ff ff       	call   403810 <___pformat_putc>
  403e7f:	39 f3                	cmp    ebx,esi
  403e81:	75 ef                	jne    403e72 <___pformat_xint+0x182>
  403e83:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
  403e86:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  403e89:	85 f6                	test   esi,esi
  403e8b:	7e 19                	jle    403ea6 <___pformat_xint+0x1b6>
  403e8d:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  403e90:	b8 20 00 00 00       	mov    eax,0x20
  403e95:	83 eb 01             	sub    ebx,0x1
  403e98:	89 f2                	mov    edx,esi
  403e9a:	e8 71 f9 ff ff       	call   403810 <___pformat_putc>
  403e9f:	8d 43 01             	lea    eax,[ebx+0x1]
  403ea2:	85 c0                	test   eax,eax
  403ea4:	7f ea                	jg     403e90 <___pformat_xint+0x1a0>
  403ea6:	8d 65 f4             	lea    esp,[ebp-0xc]
  403ea9:	5b                   	pop    ebx
  403eaa:	5e                   	pop    esi
  403eab:	5f                   	pop    edi
  403eac:	5d                   	pop    ebp
  403ead:	c3                   	ret    
  403eae:	66 90                	xchg   ax,ax
  403eb0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403eb3:	be ff ff ff ff       	mov    esi,0xffffffff
  403eb8:	c7 45 e4 fe ff ff ff 	mov    DWORD PTR [ebp-0x1c],0xfffffffe
  403ebf:	c7 40 08 ff ff ff ff 	mov    DWORD PTR [eax+0x8],0xffffffff
  403ec6:	e9 6f ff ff ff       	jmp    403e3a <___pformat_xint+0x14a>
  403ecb:	90                   	nop
  403ecc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403ed0:	8b 5d e4             	mov    ebx,DWORD PTR [ebp-0x1c]
  403ed3:	89 c6                	mov    esi,eax
  403ed5:	b8 20 00 00 00       	mov    eax,0x20
  403eda:	83 eb 01             	sub    ebx,0x1
  403edd:	89 f2                	mov    edx,esi
  403edf:	e8 2c f9 ff ff       	call   403810 <___pformat_putc>
  403ee4:	8d 43 01             	lea    eax,[ebx+0x1]
  403ee7:	85 c0                	test   eax,eax
  403ee9:	7f ea                	jg     403ed5 <___pformat_xint+0x1e5>
  403eeb:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  403eee:	89 c8                	mov    eax,ecx
  403ef0:	c1 f8 1f             	sar    eax,0x1f
  403ef3:	f7 d0                	not    eax
  403ef5:	8d 71 ff             	lea    esi,[ecx-0x1]
  403ef8:	21 c8                	and    eax,ecx
  403efa:	29 c6                	sub    esi,eax
  403efc:	8d 5e ff             	lea    ebx,[esi-0x1]
  403eff:	e9 5b ff ff ff       	jmp    403e5f <___pformat_xint+0x16f>
  403f04:	83 ee 03             	sub    esi,0x3
  403f07:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
  403f0a:	89 c6                	mov    esi,eax
  403f0c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403f10:	0f b6 45 d8          	movzx  eax,BYTE PTR [ebp-0x28]
  403f14:	83 c7 02             	add    edi,0x2
  403f17:	c6 47 ff 30          	mov    BYTE PTR [edi-0x1],0x30
  403f1b:	8b 5d e4             	mov    ebx,DWORD PTR [ebp-0x1c]
  403f1e:	88 47 fe             	mov    BYTE PTR [edi-0x2],al
  403f21:	e9 2c ff ff ff       	jmp    403e52 <___pformat_xint+0x162>
  403f26:	8d 46 fe             	lea    eax,[esi-0x2]
  403f29:	85 c0                	test   eax,eax
  403f2b:	7e d7                	jle    403f04 <___pformat_xint+0x214>
  403f2d:	89 c6                	mov    esi,eax
  403f2f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403f32:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  403f35:	85 db                	test   ebx,ebx
  403f37:	0f 89 f7 fe ff ff    	jns    403e34 <___pformat_xint+0x144>
  403f3d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403f40:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  403f43:	25 00 06 00 00       	and    eax,0x600
  403f48:	3d 00 02 00 00       	cmp    eax,0x200
  403f4d:	0f 85 e1 fe ff ff    	jne    403e34 <___pformat_xint+0x144>
  403f53:	01 fe                	add    esi,edi
  403f55:	83 c7 01             	add    edi,0x1
  403f58:	39 f7                	cmp    edi,esi
  403f5a:	c6 47 ff 30          	mov    BYTE PTR [edi-0x1],0x30
  403f5e:	75 f5                	jne    403f55 <___pformat_xint+0x265>
  403f60:	c7 45 e4 fe ff ff ff 	mov    DWORD PTR [ebp-0x1c],0xfffffffe
  403f67:	be ff ff ff ff       	mov    esi,0xffffffff
  403f6c:	e9 c9 fe ff ff       	jmp    403e3a <___pformat_xint+0x14a>
  403f71:	83 7d d8 6f          	cmp    DWORD PTR [ebp-0x28],0x6f
  403f75:	89 c7                	mov    edi,eax
  403f77:	0f 85 6e fe ff ff    	jne    403deb <___pformat_xint+0xfb>
  403f7d:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  403f80:	f6 46 05 08          	test   BYTE PTR [esi+0x5],0x8
  403f84:	0f 84 61 fe ff ff    	je     403deb <___pformat_xint+0xfb>
  403f8a:	83 c7 01             	add    edi,0x1
  403f8d:	c6 00 30             	mov    BYTE PTR [eax],0x30
  403f90:	e9 56 fe ff ff       	jmp    403deb <___pformat_xint+0xfb>
  403f95:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403f98:	8b 70 0c             	mov    esi,DWORD PTR [eax+0xc]
  403f9b:	85 f6                	test   esi,esi
  403f9d:	0f 84 51 fe ff ff    	je     403df4 <___pformat_xint+0x104>
  403fa3:	c6 07 30             	mov    BYTE PTR [edi],0x30
  403fa6:	83 c7 01             	add    edi,0x1
  403fa9:	e9 46 fe ff ff       	jmp    403df4 <___pformat_xint+0x104>
  403fae:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403fb1:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  403fb4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403fb7:	81 60 04 ff f7 ff ff 	and    DWORD PTR [eax+0x4],0xfffff7ff
  403fbe:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  403fc1:	e9 fe fd ff ff       	jmp    403dc4 <___pformat_xint+0xd4>
  403fc6:	8d 76 00             	lea    esi,[esi+0x0]
  403fc9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00403fd0 <___pformat_emit_float>:
  403fd0:	55                   	push   ebp
  403fd1:	89 e5                	mov    ebp,esp
  403fd3:	57                   	push   edi
  403fd4:	56                   	push   esi
  403fd5:	89 d6                	mov    esi,edx
  403fd7:	53                   	push   ebx
  403fd8:	89 cb                	mov    ebx,ecx
  403fda:	83 ec 3c             	sub    esp,0x3c
  403fdd:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  403fe0:	85 c9                	test   ecx,ecx
  403fe2:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  403fe5:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  403fe8:	0f 8e 7a 02 00 00    	jle    404268 <___pformat_emit_float+0x298>
  403fee:	39 c1                	cmp    ecx,eax
  403ff0:	0f 8d 3a 01 00 00    	jge    404130 <___pformat_emit_float+0x160>
  403ff6:	29 c8                	sub    eax,ecx
  403ff8:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  403ffb:	85 c0                	test   eax,eax
  403ffd:	0f 88 2d 01 00 00    	js     404130 <___pformat_emit_float+0x160>
  404003:	8b 57 0c             	mov    edx,DWORD PTR [edi+0xc]
  404006:	39 c2                	cmp    edx,eax
  404008:	0f 8d 22 01 00 00    	jge    404130 <___pformat_emit_float+0x160>
  40400e:	29 d0                	sub    eax,edx
  404010:	85 c0                	test   eax,eax
  404012:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  404015:	0f 8e 1c 01 00 00    	jle    404137 <___pformat_emit_float+0x167>
  40401b:	85 d2                	test   edx,edx
  40401d:	0f 8e ad 02 00 00    	jle    4042d0 <___pformat_emit_float+0x300>
  404023:	83 e8 01             	sub    eax,0x1
  404026:	85 c0                	test   eax,eax
  404028:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  40402b:	0f 84 06 01 00 00    	je     404137 <___pformat_emit_float+0x167>
  404031:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404034:	85 d2                	test   edx,edx
  404036:	0f 85 ba 01 00 00    	jne    4041f6 <___pformat_emit_float+0x226>
  40403c:	8b 57 04             	mov    edx,DWORD PTR [edi+0x4]
  40403f:	f7 c2 c0 01 00 00    	test   edx,0x1c0
  404045:	0f 85 ab 01 00 00    	jne    4041f6 <___pformat_emit_float+0x226>
  40404b:	80 e6 06             	and    dh,0x6
  40404e:	0f 85 e3 00 00 00    	jne    404137 <___pformat_emit_float+0x167>
  404054:	eb 0c                	jmp    404062 <___pformat_emit_float+0x92>
  404056:	89 fa                	mov    edx,edi
  404058:	b8 20 00 00 00       	mov    eax,0x20
  40405d:	e8 ae f7 ff ff       	call   403810 <___pformat_putc>
  404062:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404065:	8d 50 ff             	lea    edx,[eax-0x1]
  404068:	85 c0                	test   eax,eax
  40406a:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  40406d:	7f e7                	jg     404056 <___pformat_emit_float+0x86>
  40406f:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  404072:	85 c0                	test   eax,eax
  404074:	0f 84 c8 00 00 00    	je     404142 <___pformat_emit_float+0x172>
  40407a:	89 fa                	mov    edx,edi
  40407c:	b8 2d 00 00 00       	mov    eax,0x2d
  404081:	e8 8a f7 ff ff       	call   403810 <___pformat_putc>
  404086:	8b 57 08             	mov    edx,DWORD PTR [edi+0x8]
  404089:	85 d2                	test   edx,edx
  40408b:	7e 13                	jle    4040a0 <___pformat_emit_float+0xd0>
  40408d:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404090:	25 00 06 00 00       	and    eax,0x600
  404095:	3d 00 02 00 00       	cmp    eax,0x200
  40409a:	0f 84 f1 01 00 00    	je     404291 <___pformat_emit_float+0x2c1>
  4040a0:	85 db                	test   ebx,ebx
  4040a2:	0f 8e 10 02 00 00    	jle    4042b8 <___pformat_emit_float+0x2e8>
  4040a8:	0f b6 16             	movzx  edx,BYTE PTR [esi]
  4040ab:	b8 30 00 00 00       	mov    eax,0x30
  4040b0:	84 d2                	test   dl,dl
  4040b2:	74 06                	je     4040ba <___pformat_emit_float+0xea>
  4040b4:	83 c6 01             	add    esi,0x1
  4040b7:	0f be c2             	movsx  eax,dl
  4040ba:	89 fa                	mov    edx,edi
  4040bc:	e8 4f f7 ff ff       	call   403810 <___pformat_putc>
  4040c1:	83 eb 01             	sub    ebx,0x1
  4040c4:	75 e2                	jne    4040a8 <___pformat_emit_float+0xd8>
  4040c6:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  4040c9:	85 c0                	test   eax,eax
  4040cb:	0f 8e 3f 01 00 00    	jle    404210 <___pformat_emit_float+0x240>
  4040d1:	83 7f 10 fd          	cmp    DWORD PTR [edi+0x10],0xfffffffd
  4040d5:	0f 84 49 01 00 00    	je     404224 <___pformat_emit_float+0x254>
  4040db:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  4040df:	66 85 d2             	test   dx,dx
  4040e2:	0f 85 7f 00 00 00    	jne    404167 <___pformat_emit_float+0x197>
  4040e8:	b8 2e 00 00 00       	mov    eax,0x2e
  4040ed:	89 fa                	mov    edx,edi
  4040ef:	e8 1c f7 ff ff       	call   403810 <___pformat_putc>
  4040f4:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  4040f7:	85 db                	test   ebx,ebx
  4040f9:	74 21                	je     40411c <___pformat_emit_float+0x14c>
  4040fb:	e9 d8 00 00 00       	jmp    4041d8 <___pformat_emit_float+0x208>
  404100:	0f b6 16             	movzx  edx,BYTE PTR [esi]
  404103:	b8 30 00 00 00       	mov    eax,0x30
  404108:	84 d2                	test   dl,dl
  40410a:	74 06                	je     404112 <___pformat_emit_float+0x142>
  40410c:	83 c6 01             	add    esi,0x1
  40410f:	0f be c2             	movsx  eax,dl
  404112:	89 fa                	mov    edx,edi
  404114:	e8 f7 f6 ff ff       	call   403810 <___pformat_putc>
  404119:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  40411c:	8d 50 ff             	lea    edx,[eax-0x1]
  40411f:	85 c0                	test   eax,eax
  404121:	89 57 0c             	mov    DWORD PTR [edi+0xc],edx
  404124:	7f da                	jg     404100 <___pformat_emit_float+0x130>
  404126:	8d 65 f4             	lea    esp,[ebp-0xc]
  404129:	5b                   	pop    ebx
  40412a:	5e                   	pop    esi
  40412b:	5f                   	pop    edi
  40412c:	5d                   	pop    ebp
  40412d:	c3                   	ret    
  40412e:	66 90                	xchg   ax,ax
  404130:	c7 47 08 ff ff ff ff 	mov    DWORD PTR [edi+0x8],0xffffffff
  404137:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  40413a:	85 c0                	test   eax,eax
  40413c:	0f 85 38 ff ff ff    	jne    40407a <___pformat_emit_float+0xaa>
  404142:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404145:	f6 c4 01             	test   ah,0x1
  404148:	0f 85 32 01 00 00    	jne    404280 <___pformat_emit_float+0x2b0>
  40414e:	a8 40                	test   al,0x40
  404150:	0f 84 30 ff ff ff    	je     404086 <___pformat_emit_float+0xb6>
  404156:	89 fa                	mov    edx,edi
  404158:	b8 20 00 00 00       	mov    eax,0x20
  40415d:	e8 ae f6 ff ff       	call   403810 <___pformat_putc>
  404162:	e9 1f ff ff ff       	jmp    404086 <___pformat_emit_float+0xb6>
  404167:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
  40416a:	89 65 d4             	mov    DWORD PTR [ebp-0x2c],esp
  40416d:	83 c0 0f             	add    eax,0xf
  404170:	83 e0 f0             	and    eax,0xfffffff0
  404173:	e8 28 df ff ff       	call   4020a0 <___chkstk_ms>
  404178:	29 c4                	sub    esp,eax
  40417a:	8d 4c 24 10          	lea    ecx,[esp+0x10]
  40417e:	8d 45 e4             	lea    eax,[ebp-0x1c]
  404181:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  404188:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40418c:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  404190:	89 0c 24             	mov    DWORD PTR [esp],ecx
  404193:	89 4d d0             	mov    DWORD PTR [ebp-0x30],ecx
  404196:	e8 b5 29 00 00       	call   406b50 <_wcrtomb>
  40419b:	85 c0                	test   eax,eax
  40419d:	0f 8e 42 01 00 00    	jle    4042e5 <___pformat_emit_float+0x315>
  4041a3:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
  4041a6:	89 5d cc             	mov    DWORD PTR [ebp-0x34],ebx
  4041a9:	89 75 d0             	mov    DWORD PTR [ebp-0x30],esi
  4041ac:	01 c8                	add    eax,ecx
  4041ae:	89 cb                	mov    ebx,ecx
  4041b0:	89 c6                	mov    esi,eax
  4041b2:	83 c3 01             	add    ebx,0x1
  4041b5:	0f be 43 ff          	movsx  eax,BYTE PTR [ebx-0x1]
  4041b9:	89 fa                	mov    edx,edi
  4041bb:	e8 50 f6 ff ff       	call   403810 <___pformat_putc>
  4041c0:	39 f3                	cmp    ebx,esi
  4041c2:	75 ee                	jne    4041b2 <___pformat_emit_float+0x1e2>
  4041c4:	8b 75 d0             	mov    esi,DWORD PTR [ebp-0x30]
  4041c7:	8b 5d cc             	mov    ebx,DWORD PTR [ebp-0x34]
  4041ca:	85 db                	test   ebx,ebx
  4041cc:	8b 65 d4             	mov    esp,DWORD PTR [ebp-0x2c]
  4041cf:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  4041d2:	0f 84 44 ff ff ff    	je     40411c <___pformat_emit_float+0x14c>
  4041d8:	01 d8                	add    eax,ebx
  4041da:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
  4041dd:	8d 76 00             	lea    esi,[esi+0x0]
  4041e0:	89 fa                	mov    edx,edi
  4041e2:	b8 30 00 00 00       	mov    eax,0x30
  4041e7:	e8 24 f6 ff ff       	call   403810 <___pformat_putc>
  4041ec:	83 c3 01             	add    ebx,0x1
  4041ef:	78 ef                	js     4041e0 <___pformat_emit_float+0x210>
  4041f1:	e9 23 ff ff ff       	jmp    404119 <___pformat_emit_float+0x149>
  4041f6:	83 e8 01             	sub    eax,0x1
  4041f9:	85 c0                	test   eax,eax
  4041fb:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  4041fe:	0f 84 33 ff ff ff    	je     404137 <___pformat_emit_float+0x167>
  404204:	8b 57 04             	mov    edx,DWORD PTR [edi+0x4]
  404207:	e9 3f fe ff ff       	jmp    40404b <___pformat_emit_float+0x7b>
  40420c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404210:	f6 47 05 08          	test   BYTE PTR [edi+0x5],0x8
  404214:	0f 84 dd fe ff ff    	je     4040f7 <___pformat_emit_float+0x127>
  40421a:	83 7f 10 fd          	cmp    DWORD PTR [edi+0x10],0xfffffffd
  40421e:	0f 85 b7 fe ff ff    	jne    4040db <___pformat_emit_float+0x10b>
  404224:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  40422b:	e8 40 3f 00 00       	call   408170 <_localeconv>
  404230:	8d 55 e4             	lea    edx,[ebp-0x1c]
  404233:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  404237:	c7 44 24 08 10 00 00 	mov    DWORD PTR [esp+0x8],0x10
  40423e:	00 
  40423f:	8b 00                	mov    eax,DWORD PTR [eax]
  404241:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  404245:	8d 45 e2             	lea    eax,[ebp-0x1e]
  404248:	89 04 24             	mov    DWORD PTR [esp],eax
  40424b:	e8 50 2c 00 00       	call   406ea0 <_mbrtowc>
  404250:	85 c0                	test   eax,eax
  404252:	0f 8e 9e 00 00 00    	jle    4042f6 <___pformat_emit_float+0x326>
  404258:	0f b7 55 e2          	movzx  edx,WORD PTR [ebp-0x1e]
  40425c:	66 89 57 14          	mov    WORD PTR [edi+0x14],dx
  404260:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
  404263:	e9 77 fe ff ff       	jmp    4040df <___pformat_emit_float+0x10f>
  404268:	85 c0                	test   eax,eax
  40426a:	0f 8e 8b fd ff ff    	jle    403ffb <___pformat_emit_float+0x2b>
  404270:	83 e8 01             	sub    eax,0x1
  404273:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  404276:	e9 88 fd ff ff       	jmp    404003 <___pformat_emit_float+0x33>
  40427b:	90                   	nop
  40427c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404280:	89 fa                	mov    edx,edi
  404282:	b8 2b 00 00 00       	mov    eax,0x2b
  404287:	e8 84 f5 ff ff       	call   403810 <___pformat_putc>
  40428c:	e9 f5 fd ff ff       	jmp    404086 <___pformat_emit_float+0xb6>
  404291:	83 ea 01             	sub    edx,0x1
  404294:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  404297:	89 fa                	mov    edx,edi
  404299:	b8 30 00 00 00       	mov    eax,0x30
  40429e:	e8 6d f5 ff ff       	call   403810 <___pformat_putc>
  4042a3:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  4042a6:	8d 50 ff             	lea    edx,[eax-0x1]
  4042a9:	85 c0                	test   eax,eax
  4042ab:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  4042ae:	7f e7                	jg     404297 <___pformat_emit_float+0x2c7>
  4042b0:	85 db                	test   ebx,ebx
  4042b2:	0f 8f f0 fd ff ff    	jg     4040a8 <___pformat_emit_float+0xd8>
  4042b8:	89 fa                	mov    edx,edi
  4042ba:	b8 30 00 00 00       	mov    eax,0x30
  4042bf:	e8 4c f5 ff ff       	call   403810 <___pformat_putc>
  4042c4:	e9 fd fd ff ff       	jmp    4040c6 <___pformat_emit_float+0xf6>
  4042c9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4042d0:	f6 47 05 08          	test   BYTE PTR [edi+0x5],0x8
  4042d4:	0f 84 57 fd ff ff    	je     404031 <___pformat_emit_float+0x61>
  4042da:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4042e0:	e9 3e fd ff ff       	jmp    404023 <___pformat_emit_float+0x53>
  4042e5:	89 fa                	mov    edx,edi
  4042e7:	b8 2e 00 00 00       	mov    eax,0x2e
  4042ec:	e8 1f f5 ff ff       	call   403810 <___pformat_putc>
  4042f1:	e9 d4 fe ff ff       	jmp    4041ca <___pformat_emit_float+0x1fa>
  4042f6:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  4042fa:	e9 61 ff ff ff       	jmp    404260 <___pformat_emit_float+0x290>
  4042ff:	90                   	nop

00404300 <___pformat_emit_efloat>:
  404300:	55                   	push   ebp
  404301:	83 e9 01             	sub    ecx,0x1
  404304:	57                   	push   edi
  404305:	89 d5                	mov    ebp,edx
  404307:	56                   	push   esi
  404308:	be 01 00 00 00       	mov    esi,0x1
  40430d:	53                   	push   ebx
  40430e:	bb 67 66 66 66       	mov    ebx,0x66666667
  404313:	83 ec 1c             	sub    esp,0x1c
  404316:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40431a:	89 c8                	mov    eax,ecx
  40431c:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  404320:	c1 f8 1f             	sar    eax,0x1f
  404323:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  404327:	89 c8                	mov    eax,ecx
  404329:	f7 eb                	imul   ebx
  40432b:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  40432f:	c1 f9 1f             	sar    ecx,0x1f
  404332:	c1 fa 02             	sar    edx,0x2
  404335:	89 d3                	mov    ebx,edx
  404337:	29 cb                	sub    ebx,ecx
  404339:	74 18                	je     404353 <___pformat_emit_efloat+0x53>
  40433b:	b9 67 66 66 66       	mov    ecx,0x66666667
  404340:	89 d8                	mov    eax,ebx
  404342:	83 c6 01             	add    esi,0x1
  404345:	f7 e9                	imul   ecx
  404347:	c1 fb 1f             	sar    ebx,0x1f
  40434a:	c1 fa 02             	sar    edx,0x2
  40434d:	29 da                	sub    edx,ebx
  40434f:	89 d3                	mov    ebx,edx
  404351:	75 ed                	jne    404340 <___pformat_emit_efloat+0x40>
  404353:	8b 47 20             	mov    eax,DWORD PTR [edi+0x20]
  404356:	39 c6                	cmp    esi,eax
  404358:	7d 02                	jge    40435c <___pformat_emit_efloat+0x5c>
  40435a:	89 c6                	mov    esi,eax
  40435c:	8b 57 08             	mov    edx,DWORD PTR [edi+0x8]
  40435f:	8d 46 02             	lea    eax,[esi+0x2]
  404362:	39 c2                	cmp    edx,eax
  404364:	7f 5a                	jg     4043c0 <___pformat_emit_efloat+0xc0>
  404366:	c7 47 08 ff ff ff ff 	mov    DWORD PTR [edi+0x8],0xffffffff
  40436d:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  404371:	b9 01 00 00 00       	mov    ecx,0x1
  404376:	89 ea                	mov    edx,ebp
  404378:	89 3c 24             	mov    DWORD PTR [esp],edi
  40437b:	83 c6 01             	add    esi,0x1
  40437e:	e8 4d fc ff ff       	call   403fd0 <___pformat_emit_float>
  404383:	8b 47 20             	mov    eax,DWORD PTR [edi+0x20]
  404386:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
  404389:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  40438c:	89 c2                	mov    edx,eax
  40438e:	83 e0 20             	and    eax,0x20
  404391:	81 ca c0 01 00 00    	or     edx,0x1c0
  404397:	83 c8 45             	or     eax,0x45
  40439a:	89 57 04             	mov    DWORD PTR [edi+0x4],edx
  40439d:	89 fa                	mov    edx,edi
  40439f:	e8 6c f4 ff ff       	call   403810 <___pformat_putc>
  4043a4:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  4043a8:	89 f9                	mov    ecx,edi
  4043aa:	01 77 08             	add    DWORD PTR [edi+0x8],esi
  4043ad:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  4043b1:	e8 0a f7 ff ff       	call   403ac0 <___pformat_int>
  4043b6:	83 c4 1c             	add    esp,0x1c
  4043b9:	5b                   	pop    ebx
  4043ba:	5e                   	pop    esi
  4043bb:	5f                   	pop    edi
  4043bc:	5d                   	pop    ebp
  4043bd:	c3                   	ret    
  4043be:	66 90                	xchg   ax,ax
  4043c0:	29 c2                	sub    edx,eax
  4043c2:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  4043c5:	eb a6                	jmp    40436d <___pformat_emit_efloat+0x6d>
  4043c7:	89 f6                	mov    esi,esi
  4043c9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004043d0 <___pformat_efloat>:
  4043d0:	56                   	push   esi
  4043d1:	53                   	push   ebx
  4043d2:	89 c3                	mov    ebx,eax
  4043d4:	83 ec 44             	sub    esp,0x44
  4043d7:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4043da:	85 c0                	test   eax,eax
  4043dc:	78 72                	js     404450 <___pformat_efloat+0x80>
  4043de:	83 c0 01             	add    eax,0x1
  4043e1:	db 6c 24 50          	fld    TBYTE PTR [esp+0x50]
  4043e5:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4043e9:	8d 54 24 28          	lea    edx,[esp+0x28]
  4043ed:	db 7c 24 30          	fstp   TBYTE PTR [esp+0x30]
  4043f1:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4043f5:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  4043f9:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  4043fd:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  404401:	89 04 24             	mov    DWORD PTR [esp],eax
  404404:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  404408:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40440c:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  404410:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  404414:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  404418:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40441c:	b8 02 00 00 00       	mov    eax,0x2
  404421:	e8 ea f2 ff ff       	call   403710 <___pformat_cvt>
  404426:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  40442a:	81 f9 00 80 ff ff    	cmp    ecx,0xffff8000
  404430:	89 c6                	mov    esi,eax
  404432:	74 2c                	je     404460 <___pformat_efloat+0x90>
  404434:	89 c2                	mov    edx,eax
  404436:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  40443a:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40443d:	e8 be fe ff ff       	call   404300 <___pformat_emit_efloat>
  404442:	89 34 24             	mov    DWORD PTR [esp],esi
  404445:	e8 86 2d 00 00       	call   4071d0 <___freedtoa>
  40444a:	83 c4 44             	add    esp,0x44
  40444d:	5b                   	pop    ebx
  40444e:	5e                   	pop    esi
  40444f:	c3                   	ret    
  404450:	c7 43 0c 06 00 00 00 	mov    DWORD PTR [ebx+0xc],0x6
  404457:	b8 07 00 00 00       	mov    eax,0x7
  40445c:	eb 83                	jmp    4043e1 <___pformat_efloat+0x11>
  40445e:	66 90                	xchg   ax,ax
  404460:	89 c2                	mov    edx,eax
  404462:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  404466:	89 d9                	mov    ecx,ebx
  404468:	e8 c3 f5 ff ff       	call   403a30 <___pformat_emit_inf_or_nan>
  40446d:	89 34 24             	mov    DWORD PTR [esp],esi
  404470:	e8 5b 2d 00 00       	call   4071d0 <___freedtoa>
  404475:	83 c4 44             	add    esp,0x44
  404478:	5b                   	pop    ebx
  404479:	5e                   	pop    esi
  40447a:	c3                   	ret    
  40447b:	90                   	nop
  40447c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00404480 <___pformat_float>:
  404480:	57                   	push   edi
  404481:	56                   	push   esi
  404482:	53                   	push   ebx
  404483:	89 c3                	mov    ebx,eax
  404485:	83 ec 40             	sub    esp,0x40
  404488:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40448b:	85 c0                	test   eax,eax
  40448d:	0f 88 9d 00 00 00    	js     404530 <___pformat_float+0xb0>
  404493:	db 6c 24 50          	fld    TBYTE PTR [esp+0x50]
  404497:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40449b:	8d 54 24 28          	lea    edx,[esp+0x28]
  40449f:	db 7c 24 30          	fstp   TBYTE PTR [esp+0x30]
  4044a3:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4044a7:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  4044ab:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  4044af:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  4044b3:	89 04 24             	mov    DWORD PTR [esp],eax
  4044b6:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  4044ba:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4044be:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  4044c2:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4044c6:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  4044ca:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4044ce:	b8 03 00 00 00       	mov    eax,0x3
  4044d3:	e8 38 f2 ff ff       	call   403710 <___pformat_cvt>
  4044d8:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  4044dc:	81 f9 00 80 ff ff    	cmp    ecx,0xffff8000
  4044e2:	89 c7                	mov    edi,eax
  4044e4:	74 5b                	je     404541 <___pformat_float+0xc1>
  4044e6:	89 c2                	mov    edx,eax
  4044e8:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4044ec:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4044ef:	e8 dc fa ff ff       	call   403fd0 <___pformat_emit_float>
  4044f4:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4044f7:	8d 50 ff             	lea    edx,[eax-0x1]
  4044fa:	85 c0                	test   eax,eax
  4044fc:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  4044ff:	7e 19                	jle    40451a <___pformat_float+0x9a>
  404501:	89 da                	mov    edx,ebx
  404503:	b8 20 00 00 00       	mov    eax,0x20
  404508:	e8 03 f3 ff ff       	call   403810 <___pformat_putc>
  40450d:	8b 4b 08             	mov    ecx,DWORD PTR [ebx+0x8]
  404510:	8d 71 ff             	lea    esi,[ecx-0x1]
  404513:	85 c9                	test   ecx,ecx
  404515:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
  404518:	7f e7                	jg     404501 <___pformat_float+0x81>
  40451a:	89 3c 24             	mov    DWORD PTR [esp],edi
  40451d:	e8 ae 2c 00 00       	call   4071d0 <___freedtoa>
  404522:	83 c4 40             	add    esp,0x40
  404525:	5b                   	pop    ebx
  404526:	5e                   	pop    esi
  404527:	5f                   	pop    edi
  404528:	c3                   	ret    
  404529:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  404530:	c7 43 0c 06 00 00 00 	mov    DWORD PTR [ebx+0xc],0x6
  404537:	b8 06 00 00 00       	mov    eax,0x6
  40453c:	e9 52 ff ff ff       	jmp    404493 <___pformat_float+0x13>
  404541:	89 c2                	mov    edx,eax
  404543:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  404547:	89 d9                	mov    ecx,ebx
  404549:	e8 e2 f4 ff ff       	call   403a30 <___pformat_emit_inf_or_nan>
  40454e:	89 3c 24             	mov    DWORD PTR [esp],edi
  404551:	e8 7a 2c 00 00       	call   4071d0 <___freedtoa>
  404556:	83 c4 40             	add    esp,0x40
  404559:	5b                   	pop    ebx
  40455a:	5e                   	pop    esi
  40455b:	5f                   	pop    edi
  40455c:	c3                   	ret    
  40455d:	8d 76 00             	lea    esi,[esi+0x0]

00404560 <___pformat_gfloat>:
  404560:	57                   	push   edi
  404561:	56                   	push   esi
  404562:	53                   	push   ebx
  404563:	89 c3                	mov    ebx,eax
  404565:	83 ec 40             	sub    esp,0x40
  404568:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40456b:	85 c0                	test   eax,eax
  40456d:	0f 88 1d 01 00 00    	js     404690 <___pformat_gfloat+0x130>
  404573:	0f 84 fa 00 00 00    	je     404673 <___pformat_gfloat+0x113>
  404579:	db 6c 24 50          	fld    TBYTE PTR [esp+0x50]
  40457d:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  404581:	8d 54 24 28          	lea    edx,[esp+0x28]
  404585:	db 7c 24 30          	fstp   TBYTE PTR [esp+0x30]
  404589:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  40458d:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  404591:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  404595:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  404599:	89 04 24             	mov    DWORD PTR [esp],eax
  40459c:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  4045a0:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4045a4:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  4045a8:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4045ac:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  4045b0:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4045b4:	b8 02 00 00 00       	mov    eax,0x2
  4045b9:	e8 52 f1 ff ff       	call   403710 <___pformat_cvt>
  4045be:	8b 74 24 2c          	mov    esi,DWORD PTR [esp+0x2c]
  4045c2:	81 fe 00 80 ff ff    	cmp    esi,0xffff8000
  4045c8:	89 c7                	mov    edi,eax
  4045ca:	0f 84 e0 00 00 00    	je     4046b0 <___pformat_gfloat+0x150>
  4045d0:	83 fe fd             	cmp    esi,0xfffffffd
  4045d3:	7c 6b                	jl     404640 <___pformat_gfloat+0xe0>
  4045d5:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
  4045d8:	39 c6                	cmp    esi,eax
  4045da:	7f 64                	jg     404640 <___pformat_gfloat+0xe0>
  4045dc:	f6 43 05 08          	test   BYTE PTR [ebx+0x5],0x8
  4045e0:	0f 85 bb 00 00 00    	jne    4046a1 <___pformat_gfloat+0x141>
  4045e6:	89 3c 24             	mov    DWORD PTR [esp],edi
  4045e9:	e8 f2 3a 00 00       	call   4080e0 <_strlen>
  4045ee:	29 f0                	sub    eax,esi
  4045f0:	85 c0                	test   eax,eax
  4045f2:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  4045f5:	0f 88 c5 00 00 00    	js     4046c0 <___pformat_gfloat+0x160>
  4045fb:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4045ff:	89 fa                	mov    edx,edi
  404601:	89 f1                	mov    ecx,esi
  404603:	89 1c 24             	mov    DWORD PTR [esp],ebx
  404606:	e8 c5 f9 ff ff       	call   403fd0 <___pformat_emit_float>
  40460b:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  40460e:	8d 50 ff             	lea    edx,[eax-0x1]
  404611:	85 c0                	test   eax,eax
  404613:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  404616:	7e 4c                	jle    404664 <___pformat_gfloat+0x104>
  404618:	89 da                	mov    edx,ebx
  40461a:	b8 20 00 00 00       	mov    eax,0x20
  40461f:	e8 ec f1 ff ff       	call   403810 <___pformat_putc>
  404624:	8b 4b 08             	mov    ecx,DWORD PTR [ebx+0x8]
  404627:	8d 71 ff             	lea    esi,[ecx-0x1]
  40462a:	85 c9                	test   ecx,ecx
  40462c:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
  40462f:	7f e7                	jg     404618 <___pformat_gfloat+0xb8>
  404631:	89 3c 24             	mov    DWORD PTR [esp],edi
  404634:	e8 97 2b 00 00       	call   4071d0 <___freedtoa>
  404639:	83 c4 40             	add    esp,0x40
  40463c:	5b                   	pop    ebx
  40463d:	5e                   	pop    esi
  40463e:	5f                   	pop    edi
  40463f:	c3                   	ret    
  404640:	f6 43 05 08          	test   BYTE PTR [ebx+0x5],0x8
  404644:	75 3e                	jne    404684 <___pformat_gfloat+0x124>
  404646:	89 3c 24             	mov    DWORD PTR [esp],edi
  404649:	e8 92 3a 00 00       	call   4080e0 <_strlen>
  40464e:	83 e8 01             	sub    eax,0x1
  404651:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  404654:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  404658:	89 f1                	mov    ecx,esi
  40465a:	89 fa                	mov    edx,edi
  40465c:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40465f:	e8 9c fc ff ff       	call   404300 <___pformat_emit_efloat>
  404664:	89 3c 24             	mov    DWORD PTR [esp],edi
  404667:	e8 64 2b 00 00       	call   4071d0 <___freedtoa>
  40466c:	83 c4 40             	add    esp,0x40
  40466f:	5b                   	pop    ebx
  404670:	5e                   	pop    esi
  404671:	5f                   	pop    edi
  404672:	c3                   	ret    
  404673:	c7 43 0c 01 00 00 00 	mov    DWORD PTR [ebx+0xc],0x1
  40467a:	b8 01 00 00 00       	mov    eax,0x1
  40467f:	e9 f5 fe ff ff       	jmp    404579 <___pformat_gfloat+0x19>
  404684:	83 6b 0c 01          	sub    DWORD PTR [ebx+0xc],0x1
  404688:	eb ca                	jmp    404654 <___pformat_gfloat+0xf4>
  40468a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404690:	c7 43 0c 06 00 00 00 	mov    DWORD PTR [ebx+0xc],0x6
  404697:	b8 06 00 00 00       	mov    eax,0x6
  40469c:	e9 d8 fe ff ff       	jmp    404579 <___pformat_gfloat+0x19>
  4046a1:	29 f0                	sub    eax,esi
  4046a3:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  4046a6:	e9 50 ff ff ff       	jmp    4045fb <___pformat_gfloat+0x9b>
  4046ab:	90                   	nop
  4046ac:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4046b0:	89 c2                	mov    edx,eax
  4046b2:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4046b6:	89 d9                	mov    ecx,ebx
  4046b8:	e8 73 f3 ff ff       	call   403a30 <___pformat_emit_inf_or_nan>
  4046bd:	eb a5                	jmp    404664 <___pformat_gfloat+0x104>
  4046bf:	90                   	nop
  4046c0:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  4046c3:	85 d2                	test   edx,edx
  4046c5:	0f 8e 30 ff ff ff    	jle    4045fb <___pformat_gfloat+0x9b>
  4046cb:	01 d0                	add    eax,edx
  4046cd:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  4046d0:	e9 26 ff ff ff       	jmp    4045fb <___pformat_gfloat+0x9b>
  4046d5:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4046d9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004046e0 <___pformat_xldouble>:
  4046e0:	55                   	push   ebp
  4046e1:	89 e5                	mov    ebp,esp
  4046e3:	57                   	push   edi
  4046e4:	89 c7                	mov    edi,eax
  4046e6:	56                   	push   esi
  4046e7:	53                   	push   ebx
  4046e8:	83 ec 6c             	sub    esp,0x6c
  4046eb:	db 6d 08             	fld    TBYTE PTR [ebp+0x8]
  4046ee:	d9 c0                	fld    st(0)
  4046f0:	db 7d c0             	fstp   TBYTE PTR [ebp-0x40]
  4046f3:	d9 e5                	fxam   
  4046f5:	9b df e0             	fstsw  ax
  4046f8:	66 25 00 45          	and    ax,0x4500
  4046fc:	66 3d 00 01          	cmp    ax,0x100
  404700:	0f 84 1f 05 00 00    	je     404c25 <___pformat_xldouble+0x545>
  404706:	0f b7 55 c8          	movzx  edx,WORD PTR [ebp-0x38]
  40470a:	89 d3                	mov    ebx,edx
  40470c:	81 e3 00 80 00 00    	and    ebx,0x8000
  404712:	0f 85 48 01 00 00    	jne    404860 <___pformat_xldouble+0x180>
  404718:	d9 e5                	fxam   
  40471a:	9b df e0             	fstsw  ax
  40471d:	dd d8                	fstp   st(0)
  40471f:	66 25 00 45          	and    ax,0x4500
  404723:	66 3d 00 05          	cmp    ax,0x500
  404727:	0f 84 16 05 00 00    	je     404c43 <___pformat_xldouble+0x563>
  40472d:	66 81 e2 ff 7f       	and    dx,0x7fff
  404732:	0f 84 b8 01 00 00    	je     4048f0 <___pformat_xldouble+0x210>
  404738:	8d b2 01 c0 ff ff    	lea    esi,[edx-0x3fff]
  40473e:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  404741:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  404744:	8b 5f 0c             	mov    ebx,DWORD PTR [edi+0xc]
  404747:	83 fb 0e             	cmp    ebx,0xe
  40474a:	0f 86 26 01 00 00    	jbe    404876 <___pformat_xldouble+0x196>
  404750:	89 d1                	mov    ecx,edx
  404752:	09 c1                	or     ecx,eax
  404754:	0f 84 fc 04 00 00    	je     404c56 <___pformat_xldouble+0x576>
  40475a:	8d 4d d6             	lea    ecx,[ebp-0x2a]
  40475d:	89 4d a4             	mov    DWORD PTR [ebp-0x5c],ecx
  404760:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  404763:	89 7d a8             	mov    DWORD PTR [ebp-0x58],edi
  404766:	eb 5e                	jmp    4047c6 <___pformat_xldouble+0xe6>
  404768:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  40476b:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  40476e:	85 c9                	test   ecx,ecx
  404770:	7e 09                	jle    40477b <___pformat_xldouble+0x9b>
  404772:	8b 5d a8             	mov    ebx,DWORD PTR [ebp-0x58]
  404775:	83 e9 01             	sub    ecx,0x1
  404778:	89 4b 0c             	mov    DWORD PTR [ebx+0xc],ecx
  40477b:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  40477e:	0f ac d0 04          	shrd   eax,edx,0x4
  404782:	c1 ea 04             	shr    edx,0x4
  404785:	85 ff                	test   edi,edi
  404787:	89 4d b0             	mov    DWORD PTR [ebp-0x50],ecx
  40478a:	0f 84 a8 00 00 00    	je     404838 <___pformat_xldouble+0x158>
  404790:	8b 4d b0             	mov    ecx,DWORD PTR [ebp-0x50]
  404793:	83 c1 01             	add    ecx,0x1
  404796:	83 ff 09             	cmp    edi,0x9
  404799:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  40479c:	0f 8e b5 00 00 00    	jle    404857 <___pformat_xldouble+0x177>
  4047a2:	8d 4f 37             	lea    ecx,[edi+0x37]
  4047a5:	8b 7d a8             	mov    edi,DWORD PTR [ebp-0x58]
  4047a8:	8b 7f 04             	mov    edi,DWORD PTR [edi+0x4]
  4047ab:	89 7d a0             	mov    DWORD PTR [ebp-0x60],edi
  4047ae:	0f b6 5d a0          	movzx  ebx,BYTE PTR [ebp-0x60]
  4047b2:	83 e3 20             	and    ebx,0x20
  4047b5:	09 d9                	or     ecx,ebx
  4047b7:	8b 7d b0             	mov    edi,DWORD PTR [ebp-0x50]
  4047ba:	88 0f                	mov    BYTE PTR [edi],cl
  4047bc:	89 d7                	mov    edi,edx
  4047be:	09 c7                	or     edi,eax
  4047c0:	0f 84 60 01 00 00    	je     404926 <___pformat_xldouble+0x246>
  4047c6:	89 c7                	mov    edi,eax
  4047c8:	89 c1                	mov    ecx,eax
  4047ca:	83 e7 0f             	and    edi,0xf
  4047cd:	89 fb                	mov    ebx,edi
  4047cf:	31 f9                	xor    ecx,edi
  4047d1:	c1 fb 1f             	sar    ebx,0x1f
  4047d4:	31 d3                	xor    ebx,edx
  4047d6:	09 cb                	or     ebx,ecx
  4047d8:	75 8e                	jne    404768 <___pformat_xldouble+0x88>
  4047da:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  4047dd:	39 4d ac             	cmp    DWORD PTR [ebp-0x54],ecx
  4047e0:	77 1e                	ja     404800 <___pformat_xldouble+0x120>
  4047e2:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  4047e5:	f6 41 05 08          	test   BYTE PTR [ecx+0x5],0x8
  4047e9:	75 15                	jne    404800 <___pformat_xldouble+0x120>
  4047eb:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  4047ee:	89 4d b0             	mov    DWORD PTR [ebp-0x50],ecx
  4047f1:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  4047f4:	8b 59 0c             	mov    ebx,DWORD PTR [ecx+0xc]
  4047f7:	85 db                	test   ebx,ebx
  4047f9:	7e 11                	jle    40480c <___pformat_xldouble+0x12c>
  4047fb:	90                   	nop
  4047fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404800:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  404803:	8d 59 01             	lea    ebx,[ecx+0x1]
  404806:	89 5d b0             	mov    DWORD PTR [ebp-0x50],ebx
  404809:	c6 01 2e             	mov    BYTE PTR [ecx],0x2e
  40480c:	89 c1                	mov    ecx,eax
  40480e:	83 f1 01             	xor    ecx,0x1
  404811:	09 d1                	or     ecx,edx
  404813:	74 17                	je     40482c <___pformat_xldouble+0x14c>
  404815:	8d 4e ff             	lea    ecx,[esi-0x1]
  404818:	0f ac d0 01          	shrd   eax,edx,0x1
  40481c:	89 ce                	mov    esi,ecx
  40481e:	89 c3                	mov    ebx,eax
  404820:	d1 ea                	shr    edx,1
  404822:	83 f3 01             	xor    ebx,0x1
  404825:	09 d3                	or     ebx,edx
  404827:	8d 4e ff             	lea    ecx,[esi-0x1]
  40482a:	75 ec                	jne    404818 <___pformat_xldouble+0x138>
  40482c:	31 c0                	xor    eax,eax
  40482e:	31 d2                	xor    edx,edx
  404830:	85 ff                	test   edi,edi
  404832:	0f 85 58 ff ff ff    	jne    404790 <___pformat_xldouble+0xb0>
  404838:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  40483b:	39 4d b0             	cmp    DWORD PTR [ebp-0x50],ecx
  40483e:	77 0e                	ja     40484e <___pformat_xldouble+0x16e>
  404840:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  404843:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  404846:	85 c9                	test   ecx,ecx
  404848:	0f 88 b7 01 00 00    	js     404a05 <___pformat_xldouble+0x325>
  40484e:	8b 4d b0             	mov    ecx,DWORD PTR [ebp-0x50]
  404851:	83 c1 01             	add    ecx,0x1
  404854:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  404857:	8d 4f 30             	lea    ecx,[edi+0x30]
  40485a:	e9 58 ff ff ff       	jmp    4047b7 <___pformat_xldouble+0xd7>
  40485f:	90                   	nop
  404860:	81 4f 04 80 00 00 00 	or     DWORD PTR [edi+0x4],0x80
  404867:	e9 ac fe ff ff       	jmp    404718 <___pformat_xldouble+0x38>
  40486c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404870:	0f a4 c2 01          	shld   edx,eax,0x1
  404874:	01 c0                	add    eax,eax
  404876:	85 d2                	test   edx,edx
  404878:	79 f6                	jns    404870 <___pformat_xldouble+0x190>
  40487a:	b9 0e 00 00 00       	mov    ecx,0xe
  40487f:	0f ac d0 01          	shrd   eax,edx,0x1
  404883:	29 d9                	sub    ecx,ebx
  404885:	d1 ea                	shr    edx,1
  404887:	c1 e1 02             	shl    ecx,0x2
  40488a:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40488d:	b8 04 00 00 00       	mov    eax,0x4
  404892:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
  404895:	31 d2                	xor    edx,edx
  404897:	0f a5 c2             	shld   edx,eax,cl
  40489a:	d3 e0                	shl    eax,cl
  40489c:	f6 c1 20             	test   cl,0x20
  40489f:	74 04                	je     4048a5 <___pformat_xldouble+0x1c5>
  4048a1:	89 c2                	mov    edx,eax
  4048a3:	31 c0                	xor    eax,eax
  4048a5:	01 45 b0             	add    DWORD PTR [ebp-0x50],eax
  4048a8:	11 55 b4             	adc    DWORD PTR [ebp-0x4c],edx
  4048ab:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  4048ae:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
  4048b1:	85 d2                	test   edx,edx
  4048b3:	0f 88 64 03 00 00    	js     404c1d <___pformat_xldouble+0x53d>
  4048b9:	0f a4 c2 01          	shld   edx,eax,0x1
  4048bd:	01 c0                	add    eax,eax
  4048bf:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  4048c2:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
  4048c5:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  4048c8:	b9 0f 00 00 00       	mov    ecx,0xf
  4048cd:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
  4048d0:	29 d9                	sub    ecx,ebx
  4048d2:	c1 e1 02             	shl    ecx,0x2
  4048d5:	0f ad d0             	shrd   eax,edx,cl
  4048d8:	d3 ea                	shr    edx,cl
  4048da:	f6 c1 20             	test   cl,0x20
  4048dd:	0f 84 77 fe ff ff    	je     40475a <___pformat_xldouble+0x7a>
  4048e3:	89 d0                	mov    eax,edx
  4048e5:	31 d2                	xor    edx,edx
  4048e7:	e9 6e fe ff ff       	jmp    40475a <___pformat_xldouble+0x7a>
  4048ec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4048f0:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  4048f3:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  4048f6:	89 d6                	mov    esi,edx
  4048f8:	09 c6                	or     esi,eax
  4048fa:	0f 84 d7 02 00 00    	je     404bd7 <___pformat_xldouble+0x4f7>
  404900:	85 d2                	test   edx,edx
  404902:	0f 88 84 03 00 00    	js     404c8c <___pformat_xldouble+0x5ac>
  404908:	b9 01 c0 ff ff       	mov    ecx,0xffffc001
  40490d:	8d 76 00             	lea    esi,[esi+0x0]
  404910:	0f a4 c2 01          	shld   edx,eax,0x1
  404914:	89 cb                	mov    ebx,ecx
  404916:	01 c0                	add    eax,eax
  404918:	83 e9 01             	sub    ecx,0x1
  40491b:	85 d2                	test   edx,edx
  40491d:	79 f1                	jns    404910 <___pformat_xldouble+0x230>
  40491f:	89 de                	mov    esi,ebx
  404921:	e9 1e fe ff ff       	jmp    404744 <___pformat_xldouble+0x64>
  404926:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  404929:	39 45 ac             	cmp    DWORD PTR [ebp-0x54],eax
  40492c:	8b 7d a8             	mov    edi,DWORD PTR [ebp-0x58]
  40492f:	0f 84 52 03 00 00    	je     404c87 <___pformat_xldouble+0x5a7>
  404935:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404938:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40493b:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  40493e:	85 c0                	test   eax,eax
  404940:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
  404943:	0f 8e 7c 02 00 00    	jle    404bc5 <___pformat_xldouble+0x4e5>
  404949:	8b 57 0c             	mov    edx,DWORD PTR [edi+0xc]
  40494c:	0f bf f6             	movsx  esi,si
  40494f:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
  404952:	2b 45 a4             	sub    eax,DWORD PTR [ebp-0x5c]
  404955:	89 75 a8             	mov    DWORD PTR [ebp-0x58],esi
  404958:	85 d2                	test   edx,edx
  40495a:	7e 02                	jle    40495e <___pformat_xldouble+0x27e>
  40495c:	01 d0                	add    eax,edx
  40495e:	8b 55 b0             	mov    edx,DWORD PTR [ebp-0x50]
  404961:	81 e2 c0 01 00 00    	and    edx,0x1c0
  404967:	83 fa 01             	cmp    edx,0x1
  40496a:	19 d2                	sbb    edx,edx
  40496c:	8d 74 10 06          	lea    esi,[eax+edx*1+0x6]
  404970:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  404973:	ba 67 66 66 66       	mov    edx,0x66666667
  404978:	f7 ea                	imul   edx
  40497a:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  40497d:	c1 fa 02             	sar    edx,0x2
  404980:	c1 f8 1f             	sar    eax,0x1f
  404983:	29 c2                	sub    edx,eax
  404985:	89 d1                	mov    ecx,edx
  404987:	0f 84 ee 02 00 00    	je     404c7b <___pformat_xldouble+0x59b>
  40498d:	bb 02 00 00 00       	mov    ebx,0x2
  404992:	b8 67 66 66 66       	mov    eax,0x66666667
  404997:	83 c6 01             	add    esi,0x1
  40499a:	f7 e9                	imul   ecx
  40499c:	83 c3 01             	add    ebx,0x1
  40499f:	c1 f9 1f             	sar    ecx,0x1f
  4049a2:	c1 fa 02             	sar    edx,0x2
  4049a5:	29 ca                	sub    edx,ecx
  4049a7:	89 d1                	mov    ecx,edx
  4049a9:	75 e7                	jne    404992 <___pformat_xldouble+0x2b2>
  4049ab:	0f bf c3             	movsx  eax,bx
  4049ae:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  4049b1:	39 75 a0             	cmp    DWORD PTR [ebp-0x60],esi
  4049b4:	7e 5a                	jle    404a10 <___pformat_xldouble+0x330>
  4049b6:	8b 45 a0             	mov    eax,DWORD PTR [ebp-0x60]
  4049b9:	29 f0                	sub    eax,esi
  4049bb:	f7 45 b0 00 06 00 00 	test   DWORD PTR [ebp-0x50],0x600
  4049c2:	0f 85 1a 02 00 00    	jne    404be2 <___pformat_xldouble+0x502>
  4049c8:	8d 50 ff             	lea    edx,[eax-0x1]
  4049cb:	85 c0                	test   eax,eax
  4049cd:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  4049d0:	7e 45                	jle    404a17 <___pformat_xldouble+0x337>
  4049d2:	89 fa                	mov    edx,edi
  4049d4:	b8 20 00 00 00       	mov    eax,0x20
  4049d9:	e8 32 ee ff ff       	call   403810 <___pformat_putc>
  4049de:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  4049e1:	8d 50 ff             	lea    edx,[eax-0x1]
  4049e4:	85 c0                	test   eax,eax
  4049e6:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  4049e9:	7f e7                	jg     4049d2 <___pformat_xldouble+0x2f2>
  4049eb:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  4049ee:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  4049f1:	f6 45 b0 80          	test   BYTE PTR [ebp-0x50],0x80
  4049f5:	74 26                	je     404a1d <___pformat_xldouble+0x33d>
  4049f7:	89 fa                	mov    edx,edi
  4049f9:	b8 2d 00 00 00       	mov    eax,0x2d
  4049fe:	e8 0d ee ff ff       	call   403810 <___pformat_putc>
  404a03:	eb 2f                	jmp    404a34 <___pformat_xldouble+0x354>
  404a05:	8b 7d b0             	mov    edi,DWORD PTR [ebp-0x50]
  404a08:	89 7d ac             	mov    DWORD PTR [ebp-0x54],edi
  404a0b:	e9 ac fd ff ff       	jmp    4047bc <___pformat_xldouble+0xdc>
  404a10:	c7 47 08 ff ff ff ff 	mov    DWORD PTR [edi+0x8],0xffffffff
  404a17:	f6 45 b0 80          	test   BYTE PTR [ebp-0x50],0x80
  404a1b:	75 da                	jne    4049f7 <___pformat_xldouble+0x317>
  404a1d:	f7 45 b0 00 01 00 00 	test   DWORD PTR [ebp-0x50],0x100
  404a24:	0f 85 c0 01 00 00    	jne    404bea <___pformat_xldouble+0x50a>
  404a2a:	f6 45 b0 40          	test   BYTE PTR [ebp-0x50],0x40
  404a2e:	0f 85 d8 01 00 00    	jne    404c0c <___pformat_xldouble+0x52c>
  404a34:	89 fa                	mov    edx,edi
  404a36:	b8 30 00 00 00       	mov    eax,0x30
  404a3b:	e8 d0 ed ff ff       	call   403810 <___pformat_putc>
  404a40:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404a43:	89 fa                	mov    edx,edi
  404a45:	83 e0 20             	and    eax,0x20
  404a48:	83 c8 58             	or     eax,0x58
  404a4b:	e8 c0 ed ff ff       	call   403810 <___pformat_putc>
  404a50:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404a53:	85 c0                	test   eax,eax
  404a55:	7e 25                	jle    404a7c <___pformat_xldouble+0x39c>
  404a57:	f6 47 05 02          	test   BYTE PTR [edi+0x5],0x2
  404a5b:	74 1f                	je     404a7c <___pformat_xldouble+0x39c>
  404a5d:	83 e8 01             	sub    eax,0x1
  404a60:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  404a63:	89 fa                	mov    edx,edi
  404a65:	b8 30 00 00 00       	mov    eax,0x30
  404a6a:	e8 a1 ed ff ff       	call   403810 <___pformat_putc>
  404a6f:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404a72:	8d 50 ff             	lea    edx,[eax-0x1]
  404a75:	85 c0                	test   eax,eax
  404a77:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  404a7a:	7f e7                	jg     404a63 <___pformat_xldouble+0x383>
  404a7c:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  404a7f:	39 45 ac             	cmp    DWORD PTR [ebp-0x54],eax
  404a82:	8b 5d ac             	mov    ebx,DWORD PTR [ebp-0x54]
  404a85:	77 19                	ja     404aa0 <___pformat_xldouble+0x3c0>
  404a87:	e9 a1 00 00 00       	jmp    404b2d <___pformat_xldouble+0x44d>
  404a8c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404a90:	89 fa                	mov    edx,edi
  404a92:	e8 79 ed ff ff       	call   403810 <___pformat_putc>
  404a97:	3b 5d a4             	cmp    ebx,DWORD PTR [ebp-0x5c]
  404a9a:	0f 84 8d 00 00 00    	je     404b2d <___pformat_xldouble+0x44d>
  404aa0:	83 eb 01             	sub    ebx,0x1
  404aa3:	0f be 03             	movsx  eax,BYTE PTR [ebx]
  404aa6:	83 f8 2e             	cmp    eax,0x2e
  404aa9:	75 e5                	jne    404a90 <___pformat_xldouble+0x3b0>
  404aab:	83 7f 10 fd          	cmp    DWORD PTR [edi+0x10],0xfffffffd
  404aaf:	0f 84 cc 00 00 00    	je     404b81 <___pformat_xldouble+0x4a1>
  404ab5:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  404ab9:	66 85 d2             	test   dx,dx
  404abc:	0f 84 ae 00 00 00    	je     404b70 <___pformat_xldouble+0x490>
  404ac2:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
  404ac5:	89 65 b0             	mov    DWORD PTR [ebp-0x50],esp
  404ac8:	83 c0 0f             	add    eax,0xf
  404acb:	83 e0 f0             	and    eax,0xfffffff0
  404ace:	e8 cd d5 ff ff       	call   4020a0 <___chkstk_ms>
  404ad3:	29 c4                	sub    esp,eax
  404ad5:	8d 74 24 10          	lea    esi,[esp+0x10]
  404ad9:	8d 45 bc             	lea    eax,[ebp-0x44]
  404adc:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
  404ae3:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  404ae7:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  404aeb:	89 34 24             	mov    DWORD PTR [esp],esi
  404aee:	e8 5d 20 00 00       	call   406b50 <_wcrtomb>
  404af3:	85 c0                	test   eax,eax
  404af5:	0f 8e 00 01 00 00    	jle    404bfb <___pformat_xldouble+0x51b>
  404afb:	01 f0                	add    eax,esi
  404afd:	89 5d ac             	mov    DWORD PTR [ebp-0x54],ebx
  404b00:	89 f3                	mov    ebx,esi
  404b02:	89 c6                	mov    esi,eax
  404b04:	83 c3 01             	add    ebx,0x1
  404b07:	0f be 43 ff          	movsx  eax,BYTE PTR [ebx-0x1]
  404b0b:	89 fa                	mov    edx,edi
  404b0d:	e8 fe ec ff ff       	call   403810 <___pformat_putc>
  404b12:	39 f3                	cmp    ebx,esi
  404b14:	75 ee                	jne    404b04 <___pformat_xldouble+0x424>
  404b16:	8b 5d ac             	mov    ebx,DWORD PTR [ebp-0x54]
  404b19:	8b 65 b0             	mov    esp,DWORD PTR [ebp-0x50]
  404b1c:	e9 76 ff ff ff       	jmp    404a97 <___pformat_xldouble+0x3b7>
  404b21:	89 fa                	mov    edx,edi
  404b23:	b8 30 00 00 00       	mov    eax,0x30
  404b28:	e8 e3 ec ff ff       	call   403810 <___pformat_putc>
  404b2d:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  404b30:	8d 50 ff             	lea    edx,[eax-0x1]
  404b33:	85 c0                	test   eax,eax
  404b35:	89 57 0c             	mov    DWORD PTR [edi+0xc],edx
  404b38:	7f e7                	jg     404b21 <___pformat_xldouble+0x441>
  404b3a:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404b3d:	89 fa                	mov    edx,edi
  404b3f:	83 e0 20             	and    eax,0x20
  404b42:	83 c8 50             	or     eax,0x50
  404b45:	e8 c6 ec ff ff       	call   403810 <___pformat_putc>
  404b4a:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  404b4d:	89 f9                	mov    ecx,edi
  404b4f:	01 47 08             	add    DWORD PTR [edi+0x8],eax
  404b52:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  404b55:	81 4f 04 c0 01 00 00 	or     DWORD PTR [edi+0x4],0x1c0
  404b5c:	99                   	cdq    
  404b5d:	e8 5e ef ff ff       	call   403ac0 <___pformat_int>
  404b62:	8d 65 f4             	lea    esp,[ebp-0xc]
  404b65:	5b                   	pop    ebx
  404b66:	5e                   	pop    esi
  404b67:	5f                   	pop    edi
  404b68:	5d                   	pop    ebp
  404b69:	c3                   	ret    
  404b6a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404b70:	89 fa                	mov    edx,edi
  404b72:	b8 2e 00 00 00       	mov    eax,0x2e
  404b77:	e8 94 ec ff ff       	call   403810 <___pformat_putc>
  404b7c:	e9 16 ff ff ff       	jmp    404a97 <___pformat_xldouble+0x3b7>
  404b81:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
  404b88:	8d 75 bc             	lea    esi,[ebp-0x44]
  404b8b:	e8 e0 35 00 00       	call   408170 <_localeconv>
  404b90:	89 74 24 0c          	mov    DWORD PTR [esp+0xc],esi
  404b94:	c7 44 24 08 10 00 00 	mov    DWORD PTR [esp+0x8],0x10
  404b9b:	00 
  404b9c:	8b 00                	mov    eax,DWORD PTR [eax]
  404b9e:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  404ba2:	8d 45 ba             	lea    eax,[ebp-0x46]
  404ba5:	89 04 24             	mov    DWORD PTR [esp],eax
  404ba8:	e8 f3 22 00 00       	call   406ea0 <_mbrtowc>
  404bad:	85 c0                	test   eax,eax
  404baf:	0f 8e 85 00 00 00    	jle    404c3a <___pformat_xldouble+0x55a>
  404bb5:	0f b7 55 ba          	movzx  edx,WORD PTR [ebp-0x46]
  404bb9:	66 89 57 14          	mov    WORD PTR [edi+0x14],dx
  404bbd:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
  404bc0:	e9 f4 fe ff ff       	jmp    404ab9 <___pformat_xldouble+0x3d9>
  404bc5:	0f bf c6             	movsx  eax,si
  404bc8:	c7 45 9c 02 00 00 00 	mov    DWORD PTR [ebp-0x64],0x2
  404bcf:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  404bd2:	e9 40 fe ff ff       	jmp    404a17 <___pformat_xldouble+0x337>
  404bd7:	31 f6                	xor    esi,esi
  404bd9:	31 c0                	xor    eax,eax
  404bdb:	31 d2                	xor    edx,edx
  404bdd:	e9 62 fb ff ff       	jmp    404744 <___pformat_xldouble+0x64>
  404be2:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  404be5:	e9 2d fe ff ff       	jmp    404a17 <___pformat_xldouble+0x337>
  404bea:	89 fa                	mov    edx,edi
  404bec:	b8 2b 00 00 00       	mov    eax,0x2b
  404bf1:	e8 1a ec ff ff       	call   403810 <___pformat_putc>
  404bf6:	e9 39 fe ff ff       	jmp    404a34 <___pformat_xldouble+0x354>
  404bfb:	89 fa                	mov    edx,edi
  404bfd:	b8 2e 00 00 00       	mov    eax,0x2e
  404c02:	e8 09 ec ff ff       	call   403810 <___pformat_putc>
  404c07:	e9 0d ff ff ff       	jmp    404b19 <___pformat_xldouble+0x439>
  404c0c:	89 fa                	mov    edx,edi
  404c0e:	b8 20 00 00 00       	mov    eax,0x20
  404c13:	e8 f8 eb ff ff       	call   403810 <___pformat_putc>
  404c18:	e9 17 fe ff ff       	jmp    404a34 <___pformat_xldouble+0x354>
  404c1d:	83 c6 01             	add    esi,0x1
  404c20:	e9 a0 fc ff ff       	jmp    4048c5 <___pformat_xldouble+0x1e5>
  404c25:	dd d8                	fstp   st(0)
  404c27:	89 f9                	mov    ecx,edi
  404c29:	ba 50 a1 40 00       	mov    edx,0x40a150
  404c2e:	31 c0                	xor    eax,eax
  404c30:	e8 fb ed ff ff       	call   403a30 <___pformat_emit_inf_or_nan>
  404c35:	e9 28 ff ff ff       	jmp    404b62 <___pformat_xldouble+0x482>
  404c3a:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  404c3e:	e9 7a ff ff ff       	jmp    404bbd <___pformat_xldouble+0x4dd>
  404c43:	89 f9                	mov    ecx,edi
  404c45:	ba 54 a1 40 00       	mov    edx,0x40a154
  404c4a:	89 d8                	mov    eax,ebx
  404c4c:	e8 df ed ff ff       	call   403a30 <___pformat_emit_inf_or_nan>
  404c51:	e9 0c ff ff ff       	jmp    404b62 <___pformat_xldouble+0x482>
  404c56:	8d 45 d6             	lea    eax,[ebp-0x2a]
  404c59:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
  404c5c:	85 db                	test   ebx,ebx
  404c5e:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404c61:	7e 33                	jle    404c96 <___pformat_xldouble+0x5b6>
  404c63:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  404c66:	c6 45 d6 2e          	mov    BYTE PTR [ebp-0x2a],0x2e
  404c6a:	8d 45 d7             	lea    eax,[ebp-0x29]
  404c6d:	8d 50 01             	lea    edx,[eax+0x1]
  404c70:	89 55 ac             	mov    DWORD PTR [ebp-0x54],edx
  404c73:	c6 00 30             	mov    BYTE PTR [eax],0x30
  404c76:	e9 c0 fc ff ff       	jmp    40493b <___pformat_xldouble+0x25b>
  404c7b:	c7 45 9c 02 00 00 00 	mov    DWORD PTR [ebp-0x64],0x2
  404c82:	e9 2a fd ff ff       	jmp    4049b1 <___pformat_xldouble+0x2d1>
  404c87:	8b 5f 0c             	mov    ebx,DWORD PTR [edi+0xc]
  404c8a:	eb d0                	jmp    404c5c <___pformat_xldouble+0x57c>
  404c8c:	be 02 c0 ff ff       	mov    esi,0xffffc002
  404c91:	e9 ae fa ff ff       	jmp    404744 <___pformat_xldouble+0x64>
  404c96:	89 c2                	mov    edx,eax
  404c98:	80 e6 08             	and    dh,0x8
  404c9b:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  404c9e:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  404ca1:	74 ca                	je     404c6d <___pformat_xldouble+0x58d>
  404ca3:	eb c1                	jmp    404c66 <___pformat_xldouble+0x586>
  404ca5:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404ca9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00404cb0 <___mingw_pformat>:
  404cb0:	55                   	push   ebp
  404cb1:	57                   	push   edi
  404cb2:	56                   	push   esi
  404cb3:	53                   	push   ebx
  404cb4:	83 ec 5c             	sub    esp,0x5c
  404cb7:	8b 44 24 74          	mov    eax,DWORD PTR [esp+0x74]
  404cbb:	81 64 24 70 00 30 00 	and    DWORD PTR [esp+0x70],0x3000
  404cc2:	00 
  404cc3:	8b 74 24 7c          	mov    esi,DWORD PTR [esp+0x7c]
  404cc7:	c7 04 24 6d a1 40 00 	mov    DWORD PTR [esp],0x40a16d
  404cce:	8b ac 24 80 00 00 00 	mov    ebp,DWORD PTR [esp+0x80]
  404cd5:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  404cd9:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404cdd:	c7 44 24 34 ff ff ff 	mov    DWORD PTR [esp+0x34],0xffffffff
  404ce4:	ff 
  404ce5:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  404cec:	ff 
  404ced:	c7 44 24 3c fd ff ff 	mov    DWORD PTR [esp+0x3c],0xfffffffd
  404cf4:	ff 
  404cf5:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  404cf9:	31 c0                	xor    eax,eax
  404cfb:	66 89 44 24 40       	mov    WORD PTR [esp+0x40],ax
  404d00:	8b 44 24 78          	mov    eax,DWORD PTR [esp+0x78]
  404d04:	c7 44 24 44 00 00 00 	mov    DWORD PTR [esp+0x44],0x0
  404d0b:	00 
  404d0c:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  404d10:	e8 63 34 00 00       	call   408178 <_getenv>
  404d15:	85 c0                	test   eax,eax
  404d17:	0f 84 d3 00 00 00    	je     404df0 <___mingw_pformat+0x140>
  404d1d:	0f be 00             	movsx  eax,BYTE PTR [eax]
  404d20:	83 e8 30             	sub    eax,0x30
  404d23:	83 f8 02             	cmp    eax,0x2
  404d26:	0f 87 c4 00 00 00    	ja     404df0 <___mingw_pformat+0x140>
  404d2c:	b8 02 00 00 00       	mov    eax,0x2
  404d31:	89 44 24 4c          	mov    DWORD PTR [esp+0x4c],eax
  404d35:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404d39:	80 cc 02             	or     ah,0x2
  404d3c:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  404d40:	0f be 06             	movsx  eax,BYTE PTR [esi]
  404d43:	8d 5e 01             	lea    ebx,[esi+0x1]
  404d46:	89 d9                	mov    ecx,ebx
  404d48:	85 c0                	test   eax,eax
  404d4a:	0f 84 92 00 00 00    	je     404de2 <___mingw_pformat+0x132>
  404d50:	83 f8 25             	cmp    eax,0x25
  404d53:	0f 85 de 00 00 00    	jne    404e37 <___mingw_pformat+0x187>
  404d59:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404d5d:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  404d64:	ff 
  404d65:	c7 44 24 34 ff ff ff 	mov    DWORD PTR [esp+0x34],0xffffffff
  404d6c:	ff 
  404d6d:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  404d74:	00 
  404d75:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  404d79:	0f b6 56 01          	movzx  edx,BYTE PTR [esi+0x1]
  404d7d:	8d 44 24 34          	lea    eax,[esp+0x34]
  404d81:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  404d85:	c7 44 24 10 00 00 00 	mov    DWORD PTR [esp+0x10],0x0
  404d8c:	00 
  404d8d:	84 d2                	test   dl,dl
  404d8f:	74 3f                	je     404dd0 <___mingw_pformat+0x120>
  404d91:	8d 42 e0             	lea    eax,[edx-0x20]
  404d94:	0f be fa             	movsx  edi,dl
  404d97:	3c 5a                	cmp    al,0x5a
  404d99:	8d 71 01             	lea    esi,[ecx+0x1]
  404d9c:	0f 87 70 04 00 00    	ja     405212 <___mingw_pformat+0x562>
  404da2:	0f b6 c0             	movzx  eax,al
  404da5:	ff 24 85 84 a1 40 00 	jmp    DWORD PTR [eax*4+0x40a184]
  404dac:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404db0:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  404db4:	89 f1                	mov    ecx,esi
  404db6:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  404dbd:	00 
  404dbe:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404dc5:	00 
  404dc6:	84 d2                	test   dl,dl
  404dc8:	75 c7                	jne    404d91 <___mingw_pformat+0xe1>
  404dca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404dd0:	89 ce                	mov    esi,ecx
  404dd2:	0f be 06             	movsx  eax,BYTE PTR [esi]
  404dd5:	8d 5e 01             	lea    ebx,[esi+0x1]
  404dd8:	89 d9                	mov    ecx,ebx
  404dda:	85 c0                	test   eax,eax
  404ddc:	0f 85 6e ff ff ff    	jne    404d50 <___mingw_pformat+0xa0>
  404de2:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  404de6:	83 c4 5c             	add    esp,0x5c
  404de9:	5b                   	pop    ebx
  404dea:	5e                   	pop    esi
  404deb:	5f                   	pop    edi
  404dec:	5d                   	pop    ebp
  404ded:	c3                   	ret    
  404dee:	66 90                	xchg   ax,ax
  404df0:	f6 05 6c d0 40 00 01 	test   BYTE PTR ds:0x40d06c,0x1
  404df7:	0f 85 2f ff ff ff    	jne    404d2c <___mingw_pformat+0x7c>
  404dfd:	b8 03 00 00 00       	mov    eax,0x3
  404e02:	e9 2a ff ff ff       	jmp    404d31 <___mingw_pformat+0x81>
  404e07:	80 79 01 6c          	cmp    BYTE PTR [ecx+0x1],0x6c
  404e0b:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  404e12:	00 
  404e13:	75 0b                	jne    404e20 <___mingw_pformat+0x170>
  404e15:	8d 71 02             	lea    esi,[ecx+0x2]
  404e18:	c7 44 24 14 03 00 00 	mov    DWORD PTR [esp+0x14],0x3
  404e1f:	00 
  404e20:	83 4c 24 30 04       	or     DWORD PTR [esp+0x30],0x4
  404e25:	89 f1                	mov    ecx,esi
  404e27:	0f b6 16             	movzx  edx,BYTE PTR [esi]
  404e2a:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404e31:	00 
  404e32:	e9 56 ff ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  404e37:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  404e3b:	89 de                	mov    esi,ebx
  404e3d:	e8 ce e9 ff ff       	call   403810 <___pformat_putc>
  404e42:	e9 f9 fe ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  404e47:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  404e4b:	89 e8                	mov    eax,ebp
  404e4d:	83 ea 02             	sub    edx,0x2
  404e50:	83 fa 01             	cmp    edx,0x1
  404e53:	0f 86 07 05 00 00    	jbe    405360 <___mingw_pformat+0x6b0>
  404e59:	8b 18                	mov    ebx,DWORD PTR [eax]
  404e5b:	83 c5 04             	add    ebp,0x4
  404e5e:	85 db                	test   ebx,ebx
  404e60:	0f 84 89 06 00 00    	je     4054ef <___mingw_pformat+0x83f>
  404e66:	89 1c 24             	mov    DWORD PTR [esp],ebx
  404e69:	e8 72 32 00 00       	call   4080e0 <_strlen>
  404e6e:	89 c2                	mov    edx,eax
  404e70:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  404e74:	89 d8                	mov    eax,ebx
  404e76:	e8 05 eb ff ff       	call   403980 <___pformat_putchars>
  404e7b:	e9 c0 fe ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  404e80:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  404e84:	89 e8                	mov    eax,ebp
  404e86:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  404e8d:	ff 
  404e8e:	83 ea 02             	sub    edx,0x2
  404e91:	83 fa 01             	cmp    edx,0x1
  404e94:	0f 86 23 03 00 00    	jbe    4051bd <___mingw_pformat+0x50d>
  404e9a:	8b 00                	mov    eax,DWORD PTR [eax]
  404e9c:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  404ea0:	ba 01 00 00 00       	mov    edx,0x1
  404ea5:	83 c5 04             	add    ebp,0x4
  404ea8:	88 44 24 20          	mov    BYTE PTR [esp+0x20],al
  404eac:	8d 44 24 20          	lea    eax,[esp+0x20]
  404eb0:	e8 cb ea ff ff       	call   403980 <___pformat_putchars>
  404eb5:	e9 86 fe ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  404eba:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404ec0:	83 7c 24 14 04       	cmp    DWORD PTR [esp+0x14],0x4
  404ec5:	0f 84 f0 05 00 00    	je     4054bb <___mingw_pformat+0x80b>
  404ecb:	83 7c 24 14 01       	cmp    DWORD PTR [esp+0x14],0x1
  404ed0:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  404ed3:	8b 54 24 44          	mov    edx,DWORD PTR [esp+0x44]
  404ed7:	0f 84 17 05 00 00    	je     4053f4 <___mingw_pformat+0x744>
  404edd:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
  404ee2:	0f 84 43 06 00 00    	je     40552b <___mingw_pformat+0x87b>
  404ee8:	83 7c 24 14 03       	cmp    DWORD PTR [esp+0x14],0x3
  404eed:	89 10                	mov    DWORD PTR [eax],edx
  404eef:	0f 84 a9 06 00 00    	je     40559e <___mingw_pformat+0x8ee>
  404ef5:	83 c5 04             	add    ebp,0x4
  404ef8:	e9 43 fe ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  404efd:	8d 76 00             	lea    esi,[esi+0x0]
  404f00:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  404f04:	89 f1                	mov    ecx,esi
  404f06:	c7 44 24 14 03 00 00 	mov    DWORD PTR [esp+0x14],0x3
  404f0d:	00 
  404f0e:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404f15:	00 
  404f16:	e9 72 fe ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  404f1b:	90                   	nop
  404f1c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404f20:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  404f24:	80 fa 68             	cmp    dl,0x68
  404f27:	0f 84 4c 05 00 00    	je     405479 <___mingw_pformat+0x7c9>
  404f2d:	89 f1                	mov    ecx,esi
  404f2f:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  404f36:	00 
  404f37:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404f3e:	00 
  404f3f:	e9 49 fe ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  404f44:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  404f48:	85 c0                	test   eax,eax
  404f4a:	75 0e                	jne    404f5a <___mingw_pformat+0x2aa>
  404f4c:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404f50:	39 44 24 30          	cmp    DWORD PTR [esp+0x30],eax
  404f54:	0f 84 a4 05 00 00    	je     4054fe <___mingw_pformat+0x84e>
  404f5a:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  404f5d:	8d 5d 04             	lea    ebx,[ebp+0x4]
  404f60:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  404f67:	00 
  404f68:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
  404f6c:	89 dd                	mov    ebp,ebx
  404f6e:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  404f72:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  404f76:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  404f7a:	89 04 24             	mov    DWORD PTR [esp],eax
  404f7d:	b8 78 00 00 00       	mov    eax,0x78
  404f82:	e8 69 ed ff ff       	call   403cf0 <___pformat_xint>
  404f87:	e9 b4 fd ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  404f8c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404f90:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  404f94:	83 c8 20             	or     eax,0x20
  404f97:	a8 04                	test   al,0x4
  404f99:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  404f9d:	0f 84 4a 02 00 00    	je     4051ed <___mingw_pformat+0x53d>
  404fa3:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  404fa6:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  404fa9:	db 3c 24             	fstp   TBYTE PTR [esp]
  404fac:	89 dd                	mov    ebp,ebx
  404fae:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  404fb2:	e8 29 f7 ff ff       	call   4046e0 <___pformat_xldouble>
  404fb7:	e9 84 fd ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  404fbc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404fc0:	83 7c 24 14 03       	cmp    DWORD PTR [esp+0x14],0x3
  404fc5:	89 f8                	mov    eax,edi
  404fc7:	0f 84 80 04 00 00    	je     40544d <___mingw_pformat+0x79d>
  404fcd:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
  404fd2:	0f 84 27 04 00 00    	je     4053ff <___mingw_pformat+0x74f>
  404fd8:	8b 7d 00             	mov    edi,DWORD PTR [ebp+0x0]
  404fdb:	8d 55 04             	lea    edx,[ebp+0x4]
  404fde:	83 7c 24 14 01       	cmp    DWORD PTR [esp+0x14],0x1
  404fe3:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  404fea:	00 
  404feb:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  404fef:	0f 84 1e 05 00 00    	je     405513 <___mingw_pformat+0x863>
  404ff5:	83 7c 24 14 04       	cmp    DWORD PTR [esp+0x14],0x4
  404ffa:	89 d5                	mov    ebp,edx
  404ffc:	0f 84 86 05 00 00    	je     405588 <___mingw_pformat+0x8d8>
  405002:	83 f8 75             	cmp    eax,0x75
  405005:	0f 84 ec 00 00 00    	je     4050f7 <___mingw_pformat+0x447>
  40500b:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  40500f:	8d 7c 24 2c          	lea    edi,[esp+0x2c]
  405013:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
  405017:	89 3c 24             	mov    DWORD PTR [esp],edi
  40501a:	e8 d1 ec ff ff       	call   403cf0 <___pformat_xint>
  40501f:	e9 1c fd ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  405024:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405028:	83 c8 20             	or     eax,0x20
  40502b:	a8 04                	test   al,0x4
  40502d:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  405031:	0f 84 15 01 00 00    	je     40514c <___mingw_pformat+0x49c>
  405037:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  40503a:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  40503d:	db 3c 24             	fstp   TBYTE PTR [esp]
  405040:	89 dd                	mov    ebp,ebx
  405042:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  405046:	e8 15 f5 ff ff       	call   404560 <___pformat_gfloat>
  40504b:	e9 f0 fc ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  405050:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405054:	83 c8 20             	or     eax,0x20
  405057:	a8 04                	test   al,0x4
  405059:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  40505d:	0f 84 0e 01 00 00    	je     405171 <___mingw_pformat+0x4c1>
  405063:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  405066:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  405069:	db 3c 24             	fstp   TBYTE PTR [esp]
  40506c:	89 dd                	mov    ebp,ebx
  40506e:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  405072:	e8 09 f4 ff ff       	call   404480 <___pformat_float>
  405077:	e9 c4 fc ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  40507c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405080:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405084:	83 c8 20             	or     eax,0x20
  405087:	a8 04                	test   al,0x4
  405089:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  40508d:	0f 84 09 01 00 00    	je     40519c <___mingw_pformat+0x4ec>
  405093:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  405096:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  405099:	db 3c 24             	fstp   TBYTE PTR [esp]
  40509c:	89 dd                	mov    ebp,ebx
  40509e:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4050a2:	e8 29 f3 ff ff       	call   4043d0 <___pformat_efloat>
  4050a7:	e9 94 fc ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  4050ac:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4050b0:	81 4c 24 30 80 00 00 	or     DWORD PTR [esp+0x30],0x80
  4050b7:	00 
  4050b8:	83 7c 24 14 03       	cmp    DWORD PTR [esp+0x14],0x3
  4050bd:	0f 84 a0 03 00 00    	je     405463 <___mingw_pformat+0x7b3>
  4050c3:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
  4050c8:	0f 84 48 03 00 00    	je     405416 <___mingw_pformat+0x766>
  4050ce:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  4050d1:	8d 55 04             	lea    edx,[ebp+0x4]
  4050d4:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  4050d8:	c1 f8 1f             	sar    eax,0x1f
  4050db:	83 7c 24 14 01       	cmp    DWORD PTR [esp+0x14],0x1
  4050e0:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  4050e4:	0f 84 4b 04 00 00    	je     405535 <___mingw_pformat+0x885>
  4050ea:	83 7c 24 14 04       	cmp    DWORD PTR [esp+0x14],0x4
  4050ef:	89 d5                	mov    ebp,edx
  4050f1:	0f 84 7c 04 00 00    	je     405573 <___mingw_pformat+0x8c3>
  4050f7:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4050fb:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  4050ff:	8b 54 24 24          	mov    edx,DWORD PTR [esp+0x24]
  405103:	e8 b8 e9 ff ff       	call   403ac0 <___pformat_int>
  405108:	e9 33 fc ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  40510d:	8d 76 00             	lea    esi,[esi+0x0]
  405110:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405114:	80 fa 36             	cmp    dl,0x36
  405117:	0f 84 78 03 00 00    	je     405495 <___mingw_pformat+0x7e5>
  40511d:	80 fa 33             	cmp    dl,0x33
  405120:	0f 84 a8 02 00 00    	je     4053ce <___mingw_pformat+0x71e>
  405126:	89 f1                	mov    ecx,esi
  405128:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  40512f:	00 
  405130:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  405137:	00 
  405138:	e9 50 fc ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  40513d:	8d 76 00             	lea    esi,[esi+0x0]
  405140:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405144:	a8 04                	test   al,0x4
  405146:	0f 85 eb fe ff ff    	jne    405037 <___mingw_pformat+0x387>
  40514c:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  40514f:	8d 5d 08             	lea    ebx,[ebp+0x8]
  405152:	db 3c 24             	fstp   TBYTE PTR [esp]
  405155:	89 dd                	mov    ebp,ebx
  405157:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  40515b:	e8 00 f4 ff ff       	call   404560 <___pformat_gfloat>
  405160:	e9 db fb ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  405165:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405169:	a8 04                	test   al,0x4
  40516b:	0f 85 f2 fe ff ff    	jne    405063 <___mingw_pformat+0x3b3>
  405171:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  405174:	8d 5d 08             	lea    ebx,[ebp+0x8]
  405177:	db 3c 24             	fstp   TBYTE PTR [esp]
  40517a:	89 dd                	mov    ebp,ebx
  40517c:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  405180:	e8 fb f2 ff ff       	call   404480 <___pformat_float>
  405185:	e9 b6 fb ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  40518a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  405190:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405194:	a8 04                	test   al,0x4
  405196:	0f 85 f7 fe ff ff    	jne    405093 <___mingw_pformat+0x3e3>
  40519c:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  40519f:	8d 5d 08             	lea    ebx,[ebp+0x8]
  4051a2:	db 3c 24             	fstp   TBYTE PTR [esp]
  4051a5:	89 dd                	mov    ebp,ebx
  4051a7:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4051ab:	e8 20 f2 ff ff       	call   4043d0 <___pformat_efloat>
  4051b0:	e9 8b fb ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  4051b5:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  4051bc:	ff 
  4051bd:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  4051c0:	8d 5d 04             	lea    ebx,[ebp+0x4]
  4051c3:	ba 01 00 00 00       	mov    edx,0x1
  4051c8:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  4051cc:	89 dd                	mov    ebp,ebx
  4051ce:	66 89 44 24 20       	mov    WORD PTR [esp+0x20],ax
  4051d3:	8d 44 24 20          	lea    eax,[esp+0x20]
  4051d7:	e8 94 e6 ff ff       	call   403870 <___pformat_wputchars>
  4051dc:	e9 5f fb ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  4051e1:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4051e5:	a8 04                	test   al,0x4
  4051e7:	0f 85 b6 fd ff ff    	jne    404fa3 <___mingw_pformat+0x2f3>
  4051ed:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  4051f0:	8d 5d 08             	lea    ebx,[ebp+0x8]
  4051f3:	db 3c 24             	fstp   TBYTE PTR [esp]
  4051f6:	89 dd                	mov    ebp,ebx
  4051f8:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4051fc:	e8 df f4 ff ff       	call   4046e0 <___pformat_xldouble>
  405201:	e9 3a fb ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  405206:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  40520a:	85 c0                	test   eax,eax
  40520c:	0f 84 8e 01 00 00    	je     4053a0 <___mingw_pformat+0x6f0>
  405212:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405216:	83 f8 04             	cmp    eax,0x4
  405219:	0f 84 c7 03 00 00    	je     4055e6 <___mingw_pformat+0x936>
  40521f:	83 ea 30             	sub    edx,0x30
  405222:	80 fa 09             	cmp    dl,0x9
  405225:	0f 87 bb 03 00 00    	ja     4055e6 <___mingw_pformat+0x936>
  40522b:	85 c0                	test   eax,eax
  40522d:	0f 84 5d 01 00 00    	je     405390 <___mingw_pformat+0x6e0>
  405233:	83 f8 02             	cmp    eax,0x2
  405236:	0f 84 f0 01 00 00    	je     40542c <___mingw_pformat+0x77c>
  40523c:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405240:	85 c0                	test   eax,eax
  405242:	74 1b                	je     40525f <___mingw_pformat+0x5af>
  405244:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405248:	8b 00                	mov    eax,DWORD PTR [eax]
  40524a:	85 c0                	test   eax,eax
  40524c:	0f 88 e7 01 00 00    	js     405439 <___mingw_pformat+0x789>
  405252:	8d 04 80             	lea    eax,[eax+eax*4]
  405255:	8d 44 47 d0          	lea    eax,[edi+eax*2-0x30]
  405259:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  40525d:	89 07                	mov    DWORD PTR [edi],eax
  40525f:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405263:	89 f1                	mov    ecx,esi
  405265:	e9 23 fb ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  40526a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  405270:	83 7c 24 10 01       	cmp    DWORD PTR [esp+0x10],0x1
  405275:	0f 86 51 02 00 00    	jbe    4054cc <___mingw_pformat+0x81c>
  40527b:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  40527f:	89 f1                	mov    ecx,esi
  405281:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  405288:	00 
  405289:	e9 ff fa ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  40528e:	66 90                	xchg   ax,ax
  405290:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405294:	85 c0                	test   eax,eax
  405296:	75 c7                	jne    40525f <___mingw_pformat+0x5af>
  405298:	81 4c 24 30 00 04 00 	or     DWORD PTR [esp+0x30],0x400
  40529f:	00 
  4052a0:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4052a4:	89 f1                	mov    ecx,esi
  4052a6:	e9 e2 fa ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  4052ab:	90                   	nop
  4052ac:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4052b0:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  4052b4:	85 c0                	test   eax,eax
  4052b6:	75 a7                	jne    40525f <___mingw_pformat+0x5af>
  4052b8:	81 4c 24 30 00 01 00 	or     DWORD PTR [esp+0x30],0x100
  4052bf:	00 
  4052c0:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4052c4:	89 f1                	mov    ecx,esi
  4052c6:	e9 c2 fa ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  4052cb:	90                   	nop
  4052cc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4052d0:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  4052d4:	85 ff                	test   edi,edi
  4052d6:	74 a3                	je     40527b <___mingw_pformat+0x5cb>
  4052d8:	f6 44 24 10 05       	test   BYTE PTR [esp+0x10],0x5
  4052dd:	0f 85 d0 00 00 00    	jne    4053b3 <___mingw_pformat+0x703>
  4052e3:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  4052e6:	8d 7d 04             	lea    edi,[ebp+0x4]
  4052e9:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  4052ed:	85 c0                	test   eax,eax
  4052ef:	89 02                	mov    DWORD PTR [edx],eax
  4052f1:	0f 88 5f 02 00 00    	js     405556 <___mingw_pformat+0x8a6>
  4052f7:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4052fb:	89 fd                	mov    ebp,edi
  4052fd:	89 f1                	mov    ecx,esi
  4052ff:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  405306:	00 
  405307:	e9 81 fa ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  40530c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405310:	89 f8                	mov    eax,edi
  405312:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  405316:	e8 f5 e4 ff ff       	call   403810 <___pformat_putc>
  40531b:	e9 20 fa ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  405320:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405324:	85 c0                	test   eax,eax
  405326:	0f 85 33 ff ff ff    	jne    40525f <___mingw_pformat+0x5af>
  40532c:	81 4c 24 30 00 08 00 	or     DWORD PTR [esp+0x30],0x800
  405333:	00 
  405334:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405338:	89 f1                	mov    ecx,esi
  40533a:	e9 4e fa ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  40533f:	90                   	nop
  405340:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405344:	85 c0                	test   eax,eax
  405346:	0f 85 13 ff ff ff    	jne    40525f <___mingw_pformat+0x5af>
  40534c:	83 4c 24 30 40       	or     DWORD PTR [esp+0x30],0x40
  405351:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405355:	89 f1                	mov    ecx,esi
  405357:	e9 31 fa ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  40535c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405360:	8b 5d 00             	mov    ebx,DWORD PTR [ebp+0x0]
  405363:	8d 7d 04             	lea    edi,[ebp+0x4]
  405366:	85 db                	test   ebx,ebx
  405368:	0f 84 de 01 00 00    	je     40554c <___mingw_pformat+0x89c>
  40536e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405371:	89 fd                	mov    ebp,edi
  405373:	e8 08 2e 00 00       	call   408180 <_wcslen>
  405378:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  40537c:	89 c2                	mov    edx,eax
  40537e:	89 d8                	mov    eax,ebx
  405380:	e8 eb e4 ff ff       	call   403870 <___pformat_wputchars>
  405385:	e9 b6 f9 ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  40538a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  405390:	c7 44 24 10 01 00 00 	mov    DWORD PTR [esp+0x10],0x1
  405397:	00 
  405398:	e9 9f fe ff ff       	jmp    40523c <___mingw_pformat+0x58c>
  40539d:	8d 76 00             	lea    esi,[esi+0x0]
  4053a0:	81 4c 24 30 00 02 00 	or     DWORD PTR [esp+0x30],0x200
  4053a7:	00 
  4053a8:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4053ac:	89 f1                	mov    ecx,esi
  4053ae:	e9 da f9 ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  4053b3:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4053b7:	89 f1                	mov    ecx,esi
  4053b9:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  4053c0:	00 
  4053c1:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  4053c8:	00 
  4053c9:	e9 bf f9 ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  4053ce:	80 79 02 32          	cmp    BYTE PTR [ecx+0x2],0x32
  4053d2:	0f 84 f2 01 00 00    	je     4055ca <___mingw_pformat+0x91a>
  4053d8:	89 f1                	mov    ecx,esi
  4053da:	ba 33 00 00 00       	mov    edx,0x33
  4053df:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  4053e6:	00 
  4053e7:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  4053ee:	00 
  4053ef:	e9 9d f9 ff ff       	jmp    404d91 <___mingw_pformat+0xe1>
  4053f4:	66 89 10             	mov    WORD PTR [eax],dx
  4053f7:	83 c5 04             	add    ebp,0x4
  4053fa:	e9 41 f9 ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  4053ff:	8b 7d 00             	mov    edi,DWORD PTR [ebp+0x0]
  405402:	83 c5 04             	add    ebp,0x4
  405405:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  40540c:	00 
  40540d:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  405411:	e9 ec fb ff ff       	jmp    405002 <___mingw_pformat+0x352>
  405416:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  405419:	83 c5 04             	add    ebp,0x4
  40541c:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405420:	c1 f8 1f             	sar    eax,0x1f
  405423:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  405427:	e9 cb fc ff ff       	jmp    4050f7 <___mingw_pformat+0x447>
  40542c:	c7 44 24 10 03 00 00 	mov    DWORD PTR [esp+0x10],0x3
  405433:	00 
  405434:	e9 03 fe ff ff       	jmp    40523c <___mingw_pformat+0x58c>
  405439:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  40543d:	83 ef 30             	sub    edi,0x30
  405440:	89 38                	mov    DWORD PTR [eax],edi
  405442:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405446:	89 f1                	mov    ecx,esi
  405448:	e9 40 f9 ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  40544d:	8b 4d 00             	mov    ecx,DWORD PTR [ebp+0x0]
  405450:	83 c5 08             	add    ebp,0x8
  405453:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  405456:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  40545a:	89 5c 24 24          	mov    DWORD PTR [esp+0x24],ebx
  40545e:	e9 9f fb ff ff       	jmp    405002 <___mingw_pformat+0x352>
  405463:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  405466:	83 c5 08             	add    ebp,0x8
  405469:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  40546c:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405470:	89 54 24 24          	mov    DWORD PTR [esp+0x24],edx
  405474:	e9 7e fc ff ff       	jmp    4050f7 <___mingw_pformat+0x447>
  405479:	0f b6 51 02          	movzx  edx,BYTE PTR [ecx+0x2]
  40547d:	83 c1 02             	add    ecx,0x2
  405480:	c7 44 24 14 04 00 00 	mov    DWORD PTR [esp+0x14],0x4
  405487:	00 
  405488:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  40548f:	00 
  405490:	e9 f8 f8 ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  405495:	80 79 02 34          	cmp    BYTE PTR [ecx+0x2],0x34
  405499:	0f 84 0f 01 00 00    	je     4055ae <___mingw_pformat+0x8fe>
  40549f:	89 f1                	mov    ecx,esi
  4054a1:	ba 36 00 00 00       	mov    edx,0x36
  4054a6:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  4054ad:	00 
  4054ae:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  4054b5:	00 
  4054b6:	e9 d6 f8 ff ff       	jmp    404d91 <___mingw_pformat+0xe1>
  4054bb:	8b 55 00             	mov    edx,DWORD PTR [ebp+0x0]
  4054be:	83 c5 04             	add    ebp,0x4
  4054c1:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  4054c5:	88 02                	mov    BYTE PTR [edx],al
  4054c7:	e9 74 f8 ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  4054cc:	8d 44 24 38          	lea    eax,[esp+0x38]
  4054d0:	c7 44 24 38 00 00 00 	mov    DWORD PTR [esp+0x38],0x0
  4054d7:	00 
  4054d8:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4054dc:	89 f1                	mov    ecx,esi
  4054de:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  4054e2:	c7 44 24 10 02 00 00 	mov    DWORD PTR [esp+0x10],0x2
  4054e9:	00 
  4054ea:	e9 9e f8 ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  4054ef:	ba 06 00 00 00       	mov    edx,0x6
  4054f4:	bb 66 a1 40 00       	mov    ebx,0x40a166
  4054f9:	e9 72 f9 ff ff       	jmp    404e70 <___mingw_pformat+0x1c0>
  4054fe:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  405502:	c7 44 24 38 08 00 00 	mov    DWORD PTR [esp+0x38],0x8
  405509:	00 
  40550a:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  40550e:	e9 47 fa ff ff       	jmp    404f5a <___mingw_pformat+0x2aa>
  405513:	0f b7 4c 24 20       	movzx  ecx,WORD PTR [esp+0x20]
  405518:	89 d5                	mov    ebp,edx
  40551a:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  405521:	00 
  405522:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  405526:	e9 d7 fa ff ff       	jmp    405002 <___mingw_pformat+0x352>
  40552b:	89 10                	mov    DWORD PTR [eax],edx
  40552d:	83 c5 04             	add    ebp,0x4
  405530:	e9 0b f8 ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  405535:	0f bf 44 24 20       	movsx  eax,WORD PTR [esp+0x20]
  40553a:	89 d5                	mov    ebp,edx
  40553c:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405540:	c1 f8 1f             	sar    eax,0x1f
  405543:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  405547:	e9 ab fb ff ff       	jmp    4050f7 <___mingw_pformat+0x447>
  40554c:	bb 58 a1 40 00       	mov    ebx,0x40a158
  405551:	e9 18 fe ff ff       	jmp    40536e <___mingw_pformat+0x6be>
  405556:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
  40555a:	85 d2                	test   edx,edx
  40555c:	0f 85 99 00 00 00    	jne    4055fb <___mingw_pformat+0x94b>
  405562:	81 4c 24 30 00 04 00 	or     DWORD PTR [esp+0x30],0x400
  405569:	00 
  40556a:	f7 5c 24 34          	neg    DWORD PTR [esp+0x34]
  40556e:	e9 84 fd ff ff       	jmp    4052f7 <___mingw_pformat+0x647>
  405573:	0f be 44 24 20       	movsx  eax,BYTE PTR [esp+0x20]
  405578:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  40557c:	c1 f8 1f             	sar    eax,0x1f
  40557f:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  405583:	e9 6f fb ff ff       	jmp    4050f7 <___mingw_pformat+0x447>
  405588:	0f b6 54 24 20       	movzx  edx,BYTE PTR [esp+0x20]
  40558d:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  405594:	00 
  405595:	89 54 24 20          	mov    DWORD PTR [esp+0x20],edx
  405599:	e9 64 fa ff ff       	jmp    405002 <___mingw_pformat+0x352>
  40559e:	89 d7                	mov    edi,edx
  4055a0:	83 c5 04             	add    ebp,0x4
  4055a3:	c1 ff 1f             	sar    edi,0x1f
  4055a6:	89 78 04             	mov    DWORD PTR [eax+0x4],edi
  4055a9:	e9 92 f7 ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  4055ae:	0f b6 51 03          	movzx  edx,BYTE PTR [ecx+0x3]
  4055b2:	83 c1 03             	add    ecx,0x3
  4055b5:	c7 44 24 14 03 00 00 	mov    DWORD PTR [esp+0x14],0x3
  4055bc:	00 
  4055bd:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  4055c4:	00 
  4055c5:	e9 c3 f7 ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  4055ca:	0f b6 51 03          	movzx  edx,BYTE PTR [ecx+0x3]
  4055ce:	83 c1 03             	add    ecx,0x3
  4055d1:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  4055d8:	00 
  4055d9:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  4055e0:	00 
  4055e1:	e9 a7 f7 ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  4055e6:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  4055ea:	b8 25 00 00 00       	mov    eax,0x25
  4055ef:	89 de                	mov    esi,ebx
  4055f1:	e8 1a e2 ff ff       	call   403810 <___pformat_putc>
  4055f6:	e9 45 f7 ff ff       	jmp    404d40 <___mingw_pformat+0x90>
  4055fb:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  405602:	ff 
  405603:	89 fd                	mov    ebp,edi
  405605:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405609:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  405610:	00 
  405611:	89 f1                	mov    ecx,esi
  405613:	e9 75 f7 ff ff       	jmp    404d8d <___mingw_pformat+0xdd>
  405618:	90                   	nop
  405619:	90                   	nop
  40561a:	90                   	nop
  40561b:	90                   	nop
  40561c:	90                   	nop
  40561d:	90                   	nop
  40561e:	90                   	nop
  40561f:	90                   	nop

00405620 <___gdtoa>:
  405620:	55                   	push   ebp
  405621:	57                   	push   edi
  405622:	56                   	push   esi
  405623:	53                   	push   ebx
  405624:	83 ec 6c             	sub    esp,0x6c
  405627:	8b 84 24 8c 00 00 00 	mov    eax,DWORD PTR [esp+0x8c]
  40562e:	8b 9c 24 8c 00 00 00 	mov    ebx,DWORD PTR [esp+0x8c]
  405635:	8b 30                	mov    esi,DWORD PTR [eax]
  405637:	89 f0                	mov    eax,esi
  405639:	83 e0 cf             	and    eax,0xffffffcf
  40563c:	89 03                	mov    DWORD PTR [ebx],eax
  40563e:	89 f0                	mov    eax,esi
  405640:	83 e0 07             	and    eax,0x7
  405643:	83 f8 04             	cmp    eax,0x4
  405646:	0f 87 5f 14 00 00    	ja     406aab <___gdtoa+0x148b>
  40564c:	ff 24 85 00 a3 40 00 	jmp    DWORD PTR [eax*4+0x40a300]
  405653:	8b 84 24 80 00 00 00 	mov    eax,DWORD PTR [esp+0x80]
  40565a:	31 d2                	xor    edx,edx
  40565c:	8b 38                	mov    edi,DWORD PTR [eax]
  40565e:	83 ff 20             	cmp    edi,0x20
  405661:	7e 0e                	jle    405671 <___gdtoa+0x51>
  405663:	b8 20 00 00 00       	mov    eax,0x20
  405668:	01 c0                	add    eax,eax
  40566a:	83 c2 01             	add    edx,0x1
  40566d:	39 c7                	cmp    edi,eax
  40566f:	7f f7                	jg     405668 <___gdtoa+0x48>
  405671:	89 14 24             	mov    DWORD PTR [esp],edx
  405674:	e8 97 1e 00 00       	call   407510 <___Balloc_D2A>
  405679:	8b 8c 24 88 00 00 00 	mov    ecx,DWORD PTR [esp+0x88]
  405680:	89 c3                	mov    ebx,eax
  405682:	8d 47 ff             	lea    eax,[edi-0x1]
  405685:	c1 f8 05             	sar    eax,0x5
  405688:	8d 2c 81             	lea    ebp,[ecx+eax*4]
  40568b:	8b 84 24 88 00 00 00 	mov    eax,DWORD PTR [esp+0x88]
  405692:	8d 4b 14             	lea    ecx,[ebx+0x14]
  405695:	89 ca                	mov    edx,ecx
  405697:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  40569b:	90                   	nop
  40569c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4056a0:	8b 08                	mov    ecx,DWORD PTR [eax]
  4056a2:	83 c0 04             	add    eax,0x4
  4056a5:	83 c2 04             	add    edx,0x4
  4056a8:	39 c5                	cmp    ebp,eax
  4056aa:	89 4a fc             	mov    DWORD PTR [edx-0x4],ecx
  4056ad:	73 f1                	jae    4056a0 <___gdtoa+0x80>
  4056af:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
  4056b3:	29 ca                	sub    edx,ecx
  4056b5:	c1 fa 02             	sar    edx,0x2
  4056b8:	eb 10                	jmp    4056ca <___gdtoa+0xaa>
  4056ba:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4056c0:	85 c0                	test   eax,eax
  4056c2:	0f 84 6e 04 00 00    	je     405b36 <___gdtoa+0x516>
  4056c8:	89 c2                	mov    edx,eax
  4056ca:	8d 42 ff             	lea    eax,[edx-0x1]
  4056cd:	8b 2c 81             	mov    ebp,DWORD PTR [ecx+eax*4]
  4056d0:	85 ed                	test   ebp,ebp
  4056d2:	74 ec                	je     4056c0 <___gdtoa+0xa0>
  4056d4:	0f bd 44 93 10       	bsr    eax,DWORD PTR [ebx+edx*4+0x10]
  4056d9:	89 53 10             	mov    DWORD PTR [ebx+0x10],edx
  4056dc:	c1 e2 05             	shl    edx,0x5
  4056df:	89 d5                	mov    ebp,edx
  4056e1:	83 f0 1f             	xor    eax,0x1f
  4056e4:	29 c5                	sub    ebp,eax
  4056e6:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4056e9:	e8 72 29 00 00       	call   408060 <___trailz_D2A>
  4056ee:	8b 8c 24 84 00 00 00 	mov    ecx,DWORD PTR [esp+0x84]
  4056f5:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  4056f9:	85 c0                	test   eax,eax
  4056fb:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  4056ff:	0f 85 3f 04 00 00    	jne    405b44 <___gdtoa+0x524>
  405705:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
  405708:	85 c9                	test   ecx,ecx
  40570a:	0f 85 a8 00 00 00    	jne    4057b8 <___gdtoa+0x198>
  405710:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405713:	e8 c8 1e 00 00       	call   4075e0 <___Bfree_D2A>
  405718:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  40571f:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
  405725:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  40572c:	c7 44 24 08 01 00 00 	mov    DWORD PTR [esp+0x8],0x1
  405733:	00 
  405734:	c7 04 24 fd a2 40 00 	mov    DWORD PTR [esp],0x40a2fd
  40573b:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40573f:	e8 3c 1a 00 00       	call   407180 <___nrv_alloc_D2A>
  405744:	83 c4 6c             	add    esp,0x6c
  405747:	5b                   	pop    ebx
  405748:	5e                   	pop    esi
  405749:	5f                   	pop    edi
  40574a:	5d                   	pop    ebp
  40574b:	c3                   	ret    
  40574c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405750:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  405757:	c7 00 00 80 ff ff    	mov    DWORD PTR [eax],0xffff8000
  40575d:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  405764:	c7 44 24 08 03 00 00 	mov    DWORD PTR [esp+0x8],0x3
  40576b:	00 
  40576c:	c7 04 24 f9 a2 40 00 	mov    DWORD PTR [esp],0x40a2f9
  405773:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405777:	e8 04 1a 00 00       	call   407180 <___nrv_alloc_D2A>
  40577c:	83 c4 6c             	add    esp,0x6c
  40577f:	5b                   	pop    ebx
  405780:	5e                   	pop    esi
  405781:	5f                   	pop    edi
  405782:	5d                   	pop    ebp
  405783:	c3                   	ret    
  405784:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  40578b:	c7 00 00 80 ff ff    	mov    DWORD PTR [eax],0xffff8000
  405791:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  405798:	c7 44 24 08 08 00 00 	mov    DWORD PTR [esp+0x8],0x8
  40579f:	00 
  4057a0:	c7 04 24 f0 a2 40 00 	mov    DWORD PTR [esp],0x40a2f0
  4057a7:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4057ab:	e8 d0 19 00 00       	call   407180 <___nrv_alloc_D2A>
  4057b0:	83 c4 6c             	add    esp,0x6c
  4057b3:	5b                   	pop    ebx
  4057b4:	5e                   	pop    esi
  4057b5:	5f                   	pop    edi
  4057b6:	5d                   	pop    ebp
  4057b7:	c3                   	ret    
  4057b8:	8d 44 24 5c          	lea    eax,[esp+0x5c]
  4057bc:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4057c0:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4057c3:	e8 68 25 00 00       	call   407d30 <___b2d_D2A>
  4057c8:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4057cc:	8d 54 28 ff          	lea    edx,[eax+ebp*1-0x1]
  4057d0:	89 54 24 48          	mov    DWORD PTR [esp+0x48],edx
  4057d4:	89 d0                	mov    eax,edx
  4057d6:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  4057da:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
  4057de:	c1 f8 1f             	sar    eax,0x1f
  4057e1:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4057e5:	31 d0                	xor    eax,edx
  4057e7:	2b 44 24 0c          	sub    eax,DWORD PTR [esp+0xc]
  4057eb:	81 e1 ff ff 0f 00    	and    ecx,0xfffff
  4057f1:	81 c9 00 00 f0 3f    	or     ecx,0x3ff00000
  4057f7:	89 4c 24 14          	mov    DWORD PTR [esp+0x14],ecx
  4057fb:	2d 35 04 00 00       	sub    eax,0x435
  405800:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  405804:	85 c0                	test   eax,eax
  405806:	d8 25 14 a3 40 00    	fsub   DWORD PTR ds:0x40a314
  40580c:	dc 0d 18 a3 40 00    	fmul   QWORD PTR ds:0x40a318
  405812:	dc 05 20 a3 40 00    	fadd   QWORD PTR ds:0x40a320
  405818:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  40581c:	dc 0d 28 a3 40 00    	fmul   QWORD PTR ds:0x40a328
  405822:	de c1                	faddp  st(1),st
  405824:	7e 10                	jle    405836 <___gdtoa+0x216>
  405826:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  40582a:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  40582e:	dc 0d 30 a3 40 00    	fmul   QWORD PTR ds:0x40a330
  405834:	de c1                	faddp  st(1),st
  405836:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  40583a:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  40583f:	b4 0c                	mov    ah,0xc
  405841:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  405846:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  40584a:	db 54 24 0c          	fist   DWORD PTR [esp+0xc]
  40584e:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  405852:	d9 ee                	fldz   
  405854:	dd e9                	fucomp st(1)
  405856:	df e0                	fnstsw ax
  405858:	9e                   	sahf   
  405859:	0f 87 76 07 00 00    	ja     405fd5 <___gdtoa+0x9b5>
  40585f:	dd d8                	fstp   st(0)
  405861:	89 d0                	mov    eax,edx
  405863:	c1 e0 14             	shl    eax,0x14
  405866:	01 c8                	add    eax,ecx
  405868:	83 7c 24 0c 16       	cmp    DWORD PTR [esp+0xc],0x16
  40586d:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  405871:	c7 44 24 34 01 00 00 	mov    DWORD PTR [esp+0x34],0x1
  405878:	00 
  405879:	77 29                	ja     4058a4 <___gdtoa+0x284>
  40587b:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  40587f:	dd 04 c5 80 a3 40 00 	fld    QWORD PTR [eax*8+0x40a380]
  405886:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  40588a:	d9 c9                	fxch   st(1)
  40588c:	da e9                	fucompp 
  40588e:	df e0                	fnstsw ax
  405890:	9e                   	sahf   
  405891:	0f 86 6d 06 00 00    	jbe    405f04 <___gdtoa+0x8e4>
  405897:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
  40589c:	c7 44 24 34 00 00 00 	mov    DWORD PTR [esp+0x34],0x0
  4058a3:	00 
  4058a4:	89 e8                	mov    eax,ebp
  4058a6:	29 d0                	sub    eax,edx
  4058a8:	83 e8 01             	sub    eax,0x1
  4058ab:	c7 44 24 28 00 00 00 	mov    DWORD PTR [esp+0x28],0x0
  4058b2:	00 
  4058b3:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  4058b7:	0f 88 05 07 00 00    	js     405fc2 <___gdtoa+0x9a2>
  4058bd:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4058c1:	85 c0                	test   eax,eax
  4058c3:	0f 88 de 06 00 00    	js     405fa7 <___gdtoa+0x987>
  4058c9:	01 44 24 1c          	add    DWORD PTR [esp+0x1c],eax
  4058cd:	89 44 24 3c          	mov    DWORD PTR [esp+0x3c],eax
  4058d1:	c7 44 24 30 00 00 00 	mov    DWORD PTR [esp+0x30],0x0
  4058d8:	00 
  4058d9:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x9
  4058e0:	09 
  4058e1:	0f 87 81 02 00 00    	ja     405b68 <___gdtoa+0x548>
  4058e7:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x5
  4058ee:	05 
  4058ef:	0f 8e c0 11 00 00    	jle    406ab5 <___gdtoa+0x1495>
  4058f5:	83 ac 24 90 00 00 00 	sub    DWORD PTR [esp+0x90],0x4
  4058fc:	04 
  4058fd:	31 c0                	xor    eax,eax
  4058ff:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x3
  405906:	03 
  405907:	0f 84 11 06 00 00    	je     405f1e <___gdtoa+0x8fe>
  40590d:	0f 8e 18 06 00 00    	jle    405f2b <___gdtoa+0x90b>
  405913:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x4
  40591a:	04 
  40591b:	c7 44 24 40 01 00 00 	mov    DWORD PTR [esp+0x40],0x1
  405922:	00 
  405923:	0f 84 18 06 00 00    	je     405f41 <___gdtoa+0x921>
  405929:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x5
  405930:	05 
  405931:	0f 85 3c 02 00 00    	jne    405b73 <___gdtoa+0x553>
  405937:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
  40593b:	03 8c 24 94 00 00 00 	add    ecx,DWORD PTR [esp+0x94]
  405942:	89 4c 24 44          	mov    DWORD PTR [esp+0x44],ecx
  405946:	83 c1 01             	add    ecx,0x1
  405949:	85 c9                	test   ecx,ecx
  40594b:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
  40594f:	0f 8e e3 0a 00 00    	jle    406438 <___gdtoa+0xe18>
  405955:	83 f9 0e             	cmp    ecx,0xe
  405958:	0f 96 c2             	setbe  dl
  40595b:	21 c2                	and    edx,eax
  40595d:	89 c8                	mov    eax,ecx
  40595f:	89 4c 24 5c          	mov    DWORD PTR [esp+0x5c],ecx
  405963:	89 04 24             	mov    DWORD PTR [esp],eax
  405966:	89 54 24 38          	mov    DWORD PTR [esp+0x38],edx
  40596a:	e8 d1 17 00 00       	call   407140 <___rv_alloc_D2A>
  40596f:	8b 54 24 38          	mov    edx,DWORD PTR [esp+0x38]
  405973:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  405977:	8b 84 24 80 00 00 00 	mov    eax,DWORD PTR [esp+0x80]
  40597e:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  405981:	83 e8 01             	sub    eax,0x1
  405984:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  405988:	74 0f                	je     405999 <___gdtoa+0x379>
  40598a:	0f 88 81 05 00 00    	js     405f11 <___gdtoa+0x8f1>
  405990:	83 e6 08             	and    esi,0x8
  405993:	0f 85 59 05 00 00    	jne    405ef2 <___gdtoa+0x8d2>
  405999:	84 d2                	test   dl,dl
  40599b:	90                   	nop
  40599c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4059a0:	0f 84 70 02 00 00    	je     405c16 <___gdtoa+0x5f6>
  4059a6:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  4059aa:	0b 44 24 0c          	or     eax,DWORD PTR [esp+0xc]
  4059ae:	0f 85 62 02 00 00    	jne    405c16 <___gdtoa+0x5f6>
  4059b4:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  4059b8:	c7 44 24 5c 00 00 00 	mov    DWORD PTR [esp+0x5c],0x0
  4059bf:	00 
  4059c0:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  4059c4:	85 c0                	test   eax,eax
  4059c6:	74 0d                	je     4059d5 <___gdtoa+0x3b5>
  4059c8:	d9 e8                	fld1   
  4059ca:	dd e9                	fucomp st(1)
  4059cc:	df e0                	fnstsw ax
  4059ce:	9e                   	sahf   
  4059cf:	0f 87 e7 0d 00 00    	ja     4067bc <___gdtoa+0x119c>
  4059d5:	d9 c0                	fld    st(0)
  4059d7:	8b 74 24 18          	mov    esi,DWORD PTR [esp+0x18]
  4059db:	d8 c1                	fadd   st,st(1)
  4059dd:	d8 05 4c a3 40 00    	fadd   DWORD PTR ds:0x40a34c
  4059e3:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  4059e7:	81 6c 24 14 00 00 40 	sub    DWORD PTR [esp+0x14],0x3400000
  4059ee:	03 
  4059ef:	85 f6                	test   esi,esi
  4059f1:	0f 84 e1 01 00 00    	je     405bd8 <___gdtoa+0x5b8>
  4059f7:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  4059fb:	d9 c0                	fld    st(0)
  4059fd:	c7 44 24 38 00 00 00 	mov    DWORD PTR [esp+0x38],0x0
  405a04:	00 
  405a05:	8b 4c 24 40          	mov    ecx,DWORD PTR [esp+0x40]
  405a09:	85 c9                	test   ecx,ecx
  405a0b:	0f 84 58 0a 00 00    	je     406469 <___gdtoa+0xe49>
  405a11:	d9 05 54 a3 40 00    	fld    DWORD PTR ds:0x40a354
  405a17:	dc 34 d5 78 a3 40 00 	fdiv   QWORD PTR [edx*8+0x40a378]
  405a1e:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  405a22:	c7 44 24 5c 00 00 00 	mov    DWORD PTR [esp+0x5c],0x0
  405a29:	00 
  405a2a:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  405a2f:	b4 0c                	mov    ah,0xc
  405a31:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  405a36:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  405a3a:	8d 70 01             	lea    esi,[eax+0x1]
  405a3d:	dc 64 24 10          	fsub   QWORD PTR [esp+0x10]
  405a41:	d9 c9                	fxch   st(1)
  405a43:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  405a47:	db 54 24 48          	fist   DWORD PTR [esp+0x48]
  405a4b:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  405a4f:	8b 4c 24 48          	mov    ecx,DWORD PTR [esp+0x48]
  405a53:	89 4c 24 48          	mov    DWORD PTR [esp+0x48],ecx
  405a57:	83 c1 30             	add    ecx,0x30
  405a5a:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  405a5e:	de e9                	fsubrp st(1),st
  405a60:	d9 c9                	fxch   st(1)
  405a62:	88 08                	mov    BYTE PTR [eax],cl
  405a64:	dd e1                	fucom  st(1)
  405a66:	df e0                	fnstsw ax
  405a68:	9e                   	sahf   
  405a69:	0f 87 9a 00 00 00    	ja     405b09 <___gdtoa+0x4e9>
  405a6f:	d9 c1                	fld    st(1)
  405a71:	d8 2d 40 a3 40 00    	fsubr  DWORD PTR ds:0x40a340
  405a77:	d9 c9                	fxch   st(1)
  405a79:	dd e1                	fucom  st(1)
  405a7b:	df e0                	fnstsw ax
  405a7d:	dd d9                	fstp   st(1)
  405a7f:	9e                   	sahf   
  405a80:	0f 87 f1 0a 00 00    	ja     406577 <___gdtoa+0xf57>
  405a86:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405a8a:	83 c0 01             	add    eax,0x1
  405a8d:	39 c2                	cmp    edx,eax
  405a8f:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405a93:	0f 8e 69 01 00 00    	jle    405c02 <___gdtoa+0x5e2>
  405a99:	d9 05 44 a3 40 00    	fld    DWORD PTR ds:0x40a344
  405a9f:	eb 2e                	jmp    405acf <___gdtoa+0x4af>
  405aa1:	d9 c1                	fld    st(1)
  405aa3:	d8 2d 40 a3 40 00    	fsubr  DWORD PTR ds:0x40a340
  405aa9:	d9 c9                	fxch   st(1)
  405aab:	dd e1                	fucom  st(1)
  405aad:	df e0                	fnstsw ax
  405aaf:	dd d9                	fstp   st(1)
  405ab1:	9e                   	sahf   
  405ab2:	0f 87 c7 0a 00 00    	ja     40657f <___gdtoa+0xf5f>
  405ab8:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405abc:	83 c0 01             	add    eax,0x1
  405abf:	39 c2                	cmp    edx,eax
  405ac1:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405ac5:	0f 8e 3d 01 00 00    	jle    405c08 <___gdtoa+0x5e8>
  405acb:	d9 c9                	fxch   st(1)
  405acd:	d9 ca                	fxch   st(2)
  405acf:	dc c9                	fmul   st(1),st
  405ad1:	83 c6 01             	add    esi,0x1
  405ad4:	dc ca                	fmul   st(2),st
  405ad6:	d9 ca                	fxch   st(2)
  405ad8:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  405adc:	db 54 24 48          	fist   DWORD PTR [esp+0x48]
  405ae0:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  405ae4:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  405ae8:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  405aec:	8d 48 30             	lea    ecx,[eax+0x30]
  405aef:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  405af3:	de e9                	fsubrp st(1),st
  405af5:	d9 c9                	fxch   st(1)
  405af7:	88 4e ff             	mov    BYTE PTR [esi-0x1],cl
  405afa:	dd e1                	fucom  st(1)
  405afc:	df e0                	fnstsw ax
  405afe:	9e                   	sahf   
  405aff:	76 a0                	jbe    405aa1 <___gdtoa+0x481>
  405b01:	dd d8                	fstp   st(0)
  405b03:	dd d9                	fstp   st(1)
  405b05:	dd d9                	fstp   st(1)
  405b07:	eb 04                	jmp    405b0d <___gdtoa+0x4ed>
  405b09:	dd d8                	fstp   st(0)
  405b0b:	dd d9                	fstp   st(1)
  405b0d:	d9 ee                	fldz   
  405b0f:	d9 c9                	fxch   st(1)
  405b11:	da e9                	fucompp 
  405b13:	df e0                	fnstsw ax
  405b15:	9e                   	sahf   
  405b16:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  405b1a:	7a 06                	jp     405b22 <___gdtoa+0x502>
  405b1c:	0f 84 ad 05 00 00    	je     4060cf <___gdtoa+0xaaf>
  405b22:	83 c0 01             	add    eax,0x1
  405b25:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405b29:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  405b30:	00 
  405b31:	e9 77 03 00 00       	jmp    405ead <___gdtoa+0x88d>
  405b36:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
  405b3d:	31 ed                	xor    ebp,ebp
  405b3f:	e9 a2 fb ff ff       	jmp    4056e6 <___gdtoa+0xc6>
  405b44:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405b48:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405b4b:	e8 f0 23 00 00       	call   407f40 <___rshift_D2A>
  405b50:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405b54:	8b 8c 24 84 00 00 00 	mov    ecx,DWORD PTR [esp+0x84]
  405b5b:	29 c5                	sub    ebp,eax
  405b5d:	01 c1                	add    ecx,eax
  405b5f:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  405b63:	e9 9d fb ff ff       	jmp    405705 <___gdtoa+0xe5>
  405b68:	c7 84 24 90 00 00 00 	mov    DWORD PTR [esp+0x90],0x0
  405b6f:	00 00 00 00 
  405b73:	89 7c 24 48          	mov    DWORD PTR [esp+0x48],edi
  405b77:	31 d2                	xor    edx,edx
  405b79:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  405b7d:	dc 0d 38 a3 40 00    	fmul   QWORD PTR ds:0x40a338
  405b83:	c7 44 24 40 01 00 00 	mov    DWORD PTR [esp+0x40],0x1
  405b8a:	00 
  405b8b:	c7 44 24 44 ff ff ff 	mov    DWORD PTR [esp+0x44],0xffffffff
  405b92:	ff 
  405b93:	c7 44 24 18 ff ff ff 	mov    DWORD PTR [esp+0x18],0xffffffff
  405b9a:	ff 
  405b9b:	c7 84 24 94 00 00 00 	mov    DWORD PTR [esp+0x94],0x0
  405ba2:	00 00 00 00 
  405ba6:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  405baa:	db 5c 24 48          	fistp  DWORD PTR [esp+0x48]
  405bae:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  405bb2:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  405bb6:	83 c0 03             	add    eax,0x3
  405bb9:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405bbd:	e9 a1 fd ff ff       	jmp    405963 <___gdtoa+0x343>
  405bc2:	d9 c0                	fld    st(0)
  405bc4:	d8 c1                	fadd   st,st(1)
  405bc6:	d8 05 4c a3 40 00    	fadd   DWORD PTR ds:0x40a34c
  405bcc:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  405bd0:	81 6c 24 14 00 00 40 	sub    DWORD PTR [esp+0x14],0x3400000
  405bd7:	03 
  405bd8:	d9 c0                	fld    st(0)
  405bda:	d8 25 50 a3 40 00    	fsub   DWORD PTR ds:0x40a350
  405be0:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  405be4:	d9 c9                	fxch   st(1)
  405be6:	dd e1                	fucom  st(1)
  405be8:	df e0                	fnstsw ax
  405bea:	9e                   	sahf   
  405beb:	0f 87 52 09 00 00    	ja     406543 <___gdtoa+0xf23>
  405bf1:	d9 c9                	fxch   st(1)
  405bf3:	d9 e0                	fchs   
  405bf5:	da e9                	fucompp 
  405bf7:	df e0                	fnstsw ax
  405bf9:	9e                   	sahf   
  405bfa:	0f 87 77 03 00 00    	ja     405f77 <___gdtoa+0x957>
  405c00:	eb 10                	jmp    405c12 <___gdtoa+0x5f2>
  405c02:	dd d8                	fstp   st(0)
  405c04:	dd d8                	fstp   st(0)
  405c06:	eb 0a                	jmp    405c12 <___gdtoa+0x5f2>
  405c08:	dd d8                	fstp   st(0)
  405c0a:	dd d8                	fstp   st(0)
  405c0c:	dd d8                	fstp   st(0)
  405c0e:	eb 02                	jmp    405c12 <___gdtoa+0x5f2>
  405c10:	dd d8                	fstp   st(0)
  405c12:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  405c16:	83 7c 24 0c 0e       	cmp    DWORD PTR [esp+0xc],0xe
  405c1b:	0f 8e df 01 00 00    	jle    405e00 <___gdtoa+0x7e0>
  405c21:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  405c25:	85 c0                	test   eax,eax
  405c27:	0f 84 c3 03 00 00    	je     405ff0 <___gdtoa+0x9d0>
  405c2d:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x1
  405c34:	01 
  405c35:	0f 8e 93 09 00 00    	jle    4065ce <___gdtoa+0xfae>
  405c3b:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405c3f:	83 e8 01             	sub    eax,0x1
  405c42:	39 44 24 30          	cmp    DWORD PTR [esp+0x30],eax
  405c46:	0f 8c 08 08 00 00    	jl     406454 <___gdtoa+0xe34>
  405c4c:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  405c50:	29 c7                	sub    edi,eax
  405c52:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405c56:	85 c0                	test   eax,eax
  405c58:	0f 88 15 0a 00 00    	js     406673 <___gdtoa+0x1053>
  405c5e:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  405c62:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405c66:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  405c6d:	01 44 24 28          	add    DWORD PTR [esp+0x28],eax
  405c71:	01 44 24 1c          	add    DWORD PTR [esp+0x1c],eax
  405c75:	e8 b6 1a 00 00       	call   407730 <___i2b_D2A>
  405c7a:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405c7e:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  405c82:	85 c0                	test   eax,eax
  405c84:	7e 1e                	jle    405ca4 <___gdtoa+0x684>
  405c86:	85 f6                	test   esi,esi
  405c88:	7e 1a                	jle    405ca4 <___gdtoa+0x684>
  405c8a:	8b 4c 24 1c          	mov    ecx,DWORD PTR [esp+0x1c]
  405c8e:	39 f1                	cmp    ecx,esi
  405c90:	89 c8                	mov    eax,ecx
  405c92:	7e 02                	jle    405c96 <___gdtoa+0x676>
  405c94:	89 f0                	mov    eax,esi
  405c96:	29 44 24 28          	sub    DWORD PTR [esp+0x28],eax
  405c9a:	29 c6                	sub    esi,eax
  405c9c:	29 44 24 1c          	sub    DWORD PTR [esp+0x1c],eax
  405ca0:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405ca4:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  405ca8:	85 c9                	test   ecx,ecx
  405caa:	7e 4e                	jle    405cfa <___gdtoa+0x6da>
  405cac:	8b 54 24 40          	mov    edx,DWORD PTR [esp+0x40]
  405cb0:	85 d2                	test   edx,edx
  405cb2:	0f 84 dd 05 00 00    	je     406295 <___gdtoa+0xc75>
  405cb8:	85 ff                	test   edi,edi
  405cba:	7e 32                	jle    405cee <___gdtoa+0x6ce>
  405cbc:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405cc0:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  405cc4:	89 04 24             	mov    DWORD PTR [esp],eax
  405cc7:	e8 f4 1b 00 00       	call   4078c0 <___pow5mult_D2A>
  405ccc:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  405cd0:	89 04 24             	mov    DWORD PTR [esp],eax
  405cd3:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405cd7:	e8 84 1a 00 00       	call   407760 <___mult_D2A>
  405cdc:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405cdf:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  405ce3:	e8 f8 18 00 00       	call   4075e0 <___Bfree_D2A>
  405ce8:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405cec:	89 c3                	mov    ebx,eax
  405cee:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405cf2:	29 f8                	sub    eax,edi
  405cf4:	0f 85 9f 05 00 00    	jne    406299 <___gdtoa+0xc79>
  405cfa:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  405d01:	e8 2a 1a 00 00       	call   407730 <___i2b_D2A>
  405d06:	89 c7                	mov    edi,eax
  405d08:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  405d0c:	85 c0                	test   eax,eax
  405d0e:	7e 0e                	jle    405d1e <___gdtoa+0x6fe>
  405d10:	89 3c 24             	mov    DWORD PTR [esp],edi
  405d13:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405d17:	e8 a4 1b 00 00       	call   4078c0 <___pow5mult_D2A>
  405d1c:	89 c7                	mov    edi,eax
  405d1e:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x1
  405d25:	01 
  405d26:	c7 44 24 10 00 00 00 	mov    DWORD PTR [esp+0x10],0x0
  405d2d:	00 
  405d2e:	0f 8e 8f 06 00 00    	jle    4063c3 <___gdtoa+0xda3>
  405d34:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  405d38:	bd 1f 00 00 00       	mov    ebp,0x1f
  405d3d:	85 c0                	test   eax,eax
  405d3f:	74 0b                	je     405d4c <___gdtoa+0x72c>
  405d41:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
  405d44:	0f bd 6c 87 10       	bsr    ebp,DWORD PTR [edi+eax*4+0x10]
  405d49:	83 f5 1f             	xor    ebp,0x1f
  405d4c:	2b 6c 24 1c          	sub    ebp,DWORD PTR [esp+0x1c]
  405d50:	8b 54 24 28          	mov    edx,DWORD PTR [esp+0x28]
  405d54:	83 ed 04             	sub    ebp,0x4
  405d57:	83 e5 1f             	and    ebp,0x1f
  405d5a:	01 ea                	add    edx,ebp
  405d5c:	89 e8                	mov    eax,ebp
  405d5e:	85 d2                	test   edx,edx
  405d60:	89 6c 24 5c          	mov    DWORD PTR [esp+0x5c],ebp
  405d64:	7e 12                	jle    405d78 <___gdtoa+0x758>
  405d66:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405d69:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  405d6d:	e8 de 1c 00 00       	call   407a50 <___lshift_D2A>
  405d72:	89 c3                	mov    ebx,eax
  405d74:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405d78:	03 44 24 1c          	add    eax,DWORD PTR [esp+0x1c]
  405d7c:	85 c0                	test   eax,eax
  405d7e:	7e 0e                	jle    405d8e <___gdtoa+0x76e>
  405d80:	89 3c 24             	mov    DWORD PTR [esp],edi
  405d83:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405d87:	e8 c4 1c 00 00       	call   407a50 <___lshift_D2A>
  405d8c:	89 c7                	mov    edi,eax
  405d8e:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  405d92:	85 c0                	test   eax,eax
  405d94:	0f 85 12 05 00 00    	jne    4062ac <___gdtoa+0xc8c>
  405d9a:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  405da1:	02 
  405da2:	0f 8e 3b 03 00 00    	jle    4060e3 <___gdtoa+0xac3>
  405da8:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405dac:	85 c0                	test   eax,eax
  405dae:	0f 8f 2f 03 00 00    	jg     4060e3 <___gdtoa+0xac3>
  405db4:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405db8:	85 c0                	test   eax,eax
  405dba:	0f 85 c7 01 00 00    	jne    405f87 <___gdtoa+0x967>
  405dc0:	89 3c 24             	mov    DWORD PTR [esp],edi
  405dc3:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  405dca:	00 
  405dcb:	c7 44 24 04 05 00 00 	mov    DWORD PTR [esp+0x4],0x5
  405dd2:	00 
  405dd3:	e8 78 18 00 00       	call   407650 <___multadd_D2A>
  405dd8:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405ddb:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405ddf:	89 c7                	mov    edi,eax
  405de1:	e8 7a 1d 00 00       	call   407b60 <___cmp_D2A>
  405de6:	85 c0                	test   eax,eax
  405de8:	0f 8e 99 01 00 00    	jle    405f87 <___gdtoa+0x967>
  405dee:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405df2:	83 c0 02             	add    eax,0x2
  405df5:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405df9:	eb 72                	jmp    405e6d <___gdtoa+0x84d>
  405dfb:	90                   	nop
  405dfc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405e00:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405e04:	85 c0                	test   eax,eax
  405e06:	0f 88 15 fe ff ff    	js     405c21 <___gdtoa+0x601>
  405e0c:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405e10:	dd 04 c5 80 a3 40 00 	fld    QWORD PTR [eax*8+0x40a380]
  405e17:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405e1b:	85 c0                	test   eax,eax
  405e1d:	0f 8f e2 01 00 00    	jg     406005 <___gdtoa+0x9e5>
  405e23:	8b 84 24 94 00 00 00 	mov    eax,DWORD PTR [esp+0x94]
  405e2a:	c1 e8 1f             	shr    eax,0x1f
  405e2d:	84 c0                	test   al,al
  405e2f:	0f 84 d0 01 00 00    	je     406005 <___gdtoa+0x9e5>
  405e35:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405e39:	85 c0                	test   eax,eax
  405e3b:	0f 85 3a 01 00 00    	jne    405f7b <___gdtoa+0x95b>
  405e41:	d8 0d 50 a3 40 00    	fmul   DWORD PTR ds:0x40a350
  405e47:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  405e4b:	d9 c9                	fxch   st(1)
  405e4d:	da e9                	fucompp 
  405e4f:	df e0                	fnstsw ax
  405e51:	9e                   	sahf   
  405e52:	0f 83 25 01 00 00    	jae    405f7d <___gdtoa+0x95d>
  405e58:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405e5c:	31 ff                	xor    edi,edi
  405e5e:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  405e65:	00 
  405e66:	83 c0 02             	add    eax,0x2
  405e69:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405e6d:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  405e71:	31 d2                	xor    edx,edx
  405e73:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  405e7a:	00 
  405e7b:	8d 70 01             	lea    esi,[eax+0x1]
  405e7e:	c6 00 31             	mov    BYTE PTR [eax],0x31
  405e81:	89 3c 24             	mov    DWORD PTR [esp],edi
  405e84:	89 54 24 10          	mov    DWORD PTR [esp+0x10],edx
  405e88:	e8 53 17 00 00       	call   4075e0 <___Bfree_D2A>
  405e8d:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405e91:	85 c0                	test   eax,eax
  405e93:	74 18                	je     405ead <___gdtoa+0x88d>
  405e95:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
  405e99:	39 c2                	cmp    edx,eax
  405e9b:	0f 85 dd 03 00 00    	jne    40627e <___gdtoa+0xc5e>
  405ea1:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405ea5:	89 04 24             	mov    DWORD PTR [esp],eax
  405ea8:	e8 33 17 00 00       	call   4075e0 <___Bfree_D2A>
  405ead:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405eb0:	e8 2b 17 00 00       	call   4075e0 <___Bfree_D2A>
  405eb5:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  405ebc:	8b 7c 24 0c          	mov    edi,DWORD PTR [esp+0xc]
  405ec0:	c6 06 00             	mov    BYTE PTR [esi],0x0
  405ec3:	89 38                	mov    DWORD PTR [eax],edi
  405ec5:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  405ecc:	85 c0                	test   eax,eax
  405ece:	74 09                	je     405ed9 <___gdtoa+0x8b9>
  405ed0:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  405ed7:	89 30                	mov    DWORD PTR [eax],esi
  405ed9:	8b 84 24 8c 00 00 00 	mov    eax,DWORD PTR [esp+0x8c]
  405ee0:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  405ee4:	09 38                	or     DWORD PTR [eax],edi
  405ee6:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  405eea:	83 c4 6c             	add    esp,0x6c
  405eed:	5b                   	pop    ebx
  405eee:	5e                   	pop    esi
  405eef:	5f                   	pop    edi
  405ef0:	5d                   	pop    ebp
  405ef1:	c3                   	ret    
  405ef2:	b8 03 00 00 00       	mov    eax,0x3
  405ef7:	2b 44 24 2c          	sub    eax,DWORD PTR [esp+0x2c]
  405efb:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  405eff:	e9 95 fa ff ff       	jmp    405999 <___gdtoa+0x379>
  405f04:	c7 44 24 34 00 00 00 	mov    DWORD PTR [esp+0x34],0x0
  405f0b:	00 
  405f0c:	e9 93 f9 ff ff       	jmp    4058a4 <___gdtoa+0x284>
  405f11:	c7 44 24 2c 02 00 00 	mov    DWORD PTR [esp+0x2c],0x2
  405f18:	00 
  405f19:	e9 72 fa ff ff       	jmp    405990 <___gdtoa+0x370>
  405f1e:	c7 44 24 40 00 00 00 	mov    DWORD PTR [esp+0x40],0x0
  405f25:	00 
  405f26:	e9 0c fa ff ff       	jmp    405937 <___gdtoa+0x317>
  405f2b:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  405f32:	02 
  405f33:	c7 44 24 40 00 00 00 	mov    DWORD PTR [esp+0x40],0x0
  405f3a:	00 
  405f3b:	0f 85 32 fc ff ff    	jne    405b73 <___gdtoa+0x553>
  405f41:	8b 94 24 94 00 00 00 	mov    edx,DWORD PTR [esp+0x94]
  405f48:	85 d2                	test   edx,edx
  405f4a:	0f 8e d3 04 00 00    	jle    406423 <___gdtoa+0xe03>
  405f50:	83 bc 24 94 00 00 00 	cmp    DWORD PTR [esp+0x94],0xe
  405f57:	0e 
  405f58:	0f 96 c2             	setbe  dl
  405f5b:	8b 8c 24 94 00 00 00 	mov    ecx,DWORD PTR [esp+0x94]
  405f62:	21 c2                	and    edx,eax
  405f64:	89 4c 24 5c          	mov    DWORD PTR [esp+0x5c],ecx
  405f68:	89 c8                	mov    eax,ecx
  405f6a:	89 4c 24 44          	mov    DWORD PTR [esp+0x44],ecx
  405f6e:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
  405f72:	e9 ec f9 ff ff       	jmp    405963 <___gdtoa+0x343>
  405f77:	dd d8                	fstp   st(0)
  405f79:	eb 02                	jmp    405f7d <___gdtoa+0x95d>
  405f7b:	dd d8                	fstp   st(0)
  405f7d:	31 ff                	xor    edi,edi
  405f7f:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  405f86:	00 
  405f87:	8b 84 24 94 00 00 00 	mov    eax,DWORD PTR [esp+0x94]
  405f8e:	31 d2                	xor    edx,edx
  405f90:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  405f94:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  405f9b:	00 
  405f9c:	f7 d8                	neg    eax
  405f9e:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405fa2:	e9 da fe ff ff       	jmp    405e81 <___gdtoa+0x861>
  405fa7:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405fab:	29 44 24 28          	sub    DWORD PTR [esp+0x28],eax
  405faf:	c7 44 24 3c 00 00 00 	mov    DWORD PTR [esp+0x3c],0x0
  405fb6:	00 
  405fb7:	f7 d8                	neg    eax
  405fb9:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  405fbd:	e9 17 f9 ff ff       	jmp    4058d9 <___gdtoa+0x2b9>
  405fc2:	f7 d8                	neg    eax
  405fc4:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
  405fc8:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [esp+0x1c],0x0
  405fcf:	00 
  405fd0:	e9 e8 f8 ff ff       	jmp    4058bd <___gdtoa+0x29d>
  405fd5:	db 44 24 0c          	fild   DWORD PTR [esp+0xc]
  405fd9:	da e9                	fucompp 
  405fdb:	df e0                	fnstsw ax
  405fdd:	9e                   	sahf   
  405fde:	7a 06                	jp     405fe6 <___gdtoa+0x9c6>
  405fe0:	0f 84 7b f8 ff ff    	je     405861 <___gdtoa+0x241>
  405fe6:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
  405feb:	e9 71 f8 ff ff       	jmp    405861 <___gdtoa+0x241>
  405ff0:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  405ff4:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  405ff8:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  405fff:	00 
  406000:	e9 79 fc ff ff       	jmp    405c7e <___gdtoa+0x65e>
  406005:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  406009:	d9 c0                	fld    st(0)
  40600b:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
  40600f:	d8 f2                	fdiv   st,st(2)
  406011:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  406015:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  40601c:	00 
  40601d:	8d 77 01             	lea    esi,[edi+0x1]
  406020:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  406025:	b4 0c                	mov    ah,0xc
  406027:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  40602c:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  406030:	db 5c 24 48          	fistp  DWORD PTR [esp+0x48]
  406034:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  406038:	8b 4c 24 48          	mov    ecx,DWORD PTR [esp+0x48]
  40603c:	89 4c 24 48          	mov    DWORD PTR [esp+0x48],ecx
  406040:	8d 41 30             	lea    eax,[ecx+0x30]
  406043:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  406047:	d8 ca                	fmul   st,st(2)
  406049:	88 07                	mov    BYTE PTR [edi],al
  40604b:	de e9                	fsubrp st(1),st
  40604d:	d9 ee                	fldz   
  40604f:	d9 c9                	fxch   st(1)
  406051:	dd e1                	fucom  st(1)
  406053:	df e0                	fnstsw ax
  406055:	dd d9                	fstp   st(1)
  406057:	9e                   	sahf   
  406058:	0f 8b 52 09 00 00    	jnp    4069b0 <___gdtoa+0x1390>
  40605e:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  406062:	39 44 24 18          	cmp    DWORD PTR [esp+0x18],eax
  406066:	0f 84 93 03 00 00    	je     4063ff <___gdtoa+0xddf>
  40606c:	d9 05 44 a3 40 00    	fld    DWORD PTR ds:0x40a344
  406072:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  406076:	eb 0c                	jmp    406084 <___gdtoa+0xa64>
  406078:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  40607c:	39 c2                	cmp    edx,eax
  40607e:	0f 84 79 03 00 00    	je     4063fd <___gdtoa+0xddd>
  406084:	83 c0 01             	add    eax,0x1
  406087:	dc c9                	fmul   st(1),st
  406089:	83 c6 01             	add    esi,0x1
  40608c:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  406090:	d9 c1                	fld    st(1)
  406092:	d8 f3                	fdiv   st,st(3)
  406094:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  406098:	db 5c 24 48          	fistp  DWORD PTR [esp+0x48]
  40609c:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  4060a0:	8b 4c 24 48          	mov    ecx,DWORD PTR [esp+0x48]
  4060a4:	89 4c 24 48          	mov    DWORD PTR [esp+0x48],ecx
  4060a8:	8d 41 30             	lea    eax,[ecx+0x30]
  4060ab:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  4060af:	d8 cb                	fmul   st,st(3)
  4060b1:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  4060b4:	de ea                	fsubrp st(2),st
  4060b6:	d9 ee                	fldz   
  4060b8:	d9 ca                	fxch   st(2)
  4060ba:	dd e2                	fucom  st(2)
  4060bc:	df e0                	fnstsw ax
  4060be:	dd da                	fstp   st(2)
  4060c0:	9e                   	sahf   
  4060c1:	7a b5                	jp     406078 <___gdtoa+0xa58>
  4060c3:	75 b3                	jne    406078 <___gdtoa+0xa58>
  4060c5:	dd d8                	fstp   st(0)
  4060c7:	dd d8                	fstp   st(0)
  4060c9:	dd d8                	fstp   st(0)
  4060cb:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4060cf:	83 c0 01             	add    eax,0x1
  4060d2:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4060d6:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  4060dd:	00 
  4060de:	e9 ca fd ff ff       	jmp    405ead <___gdtoa+0x88d>
  4060e3:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  4060e7:	85 c0                	test   eax,eax
  4060e9:	0f 84 19 02 00 00    	je     406308 <___gdtoa+0xce8>
  4060ef:	8d 04 2e             	lea    eax,[esi+ebp*1]
  4060f2:	85 c0                	test   eax,eax
  4060f4:	7e 14                	jle    40610a <___gdtoa+0xaea>
  4060f6:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4060fa:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4060fe:	89 04 24             	mov    DWORD PTR [esp],eax
  406101:	e8 4a 19 00 00       	call   407a50 <___lshift_D2A>
  406106:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  40610a:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
  40610e:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
  406112:	85 f6                	test   esi,esi
  406114:	0f 85 e9 06 00 00    	jne    406803 <___gdtoa+0x11e3>
  40611a:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  40611e:	89 7c 24 1c          	mov    DWORD PTR [esp+0x1c],edi
  406122:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
  406126:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  40612d:	00 
  40612e:	89 74 24 28          	mov    DWORD PTR [esp+0x28],esi
  406132:	e9 d6 00 00 00       	jmp    40620d <___gdtoa+0xbed>
  406137:	89 14 24             	mov    DWORD PTR [esp],edx
  40613a:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  40613e:	e8 9d 14 00 00       	call   4075e0 <___Bfree_D2A>
  406143:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  406147:	89 c1                	mov    ecx,eax
  406149:	0b 8c 24 90 00 00 00 	or     ecx,DWORD PTR [esp+0x90]
  406150:	75 18                	jne    40616a <___gdtoa+0xb4a>
  406152:	8b 8c 24 88 00 00 00 	mov    ecx,DWORD PTR [esp+0x88]
  406159:	f6 01 01             	test   BYTE PTR [ecx],0x1
  40615c:	75 0c                	jne    40616a <___gdtoa+0xb4a>
  40615e:	8b 54 24 2c          	mov    edx,DWORD PTR [esp+0x2c]
  406162:	85 d2                	test   edx,edx
  406164:	0f 84 55 08 00 00    	je     4069bf <___gdtoa+0x139f>
  40616a:	85 f6                	test   esi,esi
  40616c:	0f 88 18 05 00 00    	js     40668a <___gdtoa+0x106a>
  406172:	0b b4 24 90 00 00 00 	or     esi,DWORD PTR [esp+0x90]
  406179:	75 10                	jne    40618b <___gdtoa+0xb6b>
  40617b:	8b b4 24 88 00 00 00 	mov    esi,DWORD PTR [esp+0x88]
  406182:	f6 06 01             	test   BYTE PTR [esi],0x1
  406185:	0f 84 ff 04 00 00    	je     40668a <___gdtoa+0x106a>
  40618b:	85 c0                	test   eax,eax
  40618d:	0f 8f c9 06 00 00    	jg     40685c <___gdtoa+0x123c>
  406193:	83 44 24 28 01       	add    DWORD PTR [esp+0x28],0x1
  406198:	0f b6 44 24 10       	movzx  eax,BYTE PTR [esp+0x10]
  40619d:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4061a1:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  4061a4:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  4061a8:	39 44 24 5c          	cmp    DWORD PTR [esp+0x5c],eax
  4061ac:	0f 84 97 06 00 00    	je     406849 <___gdtoa+0x1229>
  4061b2:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4061b5:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4061bc:	00 
  4061bd:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  4061c4:	00 
  4061c5:	e8 86 14 00 00       	call   407650 <___multadd_D2A>
  4061ca:	39 ef                	cmp    edi,ebp
  4061cc:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4061d3:	00 
  4061d4:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  4061db:	00 
  4061dc:	89 3c 24             	mov    DWORD PTR [esp],edi
  4061df:	89 c3                	mov    ebx,eax
  4061e1:	0f 84 8c 00 00 00    	je     406273 <___gdtoa+0xc53>
  4061e7:	e8 64 14 00 00       	call   407650 <___multadd_D2A>
  4061ec:	89 2c 24             	mov    DWORD PTR [esp],ebp
  4061ef:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4061f6:	00 
  4061f7:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  4061fe:	00 
  4061ff:	89 c7                	mov    edi,eax
  406201:	e8 4a 14 00 00       	call   407650 <___multadd_D2A>
  406206:	89 c5                	mov    ebp,eax
  406208:	83 44 24 5c 01       	add    DWORD PTR [esp+0x5c],0x1
  40620d:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  406211:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406214:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406218:	e8 d3 0f 00 00       	call   4071f0 <___quorem_D2A>
  40621d:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  406221:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406224:	89 c6                	mov    esi,eax
  406226:	83 c6 30             	add    esi,0x30
  406229:	89 74 24 10          	mov    DWORD PTR [esp+0x10],esi
  40622d:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  406231:	e8 2a 19 00 00       	call   407b60 <___cmp_D2A>
  406236:	89 6c 24 04          	mov    DWORD PTR [esp+0x4],ebp
  40623a:	89 c6                	mov    esi,eax
  40623c:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  406240:	89 04 24             	mov    DWORD PTR [esp],eax
  406243:	e8 68 19 00 00       	call   407bb0 <___diff_D2A>
  406248:	89 c2                	mov    edx,eax
  40624a:	b8 01 00 00 00       	mov    eax,0x1
  40624f:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  406252:	85 c9                	test   ecx,ecx
  406254:	0f 85 dd fe ff ff    	jne    406137 <___gdtoa+0xb17>
  40625a:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  40625e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406261:	89 54 24 20          	mov    DWORD PTR [esp+0x20],edx
  406265:	e8 f6 18 00 00       	call   407b60 <___cmp_D2A>
  40626a:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  40626e:	e9 c4 fe ff ff       	jmp    406137 <___gdtoa+0xb17>
  406273:	e8 d8 13 00 00       	call   407650 <___multadd_D2A>
  406278:	89 c7                	mov    edi,eax
  40627a:	89 c5                	mov    ebp,eax
  40627c:	eb 8a                	jmp    406208 <___gdtoa+0xbe8>
  40627e:	85 d2                	test   edx,edx
  406280:	0f 84 1b fc ff ff    	je     405ea1 <___gdtoa+0x881>
  406286:	89 14 24             	mov    DWORD PTR [esp],edx
  406289:	e8 52 13 00 00       	call   4075e0 <___Bfree_D2A>
  40628e:	66 90                	xchg   ax,ax
  406290:	e9 0c fc ff ff       	jmp    405ea1 <___gdtoa+0x881>
  406295:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  406299:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40629c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4062a0:	e8 1b 16 00 00       	call   4078c0 <___pow5mult_D2A>
  4062a5:	89 c3                	mov    ebx,eax
  4062a7:	e9 4e fa ff ff       	jmp    405cfa <___gdtoa+0x6da>
  4062ac:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4062b0:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4062b3:	e8 a8 18 00 00       	call   407b60 <___cmp_D2A>
  4062b8:	85 c0                	test   eax,eax
  4062ba:	0f 89 da fa ff ff    	jns    405d9a <___gdtoa+0x77a>
  4062c0:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4062c3:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4062ca:	00 
  4062cb:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  4062d2:	00 
  4062d3:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
  4062d8:	e8 73 13 00 00       	call   407650 <___multadd_D2A>
  4062dd:	89 c3                	mov    ebx,eax
  4062df:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  4062e3:	85 c0                	test   eax,eax
  4062e5:	0f 85 24 07 00 00    	jne    406a0f <___gdtoa+0x13ef>
  4062eb:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  4062f2:	02 
  4062f3:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  4062f7:	7e 0b                	jle    406304 <___gdtoa+0xce4>
  4062f9:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
  4062fe:	0f 8e 86 07 00 00    	jle    406a8a <___gdtoa+0x146a>
  406304:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406308:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  40630f:	00 
  406310:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  406314:	8b 6c 24 18          	mov    ebp,DWORD PTR [esp+0x18]
  406318:	eb 25                	jmp    40633f <___gdtoa+0xd1f>
  40631a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  406320:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406323:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  40632a:	00 
  40632b:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  406332:	00 
  406333:	e8 18 13 00 00       	call   407650 <___multadd_D2A>
  406338:	83 44 24 5c 01       	add    DWORD PTR [esp+0x5c],0x1
  40633d:	89 c3                	mov    ebx,eax
  40633f:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  406343:	83 c6 01             	add    esi,0x1
  406346:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406349:	e8 a2 0e 00 00       	call   4071f0 <___quorem_D2A>
  40634e:	83 c0 30             	add    eax,0x30
  406351:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  406354:	3b 6c 24 5c          	cmp    ebp,DWORD PTR [esp+0x5c]
  406358:	7f c6                	jg     406320 <___gdtoa+0xd00>
  40635a:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40635e:	31 d2                	xor    edx,edx
  406360:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  406364:	85 c0                	test   eax,eax
  406366:	0f 84 e5 03 00 00    	je     406751 <___gdtoa+0x1131>
  40636c:	83 f8 02             	cmp    eax,0x2
  40636f:	0f 84 18 04 00 00    	je     40678d <___gdtoa+0x116d>
  406375:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  406379:	0f 8e cb 05 00 00    	jle    40694a <___gdtoa+0x132a>
  40637f:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  406383:	8b 6c 24 24          	mov    ebp,DWORD PTR [esp+0x24]
  406387:	eb 15                	jmp    40639e <___gdtoa+0xd7e>
  406389:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  406390:	39 e8                	cmp    eax,ebp
  406392:	0f 84 a6 02 00 00    	je     40663e <___gdtoa+0x101e>
  406398:	0f b6 48 ff          	movzx  ecx,BYTE PTR [eax-0x1]
  40639c:	89 c6                	mov    esi,eax
  40639e:	80 f9 39             	cmp    cl,0x39
  4063a1:	8d 46 ff             	lea    eax,[esi-0x1]
  4063a4:	74 ea                	je     406390 <___gdtoa+0xd70>
  4063a6:	83 c1 01             	add    ecx,0x1
  4063a9:	88 08                	mov    BYTE PTR [eax],cl
  4063ab:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4063af:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  4063b6:	00 
  4063b7:	83 c0 01             	add    eax,0x1
  4063ba:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4063be:	e9 be fa ff ff       	jmp    405e81 <___gdtoa+0x861>
  4063c3:	83 fd 01             	cmp    ebp,0x1
  4063c6:	0f 85 68 f9 ff ff    	jne    405d34 <___gdtoa+0x714>
  4063cc:	8b 84 24 80 00 00 00 	mov    eax,DWORD PTR [esp+0x80]
  4063d3:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  4063d6:	83 c0 01             	add    eax,0x1
  4063d9:	39 84 24 84 00 00 00 	cmp    DWORD PTR [esp+0x84],eax
  4063e0:	0f 8e 4e f9 ff ff    	jle    405d34 <___gdtoa+0x714>
  4063e6:	83 44 24 28 01       	add    DWORD PTR [esp+0x28],0x1
  4063eb:	83 44 24 1c 01       	add    DWORD PTR [esp+0x1c],0x1
  4063f0:	c7 44 24 10 01 00 00 	mov    DWORD PTR [esp+0x10],0x1
  4063f7:	00 
  4063f8:	e9 37 f9 ff ff       	jmp    405d34 <___gdtoa+0x714>
  4063fd:	dd d8                	fstp   st(0)
  4063ff:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  406403:	85 c0                	test   eax,eax
  406405:	0f 84 fe 01 00 00    	je     406609 <___gdtoa+0xfe9>
  40640b:	dd d8                	fstp   st(0)
  40640d:	dd d8                	fstp   st(0)
  40640f:	83 7c 24 2c 01       	cmp    DWORD PTR [esp+0x2c],0x1
  406414:	0f 84 22 03 00 00    	je     40673c <___gdtoa+0x111c>
  40641a:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  40641e:	e9 ff f6 ff ff       	jmp    405b22 <___gdtoa+0x502>
  406423:	ba 01 00 00 00       	mov    edx,0x1
  406428:	c7 84 24 94 00 00 00 	mov    DWORD PTR [esp+0x94],0x1
  40642f:	01 00 00 00 
  406433:	e9 23 fb ff ff       	jmp    405f5b <___gdtoa+0x93b>
  406438:	83 7c 24 18 0e       	cmp    DWORD PTR [esp+0x18],0xe
  40643d:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  406444:	00 
  406445:	0f 96 c2             	setbe  dl
  406448:	21 c2                	and    edx,eax
  40644a:	b8 01 00 00 00       	mov    eax,0x1
  40644f:	e9 0f f5 ff ff       	jmp    405963 <___gdtoa+0x343>
  406454:	89 c2                	mov    edx,eax
  406456:	31 ff                	xor    edi,edi
  406458:	2b 54 24 30          	sub    edx,DWORD PTR [esp+0x30]
  40645c:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  406460:	01 54 24 3c          	add    DWORD PTR [esp+0x3c],edx
  406464:	e9 e9 f7 ff ff       	jmp    405c52 <___gdtoa+0x632>
  406469:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  40646d:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  406471:	dc 0c d5 78 a3 40 00 	fmul   QWORD PTR [edx*8+0x40a378]
  406478:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  40647f:	00 
  406480:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  406484:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  406489:	b4 0c                	mov    ah,0xc
  40648b:	d9 05 44 a3 40 00    	fld    DWORD PTR ds:0x40a344
  406491:	d9 ca                	fxch   st(2)
  406493:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  406498:	eb 0f                	jmp    4064a9 <___gdtoa+0xe89>
  40649a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4064a0:	d8 ca                	fmul   st,st(2)
  4064a2:	83 c0 01             	add    eax,0x1
  4064a5:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  4064a9:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  4064ad:	db 54 24 48          	fist   DWORD PTR [esp+0x48]
  4064b1:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  4064b5:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  4064b9:	85 c0                	test   eax,eax
  4064bb:	74 0a                	je     4064c7 <___gdtoa+0xea7>
  4064bd:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  4064c1:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  4064c5:	de e9                	fsubrp st(1),st
  4064c7:	83 c6 01             	add    esi,0x1
  4064ca:	8d 48 30             	lea    ecx,[eax+0x30]
  4064cd:	88 4e ff             	mov    BYTE PTR [esi-0x1],cl
  4064d0:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  4064d4:	39 d0                	cmp    eax,edx
  4064d6:	75 c8                	jne    4064a0 <___gdtoa+0xe80>
  4064d8:	dd da                	fstp   st(2)
  4064da:	d9 c9                	fxch   st(1)
  4064dc:	d9 05 54 a3 40 00    	fld    DWORD PTR ds:0x40a354
  4064e2:	d9 c2                	fld    st(2)
  4064e4:	d8 c1                	fadd   st,st(1)
  4064e6:	d9 ca                	fxch   st(2)
  4064e8:	dd e2                	fucom  st(2)
  4064ea:	df e0                	fnstsw ax
  4064ec:	dd da                	fstp   st(2)
  4064ee:	9e                   	sahf   
  4064ef:	0f 87 94 00 00 00    	ja     406589 <___gdtoa+0xf69>
  4064f5:	de e2                	fsubp  st(2),st
  4064f7:	d9 c9                	fxch   st(1)
  4064f9:	dd e9                	fucomp st(1)
  4064fb:	df e0                	fnstsw ax
  4064fd:	9e                   	sahf   
  4064fe:	0f 86 0c f7 ff ff    	jbe    405c10 <___gdtoa+0x5f0>
  406504:	dd d9                	fstp   st(1)
  406506:	d9 ee                	fldz   
  406508:	d9 c9                	fxch   st(1)
  40650a:	da e9                	fucompp 
  40650c:	df e0                	fnstsw ax
  40650e:	9e                   	sahf   
  40650f:	0f 8a 4d 04 00 00    	jp     406962 <___gdtoa+0x1342>
  406515:	0f 85 47 04 00 00    	jne    406962 <___gdtoa+0x1342>
  40651b:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  406522:	00 
  406523:	eb 06                	jmp    40652b <___gdtoa+0xf0b>
  406525:	0f b6 48 ff          	movzx  ecx,BYTE PTR [eax-0x1]
  406529:	89 c6                	mov    esi,eax
  40652b:	80 f9 30             	cmp    cl,0x30
  40652e:	8d 46 ff             	lea    eax,[esi-0x1]
  406531:	74 f2                	je     406525 <___gdtoa+0xf05>
  406533:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  406537:	83 c0 01             	add    eax,0x1
  40653a:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40653e:	e9 6a f9 ff ff       	jmp    405ead <___gdtoa+0x88d>
  406543:	dd d8                	fstp   st(0)
  406545:	dd d8                	fstp   st(0)
  406547:	dd d8                	fstp   st(0)
  406549:	c7 44 24 0c 02 00 00 	mov    DWORD PTR [esp+0xc],0x2
  406550:	00 
  406551:	31 ff                	xor    edi,edi
  406553:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  40655a:	00 
  40655b:	e9 0d f9 ff ff       	jmp    405e6d <___gdtoa+0x84d>
  406560:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406564:	83 e1 01             	and    ecx,0x1
  406567:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  40656b:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  40656f:	0f 84 ed 03 00 00    	je     406962 <___gdtoa+0x1342>
  406575:	eb 1a                	jmp    406591 <___gdtoa+0xf71>
  406577:	dd d8                	fstp   st(0)
  406579:	dd d8                	fstp   st(0)
  40657b:	dd d8                	fstp   st(0)
  40657d:	eb 12                	jmp    406591 <___gdtoa+0xf71>
  40657f:	dd d8                	fstp   st(0)
  406581:	dd d8                	fstp   st(0)
  406583:	dd d8                	fstp   st(0)
  406585:	dd d8                	fstp   st(0)
  406587:	eb 08                	jmp    406591 <___gdtoa+0xf71>
  406589:	dd d8                	fstp   st(0)
  40658b:	dd d8                	fstp   st(0)
  40658d:	dd d8                	fstp   st(0)
  40658f:	dd d8                	fstp   st(0)
  406591:	8b 54 24 24          	mov    edx,DWORD PTR [esp+0x24]
  406595:	eb 0e                	jmp    4065a5 <___gdtoa+0xf85>
  406597:	39 d0                	cmp    eax,edx
  406599:	0f 84 be 00 00 00    	je     40665d <___gdtoa+0x103d>
  40659f:	0f b6 48 ff          	movzx  ecx,BYTE PTR [eax-0x1]
  4065a3:	89 c6                	mov    esi,eax
  4065a5:	80 f9 39             	cmp    cl,0x39
  4065a8:	8d 46 ff             	lea    eax,[esi-0x1]
  4065ab:	74 ea                	je     406597 <___gdtoa+0xf77>
  4065ad:	89 54 24 24          	mov    DWORD PTR [esp+0x24],edx
  4065b1:	83 c1 01             	add    ecx,0x1
  4065b4:	88 08                	mov    BYTE PTR [eax],cl
  4065b6:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  4065ba:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  4065c1:	00 
  4065c2:	83 c0 01             	add    eax,0x1
  4065c5:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4065c9:	e9 df f8 ff ff       	jmp    405ead <___gdtoa+0x88d>
  4065ce:	8b b4 24 80 00 00 00 	mov    esi,DWORD PTR [esp+0x80]
  4065d5:	29 ef                	sub    edi,ebp
  4065d7:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  4065db:	8d 47 01             	lea    eax,[edi+0x1]
  4065de:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  4065e2:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
  4065e5:	29 fa                	sub    edx,edi
  4065e7:	39 ca                	cmp    edx,ecx
  4065e9:	0f 8d be 02 00 00    	jge    4068ad <___gdtoa+0x128d>
  4065ef:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4065f3:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  4065f7:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4065fb:	29 c8                	sub    eax,ecx
  4065fd:	83 c0 01             	add    eax,0x1
  406600:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  406604:	e9 5d f6 ff ff       	jmp    405c66 <___gdtoa+0x646>
  406609:	d8 c0                	fadd   st,st(0)
  40660b:	dd e1                	fucom  st(1)
  40660d:	df e0                	fnstsw ax
  40660f:	9e                   	sahf   
  406610:	0f 87 22 01 00 00    	ja     406738 <___gdtoa+0x1118>
  406616:	d9 c9                	fxch   st(1)
  406618:	da e9                	fucompp 
  40661a:	df e0                	fnstsw ax
  40661c:	9e                   	sahf   
  40661d:	7a 06                	jp     406625 <___gdtoa+0x1005>
  40661f:	0f 84 3b ff ff ff    	je     406560 <___gdtoa+0xf40>
  406625:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406629:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  40662d:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  406634:	00 
  406635:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  406639:	e9 ed fe ff ff       	jmp    40652b <___gdtoa+0xf0b>
  40663e:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  406642:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406649:	00 
  40664a:	c6 00 31             	mov    BYTE PTR [eax],0x31
  40664d:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406651:	83 c0 02             	add    eax,0x2
  406654:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406658:	e9 24 f8 ff ff       	jmp    405e81 <___gdtoa+0x861>
  40665d:	89 54 24 24          	mov    DWORD PTR [esp+0x24],edx
  406661:	b9 31 00 00 00       	mov    ecx,0x31
  406666:	83 44 24 38 01       	add    DWORD PTR [esp+0x38],0x1
  40666b:	c6 02 30             	mov    BYTE PTR [edx],0x30
  40666e:	e9 41 ff ff ff       	jmp    4065b4 <___gdtoa+0xf94>
  406673:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  406677:	31 c0                	xor    eax,eax
  406679:	2b 74 24 18          	sub    esi,DWORD PTR [esp+0x18]
  40667d:	c7 44 24 5c 00 00 00 	mov    DWORD PTR [esp+0x5c],0x0
  406684:	00 
  406685:	e9 dc f5 ff ff       	jmp    405c66 <___gdtoa+0x646>
  40668a:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  40668e:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  406692:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  406696:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  40669a:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
  40669e:	85 c9                	test   ecx,ecx
  4066a0:	0f 84 1e 02 00 00    	je     4068c4 <___gdtoa+0x12a4>
  4066a6:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  4066aa:	0f 8e 0a 02 00 00    	jle    4068ba <___gdtoa+0x129a>
  4066b0:	83 7c 24 2c 02       	cmp    DWORD PTR [esp+0x2c],0x2
  4066b5:	75 3a                	jne    4066f1 <___gdtoa+0x10d1>
  4066b7:	e9 63 02 00 00       	jmp    40691f <___gdtoa+0x12ff>
  4066bc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4066c0:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4066c3:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4066ca:	00 
  4066cb:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  4066d2:	00 
  4066d3:	e8 78 0f 00 00       	call   407650 <___multadd_D2A>
  4066d8:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4066dc:	89 04 24             	mov    DWORD PTR [esp],eax
  4066df:	89 c3                	mov    ebx,eax
  4066e1:	e8 0a 0b 00 00       	call   4071f0 <___quorem_D2A>
  4066e6:	8b 6c 24 18          	mov    ebp,DWORD PTR [esp+0x18]
  4066ea:	83 c0 30             	add    eax,0x30
  4066ed:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4066f1:	89 6c 24 04          	mov    DWORD PTR [esp+0x4],ebp
  4066f5:	89 3c 24             	mov    DWORD PTR [esp],edi
  4066f8:	e8 63 14 00 00       	call   407b60 <___cmp_D2A>
  4066fd:	85 c0                	test   eax,eax
  4066ff:	0f 8e 88 02 00 00    	jle    40698d <___gdtoa+0x136d>
  406705:	0f b6 44 24 10       	movzx  eax,BYTE PTR [esp+0x10]
  40670a:	83 c6 01             	add    esi,0x1
  40670d:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  406710:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  406717:	00 
  406718:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  40671f:	00 
  406720:	89 2c 24             	mov    DWORD PTR [esp],ebp
  406723:	e8 28 0f 00 00       	call   407650 <___multadd_D2A>
  406728:	39 6c 24 20          	cmp    DWORD PTR [esp+0x20],ebp
  40672c:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406730:	75 8e                	jne    4066c0 <___gdtoa+0x10a0>
  406732:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  406736:	eb 88                	jmp    4066c0 <___gdtoa+0x10a0>
  406738:	dd d8                	fstp   st(0)
  40673a:	dd d8                	fstp   st(0)
  40673c:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406740:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  406744:	8b 54 24 24          	mov    edx,DWORD PTR [esp+0x24]
  406748:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  40674c:	e9 54 fe ff ff       	jmp    4065a5 <___gdtoa+0xf85>
  406751:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406754:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  40675b:	00 
  40675c:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  406760:	e8 eb 12 00 00       	call   407a50 <___lshift_D2A>
  406765:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  406769:	89 04 24             	mov    DWORD PTR [esp],eax
  40676c:	89 c3                	mov    ebx,eax
  40676e:	e8 ed 13 00 00       	call   407b60 <___cmp_D2A>
  406773:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  406777:	83 f8 00             	cmp    eax,0x0
  40677a:	0f 8f ff fb ff ff    	jg     40637f <___gdtoa+0xd5f>
  406780:	75 0b                	jne    40678d <___gdtoa+0x116d>
  406782:	f6 44 24 10 01       	test   BYTE PTR [esp+0x10],0x1
  406787:	0f 85 f2 fb ff ff    	jne    40637f <___gdtoa+0xd5f>
  40678d:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  406791:	0f 8e dc 02 00 00    	jle    406a73 <___gdtoa+0x1453>
  406797:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  40679e:	00 
  40679f:	eb 02                	jmp    4067a3 <___gdtoa+0x1183>
  4067a1:	89 c6                	mov    esi,eax
  4067a3:	80 7e ff 30          	cmp    BYTE PTR [esi-0x1],0x30
  4067a7:	8d 46 ff             	lea    eax,[esi-0x1]
  4067aa:	74 f5                	je     4067a1 <___gdtoa+0x1181>
  4067ac:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4067b0:	83 c0 01             	add    eax,0x1
  4067b3:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4067b7:	e9 c5 f6 ff ff       	jmp    405e81 <___gdtoa+0x861>
  4067bc:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  4067c0:	85 c0                	test   eax,eax
  4067c2:	0f 84 fa f3 ff ff    	je     405bc2 <___gdtoa+0x5a2>
  4067c8:	8b 54 24 44          	mov    edx,DWORD PTR [esp+0x44]
  4067cc:	85 d2                	test   edx,edx
  4067ce:	0f 8e 3e f4 ff ff    	jle    405c12 <___gdtoa+0x5f2>
  4067d4:	d9 c0                	fld    st(0)
  4067d6:	d8 0d 44 a3 40 00    	fmul   DWORD PTR ds:0x40a344
  4067dc:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  4067e3:	ff 
  4067e4:	d9 c0                	fld    st(0)
  4067e6:	d8 0d 48 a3 40 00    	fmul   DWORD PTR ds:0x40a348
  4067ec:	d8 05 4c a3 40 00    	fadd   DWORD PTR ds:0x40a34c
  4067f2:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  4067f6:	81 6c 24 14 00 00 40 	sub    DWORD PTR [esp+0x14],0x3400000
  4067fd:	03 
  4067fe:	e9 02 f2 ff ff       	jmp    405a05 <___gdtoa+0x3e5>
  406803:	8b 45 04             	mov    eax,DWORD PTR [ebp+0x4]
  406806:	89 04 24             	mov    DWORD PTR [esp],eax
  406809:	e8 02 0d 00 00       	call   407510 <___Balloc_D2A>
  40680e:	8d 48 0c             	lea    ecx,[eax+0xc]
  406811:	89 c6                	mov    esi,eax
  406813:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  406816:	89 0c 24             	mov    DWORD PTR [esp],ecx
  406819:	8d 14 85 08 00 00 00 	lea    edx,[eax*4+0x8]
  406820:	89 e8                	mov    eax,ebp
  406822:	83 c0 0c             	add    eax,0xc
  406825:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  406829:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40682d:	e8 d6 18 00 00       	call   408108 <_memcpy>
  406832:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  406839:	00 
  40683a:	89 34 24             	mov    DWORD PTR [esp],esi
  40683d:	e8 0e 12 00 00       	call   407a50 <___lshift_D2A>
  406842:	89 c5                	mov    ebp,eax
  406844:	e9 d1 f8 ff ff       	jmp    40611a <___gdtoa+0xafa>
  406849:	89 fa                	mov    edx,edi
  40684b:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  40684f:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  406853:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  406857:	e9 04 fb ff ff       	jmp    406360 <___gdtoa+0xd40>
  40685c:	83 7c 24 2c 02       	cmp    DWORD PTR [esp+0x2c],0x2
  406861:	0f 84 2c f9 ff ff    	je     406193 <___gdtoa+0xb73>
  406867:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  40686b:	83 7c 24 10 39       	cmp    DWORD PTR [esp+0x10],0x39
  406870:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  406874:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  406878:	89 f0                	mov    eax,esi
  40687a:	0f 84 f1 00 00 00    	je     406971 <___gdtoa+0x1351>
  406880:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [esp+0x10]
  406885:	83 c6 01             	add    esi,0x1
  406888:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  40688c:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406893:	00 
  406894:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  406898:	83 c1 01             	add    ecx,0x1
  40689b:	88 08                	mov    BYTE PTR [eax],cl
  40689d:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4068a1:	83 c0 01             	add    eax,0x1
  4068a4:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4068a8:	e9 d4 f5 ff ff       	jmp    405e81 <___gdtoa+0x861>
  4068ad:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  4068b1:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4068b5:	e9 ac f3 ff ff       	jmp    405c66 <___gdtoa+0x646>
  4068ba:	83 7b 14 00          	cmp    DWORD PTR [ebx+0x14],0x0
  4068be:	0f 85 ec fd ff ff    	jne    4066b0 <___gdtoa+0x1090>
  4068c4:	85 c0                	test   eax,eax
  4068c6:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  4068ca:	0f 8e d3 00 00 00    	jle    4069a3 <___gdtoa+0x1383>
  4068d0:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4068d3:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  4068da:	00 
  4068db:	e8 70 11 00 00       	call   407a50 <___lshift_D2A>
  4068e0:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4068e4:	89 04 24             	mov    DWORD PTR [esp],eax
  4068e7:	89 c3                	mov    ebx,eax
  4068e9:	e8 72 12 00 00       	call   407b60 <___cmp_D2A>
  4068ee:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  4068f2:	83 f8 00             	cmp    eax,0x0
  4068f5:	0f 8e 98 01 00 00    	jle    406a93 <___gdtoa+0x1473>
  4068fb:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4068ff:	83 c0 31             	add    eax,0x31
  406902:	83 fa 39             	cmp    edx,0x39
  406905:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406909:	74 64                	je     40696f <___gdtoa+0x134f>
  40690b:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406912:	00 
  406913:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  406917:	7f 06                	jg     40691f <___gdtoa+0x12ff>
  406919:	83 7b 14 00          	cmp    DWORD PTR [ebx+0x14],0x0
  40691d:	74 08                	je     406927 <___gdtoa+0x1307>
  40691f:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  406926:	00 
  406927:	0f b6 44 24 10       	movzx  eax,BYTE PTR [esp+0x10]
  40692c:	83 c6 01             	add    esi,0x1
  40692f:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  406933:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  406937:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  40693a:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  40693e:	83 c0 01             	add    eax,0x1
  406941:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406945:	e9 37 f5 ff ff       	jmp    405e81 <___gdtoa+0x861>
  40694a:	8b 4b 14             	mov    ecx,DWORD PTR [ebx+0x14]
  40694d:	85 c9                	test   ecx,ecx
  40694f:	0f 85 2a fa ff ff    	jne    40637f <___gdtoa+0xd5f>
  406955:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  40695c:	00 
  40695d:	e9 41 fe ff ff       	jmp    4067a3 <___gdtoa+0x1183>
  406962:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  406969:	00 
  40696a:	e9 bc fb ff ff       	jmp    40652b <___gdtoa+0xf0b>
  40696f:	89 f0                	mov    eax,esi
  406971:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  406975:	83 c6 01             	add    esi,0x1
  406978:	b9 39 00 00 00       	mov    ecx,0x39
  40697d:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  406981:	8b 6c 24 24          	mov    ebp,DWORD PTR [esp+0x24]
  406985:	c6 00 39             	mov    BYTE PTR [eax],0x39
  406988:	e9 11 fa ff ff       	jmp    40639e <___gdtoa+0xd7e>
  40698d:	83 7c 24 10 39       	cmp    DWORD PTR [esp+0x10],0x39
  406992:	74 db                	je     40696f <___gdtoa+0x134f>
  406994:	83 44 24 10 01       	add    DWORD PTR [esp+0x10],0x1
  406999:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  4069a0:	00 
  4069a1:	eb 84                	jmp    406927 <___gdtoa+0x1307>
  4069a3:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  4069aa:	00 
  4069ab:	e9 63 ff ff ff       	jmp    406913 <___gdtoa+0x12f3>
  4069b0:	0f 85 a8 f6 ff ff    	jne    40605e <___gdtoa+0xa3e>
  4069b6:	dd d8                	fstp   st(0)
  4069b8:	dd d8                	fstp   st(0)
  4069ba:	e9 0c f7 ff ff       	jmp    4060cb <___gdtoa+0xaab>
  4069bf:	89 f1                	mov    ecx,esi
  4069c1:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4069c5:	83 7c 24 10 39       	cmp    DWORD PTR [esp+0x10],0x39
  4069ca:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  4069ce:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  4069d2:	89 f0                	mov    eax,esi
  4069d4:	74 99                	je     40696f <___gdtoa+0x134f>
  4069d6:	85 c9                	test   ecx,ecx
  4069d8:	7e 73                	jle    406a4d <___gdtoa+0x142d>
  4069da:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  4069de:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  4069e5:	00 
  4069e6:	83 c1 31             	add    ecx,0x31
  4069e9:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  4069ed:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [esp+0x10]
  4069f2:	83 c6 01             	add    esi,0x1
  4069f5:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  4069f9:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  4069fd:	88 08                	mov    BYTE PTR [eax],cl
  4069ff:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406a03:	83 c0 01             	add    eax,0x1
  406a06:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406a0a:	e9 72 f4 ff ff       	jmp    405e81 <___gdtoa+0x861>
  406a0f:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  406a13:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  406a1a:	00 
  406a1b:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  406a22:	00 
  406a23:	89 04 24             	mov    DWORD PTR [esp],eax
  406a26:	e8 25 0c 00 00       	call   407650 <___multadd_D2A>
  406a2b:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
  406a30:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  406a34:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  406a38:	7f 0a                	jg     406a44 <___gdtoa+0x1424>
  406a3a:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  406a41:	02 
  406a42:	7f 46                	jg     406a8a <___gdtoa+0x146a>
  406a44:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406a48:	e9 a2 f6 ff ff       	jmp    4060ef <___gdtoa+0xacf>
  406a4d:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  406a51:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  406a58:	00 
  406a59:	7f 92                	jg     4069ed <___gdtoa+0x13cd>
  406a5b:	83 7b 14 01          	cmp    DWORD PTR [ebx+0x14],0x1
  406a5f:	19 c9                	sbb    ecx,ecx
  406a61:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
  406a65:	f7 54 24 18          	not    DWORD PTR [esp+0x18]
  406a69:	83 64 24 18 10       	and    DWORD PTR [esp+0x18],0x10
  406a6e:	e9 7a ff ff ff       	jmp    4069ed <___gdtoa+0x13cd>
  406a73:	83 7b 14 00          	cmp    DWORD PTR [ebx+0x14],0x0
  406a77:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  406a7e:	00 
  406a7f:	0f 85 12 fd ff ff    	jne    406797 <___gdtoa+0x1177>
  406a85:	e9 19 fd ff ff       	jmp    4067a3 <___gdtoa+0x1183>
  406a8a:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406a8e:	e9 21 f3 ff ff       	jmp    405db4 <___gdtoa+0x794>
  406a93:	0f 85 72 fe ff ff    	jne    40690b <___gdtoa+0x12eb>
  406a99:	f6 44 24 10 01       	test   BYTE PTR [esp+0x10],0x1
  406a9e:	66 90                	xchg   ax,ax
  406aa0:	0f 84 65 fe ff ff    	je     40690b <___gdtoa+0x12eb>
  406aa6:	e9 50 fe ff ff       	jmp    4068fb <___gdtoa+0x12db>
  406aab:	31 c0                	xor    eax,eax
  406aad:	8d 76 00             	lea    esi,[esi+0x0]
  406ab0:	e9 8f ec ff ff       	jmp    405744 <___gdtoa+0x124>
  406ab5:	b8 01 00 00 00       	mov    eax,0x1
  406aba:	e9 40 ee ff ff       	jmp    4058ff <___gdtoa+0x2df>
  406abf:	90                   	nop

00406ac0 <___wcrtomb_cp>:
  406ac0:	55                   	push   ebp
  406ac1:	89 e5                	mov    ebp,esp
  406ac3:	83 ec 48             	sub    esp,0x48
  406ac6:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
  406ac9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  406acc:	85 d2                	test   edx,edx
  406ace:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
  406ad2:	75 12                	jne    406ae6 <___wcrtomb_cp+0x26>
  406ad4:	66 3d ff 00          	cmp    ax,0xff
  406ad8:	77 5d                	ja     406b37 <___wcrtomb_cp+0x77>
  406ada:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  406add:	88 01                	mov    BYTE PTR [ecx],al
  406adf:	b8 01 00 00 00       	mov    eax,0x1
  406ae4:	c9                   	leave  
  406ae5:	c3                   	ret    
  406ae6:	8d 45 f4             	lea    eax,[ebp-0xc]
  406ae9:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  406aed:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  406af0:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  406af7:	00 
  406af8:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
  406aff:	00 
  406b00:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406b07:	00 
  406b08:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  406b0c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406b0f:	89 14 24             	mov    DWORD PTR [esp],edx
  406b12:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  406b19:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406b1d:	8d 45 e4             	lea    eax,[ebp-0x1c]
  406b20:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  406b24:	e8 ef 16 00 00       	call   408218 <_WideCharToMultiByte@32>
  406b29:	83 ec 20             	sub    esp,0x20
  406b2c:	85 c0                	test   eax,eax
  406b2e:	74 07                	je     406b37 <___wcrtomb_cp+0x77>
  406b30:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  406b33:	85 d2                	test   edx,edx
  406b35:	74 ad                	je     406ae4 <___wcrtomb_cp+0x24>
  406b37:	e8 04 16 00 00       	call   408140 <__errno>
  406b3c:	c7 00 2a 00 00 00    	mov    DWORD PTR [eax],0x2a
  406b42:	b8 ff ff ff ff       	mov    eax,0xffffffff
  406b47:	c9                   	leave  
  406b48:	c3                   	ret    
  406b49:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00406b50 <_wcrtomb>:
  406b50:	57                   	push   edi
  406b51:	56                   	push   esi
  406b52:	53                   	push   ebx
  406b53:	83 ec 20             	sub    esp,0x20
  406b56:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  406b5a:	8b 74 24 34          	mov    esi,DWORD PTR [esp+0x34]
  406b5e:	85 db                	test   ebx,ebx
  406b60:	74 5e                	je     406bc0 <_wcrtomb+0x70>
  406b62:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  406b67:	8b 38                	mov    edi,DWORD PTR [eax]
  406b69:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406b70:	00 
  406b71:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406b78:	e8 cb 15 00 00       	call   408148 <_setlocale>
  406b7d:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406b84:	00 
  406b85:	89 04 24             	mov    DWORD PTR [esp],eax
  406b88:	e8 fb 15 00 00       	call   408188 <_strchr>
  406b8d:	31 d2                	xor    edx,edx
  406b8f:	85 c0                	test   eax,eax
  406b91:	74 0d                	je     406ba0 <_wcrtomb+0x50>
  406b93:	83 c0 01             	add    eax,0x1
  406b96:	89 04 24             	mov    DWORD PTR [esp],eax
  406b99:	e8 f2 15 00 00       	call   408190 <_atoi>
  406b9e:	89 c2                	mov    edx,eax
  406ba0:	0f b7 f6             	movzx  esi,si
  406ba3:	89 7c 24 0c          	mov    DWORD PTR [esp+0xc],edi
  406ba7:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  406bab:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406bae:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  406bb2:	e8 09 ff ff ff       	call   406ac0 <___wcrtomb_cp>
  406bb7:	83 c4 20             	add    esp,0x20
  406bba:	5b                   	pop    ebx
  406bbb:	5e                   	pop    esi
  406bbc:	5f                   	pop    edi
  406bbd:	c3                   	ret    
  406bbe:	66 90                	xchg   ax,ax
  406bc0:	8d 5c 24 1e          	lea    ebx,[esp+0x1e]
  406bc4:	eb 9c                	jmp    406b62 <_wcrtomb+0x12>
  406bc6:	8d 76 00             	lea    esi,[esi+0x0]
  406bc9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00406bd0 <_wcsrtombs>:
  406bd0:	55                   	push   ebp
  406bd1:	57                   	push   edi
  406bd2:	56                   	push   esi
  406bd3:	31 f6                	xor    esi,esi
  406bd5:	53                   	push   ebx
  406bd6:	83 ec 3c             	sub    esp,0x3c
  406bd9:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406be0:	00 
  406be1:	8b 5c 24 50          	mov    ebx,DWORD PTR [esp+0x50]
  406be5:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406bec:	e8 57 15 00 00       	call   408148 <_setlocale>
  406bf1:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406bf8:	00 
  406bf9:	89 04 24             	mov    DWORD PTR [esp],eax
  406bfc:	e8 87 15 00 00       	call   408188 <_strchr>
  406c01:	85 c0                	test   eax,eax
  406c03:	74 0d                	je     406c12 <_wcsrtombs+0x42>
  406c05:	83 c0 01             	add    eax,0x1
  406c08:	89 04 24             	mov    DWORD PTR [esp],eax
  406c0b:	e8 80 15 00 00       	call   408190 <_atoi>
  406c10:	89 c6                	mov    esi,eax
  406c12:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  406c17:	8b 00                	mov    eax,DWORD PTR [eax]
  406c19:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  406c1d:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  406c21:	8b 38                	mov    edi,DWORD PTR [eax]
  406c23:	85 ff                	test   edi,edi
  406c25:	0f 84 cc 00 00 00    	je     406cf7 <_wcsrtombs+0x127>
  406c2b:	31 ed                	xor    ebp,ebp
  406c2d:	85 db                	test   ebx,ebx
  406c2f:	74 76                	je     406ca7 <_wcsrtombs+0xd7>
  406c31:	8b 4c 24 58          	mov    ecx,DWORD PTR [esp+0x58]
  406c35:	85 c9                	test   ecx,ecx
  406c37:	74 49                	je     406c82 <_wcsrtombs+0xb2>
  406c39:	89 f0                	mov    eax,esi
  406c3b:	89 fe                	mov    esi,edi
  406c3d:	89 c7                	mov    edi,eax
  406c3f:	eb 13                	jmp    406c54 <_wcsrtombs+0x84>
  406c41:	01 c3                	add    ebx,eax
  406c43:	01 c5                	add    ebp,eax
  406c45:	80 7b ff 00          	cmp    BYTE PTR [ebx-0x1],0x0
  406c49:	74 47                	je     406c92 <_wcsrtombs+0xc2>
  406c4b:	83 c6 02             	add    esi,0x2
  406c4e:	39 6c 24 58          	cmp    DWORD PTR [esp+0x58],ebp
  406c52:	76 2c                	jbe    406c80 <_wcsrtombs+0xb0>
  406c54:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  406c58:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  406c5c:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406c60:	0f b7 06             	movzx  eax,WORD PTR [esi]
  406c63:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406c66:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406c6a:	e8 51 fe ff ff       	call   406ac0 <___wcrtomb_cp>
  406c6f:	85 c0                	test   eax,eax
  406c71:	7f ce                	jg     406c41 <_wcsrtombs+0x71>
  406c73:	b8 ff ff ff ff       	mov    eax,0xffffffff
  406c78:	83 c4 3c             	add    esp,0x3c
  406c7b:	5b                   	pop    ebx
  406c7c:	5e                   	pop    esi
  406c7d:	5f                   	pop    edi
  406c7e:	5d                   	pop    ebp
  406c7f:	c3                   	ret    
  406c80:	89 f7                	mov    edi,esi
  406c82:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  406c86:	89 38                	mov    DWORD PTR [eax],edi
  406c88:	83 c4 3c             	add    esp,0x3c
  406c8b:	89 e8                	mov    eax,ebp
  406c8d:	5b                   	pop    ebx
  406c8e:	5e                   	pop    esi
  406c8f:	5f                   	pop    edi
  406c90:	5d                   	pop    ebp
  406c91:	c3                   	ret    
  406c92:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  406c96:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  406c9c:	83 c4 3c             	add    esp,0x3c
  406c9f:	5b                   	pop    ebx
  406ca0:	8d 45 ff             	lea    eax,[ebp-0x1]
  406ca3:	5e                   	pop    esi
  406ca4:	5f                   	pop    edi
  406ca5:	5d                   	pop    ebp
  406ca6:	c3                   	ret    
  406ca7:	8b 44 24 58          	mov    eax,DWORD PTR [esp+0x58]
  406cab:	85 c0                	test   eax,eax
  406cad:	74 63                	je     406d12 <_wcsrtombs+0x142>
  406caf:	89 e8                	mov    eax,ebp
  406cb1:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
  406cb5:	89 fd                	mov    ebp,edi
  406cb7:	89 c7                	mov    edi,eax
  406cb9:	eb 17                	jmp    406cd2 <_wcsrtombs+0x102>
  406cbb:	90                   	nop
  406cbc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406cc0:	01 c7                	add    edi,eax
  406cc2:	80 7c 04 2d 00       	cmp    BYTE PTR [esp+eax*1+0x2d],0x0
  406cc7:	74 38                	je     406d01 <_wcsrtombs+0x131>
  406cc9:	83 c5 02             	add    ebp,0x2
  406ccc:	39 7c 24 58          	cmp    DWORD PTR [esp+0x58],edi
  406cd0:	76 37                	jbe    406d09 <_wcsrtombs+0x139>
  406cd2:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  406cd6:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  406cda:	0f b7 45 00          	movzx  eax,WORD PTR [ebp+0x0]
  406cde:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406ce2:	8d 44 24 2e          	lea    eax,[esp+0x2e]
  406ce6:	89 04 24             	mov    DWORD PTR [esp],eax
  406ce9:	e8 d2 fd ff ff       	call   406ac0 <___wcrtomb_cp>
  406cee:	85 c0                	test   eax,eax
  406cf0:	7f ce                	jg     406cc0 <_wcsrtombs+0xf0>
  406cf2:	e9 7c ff ff ff       	jmp    406c73 <_wcsrtombs+0xa3>
  406cf7:	83 c4 3c             	add    esp,0x3c
  406cfa:	31 c0                	xor    eax,eax
  406cfc:	5b                   	pop    ebx
  406cfd:	5e                   	pop    esi
  406cfe:	5f                   	pop    edi
  406cff:	5d                   	pop    ebp
  406d00:	c3                   	ret    
  406d01:	8d 47 ff             	lea    eax,[edi-0x1]
  406d04:	e9 6f ff ff ff       	jmp    406c78 <_wcsrtombs+0xa8>
  406d09:	89 fd                	mov    ebp,edi
  406d0b:	89 e8                	mov    eax,ebp
  406d0d:	e9 66 ff ff ff       	jmp    406c78 <_wcsrtombs+0xa8>
  406d12:	89 dd                	mov    ebp,ebx
  406d14:	89 e8                	mov    eax,ebp
  406d16:	e9 5d ff ff ff       	jmp    406c78 <_wcsrtombs+0xa8>
  406d1b:	90                   	nop
  406d1c:	90                   	nop
  406d1d:	90                   	nop
  406d1e:	90                   	nop
  406d1f:	90                   	nop

00406d20 <___mbrtowc_cp>:
  406d20:	55                   	push   ebp
  406d21:	89 e5                	mov    ebp,esp
  406d23:	56                   	push   esi
  406d24:	53                   	push   ebx
  406d25:	83 ec 30             	sub    esp,0x30
  406d28:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
  406d2b:	8b 75 14             	mov    esi,DWORD PTR [ebp+0x14]
  406d2e:	85 db                	test   ebx,ebx
  406d30:	0f 84 2d 01 00 00    	je     406e63 <___mbrtowc_cp+0x143>
  406d36:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
  406d39:	85 c9                	test   ecx,ecx
  406d3b:	0f 84 2f 01 00 00    	je     406e70 <___mbrtowc_cp+0x150>
  406d41:	8b 06                	mov    eax,DWORD PTR [esi]
  406d43:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
  406d49:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  406d4c:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  406d4f:	84 c0                	test   al,al
  406d51:	0f 84 99 00 00 00    	je     406df0 <___mbrtowc_cp+0xd0>
  406d57:	83 7d 1c 01          	cmp    DWORD PTR [ebp+0x1c],0x1
  406d5b:	76 73                	jbe    406dd0 <___mbrtowc_cp+0xb0>
  406d5d:	80 7d f4 00          	cmp    BYTE PTR [ebp-0xc],0x0
  406d61:	0f 85 9a 00 00 00    	jne    406e01 <___mbrtowc_cp+0xe1>
  406d67:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406d6b:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406d6e:	89 04 24             	mov    DWORD PTR [esp],eax
  406d71:	e8 aa 14 00 00       	call   408220 <_IsDBCSLeadByteEx@8>
  406d76:	83 ec 08             	sub    esp,0x8
  406d79:	85 c0                	test   eax,eax
  406d7b:	74 53                	je     406dd0 <___mbrtowc_cp+0xb0>
  406d7d:	83 7d 10 01          	cmp    DWORD PTR [ebp+0x10],0x1
  406d81:	0f 86 05 01 00 00    	jbe    406e8c <___mbrtowc_cp+0x16c>
  406d87:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406d8a:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  406d91:	00 
  406d92:	c7 44 24 0c 02 00 00 	mov    DWORD PTR [esp+0xc],0x2
  406d99:	00 
  406d9a:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  406d9e:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406da2:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406da5:	c7 44 24 04 08 00 00 	mov    DWORD PTR [esp+0x4],0x8
  406dac:	00 
  406dad:	89 04 24             	mov    DWORD PTR [esp],eax
  406db0:	e8 73 14 00 00       	call   408228 <_MultiByteToWideChar@24>
  406db5:	83 ec 18             	sub    esp,0x18
  406db8:	85 c0                	test   eax,eax
  406dba:	0f 84 b7 00 00 00    	je     406e77 <___mbrtowc_cp+0x157>
  406dc0:	8d 65 f8             	lea    esp,[ebp-0x8]
  406dc3:	b8 02 00 00 00       	mov    eax,0x2
  406dc8:	5b                   	pop    ebx
  406dc9:	5e                   	pop    esi
  406dca:	5d                   	pop    ebp
  406dcb:	c3                   	ret    
  406dcc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406dd0:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406dd3:	85 c0                	test   eax,eax
  406dd5:	75 50                	jne    406e27 <___mbrtowc_cp+0x107>
  406dd7:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  406dda:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  406ddd:	66 89 02             	mov    WORD PTR [edx],ax
  406de0:	8d 65 f8             	lea    esp,[ebp-0x8]
  406de3:	b8 01 00 00 00       	mov    eax,0x1
  406de8:	5b                   	pop    ebx
  406de9:	5e                   	pop    esi
  406dea:	5d                   	pop    ebp
  406deb:	c3                   	ret    
  406dec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406df0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406df3:	31 d2                	xor    edx,edx
  406df5:	66 89 10             	mov    WORD PTR [eax],dx
  406df8:	31 c0                	xor    eax,eax
  406dfa:	8d 65 f8             	lea    esp,[ebp-0x8]
  406dfd:	5b                   	pop    ebx
  406dfe:	5e                   	pop    esi
  406dff:	5d                   	pop    ebp
  406e00:	c3                   	ret    
  406e01:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
  406e04:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406e07:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  406e0e:	00 
  406e0f:	c7 44 24 0c 02 00 00 	mov    DWORD PTR [esp+0xc],0x2
  406e16:	00 
  406e17:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406e1b:	8d 45 f4             	lea    eax,[ebp-0xc]
  406e1e:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  406e22:	e9 7b ff ff ff       	jmp    406da2 <___mbrtowc_cp+0x82>
  406e27:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406e2a:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  406e31:	00 
  406e32:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
  406e39:	00 
  406e3a:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  406e3e:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406e42:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406e45:	c7 44 24 04 08 00 00 	mov    DWORD PTR [esp+0x4],0x8
  406e4c:	00 
  406e4d:	89 04 24             	mov    DWORD PTR [esp],eax
  406e50:	e8 d3 13 00 00       	call   408228 <_MultiByteToWideChar@24>
  406e55:	83 ec 18             	sub    esp,0x18
  406e58:	85 c0                	test   eax,eax
  406e5a:	74 1b                	je     406e77 <___mbrtowc_cp+0x157>
  406e5c:	b8 01 00 00 00       	mov    eax,0x1
  406e61:	eb 97                	jmp    406dfa <___mbrtowc_cp+0xda>
  406e63:	8d 65 f8             	lea    esp,[ebp-0x8]
  406e66:	31 c0                	xor    eax,eax
  406e68:	5b                   	pop    ebx
  406e69:	5e                   	pop    esi
  406e6a:	5d                   	pop    ebp
  406e6b:	c3                   	ret    
  406e6c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406e70:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  406e75:	eb 83                	jmp    406dfa <___mbrtowc_cp+0xda>
  406e77:	e8 c4 12 00 00       	call   408140 <__errno>
  406e7c:	c7 00 2a 00 00 00    	mov    DWORD PTR [eax],0x2a
  406e82:	b8 ff ff ff ff       	mov    eax,0xffffffff
  406e87:	e9 6e ff ff ff       	jmp    406dfa <___mbrtowc_cp+0xda>
  406e8c:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  406e8f:	88 06                	mov    BYTE PTR [esi],al
  406e91:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  406e96:	e9 5f ff ff ff       	jmp    406dfa <___mbrtowc_cp+0xda>
  406e9b:	90                   	nop
  406e9c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00406ea0 <_mbrtowc>:
  406ea0:	56                   	push   esi
  406ea1:	31 f6                	xor    esi,esi
  406ea3:	53                   	push   ebx
  406ea4:	83 ec 34             	sub    esp,0x34
  406ea7:	8b 5c 24 40          	mov    ebx,DWORD PTR [esp+0x40]
  406eab:	66 89 74 24 2e       	mov    WORD PTR [esp+0x2e],si
  406eb0:	85 db                	test   ebx,ebx
  406eb2:	74 70                	je     406f24 <_mbrtowc+0x84>
  406eb4:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  406eb9:	8b 30                	mov    esi,DWORD PTR [eax]
  406ebb:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406ec2:	00 
  406ec3:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406eca:	e8 79 12 00 00       	call   408148 <_setlocale>
  406ecf:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406ed6:	00 
  406ed7:	89 04 24             	mov    DWORD PTR [esp],eax
  406eda:	e8 a9 12 00 00       	call   408188 <_strchr>
  406edf:	31 c9                	xor    ecx,ecx
  406ee1:	85 c0                	test   eax,eax
  406ee3:	74 0d                	je     406ef2 <_mbrtowc+0x52>
  406ee5:	83 c0 01             	add    eax,0x1
  406ee8:	89 04 24             	mov    DWORD PTR [esp],eax
  406eeb:	e8 a0 12 00 00       	call   408190 <_atoi>
  406ef0:	89 c1                	mov    ecx,eax
  406ef2:	8b 54 24 4c          	mov    edx,DWORD PTR [esp+0x4c]
  406ef6:	85 d2                	test   edx,edx
  406ef8:	74 36                	je     406f30 <_mbrtowc+0x90>
  406efa:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  406efe:	89 74 24 14          	mov    DWORD PTR [esp+0x14],esi
  406f02:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406f05:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  406f09:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  406f0d:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  406f11:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  406f15:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406f19:	e8 02 fe ff ff       	call   406d20 <___mbrtowc_cp>
  406f1e:	83 c4 34             	add    esp,0x34
  406f21:	5b                   	pop    ebx
  406f22:	5e                   	pop    esi
  406f23:	c3                   	ret    
  406f24:	8d 5c 24 2e          	lea    ebx,[esp+0x2e]
  406f28:	eb 8a                	jmp    406eb4 <_mbrtowc+0x14>
  406f2a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  406f30:	ba 78 d0 40 00       	mov    edx,0x40d078
  406f35:	eb c3                	jmp    406efa <_mbrtowc+0x5a>
  406f37:	89 f6                	mov    esi,esi
  406f39:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00406f40 <_mbsrtowcs>:
  406f40:	55                   	push   ebp
  406f41:	57                   	push   edi
  406f42:	56                   	push   esi
  406f43:	53                   	push   ebx
  406f44:	83 ec 3c             	sub    esp,0x3c
  406f47:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  406f4b:	8b 5c 24 50          	mov    ebx,DWORD PTR [esp+0x50]
  406f4f:	8b 74 24 54          	mov    esi,DWORD PTR [esp+0x54]
  406f53:	8b 7c 24 58          	mov    edi,DWORD PTR [esp+0x58]
  406f57:	85 c0                	test   eax,eax
  406f59:	0f 84 41 01 00 00    	je     4070a0 <_mbsrtowcs+0x160>
  406f5f:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406f66:	00 
  406f67:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406f6e:	e8 d5 11 00 00       	call   408148 <_setlocale>
  406f73:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406f7a:	00 
  406f7b:	89 04 24             	mov    DWORD PTR [esp],eax
  406f7e:	e8 05 12 00 00       	call   408188 <_strchr>
  406f83:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  406f8a:	00 
  406f8b:	85 c0                	test   eax,eax
  406f8d:	74 0f                	je     406f9e <_mbsrtowcs+0x5e>
  406f8f:	83 c0 01             	add    eax,0x1
  406f92:	89 04 24             	mov    DWORD PTR [esp],eax
  406f95:	e8 f6 11 00 00       	call   408190 <_atoi>
  406f9a:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406f9e:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  406fa3:	85 f6                	test   esi,esi
  406fa5:	8b 00                	mov    eax,DWORD PTR [eax]
  406fa7:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  406fab:	0f 84 df 00 00 00    	je     407090 <_mbsrtowcs+0x150>
  406fb1:	8b 0e                	mov    ecx,DWORD PTR [esi]
  406fb3:	85 c9                	test   ecx,ecx
  406fb5:	0f 84 d5 00 00 00    	je     407090 <_mbsrtowcs+0x150>
  406fbb:	85 db                	test   ebx,ebx
  406fbd:	74 71                	je     407030 <_mbsrtowcs+0xf0>
  406fbf:	85 ff                	test   edi,edi
  406fc1:	0f 84 c9 00 00 00    	je     407090 <_mbsrtowcs+0x150>
  406fc7:	89 74 24 54          	mov    DWORD PTR [esp+0x54],esi
  406fcb:	31 ed                	xor    ebp,ebp
  406fcd:	89 de                	mov    esi,ebx
  406fcf:	8b 5c 24 54          	mov    ebx,DWORD PTR [esp+0x54]
  406fd3:	eb 0f                	jmp    406fe4 <_mbsrtowcs+0xa4>
  406fd5:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  406fd7:	01 c5                	add    ebp,eax
  406fd9:	83 c6 02             	add    esi,0x2
  406fdc:	01 c1                	add    ecx,eax
  406fde:	39 ef                	cmp    edi,ebp
  406fe0:	89 0b                	mov    DWORD PTR [ebx],ecx
  406fe2:	76 30                	jbe    407014 <_mbsrtowcs+0xd4>
  406fe4:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  406fe8:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  406fec:	89 34 24             	mov    DWORD PTR [esp],esi
  406fef:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  406ff3:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  406ff7:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406ffb:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  406fff:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  407003:	89 f8                	mov    eax,edi
  407005:	29 e8                	sub    eax,ebp
  407007:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40700b:	e8 10 fd ff ff       	call   406d20 <___mbrtowc_cp>
  407010:	85 c0                	test   eax,eax
  407012:	7f c1                	jg     406fd5 <_mbsrtowcs+0x95>
  407014:	85 c0                	test   eax,eax
  407016:	75 6e                	jne    407086 <_mbsrtowcs+0x146>
  407018:	39 fd                	cmp    ebp,edi
  40701a:	73 6a                	jae    407086 <_mbsrtowcs+0x146>
  40701c:	c7 03 00 00 00 00    	mov    DWORD PTR [ebx],0x0
  407022:	83 c4 3c             	add    esp,0x3c
  407025:	89 e8                	mov    eax,ebp
  407027:	5b                   	pop    ebx
  407028:	5e                   	pop    esi
  407029:	5f                   	pop    edi
  40702a:	5d                   	pop    ebp
  40702b:	c3                   	ret    
  40702c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407030:	31 ed                	xor    ebp,ebp
  407032:	66 89 6c 24 2e       	mov    WORD PTR [esp+0x2e],bp
  407037:	31 ed                	xor    ebp,ebp
  407039:	85 ff                	test   edi,edi
  40703b:	74 49                	je     407086 <_mbsrtowcs+0x146>
  40703d:	89 7c 24 58          	mov    DWORD PTR [esp+0x58],edi
  407041:	8d 5c 24 2e          	lea    ebx,[esp+0x2e]
  407045:	89 f7                	mov    edi,esi
  407047:	8b 74 24 1c          	mov    esi,DWORD PTR [esp+0x1c]
  40704b:	eb 11                	jmp    40705e <_mbsrtowcs+0x11e>
  40704d:	8d 76 00             	lea    esi,[esi+0x0]
  407050:	8b 0f                	mov    ecx,DWORD PTR [edi]
  407052:	01 c5                	add    ebp,eax
  407054:	01 c1                	add    ecx,eax
  407056:	39 6c 24 58          	cmp    DWORD PTR [esp+0x58],ebp
  40705a:	89 0f                	mov    DWORD PTR [edi],ecx
  40705c:	76 28                	jbe    407086 <_mbsrtowcs+0x146>
  40705e:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  407062:	89 74 24 14          	mov    DWORD PTR [esp+0x14],esi
  407066:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  40706a:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  40706e:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  407072:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  407076:	89 1c 24             	mov    DWORD PTR [esp],ebx
  407079:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40707d:	e8 9e fc ff ff       	call   406d20 <___mbrtowc_cp>
  407082:	85 c0                	test   eax,eax
  407084:	7f ca                	jg     407050 <_mbsrtowcs+0x110>
  407086:	83 c4 3c             	add    esp,0x3c
  407089:	89 e8                	mov    eax,ebp
  40708b:	5b                   	pop    ebx
  40708c:	5e                   	pop    esi
  40708d:	5f                   	pop    edi
  40708e:	5d                   	pop    ebp
  40708f:	c3                   	ret    
  407090:	83 c4 3c             	add    esp,0x3c
  407093:	31 c0                	xor    eax,eax
  407095:	5b                   	pop    ebx
  407096:	5e                   	pop    esi
  407097:	5f                   	pop    edi
  407098:	5d                   	pop    ebp
  407099:	c3                   	ret    
  40709a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4070a0:	c7 44 24 5c 74 d0 40 	mov    DWORD PTR [esp+0x5c],0x40d074
  4070a7:	00 
  4070a8:	e9 b2 fe ff ff       	jmp    406f5f <_mbsrtowcs+0x1f>
  4070ad:	8d 76 00             	lea    esi,[esi+0x0]

004070b0 <_mbrlen>:
  4070b0:	53                   	push   ebx
  4070b1:	31 c0                	xor    eax,eax
  4070b3:	83 ec 38             	sub    esp,0x38
  4070b6:	66 89 44 24 2e       	mov    WORD PTR [esp+0x2e],ax
  4070bb:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  4070c0:	8b 18                	mov    ebx,DWORD PTR [eax]
  4070c2:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  4070c9:	00 
  4070ca:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  4070d1:	e8 72 10 00 00       	call   408148 <_setlocale>
  4070d6:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  4070dd:	00 
  4070de:	89 04 24             	mov    DWORD PTR [esp],eax
  4070e1:	e8 a2 10 00 00       	call   408188 <_strchr>
  4070e6:	31 c9                	xor    ecx,ecx
  4070e8:	85 c0                	test   eax,eax
  4070ea:	74 0d                	je     4070f9 <_mbrlen+0x49>
  4070ec:	83 c0 01             	add    eax,0x1
  4070ef:	89 04 24             	mov    DWORD PTR [esp],eax
  4070f2:	e8 99 10 00 00       	call   408190 <_atoi>
  4070f7:	89 c1                	mov    ecx,eax
  4070f9:	8b 54 24 48          	mov    edx,DWORD PTR [esp+0x48]
  4070fd:	85 d2                	test   edx,edx
  4070ff:	74 2f                	je     407130 <_mbrlen+0x80>
  407101:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  407105:	89 5c 24 14          	mov    DWORD PTR [esp+0x14],ebx
  407109:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  40710d:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  407111:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  407115:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407119:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40711d:	8d 44 24 2e          	lea    eax,[esp+0x2e]
  407121:	89 04 24             	mov    DWORD PTR [esp],eax
  407124:	e8 f7 fb ff ff       	call   406d20 <___mbrtowc_cp>
  407129:	83 c4 38             	add    esp,0x38
  40712c:	5b                   	pop    ebx
  40712d:	c3                   	ret    
  40712e:	66 90                	xchg   ax,ax
  407130:	ba 70 d0 40 00       	mov    edx,0x40d070
  407135:	eb ca                	jmp    407101 <_mbrlen+0x51>
  407137:	90                   	nop
  407138:	90                   	nop
  407139:	90                   	nop
  40713a:	90                   	nop
  40713b:	90                   	nop
  40713c:	90                   	nop
  40713d:	90                   	nop
  40713e:	90                   	nop
  40713f:	90                   	nop

00407140 <___rv_alloc_D2A>:
  407140:	53                   	push   ebx
  407141:	31 db                	xor    ebx,ebx
  407143:	83 ec 18             	sub    esp,0x18
  407146:	8b 4c 24 20          	mov    ecx,DWORD PTR [esp+0x20]
  40714a:	83 f9 13             	cmp    ecx,0x13
  40714d:	76 11                	jbe    407160 <___rv_alloc_D2A+0x20>
  40714f:	b8 04 00 00 00       	mov    eax,0x4
  407154:	01 c0                	add    eax,eax
  407156:	83 c3 01             	add    ebx,0x1
  407159:	8d 50 10             	lea    edx,[eax+0x10]
  40715c:	39 ca                	cmp    edx,ecx
  40715e:	76 f4                	jbe    407154 <___rv_alloc_D2A+0x14>
  407160:	89 1c 24             	mov    DWORD PTR [esp],ebx
  407163:	e8 a8 03 00 00       	call   407510 <___Balloc_D2A>
  407168:	89 18                	mov    DWORD PTR [eax],ebx
  40716a:	83 c4 18             	add    esp,0x18
  40716d:	83 c0 04             	add    eax,0x4
  407170:	5b                   	pop    ebx
  407171:	c3                   	ret    
  407172:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  407179:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00407180 <___nrv_alloc_D2A>:
  407180:	56                   	push   esi
  407181:	53                   	push   ebx
  407182:	83 ec 14             	sub    esp,0x14
  407185:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  407189:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
  40718d:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  407191:	89 04 24             	mov    DWORD PTR [esp],eax
  407194:	e8 a7 ff ff ff       	call   407140 <___rv_alloc_D2A>
  407199:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
  40719c:	8d 4b 01             	lea    ecx,[ebx+0x1]
  40719f:	84 d2                	test   dl,dl
  4071a1:	88 10                	mov    BYTE PTR [eax],dl
  4071a3:	89 c2                	mov    edx,eax
  4071a5:	74 10                	je     4071b7 <___nrv_alloc_D2A+0x37>
  4071a7:	83 c1 01             	add    ecx,0x1
  4071aa:	0f b6 59 ff          	movzx  ebx,BYTE PTR [ecx-0x1]
  4071ae:	83 c2 01             	add    edx,0x1
  4071b1:	84 db                	test   bl,bl
  4071b3:	88 1a                	mov    BYTE PTR [edx],bl
  4071b5:	75 f0                	jne    4071a7 <___nrv_alloc_D2A+0x27>
  4071b7:	85 f6                	test   esi,esi
  4071b9:	74 02                	je     4071bd <___nrv_alloc_D2A+0x3d>
  4071bb:	89 16                	mov    DWORD PTR [esi],edx
  4071bd:	83 c4 14             	add    esp,0x14
  4071c0:	5b                   	pop    ebx
  4071c1:	5e                   	pop    esi
  4071c2:	c3                   	ret    
  4071c3:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4071c9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004071d0 <___freedtoa>:
  4071d0:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  4071d4:	ba 01 00 00 00       	mov    edx,0x1
  4071d9:	8b 48 fc             	mov    ecx,DWORD PTR [eax-0x4]
  4071dc:	83 e8 04             	sub    eax,0x4
  4071df:	d3 e2                	shl    edx,cl
  4071e1:	89 48 04             	mov    DWORD PTR [eax+0x4],ecx
  4071e4:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
  4071e7:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4071eb:	e9 f0 03 00 00       	jmp    4075e0 <___Bfree_D2A>

004071f0 <___quorem_D2A>:
  4071f0:	55                   	push   ebp
  4071f1:	57                   	push   edi
  4071f2:	56                   	push   esi
  4071f3:	53                   	push   ebx
  4071f4:	83 ec 4c             	sub    esp,0x4c
  4071f7:	8b 44 24 64          	mov    eax,DWORD PTR [esp+0x64]
  4071fb:	8b 7c 24 60          	mov    edi,DWORD PTR [esp+0x60]
  4071ff:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
  407202:	31 c0                	xor    eax,eax
  407204:	3b 57 10             	cmp    edx,DWORD PTR [edi+0x10]
  407207:	0f 8f d6 01 00 00    	jg     4073e3 <___quorem_D2A+0x1f3>
  40720d:	8b 44 24 64          	mov    eax,DWORD PTR [esp+0x64]
  407211:	8b 74 24 60          	mov    esi,DWORD PTR [esp+0x60]
  407215:	83 c0 14             	add    eax,0x14
  407218:	89 c7                	mov    edi,eax
  40721a:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  40721e:	8d 42 ff             	lea    eax,[edx-0x1]
  407221:	31 d2                	xor    edx,edx
  407223:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  407227:	c1 e0 02             	shl    eax,0x2
  40722a:	01 c7                	add    edi,eax
  40722c:	8d 5e 14             	lea    ebx,[esi+0x14]
  40722f:	01 d8                	add    eax,ebx
  407231:	89 7c 24 28          	mov    DWORD PTR [esp+0x28],edi
  407235:	8b 3f                	mov    edi,DWORD PTR [edi]
  407237:	89 44 24 3c          	mov    DWORD PTR [esp+0x3c],eax
  40723b:	8b 00                	mov    eax,DWORD PTR [eax]
  40723d:	89 5c 24 2c          	mov    DWORD PTR [esp+0x2c],ebx
  407241:	8d 4f 01             	lea    ecx,[edi+0x1]
  407244:	f7 f1                	div    ecx
  407246:	89 7c 24 10          	mov    DWORD PTR [esp+0x10],edi
  40724a:	85 c0                	test   eax,eax
  40724c:	89 c5                	mov    ebp,eax
  40724e:	89 44 24 34          	mov    DWORD PTR [esp+0x34],eax
  407252:	0f 84 c7 00 00 00    	je     40731f <___quorem_D2A+0x12f>
  407258:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
  40725c:	89 de                	mov    esi,ebx
  40725e:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  407265:	00 
  407266:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  40726d:	00 
  40726e:	c7 44 24 10 00 00 00 	mov    DWORD PTR [esp+0x10],0x0
  407275:	00 
  407276:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  40727d:	00 
  40727e:	66 90                	xchg   ax,ax
  407280:	83 c7 04             	add    edi,0x4
  407283:	89 e8                	mov    eax,ebp
  407285:	f7 67 fc             	mul    DWORD PTR [edi-0x4]
  407288:	03 44 24 20          	add    eax,DWORD PTR [esp+0x20]
  40728c:	13 54 24 24          	adc    edx,DWORD PTR [esp+0x24]
  407290:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [esp+0x1c],0x0
  407297:	00 
  407298:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  40729c:	89 d3                	mov    ebx,edx
  40729e:	89 d9                	mov    ecx,ebx
  4072a0:	31 db                	xor    ebx,ebx
  4072a2:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  4072a6:	8b 0e                	mov    ecx,DWORD PTR [esi]
  4072a8:	89 5c 24 24          	mov    DWORD PTR [esp+0x24],ebx
  4072ac:	31 db                	xor    ebx,ebx
  4072ae:	2b 4c 24 18          	sub    ecx,DWORD PTR [esp+0x18]
  4072b2:	1b 5c 24 1c          	sbb    ebx,DWORD PTR [esp+0x1c]
  4072b6:	2b 4c 24 10          	sub    ecx,DWORD PTR [esp+0x10]
  4072ba:	1b 5c 24 14          	sbb    ebx,DWORD PTR [esp+0x14]
  4072be:	83 c6 04             	add    esi,0x4
  4072c1:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  4072c8:	00 
  4072c9:	89 d8                	mov    eax,ebx
  4072cb:	83 e0 01             	and    eax,0x1
  4072ce:	39 7c 24 28          	cmp    DWORD PTR [esp+0x28],edi
  4072d2:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4072d6:	89 4e fc             	mov    DWORD PTR [esi-0x4],ecx
  4072d9:	73 a5                	jae    407280 <___quorem_D2A+0x90>
  4072db:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  4072df:	8b 38                	mov    edi,DWORD PTR [eax]
  4072e1:	85 ff                	test   edi,edi
  4072e3:	75 3a                	jne    40731f <___quorem_D2A+0x12f>
  4072e5:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  4072e9:	89 c6                	mov    esi,eax
  4072eb:	83 e8 04             	sub    eax,0x4
  4072ee:	39 c1                	cmp    ecx,eax
  4072f0:	73 22                	jae    407314 <___quorem_D2A+0x124>
  4072f2:	8b 76 fc             	mov    esi,DWORD PTR [esi-0x4]
  4072f5:	85 f6                	test   esi,esi
  4072f7:	75 1b                	jne    407314 <___quorem_D2A+0x124>
  4072f9:	8b 54 24 30          	mov    edx,DWORD PTR [esp+0x30]
  4072fd:	eb 07                	jmp    407306 <___quorem_D2A+0x116>
  4072ff:	90                   	nop
  407300:	8b 18                	mov    ebx,DWORD PTR [eax]
  407302:	85 db                	test   ebx,ebx
  407304:	75 0a                	jne    407310 <___quorem_D2A+0x120>
  407306:	83 e8 04             	sub    eax,0x4
  407309:	83 ea 01             	sub    edx,0x1
  40730c:	39 c1                	cmp    ecx,eax
  40730e:	72 f0                	jb     407300 <___quorem_D2A+0x110>
  407310:	89 54 24 30          	mov    DWORD PTR [esp+0x30],edx
  407314:	8b 44 24 60          	mov    eax,DWORD PTR [esp+0x60]
  407318:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  40731c:	89 78 10             	mov    DWORD PTR [eax+0x10],edi
  40731f:	8b 44 24 64          	mov    eax,DWORD PTR [esp+0x64]
  407323:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  407327:	8b 44 24 60          	mov    eax,DWORD PTR [esp+0x60]
  40732b:	89 04 24             	mov    DWORD PTR [esp],eax
  40732e:	e8 2d 08 00 00       	call   407b60 <___cmp_D2A>
  407333:	85 c0                	test   eax,eax
  407335:	0f 88 a4 00 00 00    	js     4073df <___quorem_D2A+0x1ef>
  40733b:	31 f6                	xor    esi,esi
  40733d:	31 ff                	xor    edi,edi
  40733f:	8d 45 01             	lea    eax,[ebp+0x1]
  407342:	8b 6c 24 2c          	mov    ebp,DWORD PTR [esp+0x2c]
  407346:	89 74 24 10          	mov    DWORD PTR [esp+0x10],esi
  40734a:	8b 74 24 38          	mov    esi,DWORD PTR [esp+0x38]
  40734e:	89 7c 24 14          	mov    DWORD PTR [esp+0x14],edi
  407352:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
  407356:	89 44 24 34          	mov    DWORD PTR [esp+0x34],eax
  40735a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  407360:	83 c6 04             	add    esi,0x4
  407363:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  407366:	31 db                	xor    ebx,ebx
  407368:	8b 4e fc             	mov    ecx,DWORD PTR [esi-0x4]
  40736b:	31 d2                	xor    edx,edx
  40736d:	29 c8                	sub    eax,ecx
  40736f:	19 da                	sbb    edx,ebx
  407371:	2b 44 24 10          	sub    eax,DWORD PTR [esp+0x10]
  407375:	1b 54 24 14          	sbb    edx,DWORD PTR [esp+0x14]
  407379:	83 c5 04             	add    ebp,0x4
  40737c:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  407383:	00 
  407384:	89 d3                	mov    ebx,edx
  407386:	83 e3 01             	and    ebx,0x1
  407389:	39 f7                	cmp    edi,esi
  40738b:	89 5c 24 10          	mov    DWORD PTR [esp+0x10],ebx
  40738f:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  407392:	73 cc                	jae    407360 <___quorem_D2A+0x170>
  407394:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  407398:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  40739c:	8d 14 98             	lea    edx,[eax+ebx*4]
  40739f:	8b 3a                	mov    edi,DWORD PTR [edx]
  4073a1:	85 ff                	test   edi,edi
  4073a3:	75 3a                	jne    4073df <___quorem_D2A+0x1ef>
  4073a5:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  4073a9:	8d 42 fc             	lea    eax,[edx-0x4]
  4073ac:	39 c1                	cmp    ecx,eax
  4073ae:	73 24                	jae    4073d4 <___quorem_D2A+0x1e4>
  4073b0:	8b 72 fc             	mov    esi,DWORD PTR [edx-0x4]
  4073b3:	85 f6                	test   esi,esi
  4073b5:	75 1d                	jne    4073d4 <___quorem_D2A+0x1e4>
  4073b7:	89 da                	mov    edx,ebx
  4073b9:	eb 0b                	jmp    4073c6 <___quorem_D2A+0x1d6>
  4073bb:	90                   	nop
  4073bc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4073c0:	8b 18                	mov    ebx,DWORD PTR [eax]
  4073c2:	85 db                	test   ebx,ebx
  4073c4:	75 0a                	jne    4073d0 <___quorem_D2A+0x1e0>
  4073c6:	83 e8 04             	sub    eax,0x4
  4073c9:	83 ea 01             	sub    edx,0x1
  4073cc:	39 c1                	cmp    ecx,eax
  4073ce:	72 f0                	jb     4073c0 <___quorem_D2A+0x1d0>
  4073d0:	89 54 24 30          	mov    DWORD PTR [esp+0x30],edx
  4073d4:	8b 44 24 60          	mov    eax,DWORD PTR [esp+0x60]
  4073d8:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  4073dc:	89 78 10             	mov    DWORD PTR [eax+0x10],edi
  4073df:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  4073e3:	83 c4 4c             	add    esp,0x4c
  4073e6:	5b                   	pop    ebx
  4073e7:	5e                   	pop    esi
  4073e8:	5f                   	pop    edi
  4073e9:	5d                   	pop    ebp
  4073ea:	c3                   	ret    
  4073eb:	90                   	nop
  4073ec:	90                   	nop
  4073ed:	90                   	nop
  4073ee:	90                   	nop
  4073ef:	90                   	nop

004073f0 <_dtoa_lock>:
  4073f0:	55                   	push   ebp
  4073f1:	89 e5                	mov    ebp,esp
  4073f3:	53                   	push   ebx
  4073f4:	89 c3                	mov    ebx,eax
  4073f6:	83 ec 14             	sub    esp,0x14
  4073f9:	8b 15 c8 d9 40 00    	mov    edx,DWORD PTR ds:0x40d9c8
  4073ff:	83 fa 02             	cmp    edx,0x2
  407402:	74 7f                	je     407483 <_dtoa_lock+0x93>
  407404:	85 d2                	test   edx,edx
  407406:	75 1d                	jne    407425 <_dtoa_lock+0x35>
  407408:	eb 2a                	jmp    407434 <_dtoa_lock+0x44>
  40740a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  407410:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  407417:	e8 14 0e 00 00       	call   408230 <_Sleep@4>
  40741c:	83 ec 04             	sub    esp,0x4
  40741f:	8b 15 c8 d9 40 00    	mov    edx,DWORD PTR ds:0x40d9c8
  407425:	83 fa 01             	cmp    edx,0x1
  407428:	74 e6                	je     407410 <_dtoa_lock+0x20>
  40742a:	83 fa 02             	cmp    edx,0x2
  40742d:	74 54                	je     407483 <_dtoa_lock+0x93>
  40742f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  407432:	c9                   	leave  
  407433:	c3                   	ret    
  407434:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  40743b:	00 
  40743c:	c7 04 24 c8 d9 40 00 	mov    DWORD PTR [esp],0x40d9c8
  407443:	e8 f0 0d 00 00       	call   408238 <_InterlockedExchange@8>
  407448:	83 ec 08             	sub    esp,0x8
  40744b:	85 c0                	test   eax,eax
  40744d:	75 51                	jne    4074a0 <_dtoa_lock+0xb0>
  40744f:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  407456:	e8 9d 0d 00 00       	call   4081f8 <_InitializeCriticalSection@4>
  40745b:	83 ec 04             	sub    esp,0x4
  40745e:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  407465:	e8 8e 0d 00 00       	call   4081f8 <_InitializeCriticalSection@4>
  40746a:	83 ec 04             	sub    esp,0x4
  40746d:	c7 04 24 c0 74 40 00 	mov    DWORD PTR [esp],0x4074c0
  407474:	e8 67 9e ff ff       	call   4012e0 <_atexit>
  407479:	c7 05 c8 d9 40 00 02 	mov    DWORD PTR ds:0x40d9c8,0x2
  407480:	00 00 00 
  407483:	8d 04 5b             	lea    eax,[ebx+ebx*2]
  407486:	8d 04 c5 e0 d9 40 00 	lea    eax,[eax*8+0x40d9e0]
  40748d:	89 04 24             	mov    DWORD PTR [esp],eax
  407490:	e8 3b 0d 00 00       	call   4081d0 <_EnterCriticalSection@4>
  407495:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  407498:	83 ec 04             	sub    esp,0x4
  40749b:	c9                   	leave  
  40749c:	c3                   	ret    
  40749d:	8d 76 00             	lea    esi,[esi+0x0]
  4074a0:	83 f8 02             	cmp    eax,0x2
  4074a3:	0f 85 76 ff ff ff    	jne    40741f <_dtoa_lock+0x2f>
  4074a9:	c7 05 c8 d9 40 00 02 	mov    DWORD PTR ds:0x40d9c8,0x2
  4074b0:	00 00 00 
  4074b3:	eb ce                	jmp    407483 <_dtoa_lock+0x93>
  4074b5:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4074b9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004074c0 <_dtoa_lock_cleanup>:
  4074c0:	55                   	push   ebp
  4074c1:	89 e5                	mov    ebp,esp
  4074c3:	83 ec 18             	sub    esp,0x18
  4074c6:	c7 44 24 04 03 00 00 	mov    DWORD PTR [esp+0x4],0x3
  4074cd:	00 
  4074ce:	c7 04 24 c8 d9 40 00 	mov    DWORD PTR [esp],0x40d9c8
  4074d5:	e8 5e 0d 00 00       	call   408238 <_InterlockedExchange@8>
  4074da:	83 ec 08             	sub    esp,0x8
  4074dd:	83 f8 02             	cmp    eax,0x2
  4074e0:	74 02                	je     4074e4 <_dtoa_lock_cleanup+0x24>
  4074e2:	c9                   	leave  
  4074e3:	c3                   	ret    
  4074e4:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  4074eb:	e8 00 0d 00 00       	call   4081f0 <_DeleteCriticalSection@4>
  4074f0:	83 ec 04             	sub    esp,0x4
  4074f3:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  4074fa:	e8 f1 0c 00 00       	call   4081f0 <_DeleteCriticalSection@4>
  4074ff:	83 ec 04             	sub    esp,0x4
  407502:	c9                   	leave  
  407503:	c3                   	ret    
  407504:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  40750a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00407510 <___Balloc_D2A>:
  407510:	55                   	push   ebp
  407511:	31 c0                	xor    eax,eax
  407513:	89 e5                	mov    ebp,esp
  407515:	57                   	push   edi
  407516:	56                   	push   esi
  407517:	53                   	push   ebx
  407518:	83 ec 1c             	sub    esp,0x1c
  40751b:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  40751e:	e8 cd fe ff ff       	call   4073f0 <_dtoa_lock>
  407523:	83 fe 09             	cmp    esi,0x9
  407526:	7f 2e                	jg     407556 <___Balloc_D2A+0x46>
  407528:	8b 1c b5 a0 d9 40 00 	mov    ebx,DWORD PTR [esi*4+0x40d9a0]
  40752f:	85 db                	test   ebx,ebx
  407531:	74 6e                	je     4075a1 <___Balloc_D2A+0x91>
  407533:	8b 03                	mov    eax,DWORD PTR [ebx]
  407535:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  40753c:	89 04 b5 a0 d9 40 00 	mov    DWORD PTR [esi*4+0x40d9a0],eax
  407543:	75 44                	jne    407589 <___Balloc_D2A+0x79>
  407545:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  40754c:	e8 97 0c 00 00       	call   4081e8 <_LeaveCriticalSection@4>
  407551:	83 ec 04             	sub    esp,0x4
  407554:	eb 33                	jmp    407589 <___Balloc_D2A+0x79>
  407556:	bf 01 00 00 00       	mov    edi,0x1
  40755b:	89 f1                	mov    ecx,esi
  40755d:	d3 e7                	shl    edi,cl
  40755f:	8d 04 bd 1b 00 00 00 	lea    eax,[edi*4+0x1b]
  407566:	c1 e8 03             	shr    eax,0x3
  407569:	c1 e0 03             	shl    eax,0x3
  40756c:	89 04 24             	mov    DWORD PTR [esp],eax
  40756f:	e8 ac 0b 00 00       	call   408120 <_malloc>
  407574:	85 c0                	test   eax,eax
  407576:	89 c3                	mov    ebx,eax
  407578:	74 5f                	je     4075d9 <___Balloc_D2A+0xc9>
  40757a:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  407581:	89 73 04             	mov    DWORD PTR [ebx+0x4],esi
  407584:	89 7b 08             	mov    DWORD PTR [ebx+0x8],edi
  407587:	74 bc                	je     407545 <___Balloc_D2A+0x35>
  407589:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
  407590:	89 d8                	mov    eax,ebx
  407592:	c7 43 0c 00 00 00 00 	mov    DWORD PTR [ebx+0xc],0x0
  407599:	8d 65 f4             	lea    esp,[ebp-0xc]
  40759c:	5b                   	pop    ebx
  40759d:	5e                   	pop    esi
  40759e:	5f                   	pop    edi
  40759f:	5d                   	pop    ebp
  4075a0:	c3                   	ret    
  4075a1:	8b 1d 20 90 40 00    	mov    ebx,DWORD PTR ds:0x409020
  4075a7:	bf 01 00 00 00       	mov    edi,0x1
  4075ac:	89 f1                	mov    ecx,esi
  4075ae:	d3 e7                	shl    edi,cl
  4075b0:	8d 04 bd 1b 00 00 00 	lea    eax,[edi*4+0x1b]
  4075b7:	c1 e8 03             	shr    eax,0x3
  4075ba:	89 da                	mov    edx,ebx
  4075bc:	81 ea a0 d0 40 00    	sub    edx,0x40d0a0
  4075c2:	c1 fa 03             	sar    edx,0x3
  4075c5:	01 c2                	add    edx,eax
  4075c7:	81 fa 20 01 00 00    	cmp    edx,0x120
  4075cd:	77 9a                	ja     407569 <___Balloc_D2A+0x59>
  4075cf:	8d 04 c3             	lea    eax,[ebx+eax*8]
  4075d2:	a3 20 90 40 00       	mov    ds:0x409020,eax
  4075d7:	eb a1                	jmp    40757a <___Balloc_D2A+0x6a>
  4075d9:	31 c0                	xor    eax,eax
  4075db:	eb bc                	jmp    407599 <___Balloc_D2A+0x89>
  4075dd:	8d 76 00             	lea    esi,[esi+0x0]

004075e0 <___Bfree_D2A>:
  4075e0:	55                   	push   ebp
  4075e1:	89 e5                	mov    ebp,esp
  4075e3:	53                   	push   ebx
  4075e4:	83 ec 14             	sub    esp,0x14
  4075e7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  4075ea:	85 db                	test   ebx,ebx
  4075ec:	74 29                	je     407617 <___Bfree_D2A+0x37>
  4075ee:	83 7b 04 09          	cmp    DWORD PTR [ebx+0x4],0x9
  4075f2:	7f 2c                	jg     407620 <___Bfree_D2A+0x40>
  4075f4:	31 c0                	xor    eax,eax
  4075f6:	e8 f5 fd ff ff       	call   4073f0 <_dtoa_lock>
  4075fb:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  4075fe:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  407605:	8b 14 85 a0 d9 40 00 	mov    edx,DWORD PTR [eax*4+0x40d9a0]
  40760c:	89 1c 85 a0 d9 40 00 	mov    DWORD PTR [eax*4+0x40d9a0],ebx
  407613:	89 13                	mov    DWORD PTR [ebx],edx
  407615:	74 19                	je     407630 <___Bfree_D2A+0x50>
  407617:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  40761a:	c9                   	leave  
  40761b:	c3                   	ret    
  40761c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407620:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  407623:	c9                   	leave  
  407624:	e9 ef 0a 00 00       	jmp    408118 <_free>
  407629:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  407630:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  407637:	e8 ac 0b 00 00       	call   4081e8 <_LeaveCriticalSection@4>
  40763c:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  40763f:	83 ec 04             	sub    esp,0x4
  407642:	c9                   	leave  
  407643:	c3                   	ret    
  407644:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  40764a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00407650 <___multadd_D2A>:
  407650:	55                   	push   ebp
  407651:	31 c9                	xor    ecx,ecx
  407653:	57                   	push   edi
  407654:	56                   	push   esi
  407655:	53                   	push   ebx
  407656:	83 ec 2c             	sub    esp,0x2c
  407659:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  40765d:	8b 7c 24 48          	mov    edi,DWORD PTR [esp+0x48]
  407661:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  407664:	89 fd                	mov    ebp,edi
  407666:	c1 fd 1f             	sar    ebp,0x1f
  407669:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  40766d:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407671:	8d 58 14             	lea    ebx,[eax+0x14]
  407674:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  407678:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40767c:	c1 f8 1f             	sar    eax,0x1f
  40767f:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  407683:	8b 04 8b             	mov    eax,DWORD PTR [ebx+ecx*4]
  407686:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
  40768a:	0f af f0             	imul   esi,eax
  40768d:	f7 64 24 10          	mul    DWORD PTR [esp+0x10]
  407691:	01 f2                	add    edx,esi
  407693:	01 f8                	add    eax,edi
  407695:	11 ea                	adc    edx,ebp
  407697:	89 d5                	mov    ebp,edx
  407699:	89 ef                	mov    edi,ebp
  40769b:	31 ed                	xor    ebp,ebp
  40769d:	89 04 8b             	mov    DWORD PTR [ebx+ecx*4],eax
  4076a0:	83 c1 01             	add    ecx,0x1
  4076a3:	39 4c 24 1c          	cmp    DWORD PTR [esp+0x1c],ecx
  4076a7:	7f da                	jg     407683 <___multadd_D2A+0x33>
  4076a9:	89 ea                	mov    edx,ebp
  4076ab:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  4076af:	09 fa                	or     edx,edi
  4076b1:	74 1d                	je     4076d0 <___multadd_D2A+0x80>
  4076b3:	8b 54 24 1c          	mov    edx,DWORD PTR [esp+0x1c]
  4076b7:	3b 50 08             	cmp    edx,DWORD PTR [eax+0x8]
  4076ba:	7d 1c                	jge    4076d8 <___multadd_D2A+0x88>
  4076bc:	8b 54 24 40          	mov    edx,DWORD PTR [esp+0x40]
  4076c0:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  4076c4:	89 7c 82 14          	mov    DWORD PTR [edx+eax*4+0x14],edi
  4076c8:	83 c0 01             	add    eax,0x1
  4076cb:	89 42 10             	mov    DWORD PTR [edx+0x10],eax
  4076ce:	89 d0                	mov    eax,edx
  4076d0:	83 c4 2c             	add    esp,0x2c
  4076d3:	5b                   	pop    ebx
  4076d4:	5e                   	pop    esi
  4076d5:	5f                   	pop    edi
  4076d6:	5d                   	pop    ebp
  4076d7:	c3                   	ret    
  4076d8:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  4076db:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4076df:	83 c0 01             	add    eax,0x1
  4076e2:	89 04 24             	mov    DWORD PTR [esp],eax
  4076e5:	e8 26 fe ff ff       	call   407510 <___Balloc_D2A>
  4076ea:	85 c0                	test   eax,eax
  4076ec:	89 c3                	mov    ebx,eax
  4076ee:	74 3a                	je     40772a <___multadd_D2A+0xda>
  4076f0:	8d 48 0c             	lea    ecx,[eax+0xc]
  4076f3:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  4076f7:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  4076fa:	89 0c 24             	mov    DWORD PTR [esp],ecx
  4076fd:	8d 14 85 08 00 00 00 	lea    edx,[eax*4+0x8]
  407704:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407708:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  40770c:	83 c0 0c             	add    eax,0xc
  40770f:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  407713:	e8 f0 09 00 00       	call   408108 <_memcpy>
  407718:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  40771c:	89 04 24             	mov    DWORD PTR [esp],eax
  40771f:	e8 bc fe ff ff       	call   4075e0 <___Bfree_D2A>
  407724:	89 5c 24 40          	mov    DWORD PTR [esp+0x40],ebx
  407728:	eb 92                	jmp    4076bc <___multadd_D2A+0x6c>
  40772a:	31 c0                	xor    eax,eax
  40772c:	eb a2                	jmp    4076d0 <___multadd_D2A+0x80>
  40772e:	66 90                	xchg   ax,ax

00407730 <___i2b_D2A>:
  407730:	83 ec 1c             	sub    esp,0x1c
  407733:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  40773a:	e8 d1 fd ff ff       	call   407510 <___Balloc_D2A>
  40773f:	85 c0                	test   eax,eax
  407741:	74 0e                	je     407751 <___i2b_D2A+0x21>
  407743:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  407747:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  40774e:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
  407751:	83 c4 1c             	add    esp,0x1c
  407754:	c3                   	ret    
  407755:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407759:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00407760 <___mult_D2A>:
  407760:	55                   	push   ebp
  407761:	57                   	push   edi
  407762:	56                   	push   esi
  407763:	53                   	push   ebx
  407764:	83 ec 3c             	sub    esp,0x3c
  407767:	8b 7c 24 50          	mov    edi,DWORD PTR [esp+0x50]
  40776b:	8b 6c 24 54          	mov    ebp,DWORD PTR [esp+0x54]
  40776f:	8b 77 10             	mov    esi,DWORD PTR [edi+0x10]
  407772:	8b 5d 10             	mov    ebx,DWORD PTR [ebp+0x10]
  407775:	39 de                	cmp    esi,ebx
  407777:	7d 0c                	jge    407785 <___mult_D2A+0x25>
  407779:	89 f0                	mov    eax,esi
  40777b:	89 de                	mov    esi,ebx
  40777d:	89 c3                	mov    ebx,eax
  40777f:	89 f8                	mov    eax,edi
  407781:	89 ef                	mov    edi,ebp
  407783:	89 c5                	mov    ebp,eax
  407785:	8d 04 1e             	lea    eax,[esi+ebx*1]
  407788:	3b 47 08             	cmp    eax,DWORD PTR [edi+0x8]
  40778b:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  40778f:	0f 9f c0             	setg   al
  407792:	0f b6 c0             	movzx  eax,al
  407795:	03 47 04             	add    eax,DWORD PTR [edi+0x4]
  407798:	89 04 24             	mov    DWORD PTR [esp],eax
  40779b:	e8 70 fd ff ff       	call   407510 <___Balloc_D2A>
  4077a0:	85 c0                	test   eax,eax
  4077a2:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  4077a6:	0f 84 08 01 00 00    	je     4078b4 <___mult_D2A+0x154>
  4077ac:	8b 4c 24 20          	mov    ecx,DWORD PTR [esp+0x20]
  4077b0:	8d 40 14             	lea    eax,[eax+0x14]
  4077b3:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  4077b7:	8d 0c 88             	lea    ecx,[eax+ecx*4]
  4077ba:	89 ca                	mov    edx,ecx
  4077bc:	39 d0                	cmp    eax,edx
  4077be:	89 4c 24 28          	mov    DWORD PTR [esp+0x28],ecx
  4077c2:	73 11                	jae    4077d5 <___mult_D2A+0x75>
  4077c4:	8b 54 24 28          	mov    edx,DWORD PTR [esp+0x28]
  4077c8:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  4077ce:	83 c0 04             	add    eax,0x4
  4077d1:	39 c2                	cmp    edx,eax
  4077d3:	77 f3                	ja     4077c8 <___mult_D2A+0x68>
  4077d5:	8d 47 14             	lea    eax,[edi+0x14]
  4077d8:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  4077dc:	8d 04 b0             	lea    eax,[eax+esi*4]
  4077df:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4077e3:	8d 45 14             	lea    eax,[ebp+0x14]
  4077e6:	8d 1c 98             	lea    ebx,[eax+ebx*4]
  4077e9:	39 d8                	cmp    eax,ebx
  4077eb:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  4077ef:	89 5c 24 1c          	mov    DWORD PTR [esp+0x1c],ebx
  4077f3:	73 74                	jae    407869 <___mult_D2A+0x109>
  4077f5:	83 44 24 14 04       	add    DWORD PTR [esp+0x14],0x4
  4077fa:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
  4077fe:	8b 68 fc             	mov    ebp,DWORD PTR [eax-0x4]
  407801:	85 ed                	test   ebp,ebp
  407803:	74 55                	je     40785a <___mult_D2A+0xfa>
  407805:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  407809:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  40780d:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  407814:	00 
  407815:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  40781c:	00 
  40781d:	eb 03                	jmp    407822 <___mult_D2A+0xc2>
  40781f:	90                   	nop
  407820:	89 c7                	mov    edi,eax
  407822:	83 c6 04             	add    esi,0x4
  407825:	8b 0f                	mov    ecx,DWORD PTR [edi]
  407827:	89 e8                	mov    eax,ebp
  407829:	f7 66 fc             	mul    DWORD PTR [esi-0x4]
  40782c:	31 db                	xor    ebx,ebx
  40782e:	01 c1                	add    ecx,eax
  407830:	11 d3                	adc    ebx,edx
  407832:	03 4c 24 08          	add    ecx,DWORD PTR [esp+0x8]
  407836:	13 5c 24 0c          	adc    ebx,DWORD PTR [esp+0xc]
  40783a:	89 0f                	mov    DWORD PTR [edi],ecx
  40783c:	89 da                	mov    edx,ebx
  40783e:	89 d0                	mov    eax,edx
  407840:	31 d2                	xor    edx,edx
  407842:	39 74 24 10          	cmp    DWORD PTR [esp+0x10],esi
  407846:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40784a:	8d 47 04             	lea    eax,[edi+0x4]
  40784d:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  407851:	77 cd                	ja     407820 <___mult_D2A+0xc0>
  407853:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  407857:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
  40785a:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
  40785e:	83 44 24 18 04       	add    DWORD PTR [esp+0x18],0x4
  407863:	39 44 24 1c          	cmp    DWORD PTR [esp+0x1c],eax
  407867:	77 8c                	ja     4077f5 <___mult_D2A+0x95>
  407869:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
  40786d:	85 ff                	test   edi,edi
  40786f:	7e 30                	jle    4078a1 <___mult_D2A+0x141>
  407871:	8b 5c 24 28          	mov    ebx,DWORD PTR [esp+0x28]
  407875:	8b 73 fc             	mov    esi,DWORD PTR [ebx-0x4]
  407878:	85 f6                	test   esi,esi
  40787a:	75 25                	jne    4078a1 <___mult_D2A+0x141>
  40787c:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  407880:	89 d0                	mov    eax,edx
  407882:	c1 e0 02             	shl    eax,0x2
  407885:	29 c3                	sub    ebx,eax
  407887:	89 d8                	mov    eax,ebx
  407889:	eb 0d                	jmp    407898 <___mult_D2A+0x138>
  40788b:	90                   	nop
  40788c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407890:	8b 4c 90 fc          	mov    ecx,DWORD PTR [eax+edx*4-0x4]
  407894:	85 c9                	test   ecx,ecx
  407896:	75 05                	jne    40789d <___mult_D2A+0x13d>
  407898:	83 ea 01             	sub    edx,0x1
  40789b:	75 f3                	jne    407890 <___mult_D2A+0x130>
  40789d:	89 54 24 20          	mov    DWORD PTR [esp+0x20],edx
  4078a1:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  4078a5:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
  4078a9:	89 58 10             	mov    DWORD PTR [eax+0x10],ebx
  4078ac:	83 c4 3c             	add    esp,0x3c
  4078af:	5b                   	pop    ebx
  4078b0:	5e                   	pop    esi
  4078b1:	5f                   	pop    edi
  4078b2:	5d                   	pop    ebp
  4078b3:	c3                   	ret    
  4078b4:	31 c0                	xor    eax,eax
  4078b6:	eb f4                	jmp    4078ac <___mult_D2A+0x14c>
  4078b8:	90                   	nop
  4078b9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

004078c0 <___pow5mult_D2A>:
  4078c0:	55                   	push   ebp
  4078c1:	89 e5                	mov    ebp,esp
  4078c3:	57                   	push   edi
  4078c4:	56                   	push   esi
  4078c5:	53                   	push   ebx
  4078c6:	83 ec 1c             	sub    esp,0x1c
  4078c9:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
  4078cc:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  4078cf:	89 d8                	mov    eax,ebx
  4078d1:	83 e0 03             	and    eax,0x3
  4078d4:	0f 85 9e 00 00 00    	jne    407978 <___pow5mult_D2A+0xb8>
  4078da:	c1 fb 02             	sar    ebx,0x2
  4078dd:	89 d0                	mov    eax,edx
  4078df:	85 db                	test   ebx,ebx
  4078e1:	74 4e                	je     407931 <___pow5mult_D2A+0x71>
  4078e3:	8b 3d 80 d0 40 00    	mov    edi,DWORD PTR ds:0x40d080
  4078e9:	85 ff                	test   edi,edi
  4078eb:	0f 84 d5 00 00 00    	je     4079c6 <___pow5mult_D2A+0x106>
  4078f1:	f6 c3 01             	test   bl,0x1
  4078f4:	75 13                	jne    407909 <___pow5mult_D2A+0x49>
  4078f6:	d1 fb                	sar    ebx,1
  4078f8:	74 35                	je     40792f <___pow5mult_D2A+0x6f>
  4078fa:	8b 37                	mov    esi,DWORD PTR [edi]
  4078fc:	85 f6                	test   esi,esi
  4078fe:	66 90                	xchg   ax,ax
  407900:	74 3e                	je     407940 <___pow5mult_D2A+0x80>
  407902:	89 f7                	mov    edi,esi
  407904:	f6 c3 01             	test   bl,0x1
  407907:	74 ed                	je     4078f6 <___pow5mult_D2A+0x36>
  407909:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  40790d:	89 14 24             	mov    DWORD PTR [esp],edx
  407910:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  407913:	e8 48 fe ff ff       	call   407760 <___mult_D2A>
  407918:	85 c0                	test   eax,eax
  40791a:	89 c6                	mov    esi,eax
  40791c:	74 7f                	je     40799d <___pow5mult_D2A+0xdd>
  40791e:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407921:	89 14 24             	mov    DWORD PTR [esp],edx
  407924:	e8 b7 fc ff ff       	call   4075e0 <___Bfree_D2A>
  407929:	d1 fb                	sar    ebx,1
  40792b:	89 f2                	mov    edx,esi
  40792d:	75 cb                	jne    4078fa <___pow5mult_D2A+0x3a>
  40792f:	89 d0                	mov    eax,edx
  407931:	8d 65 f4             	lea    esp,[ebp-0xc]
  407934:	5b                   	pop    ebx
  407935:	5e                   	pop    esi
  407936:	5f                   	pop    edi
  407937:	5d                   	pop    ebp
  407938:	c3                   	ret    
  407939:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  407940:	b8 01 00 00 00       	mov    eax,0x1
  407945:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  407948:	e8 a3 fa ff ff       	call   4073f0 <_dtoa_lock>
  40794d:	8b 37                	mov    esi,DWORD PTR [edi]
  40794f:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407952:	85 f6                	test   esi,esi
  407954:	74 51                	je     4079a7 <___pow5mult_D2A+0xe7>
  407956:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  40795d:	75 a3                	jne    407902 <___pow5mult_D2A+0x42>
  40795f:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  407966:	89 f7                	mov    edi,esi
  407968:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  40796b:	e8 78 08 00 00       	call   4081e8 <_LeaveCriticalSection@4>
  407970:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407973:	83 ec 04             	sub    esp,0x4
  407976:	eb 8c                	jmp    407904 <___pow5mult_D2A+0x44>
  407978:	8b 04 85 5c a3 40 00 	mov    eax,DWORD PTR [eax*4+0x40a35c]
  40797f:	89 14 24             	mov    DWORD PTR [esp],edx
  407982:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  407989:	00 
  40798a:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40798e:	e8 bd fc ff ff       	call   407650 <___multadd_D2A>
  407993:	85 c0                	test   eax,eax
  407995:	89 c2                	mov    edx,eax
  407997:	0f 85 3d ff ff ff    	jne    4078da <___pow5mult_D2A+0x1a>
  40799d:	31 c0                	xor    eax,eax
  40799f:	8d 65 f4             	lea    esp,[ebp-0xc]
  4079a2:	5b                   	pop    ebx
  4079a3:	5e                   	pop    esi
  4079a4:	5f                   	pop    edi
  4079a5:	5d                   	pop    ebp
  4079a6:	c3                   	ret    
  4079a7:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4079ab:	89 3c 24             	mov    DWORD PTR [esp],edi
  4079ae:	e8 ad fd ff ff       	call   407760 <___mult_D2A>
  4079b3:	85 c0                	test   eax,eax
  4079b5:	89 c6                	mov    esi,eax
  4079b7:	89 07                	mov    DWORD PTR [edi],eax
  4079b9:	74 e2                	je     40799d <___pow5mult_D2A+0xdd>
  4079bb:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  4079c1:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  4079c4:	eb 90                	jmp    407956 <___pow5mult_D2A+0x96>
  4079c6:	b8 01 00 00 00       	mov    eax,0x1
  4079cb:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  4079ce:	e8 1d fa ff ff       	call   4073f0 <_dtoa_lock>
  4079d3:	8b 3d 80 d0 40 00    	mov    edi,DWORD PTR ds:0x40d080
  4079d9:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  4079dc:	85 ff                	test   edi,edi
  4079de:	74 27                	je     407a07 <___pow5mult_D2A+0x147>
  4079e0:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  4079e7:	0f 85 04 ff ff ff    	jne    4078f1 <___pow5mult_D2A+0x31>
  4079ed:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  4079f4:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  4079f7:	e8 ec 07 00 00       	call   4081e8 <_LeaveCriticalSection@4>
  4079fc:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  4079ff:	83 ec 04             	sub    esp,0x4
  407a02:	e9 ea fe ff ff       	jmp    4078f1 <___pow5mult_D2A+0x31>
  407a07:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  407a0e:	e8 fd fa ff ff       	call   407510 <___Balloc_D2A>
  407a13:	85 c0                	test   eax,eax
  407a15:	89 c7                	mov    edi,eax
  407a17:	74 1e                	je     407a37 <___pow5mult_D2A+0x177>
  407a19:	c7 40 14 71 02 00 00 	mov    DWORD PTR [eax+0x14],0x271
  407a20:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407a23:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  407a2a:	a3 80 d0 40 00       	mov    ds:0x40d080,eax
  407a2f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  407a35:	eb a9                	jmp    4079e0 <___pow5mult_D2A+0x120>
  407a37:	c7 05 80 d0 40 00 00 	mov    DWORD PTR ds:0x40d080,0x0
  407a3e:	00 00 00 
  407a41:	31 c0                	xor    eax,eax
  407a43:	e9 57 ff ff ff       	jmp    40799f <___pow5mult_D2A+0xdf>
  407a48:	90                   	nop
  407a49:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00407a50 <___lshift_D2A>:
  407a50:	55                   	push   ebp
  407a51:	57                   	push   edi
  407a52:	56                   	push   esi
  407a53:	53                   	push   ebx
  407a54:	83 ec 2c             	sub    esp,0x2c
  407a57:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407a5b:	8b 74 24 44          	mov    esi,DWORD PTR [esp+0x44]
  407a5f:	89 c7                	mov    edi,eax
  407a61:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
  407a64:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  407a67:	89 f3                	mov    ebx,esi
  407a69:	c1 fb 05             	sar    ebx,0x5
  407a6c:	01 d8                	add    eax,ebx
  407a6e:	8d 68 01             	lea    ebp,[eax+0x1]
  407a71:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  407a75:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  407a78:	39 c5                	cmp    ebp,eax
  407a7a:	7e 0d                	jle    407a89 <___lshift_D2A+0x39>
  407a7c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407a80:	01 c0                	add    eax,eax
  407a82:	83 c2 01             	add    edx,0x1
  407a85:	39 c5                	cmp    ebp,eax
  407a87:	7f f7                	jg     407a80 <___lshift_D2A+0x30>
  407a89:	89 14 24             	mov    DWORD PTR [esp],edx
  407a8c:	e8 7f fa ff ff       	call   407510 <___Balloc_D2A>
  407a91:	85 c0                	test   eax,eax
  407a93:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  407a97:	0f 84 bc 00 00 00    	je     407b59 <___lshift_D2A+0x109>
  407a9d:	85 db                	test   ebx,ebx
  407a9f:	8d 50 14             	lea    edx,[eax+0x14]
  407aa2:	7e 13                	jle    407ab7 <___lshift_D2A+0x67>
  407aa4:	31 c0                	xor    eax,eax
  407aa6:	c7 04 82 00 00 00 00 	mov    DWORD PTR [edx+eax*4],0x0
  407aad:	83 c0 01             	add    eax,0x1
  407ab0:	39 d8                	cmp    eax,ebx
  407ab2:	75 f2                	jne    407aa6 <___lshift_D2A+0x56>
  407ab4:	8d 14 82             	lea    edx,[edx+eax*4]
  407ab7:	8b 7c 24 40          	mov    edi,DWORD PTR [esp+0x40]
  407abb:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407abf:	8b 4f 10             	mov    ecx,DWORD PTR [edi+0x10]
  407ac2:	83 c0 14             	add    eax,0x14
  407ac5:	83 e6 1f             	and    esi,0x1f
  407ac8:	89 74 24 0c          	mov    DWORD PTR [esp+0xc],esi
  407acc:	8d 3c 88             	lea    edi,[eax+ecx*4]
  407acf:	89 f9                	mov    ecx,edi
  407ad1:	74 72                	je     407b45 <___lshift_D2A+0xf5>
  407ad3:	c7 44 24 10 20 00 00 	mov    DWORD PTR [esp+0x10],0x20
  407ada:	00 
  407adb:	89 6c 24 1c          	mov    DWORD PTR [esp+0x1c],ebp
  407adf:	89 cd                	mov    ebp,ecx
  407ae1:	29 74 24 10          	sub    DWORD PTR [esp+0x10],esi
  407ae5:	31 f6                	xor    esi,esi
  407ae7:	eb 09                	jmp    407af2 <___lshift_D2A+0xa2>
  407ae9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  407af0:	89 fa                	mov    edx,edi
  407af2:	8b 18                	mov    ebx,DWORD PTR [eax]
  407af4:	83 c0 04             	add    eax,0x4
  407af7:	0f b6 4c 24 0c       	movzx  ecx,BYTE PTR [esp+0xc]
  407afc:	8d 7a 04             	lea    edi,[edx+0x4]
  407aff:	d3 e3                	shl    ebx,cl
  407b01:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [esp+0x10]
  407b06:	09 f3                	or     ebx,esi
  407b08:	89 1a                	mov    DWORD PTR [edx],ebx
  407b0a:	8b 70 fc             	mov    esi,DWORD PTR [eax-0x4]
  407b0d:	d3 ee                	shr    esi,cl
  407b0f:	39 c5                	cmp    ebp,eax
  407b11:	77 dd                	ja     407af0 <___lshift_D2A+0xa0>
  407b13:	85 f6                	test   esi,esi
  407b15:	8b 6c 24 1c          	mov    ebp,DWORD PTR [esp+0x1c]
  407b19:	89 72 04             	mov    DWORD PTR [edx+0x4],esi
  407b1c:	74 07                	je     407b25 <___lshift_D2A+0xd5>
  407b1e:	8b 6c 24 18          	mov    ebp,DWORD PTR [esp+0x18]
  407b22:	83 c5 02             	add    ebp,0x2
  407b25:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
  407b29:	8d 45 ff             	lea    eax,[ebp-0x1]
  407b2c:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
  407b2f:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407b33:	89 04 24             	mov    DWORD PTR [esp],eax
  407b36:	e8 a5 fa ff ff       	call   4075e0 <___Bfree_D2A>
  407b3b:	89 f8                	mov    eax,edi
  407b3d:	83 c4 2c             	add    esp,0x2c
  407b40:	5b                   	pop    ebx
  407b41:	5e                   	pop    esi
  407b42:	5f                   	pop    edi
  407b43:	5d                   	pop    ebp
  407b44:	c3                   	ret    
  407b45:	89 fb                	mov    ebx,edi
  407b47:	83 c0 04             	add    eax,0x4
  407b4a:	8b 48 fc             	mov    ecx,DWORD PTR [eax-0x4]
  407b4d:	83 c2 04             	add    edx,0x4
  407b50:	39 c3                	cmp    ebx,eax
  407b52:	89 4a fc             	mov    DWORD PTR [edx-0x4],ecx
  407b55:	77 f0                	ja     407b47 <___lshift_D2A+0xf7>
  407b57:	eb cc                	jmp    407b25 <___lshift_D2A+0xd5>
  407b59:	31 c0                	xor    eax,eax
  407b5b:	eb e0                	jmp    407b3d <___lshift_D2A+0xed>
  407b5d:	8d 76 00             	lea    esi,[esi+0x0]

00407b60 <___cmp_D2A>:
  407b60:	53                   	push   ebx
  407b61:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  407b65:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  407b69:	8b 41 10             	mov    eax,DWORD PTR [ecx+0x10]
  407b6c:	8b 5a 10             	mov    ebx,DWORD PTR [edx+0x10]
  407b6f:	29 d8                	sub    eax,ebx
  407b71:	85 c0                	test   eax,eax
  407b73:	75 24                	jne    407b99 <___cmp_D2A+0x39>
  407b75:	c1 e3 02             	shl    ebx,0x2
  407b78:	83 c1 14             	add    ecx,0x14
  407b7b:	8d 04 19             	lea    eax,[ecx+ebx*1]
  407b7e:	8d 54 1a 14          	lea    edx,[edx+ebx*1+0x14]
  407b82:	eb 04                	jmp    407b88 <___cmp_D2A+0x28>
  407b84:	39 c1                	cmp    ecx,eax
  407b86:	73 18                	jae    407ba0 <___cmp_D2A+0x40>
  407b88:	83 ea 04             	sub    edx,0x4
  407b8b:	83 e8 04             	sub    eax,0x4
  407b8e:	8b 1a                	mov    ebx,DWORD PTR [edx]
  407b90:	39 18                	cmp    DWORD PTR [eax],ebx
  407b92:	74 f0                	je     407b84 <___cmp_D2A+0x24>
  407b94:	19 c0                	sbb    eax,eax
  407b96:	83 c8 01             	or     eax,0x1
  407b99:	5b                   	pop    ebx
  407b9a:	c3                   	ret    
  407b9b:	90                   	nop
  407b9c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407ba0:	31 c0                	xor    eax,eax
  407ba2:	5b                   	pop    ebx
  407ba3:	c3                   	ret    
  407ba4:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  407baa:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00407bb0 <___diff_D2A>:
  407bb0:	55                   	push   ebp
  407bb1:	57                   	push   edi
  407bb2:	56                   	push   esi
  407bb3:	53                   	push   ebx
  407bb4:	83 ec 2c             	sub    esp,0x2c
  407bb7:	8b 74 24 40          	mov    esi,DWORD PTR [esp+0x40]
  407bbb:	8b 5c 24 44          	mov    ebx,DWORD PTR [esp+0x44]
  407bbf:	89 34 24             	mov    DWORD PTR [esp],esi
  407bc2:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  407bc6:	e8 95 ff ff ff       	call   407b60 <___cmp_D2A>
  407bcb:	85 c0                	test   eax,eax
  407bcd:	0f 84 1f 01 00 00    	je     407cf2 <___diff_D2A+0x142>
  407bd3:	0f 88 3f 01 00 00    	js     407d18 <___diff_D2A+0x168>
  407bd9:	31 ff                	xor    edi,edi
  407bdb:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  407bde:	89 04 24             	mov    DWORD PTR [esp],eax
  407be1:	e8 2a f9 ff ff       	call   407510 <___Balloc_D2A>
  407be6:	85 c0                	test   eax,eax
  407be8:	89 c2                	mov    edx,eax
  407bea:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  407bee:	0f 84 34 01 00 00    	je     407d28 <___diff_D2A+0x178>
  407bf4:	89 78 0c             	mov    DWORD PTR [eax+0xc],edi
  407bf7:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
  407bfa:	83 c6 14             	add    esi,0x14
  407bfd:	8d 6b 14             	lea    ebp,[ebx+0x14]
  407c00:	8d 7a 14             	lea    edi,[edx+0x14]
  407c03:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  407c0a:	00 
  407c0b:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  407c0f:	8d 04 86             	lea    eax,[esi+eax*4]
  407c12:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  407c16:	8b 43 10             	mov    eax,DWORD PTR [ebx+0x10]
  407c19:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  407c20:	00 
  407c21:	8d 44 85 00          	lea    eax,[ebp+eax*4+0x0]
  407c25:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  407c29:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  407c30:	83 c5 04             	add    ebp,0x4
  407c33:	83 c6 04             	add    esi,0x4
  407c36:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  407c39:	8b 46 fc             	mov    eax,DWORD PTR [esi-0x4]
  407c3c:	31 d2                	xor    edx,edx
  407c3e:	31 db                	xor    ebx,ebx
  407c40:	29 c8                	sub    eax,ecx
  407c42:	19 da                	sbb    edx,ebx
  407c44:	2b 44 24 08          	sub    eax,DWORD PTR [esp+0x8]
  407c48:	1b 54 24 0c          	sbb    edx,DWORD PTR [esp+0xc]
  407c4c:	83 c7 04             	add    edi,0x4
  407c4f:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  407c56:	00 
  407c57:	89 d1                	mov    ecx,edx
  407c59:	83 e1 01             	and    ecx,0x1
  407c5c:	39 6c 24 14          	cmp    DWORD PTR [esp+0x14],ebp
  407c60:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  407c64:	89 47 fc             	mov    DWORD PTR [edi-0x4],eax
  407c67:	77 c7                	ja     407c30 <___diff_D2A+0x80>
  407c69:	39 74 24 10          	cmp    DWORD PTR [esp+0x10],esi
  407c6d:	76 4b                	jbe    407cba <___diff_D2A+0x10a>
  407c6f:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
  407c73:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  407c77:	89 7c 24 14          	mov    DWORD PTR [esp+0x14],edi
  407c7b:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  407c7f:	90                   	nop
  407c80:	83 c6 04             	add    esi,0x4
  407c83:	8b 46 fc             	mov    eax,DWORD PTR [esi-0x4]
  407c86:	31 d2                	xor    edx,edx
  407c88:	29 c8                	sub    eax,ecx
  407c8a:	19 da                	sbb    edx,ebx
  407c8c:	83 c7 04             	add    edi,0x4
  407c8f:	89 d5                	mov    ebp,edx
  407c91:	31 db                	xor    ebx,ebx
  407c93:	83 e5 01             	and    ebp,0x1
  407c96:	39 74 24 10          	cmp    DWORD PTR [esp+0x10],esi
  407c9a:	89 e9                	mov    ecx,ebp
  407c9c:	89 47 fc             	mov    DWORD PTR [edi-0x4],eax
  407c9f:	77 df                	ja     407c80 <___diff_D2A+0xd0>
  407ca1:	8b 6c 24 08          	mov    ebp,DWORD PTR [esp+0x8]
  407ca5:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
  407ca9:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
  407cad:	f7 d5                	not    ebp
  407caf:	8d 54 3d 00          	lea    edx,[ebp+edi*1+0x0]
  407cb3:	c1 ea 02             	shr    edx,0x2
  407cb6:	8d 7c 93 04          	lea    edi,[ebx+edx*4+0x4]
  407cba:	85 c0                	test   eax,eax
  407cbc:	75 21                	jne    407cdf <___diff_D2A+0x12f>
  407cbe:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  407cc2:	89 d0                	mov    eax,edx
  407cc4:	c1 e0 02             	shl    eax,0x2
  407cc7:	29 c7                	sub    edi,eax
  407cc9:	89 d0                	mov    eax,edx
  407ccb:	90                   	nop
  407ccc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407cd0:	83 e8 01             	sub    eax,0x1
  407cd3:	8b 6c 87 fc          	mov    ebp,DWORD PTR [edi+eax*4-0x4]
  407cd7:	85 ed                	test   ebp,ebp
  407cd9:	74 f5                	je     407cd0 <___diff_D2A+0x120>
  407cdb:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  407cdf:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  407ce3:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  407ce7:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
  407cea:	83 c4 2c             	add    esp,0x2c
  407ced:	5b                   	pop    ebx
  407cee:	5e                   	pop    esi
  407cef:	5f                   	pop    edi
  407cf0:	5d                   	pop    ebp
  407cf1:	c3                   	ret    
  407cf2:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  407cf9:	e8 12 f8 ff ff       	call   407510 <___Balloc_D2A>
  407cfe:	85 c0                	test   eax,eax
  407d00:	74 26                	je     407d28 <___diff_D2A+0x178>
  407d02:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  407d09:	c7 40 14 00 00 00 00 	mov    DWORD PTR [eax+0x14],0x0
  407d10:	83 c4 2c             	add    esp,0x2c
  407d13:	5b                   	pop    ebx
  407d14:	5e                   	pop    esi
  407d15:	5f                   	pop    edi
  407d16:	5d                   	pop    ebp
  407d17:	c3                   	ret    
  407d18:	89 f0                	mov    eax,esi
  407d1a:	bf 01 00 00 00       	mov    edi,0x1
  407d1f:	89 de                	mov    esi,ebx
  407d21:	89 c3                	mov    ebx,eax
  407d23:	e9 b3 fe ff ff       	jmp    407bdb <___diff_D2A+0x2b>
  407d28:	31 c0                	xor    eax,eax
  407d2a:	eb be                	jmp    407cea <___diff_D2A+0x13a>
  407d2c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00407d30 <___b2d_D2A>:
  407d30:	55                   	push   ebp
  407d31:	b9 20 00 00 00       	mov    ecx,0x20
  407d36:	57                   	push   edi
  407d37:	56                   	push   esi
  407d38:	53                   	push   ebx
  407d39:	83 ec 14             	sub    esp,0x14
  407d3c:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  407d40:	8b 7c 24 2c          	mov    edi,DWORD PTR [esp+0x2c]
  407d44:	8d 58 14             	lea    ebx,[eax+0x14]
  407d47:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  407d4a:	8d 2c 83             	lea    ebp,[ebx+eax*4]
  407d4d:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  407d50:	8d 75 fc             	lea    esi,[ebp-0x4]
  407d53:	0f bd c2             	bsr    eax,edx
  407d56:	83 f0 1f             	xor    eax,0x1f
  407d59:	29 c1                	sub    ecx,eax
  407d5b:	83 f8 0a             	cmp    eax,0xa
  407d5e:	89 0f                	mov    DWORD PTR [edi],ecx
  407d60:	7f 3e                	jg     407da0 <___b2d_D2A+0x70>
  407d62:	b9 0b 00 00 00       	mov    ecx,0xb
  407d67:	89 d7                	mov    edi,edx
  407d69:	29 c1                	sub    ecx,eax
  407d6b:	d3 ef                	shr    edi,cl
  407d6d:	81 cf 00 00 f0 3f    	or     edi,0x3ff00000
  407d73:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  407d77:	31 ff                	xor    edi,edi
  407d79:	39 f3                	cmp    ebx,esi
  407d7b:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  407d82:	73 05                	jae    407d89 <___b2d_D2A+0x59>
  407d84:	8b 7d f8             	mov    edi,DWORD PTR [ebp-0x8]
  407d87:	d3 ef                	shr    edi,cl
  407d89:	8d 48 15             	lea    ecx,[eax+0x15]
  407d8c:	d3 e2                	shl    edx,cl
  407d8e:	09 d7                	or     edi,edx
  407d90:	89 3c 24             	mov    DWORD PTR [esp],edi
  407d93:	dd 04 24             	fld    QWORD PTR [esp]
  407d96:	83 c4 14             	add    esp,0x14
  407d99:	5b                   	pop    ebx
  407d9a:	5e                   	pop    esi
  407d9b:	5f                   	pop    edi
  407d9c:	5d                   	pop    ebp
  407d9d:	c3                   	ret    
  407d9e:	66 90                	xchg   ax,ax
  407da0:	31 ff                	xor    edi,edi
  407da2:	39 f3                	cmp    ebx,esi
  407da4:	73 06                	jae    407dac <___b2d_D2A+0x7c>
  407da6:	8b 7d f8             	mov    edi,DWORD PTR [ebp-0x8]
  407da9:	8d 75 f8             	lea    esi,[ebp-0x8]
  407dac:	89 c1                	mov    ecx,eax
  407dae:	83 e9 0b             	sub    ecx,0xb
  407db1:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  407db5:	74 49                	je     407e00 <___b2d_D2A+0xd0>
  407db7:	0f b6 4c 24 0c       	movzx  ecx,BYTE PTR [esp+0xc]
  407dbc:	bd 2b 00 00 00       	mov    ebp,0x2b
  407dc1:	29 c5                	sub    ebp,eax
  407dc3:	89 f8                	mov    eax,edi
  407dc5:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  407dcc:	d3 e2                	shl    edx,cl
  407dce:	89 e9                	mov    ecx,ebp
  407dd0:	d3 e8                	shr    eax,cl
  407dd2:	81 ca 00 00 f0 3f    	or     edx,0x3ff00000
  407dd8:	09 c2                	or     edx,eax
  407dda:	31 c0                	xor    eax,eax
  407ddc:	39 de                	cmp    esi,ebx
  407dde:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  407de2:	76 05                	jbe    407de9 <___b2d_D2A+0xb9>
  407de4:	8b 46 fc             	mov    eax,DWORD PTR [esi-0x4]
  407de7:	d3 e8                	shr    eax,cl
  407de9:	0f b6 4c 24 0c       	movzx  ecx,BYTE PTR [esp+0xc]
  407dee:	d3 e7                	shl    edi,cl
  407df0:	09 f8                	or     eax,edi
  407df2:	89 04 24             	mov    DWORD PTR [esp],eax
  407df5:	dd 04 24             	fld    QWORD PTR [esp]
  407df8:	83 c4 14             	add    esp,0x14
  407dfb:	5b                   	pop    ebx
  407dfc:	5e                   	pop    esi
  407dfd:	5f                   	pop    edi
  407dfe:	5d                   	pop    ebp
  407dff:	c3                   	ret    
  407e00:	81 ca 00 00 f0 3f    	or     edx,0x3ff00000
  407e06:	89 3c 24             	mov    DWORD PTR [esp],edi
  407e09:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  407e0d:	dd 04 24             	fld    QWORD PTR [esp]
  407e10:	83 c4 14             	add    esp,0x14
  407e13:	5b                   	pop    ebx
  407e14:	5e                   	pop    esi
  407e15:	5f                   	pop    edi
  407e16:	5d                   	pop    ebp
  407e17:	c3                   	ret    
  407e18:	90                   	nop
  407e19:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00407e20 <___d2b_D2A>:
  407e20:	55                   	push   ebp
  407e21:	57                   	push   edi
  407e22:	56                   	push   esi
  407e23:	53                   	push   ebx
  407e24:	83 ec 1c             	sub    esp,0x1c
  407e27:	dd 44 24 30          	fld    QWORD PTR [esp+0x30]
  407e2b:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  407e32:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
  407e36:	e8 d5 f6 ff ff       	call   407510 <___Balloc_D2A>
  407e3b:	85 c0                	test   eax,eax
  407e3d:	0f 84 c5 00 00 00    	je     407f08 <___d2b_D2A+0xe8>
  407e43:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  407e47:	89 d3                	mov    ebx,edx
  407e49:	81 e2 ff ff ff 7f    	and    edx,0x7fffffff
  407e4f:	c1 ea 14             	shr    edx,0x14
  407e52:	81 e3 ff ff 0f 00    	and    ebx,0xfffff
  407e58:	85 d2                	test   edx,edx
  407e5a:	74 06                	je     407e62 <___d2b_D2A+0x42>
  407e5c:	81 cb 00 00 10 00    	or     ebx,0x100000
  407e62:	8b 7c 24 08          	mov    edi,DWORD PTR [esp+0x8]
  407e66:	85 ff                	test   edi,edi
  407e68:	75 3e                	jne    407ea8 <___d2b_D2A+0x88>
  407e6a:	f3 0f bc cb          	tzcnt  ecx,ebx
  407e6e:	d3 eb                	shr    ebx,cl
  407e70:	85 d2                	test   edx,edx
  407e72:	8d 71 20             	lea    esi,[ecx+0x20]
  407e75:	b9 01 00 00 00       	mov    ecx,0x1
  407e7a:	89 58 14             	mov    DWORD PTR [eax+0x14],ebx
  407e7d:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  407e84:	74 56                	je     407edc <___d2b_D2A+0xbc>
  407e86:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
  407e8a:	8d 94 16 cd fb ff ff 	lea    edx,[esi+edx*1-0x433]
  407e91:	89 17                	mov    DWORD PTR [edi],edx
  407e93:	ba 35 00 00 00       	mov    edx,0x35
  407e98:	29 f2                	sub    edx,esi
  407e9a:	8b 74 24 3c          	mov    esi,DWORD PTR [esp+0x3c]
  407e9e:	89 16                	mov    DWORD PTR [esi],edx
  407ea0:	83 c4 1c             	add    esp,0x1c
  407ea3:	5b                   	pop    ebx
  407ea4:	5e                   	pop    esi
  407ea5:	5f                   	pop    edi
  407ea6:	5d                   	pop    ebp
  407ea7:	c3                   	ret    
  407ea8:	f3 0f bc f7          	tzcnt  esi,edi
  407eac:	89 f1                	mov    ecx,esi
  407eae:	d3 ef                	shr    edi,cl
  407eb0:	85 f6                	test   esi,esi
  407eb2:	74 4f                	je     407f03 <___d2b_D2A+0xe3>
  407eb4:	b9 20 00 00 00       	mov    ecx,0x20
  407eb9:	89 dd                	mov    ebp,ebx
  407ebb:	29 f1                	sub    ecx,esi
  407ebd:	d3 e5                	shl    ebp,cl
  407ebf:	89 e9                	mov    ecx,ebp
  407ec1:	09 f9                	or     ecx,edi
  407ec3:	89 48 14             	mov    DWORD PTR [eax+0x14],ecx
  407ec6:	89 f1                	mov    ecx,esi
  407ec8:	d3 eb                	shr    ebx,cl
  407eca:	83 fb 01             	cmp    ebx,0x1
  407ecd:	19 c9                	sbb    ecx,ecx
  407ecf:	83 c1 02             	add    ecx,0x2
  407ed2:	85 d2                	test   edx,edx
  407ed4:	89 58 18             	mov    DWORD PTR [eax+0x18],ebx
  407ed7:	89 48 10             	mov    DWORD PTR [eax+0x10],ecx
  407eda:	75 aa                	jne    407e86 <___d2b_D2A+0x66>
  407edc:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
  407ee0:	81 ee 32 04 00 00    	sub    esi,0x432
  407ee6:	0f bd 54 88 10       	bsr    edx,DWORD PTR [eax+ecx*4+0x10]
  407eeb:	c1 e1 05             	shl    ecx,0x5
  407eee:	89 37                	mov    DWORD PTR [edi],esi
  407ef0:	8b 74 24 3c          	mov    esi,DWORD PTR [esp+0x3c]
  407ef4:	83 f2 1f             	xor    edx,0x1f
  407ef7:	29 d1                	sub    ecx,edx
  407ef9:	89 0e                	mov    DWORD PTR [esi],ecx
  407efb:	83 c4 1c             	add    esp,0x1c
  407efe:	5b                   	pop    ebx
  407eff:	5e                   	pop    esi
  407f00:	5f                   	pop    edi
  407f01:	5d                   	pop    ebp
  407f02:	c3                   	ret    
  407f03:	89 78 14             	mov    DWORD PTR [eax+0x14],edi
  407f06:	eb c2                	jmp    407eca <___d2b_D2A+0xaa>
  407f08:	31 c0                	xor    eax,eax
  407f0a:	eb 94                	jmp    407ea0 <___d2b_D2A+0x80>
  407f0c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00407f10 <___strcp_D2A>:
  407f10:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  407f14:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  407f18:	8d 51 01             	lea    edx,[ecx+0x1]
  407f1b:	0f b6 09             	movzx  ecx,BYTE PTR [ecx]
  407f1e:	84 c9                	test   cl,cl
  407f20:	88 08                	mov    BYTE PTR [eax],cl
  407f22:	74 10                	je     407f34 <___strcp_D2A+0x24>
  407f24:	83 c2 01             	add    edx,0x1
  407f27:	0f b6 4a ff          	movzx  ecx,BYTE PTR [edx-0x1]
  407f2b:	83 c0 01             	add    eax,0x1
  407f2e:	84 c9                	test   cl,cl
  407f30:	88 08                	mov    BYTE PTR [eax],cl
  407f32:	75 f0                	jne    407f24 <___strcp_D2A+0x14>
  407f34:	f3 c3                	repz ret 
  407f36:	90                   	nop
  407f37:	90                   	nop
  407f38:	90                   	nop
  407f39:	90                   	nop
  407f3a:	90                   	nop
  407f3b:	90                   	nop
  407f3c:	90                   	nop
  407f3d:	90                   	nop
  407f3e:	90                   	nop
  407f3f:	90                   	nop

00407f40 <___rshift_D2A>:
  407f40:	55                   	push   ebp
  407f41:	57                   	push   edi
  407f42:	56                   	push   esi
  407f43:	53                   	push   ebx
  407f44:	83 ec 10             	sub    esp,0x10
  407f47:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  407f4b:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  407f4f:	8b 4c 24 28          	mov    ecx,DWORD PTR [esp+0x28]
  407f53:	8b 56 10             	mov    edx,DWORD PTR [esi+0x10]
  407f56:	8d 68 14             	lea    ebp,[eax+0x14]
  407f59:	89 c8                	mov    eax,ecx
  407f5b:	c1 f8 05             	sar    eax,0x5
  407f5e:	39 d0                	cmp    eax,edx
  407f60:	0f 8d 8a 00 00 00    	jge    407ff0 <___rshift_D2A+0xb0>
  407f66:	8d 44 85 00          	lea    eax,[ebp+eax*4+0x0]
  407f6a:	83 e1 1f             	and    ecx,0x1f
  407f6d:	8d 7c 95 00          	lea    edi,[ebp+edx*4+0x0]
  407f71:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  407f75:	89 0c 24             	mov    DWORD PTR [esp],ecx
  407f78:	0f 84 92 00 00 00    	je     408010 <___rshift_D2A+0xd0>
  407f7e:	8b 74 24 04          	mov    esi,DWORD PTR [esp+0x4]
  407f82:	8b 04 24             	mov    eax,DWORD PTR [esp]
  407f85:	c7 44 24 08 20 00 00 	mov    DWORD PTR [esp+0x8],0x20
  407f8c:	00 
  407f8d:	29 44 24 08          	sub    DWORD PTR [esp+0x8],eax
  407f91:	8b 1e                	mov    ebx,DWORD PTR [esi]
  407f93:	8d 56 04             	lea    edx,[esi+0x4]
  407f96:	89 c1                	mov    ecx,eax
  407f98:	d3 eb                	shr    ebx,cl
  407f9a:	39 d7                	cmp    edi,edx
  407f9c:	0f 86 ac 00 00 00    	jbe    40804e <___rshift_D2A+0x10e>
  407fa2:	89 ee                	mov    esi,ebp
  407fa4:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
  407fa8:	8b 6c 24 08          	mov    ebp,DWORD PTR [esp+0x8]
  407fac:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407fb0:	8b 02                	mov    eax,DWORD PTR [edx]
  407fb2:	89 e9                	mov    ecx,ebp
  407fb4:	83 c6 04             	add    esi,0x4
  407fb7:	83 c2 04             	add    edx,0x4
  407fba:	d3 e0                	shl    eax,cl
  407fbc:	0f b6 0c 24          	movzx  ecx,BYTE PTR [esp]
  407fc0:	09 d8                	or     eax,ebx
  407fc2:	89 46 fc             	mov    DWORD PTR [esi-0x4],eax
  407fc5:	8b 5a fc             	mov    ebx,DWORD PTR [edx-0x4]
  407fc8:	d3 eb                	shr    ebx,cl
  407fca:	39 d7                	cmp    edi,edx
  407fcc:	77 e2                	ja     407fb0 <___rshift_D2A+0x70>
  407fce:	2b 7c 24 04          	sub    edi,DWORD PTR [esp+0x4]
  407fd2:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
  407fd6:	8d 47 fb             	lea    eax,[edi-0x5]
  407fd9:	c1 e8 02             	shr    eax,0x2
  407fdc:	8d 44 85 04          	lea    eax,[ebp+eax*4+0x4]
  407fe0:	85 db                	test   ebx,ebx
  407fe2:	89 18                	mov    DWORD PTR [eax],ebx
  407fe4:	74 03                	je     407fe9 <___rshift_D2A+0xa9>
  407fe6:	83 c0 04             	add    eax,0x4
  407fe9:	29 e8                	sub    eax,ebp
  407feb:	c1 f8 02             	sar    eax,0x2
  407fee:	eb 4b                	jmp    40803b <___rshift_D2A+0xfb>
  407ff0:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  407ff4:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
  407ffb:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  407fff:	c7 40 14 00 00 00 00 	mov    DWORD PTR [eax+0x14],0x0
  408006:	83 c4 10             	add    esp,0x10
  408009:	5b                   	pop    ebx
  40800a:	5e                   	pop    esi
  40800b:	5f                   	pop    edi
  40800c:	5d                   	pop    ebp
  40800d:	c3                   	ret    
  40800e:	66 90                	xchg   ax,ax
  408010:	39 c7                	cmp    edi,eax
  408012:	89 ea                	mov    edx,ebp
  408014:	76 da                	jbe    407ff0 <___rshift_D2A+0xb0>
  408016:	83 c0 04             	add    eax,0x4
  408019:	8b 48 fc             	mov    ecx,DWORD PTR [eax-0x4]
  40801c:	83 c2 04             	add    edx,0x4
  40801f:	39 c7                	cmp    edi,eax
  408021:	89 4a fc             	mov    DWORD PTR [edx-0x4],ecx
  408024:	77 f0                	ja     408016 <___rshift_D2A+0xd6>
  408026:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  40802a:	f7 d0                	not    eax
  40802c:	01 f8                	add    eax,edi
  40802e:	c1 e8 02             	shr    eax,0x2
  408031:	8d 04 85 04 00 00 00 	lea    eax,[eax*4+0x4]
  408038:	c1 f8 02             	sar    eax,0x2
  40803b:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  40803f:	85 c0                	test   eax,eax
  408041:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
  408044:	74 b5                	je     407ffb <___rshift_D2A+0xbb>
  408046:	83 c4 10             	add    esp,0x10
  408049:	5b                   	pop    ebx
  40804a:	5e                   	pop    esi
  40804b:	5f                   	pop    edi
  40804c:	5d                   	pop    ebp
  40804d:	c3                   	ret    
  40804e:	89 e8                	mov    eax,ebp
  408050:	eb 8e                	jmp    407fe0 <___rshift_D2A+0xa0>
  408052:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  408059:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00408060 <___trailz_D2A>:
  408060:	53                   	push   ebx
  408061:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  408065:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  408068:	8d 50 14             	lea    edx,[eax+0x14]
  40806b:	8d 1c 8a             	lea    ebx,[edx+ecx*4]
  40806e:	39 da                	cmp    edx,ebx
  408070:	73 28                	jae    40809a <___trailz_D2A+0x3a>
  408072:	8b 48 14             	mov    ecx,DWORD PTR [eax+0x14]
  408075:	31 c0                	xor    eax,eax
  408077:	85 c9                	test   ecx,ecx
  408079:	74 0b                	je     408086 <___trailz_D2A+0x26>
  40807b:	eb 15                	jmp    408092 <___trailz_D2A+0x32>
  40807d:	8d 76 00             	lea    esi,[esi+0x0]
  408080:	8b 0a                	mov    ecx,DWORD PTR [edx]
  408082:	85 c9                	test   ecx,ecx
  408084:	75 0c                	jne    408092 <___trailz_D2A+0x32>
  408086:	83 c2 04             	add    edx,0x4
  408089:	83 c0 20             	add    eax,0x20
  40808c:	39 d3                	cmp    ebx,edx
  40808e:	77 f0                	ja     408080 <___trailz_D2A+0x20>
  408090:	5b                   	pop    ebx
  408091:	c3                   	ret    
  408092:	f3 0f bc c9          	tzcnt  ecx,ecx
  408096:	01 c8                	add    eax,ecx
  408098:	5b                   	pop    ebx
  408099:	c3                   	ret    
  40809a:	31 c0                	xor    eax,eax
  40809c:	5b                   	pop    ebx
  40809d:	c3                   	ret    
  40809e:	90                   	nop
  40809f:	90                   	nop

004080a0 <_signal>:
  4080a0:	ff 25 1c e2 40 00    	jmp    DWORD PTR ds:0x40e21c
  4080a6:	90                   	nop
  4080a7:	90                   	nop

004080a8 <__setmode>:
  4080a8:	ff 25 d4 e1 40 00    	jmp    DWORD PTR ds:0x40e1d4
  4080ae:	90                   	nop
  4080af:	90                   	nop

004080b0 <___p__fmode>:
  4080b0:	ff 25 b8 e1 40 00    	jmp    DWORD PTR ds:0x40e1b8
  4080b6:	90                   	nop
  4080b7:	90                   	nop

004080b8 <___p__environ>:
  4080b8:	ff 25 b4 e1 40 00    	jmp    DWORD PTR ds:0x40e1b4
  4080be:	90                   	nop
  4080bf:	90                   	nop

004080c0 <__cexit>:
  4080c0:	ff 25 c0 e1 40 00    	jmp    DWORD PTR ds:0x40e1c0
  4080c6:	90                   	nop
  4080c7:	90                   	nop

004080c8 <___getmainargs>:
  4080c8:	ff 25 ac e1 40 00    	jmp    DWORD PTR ds:0x40e1ac
  4080ce:	90                   	nop
  4080cf:	90                   	nop

004080d0 <_clock>:
  4080d0:	ff 25 e8 e1 40 00    	jmp    DWORD PTR ds:0x40e1e8
  4080d6:	90                   	nop
  4080d7:	90                   	nop

004080d8 <_printf>:
  4080d8:	ff 25 10 e2 40 00    	jmp    DWORD PTR ds:0x40e210
  4080de:	90                   	nop
  4080df:	90                   	nop

004080e0 <_strlen>:
  4080e0:	ff 25 28 e2 40 00    	jmp    DWORD PTR ds:0x40e228
  4080e6:	90                   	nop
  4080e7:	90                   	nop

004080e8 <_isspace>:
  4080e8:	ff 25 fc e1 40 00    	jmp    DWORD PTR ds:0x40e1fc
  4080ee:	90                   	nop
  4080ef:	90                   	nop

004080f0 <_fwrite>:
  4080f0:	ff 25 f4 e1 40 00    	jmp    DWORD PTR ds:0x40e1f4
  4080f6:	90                   	nop
  4080f7:	90                   	nop

004080f8 <_vfprintf>:
  4080f8:	ff 25 30 e2 40 00    	jmp    DWORD PTR ds:0x40e230
  4080fe:	90                   	nop
  4080ff:	90                   	nop

00408100 <_abort>:
  408100:	ff 25 d8 e1 40 00    	jmp    DWORD PTR ds:0x40e1d8
  408106:	90                   	nop
  408107:	90                   	nop

00408108 <_memcpy>:
  408108:	ff 25 0c e2 40 00    	jmp    DWORD PTR ds:0x40e20c
  40810e:	90                   	nop
  40810f:	90                   	nop

00408110 <_calloc>:
  408110:	ff 25 e4 e1 40 00    	jmp    DWORD PTR ds:0x40e1e4
  408116:	90                   	nop
  408117:	90                   	nop

00408118 <_free>:
  408118:	ff 25 f0 e1 40 00    	jmp    DWORD PTR ds:0x40e1f0
  40811e:	90                   	nop
  40811f:	90                   	nop

00408120 <_malloc>:
  408120:	ff 25 04 e2 40 00    	jmp    DWORD PTR ds:0x40e204
  408126:	90                   	nop
  408127:	90                   	nop

00408128 <_tolower>:
  408128:	ff 25 2c e2 40 00    	jmp    DWORD PTR ds:0x40e22c
  40812e:	90                   	nop
  40812f:	90                   	nop

00408130 <_realloc>:
  408130:	ff 25 14 e2 40 00    	jmp    DWORD PTR ds:0x40e214
  408136:	90                   	nop
  408137:	90                   	nop

00408138 <_strcoll>:
  408138:	ff 25 24 e2 40 00    	jmp    DWORD PTR ds:0x40e224
  40813e:	90                   	nop
  40813f:	90                   	nop

00408140 <__errno>:
  408140:	ff 25 c4 e1 40 00    	jmp    DWORD PTR ds:0x40e1c4
  408146:	90                   	nop
  408147:	90                   	nop

00408148 <_setlocale>:
  408148:	ff 25 18 e2 40 00    	jmp    DWORD PTR ds:0x40e218
  40814e:	90                   	nop
  40814f:	90                   	nop

00408150 <_wcstombs>:
  408150:	ff 25 38 e2 40 00    	jmp    DWORD PTR ds:0x40e238
  408156:	90                   	nop
  408157:	90                   	nop

00408158 <_mbstowcs>:
  408158:	ff 25 08 e2 40 00    	jmp    DWORD PTR ds:0x40e208
  40815e:	90                   	nop
  40815f:	90                   	nop

00408160 <__fullpath>:
  408160:	ff 25 c8 e1 40 00    	jmp    DWORD PTR ds:0x40e1c8
  408166:	90                   	nop
  408167:	90                   	nop

00408168 <_fputc>:
  408168:	ff 25 ec e1 40 00    	jmp    DWORD PTR ds:0x40e1ec
  40816e:	90                   	nop
  40816f:	90                   	nop

00408170 <_localeconv>:
  408170:	ff 25 00 e2 40 00    	jmp    DWORD PTR ds:0x40e200
  408176:	90                   	nop
  408177:	90                   	nop

00408178 <_getenv>:
  408178:	ff 25 f8 e1 40 00    	jmp    DWORD PTR ds:0x40e1f8
  40817e:	90                   	nop
  40817f:	90                   	nop

00408180 <_wcslen>:
  408180:	ff 25 34 e2 40 00    	jmp    DWORD PTR ds:0x40e234
  408186:	90                   	nop
  408187:	90                   	nop

00408188 <_strchr>:
  408188:	ff 25 20 e2 40 00    	jmp    DWORD PTR ds:0x40e220
  40818e:	90                   	nop
  40818f:	90                   	nop

00408190 <_atoi>:
  408190:	ff 25 e0 e1 40 00    	jmp    DWORD PTR ds:0x40e1e0
  408196:	90                   	nop
  408197:	90                   	nop

00408198 <_SetUnhandledExceptionFilter@4>:
  408198:	ff 25 84 e1 40 00    	jmp    DWORD PTR ds:0x40e184
  40819e:	90                   	nop
  40819f:	90                   	nop

004081a0 <_ExitProcess@4>:
  4081a0:	ff 25 50 e1 40 00    	jmp    DWORD PTR ds:0x40e150
  4081a6:	90                   	nop
  4081a7:	90                   	nop

004081a8 <_GetModuleHandleA@4>:
  4081a8:	ff 25 68 e1 40 00    	jmp    DWORD PTR ds:0x40e168
  4081ae:	90                   	nop
  4081af:	90                   	nop

004081b0 <_GetProcAddress@8>:
  4081b0:	ff 25 6c e1 40 00    	jmp    DWORD PTR ds:0x40e16c
  4081b6:	90                   	nop
  4081b7:	90                   	nop

004081b8 <_GetCommandLineA@0>:
  4081b8:	ff 25 60 e1 40 00    	jmp    DWORD PTR ds:0x40e160
  4081be:	90                   	nop
  4081bf:	90                   	nop

004081c0 <_VirtualQuery@12>:
  4081c0:	ff 25 94 e1 40 00    	jmp    DWORD PTR ds:0x40e194
  4081c6:	90                   	nop
  4081c7:	90                   	nop

004081c8 <_VirtualProtect@16>:
  4081c8:	ff 25 90 e1 40 00    	jmp    DWORD PTR ds:0x40e190
  4081ce:	90                   	nop
  4081cf:	90                   	nop

004081d0 <_EnterCriticalSection@4>:
  4081d0:	ff 25 4c e1 40 00    	jmp    DWORD PTR ds:0x40e14c
  4081d6:	90                   	nop
  4081d7:	90                   	nop

004081d8 <_TlsGetValue@4>:
  4081d8:	ff 25 8c e1 40 00    	jmp    DWORD PTR ds:0x40e18c
  4081de:	90                   	nop
  4081df:	90                   	nop

004081e0 <_GetLastError@0>:
  4081e0:	ff 25 64 e1 40 00    	jmp    DWORD PTR ds:0x40e164
  4081e6:	90                   	nop
  4081e7:	90                   	nop

004081e8 <_LeaveCriticalSection@4>:
  4081e8:	ff 25 7c e1 40 00    	jmp    DWORD PTR ds:0x40e17c
  4081ee:	90                   	nop
  4081ef:	90                   	nop

004081f0 <_DeleteCriticalSection@4>:
  4081f0:	ff 25 48 e1 40 00    	jmp    DWORD PTR ds:0x40e148
  4081f6:	90                   	nop
  4081f7:	90                   	nop

004081f8 <_InitializeCriticalSection@4>:
  4081f8:	ff 25 70 e1 40 00    	jmp    DWORD PTR ds:0x40e170
  4081fe:	90                   	nop
  4081ff:	90                   	nop

00408200 <_FindNextFileA@8>:
  408200:	ff 25 5c e1 40 00    	jmp    DWORD PTR ds:0x40e15c
  408206:	90                   	nop
  408207:	90                   	nop

00408208 <_FindFirstFileA@8>:
  408208:	ff 25 58 e1 40 00    	jmp    DWORD PTR ds:0x40e158
  40820e:	90                   	nop
  40820f:	90                   	nop

00408210 <_FindClose@4>:
  408210:	ff 25 54 e1 40 00    	jmp    DWORD PTR ds:0x40e154
  408216:	90                   	nop
  408217:	90                   	nop

00408218 <_WideCharToMultiByte@32>:
  408218:	ff 25 98 e1 40 00    	jmp    DWORD PTR ds:0x40e198
  40821e:	90                   	nop
  40821f:	90                   	nop

00408220 <_IsDBCSLeadByteEx@8>:
  408220:	ff 25 78 e1 40 00    	jmp    DWORD PTR ds:0x40e178
  408226:	90                   	nop
  408227:	90                   	nop

00408228 <_MultiByteToWideChar@24>:
  408228:	ff 25 80 e1 40 00    	jmp    DWORD PTR ds:0x40e180
  40822e:	90                   	nop
  40822f:	90                   	nop

00408230 <_Sleep@4>:
  408230:	ff 25 88 e1 40 00    	jmp    DWORD PTR ds:0x40e188
  408236:	90                   	nop
  408237:	90                   	nop

00408238 <_InterlockedExchange@8>:
  408238:	ff 25 74 e1 40 00    	jmp    DWORD PTR ds:0x40e174
  40823e:	90                   	nop
  40823f:	90                   	nop

00408240 <___umoddi3>:
  408240:	55                   	push   ebp
  408241:	57                   	push   edi
  408242:	56                   	push   esi
  408243:	53                   	push   ebx
  408244:	83 ec 1c             	sub    esp,0x1c
  408247:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  40824b:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  40824f:	8b 6c 24 34          	mov    ebp,DWORD PTR [esp+0x34]
  408253:	8b 5c 24 38          	mov    ebx,DWORD PTR [esp+0x38]
  408257:	85 c0                	test   eax,eax
  408259:	89 c2                	mov    edx,eax
  40825b:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  40825f:	89 ee                	mov    esi,ebp
  408261:	89 1c 24             	mov    DWORD PTR [esp],ebx
  408264:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  408268:	89 6c 24 08          	mov    DWORD PTR [esp+0x8],ebp
  40826c:	75 16                	jne    408284 <___umoddi3+0x44>
  40826e:	39 eb                	cmp    ebx,ebp
  408270:	76 4e                	jbe    4082c0 <___umoddi3+0x80>
  408272:	89 c8                	mov    eax,ecx
  408274:	89 ea                	mov    edx,ebp
  408276:	f7 f3                	div    ebx
  408278:	89 d0                	mov    eax,edx
  40827a:	31 d2                	xor    edx,edx
  40827c:	83 c4 1c             	add    esp,0x1c
  40827f:	5b                   	pop    ebx
  408280:	5e                   	pop    esi
  408281:	5f                   	pop    edi
  408282:	5d                   	pop    ebp
  408283:	c3                   	ret    
  408284:	39 e8                	cmp    eax,ebp
  408286:	77 58                	ja     4082e0 <___umoddi3+0xa0>
  408288:	0f bd f8             	bsr    edi,eax
  40828b:	83 f7 1f             	xor    edi,0x1f
  40828e:	75 60                	jne    4082f0 <___umoddi3+0xb0>
  408290:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
  408294:	39 3c 24             	cmp    DWORD PTR [esp],edi
  408297:	0f 87 e4 00 00 00    	ja     408381 <___umoddi3+0x141>
  40829d:	89 ef                	mov    edi,ebp
  40829f:	89 ce                	mov    esi,ecx
  4082a1:	29 de                	sub    esi,ebx
  4082a3:	19 c7                	sbb    edi,eax
  4082a5:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  4082a9:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  4082ad:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  4082b1:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
  4082b5:	83 c4 1c             	add    esp,0x1c
  4082b8:	5b                   	pop    ebx
  4082b9:	5e                   	pop    esi
  4082ba:	5f                   	pop    edi
  4082bb:	5d                   	pop    ebp
  4082bc:	c3                   	ret    
  4082bd:	8d 76 00             	lea    esi,[esi+0x0]
  4082c0:	85 db                	test   ebx,ebx
  4082c2:	89 df                	mov    edi,ebx
  4082c4:	75 0b                	jne    4082d1 <___umoddi3+0x91>
  4082c6:	b8 01 00 00 00       	mov    eax,0x1
  4082cb:	31 d2                	xor    edx,edx
  4082cd:	f7 f3                	div    ebx
  4082cf:	89 c7                	mov    edi,eax
  4082d1:	89 e8                	mov    eax,ebp
  4082d3:	31 d2                	xor    edx,edx
  4082d5:	f7 f7                	div    edi
  4082d7:	89 c8                	mov    eax,ecx
  4082d9:	f7 f7                	div    edi
  4082db:	eb 9b                	jmp    408278 <___umoddi3+0x38>
  4082dd:	8d 76 00             	lea    esi,[esi+0x0]
  4082e0:	89 c8                	mov    eax,ecx
  4082e2:	89 ea                	mov    edx,ebp
  4082e4:	83 c4 1c             	add    esp,0x1c
  4082e7:	5b                   	pop    ebx
  4082e8:	5e                   	pop    esi
  4082e9:	5f                   	pop    edi
  4082ea:	5d                   	pop    ebp
  4082eb:	c3                   	ret    
  4082ec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4082f0:	8b 2c 24             	mov    ebp,DWORD PTR [esp]
  4082f3:	bb 20 00 00 00       	mov    ebx,0x20
  4082f8:	89 f9                	mov    ecx,edi
  4082fa:	29 fb                	sub    ebx,edi
  4082fc:	d3 e2                	shl    edx,cl
  4082fe:	89 d9                	mov    ecx,ebx
  408300:	89 e8                	mov    eax,ebp
  408302:	d3 e8                	shr    eax,cl
  408304:	89 f9                	mov    ecx,edi
  408306:	89 04 24             	mov    DWORD PTR [esp],eax
  408309:	89 e8                	mov    eax,ebp
  40830b:	d3 e0                	shl    eax,cl
  40830d:	89 d9                	mov    ecx,ebx
  40830f:	89 c5                	mov    ebp,eax
  408311:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  408315:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  408319:	09 14 24             	or     DWORD PTR [esp],edx
  40831c:	89 f2                	mov    edx,esi
  40831e:	d3 ea                	shr    edx,cl
  408320:	89 f9                	mov    ecx,edi
  408322:	d3 e6                	shl    esi,cl
  408324:	89 d9                	mov    ecx,ebx
  408326:	d3 e8                	shr    eax,cl
  408328:	89 f9                	mov    ecx,edi
  40832a:	09 f0                	or     eax,esi
  40832c:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
  408330:	f7 34 24             	div    DWORD PTR [esp]
  408333:	d3 e6                	shl    esi,cl
  408335:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  408339:	89 d6                	mov    esi,edx
  40833b:	f7 e5                	mul    ebp
  40833d:	39 d6                	cmp    esi,edx
  40833f:	89 c1                	mov    ecx,eax
  408341:	89 d5                	mov    ebp,edx
  408343:	72 2f                	jb     408374 <___umoddi3+0x134>
  408345:	39 44 24 04          	cmp    DWORD PTR [esp+0x4],eax
  408349:	72 25                	jb     408370 <___umoddi3+0x130>
  40834b:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  40834f:	29 c8                	sub    eax,ecx
  408351:	19 ee                	sbb    esi,ebp
  408353:	89 f9                	mov    ecx,edi
  408355:	89 f2                	mov    edx,esi
  408357:	d3 e8                	shr    eax,cl
  408359:	89 d9                	mov    ecx,ebx
  40835b:	d3 e2                	shl    edx,cl
  40835d:	89 f9                	mov    ecx,edi
  40835f:	d3 ee                	shr    esi,cl
  408361:	09 d0                	or     eax,edx
  408363:	89 f2                	mov    edx,esi
  408365:	83 c4 1c             	add    esp,0x1c
  408368:	5b                   	pop    ebx
  408369:	5e                   	pop    esi
  40836a:	5f                   	pop    edi
  40836b:	5d                   	pop    ebp
  40836c:	c3                   	ret    
  40836d:	8d 76 00             	lea    esi,[esi+0x0]
  408370:	39 d6                	cmp    esi,edx
  408372:	75 d7                	jne    40834b <___umoddi3+0x10b>
  408374:	89 d5                	mov    ebp,edx
  408376:	89 c1                	mov    ecx,eax
  408378:	2b 4c 24 08          	sub    ecx,DWORD PTR [esp+0x8]
  40837c:	1b 2c 24             	sbb    ebp,DWORD PTR [esp]
  40837f:	eb ca                	jmp    40834b <___umoddi3+0x10b>
  408381:	3b 44 24 08          	cmp    eax,DWORD PTR [esp+0x8]
  408385:	0f 82 12 ff ff ff    	jb     40829d <___umoddi3+0x5d>
  40838b:	e9 1d ff ff ff       	jmp    4082ad <___umoddi3+0x6d>

00408390 <___udivdi3>:
  408390:	55                   	push   ebp
  408391:	57                   	push   edi
  408392:	56                   	push   esi
  408393:	53                   	push   ebx
  408394:	83 ec 14             	sub    esp,0x14
  408397:	8b 74 24 34          	mov    esi,DWORD PTR [esp+0x34]
  40839b:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
  40839f:	8b 6c 24 2c          	mov    ebp,DWORD PTR [esp+0x2c]
  4083a3:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  4083a7:	85 f6                	test   esi,esi
  4083a9:	89 3c 24             	mov    DWORD PTR [esp],edi
  4083ac:	89 e8                	mov    eax,ebp
  4083ae:	89 ca                	mov    edx,ecx
  4083b0:	75 2e                	jne    4083e0 <___udivdi3+0x50>
  4083b2:	39 e9                	cmp    ecx,ebp
  4083b4:	77 5c                	ja     408412 <___udivdi3+0x82>
  4083b6:	85 c9                	test   ecx,ecx
  4083b8:	89 cb                	mov    ebx,ecx
  4083ba:	75 0b                	jne    4083c7 <___udivdi3+0x37>
  4083bc:	b8 01 00 00 00       	mov    eax,0x1
  4083c1:	31 d2                	xor    edx,edx
  4083c3:	f7 f1                	div    ecx
  4083c5:	89 c3                	mov    ebx,eax
  4083c7:	89 e8                	mov    eax,ebp
  4083c9:	31 d2                	xor    edx,edx
  4083cb:	f7 f3                	div    ebx
  4083cd:	89 c5                	mov    ebp,eax
  4083cf:	89 f8                	mov    eax,edi
  4083d1:	f7 f3                	div    ebx
  4083d3:	89 ea                	mov    edx,ebp
  4083d5:	83 c4 14             	add    esp,0x14
  4083d8:	5b                   	pop    ebx
  4083d9:	5e                   	pop    esi
  4083da:	5f                   	pop    edi
  4083db:	5d                   	pop    ebp
  4083dc:	c3                   	ret    
  4083dd:	8d 76 00             	lea    esi,[esi+0x0]
  4083e0:	39 ee                	cmp    esi,ebp
  4083e2:	77 22                	ja     408406 <___udivdi3+0x76>
  4083e4:	0f bd de             	bsr    ebx,esi
  4083e7:	83 f3 1f             	xor    ebx,0x1f
  4083ea:	75 36                	jne    408422 <___udivdi3+0x92>
  4083ec:	3b 0c 24             	cmp    ecx,DWORD PTR [esp]
  4083ef:	ba 00 00 00 00       	mov    edx,0x0
  4083f4:	0f 86 86 00 00 00    	jbe    408480 <___udivdi3+0xf0>
  4083fa:	39 ee                	cmp    esi,ebp
  4083fc:	0f 82 7e 00 00 00    	jb     408480 <___udivdi3+0xf0>
  408402:	31 c0                	xor    eax,eax
  408404:	eb cf                	jmp    4083d5 <___udivdi3+0x45>
  408406:	31 d2                	xor    edx,edx
  408408:	31 c0                	xor    eax,eax
  40840a:	83 c4 14             	add    esp,0x14
  40840d:	5b                   	pop    ebx
  40840e:	5e                   	pop    esi
  40840f:	5f                   	pop    edi
  408410:	5d                   	pop    ebp
  408411:	c3                   	ret    
  408412:	89 f8                	mov    eax,edi
  408414:	89 ea                	mov    edx,ebp
  408416:	f7 f1                	div    ecx
  408418:	31 d2                	xor    edx,edx
  40841a:	83 c4 14             	add    esp,0x14
  40841d:	5b                   	pop    ebx
  40841e:	5e                   	pop    esi
  40841f:	5f                   	pop    edi
  408420:	5d                   	pop    ebp
  408421:	c3                   	ret    
  408422:	bf 20 00 00 00       	mov    edi,0x20
  408427:	89 d9                	mov    ecx,ebx
  408429:	29 df                	sub    edi,ebx
  40842b:	89 d5                	mov    ebp,edx
  40842d:	d3 e6                	shl    esi,cl
  40842f:	89 f9                	mov    ecx,edi
  408431:	d3 ed                	shr    ebp,cl
  408433:	89 d9                	mov    ecx,ebx
  408435:	d3 e2                	shl    edx,cl
  408437:	09 f5                	or     ebp,esi
  408439:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  40843d:	8b 14 24             	mov    edx,DWORD PTR [esp]
  408440:	89 f9                	mov    ecx,edi
  408442:	89 c6                	mov    esi,eax
  408444:	d3 ee                	shr    esi,cl
  408446:	89 d9                	mov    ecx,ebx
  408448:	d3 e0                	shl    eax,cl
  40844a:	89 f9                	mov    ecx,edi
  40844c:	d3 ea                	shr    edx,cl
  40844e:	89 d7                	mov    edi,edx
  408450:	89 f2                	mov    edx,esi
  408452:	09 c7                	or     edi,eax
  408454:	89 f8                	mov    eax,edi
  408456:	f7 f5                	div    ebp
  408458:	89 d6                	mov    esi,edx
  40845a:	89 c7                	mov    edi,eax
  40845c:	f7 64 24 04          	mul    DWORD PTR [esp+0x4]
  408460:	39 d6                	cmp    esi,edx
  408462:	72 2c                	jb     408490 <___udivdi3+0x100>
  408464:	8b 2c 24             	mov    ebp,DWORD PTR [esp]
  408467:	89 d9                	mov    ecx,ebx
  408469:	d3 e5                	shl    ebp,cl
  40846b:	39 c5                	cmp    ebp,eax
  40846d:	73 04                	jae    408473 <___udivdi3+0xe3>
  40846f:	39 d6                	cmp    esi,edx
  408471:	74 1d                	je     408490 <___udivdi3+0x100>
  408473:	89 f8                	mov    eax,edi
  408475:	31 d2                	xor    edx,edx
  408477:	e9 59 ff ff ff       	jmp    4083d5 <___udivdi3+0x45>
  40847c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  408480:	b8 01 00 00 00       	mov    eax,0x1
  408485:	e9 4b ff ff ff       	jmp    4083d5 <___udivdi3+0x45>
  40848a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  408490:	8d 47 ff             	lea    eax,[edi-0x1]
  408493:	31 d2                	xor    edx,edx
  408495:	83 c4 14             	add    esp,0x14
  408498:	5b                   	pop    ebx
  408499:	5e                   	pop    esi
  40849a:	5f                   	pop    edi
  40849b:	5d                   	pop    ebp
  40849c:	c3                   	ret    
  40849d:	90                   	nop
  40849e:	90                   	nop
  40849f:	90                   	nop

004084a0 <_strdup>:
  4084a0:	ff 25 a0 e1 40 00    	jmp    DWORD PTR ds:0x40e1a0
  4084a6:	90                   	nop
  4084a7:	90                   	nop

004084a8 <_stricoll>:
  4084a8:	ff 25 a4 e1 40 00    	jmp    DWORD PTR ds:0x40e1a4
  4084ae:	90                   	nop
  4084af:	90                   	nop

004084b0 <_main>:
  4084b0:	55                   	push   ebp
  4084b1:	89 e5                	mov    ebp,esp
  4084b3:	57                   	push   edi
  4084b4:	56                   	push   esi
  4084b5:	53                   	push   ebx
  4084b6:	bb 40 4b 4c 00       	mov    ebx,0x4c4b40
  4084bb:	83 e4 f0             	and    esp,0xfffffff0
  4084be:	83 ec 60             	sub    esp,0x60
  4084c1:	e8 7a 99 ff ff       	call   401e40 <___main>
  4084c6:	8d 44 24 30          	lea    eax,[esp+0x30]
  4084ca:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4084ce:	8d 44 24 20          	lea    eax,[esp+0x20]
  4084d2:	89 04 24             	mov    DWORD PTR [esp],eax
  4084d5:	8d 7c 24 50          	lea    edi,[esp+0x50]
  4084d9:	c7 44 24 30 01 00 00 	mov    DWORD PTR [esp+0x30],0x1
  4084e0:	00 
  4084e1:	8d 74 24 40          	lea    esi,[esp+0x40]
  4084e5:	e8 e6 8f ff ff       	call   4014d0 <_encrypt>
  4084ea:	e8 e1 fb ff ff       	call   4080d0 <_clock>
  4084ef:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  4084f3:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4084f7:	89 34 24             	mov    DWORD PTR [esp],esi
  4084fa:	e8 d1 8f ff ff       	call   4014d0 <_encrypt>
  4084ff:	83 eb 01             	sub    ebx,0x1
  408502:	75 ef                	jne    4084f3 <_main+0x43>
  408504:	e8 c7 fb ff ff       	call   4080d0 <_clock>
  408509:	c7 04 24 64 a0 40 00 	mov    DWORD PTR [esp],0x40a064
  408510:	2b 44 24 18          	sub    eax,DWORD PTR [esp+0x18]
  408514:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  408518:	db 44 24 1c          	fild   DWORD PTR [esp+0x1c]
  40851c:	d8 35 7c a0 40 00    	fdiv   DWORD PTR ds:0x40a07c
  408522:	dd 5c 24 04          	fstp   QWORD PTR [esp+0x4]
  408526:	e8 ad fb ff ff       	call   4080d8 <_printf>
  40852b:	8d 65 f4             	lea    esp,[ebp-0xc]
  40852e:	31 c0                	xor    eax,eax
  408530:	5b                   	pop    ebx
  408531:	5e                   	pop    esi
  408532:	5f                   	pop    edi
  408533:	5d                   	pop    ebp
  408534:	c3                   	ret    
  408535:	90                   	nop
  408536:	90                   	nop
  408537:	90                   	nop
  408538:	90                   	nop
  408539:	90                   	nop
  40853a:	90                   	nop
  40853b:	90                   	nop
  40853c:	90                   	nop
  40853d:	90                   	nop
  40853e:	90                   	nop
  40853f:	90                   	nop

00408540 <_register_frame_ctor>:
  408540:	55                   	push   ebp
  408541:	89 e5                	mov    ebp,esp
  408543:	83 ec 18             	sub    esp,0x18
  408546:	e8 b5 8d ff ff       	call   401300 <___gcc_register_frame>
  40854b:	c7 04 24 90 13 40 00 	mov    DWORD PTR [esp],0x401390
  408552:	e8 89 8d ff ff       	call   4012e0 <_atexit>
  408557:	c9                   	leave  
  408558:	c3                   	ret    
  408559:	90                   	nop
  40855a:	90                   	nop
  40855b:	90                   	nop
  40855c:	90                   	nop
  40855d:	90                   	nop
  40855e:	90                   	nop
  40855f:	90                   	nop

00408560 <__CTOR_LIST__>:
  408560:	ff                   	(bad)  
  408561:	ff                   	(bad)  
  408562:	ff                   	(bad)  
  408563:	ff 40 85             	inc    DWORD PTR [eax-0x7b]

00408564 <.ctors.65535>:
  408564:	40                   	inc    eax
  408565:	85 40 00             	test   DWORD PTR [eax+0x0],eax
  408568:	00 00                	add    BYTE PTR [eax],al
	...

0040856c <__DTOR_LIST__>:
  40856c:	ff                   	(bad)  
  40856d:	ff                   	(bad)  
  40856e:	ff                   	(bad)  
  40856f:	ff 00                	inc    DWORD PTR [eax]
  408571:	00 00                	add    BYTE PTR [eax],al
	...
