
performance_test.exe:     file format pei-i386


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
  401034:	e8 e7 70 00 00       	call   408120 <_signal>
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
  401091:	e8 8a 70 00 00       	call   408120 <_signal>
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
  4010c9:	e8 52 70 00 00       	call   408120 <_signal>
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
  401112:	e8 09 70 00 00       	call   408120 <_signal>
  401117:	83 c8 ff             	or     eax,0xffffffff
  40111a:	e9 33 ff ff ff       	jmp    401052 <__gnu_exception_handler@4+0x52>
  40111f:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401126:	00 
  401127:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  40112e:	e8 ed 6f 00 00       	call   408120 <_signal>
  401133:	83 c8 ff             	or     eax,0xffffffff
  401136:	e9 17 ff ff ff       	jmp    401052 <__gnu_exception_handler@4+0x52>
  40113b:	90                   	nop
  40113c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401140:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401147:	00 
  401148:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  40114f:	e8 cc 6f 00 00       	call   408120 <_signal>
  401154:	85 db                	test   ebx,ebx
  401156:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40115b:	0f 84 f1 fe ff ff    	je     401052 <__gnu_exception_handler@4+0x52>
  401161:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401165:	e8 b6 05 00 00       	call   401720 <__fpreset>
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
  4011b3:	e8 60 70 00 00       	call   408218 <_SetUnhandledExceptionFilter@4>
  4011b8:	83 ec 04             	sub    esp,0x4
  4011bb:	e8 70 05 00 00       	call   401730 <___cpu_features_init>
  4011c0:	e8 5b 05 00 00       	call   401720 <__fpreset>
  4011c5:	e8 46 06 00 00       	call   401810 <__setargv>
  4011ca:	a1 30 d0 40 00       	mov    eax,ds:0x40d030
  4011cf:	85 c0                	test   eax,eax
  4011d1:	74 42                	je     401215 <___mingw_CRTStartup+0x95>
  4011d3:	8b 1d cc e1 40 00    	mov    ebx,DWORD PTR ds:0x40e1cc
  4011d9:	a3 00 90 40 00       	mov    ds:0x409000,eax
  4011de:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4011e2:	8b 43 10             	mov    eax,DWORD PTR [ebx+0x10]
  4011e5:	89 04 24             	mov    DWORD PTR [esp],eax
  4011e8:	e8 3b 6f 00 00       	call   408128 <__setmode>
  4011ed:	a1 30 d0 40 00       	mov    eax,ds:0x40d030
  4011f2:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4011f6:	8b 43 30             	mov    eax,DWORD PTR [ebx+0x30]
  4011f9:	89 04 24             	mov    DWORD PTR [esp],eax
  4011fc:	e8 27 6f 00 00       	call   408128 <__setmode>
  401201:	a1 30 d0 40 00       	mov    eax,ds:0x40d030
  401206:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40120a:	8b 43 50             	mov    eax,DWORD PTR [ebx+0x50]
  40120d:	89 04 24             	mov    DWORD PTR [esp],eax
  401210:	e8 13 6f 00 00       	call   408128 <__setmode>
  401215:	e8 16 6f 00 00       	call   408130 <___p__fmode>
  40121a:	8b 15 00 90 40 00    	mov    edx,DWORD PTR ds:0x409000
  401220:	89 10                	mov    DWORD PTR [eax],edx
  401222:	e8 39 0a 00 00       	call   401c60 <__pei386_runtime_relocator>
  401227:	83 e4 f0             	and    esp,0xfffffff0
  40122a:	e8 91 0c 00 00       	call   401ec0 <___main>
  40122f:	e8 04 6f 00 00       	call   408138 <___p__environ>
  401234:	8b 00                	mov    eax,DWORD PTR [eax]
  401236:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40123a:	a1 00 d0 40 00       	mov    eax,ds:0x40d000
  40123f:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401243:	a1 04 d0 40 00       	mov    eax,ds:0x40d004
  401248:	89 04 24             	mov    DWORD PTR [esp],eax
  40124b:	e8 e0 72 00 00       	call   408530 <_main>
  401250:	89 c3                	mov    ebx,eax
  401252:	e8 e9 6e 00 00       	call   408140 <__cexit>
  401257:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40125a:	e8 c1 6f 00 00       	call   408220 <_ExitProcess@4>
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
  401296:	e8 ad 6e 00 00       	call   408148 <___getmainargs>
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
  40130d:	e8 16 6f 00 00       	call   408228 <_GetModuleHandleA@4>
  401312:	ba 00 00 00 00       	mov    edx,0x0
  401317:	83 ec 04             	sub    esp,0x4
  40131a:	85 c0                	test   eax,eax
  40131c:	74 15                	je     401333 <___gcc_register_frame+0x33>
  40131e:	c7 44 24 04 13 a0 40 	mov    DWORD PTR [esp+0x4],0x40a013
  401325:	00 
  401326:	89 04 24             	mov    DWORD PTR [esp],eax
  401329:	e8 02 6f 00 00       	call   408230 <_GetProcAddress@8>
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
  401358:	e8 cb 6e 00 00       	call   408228 <_GetModuleHandleA@4>
  40135d:	ba 00 00 00 00       	mov    edx,0x0
  401362:	83 ec 04             	sub    esp,0x4
  401365:	85 c0                	test   eax,eax
  401367:	74 15                	je     40137e <___gcc_register_frame+0x7e>
  401369:	c7 44 24 04 37 a0 40 	mov    DWORD PTR [esp+0x4],0x40a037
  401370:	00 
  401371:	89 04 24             	mov    DWORD PTR [esp],eax
  401374:	e8 b7 6e 00 00       	call   408230 <_GetProcAddress@8>
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
  40139d:	e8 86 6e 00 00       	call   408228 <_GetModuleHandleA@4>
  4013a2:	ba 00 00 00 00       	mov    edx,0x0
  4013a7:	83 ec 04             	sub    esp,0x4
  4013aa:	85 c0                	test   eax,eax
  4013ac:	74 15                	je     4013c3 <___gcc_deregister_frame+0x33>
  4013ae:	c7 44 24 04 4b a0 40 	mov    DWORD PTR [esp+0x4],0x40a04b
  4013b5:	00 
  4013b6:	89 04 24             	mov    DWORD PTR [esp],eax
  4013b9:	e8 72 6e 00 00       	call   408230 <_GetProcAddress@8>
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

004013e0 <_encrypt>:
  4013e0:	55                   	push   ebp
  4013e1:	57                   	push   edi
  4013e2:	56                   	push   esi
  4013e3:	53                   	push   ebx
  4013e4:	83 ec 0c             	sub    esp,0xc
  4013e7:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  4013eb:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  4013ef:	8b 4c 24 20          	mov    ecx,DWORD PTR [esp+0x20]
  4013f3:	8b 30                	mov    esi,DWORD PTR [eax]
  4013f5:	8b 78 04             	mov    edi,DWORD PTR [eax+0x4]
  4013f8:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4013fc:	8b 5a 0c             	mov    ebx,DWORD PTR [edx+0xc]
  4013ff:	8b 12                	mov    edx,DWORD PTR [edx]
  401401:	8b 68 04             	mov    ebp,DWORD PTR [eax+0x4]
  401404:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  401408:	31 f2                	xor    edx,esi
  40140a:	31 fd                	xor    ebp,edi
  40140c:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
  40140f:	31 ea                	xor    edx,ebp
  401411:	21 f2                	and    edx,esi
  401413:	f7 d6                	not    esi
  401415:	21 d6                	and    esi,edx
  401417:	31 ee                	xor    esi,ebp
  401419:	89 04 24             	mov    DWORD PTR [esp],eax
  40141c:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  401420:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  401423:	31 c3                	xor    ebx,eax
  401425:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401429:	89 d0                	mov    eax,edx
  40142b:	8b 14 24             	mov    edx,DWORD PTR [esp]
  40142e:	33 51 08             	xor    edx,DWORD PTR [ecx+0x8]
  401431:	31 e8                	xor    eax,ebp
  401433:	bd 0c 00 00 00       	mov    ebp,0xc
  401438:	31 da                	xor    edx,ebx
  40143a:	21 fa                	and    edx,edi
  40143c:	f7 d7                	not    edi
  40143e:	89 d1                	mov    ecx,edx
  401440:	21 d7                	and    edi,edx
  401442:	8b 14 24             	mov    edx,DWORD PTR [esp]
  401445:	31 d9                	xor    ecx,ebx
  401447:	31 df                	xor    edi,ebx
  401449:	31 c8                	xor    eax,ecx
  40144b:	31 fe                	xor    esi,edi
  40144d:	21 d0                	and    eax,edx
  40144f:	f7 d2                	not    edx
  401451:	89 c3                	mov    ebx,eax
  401453:	21 c2                	and    edx,eax
  401455:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  401459:	31 cb                	xor    ebx,ecx
  40145b:	31 ca                	xor    edx,ecx
  40145d:	21 c6                	and    esi,eax
  40145f:	f7 d0                	not    eax
  401461:	89 f1                	mov    ecx,esi
  401463:	21 f0                	and    eax,esi
  401465:	31 f9                	xor    ecx,edi
  401467:	31 f8                	xor    eax,edi
  401469:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401470:	89 d7                	mov    edi,edx
  401472:	89 c6                	mov    esi,eax
  401474:	31 cf                	xor    edi,ecx
  401476:	31 d6                	xor    esi,edx
  401478:	31 c7                	xor    edi,eax
  40147a:	01 df                	add    edi,ebx
  40147c:	89 f3                	mov    ebx,esi
  40147e:	21 cb                	and    ebx,ecx
  401480:	c1 cf 1f             	ror    edi,0x1f
  401483:	31 c3                	xor    ebx,eax
  401485:	31 fb                	xor    ebx,edi
  401487:	c1 cb 15             	ror    ebx,0x15
  40148a:	89 df                	mov    edi,ebx
  40148c:	31 de                	xor    esi,ebx
  40148e:	31 c7                	xor    edi,eax
  401490:	01 ce                	add    esi,ecx
  401492:	89 f9                	mov    ecx,edi
  401494:	21 d1                	and    ecx,edx
  401496:	c1 ce 1e             	ror    esi,0x1e
  401499:	31 d9                	xor    ecx,ebx
  40149b:	31 f1                	xor    ecx,esi
  40149d:	c1 c9 19             	ror    ecx,0x19
  4014a0:	89 ce                	mov    esi,ecx
  4014a2:	31 cf                	xor    edi,ecx
  4014a4:	31 de                	xor    esi,ebx
  4014a6:	01 d7                	add    edi,edx
  4014a8:	89 f2                	mov    edx,esi
  4014aa:	21 c2                	and    edx,eax
  4014ac:	c1 cf 1d             	ror    edi,0x1d
  4014af:	31 ca                	xor    edx,ecx
  4014b1:	31 fa                	xor    edx,edi
  4014b3:	c1 ca 11             	ror    edx,0x11
  4014b6:	31 d6                	xor    esi,edx
  4014b8:	01 c6                	add    esi,eax
  4014ba:	89 d0                	mov    eax,edx
  4014bc:	31 c8                	xor    eax,ecx
  4014be:	21 d8                	and    eax,ebx
  4014c0:	c1 ce 1b             	ror    esi,0x1b
  4014c3:	31 d0                	xor    eax,edx
  4014c5:	31 f0                	xor    eax,esi
  4014c7:	c1 c8 0f             	ror    eax,0xf
  4014ca:	83 ed 01             	sub    ebp,0x1
  4014cd:	75 a1                	jne    401470 <_encrypt+0x90>
  4014cf:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
  4014d3:	8b 77 10             	mov    esi,DWORD PTR [edi+0x10]
  4014d6:	8b 7f 14             	mov    edi,DWORD PTR [edi+0x14]
  4014d9:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  4014dd:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  4014e1:	31 f9                	xor    ecx,edi
  4014e3:	8b 6e 18             	mov    ebp,DWORD PTR [esi+0x18]
  4014e6:	8b 76 1c             	mov    esi,DWORD PTR [esi+0x1c]
  4014e9:	31 ea                	xor    edx,ebp
  4014eb:	31 f0                	xor    eax,esi
  4014ed:	89 34 24             	mov    DWORD PTR [esp],esi
  4014f0:	8b 74 24 04          	mov    esi,DWORD PTR [esp+0x4]
  4014f4:	31 c2                	xor    edx,eax
  4014f6:	21 fa                	and    edx,edi
  4014f8:	f7 d7                	not    edi
  4014fa:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  4014fe:	21 d7                	and    edi,edx
  401500:	31 c7                	xor    edi,eax
  401502:	31 f3                	xor    ebx,esi
  401504:	31 cb                	xor    ebx,ecx
  401506:	21 f3                	and    ebx,esi
  401508:	f7 d6                	not    esi
  40150a:	31 d9                	xor    ecx,ebx
  40150c:	21 de                	and    esi,ebx
  40150e:	89 eb                	mov    ebx,ebp
  401510:	89 d5                	mov    ebp,edx
  401512:	31 c5                	xor    ebp,eax
  401514:	8b 04 24             	mov    eax,DWORD PTR [esp]
  401517:	89 da                	mov    edx,ebx
  401519:	33 74 24 04          	xor    esi,DWORD PTR [esp+0x4]
  40151d:	31 e9                	xor    ecx,ebp
  40151f:	21 d9                	and    ecx,ebx
  401521:	f7 d2                	not    edx
  401523:	89 cb                	mov    ebx,ecx
  401525:	21 ca                	and    edx,ecx
  401527:	31 fe                	xor    esi,edi
  401529:	31 eb                	xor    ebx,ebp
  40152b:	21 c6                	and    esi,eax
  40152d:	f7 d0                	not    eax
  40152f:	89 f1                	mov    ecx,esi
  401531:	21 f0                	and    eax,esi
  401533:	31 ea                	xor    edx,ebp
  401535:	31 f9                	xor    ecx,edi
  401537:	31 f8                	xor    eax,edi
  401539:	bd 0c 00 00 00       	mov    ebp,0xc
  40153e:	66 90                	xchg   ax,ax
  401540:	89 d7                	mov    edi,edx
  401542:	89 c6                	mov    esi,eax
  401544:	31 cf                	xor    edi,ecx
  401546:	31 d6                	xor    esi,edx
  401548:	31 c7                	xor    edi,eax
  40154a:	01 df                	add    edi,ebx
  40154c:	89 f3                	mov    ebx,esi
  40154e:	21 cb                	and    ebx,ecx
  401550:	c1 cf 1f             	ror    edi,0x1f
  401553:	31 c3                	xor    ebx,eax
  401555:	31 fb                	xor    ebx,edi
  401557:	c1 cb 15             	ror    ebx,0x15
  40155a:	89 df                	mov    edi,ebx
  40155c:	31 de                	xor    esi,ebx
  40155e:	31 c7                	xor    edi,eax
  401560:	01 ce                	add    esi,ecx
  401562:	89 f9                	mov    ecx,edi
  401564:	21 d1                	and    ecx,edx
  401566:	c1 ce 1e             	ror    esi,0x1e
  401569:	31 d9                	xor    ecx,ebx
  40156b:	31 f1                	xor    ecx,esi
  40156d:	c1 c9 19             	ror    ecx,0x19
  401570:	89 ce                	mov    esi,ecx
  401572:	31 cf                	xor    edi,ecx
  401574:	31 de                	xor    esi,ebx
  401576:	01 d7                	add    edi,edx
  401578:	89 f2                	mov    edx,esi
  40157a:	21 c2                	and    edx,eax
  40157c:	c1 cf 1d             	ror    edi,0x1d
  40157f:	31 ca                	xor    edx,ecx
  401581:	31 fa                	xor    edx,edi
  401583:	c1 ca 11             	ror    edx,0x11
  401586:	31 d6                	xor    esi,edx
  401588:	01 c6                	add    esi,eax
  40158a:	89 d0                	mov    eax,edx
  40158c:	31 c8                	xor    eax,ecx
  40158e:	21 d8                	and    eax,ebx
  401590:	c1 ce 1b             	ror    esi,0x1b
  401593:	31 d0                	xor    eax,edx
  401595:	31 f0                	xor    eax,esi
  401597:	c1 c8 0f             	ror    eax,0xf
  40159a:	83 ed 01             	sub    ebp,0x1
  40159d:	75 a1                	jne    401540 <_encrypt+0x160>
  40159f:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  4015a3:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
  4015a7:	8b 76 24             	mov    esi,DWORD PTR [esi+0x24]
  4015aa:	8b 7f 20             	mov    edi,DWORD PTR [edi+0x20]
  4015ad:	31 f1                	xor    ecx,esi
  4015af:	89 cd                	mov    ebp,ecx
  4015b1:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
  4015b5:	31 fb                	xor    ebx,edi
  4015b7:	31 eb                	xor    ebx,ebp
  4015b9:	21 fb                	and    ebx,edi
  4015bb:	f7 d7                	not    edi
  4015bd:	89 6c 24 04          	mov    DWORD PTR [esp+0x4],ebp
  4015c1:	21 df                	and    edi,ebx
  4015c3:	31 dd                	xor    ebp,ebx
  4015c5:	8b 49 28             	mov    ecx,DWORD PTR [ecx+0x28]
  4015c8:	33 7c 24 04          	xor    edi,DWORD PTR [esp+0x4]
  4015cc:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  4015d0:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
  4015d4:	8b 49 2c             	mov    ecx,DWORD PTR [ecx+0x2c]
  4015d7:	89 0c 24             	mov    DWORD PTR [esp],ecx
  4015da:	31 c8                	xor    eax,ecx
  4015dc:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  4015e0:	31 ca                	xor    edx,ecx
  4015e2:	31 c2                	xor    edx,eax
  4015e4:	21 f2                	and    edx,esi
  4015e6:	f7 d6                	not    esi
  4015e8:	89 d3                	mov    ebx,edx
  4015ea:	21 d6                	and    esi,edx
  4015ec:	31 c3                	xor    ebx,eax
  4015ee:	31 c6                	xor    esi,eax
  4015f0:	31 dd                	xor    ebp,ebx
  4015f2:	31 f7                	xor    edi,esi
  4015f4:	21 cd                	and    ebp,ecx
  4015f6:	f7 d1                	not    ecx
  4015f8:	89 e8                	mov    eax,ebp
  4015fa:	21 e9                	and    ecx,ebp
  4015fc:	8b 2c 24             	mov    ebp,DWORD PTR [esp]
  4015ff:	31 d8                	xor    eax,ebx
  401601:	31 d9                	xor    ecx,ebx
  401603:	21 ef                	and    edi,ebp
  401605:	f7 d5                	not    ebp
  401607:	89 fa                	mov    edx,edi
  401609:	21 fd                	and    ebp,edi
  40160b:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
  40160f:	31 f5                	xor    ebp,esi
  401611:	31 f2                	xor    edx,esi
  401613:	89 07                	mov    DWORD PTR [edi],eax
  401615:	89 57 04             	mov    DWORD PTR [edi+0x4],edx
  401618:	89 4f 08             	mov    DWORD PTR [edi+0x8],ecx
  40161b:	89 6f 0c             	mov    DWORD PTR [edi+0xc],ebp
  40161e:	83 c4 0c             	add    esp,0xc
  401621:	5b                   	pop    ebx
  401622:	5e                   	pop    esi
  401623:	5f                   	pop    edi
  401624:	5d                   	pop    ebp
  401625:	c3                   	ret    
  401626:	90                   	nop
  401627:	90                   	nop
  401628:	90                   	nop
  401629:	90                   	nop
  40162a:	90                   	nop
  40162b:	90                   	nop
  40162c:	90                   	nop
  40162d:	90                   	nop
  40162e:	90                   	nop
  40162f:	90                   	nop

00401630 <___dyn_tls_dtor@12>:
  401630:	83 ec 1c             	sub    esp,0x1c
  401633:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  401637:	85 c0                	test   eax,eax
  401639:	74 15                	je     401650 <___dyn_tls_dtor@12+0x20>
  40163b:	83 f8 03             	cmp    eax,0x3
  40163e:	74 10                	je     401650 <___dyn_tls_dtor@12+0x20>
  401640:	b8 01 00 00 00       	mov    eax,0x1
  401645:	83 c4 1c             	add    esp,0x1c
  401648:	c2 0c 00             	ret    0xc
  40164b:	90                   	nop
  40164c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401650:	8b 54 24 28          	mov    edx,DWORD PTR [esp+0x28]
  401654:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401658:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  40165c:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  401660:	89 04 24             	mov    DWORD PTR [esp],eax
  401663:	e8 18 0a 00 00       	call   402080 <___mingw_TLScallback>
  401668:	b8 01 00 00 00       	mov    eax,0x1
  40166d:	83 c4 1c             	add    esp,0x1c
  401670:	c2 0c 00             	ret    0xc
  401673:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401679:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401680 <___dyn_tls_init@12>:
  401680:	56                   	push   esi
  401681:	53                   	push   ebx
  401682:	83 ec 14             	sub    esp,0x14
  401685:	83 3d 40 d0 40 00 02 	cmp    DWORD PTR ds:0x40d040,0x2
  40168c:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  401690:	74 0a                	je     40169c <___dyn_tls_init@12+0x1c>
  401692:	c7 05 40 d0 40 00 02 	mov    DWORD PTR ds:0x40d040,0x2
  401699:	00 00 00 
  40169c:	83 f8 02             	cmp    eax,0x2
  40169f:	74 12                	je     4016b3 <___dyn_tls_init@12+0x33>
  4016a1:	83 f8 01             	cmp    eax,0x1
  4016a4:	74 42                	je     4016e8 <___dyn_tls_init@12+0x68>
  4016a6:	83 c4 14             	add    esp,0x14
  4016a9:	b8 01 00 00 00       	mov    eax,0x1
  4016ae:	5b                   	pop    ebx
  4016af:	5e                   	pop    esi
  4016b0:	c2 0c 00             	ret    0xc
  4016b3:	be 14 f0 40 00       	mov    esi,0x40f014
  4016b8:	81 ee 14 f0 40 00    	sub    esi,0x40f014
  4016be:	c1 fe 02             	sar    esi,0x2
  4016c1:	85 f6                	test   esi,esi
  4016c3:	7e e1                	jle    4016a6 <___dyn_tls_init@12+0x26>
  4016c5:	31 db                	xor    ebx,ebx
  4016c7:	8b 04 9d 14 f0 40 00 	mov    eax,DWORD PTR [ebx*4+0x40f014]
  4016ce:	85 c0                	test   eax,eax
  4016d0:	74 02                	je     4016d4 <___dyn_tls_init@12+0x54>
  4016d2:	ff d0                	call   eax
  4016d4:	83 c3 01             	add    ebx,0x1
  4016d7:	39 f3                	cmp    ebx,esi
  4016d9:	75 ec                	jne    4016c7 <___dyn_tls_init@12+0x47>
  4016db:	83 c4 14             	add    esp,0x14
  4016de:	b8 01 00 00 00       	mov    eax,0x1
  4016e3:	5b                   	pop    ebx
  4016e4:	5e                   	pop    esi
  4016e5:	c2 0c 00             	ret    0xc
  4016e8:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4016ec:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  4016f3:	00 
  4016f4:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4016f8:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4016fc:	89 04 24             	mov    DWORD PTR [esp],eax
  4016ff:	e8 7c 09 00 00       	call   402080 <___mingw_TLScallback>
  401704:	eb a0                	jmp    4016a6 <___dyn_tls_init@12+0x26>
  401706:	8d 76 00             	lea    esi,[esi+0x0]
  401709:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401710 <___tlregdtor>:
  401710:	31 c0                	xor    eax,eax
  401712:	c3                   	ret    
  401713:	90                   	nop
  401714:	90                   	nop
  401715:	90                   	nop
  401716:	90                   	nop
  401717:	90                   	nop
  401718:	90                   	nop
  401719:	90                   	nop
  40171a:	90                   	nop
  40171b:	90                   	nop
  40171c:	90                   	nop
  40171d:	90                   	nop
  40171e:	90                   	nop
  40171f:	90                   	nop

00401720 <__fpreset>:
  401720:	db e3                	fninit 
  401722:	c3                   	ret    
  401723:	90                   	nop
  401724:	90                   	nop
  401725:	90                   	nop
  401726:	90                   	nop
  401727:	90                   	nop
  401728:	90                   	nop
  401729:	90                   	nop
  40172a:	90                   	nop
  40172b:	90                   	nop
  40172c:	90                   	nop
  40172d:	90                   	nop
  40172e:	90                   	nop
  40172f:	90                   	nop

00401730 <___cpu_features_init>:
  401730:	9c                   	pushf  
  401731:	9c                   	pushf  
  401732:	58                   	pop    eax
  401733:	89 c2                	mov    edx,eax
  401735:	35 00 00 20 00       	xor    eax,0x200000
  40173a:	50                   	push   eax
  40173b:	9d                   	popf   
  40173c:	9c                   	pushf  
  40173d:	58                   	pop    eax
  40173e:	9d                   	popf   
  40173f:	31 d0                	xor    eax,edx
  401741:	a9 00 00 20 00       	test   eax,0x200000
  401746:	0f 84 a5 00 00 00    	je     4017f1 <___cpu_features_init+0xc1>
  40174c:	53                   	push   ebx
  40174d:	31 c0                	xor    eax,eax
  40174f:	0f a2                	cpuid  
  401751:	85 c0                	test   eax,eax
  401753:	0f 84 97 00 00 00    	je     4017f0 <___cpu_features_init+0xc0>
  401759:	b8 01 00 00 00       	mov    eax,0x1
  40175e:	0f a2                	cpuid  
  401760:	f6 c6 01             	test   dh,0x1
  401763:	74 07                	je     40176c <___cpu_features_init+0x3c>
  401765:	83 0d 34 d0 40 00 01 	or     DWORD PTR ds:0x40d034,0x1
  40176c:	f6 c6 80             	test   dh,0x80
  40176f:	74 07                	je     401778 <___cpu_features_init+0x48>
  401771:	83 0d 34 d0 40 00 02 	or     DWORD PTR ds:0x40d034,0x2
  401778:	f7 c2 00 00 80 00    	test   edx,0x800000
  40177e:	74 07                	je     401787 <___cpu_features_init+0x57>
  401780:	83 0d 34 d0 40 00 04 	or     DWORD PTR ds:0x40d034,0x4
  401787:	f7 c2 00 00 00 01    	test   edx,0x1000000
  40178d:	74 07                	je     401796 <___cpu_features_init+0x66>
  40178f:	83 0d 34 d0 40 00 08 	or     DWORD PTR ds:0x40d034,0x8
  401796:	f7 c2 00 00 00 02    	test   edx,0x2000000
  40179c:	74 07                	je     4017a5 <___cpu_features_init+0x75>
  40179e:	83 0d 34 d0 40 00 10 	or     DWORD PTR ds:0x40d034,0x10
  4017a5:	81 e2 00 00 00 04    	and    edx,0x4000000
  4017ab:	74 07                	je     4017b4 <___cpu_features_init+0x84>
  4017ad:	83 0d 34 d0 40 00 20 	or     DWORD PTR ds:0x40d034,0x20
  4017b4:	f6 c1 01             	test   cl,0x1
  4017b7:	74 07                	je     4017c0 <___cpu_features_init+0x90>
  4017b9:	83 0d 34 d0 40 00 40 	or     DWORD PTR ds:0x40d034,0x40
  4017c0:	80 e5 20             	and    ch,0x20
  4017c3:	75 2e                	jne    4017f3 <___cpu_features_init+0xc3>
  4017c5:	b8 00 00 00 80       	mov    eax,0x80000000
  4017ca:	0f a2                	cpuid  
  4017cc:	3d 00 00 00 80       	cmp    eax,0x80000000
  4017d1:	76 1d                	jbe    4017f0 <___cpu_features_init+0xc0>
  4017d3:	b8 01 00 00 80       	mov    eax,0x80000001
  4017d8:	0f a2                	cpuid  
  4017da:	85 d2                	test   edx,edx
  4017dc:	78 22                	js     401800 <___cpu_features_init+0xd0>
  4017de:	81 e2 00 00 00 40    	and    edx,0x40000000
  4017e4:	74 0a                	je     4017f0 <___cpu_features_init+0xc0>
  4017e6:	81 0d 34 d0 40 00 00 	or     DWORD PTR ds:0x40d034,0x200
  4017ed:	02 00 00 
  4017f0:	5b                   	pop    ebx
  4017f1:	f3 c3                	repz ret 
  4017f3:	81 0d 34 d0 40 00 80 	or     DWORD PTR ds:0x40d034,0x80
  4017fa:	00 00 00 
  4017fd:	eb c6                	jmp    4017c5 <___cpu_features_init+0x95>
  4017ff:	90                   	nop
  401800:	81 0d 34 d0 40 00 00 	or     DWORD PTR ds:0x40d034,0x100
  401807:	01 00 00 
  40180a:	eb d2                	jmp    4017de <___cpu_features_init+0xae>
  40180c:	90                   	nop
  40180d:	90                   	nop
  40180e:	90                   	nop
  40180f:	90                   	nop

00401810 <__setargv>:
  401810:	55                   	push   ebp
  401811:	89 e5                	mov    ebp,esp
  401813:	57                   	push   edi
  401814:	56                   	push   esi
  401815:	53                   	push   ebx
  401816:	83 ec 4c             	sub    esp,0x4c
  401819:	f6 05 04 90 40 00 02 	test   BYTE PTR ds:0x409004,0x2
  401820:	0f 84 ba 02 00 00    	je     401ae0 <__setargv+0x2d0>
  401826:	e8 0d 6a 00 00       	call   408238 <_GetCommandLineA@0>
  40182b:	89 65 c0             	mov    DWORD PTR [ebp-0x40],esp
  40182e:	89 04 24             	mov    DWORD PTR [esp],eax
  401831:	89 c6                	mov    esi,eax
  401833:	e8 28 69 00 00       	call   408160 <_strlen>
  401838:	8d 44 00 11          	lea    eax,[eax+eax*1+0x11]
  40183c:	83 e0 f0             	and    eax,0xfffffff0
  40183f:	e8 dc 08 00 00       	call   402120 <___chkstk_ms>
  401844:	29 c4                	sub    esp,eax
  401846:	8d 44 24 10          	lea    eax,[esp+0x10]
  40184a:	89 c2                	mov    edx,eax
  40184c:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  40184f:	a1 04 90 40 00       	mov    eax,ds:0x409004
  401854:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  40185b:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
  401862:	c7 45 cc 00 00 00 00 	mov    DWORD PTR [ebp-0x34],0x0
  401869:	83 e0 40             	and    eax,0x40
  40186c:	83 f8 01             	cmp    eax,0x1
  40186f:	19 c0                	sbb    eax,eax
  401871:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  401874:	31 c0                	xor    eax,eax
  401876:	81 65 c8 00 c0 ff ff 	and    DWORD PTR [ebp-0x38],0xffffc000
  40187d:	81 45 c8 10 40 00 00 	add    DWORD PTR [ebp-0x38],0x4010
  401884:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
  401887:	83 c6 01             	add    esi,0x1
  40188a:	0f b6 5e ff          	movzx  ebx,BYTE PTR [esi-0x1]
  40188e:	0f be cb             	movsx  ecx,bl
  401891:	85 c9                	test   ecx,ecx
  401893:	74 7b                	je     401910 <__setargv+0x100>
  401895:	80 fb 3f             	cmp    bl,0x3f
  401898:	0f 84 13 01 00 00    	je     4019b1 <__setargv+0x1a1>
  40189e:	0f 8f ec 00 00 00    	jg     401990 <__setargv+0x180>
  4018a4:	80 fb 27             	cmp    bl,0x27
  4018a7:	0f 84 e3 01 00 00    	je     401a90 <__setargv+0x280>
  4018ad:	80 fb 2a             	cmp    bl,0x2a
  4018b0:	0f 84 fb 00 00 00    	je     4019b1 <__setargv+0x1a1>
  4018b6:	80 fb 22             	cmp    bl,0x22
  4018b9:	0f 85 36 01 00 00    	jne    4019f5 <__setargv+0x1e5>
  4018bf:	89 c3                	mov    ebx,eax
  4018c1:	d1 fb                	sar    ebx,1
  4018c3:	0f 84 3e 02 00 00    	je     401b07 <__setargv+0x2f7>
  4018c9:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  4018cc:	01 d3                	add    ebx,edx
  4018ce:	66 90                	xchg   ax,ax
  4018d0:	83 c2 01             	add    edx,0x1
  4018d3:	39 da                	cmp    edx,ebx
  4018d5:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  4018d9:	75 f5                	jne    4018d0 <__setargv+0xc0>
  4018db:	a8 01                	test   al,0x1
  4018dd:	0f 85 93 00 00 00    	jne    401976 <__setargv+0x166>
  4018e3:	83 7d d0 27          	cmp    DWORD PTR [ebp-0x30],0x27
  4018e7:	0f 84 89 00 00 00    	je     401976 <__setargv+0x166>
  4018ed:	83 c6 01             	add    esi,0x1
  4018f0:	31 c0                	xor    eax,eax
  4018f2:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
  4018f5:	0f b6 5e ff          	movzx  ebx,BYTE PTR [esi-0x1]
  4018f9:	31 4d d0             	xor    DWORD PTR [ebp-0x30],ecx
  4018fc:	c7 45 cc 01 00 00 00 	mov    DWORD PTR [ebp-0x34],0x1
  401903:	0f be cb             	movsx  ecx,bl
  401906:	85 c9                	test   ecx,ecx
  401908:	75 8b                	jne    401895 <__setargv+0x85>
  40190a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401910:	85 c0                	test   eax,eax
  401912:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  401915:	0f 84 f4 01 00 00    	je     401b0f <__setargv+0x2ff>
  40191b:	01 d0                	add    eax,edx
  40191d:	8d 76 00             	lea    esi,[esi+0x0]
  401920:	83 c2 01             	add    edx,0x1
  401923:	39 c2                	cmp    edx,eax
  401925:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  401929:	75 f5                	jne    401920 <__setargv+0x110>
  40192b:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  40192e:	85 d2                	test   edx,edx
  401930:	75 05                	jne    401937 <__setargv+0x127>
  401932:	39 45 c4             	cmp    DWORD PTR [ebp-0x3c],eax
  401935:	73 24                	jae    40195b <__setargv+0x14b>
  401937:	c6 00 00             	mov    BYTE PTR [eax],0x0
  40193a:	8d 45 d8             	lea    eax,[ebp-0x28]
  40193d:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401941:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  401948:	00 
  401949:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  40194c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401950:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
  401953:	89 04 24             	mov    DWORD PTR [esp],eax
  401956:	e8 f5 13 00 00       	call   402d50 <___mingw_glob>
  40195b:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  40195e:	a3 04 d0 40 00       	mov    ds:0x40d004,eax
  401963:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  401966:	a3 00 d0 40 00       	mov    ds:0x40d000,eax
  40196b:	8b 65 c0             	mov    esp,DWORD PTR [ebp-0x40]
  40196e:	8d 65 f4             	lea    esp,[ebp-0xc]
  401971:	5b                   	pop    ebx
  401972:	5e                   	pop    esi
  401973:	5f                   	pop    edi
  401974:	5d                   	pop    ebp
  401975:	c3                   	ret    
  401976:	8d 43 01             	lea    eax,[ebx+0x1]
  401979:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  40197c:	31 c0                	xor    eax,eax
  40197e:	c6 03 22             	mov    BYTE PTR [ebx],0x22
  401981:	c7 45 cc 01 00 00 00 	mov    DWORD PTR [ebp-0x34],0x1
  401988:	e9 fa fe ff ff       	jmp    401887 <__setargv+0x77>
  40198d:	8d 76 00             	lea    esi,[esi+0x0]
  401990:	80 fb 5c             	cmp    bl,0x5c
  401993:	0f 84 3f 01 00 00    	je     401ad8 <__setargv+0x2c8>
  401999:	80 fb 7f             	cmp    bl,0x7f
  40199c:	74 13                	je     4019b1 <__setargv+0x1a1>
  40199e:	80 fb 5b             	cmp    bl,0x5b
  4019a1:	75 52                	jne    4019f5 <__setargv+0x1e5>
  4019a3:	f6 05 04 90 40 00 20 	test   BYTE PTR ds:0x409004,0x20
  4019aa:	bf 01 00 00 00       	mov    edi,0x1
  4019af:	74 0a                	je     4019bb <__setargv+0x1ab>
  4019b1:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  4019b4:	85 d2                	test   edx,edx
  4019b6:	0f 95 c2             	setne  dl
  4019b9:	89 d7                	mov    edi,edx
  4019bb:	85 c0                	test   eax,eax
  4019bd:	0f 84 34 01 00 00    	je     401af7 <__setargv+0x2e7>
  4019c3:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  4019c6:	01 d0                	add    eax,edx
  4019c8:	83 c2 01             	add    edx,0x1
  4019cb:	39 c2                	cmp    edx,eax
  4019cd:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  4019d1:	75 f5                	jne    4019c8 <__setargv+0x1b8>
  4019d3:	89 fa                	mov    edx,edi
  4019d5:	84 d2                	test   dl,dl
  4019d7:	0f 85 a3 00 00 00    	jne    401a80 <__setargv+0x270>
  4019dd:	83 f9 7f             	cmp    ecx,0x7f
  4019e0:	0f 84 9a 00 00 00    	je     401a80 <__setargv+0x270>
  4019e6:	8d 48 01             	lea    ecx,[eax+0x1]
  4019e9:	88 18                	mov    BYTE PTR [eax],bl
  4019eb:	31 c0                	xor    eax,eax
  4019ed:	89 4d d4             	mov    DWORD PTR [ebp-0x2c],ecx
  4019f0:	e9 92 fe ff ff       	jmp    401887 <__setargv+0x77>
  4019f5:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
  4019f8:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  4019fb:	01 c7                	add    edi,eax
  4019fd:	85 c0                	test   eax,eax
  4019ff:	0f 84 fa 00 00 00    	je     401aff <__setargv+0x2ef>
  401a05:	83 c2 01             	add    edx,0x1
  401a08:	39 fa                	cmp    edx,edi
  401a0a:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  401a0e:	75 f5                	jne    401a05 <__setargv+0x1f5>
  401a10:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  401a13:	85 c0                	test   eax,eax
  401a15:	75 59                	jne    401a70 <__setargv+0x260>
  401a17:	89 0c 24             	mov    DWORD PTR [esp],ecx
  401a1a:	e8 49 67 00 00       	call   408168 <_isspace>
  401a1f:	85 c0                	test   eax,eax
  401a21:	74 4d                	je     401a70 <__setargv+0x260>
  401a23:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  401a26:	85 c9                	test   ecx,ecx
  401a28:	75 09                	jne    401a33 <__setargv+0x223>
  401a2a:	39 7d c4             	cmp    DWORD PTR [ebp-0x3c],edi
  401a2d:	0f 83 ba 00 00 00    	jae    401aed <__setargv+0x2dd>
  401a33:	8d 45 d8             	lea    eax,[ebp-0x28]
  401a36:	c6 07 00             	mov    BYTE PTR [edi],0x0
  401a39:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401a3d:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  401a44:	00 
  401a45:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  401a48:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401a4c:	8b 7d c4             	mov    edi,DWORD PTR [ebp-0x3c]
  401a4f:	89 3c 24             	mov    DWORD PTR [esp],edi
  401a52:	e8 f9 12 00 00       	call   402d50 <___mingw_glob>
  401a57:	31 c0                	xor    eax,eax
  401a59:	83 4d c8 01          	or     DWORD PTR [ebp-0x38],0x1
  401a5d:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
  401a60:	c7 45 cc 00 00 00 00 	mov    DWORD PTR [ebp-0x34],0x0
  401a67:	e9 1b fe ff ff       	jmp    401887 <__setargv+0x77>
  401a6c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401a70:	8d 47 01             	lea    eax,[edi+0x1]
  401a73:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  401a76:	31 c0                	xor    eax,eax
  401a78:	88 1f                	mov    BYTE PTR [edi],bl
  401a7a:	e9 08 fe ff ff       	jmp    401887 <__setargv+0x77>
  401a7f:	90                   	nop
  401a80:	c6 00 7f             	mov    BYTE PTR [eax],0x7f
  401a83:	83 c0 01             	add    eax,0x1
  401a86:	e9 5b ff ff ff       	jmp    4019e6 <__setargv+0x1d6>
  401a8b:	90                   	nop
  401a8c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401a90:	f6 05 04 90 40 00 10 	test   BYTE PTR ds:0x409004,0x10
  401a97:	0f 84 58 ff ff ff    	je     4019f5 <__setargv+0x1e5>
  401a9d:	89 c3                	mov    ebx,eax
  401a9f:	d1 fb                	sar    ebx,1
  401aa1:	74 73                	je     401b16 <__setargv+0x306>
  401aa3:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  401aa6:	01 d3                	add    ebx,edx
  401aa8:	83 c2 01             	add    edx,0x1
  401aab:	39 da                	cmp    edx,ebx
  401aad:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  401ab1:	75 f5                	jne    401aa8 <__setargv+0x298>
  401ab3:	a8 01                	test   al,0x1
  401ab5:	75 0a                	jne    401ac1 <__setargv+0x2b1>
  401ab7:	83 7d d0 22          	cmp    DWORD PTR [ebp-0x30],0x22
  401abb:	0f 85 2c fe ff ff    	jne    4018ed <__setargv+0xdd>
  401ac1:	8d 43 01             	lea    eax,[ebx+0x1]
  401ac4:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  401ac7:	31 c0                	xor    eax,eax
  401ac9:	c6 03 27             	mov    BYTE PTR [ebx],0x27
  401acc:	c7 45 cc 01 00 00 00 	mov    DWORD PTR [ebp-0x34],0x1
  401ad3:	e9 af fd ff ff       	jmp    401887 <__setargv+0x77>
  401ad8:	83 c0 01             	add    eax,0x1
  401adb:	e9 a7 fd ff ff       	jmp    401887 <__setargv+0x77>
  401ae0:	e8 7b f7 ff ff       	call   401260 <__mingw32_init_mainargs>
  401ae5:	8d 65 f4             	lea    esp,[ebp-0xc]
  401ae8:	5b                   	pop    ebx
  401ae9:	5e                   	pop    esi
  401aea:	5f                   	pop    edi
  401aeb:	5d                   	pop    ebp
  401aec:	c3                   	ret    
  401aed:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
  401af0:	31 c0                	xor    eax,eax
  401af2:	e9 90 fd ff ff       	jmp    401887 <__setargv+0x77>
  401af7:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  401afa:	e9 d4 fe ff ff       	jmp    4019d3 <__setargv+0x1c3>
  401aff:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
  401b02:	e9 09 ff ff ff       	jmp    401a10 <__setargv+0x200>
  401b07:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
  401b0a:	e9 cc fd ff ff       	jmp    4018db <__setargv+0xcb>
  401b0f:	89 d0                	mov    eax,edx
  401b11:	e9 15 fe ff ff       	jmp    40192b <__setargv+0x11b>
  401b16:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
  401b19:	eb 98                	jmp    401ab3 <__setargv+0x2a3>
  401b1b:	90                   	nop
  401b1c:	90                   	nop
  401b1d:	90                   	nop
  401b1e:	90                   	nop
  401b1f:	90                   	nop

00401b20 <___report_error>:
  401b20:	56                   	push   esi
  401b21:	53                   	push   ebx
  401b22:	83 ec 14             	sub    esp,0x14
  401b25:	a1 cc e1 40 00       	mov    eax,ds:0x40e1cc
  401b2a:	c7 44 24 08 17 00 00 	mov    DWORD PTR [esp+0x8],0x17
  401b31:	00 
  401b32:	8d 74 24 24          	lea    esi,[esp+0x24]
  401b36:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401b3d:	00 
  401b3e:	c7 04 24 84 a0 40 00 	mov    DWORD PTR [esp],0x40a084
  401b45:	8d 58 40             	lea    ebx,[eax+0x40]
  401b48:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  401b4c:	e8 1f 66 00 00       	call   408170 <_fwrite>
  401b51:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  401b55:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  401b59:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401b5c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401b60:	e8 13 66 00 00       	call   408178 <_vfprintf>
  401b65:	e8 16 66 00 00       	call   408180 <_abort>
  401b6a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

00401b70 <___write_memory.part.0>:
  401b70:	55                   	push   ebp
  401b71:	89 e5                	mov    ebp,esp
  401b73:	57                   	push   edi
  401b74:	89 cf                	mov    edi,ecx
  401b76:	56                   	push   esi
  401b77:	89 d6                	mov    esi,edx
  401b79:	53                   	push   ebx
  401b7a:	89 c3                	mov    ebx,eax
  401b7c:	83 ec 4c             	sub    esp,0x4c
  401b7f:	8d 45 cc             	lea    eax,[ebp-0x34]
  401b82:	c7 44 24 08 1c 00 00 	mov    DWORD PTR [esp+0x8],0x1c
  401b89:	00 
  401b8a:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401b8e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401b91:	e8 aa 66 00 00       	call   408240 <_VirtualQuery@12>
  401b96:	83 ec 0c             	sub    esp,0xc
  401b99:	85 c0                	test   eax,eax
  401b9b:	0f 84 9a 00 00 00    	je     401c3b <___write_memory.part.0+0xcb>
  401ba1:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  401ba4:	83 f8 04             	cmp    eax,0x4
  401ba7:	75 18                	jne    401bc1 <___write_memory.part.0+0x51>
  401ba9:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  401bad:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  401bb1:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401bb4:	e8 cf 65 00 00       	call   408188 <_memcpy>
  401bb9:	8d 65 f4             	lea    esp,[ebp-0xc]
  401bbc:	5b                   	pop    ebx
  401bbd:	5e                   	pop    esi
  401bbe:	5f                   	pop    edi
  401bbf:	5d                   	pop    ebp
  401bc0:	c3                   	ret    
  401bc1:	83 f8 40             	cmp    eax,0x40
  401bc4:	74 e3                	je     401ba9 <___write_memory.part.0+0x39>
  401bc6:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  401bc9:	8d 55 c8             	lea    edx,[ebp-0x38]
  401bcc:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  401bd0:	c7 44 24 08 40 00 00 	mov    DWORD PTR [esp+0x8],0x40
  401bd7:	00 
  401bd8:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
  401bdb:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401bdf:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  401be2:	89 04 24             	mov    DWORD PTR [esp],eax
  401be5:	e8 5e 66 00 00       	call   408248 <_VirtualProtect@16>
  401bea:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
  401bed:	89 4d c0             	mov    DWORD PTR [ebp-0x40],ecx
  401bf0:	83 ec 10             	sub    esp,0x10
  401bf3:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  401bf7:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  401bfb:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401bfe:	e8 85 65 00 00       	call   408188 <_memcpy>
  401c03:	8b 4d c0             	mov    ecx,DWORD PTR [ebp-0x40]
  401c06:	83 f9 04             	cmp    ecx,0x4
  401c09:	74 ae                	je     401bb9 <___write_memory.part.0+0x49>
  401c0b:	83 f9 40             	cmp    ecx,0x40
  401c0e:	74 a9                	je     401bb9 <___write_memory.part.0+0x49>
  401c10:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  401c13:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  401c16:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401c1a:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  401c1d:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  401c21:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401c25:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  401c28:	89 04 24             	mov    DWORD PTR [esp],eax
  401c2b:	e8 18 66 00 00       	call   408248 <_VirtualProtect@16>
  401c30:	83 ec 10             	sub    esp,0x10
  401c33:	8d 65 f4             	lea    esp,[ebp-0xc]
  401c36:	5b                   	pop    ebx
  401c37:	5e                   	pop    esi
  401c38:	5f                   	pop    edi
  401c39:	5d                   	pop    ebp
  401c3a:	c3                   	ret    
  401c3b:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  401c3f:	c7 44 24 04 1c 00 00 	mov    DWORD PTR [esp+0x4],0x1c
  401c46:	00 
  401c47:	c7 04 24 9c a0 40 00 	mov    DWORD PTR [esp],0x40a09c
  401c4e:	e8 cd fe ff ff       	call   401b20 <___report_error>
  401c53:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401c59:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401c60 <__pei386_runtime_relocator>:
  401c60:	a1 38 d0 40 00       	mov    eax,ds:0x40d038
  401c65:	85 c0                	test   eax,eax
  401c67:	74 07                	je     401c70 <__pei386_runtime_relocator+0x10>
  401c69:	c3                   	ret    
  401c6a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401c70:	b8 40 a7 40 00       	mov    eax,0x40a740
  401c75:	2d 40 a7 40 00       	sub    eax,0x40a740
  401c7a:	83 f8 07             	cmp    eax,0x7
  401c7d:	c7 05 38 d0 40 00 01 	mov    DWORD PTR ds:0x40d038,0x1
  401c84:	00 00 00 
  401c87:	7e e0                	jle    401c69 <__pei386_runtime_relocator+0x9>
  401c89:	57                   	push   edi
  401c8a:	56                   	push   esi
  401c8b:	53                   	push   ebx
  401c8c:	83 ec 20             	sub    esp,0x20
  401c8f:	83 f8 0b             	cmp    eax,0xb
  401c92:	0f 8e de 00 00 00    	jle    401d76 <__pei386_runtime_relocator+0x116>
  401c98:	8b 35 40 a7 40 00    	mov    esi,DWORD PTR ds:0x40a740
  401c9e:	85 f6                	test   esi,esi
  401ca0:	0f 85 8a 00 00 00    	jne    401d30 <__pei386_runtime_relocator+0xd0>
  401ca6:	8b 1d 44 a7 40 00    	mov    ebx,DWORD PTR ds:0x40a744
  401cac:	85 db                	test   ebx,ebx
  401cae:	0f 85 7c 00 00 00    	jne    401d30 <__pei386_runtime_relocator+0xd0>
  401cb4:	8b 0d 48 a7 40 00    	mov    ecx,DWORD PTR ds:0x40a748
  401cba:	bb 4c a7 40 00       	mov    ebx,0x40a74c
  401cbf:	85 c9                	test   ecx,ecx
  401cc1:	0f 84 b4 00 00 00    	je     401d7b <__pei386_runtime_relocator+0x11b>
  401cc7:	bb 40 a7 40 00       	mov    ebx,0x40a740
  401ccc:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  401ccf:	83 f8 01             	cmp    eax,0x1
  401cd2:	0f 85 49 01 00 00    	jne    401e21 <__pei386_runtime_relocator+0x1c1>
  401cd8:	83 c3 0c             	add    ebx,0xc
  401cdb:	81 fb 40 a7 40 00    	cmp    ebx,0x40a740
  401ce1:	0f 83 88 00 00 00    	jae    401d6f <__pei386_runtime_relocator+0x10f>
  401ce7:	0f b6 53 08          	movzx  edx,BYTE PTR [ebx+0x8]
  401ceb:	8b 73 04             	mov    esi,DWORD PTR [ebx+0x4]
  401cee:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  401cf0:	83 fa 10             	cmp    edx,0x10
  401cf3:	8d 86 00 00 40 00    	lea    eax,[esi+0x400000]
  401cf9:	8b b9 00 00 40 00    	mov    edi,DWORD PTR [ecx+0x400000]
  401cff:	0f 84 8b 00 00 00    	je     401d90 <__pei386_runtime_relocator+0x130>
  401d05:	83 fa 20             	cmp    edx,0x20
  401d08:	0f 84 f2 00 00 00    	je     401e00 <__pei386_runtime_relocator+0x1a0>
  401d0e:	83 fa 08             	cmp    edx,0x8
  401d11:	0f 84 af 00 00 00    	je     401dc6 <__pei386_runtime_relocator+0x166>
  401d17:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  401d1b:	c7 04 24 04 a1 40 00 	mov    DWORD PTR [esp],0x40a104
  401d22:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [esp+0x1c],0x0
  401d29:	00 
  401d2a:	e8 f1 fd ff ff       	call   401b20 <___report_error>
  401d2f:	90                   	nop
  401d30:	bb 40 a7 40 00       	mov    ebx,0x40a740
  401d35:	81 fb 40 a7 40 00    	cmp    ebx,0x40a740
  401d3b:	73 32                	jae    401d6f <__pei386_runtime_relocator+0x10f>
  401d3d:	8d 76 00             	lea    esi,[esi+0x0]
  401d40:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
  401d43:	b9 04 00 00 00       	mov    ecx,0x4
  401d48:	83 c3 08             	add    ebx,0x8
  401d4b:	8d 82 00 00 40 00    	lea    eax,[edx+0x400000]
  401d51:	8b 92 00 00 40 00    	mov    edx,DWORD PTR [edx+0x400000]
  401d57:	03 53 f8             	add    edx,DWORD PTR [ebx-0x8]
  401d5a:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  401d5e:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401d62:	e8 09 fe ff ff       	call   401b70 <___write_memory.part.0>
  401d67:	81 fb 40 a7 40 00    	cmp    ebx,0x40a740
  401d6d:	72 d1                	jb     401d40 <__pei386_runtime_relocator+0xe0>
  401d6f:	83 c4 20             	add    esp,0x20
  401d72:	5b                   	pop    ebx
  401d73:	5e                   	pop    esi
  401d74:	5f                   	pop    edi
  401d75:	c3                   	ret    
  401d76:	bb 40 a7 40 00       	mov    ebx,0x40a740
  401d7b:	8b 13                	mov    edx,DWORD PTR [ebx]
  401d7d:	85 d2                	test   edx,edx
  401d7f:	75 b4                	jne    401d35 <__pei386_runtime_relocator+0xd5>
  401d81:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  401d84:	85 c0                	test   eax,eax
  401d86:	0f 84 40 ff ff ff    	je     401ccc <__pei386_runtime_relocator+0x6c>
  401d8c:	eb a7                	jmp    401d35 <__pei386_runtime_relocator+0xd5>
  401d8e:	66 90                	xchg   ax,ax
  401d90:	0f b7 b6 00 00 40 00 	movzx  esi,WORD PTR [esi+0x400000]
  401d97:	66 85 f6             	test   si,si
  401d9a:	0f b7 d6             	movzx  edx,si
  401d9d:	79 06                	jns    401da5 <__pei386_runtime_relocator+0x145>
  401d9f:	81 ca 00 00 ff ff    	or     edx,0xffff0000
  401da5:	29 ca                	sub    edx,ecx
  401da7:	b9 02 00 00 00       	mov    ecx,0x2
  401dac:	81 ea 00 00 40 00    	sub    edx,0x400000
  401db2:	01 fa                	add    edx,edi
  401db4:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  401db8:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401dbc:	e8 af fd ff ff       	call   401b70 <___write_memory.part.0>
  401dc1:	e9 12 ff ff ff       	jmp    401cd8 <__pei386_runtime_relocator+0x78>
  401dc6:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  401dc9:	84 d2                	test   dl,dl
  401dcb:	0f b6 f2             	movzx  esi,dl
  401dce:	79 06                	jns    401dd6 <__pei386_runtime_relocator+0x176>
  401dd0:	81 ce 00 ff ff ff    	or     esi,0xffffff00
  401dd6:	81 ee 00 00 40 00    	sub    esi,0x400000
  401ddc:	89 f2                	mov    edx,esi
  401dde:	29 ca                	sub    edx,ecx
  401de0:	b9 01 00 00 00       	mov    ecx,0x1
  401de5:	01 fa                	add    edx,edi
  401de7:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  401deb:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401def:	e8 7c fd ff ff       	call   401b70 <___write_memory.part.0>
  401df4:	e9 df fe ff ff       	jmp    401cd8 <__pei386_runtime_relocator+0x78>
  401df9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401e00:	81 c1 00 00 40 00    	add    ecx,0x400000
  401e06:	29 cf                	sub    edi,ecx
  401e08:	b9 04 00 00 00       	mov    ecx,0x4
  401e0d:	03 38                	add    edi,DWORD PTR [eax]
  401e0f:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401e13:	89 7c 24 1c          	mov    DWORD PTR [esp+0x1c],edi
  401e17:	e8 54 fd ff ff       	call   401b70 <___write_memory.part.0>
  401e1c:	e9 b7 fe ff ff       	jmp    401cd8 <__pei386_runtime_relocator+0x78>
  401e21:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401e25:	c7 04 24 d0 a0 40 00 	mov    DWORD PTR [esp],0x40a0d0
  401e2c:	e8 ef fc ff ff       	call   401b20 <___report_error>
  401e31:	90                   	nop
  401e32:	90                   	nop
  401e33:	90                   	nop
  401e34:	90                   	nop
  401e35:	90                   	nop
  401e36:	90                   	nop
  401e37:	90                   	nop
  401e38:	90                   	nop
  401e39:	90                   	nop
  401e3a:	90                   	nop
  401e3b:	90                   	nop
  401e3c:	90                   	nop
  401e3d:	90                   	nop
  401e3e:	90                   	nop
  401e3f:	90                   	nop

00401e40 <___do_global_dtors>:
  401e40:	a1 08 90 40 00       	mov    eax,ds:0x409008
  401e45:	8b 00                	mov    eax,DWORD PTR [eax]
  401e47:	85 c0                	test   eax,eax
  401e49:	74 1f                	je     401e6a <___do_global_dtors+0x2a>
  401e4b:	83 ec 0c             	sub    esp,0xc
  401e4e:	66 90                	xchg   ax,ax
  401e50:	ff d0                	call   eax
  401e52:	a1 08 90 40 00       	mov    eax,ds:0x409008
  401e57:	8d 50 04             	lea    edx,[eax+0x4]
  401e5a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401e5d:	89 15 08 90 40 00    	mov    DWORD PTR ds:0x409008,edx
  401e63:	85 c0                	test   eax,eax
  401e65:	75 e9                	jne    401e50 <___do_global_dtors+0x10>
  401e67:	83 c4 0c             	add    esp,0xc
  401e6a:	f3 c3                	repz ret 
  401e6c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00401e70 <___do_global_ctors>:
  401e70:	53                   	push   ebx
  401e71:	83 ec 18             	sub    esp,0x18
  401e74:	8b 1d e0 85 40 00    	mov    ebx,DWORD PTR ds:0x4085e0
  401e7a:	83 fb ff             	cmp    ebx,0xffffffff
  401e7d:	74 24                	je     401ea3 <___do_global_ctors+0x33>
  401e7f:	85 db                	test   ebx,ebx
  401e81:	74 0f                	je     401e92 <___do_global_ctors+0x22>
  401e83:	ff 14 9d e0 85 40 00 	call   DWORD PTR [ebx*4+0x4085e0]
  401e8a:	83 eb 01             	sub    ebx,0x1
  401e8d:	8d 76 00             	lea    esi,[esi+0x0]
  401e90:	75 f1                	jne    401e83 <___do_global_ctors+0x13>
  401e92:	c7 04 24 40 1e 40 00 	mov    DWORD PTR [esp],0x401e40
  401e99:	e8 42 f4 ff ff       	call   4012e0 <_atexit>
  401e9e:	83 c4 18             	add    esp,0x18
  401ea1:	5b                   	pop    ebx
  401ea2:	c3                   	ret    
  401ea3:	31 db                	xor    ebx,ebx
  401ea5:	eb 02                	jmp    401ea9 <___do_global_ctors+0x39>
  401ea7:	89 c3                	mov    ebx,eax
  401ea9:	8d 43 01             	lea    eax,[ebx+0x1]
  401eac:	8b 14 85 e0 85 40 00 	mov    edx,DWORD PTR [eax*4+0x4085e0]
  401eb3:	85 d2                	test   edx,edx
  401eb5:	75 f0                	jne    401ea7 <___do_global_ctors+0x37>
  401eb7:	eb c6                	jmp    401e7f <___do_global_ctors+0xf>
  401eb9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00401ec0 <___main>:
  401ec0:	8b 0d 3c d0 40 00    	mov    ecx,DWORD PTR ds:0x40d03c
  401ec6:	85 c9                	test   ecx,ecx
  401ec8:	74 06                	je     401ed0 <___main+0x10>
  401eca:	f3 c3                	repz ret 
  401ecc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401ed0:	c7 05 3c d0 40 00 01 	mov    DWORD PTR ds:0x40d03c,0x1
  401ed7:	00 00 00 
  401eda:	eb 94                	jmp    401e70 <___do_global_ctors>
  401edc:	90                   	nop
  401edd:	90                   	nop
  401ede:	90                   	nop
  401edf:	90                   	nop

00401ee0 <___mingwthr_run_key_dtors.part.0>:
  401ee0:	55                   	push   ebp
  401ee1:	89 e5                	mov    ebp,esp
  401ee3:	56                   	push   esi
  401ee4:	53                   	push   ebx
  401ee5:	83 ec 10             	sub    esp,0x10
  401ee8:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401eef:	e8 5c 63 00 00       	call   408250 <_EnterCriticalSection@4>
  401ef4:	8b 1d 44 d0 40 00    	mov    ebx,DWORD PTR ds:0x40d044
  401efa:	83 ec 04             	sub    esp,0x4
  401efd:	85 db                	test   ebx,ebx
  401eff:	74 2b                	je     401f2c <___mingwthr_run_key_dtors.part.0+0x4c>
  401f01:	8b 03                	mov    eax,DWORD PTR [ebx]
  401f03:	89 04 24             	mov    DWORD PTR [esp],eax
  401f06:	e8 4d 63 00 00       	call   408258 <_TlsGetValue@4>
  401f0b:	83 ec 04             	sub    esp,0x4
  401f0e:	89 c6                	mov    esi,eax
  401f10:	e8 4b 63 00 00       	call   408260 <_GetLastError@0>
  401f15:	85 c0                	test   eax,eax
  401f17:	75 0c                	jne    401f25 <___mingwthr_run_key_dtors.part.0+0x45>
  401f19:	85 f6                	test   esi,esi
  401f1b:	74 08                	je     401f25 <___mingwthr_run_key_dtors.part.0+0x45>
  401f1d:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  401f20:	89 34 24             	mov    DWORD PTR [esp],esi
  401f23:	ff d0                	call   eax
  401f25:	8b 5b 08             	mov    ebx,DWORD PTR [ebx+0x8]
  401f28:	85 db                	test   ebx,ebx
  401f2a:	75 d5                	jne    401f01 <___mingwthr_run_key_dtors.part.0+0x21>
  401f2c:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401f33:	e8 30 63 00 00       	call   408268 <_LeaveCriticalSection@4>
  401f38:	83 ec 04             	sub    esp,0x4
  401f3b:	8d 65 f8             	lea    esp,[ebp-0x8]
  401f3e:	5b                   	pop    ebx
  401f3f:	5e                   	pop    esi
  401f40:	5d                   	pop    ebp
  401f41:	c3                   	ret    
  401f42:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401f49:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401f50 <____w64_mingwthr_add_key_dtor>:
  401f50:	55                   	push   ebp
  401f51:	89 e5                	mov    ebp,esp
  401f53:	56                   	push   esi
  401f54:	31 f6                	xor    esi,esi
  401f56:	53                   	push   ebx
  401f57:	83 ec 10             	sub    esp,0x10
  401f5a:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  401f5f:	85 c0                	test   eax,eax
  401f61:	75 0d                	jne    401f70 <____w64_mingwthr_add_key_dtor+0x20>
  401f63:	8d 65 f8             	lea    esp,[ebp-0x8]
  401f66:	89 f0                	mov    eax,esi
  401f68:	5b                   	pop    ebx
  401f69:	5e                   	pop    esi
  401f6a:	5d                   	pop    ebp
  401f6b:	c3                   	ret    
  401f6c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401f70:	c7 44 24 04 0c 00 00 	mov    DWORD PTR [esp+0x4],0xc
  401f77:	00 
  401f78:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  401f7f:	e8 0c 62 00 00       	call   408190 <_calloc>
  401f84:	85 c0                	test   eax,eax
  401f86:	89 c3                	mov    ebx,eax
  401f88:	74 40                	je     401fca <____w64_mingwthr_add_key_dtor+0x7a>
  401f8a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401f8d:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401f94:	89 03                	mov    DWORD PTR [ebx],eax
  401f96:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  401f99:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
  401f9c:	e8 af 62 00 00       	call   408250 <_EnterCriticalSection@4>
  401fa1:	a1 44 d0 40 00       	mov    eax,ds:0x40d044
  401fa6:	89 1d 44 d0 40 00    	mov    DWORD PTR ds:0x40d044,ebx
  401fac:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  401faf:	83 ec 04             	sub    esp,0x4
  401fb2:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401fb9:	e8 aa 62 00 00       	call   408268 <_LeaveCriticalSection@4>
  401fbe:	89 f0                	mov    eax,esi
  401fc0:	83 ec 04             	sub    esp,0x4
  401fc3:	8d 65 f8             	lea    esp,[ebp-0x8]
  401fc6:	5b                   	pop    ebx
  401fc7:	5e                   	pop    esi
  401fc8:	5d                   	pop    ebp
  401fc9:	c3                   	ret    
  401fca:	be ff ff ff ff       	mov    esi,0xffffffff
  401fcf:	eb 92                	jmp    401f63 <____w64_mingwthr_add_key_dtor+0x13>
  401fd1:	eb 0d                	jmp    401fe0 <____w64_mingwthr_remove_key_dtor>
  401fd3:	90                   	nop
  401fd4:	90                   	nop
  401fd5:	90                   	nop
  401fd6:	90                   	nop
  401fd7:	90                   	nop
  401fd8:	90                   	nop
  401fd9:	90                   	nop
  401fda:	90                   	nop
  401fdb:	90                   	nop
  401fdc:	90                   	nop
  401fdd:	90                   	nop
  401fde:	90                   	nop
  401fdf:	90                   	nop

00401fe0 <____w64_mingwthr_remove_key_dtor>:
  401fe0:	55                   	push   ebp
  401fe1:	89 e5                	mov    ebp,esp
  401fe3:	53                   	push   ebx
  401fe4:	83 ec 14             	sub    esp,0x14
  401fe7:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  401fec:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  401fef:	85 c0                	test   eax,eax
  401ff1:	75 0d                	jne    402000 <____w64_mingwthr_remove_key_dtor+0x20>
  401ff3:	31 c0                	xor    eax,eax
  401ff5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  401ff8:	c9                   	leave  
  401ff9:	c3                   	ret    
  401ffa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402000:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  402007:	e8 44 62 00 00       	call   408250 <_EnterCriticalSection@4>
  40200c:	8b 15 44 d0 40 00    	mov    edx,DWORD PTR ds:0x40d044
  402012:	83 ec 04             	sub    esp,0x4
  402015:	85 d2                	test   edx,edx
  402017:	74 17                	je     402030 <____w64_mingwthr_remove_key_dtor+0x50>
  402019:	8b 02                	mov    eax,DWORD PTR [edx]
  40201b:	39 d8                	cmp    eax,ebx
  40201d:	75 0a                	jne    402029 <____w64_mingwthr_remove_key_dtor+0x49>
  40201f:	eb 44                	jmp    402065 <____w64_mingwthr_remove_key_dtor+0x85>
  402021:	8b 08                	mov    ecx,DWORD PTR [eax]
  402023:	39 d9                	cmp    ecx,ebx
  402025:	74 1f                	je     402046 <____w64_mingwthr_remove_key_dtor+0x66>
  402027:	89 c2                	mov    edx,eax
  402029:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
  40202c:	85 c0                	test   eax,eax
  40202e:	75 f1                	jne    402021 <____w64_mingwthr_remove_key_dtor+0x41>
  402030:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  402037:	e8 2c 62 00 00       	call   408268 <_LeaveCriticalSection@4>
  40203c:	83 ec 04             	sub    esp,0x4
  40203f:	31 c0                	xor    eax,eax
  402041:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  402044:	c9                   	leave  
  402045:	c3                   	ret    
  402046:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
  402049:	89 4a 08             	mov    DWORD PTR [edx+0x8],ecx
  40204c:	89 04 24             	mov    DWORD PTR [esp],eax
  40204f:	e8 44 61 00 00       	call   408198 <_free>
  402054:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  40205b:	e8 08 62 00 00       	call   408268 <_LeaveCriticalSection@4>
  402060:	83 ec 04             	sub    esp,0x4
  402063:	eb da                	jmp    40203f <____w64_mingwthr_remove_key_dtor+0x5f>
  402065:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
  402068:	a3 44 d0 40 00       	mov    ds:0x40d044,eax
  40206d:	89 d0                	mov    eax,edx
  40206f:	eb db                	jmp    40204c <____w64_mingwthr_remove_key_dtor+0x6c>
  402071:	eb 0d                	jmp    402080 <___mingw_TLScallback>
  402073:	90                   	nop
  402074:	90                   	nop
  402075:	90                   	nop
  402076:	90                   	nop
  402077:	90                   	nop
  402078:	90                   	nop
  402079:	90                   	nop
  40207a:	90                   	nop
  40207b:	90                   	nop
  40207c:	90                   	nop
  40207d:	90                   	nop
  40207e:	90                   	nop
  40207f:	90                   	nop

00402080 <___mingw_TLScallback>:
  402080:	55                   	push   ebp
  402081:	89 e5                	mov    ebp,esp
  402083:	83 ec 18             	sub    esp,0x18
  402086:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  402089:	83 f8 01             	cmp    eax,0x1
  40208c:	74 45                	je     4020d3 <___mingw_TLScallback+0x53>
  40208e:	72 15                	jb     4020a5 <___mingw_TLScallback+0x25>
  402090:	83 f8 03             	cmp    eax,0x3
  402093:	75 09                	jne    40209e <___mingw_TLScallback+0x1e>
  402095:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  40209a:	85 c0                	test   eax,eax
  40209c:	75 63                	jne    402101 <___mingw_TLScallback+0x81>
  40209e:	b8 01 00 00 00       	mov    eax,0x1
  4020a3:	c9                   	leave  
  4020a4:	c3                   	ret    
  4020a5:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  4020aa:	85 c0                	test   eax,eax
  4020ac:	75 5a                	jne    402108 <___mingw_TLScallback+0x88>
  4020ae:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  4020b3:	83 f8 01             	cmp    eax,0x1
  4020b6:	75 e6                	jne    40209e <___mingw_TLScallback+0x1e>
  4020b8:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  4020bf:	c7 05 48 d0 40 00 00 	mov    DWORD PTR ds:0x40d048,0x0
  4020c6:	00 00 00 
  4020c9:	e8 a2 61 00 00       	call   408270 <_DeleteCriticalSection@4>
  4020ce:	83 ec 04             	sub    esp,0x4
  4020d1:	eb cb                	jmp    40209e <___mingw_TLScallback+0x1e>
  4020d3:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  4020d8:	85 c0                	test   eax,eax
  4020da:	74 14                	je     4020f0 <___mingw_TLScallback+0x70>
  4020dc:	c7 05 48 d0 40 00 01 	mov    DWORD PTR ds:0x40d048,0x1
  4020e3:	00 00 00 
  4020e6:	b8 01 00 00 00       	mov    eax,0x1
  4020eb:	c9                   	leave  
  4020ec:	c3                   	ret    
  4020ed:	8d 76 00             	lea    esi,[esi+0x0]
  4020f0:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  4020f7:	e8 7c 61 00 00       	call   408278 <_InitializeCriticalSection@4>
  4020fc:	83 ec 04             	sub    esp,0x4
  4020ff:	eb db                	jmp    4020dc <___mingw_TLScallback+0x5c>
  402101:	e8 da fd ff ff       	call   401ee0 <___mingwthr_run_key_dtors.part.0>
  402106:	eb 96                	jmp    40209e <___mingw_TLScallback+0x1e>
  402108:	90                   	nop
  402109:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402110:	e8 cb fd ff ff       	call   401ee0 <___mingwthr_run_key_dtors.part.0>
  402115:	eb 97                	jmp    4020ae <___mingw_TLScallback+0x2e>
  402117:	90                   	nop
  402118:	90                   	nop
  402119:	90                   	nop
  40211a:	90                   	nop
  40211b:	90                   	nop
  40211c:	90                   	nop
  40211d:	90                   	nop
  40211e:	90                   	nop
  40211f:	90                   	nop

00402120 <___chkstk_ms>:
  402120:	51                   	push   ecx
  402121:	50                   	push   eax
  402122:	3d 00 10 00 00       	cmp    eax,0x1000
  402127:	8d 4c 24 0c          	lea    ecx,[esp+0xc]
  40212b:	72 15                	jb     402142 <___chkstk_ms+0x22>
  40212d:	81 e9 00 10 00 00    	sub    ecx,0x1000
  402133:	83 09 00             	or     DWORD PTR [ecx],0x0
  402136:	2d 00 10 00 00       	sub    eax,0x1000
  40213b:	3d 00 10 00 00       	cmp    eax,0x1000
  402140:	77 eb                	ja     40212d <___chkstk_ms+0xd>
  402142:	29 c1                	sub    ecx,eax
  402144:	83 09 00             	or     DWORD PTR [ecx],0x0
  402147:	58                   	pop    eax
  402148:	59                   	pop    ecx
  402149:	c3                   	ret    
  40214a:	90                   	nop
  40214b:	90                   	nop

0040214c <.text>:
  40214c:	66 90                	xchg   ax,ax
  40214e:	66 90                	xchg   ax,ax

00402150 <_is_glob_pattern>:
  402150:	57                   	push   edi
  402151:	85 c0                	test   eax,eax
  402153:	56                   	push   esi
  402154:	53                   	push   ebx
  402155:	89 c3                	mov    ebx,eax
  402157:	74 44                	je     40219d <_is_glob_pattern+0x4d>
  402159:	0f be 0b             	movsx  ecx,BYTE PTR [ebx]
  40215c:	89 d6                	mov    esi,edx
  40215e:	31 c0                	xor    eax,eax
  402160:	83 e6 20             	and    esi,0x20
  402163:	8d 53 01             	lea    edx,[ebx+0x1]
  402166:	85 c9                	test   ecx,ecx
  402168:	74 33                	je     40219d <_is_glob_pattern+0x4d>
  40216a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402170:	85 f6                	test   esi,esi
  402172:	89 f7                	mov    edi,esi
  402174:	75 05                	jne    40217b <_is_glob_pattern+0x2b>
  402176:	83 f9 7f             	cmp    ecx,0x7f
  402179:	74 45                	je     4021c0 <_is_glob_pattern+0x70>
  40217b:	85 c0                	test   eax,eax
  40217d:	75 26                	jne    4021a5 <_is_glob_pattern+0x55>
  40217f:	83 f9 3f             	cmp    ecx,0x3f
  402182:	74 51                	je     4021d5 <_is_glob_pattern+0x85>
  402184:	83 f9 2a             	cmp    ecx,0x2a
  402187:	74 4c                	je     4021d5 <_is_glob_pattern+0x85>
  402189:	31 c0                	xor    eax,eax
  40218b:	83 f9 5b             	cmp    ecx,0x5b
  40218e:	0f 94 c0             	sete   al
  402191:	89 d3                	mov    ebx,edx
  402193:	0f be 0b             	movsx  ecx,BYTE PTR [ebx]
  402196:	8d 53 01             	lea    edx,[ebx+0x1]
  402199:	85 c9                	test   ecx,ecx
  40219b:	75 d3                	jne    402170 <_is_glob_pattern+0x20>
  40219d:	31 ff                	xor    edi,edi
  40219f:	89 f8                	mov    eax,edi
  4021a1:	5b                   	pop    ebx
  4021a2:	5e                   	pop    esi
  4021a3:	5f                   	pop    edi
  4021a4:	c3                   	ret    
  4021a5:	83 f9 5d             	cmp    ecx,0x5d
  4021a8:	74 26                	je     4021d0 <_is_glob_pattern+0x80>
  4021aa:	83 f9 21             	cmp    ecx,0x21
  4021ad:	89 d3                	mov    ebx,edx
  4021af:	0f 95 c1             	setne  cl
  4021b2:	0f b6 c9             	movzx  ecx,cl
  4021b5:	01 c8                	add    eax,ecx
  4021b7:	eb da                	jmp    402193 <_is_glob_pattern+0x43>
  4021b9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4021c0:	80 7b 01 00          	cmp    BYTE PTR [ebx+0x1],0x0
  4021c4:	8d 53 02             	lea    edx,[ebx+0x2]
  4021c7:	75 b2                	jne    40217b <_is_glob_pattern+0x2b>
  4021c9:	eb d4                	jmp    40219f <_is_glob_pattern+0x4f>
  4021cb:	90                   	nop
  4021cc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4021d0:	83 f8 01             	cmp    eax,0x1
  4021d3:	7e d5                	jle    4021aa <_is_glob_pattern+0x5a>
  4021d5:	bf 01 00 00 00       	mov    edi,0x1
  4021da:	89 f8                	mov    eax,edi
  4021dc:	5b                   	pop    ebx
  4021dd:	5e                   	pop    esi
  4021de:	5f                   	pop    edi
  4021df:	c3                   	ret    

004021e0 <_glob_in_set>:
  4021e0:	55                   	push   ebp
  4021e1:	57                   	push   edi
  4021e2:	56                   	push   esi
  4021e3:	53                   	push   ebx
  4021e4:	83 ec 04             	sub    esp,0x4
  4021e7:	0f b6 18             	movzx  ebx,BYTE PTR [eax]
  4021ea:	89 0c 24             	mov    DWORD PTR [esp],ecx
  4021ed:	0f be fb             	movsx  edi,bl
  4021f0:	83 ff 5d             	cmp    edi,0x5d
  4021f3:	0f 84 d7 00 00 00    	je     4022d0 <_glob_in_set+0xf0>
  4021f9:	83 ff 2d             	cmp    edi,0x2d
  4021fc:	89 d9                	mov    ecx,ebx
  4021fe:	75 2e                	jne    40222e <_glob_in_set+0x4e>
  402200:	e9 cb 00 00 00       	jmp    4022d0 <_glob_in_set+0xf0>
  402205:	85 db                	test   ebx,ebx
  402207:	0f 84 b3 00 00 00    	je     4022c0 <_glob_in_set+0xe0>
  40220d:	83 fb 5c             	cmp    ebx,0x5c
  402210:	0f 84 aa 00 00 00    	je     4022c0 <_glob_in_set+0xe0>
  402216:	83 fb 2f             	cmp    ebx,0x2f
  402219:	0f 84 a1 00 00 00    	je     4022c0 <_glob_in_set+0xe0>
  40221f:	89 df                	mov    edi,ebx
  402221:	0f b6 0e             	movzx  ecx,BYTE PTR [esi]
  402224:	89 f0                	mov    eax,esi
  402226:	39 d7                	cmp    edi,edx
  402228:	0f 84 ca 00 00 00    	je     4022f8 <_glob_in_set+0x118>
  40222e:	0f be d9             	movsx  ebx,cl
  402231:	83 fb 5d             	cmp    ebx,0x5d
  402234:	8d 70 01             	lea    esi,[eax+0x1]
  402237:	0f 84 83 00 00 00    	je     4022c0 <_glob_in_set+0xe0>
  40223d:	83 fb 2d             	cmp    ebx,0x2d
  402240:	75 c3                	jne    402205 <_glob_in_set+0x25>
  402242:	0f b6 58 01          	movzx  ebx,BYTE PTR [eax+0x1]
  402246:	80 fb 5d             	cmp    bl,0x5d
  402249:	0f 84 95 00 00 00    	je     4022e4 <_glob_in_set+0x104>
  40224f:	0f be eb             	movsx  ebp,bl
  402252:	85 ed                	test   ebp,ebp
  402254:	89 eb                	mov    ebx,ebp
  402256:	74 68                	je     4022c0 <_glob_in_set+0xe0>
  402258:	39 ef                	cmp    edi,ebp
  40225a:	8d 70 02             	lea    esi,[eax+0x2]
  40225d:	0f 8d 85 01 00 00    	jge    4023e8 <_glob_in_set+0x208>
  402263:	39 d7                	cmp    edi,edx
  402265:	8d 47 01             	lea    eax,[edi+0x1]
  402268:	75 14                	jne    40227e <_glob_in_set+0x9e>
  40226a:	e9 c1 00 00 00       	jmp    402330 <_glob_in_set+0x150>
  40226f:	90                   	nop
  402270:	83 c0 01             	add    eax,0x1
  402273:	8d 78 ff             	lea    edi,[eax-0x1]
  402276:	39 fa                	cmp    edx,edi
  402278:	0f 84 b2 00 00 00    	je     402330 <_glob_in_set+0x150>
  40227e:	39 c5                	cmp    ebp,eax
  402280:	7f ee                	jg     402270 <_glob_in_set+0x90>
  402282:	39 c5                	cmp    ebp,eax
  402284:	7d 87                	jge    40220d <_glob_in_set+0x2d>
  402286:	39 c2                	cmp    edx,eax
  402288:	74 15                	je     40229f <_glob_in_set+0xbf>
  40228a:	83 c5 01             	add    ebp,0x1
  40228d:	8d 76 00             	lea    esi,[esi+0x0]
  402290:	39 e8                	cmp    eax,ebp
  402292:	0f 84 75 ff ff ff    	je     40220d <_glob_in_set+0x2d>
  402298:	83 e8 01             	sub    eax,0x1
  40229b:	39 c2                	cmp    edx,eax
  40229d:	75 f1                	jne    402290 <_glob_in_set+0xb0>
  40229f:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
  4022a2:	83 e1 20             	and    ecx,0x20
  4022a5:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  4022a8:	3c 5d                	cmp    al,0x5d
  4022aa:	0f 84 a3 00 00 00    	je     402353 <_glob_in_set+0x173>
  4022b0:	3c 7f                	cmp    al,0x7f
  4022b2:	0f 84 bd 00 00 00    	je     402375 <_glob_in_set+0x195>
  4022b8:	83 c6 01             	add    esi,0x1
  4022bb:	84 c0                	test   al,al
  4022bd:	75 e6                	jne    4022a5 <_glob_in_set+0xc5>
  4022bf:	90                   	nop
  4022c0:	83 c4 04             	add    esp,0x4
  4022c3:	31 c0                	xor    eax,eax
  4022c5:	5b                   	pop    ebx
  4022c6:	5e                   	pop    esi
  4022c7:	5f                   	pop    edi
  4022c8:	5d                   	pop    ebp
  4022c9:	c3                   	ret    
  4022ca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4022d0:	39 d7                	cmp    edi,edx
  4022d2:	0f 84 b8 00 00 00    	je     402390 <_glob_in_set+0x1b0>
  4022d8:	0f b6 48 01          	movzx  ecx,BYTE PTR [eax+0x1]
  4022dc:	83 c0 01             	add    eax,0x1
  4022df:	e9 4a ff ff ff       	jmp    40222e <_glob_in_set+0x4e>
  4022e4:	bf 2d 00 00 00       	mov    edi,0x2d
  4022e9:	89 f0                	mov    eax,esi
  4022eb:	39 d7                	cmp    edi,edx
  4022ed:	b9 5d 00 00 00       	mov    ecx,0x5d
  4022f2:	0f 85 36 ff ff ff    	jne    40222e <_glob_in_set+0x4e>
  4022f8:	8b 14 24             	mov    edx,DWORD PTR [esp]
  4022fb:	83 e2 20             	and    edx,0x20
  4022fe:	eb 0a                	jmp    40230a <_glob_in_set+0x12a>
  402300:	83 c0 01             	add    eax,0x1
  402303:	84 c9                	test   cl,cl
  402305:	74 b9                	je     4022c0 <_glob_in_set+0xe0>
  402307:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
  40230a:	80 f9 5d             	cmp    cl,0x5d
  40230d:	0f 84 c2 00 00 00    	je     4023d5 <_glob_in_set+0x1f5>
  402313:	80 f9 7f             	cmp    cl,0x7f
  402316:	75 e8                	jne    402300 <_glob_in_set+0x120>
  402318:	85 d2                	test   edx,edx
  40231a:	0f 85 c0 00 00 00    	jne    4023e0 <_glob_in_set+0x200>
  402320:	0f b6 48 01          	movzx  ecx,BYTE PTR [eax+0x1]
  402324:	83 c0 01             	add    eax,0x1
  402327:	eb d7                	jmp    402300 <_glob_in_set+0x120>
  402329:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402330:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
  402333:	83 e1 20             	and    ecx,0x20
  402336:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  402339:	3c 5d                	cmp    al,0x5d
  40233b:	74 16                	je     402353 <_glob_in_set+0x173>
  40233d:	3c 7f                	cmp    al,0x7f
  40233f:	74 1f                	je     402360 <_glob_in_set+0x180>
  402341:	83 c6 01             	add    esi,0x1
  402344:	84 c0                	test   al,al
  402346:	0f 84 74 ff ff ff    	je     4022c0 <_glob_in_set+0xe0>
  40234c:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  40234f:	3c 5d                	cmp    al,0x5d
  402351:	75 ea                	jne    40233d <_glob_in_set+0x15d>
  402353:	83 c4 04             	add    esp,0x4
  402356:	5b                   	pop    ebx
  402357:	8d 46 01             	lea    eax,[esi+0x1]
  40235a:	5e                   	pop    esi
  40235b:	5f                   	pop    edi
  40235c:	5d                   	pop    ebp
  40235d:	c3                   	ret    
  40235e:	66 90                	xchg   ax,ax
  402360:	85 c9                	test   ecx,ecx
  402362:	75 0c                	jne    402370 <_glob_in_set+0x190>
  402364:	0f b6 46 01          	movzx  eax,BYTE PTR [esi+0x1]
  402368:	83 c6 01             	add    esi,0x1
  40236b:	eb d4                	jmp    402341 <_glob_in_set+0x161>
  40236d:	8d 76 00             	lea    esi,[esi+0x0]
  402370:	83 c6 01             	add    esi,0x1
  402373:	eb c1                	jmp    402336 <_glob_in_set+0x156>
  402375:	85 c9                	test   ecx,ecx
  402377:	75 0c                	jne    402385 <_glob_in_set+0x1a5>
  402379:	0f b6 46 01          	movzx  eax,BYTE PTR [esi+0x1]
  40237d:	83 c6 01             	add    esi,0x1
  402380:	e9 33 ff ff ff       	jmp    4022b8 <_glob_in_set+0xd8>
  402385:	83 c6 01             	add    esi,0x1
  402388:	e9 18 ff ff ff       	jmp    4022a5 <_glob_in_set+0xc5>
  40238d:	8d 76 00             	lea    esi,[esi+0x0]
  402390:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
  402393:	83 c0 01             	add    eax,0x1
  402396:	83 e1 20             	and    ecx,0x20
  402399:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4023a0:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  4023a3:	80 fa 5d             	cmp    dl,0x5d
  4023a6:	74 2d                	je     4023d5 <_glob_in_set+0x1f5>
  4023a8:	80 fa 7f             	cmp    dl,0x7f
  4023ab:	74 13                	je     4023c0 <_glob_in_set+0x1e0>
  4023ad:	83 c0 01             	add    eax,0x1
  4023b0:	84 d2                	test   dl,dl
  4023b2:	75 ec                	jne    4023a0 <_glob_in_set+0x1c0>
  4023b4:	e9 07 ff ff ff       	jmp    4022c0 <_glob_in_set+0xe0>
  4023b9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4023c0:	85 c9                	test   ecx,ecx
  4023c2:	75 0c                	jne    4023d0 <_glob_in_set+0x1f0>
  4023c4:	0f b6 50 01          	movzx  edx,BYTE PTR [eax+0x1]
  4023c8:	83 c0 01             	add    eax,0x1
  4023cb:	eb e0                	jmp    4023ad <_glob_in_set+0x1cd>
  4023cd:	8d 76 00             	lea    esi,[esi+0x0]
  4023d0:	83 c0 01             	add    eax,0x1
  4023d3:	eb cb                	jmp    4023a0 <_glob_in_set+0x1c0>
  4023d5:	83 c4 04             	add    esp,0x4
  4023d8:	83 c0 01             	add    eax,0x1
  4023db:	5b                   	pop    ebx
  4023dc:	5e                   	pop    esi
  4023dd:	5f                   	pop    edi
  4023de:	5d                   	pop    ebp
  4023df:	c3                   	ret    
  4023e0:	83 c0 01             	add    eax,0x1
  4023e3:	e9 1f ff ff ff       	jmp    402307 <_glob_in_set+0x127>
  4023e8:	89 f8                	mov    eax,edi
  4023ea:	e9 93 fe ff ff       	jmp    402282 <_glob_in_set+0xa2>
  4023ef:	90                   	nop

004023f0 <_glob_initialise>:
  4023f0:	55                   	push   ebp
  4023f1:	57                   	push   edi
  4023f2:	56                   	push   esi
  4023f3:	89 c6                	mov    esi,eax
  4023f5:	53                   	push   ebx
  4023f6:	83 ec 1c             	sub    esp,0x1c
  4023f9:	85 c0                	test   eax,eax
  4023fb:	74 47                	je     402444 <_glob_initialise+0x54>
  4023fd:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  402400:	8d 78 01             	lea    edi,[eax+0x1]
  402403:	8d 2c bd 00 00 00 00 	lea    ebp,[edi*4+0x0]
  40240a:	89 2c 24             	mov    DWORD PTR [esp],ebp
  40240d:	e8 8e 5d 00 00       	call   4081a0 <_malloc>
  402412:	89 c3                	mov    ebx,eax
  402414:	85 db                	test   ebx,ebx
  402416:	89 46 08             	mov    DWORD PTR [esi+0x8],eax
  402419:	b8 03 00 00 00       	mov    eax,0x3
  40241e:	74 26                	je     402446 <_glob_initialise+0x56>
  402420:	85 ff                	test   edi,edi
  402422:	89 fa                	mov    edx,edi
  402424:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
  40242b:	7e 17                	jle    402444 <_glob_initialise+0x54>
  40242d:	8d 4d fc             	lea    ecx,[ebp-0x4]
  402430:	eb 03                	jmp    402435 <_glob_initialise+0x45>
  402432:	8b 5e 08             	mov    ebx,DWORD PTR [esi+0x8]
  402435:	c7 04 0b 00 00 00 00 	mov    DWORD PTR [ebx+ecx*1],0x0
  40243c:	83 e9 04             	sub    ecx,0x4
  40243f:	83 ea 01             	sub    edx,0x1
  402442:	75 ee                	jne    402432 <_glob_initialise+0x42>
  402444:	31 c0                	xor    eax,eax
  402446:	83 c4 1c             	add    esp,0x1c
  402449:	5b                   	pop    ebx
  40244a:	5e                   	pop    esi
  40244b:	5f                   	pop    edi
  40244c:	5d                   	pop    ebp
  40244d:	c3                   	ret    
  40244e:	66 90                	xchg   ax,ax

00402450 <_glob_strcmp>:
  402450:	55                   	push   ebp
  402451:	57                   	push   edi
  402452:	89 c7                	mov    edi,eax
  402454:	56                   	push   esi
  402455:	53                   	push   ebx
  402456:	83 ec 2c             	sub    esp,0x2c
  402459:	80 3a 2e             	cmp    BYTE PTR [edx],0x2e
  40245c:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  402460:	0f 84 5a 01 00 00    	je     4025c0 <_glob_strcmp+0x170>
  402466:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
  402469:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
  40246d:	8d 6a 01             	lea    ebp,[edx+0x1]
  402470:	89 f0                	mov    eax,esi
  402472:	83 e0 20             	and    eax,0x20
  402475:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  402479:	89 f0                	mov    eax,esi
  40247b:	25 00 40 00 00       	and    eax,0x4000
  402480:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  402484:	0f be d1             	movsx  edx,cl
  402487:	85 d2                	test   edx,edx
  402489:	8d 75 ff             	lea    esi,[ebp-0x1]
  40248c:	8d 47 01             	lea    eax,[edi+0x1]
  40248f:	0f 84 70 01 00 00    	je     402605 <_glob_strcmp+0x1b5>
  402495:	80 f9 3f             	cmp    cl,0x3f
  402498:	0f 84 e4 00 00 00    	je     402582 <_glob_strcmp+0x132>
  40249e:	80 f9 5b             	cmp    cl,0x5b
  4024a1:	0f 84 ab 00 00 00    	je     402552 <_glob_strcmp+0x102>
  4024a7:	80 f9 2a             	cmp    cl,0x2a
  4024aa:	74 5c                	je     402508 <_glob_strcmp+0xb8>
  4024ac:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
  4024b0:	85 c9                	test   ecx,ecx
  4024b2:	0f 84 d8 00 00 00    	je     402590 <_glob_strcmp+0x140>
  4024b8:	89 c7                	mov    edi,eax
  4024ba:	0f be 5d ff          	movsx  ebx,BYTE PTR [ebp-0x1]
  4024be:	84 db                	test   bl,bl
  4024c0:	0f 84 92 01 00 00    	je     402658 <_glob_strcmp+0x208>
  4024c6:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  4024ca:	85 c0                	test   eax,eax
  4024cc:	0f 85 de 00 00 00    	jne    4025b0 <_glob_strcmp+0x160>
  4024d2:	89 14 24             	mov    DWORD PTR [esp],edx
  4024d5:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  4024d9:	e8 ca 5c 00 00       	call   4081a8 <_tolower>
  4024de:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4024e1:	89 c6                	mov    esi,eax
  4024e3:	e8 c0 5c 00 00       	call   4081a8 <_tolower>
  4024e8:	8b 54 24 1c          	mov    edx,DWORD PTR [esp+0x1c]
  4024ec:	29 c6                	sub    esi,eax
  4024ee:	85 f6                	test   esi,esi
  4024f0:	0f 84 81 00 00 00    	je     402577 <_glob_strcmp+0x127>
  4024f6:	89 d0                	mov    eax,edx
  4024f8:	29 d8                	sub    eax,ebx
  4024fa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402500:	83 c4 2c             	add    esp,0x2c
  402503:	5b                   	pop    ebx
  402504:	5e                   	pop    esi
  402505:	5f                   	pop    edi
  402506:	5d                   	pop    ebp
  402507:	c3                   	ret    
  402508:	0f b6 57 01          	movzx  edx,BYTE PTR [edi+0x1]
  40250c:	89 c3                	mov    ebx,eax
  40250e:	80 fa 2a             	cmp    dl,0x2a
  402511:	75 0b                	jne    40251e <_glob_strcmp+0xce>
  402513:	83 c3 01             	add    ebx,0x1
  402516:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
  402519:	80 fa 2a             	cmp    dl,0x2a
  40251c:	74 f5                	je     402513 <_glob_strcmp+0xc3>
  40251e:	31 c0                	xor    eax,eax
  402520:	84 d2                	test   dl,dl
  402522:	74 dc                	je     402500 <_glob_strcmp+0xb0>
  402524:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
  402528:	81 cf 00 00 01 00    	or     edi,0x10000
  40252e:	eb 09                	jmp    402539 <_glob_strcmp+0xe9>
  402530:	83 c6 01             	add    esi,0x1
  402533:	80 7e ff 00          	cmp    BYTE PTR [esi-0x1],0x0
  402537:	74 c7                	je     402500 <_glob_strcmp+0xb0>
  402539:	89 f9                	mov    ecx,edi
  40253b:	89 f2                	mov    edx,esi
  40253d:	89 d8                	mov    eax,ebx
  40253f:	e8 0c ff ff ff       	call   402450 <_glob_strcmp>
  402544:	85 c0                	test   eax,eax
  402546:	75 e8                	jne    402530 <_glob_strcmp+0xe0>
  402548:	83 c4 2c             	add    esp,0x2c
  40254b:	31 c0                	xor    eax,eax
  40254d:	5b                   	pop    ebx
  40254e:	5e                   	pop    esi
  40254f:	5f                   	pop    edi
  402550:	5d                   	pop    ebp
  402551:	c3                   	ret    
  402552:	0f be 55 ff          	movsx  edx,BYTE PTR [ebp-0x1]
  402556:	85 d2                	test   edx,edx
  402558:	0f 84 0b 01 00 00    	je     402669 <_glob_strcmp+0x219>
  40255e:	80 7f 01 21          	cmp    BYTE PTR [edi+0x1],0x21
  402562:	74 7c                	je     4025e0 <_glob_strcmp+0x190>
  402564:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
  402568:	e8 73 fc ff ff       	call   4021e0 <_glob_in_set>
  40256d:	85 c0                	test   eax,eax
  40256f:	89 c7                	mov    edi,eax
  402571:	0f 84 d7 00 00 00    	je     40264e <_glob_strcmp+0x1fe>
  402577:	0f b6 0f             	movzx  ecx,BYTE PTR [edi]
  40257a:	83 c5 01             	add    ebp,0x1
  40257d:	e9 02 ff ff ff       	jmp    402484 <_glob_strcmp+0x34>
  402582:	80 7d ff 00          	cmp    BYTE PTR [ebp-0x1],0x0
  402586:	0f 84 d3 00 00 00    	je     40265f <_glob_strcmp+0x20f>
  40258c:	89 c7                	mov    edi,eax
  40258e:	eb e7                	jmp    402577 <_glob_strcmp+0x127>
  402590:	83 fa 7f             	cmp    edx,0x7f
  402593:	0f 85 1f ff ff ff    	jne    4024b8 <_glob_strcmp+0x68>
  402599:	0f be 57 01          	movsx  edx,BYTE PTR [edi+0x1]
  40259d:	83 c7 02             	add    edi,0x2
  4025a0:	85 d2                	test   edx,edx
  4025a2:	0f 85 12 ff ff ff    	jne    4024ba <_glob_strcmp+0x6a>
  4025a8:	e9 0b ff ff ff       	jmp    4024b8 <_glob_strcmp+0x68>
  4025ad:	8d 76 00             	lea    esi,[esi+0x0]
  4025b0:	89 d6                	mov    esi,edx
  4025b2:	29 de                	sub    esi,ebx
  4025b4:	e9 35 ff ff ff       	jmp    4024ee <_glob_strcmp+0x9e>
  4025b9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4025c0:	0f be 00             	movsx  eax,BYTE PTR [eax]
  4025c3:	3c 2e                	cmp    al,0x2e
  4025c5:	74 32                	je     4025f9 <_glob_strcmp+0x1a9>
  4025c7:	89 c1                	mov    ecx,eax
  4025c9:	83 e8 2e             	sub    eax,0x2e
  4025cc:	f7 44 24 10 00 00 01 	test   DWORD PTR [esp+0x10],0x10000
  4025d3:	00 
  4025d4:	0f 85 8f fe ff ff    	jne    402469 <_glob_strcmp+0x19>
  4025da:	e9 21 ff ff ff       	jmp    402500 <_glob_strcmp+0xb0>
  4025df:	90                   	nop
  4025e0:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
  4025e4:	8d 5f 02             	lea    ebx,[edi+0x2]
  4025e7:	89 d8                	mov    eax,ebx
  4025e9:	e8 f2 fb ff ff       	call   4021e0 <_glob_in_set>
  4025ee:	85 c0                	test   eax,eax
  4025f0:	74 1d                	je     40260f <_glob_strcmp+0x1bf>
  4025f2:	89 df                	mov    edi,ebx
  4025f4:	e9 7e ff ff ff       	jmp    402577 <_glob_strcmp+0x127>
  4025f9:	b9 2e 00 00 00       	mov    ecx,0x2e
  4025fe:	66 90                	xchg   ax,ax
  402600:	e9 64 fe ff ff       	jmp    402469 <_glob_strcmp+0x19>
  402605:	0f be 06             	movsx  eax,BYTE PTR [esi]
  402608:	f7 d8                	neg    eax
  40260a:	e9 f1 fe ff ff       	jmp    402500 <_glob_strcmp+0xb0>
  40260f:	0f b6 47 02          	movzx  eax,BYTE PTR [edi+0x2]
  402613:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  402617:	3c 5d                	cmp    al,0x5d
  402619:	75 0f                	jne    40262a <_glob_strcmp+0x1da>
  40261b:	eb 56                	jmp    402673 <_glob_strcmp+0x223>
  40261d:	8d 76 00             	lea    esi,[esi+0x0]
  402620:	83 c3 01             	add    ebx,0x1
  402623:	84 c0                	test   al,al
  402625:	74 27                	je     40264e <_glob_strcmp+0x1fe>
  402627:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  40262a:	3c 5d                	cmp    al,0x5d
  40262c:	74 16                	je     402644 <_glob_strcmp+0x1f4>
  40262e:	3c 7f                	cmp    al,0x7f
  402630:	75 ee                	jne    402620 <_glob_strcmp+0x1d0>
  402632:	85 d2                	test   edx,edx
  402634:	75 09                	jne    40263f <_glob_strcmp+0x1ef>
  402636:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  40263a:	83 c3 01             	add    ebx,0x1
  40263d:	eb e1                	jmp    402620 <_glob_strcmp+0x1d0>
  40263f:	83 c3 01             	add    ebx,0x1
  402642:	eb e3                	jmp    402627 <_glob_strcmp+0x1d7>
  402644:	83 c3 01             	add    ebx,0x1
  402647:	89 df                	mov    edi,ebx
  402649:	e9 29 ff ff ff       	jmp    402577 <_glob_strcmp+0x127>
  40264e:	b8 5d 00 00 00       	mov    eax,0x5d
  402653:	e9 a8 fe ff ff       	jmp    402500 <_glob_strcmp+0xb0>
  402658:	31 db                	xor    ebx,ebx
  40265a:	e9 97 fe ff ff       	jmp    4024f6 <_glob_strcmp+0xa6>
  40265f:	b8 3f 00 00 00       	mov    eax,0x3f
  402664:	e9 97 fe ff ff       	jmp    402500 <_glob_strcmp+0xb0>
  402669:	b8 5b 00 00 00       	mov    eax,0x5b
  40266e:	e9 8d fe ff ff       	jmp    402500 <_glob_strcmp+0xb0>
  402673:	8d 5f 03             	lea    ebx,[edi+0x3]
  402676:	0f b6 47 03          	movzx  eax,BYTE PTR [edi+0x3]
  40267a:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  40267e:	eb aa                	jmp    40262a <_glob_strcmp+0x1da>

00402680 <_glob_registry.part.1>:
  402680:	57                   	push   edi
  402681:	89 c7                	mov    edi,eax
  402683:	56                   	push   esi
  402684:	53                   	push   ebx
  402685:	83 ec 10             	sub    esp,0x10
  402688:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40268b:	8b 4f 0c             	mov    ecx,DWORD PTR [edi+0xc]
  40268e:	85 c0                	test   eax,eax
  402690:	8d 70 ff             	lea    esi,[eax-0x1]
  402693:	8d 1c 8d 00 00 00 00 	lea    ebx,[ecx*4+0x0]
  40269a:	7e 1d                	jle    4026b9 <_glob_registry.part.1+0x39>
  40269c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4026a0:	8b 57 08             	mov    edx,DWORD PTR [edi+0x8]
  4026a3:	83 ee 01             	sub    esi,0x1
  4026a6:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  4026a9:	83 c3 04             	add    ebx,0x4
  4026ac:	89 14 24             	mov    DWORD PTR [esp],edx
  4026af:	e8 e4 5a 00 00       	call   408198 <_free>
  4026b4:	83 fe ff             	cmp    esi,0xffffffff
  4026b7:	75 e7                	jne    4026a0 <_glob_registry.part.1+0x20>
  4026b9:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  4026bc:	89 04 24             	mov    DWORD PTR [esp],eax
  4026bf:	e8 d4 5a 00 00       	call   408198 <_free>
  4026c4:	83 c4 10             	add    esp,0x10
  4026c7:	31 c0                	xor    eax,eax
  4026c9:	5b                   	pop    ebx
  4026ca:	5e                   	pop    esi
  4026cb:	5f                   	pop    edi
  4026cc:	c3                   	ret    
  4026cd:	8d 76 00             	lea    esi,[esi+0x0]

004026d0 <_glob_store_entry.part.2>:
  4026d0:	57                   	push   edi
  4026d1:	56                   	push   esi
  4026d2:	89 c6                	mov    esi,eax
  4026d4:	53                   	push   ebx
  4026d5:	89 d3                	mov    ebx,edx
  4026d7:	83 ec 10             	sub    esp,0x10
  4026da:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
  4026dd:	03 53 0c             	add    edx,DWORD PTR [ebx+0xc]
  4026e0:	8d 04 95 08 00 00 00 	lea    eax,[edx*4+0x8]
  4026e7:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4026eb:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4026ee:	89 04 24             	mov    DWORD PTR [esp],eax
  4026f1:	e8 ba 5a 00 00       	call   4081b0 <_realloc>
  4026f6:	85 c0                	test   eax,eax
  4026f8:	89 c2                	mov    edx,eax
  4026fa:	74 29                	je     402725 <_glob_store_entry.part.2+0x55>
  4026fc:	8b 7b 04             	mov    edi,DWORD PTR [ebx+0x4]
  4026ff:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  402702:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
  402705:	8d 4f 01             	lea    ecx,[edi+0x1]
  402708:	01 c7                	add    edi,eax
  40270a:	01 c8                	add    eax,ecx
  40270c:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  40270f:	89 34 ba             	mov    DWORD PTR [edx+edi*4],esi
  402712:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  402715:	c7 04 82 00 00 00 00 	mov    DWORD PTR [edx+eax*4],0x0
  40271c:	83 c4 10             	add    esp,0x10
  40271f:	31 c0                	xor    eax,eax
  402721:	5b                   	pop    ebx
  402722:	5e                   	pop    esi
  402723:	5f                   	pop    edi
  402724:	c3                   	ret    
  402725:	83 c4 10             	add    esp,0x10
  402728:	b8 01 00 00 00       	mov    eax,0x1
  40272d:	5b                   	pop    ebx
  40272e:	5e                   	pop    esi
  40272f:	5f                   	pop    edi
  402730:	c3                   	ret    
  402731:	eb 0d                	jmp    402740 <_glob_store_entry>
  402733:	90                   	nop
  402734:	90                   	nop
  402735:	90                   	nop
  402736:	90                   	nop
  402737:	90                   	nop
  402738:	90                   	nop
  402739:	90                   	nop
  40273a:	90                   	nop
  40273b:	90                   	nop
  40273c:	90                   	nop
  40273d:	90                   	nop
  40273e:	90                   	nop
  40273f:	90                   	nop

00402740 <_glob_store_entry>:
  402740:	85 c0                	test   eax,eax
  402742:	75 0c                	jne    402750 <_glob_store_entry+0x10>
  402744:	b8 01 00 00 00       	mov    eax,0x1
  402749:	c3                   	ret    
  40274a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402750:	85 d2                	test   edx,edx
  402752:	74 f0                	je     402744 <_glob_store_entry+0x4>
  402754:	e9 77 ff ff ff       	jmp    4026d0 <_glob_store_entry.part.2>
  402759:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00402760 <_glob_store_collated_entries>:
  402760:	56                   	push   esi
  402761:	89 d6                	mov    esi,edx
  402763:	53                   	push   ebx
  402764:	89 c3                	mov    ebx,eax
  402766:	83 ec 14             	sub    esp,0x14
  402769:	8b 00                	mov    eax,DWORD PTR [eax]
  40276b:	85 c0                	test   eax,eax
  40276d:	74 05                	je     402774 <_glob_store_collated_entries+0x14>
  40276f:	e8 ec ff ff ff       	call   402760 <_glob_store_collated_entries>
  402774:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  402777:	89 f2                	mov    edx,esi
  402779:	e8 c2 ff ff ff       	call   402740 <_glob_store_entry>
  40277e:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  402781:	85 c0                	test   eax,eax
  402783:	74 07                	je     40278c <_glob_store_collated_entries+0x2c>
  402785:	89 f2                	mov    edx,esi
  402787:	e8 d4 ff ff ff       	call   402760 <_glob_store_collated_entries>
  40278c:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40278f:	e8 04 5a 00 00       	call   408198 <_free>
  402794:	83 c4 14             	add    esp,0x14
  402797:	5b                   	pop    ebx
  402798:	5e                   	pop    esi
  402799:	c3                   	ret    
  40279a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

004027a0 <_glob_match>:
  4027a0:	55                   	push   ebp
  4027a1:	89 e5                	mov    ebp,esp
  4027a3:	57                   	push   edi
  4027a4:	56                   	push   esi
  4027a5:	53                   	push   ebx
  4027a6:	89 c3                	mov    ebx,eax
  4027a8:	83 ec 6c             	sub    esp,0x6c
  4027ab:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
  4027ae:	89 4d a4             	mov    DWORD PTR [ebp-0x5c],ecx
  4027b1:	89 04 24             	mov    DWORD PTR [esp],eax
  4027b4:	e8 a7 59 00 00       	call   408160 <_strlen>
  4027b9:	8d 50 01             	lea    edx,[eax+0x1]
  4027bc:	83 c0 10             	add    eax,0x10
  4027bf:	83 e0 f0             	and    eax,0xfffffff0
  4027c2:	e8 59 f9 ff ff       	call   402120 <___chkstk_ms>
  4027c7:	29 c4                	sub    esp,eax
  4027c9:	8d 44 24 0c          	lea    eax,[esp+0xc]
  4027cd:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  4027d1:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  4027d5:	89 04 24             	mov    DWORD PTR [esp],eax
  4027d8:	e8 ab 59 00 00       	call   408188 <_memcpy>
  4027dd:	89 04 24             	mov    DWORD PTR [esp],eax
  4027e0:	e8 4b 06 00 00       	call   402e30 <___mingw_dirname>
  4027e5:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  4027ec:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  4027ef:	8d 45 d8             	lea    eax,[ebp-0x28]
  4027f2:	e8 f9 fb ff ff       	call   4023f0 <_glob_initialise>
  4027f7:	85 c0                	test   eax,eax
  4027f9:	74 08                	je     402803 <_glob_match+0x63>
  4027fb:	8d 65 f4             	lea    esp,[ebp-0xc]
  4027fe:	5b                   	pop    ebx
  4027ff:	5e                   	pop    esi
  402800:	5f                   	pop    edi
  402801:	5d                   	pop    ebp
  402802:	c3                   	ret    
  402803:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  402806:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402809:	e8 42 f9 ff ff       	call   402150 <_is_glob_pattern>
  40280e:	85 c0                	test   eax,eax
  402810:	0f 84 5a 02 00 00    	je     402a70 <_glob_match+0x2d0>
  402816:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  402819:	8d 45 d8             	lea    eax,[ebp-0x28]
  40281c:	89 04 24             	mov    DWORD PTR [esp],eax
  40281f:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  402822:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402825:	80 ce 80             	or     dh,0x80
  402828:	e8 73 ff ff ff       	call   4027a0 <_glob_match>
  40282d:	85 c0                	test   eax,eax
  40282f:	75 ca                	jne    4027fb <_glob_match+0x5b>
  402831:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  402835:	3c 5c                	cmp    al,0x5c
  402837:	0f 84 5b 03 00 00    	je     402b98 <_glob_match+0x3f8>
  40283d:	3c 2f                	cmp    al,0x2f
  40283f:	0f 84 53 03 00 00    	je     402b98 <_glob_match+0x3f8>
  402845:	8b 75 b8             	mov    esi,DWORD PTR [ebp-0x48]
  402848:	bf 30 a1 40 00       	mov    edi,0x40a130
  40284d:	b9 02 00 00 00       	mov    ecx,0x2
  402852:	f3 a6                	repz cmps BYTE PTR ds:[esi],BYTE PTR es:[edi]
  402854:	0f 85 3e 03 00 00    	jne    402b98 <_glob_match+0x3f8>
  40285a:	c6 45 a3 5c          	mov    BYTE PTR [ebp-0x5d],0x5c
  40285e:	f6 45 cc 10          	test   BYTE PTR [ebp-0x34],0x10
  402862:	89 5d c0             	mov    DWORD PTR [ebp-0x40],ebx
  402865:	c7 45 b8 00 00 00 00 	mov    DWORD PTR [ebp-0x48],0x0
  40286c:	0f 85 33 04 00 00    	jne    402ca5 <_glob_match+0x505>
  402872:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402875:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  402878:	8b 00                	mov    eax,DWORD PTR [eax]
  40287a:	85 c0                	test   eax,eax
  40287c:	0f 84 71 04 00 00    	je     402cf3 <_glob_match+0x553>
  402882:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  402885:	c7 45 c4 02 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x2
  40288c:	89 cf                	mov    edi,ecx
  40288e:	83 e7 04             	and    edi,0x4
  402891:	89 7d 98             	mov    DWORD PTR [ebp-0x68],edi
  402894:	89 cf                	mov    edi,ecx
  402896:	81 e7 00 80 00 00    	and    edi,0x8000
  40289c:	89 7d d0             	mov    DWORD PTR [ebp-0x30],edi
  40289f:	90                   	nop
  4028a0:	83 7d c4 01          	cmp    DWORD PTR [ebp-0x3c],0x1
  4028a4:	0f 84 58 02 00 00    	je     402b02 <_glob_match+0x362>
  4028aa:	89 04 24             	mov    DWORD PTR [esp],eax
  4028ad:	e8 ee 0a 00 00       	call   4033a0 <___mingw_opendir>
  4028b2:	85 c0                	test   eax,eax
  4028b4:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  4028b7:	0f 84 76 03 00 00    	je     402c33 <_glob_match+0x493>
  4028bd:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  4028c0:	85 c0                	test   eax,eax
  4028c2:	0f 84 bd 03 00 00    	je     402c85 <_glob_match+0x4e5>
  4028c8:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  4028cb:	8b 00                	mov    eax,DWORD PTR [eax]
  4028cd:	89 04 24             	mov    DWORD PTR [esp],eax
  4028d0:	e8 8b 58 00 00       	call   408160 <_strlen>
  4028d5:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  4028d8:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  4028db:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
  4028e2:	83 e0 40             	and    eax,0x40
  4028e5:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  4028e8:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4028eb:	89 04 24             	mov    DWORD PTR [esp],eax
  4028ee:	e8 4d 0c 00 00       	call   403540 <___mingw_readdir>
  4028f3:	85 c0                	test   eax,eax
  4028f5:	89 c6                	mov    esi,eax
  4028f7:	0f 84 e8 01 00 00    	je     402ae5 <_glob_match+0x345>
  4028fd:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  402900:	85 c0                	test   eax,eax
  402902:	74 06                	je     40290a <_glob_match+0x16a>
  402904:	83 7e 08 10          	cmp    DWORD PTR [esi+0x8],0x10
  402908:	75 de                	jne    4028e8 <_glob_match+0x148>
  40290a:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  40290d:	8d 5e 0c             	lea    ebx,[esi+0xc]
  402910:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  402913:	89 da                	mov    edx,ebx
  402915:	e8 36 fb ff ff       	call   402450 <_glob_strcmp>
  40291a:	85 c0                	test   eax,eax
  40291c:	75 ca                	jne    4028e8 <_glob_match+0x148>
  40291e:	0f b7 56 06          	movzx  edx,WORD PTR [esi+0x6]
  402922:	8b 4d b4             	mov    ecx,DWORD PTR [ebp-0x4c]
  402925:	89 65 b0             	mov    DWORD PTR [ebp-0x50],esp
  402928:	8d 44 11 11          	lea    eax,[ecx+edx*1+0x11]
  40292c:	83 e0 f0             	and    eax,0xfffffff0
  40292f:	e8 ec f7 ff ff       	call   402120 <___chkstk_ms>
  402934:	29 c4                	sub    esp,eax
  402936:	31 c0                	xor    eax,eax
  402938:	8d 7c 24 0c          	lea    edi,[esp+0xc]
  40293c:	85 c9                	test   ecx,ecx
  40293e:	89 7d ac             	mov    DWORD PTR [ebp-0x54],edi
  402941:	0f 85 ed 01 00 00    	jne    402b34 <_glob_match+0x394>
  402947:	83 c2 01             	add    edx,0x1
  40294a:	01 f8                	add    eax,edi
  40294c:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  402950:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  402954:	89 e3                	mov    ebx,esp
  402956:	89 04 24             	mov    DWORD PTR [esp],eax
  402959:	e8 2a 58 00 00       	call   408188 <_memcpy>
  40295e:	89 3c 24             	mov    DWORD PTR [esp],edi
  402961:	e8 fa 57 00 00       	call   408160 <_strlen>
  402966:	83 c0 10             	add    eax,0x10
  402969:	83 e0 f0             	and    eax,0xfffffff0
  40296c:	e8 af f7 ff ff       	call   402120 <___chkstk_ms>
  402971:	8b 75 ac             	mov    esi,DWORD PTR [ebp-0x54]
  402974:	29 c4                	sub    esp,eax
  402976:	8d 4c 24 0c          	lea    ecx,[esp+0xc]
  40297a:	89 ca                	mov    edx,ecx
  40297c:	eb 0f                	jmp    40298d <_glob_match+0x1ed>
  40297e:	66 90                	xchg   ax,ax
  402980:	83 c2 01             	add    edx,0x1
  402983:	83 c6 01             	add    esi,0x1
  402986:	84 c0                	test   al,al
  402988:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  40298b:	74 1b                	je     4029a8 <_glob_match+0x208>
  40298d:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  402990:	3c 7f                	cmp    al,0x7f
  402992:	75 ec                	jne    402980 <_glob_match+0x1e0>
  402994:	0f b6 46 01          	movzx  eax,BYTE PTR [esi+0x1]
  402998:	83 c6 01             	add    esi,0x1
  40299b:	83 c2 01             	add    edx,0x1
  40299e:	83 c6 01             	add    esi,0x1
  4029a1:	84 c0                	test   al,al
  4029a3:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  4029a6:	75 e5                	jne    40298d <_glob_match+0x1ed>
  4029a8:	89 0c 24             	mov    DWORD PTR [esp],ecx
  4029ab:	e8 70 5b 00 00       	call   408520 <_strdup>
  4029b0:	89 dc                	mov    esp,ebx
  4029b2:	85 c0                	test   eax,eax
  4029b4:	89 c6                	mov    esi,eax
  4029b6:	0f 84 c6 01 00 00    	je     402b82 <_glob_match+0x3e2>
  4029bc:	31 c0                	xor    eax,eax
  4029be:	83 7d c4 02          	cmp    DWORD PTR [ebp-0x3c],0x2
  4029c2:	0f 94 c0             	sete   al
  4029c5:	83 e8 01             	sub    eax,0x1
  4029c8:	21 45 c4             	and    DWORD PTR [ebp-0x3c],eax
  4029cb:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  4029ce:	85 c0                	test   eax,eax
  4029d0:	0f 85 9d 01 00 00    	jne    402b73 <_glob_match+0x3d3>
  4029d6:	8b 5d bc             	mov    ebx,DWORD PTR [ebp-0x44]
  4029d9:	85 db                	test   ebx,ebx
  4029db:	0f 84 bb 02 00 00    	je     402c9c <_glob_match+0x4fc>
  4029e1:	8b 7d cc             	mov    edi,DWORD PTR [ebp-0x34]
  4029e4:	81 e7 00 40 00 00    	and    edi,0x4000
  4029ea:	eb 18                	jmp    402a04 <_glob_match+0x264>
  4029ec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4029f0:	e8 c3 57 00 00       	call   4081b8 <_strcoll>
  4029f5:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  4029f7:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
  4029fa:	85 c0                	test   eax,eax
  4029fc:	7e 22                	jle    402a20 <_glob_match+0x280>
  4029fe:	85 d2                	test   edx,edx
  402a00:	74 24                	je     402a26 <_glob_match+0x286>
  402a02:	89 d3                	mov    ebx,edx
  402a04:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  402a07:	85 ff                	test   edi,edi
  402a09:	89 34 24             	mov    DWORD PTR [esp],esi
  402a0c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  402a10:	75 de                	jne    4029f0 <_glob_match+0x250>
  402a12:	e8 11 5b 00 00       	call   408528 <_stricoll>
  402a17:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  402a19:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
  402a1c:	85 c0                	test   eax,eax
  402a1e:	7f de                	jg     4029fe <_glob_match+0x25e>
  402a20:	89 ca                	mov    edx,ecx
  402a22:	85 d2                	test   edx,edx
  402a24:	75 dc                	jne    402a02 <_glob_match+0x262>
  402a26:	89 c1                	mov    ecx,eax
  402a28:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  402a2b:	c7 04 24 0c 00 00 00 	mov    DWORD PTR [esp],0xc
  402a32:	e8 69 57 00 00       	call   4081a0 <_malloc>
  402a37:	85 c0                	test   eax,eax
  402a39:	74 22                	je     402a5d <_glob_match+0x2bd>
  402a3b:	85 db                	test   ebx,ebx
  402a3d:	89 70 08             	mov    DWORD PTR [eax+0x8],esi
  402a40:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
  402a47:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  402a4d:	74 0e                	je     402a5d <_glob_match+0x2bd>
  402a4f:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  402a52:	85 c9                	test   ecx,ecx
  402a54:	0f 8e 16 02 00 00    	jle    402c70 <_glob_match+0x4d0>
  402a5a:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
  402a5d:	8b 7d bc             	mov    edi,DWORD PTR [ebp-0x44]
  402a60:	85 ff                	test   edi,edi
  402a62:	0f 84 15 02 00 00    	je     402c7d <_glob_match+0x4dd>
  402a68:	8b 65 b0             	mov    esp,DWORD PTR [ebp-0x50]
  402a6b:	e9 78 fe ff ff       	jmp    4028e8 <_glob_match+0x148>
  402a70:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402a73:	89 e6                	mov    esi,esp
  402a75:	89 04 24             	mov    DWORD PTR [esp],eax
  402a78:	e8 e3 56 00 00       	call   408160 <_strlen>
  402a7d:	83 c0 10             	add    eax,0x10
  402a80:	83 e0 f0             	and    eax,0xfffffff0
  402a83:	e8 98 f6 ff ff       	call   402120 <___chkstk_ms>
  402a88:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
  402a8b:	29 c4                	sub    esp,eax
  402a8d:	8d 7c 24 0c          	lea    edi,[esp+0xc]
  402a91:	89 f9                	mov    ecx,edi
  402a93:	eb 0d                	jmp    402aa2 <_glob_match+0x302>
  402a95:	83 c1 01             	add    ecx,0x1
  402a98:	83 c2 01             	add    edx,0x1
  402a9b:	84 c0                	test   al,al
  402a9d:	88 41 ff             	mov    BYTE PTR [ecx-0x1],al
  402aa0:	74 1b                	je     402abd <_glob_match+0x31d>
  402aa2:	0f b6 02             	movzx  eax,BYTE PTR [edx]
  402aa5:	3c 7f                	cmp    al,0x7f
  402aa7:	75 ec                	jne    402a95 <_glob_match+0x2f5>
  402aa9:	0f b6 42 01          	movzx  eax,BYTE PTR [edx+0x1]
  402aad:	83 c2 01             	add    edx,0x1
  402ab0:	83 c1 01             	add    ecx,0x1
  402ab3:	83 c2 01             	add    edx,0x1
  402ab6:	84 c0                	test   al,al
  402ab8:	88 41 ff             	mov    BYTE PTR [ecx-0x1],al
  402abb:	75 e5                	jne    402aa2 <_glob_match+0x302>
  402abd:	89 3c 24             	mov    DWORD PTR [esp],edi
  402ac0:	e8 5b 5a 00 00       	call   408520 <_strdup>
  402ac5:	89 f4                	mov    esp,esi
  402ac7:	89 c1                	mov    ecx,eax
  402ac9:	b8 01 00 00 00       	mov    eax,0x1
  402ace:	85 c9                	test   ecx,ecx
  402ad0:	0f 84 25 fd ff ff    	je     4027fb <_glob_match+0x5b>
  402ad6:	8d 55 d8             	lea    edx,[ebp-0x28]
  402ad9:	89 c8                	mov    eax,ecx
  402adb:	e8 f0 fb ff ff       	call   4026d0 <_glob_store_entry.part.2>
  402ae0:	e9 48 fd ff ff       	jmp    40282d <_glob_match+0x8d>
  402ae5:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  402ae8:	89 04 24             	mov    DWORD PTR [esp],eax
  402aeb:	e8 a0 0a 00 00       	call   403590 <___mingw_closedir>
  402af0:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
  402af3:	85 f6                	test   esi,esi
  402af5:	74 0b                	je     402b02 <_glob_match+0x362>
  402af7:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402afa:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  402afd:	e8 5e fc ff ff       	call   402760 <_glob_store_collated_entries>
  402b02:	83 45 c8 04          	add    DWORD PTR [ebp-0x38],0x4
  402b06:	8b 7d c8             	mov    edi,DWORD PTR [ebp-0x38]
  402b09:	8b 47 fc             	mov    eax,DWORD PTR [edi-0x4]
  402b0c:	89 04 24             	mov    DWORD PTR [esp],eax
  402b0f:	e8 84 56 00 00       	call   408198 <_free>
  402b14:	8b 07                	mov    eax,DWORD PTR [edi]
  402b16:	85 c0                	test   eax,eax
  402b18:	0f 85 82 fd ff ff    	jne    4028a0 <_glob_match+0x100>
  402b1e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402b21:	89 04 24             	mov    DWORD PTR [esp],eax
  402b24:	e8 6f 56 00 00       	call   408198 <_free>
  402b29:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
  402b2c:	8d 65 f4             	lea    esp,[ebp-0xc]
  402b2f:	5b                   	pop    ebx
  402b30:	5e                   	pop    esi
  402b31:	5f                   	pop    edi
  402b32:	5d                   	pop    ebp
  402b33:	c3                   	ret    
  402b34:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  402b37:	8b 75 b4             	mov    esi,DWORD PTR [ebp-0x4c]
  402b3a:	89 55 9c             	mov    DWORD PTR [ebp-0x64],edx
  402b3d:	8b 00                	mov    eax,DWORD PTR [eax]
  402b3f:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  402b43:	89 3c 24             	mov    DWORD PTR [esp],edi
  402b46:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  402b4a:	e8 39 56 00 00       	call   408188 <_memcpy>
  402b4f:	0f b6 44 34 0b       	movzx  eax,BYTE PTR [esp+esi*1+0xb]
  402b54:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  402b57:	3c 5c                	cmp    al,0x5c
  402b59:	74 35                	je     402b90 <_glob_match+0x3f0>
  402b5b:	3c 2f                	cmp    al,0x2f
  402b5d:	74 31                	je     402b90 <_glob_match+0x3f0>
  402b5f:	8b 75 b4             	mov    esi,DWORD PTR [ebp-0x4c]
  402b62:	0f b6 4d a3          	movzx  ecx,BYTE PTR [ebp-0x5d]
  402b66:	89 f0                	mov    eax,esi
  402b68:	83 c0 01             	add    eax,0x1
  402b6b:	88 0c 37             	mov    BYTE PTR [edi+esi*1],cl
  402b6e:	e9 d4 fd ff ff       	jmp    402947 <_glob_match+0x1a7>
  402b73:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402b76:	89 f0                	mov    eax,esi
  402b78:	e8 c3 fb ff ff       	call   402740 <_glob_store_entry>
  402b7d:	e9 e6 fe ff ff       	jmp    402a68 <_glob_match+0x2c8>
  402b82:	c7 45 c4 03 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x3
  402b89:	e9 da fe ff ff       	jmp    402a68 <_glob_match+0x2c8>
  402b8e:	66 90                	xchg   ax,ax
  402b90:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  402b93:	e9 af fd ff ff       	jmp    402947 <_glob_match+0x1a7>
  402b98:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402b9b:	89 04 24             	mov    DWORD PTR [esp],eax
  402b9e:	e8 bd 55 00 00       	call   408160 <_strlen>
  402ba3:	01 d8                	add    eax,ebx
  402ba5:	39 c3                	cmp    ebx,eax
  402ba7:	0f 83 94 01 00 00    	jae    402d41 <_glob_match+0x5a1>
  402bad:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  402bb0:	80 fa 2f             	cmp    dl,0x2f
  402bb3:	0f 84 7d 01 00 00    	je     402d36 <_glob_match+0x596>
  402bb9:	80 fa 5c             	cmp    dl,0x5c
  402bbc:	75 1d                	jne    402bdb <_glob_match+0x43b>
  402bbe:	66 90                	xchg   ax,ax
  402bc0:	e9 71 01 00 00       	jmp    402d36 <_glob_match+0x596>
  402bc5:	0f b6 40 ff          	movzx  eax,BYTE PTR [eax-0x1]
  402bc9:	3c 5c                	cmp    al,0x5c
  402bcb:	0f 84 c0 00 00 00    	je     402c91 <_glob_match+0x4f1>
  402bd1:	3c 2f                	cmp    al,0x2f
  402bd3:	0f 84 b8 00 00 00    	je     402c91 <_glob_match+0x4f1>
  402bd9:	89 d0                	mov    eax,edx
  402bdb:	8d 50 ff             	lea    edx,[eax-0x1]
  402bde:	39 da                	cmp    edx,ebx
  402be0:	75 e3                	jne    402bc5 <_glob_match+0x425>
  402be2:	0f b6 40 ff          	movzx  eax,BYTE PTR [eax-0x1]
  402be6:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
  402be9:	88 45 a3             	mov    BYTE PTR [ebp-0x5d],al
  402bec:	80 7d a3 5c          	cmp    BYTE PTR [ebp-0x5d],0x5c
  402bf0:	0f 85 0c 01 00 00    	jne    402d02 <_glob_match+0x562>
  402bf6:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  402bf9:	0f b6 4d a3          	movzx  ecx,BYTE PTR [ebp-0x5d]
  402bfd:	83 c0 01             	add    eax,0x1
  402c00:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  402c03:	80 fa 5c             	cmp    dl,0x5c
  402c06:	75 0d                	jne    402c15 <_glob_match+0x475>
  402c08:	83 c0 01             	add    eax,0x1
  402c0b:	89 d1                	mov    ecx,edx
  402c0d:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  402c10:	80 fa 5c             	cmp    dl,0x5c
  402c13:	74 f3                	je     402c08 <_glob_match+0x468>
  402c15:	80 fa 2f             	cmp    dl,0x2f
  402c18:	74 ee                	je     402c08 <_glob_match+0x468>
  402c1a:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  402c1d:	88 4d a3             	mov    BYTE PTR [ebp-0x5d],cl
  402c20:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402c23:	85 c0                	test   eax,eax
  402c25:	0f 85 47 fc ff ff    	jne    402872 <_glob_match+0xd2>
  402c2b:	8b 5d c0             	mov    ebx,DWORD PTR [ebp-0x40]
  402c2e:	e9 2b fc ff ff       	jmp    40285e <_glob_match+0xbe>
  402c33:	8b 5d 98             	mov    ebx,DWORD PTR [ebp-0x68]
  402c36:	85 db                	test   ebx,ebx
  402c38:	75 28                	jne    402c62 <_glob_match+0x4c2>
  402c3a:	8b 7d a4             	mov    edi,DWORD PTR [ebp-0x5c]
  402c3d:	85 ff                	test   edi,edi
  402c3f:	0f 84 bd fe ff ff    	je     402b02 <_glob_match+0x362>
  402c45:	e8 76 55 00 00       	call   4081c0 <__errno>
  402c4a:	8b 00                	mov    eax,DWORD PTR [eax]
  402c4c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  402c50:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  402c53:	8b 00                	mov    eax,DWORD PTR [eax]
  402c55:	89 04 24             	mov    DWORD PTR [esp],eax
  402c58:	ff d7                	call   edi
  402c5a:	85 c0                	test   eax,eax
  402c5c:	0f 84 a0 fe ff ff    	je     402b02 <_glob_match+0x362>
  402c62:	c7 45 c4 01 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x1
  402c69:	e9 94 fe ff ff       	jmp    402b02 <_glob_match+0x362>
  402c6e:	66 90                	xchg   ax,ax
  402c70:	8b 7d bc             	mov    edi,DWORD PTR [ebp-0x44]
  402c73:	89 03                	mov    DWORD PTR [ebx],eax
  402c75:	85 ff                	test   edi,edi
  402c77:	0f 85 eb fd ff ff    	jne    402a68 <_glob_match+0x2c8>
  402c7d:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  402c80:	e9 e3 fd ff ff       	jmp    402a68 <_glob_match+0x2c8>
  402c85:	c7 45 b4 00 00 00 00 	mov    DWORD PTR [ebp-0x4c],0x0
  402c8c:	e9 47 fc ff ff       	jmp    4028d8 <_glob_match+0x138>
  402c91:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
  402c94:	88 45 a3             	mov    BYTE PTR [ebp-0x5d],al
  402c97:	e9 50 ff ff ff       	jmp    402bec <_glob_match+0x44c>
  402c9c:	31 db                	xor    ebx,ebx
  402c9e:	31 c9                	xor    ecx,ecx
  402ca0:	e9 83 fd ff ff       	jmp    402a28 <_glob_match+0x288>
  402ca5:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  402ca8:	89 d8                	mov    eax,ebx
  402caa:	e8 a1 f4 ff ff       	call   402150 <_is_glob_pattern>
  402caf:	85 c0                	test   eax,eax
  402cb1:	0f 85 bb fb ff ff    	jne    402872 <_glob_match+0xd2>
  402cb7:	89 1c 24             	mov    DWORD PTR [esp],ebx
  402cba:	89 e6                	mov    esi,esp
  402cbc:	e8 9f 54 00 00       	call   408160 <_strlen>
  402cc1:	83 c0 10             	add    eax,0x10
  402cc4:	83 e0 f0             	and    eax,0xfffffff0
  402cc7:	e8 54 f4 ff ff       	call   402120 <___chkstk_ms>
  402ccc:	29 c4                	sub    esp,eax
  402cce:	8d 4c 24 0c          	lea    ecx,[esp+0xc]
  402cd2:	89 ca                	mov    edx,ecx
  402cd4:	eb 0d                	jmp    402ce3 <_glob_match+0x543>
  402cd6:	83 c2 01             	add    edx,0x1
  402cd9:	83 c3 01             	add    ebx,0x1
  402cdc:	84 c0                	test   al,al
  402cde:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  402ce1:	74 32                	je     402d15 <_glob_match+0x575>
  402ce3:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  402ce6:	3c 7f                	cmp    al,0x7f
  402ce8:	75 ec                	jne    402cd6 <_glob_match+0x536>
  402cea:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  402cee:	83 c3 01             	add    ebx,0x1
  402cf1:	eb e3                	jmp    402cd6 <_glob_match+0x536>
  402cf3:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  402cf6:	c7 45 c4 02 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x2
  402cfd:	e9 1f fe ff ff       	jmp    402b21 <_glob_match+0x381>
  402d02:	80 7d a3 2f          	cmp    BYTE PTR [ebp-0x5d],0x2f
  402d06:	0f 84 ea fe ff ff    	je     402bf6 <_glob_match+0x456>
  402d0c:	c6 45 a3 5c          	mov    BYTE PTR [ebp-0x5d],0x5c
  402d10:	e9 0b ff ff ff       	jmp    402c20 <_glob_match+0x480>
  402d15:	89 0c 24             	mov    DWORD PTR [esp],ecx
  402d18:	e8 03 58 00 00       	call   408520 <_strdup>
  402d1d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402d20:	89 f4                	mov    esp,esi
  402d22:	e8 19 fa ff ff       	call   402740 <_glob_store_entry>
  402d27:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402d2a:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x0
  402d31:	e9 eb fd ff ff       	jmp    402b21 <_glob_match+0x381>
  402d36:	88 55 a3             	mov    BYTE PTR [ebp-0x5d],dl
  402d39:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  402d3c:	e9 ab fe ff ff       	jmp    402bec <_glob_match+0x44c>
  402d41:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
  402d44:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  402d47:	88 4d a3             	mov    BYTE PTR [ebp-0x5d],cl
  402d4a:	e9 9d fe ff ff       	jmp    402bec <_glob_match+0x44c>
  402d4f:	90                   	nop

00402d50 <___mingw_glob>:
  402d50:	55                   	push   ebp
  402d51:	89 e5                	mov    ebp,esp
  402d53:	57                   	push   edi
  402d54:	56                   	push   esi
  402d55:	53                   	push   ebx
  402d56:	83 ec 1c             	sub    esp,0x1c
  402d59:	8b 75 14             	mov    esi,DWORD PTR [ebp+0x14]
  402d5c:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  402d5f:	81 3e 32 a1 40 00    	cmp    DWORD PTR [esi],0x40a132
  402d65:	74 0d                	je     402d74 <___mingw_glob+0x24>
  402d67:	89 f0                	mov    eax,esi
  402d69:	e8 82 f6 ff ff       	call   4023f0 <_glob_initialise>
  402d6e:	c7 06 32 a1 40 00    	mov    DWORD PTR [esi],0x40a132
  402d74:	89 34 24             	mov    DWORD PTR [esp],esi
  402d77:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
  402d7a:	89 d8                	mov    eax,ebx
  402d7c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  402d7f:	e8 1c fa ff ff       	call   4027a0 <_glob_match>
  402d84:	83 f8 02             	cmp    eax,0x2
  402d87:	89 c7                	mov    edi,eax
  402d89:	74 0a                	je     402d95 <___mingw_glob+0x45>
  402d8b:	8d 65 f4             	lea    esp,[ebp-0xc]
  402d8e:	89 f8                	mov    eax,edi
  402d90:	5b                   	pop    ebx
  402d91:	5e                   	pop    esi
  402d92:	5f                   	pop    edi
  402d93:	5d                   	pop    ebp
  402d94:	c3                   	ret    
  402d95:	f6 45 0c 10          	test   BYTE PTR [ebp+0xc],0x10
  402d99:	74 f0                	je     402d8b <___mingw_glob+0x3b>
  402d9b:	89 65 e4             	mov    DWORD PTR [ebp-0x1c],esp
  402d9e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  402da1:	e8 ba 53 00 00       	call   408160 <_strlen>
  402da6:	83 c0 10             	add    eax,0x10
  402da9:	83 e0 f0             	and    eax,0xfffffff0
  402dac:	e8 6f f3 ff ff       	call   402120 <___chkstk_ms>
  402db1:	29 c4                	sub    esp,eax
  402db3:	8d 4c 24 04          	lea    ecx,[esp+0x4]
  402db7:	89 ca                	mov    edx,ecx
  402db9:	eb 12                	jmp    402dcd <___mingw_glob+0x7d>
  402dbb:	90                   	nop
  402dbc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402dc0:	83 c2 01             	add    edx,0x1
  402dc3:	83 c3 01             	add    ebx,0x1
  402dc6:	84 c0                	test   al,al
  402dc8:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  402dcb:	74 1b                	je     402de8 <___mingw_glob+0x98>
  402dcd:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  402dd0:	3c 7f                	cmp    al,0x7f
  402dd2:	75 ec                	jne    402dc0 <___mingw_glob+0x70>
  402dd4:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  402dd8:	83 c3 01             	add    ebx,0x1
  402ddb:	83 c2 01             	add    edx,0x1
  402dde:	83 c3 01             	add    ebx,0x1
  402de1:	84 c0                	test   al,al
  402de3:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  402de6:	75 e5                	jne    402dcd <___mingw_glob+0x7d>
  402de8:	89 0c 24             	mov    DWORD PTR [esp],ecx
  402deb:	e8 30 57 00 00       	call   408520 <_strdup>
  402df0:	8b 65 e4             	mov    esp,DWORD PTR [ebp-0x1c]
  402df3:	89 f2                	mov    edx,esi
  402df5:	e8 46 f9 ff ff       	call   402740 <_glob_store_entry>
  402dfa:	8d 65 f4             	lea    esp,[ebp-0xc]
  402dfd:	89 f8                	mov    eax,edi
  402dff:	5b                   	pop    ebx
  402e00:	5e                   	pop    esi
  402e01:	5f                   	pop    edi
  402e02:	5d                   	pop    ebp
  402e03:	c3                   	ret    
  402e04:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402e0a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00402e10 <___mingw_globfree>:
  402e10:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  402e14:	81 38 32 a1 40 00    	cmp    DWORD PTR [eax],0x40a132
  402e1a:	74 04                	je     402e20 <___mingw_globfree+0x10>
  402e1c:	f3 c3                	repz ret 
  402e1e:	66 90                	xchg   ax,ax
  402e20:	e9 5b f8 ff ff       	jmp    402680 <_glob_registry.part.1>
  402e25:	90                   	nop
  402e26:	90                   	nop
  402e27:	90                   	nop
  402e28:	90                   	nop
  402e29:	90                   	nop
  402e2a:	90                   	nop
  402e2b:	90                   	nop
  402e2c:	90                   	nop
  402e2d:	90                   	nop
  402e2e:	90                   	nop
  402e2f:	90                   	nop

00402e30 <___mingw_dirname>:
  402e30:	55                   	push   ebp
  402e31:	89 e5                	mov    ebp,esp
  402e33:	57                   	push   edi
  402e34:	56                   	push   esi
  402e35:	53                   	push   ebx
  402e36:	83 ec 3c             	sub    esp,0x3c
  402e39:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  402e3c:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  402e43:	00 
  402e44:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  402e4b:	e8 78 53 00 00       	call   4081c8 <_setlocale>
  402e50:	85 c0                	test   eax,eax
  402e52:	89 c3                	mov    ebx,eax
  402e54:	74 0a                	je     402e60 <___mingw_dirname+0x30>
  402e56:	89 04 24             	mov    DWORD PTR [esp],eax
  402e59:	e8 c2 56 00 00       	call   408520 <_strdup>
  402e5e:	89 c3                	mov    ebx,eax
  402e60:	c7 44 24 04 44 a1 40 	mov    DWORD PTR [esp+0x4],0x40a144
  402e67:	00 
  402e68:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  402e6f:	e8 54 53 00 00       	call   4081c8 <_setlocale>
  402e74:	85 f6                	test   esi,esi
  402e76:	74 05                	je     402e7d <___mingw_dirname+0x4d>
  402e78:	80 3e 00             	cmp    BYTE PTR [esi],0x0
  402e7b:	75 73                	jne    402ef0 <___mingw_dirname+0xc0>
  402e7d:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  402e84:	00 
  402e85:	c7 44 24 04 46 a1 40 	mov    DWORD PTR [esp+0x4],0x40a146
  402e8c:	00 
  402e8d:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  402e94:	e8 37 53 00 00       	call   4081d0 <_wcstombs>
  402e99:	8d 70 01             	lea    esi,[eax+0x1]
  402e9c:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  402ea0:	a1 68 d0 40 00       	mov    eax,ds:0x40d068
  402ea5:	89 04 24             	mov    DWORD PTR [esp],eax
  402ea8:	e8 03 53 00 00       	call   4081b0 <_realloc>
  402ead:	a3 68 d0 40 00       	mov    ds:0x40d068,eax
  402eb2:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  402eb6:	c7 44 24 04 46 a1 40 	mov    DWORD PTR [esp+0x4],0x40a146
  402ebd:	00 
  402ebe:	89 04 24             	mov    DWORD PTR [esp],eax
  402ec1:	e8 0a 53 00 00       	call   4081d0 <_wcstombs>
  402ec6:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  402eca:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  402ed1:	e8 f2 52 00 00       	call   4081c8 <_setlocale>
  402ed6:	89 1c 24             	mov    DWORD PTR [esp],ebx
  402ed9:	e8 ba 52 00 00       	call   408198 <_free>
  402ede:	a1 68 d0 40 00       	mov    eax,ds:0x40d068
  402ee3:	8d 65 f4             	lea    esp,[ebp-0xc]
  402ee6:	5b                   	pop    ebx
  402ee7:	5e                   	pop    esi
  402ee8:	5f                   	pop    edi
  402ee9:	5d                   	pop    ebp
  402eea:	c3                   	ret    
  402eeb:	90                   	nop
  402eec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402ef0:	89 65 d4             	mov    DWORD PTR [ebp-0x2c],esp
  402ef3:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  402efa:	00 
  402efb:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  402eff:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  402f06:	e8 cd 52 00 00       	call   4081d8 <_mbstowcs>
  402f0b:	89 c2                	mov    edx,eax
  402f0d:	8d 44 00 12          	lea    eax,[eax+eax*1+0x12]
  402f11:	83 e0 f0             	and    eax,0xfffffff0
  402f14:	e8 07 f2 ff ff       	call   402120 <___chkstk_ms>
  402f19:	29 c4                	sub    esp,eax
  402f1b:	8d 44 24 0d          	lea    eax,[esp+0xd]
  402f1f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  402f22:	d1 6d e4             	shr    DWORD PTR [ebp-0x1c],1
  402f25:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  402f28:	01 c0                	add    eax,eax
  402f2a:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  402f2d:	89 c7                	mov    edi,eax
  402f2f:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  402f33:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  402f37:	89 04 24             	mov    DWORD PTR [esp],eax
  402f3a:	e8 99 52 00 00       	call   4081d8 <_mbstowcs>
  402f3f:	31 c9                	xor    ecx,ecx
  402f41:	66 89 0c 47          	mov    WORD PTR [edi+eax*2],cx
  402f45:	83 f8 01             	cmp    eax,0x1
  402f48:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  402f4b:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  402f4e:	0f b7 04 00          	movzx  eax,WORD PTR [eax+eax*1]
  402f52:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
  402f56:	0f 86 f2 00 00 00    	jbe    40304e <___mingw_dirname+0x21e>
  402f5c:	66 83 f8 5c          	cmp    ax,0x5c
  402f60:	74 0a                	je     402f6c <___mingw_dirname+0x13c>
  402f62:	66 83 f8 2f          	cmp    ax,0x2f
  402f66:	0f 85 0a 01 00 00    	jne    403076 <___mingw_dirname+0x246>
  402f6c:	8b 7d e0             	mov    edi,DWORD PTR [ebp-0x20]
  402f6f:	89 7d dc             	mov    DWORD PTR [ebp-0x24],edi
  402f72:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
  402f75:	66 3b 44 3f 02       	cmp    ax,WORD PTR [edi+edi*1+0x2]
  402f7a:	0f 84 4f 02 00 00    	je     4031cf <___mingw_dirname+0x39f>
  402f80:	0f b7 45 da          	movzx  eax,WORD PTR [ebp-0x26]
  402f84:	66 85 c0             	test   ax,ax
  402f87:	0f 84 fa 01 00 00    	je     403187 <___mingw_dirname+0x357>
  402f8d:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
  402f90:	89 d7                	mov    edi,edx
  402f92:	eb 14                	jmp    402fa8 <___mingw_dirname+0x178>
  402f94:	66 83 f8 2f          	cmp    ax,0x2f
  402f98:	74 20                	je     402fba <___mingw_dirname+0x18a>
  402f9a:	0f b7 42 02          	movzx  eax,WORD PTR [edx+0x2]
  402f9e:	8d 4a 02             	lea    ecx,[edx+0x2]
  402fa1:	66 85 c0             	test   ax,ax
  402fa4:	74 36                	je     402fdc <___mingw_dirname+0x1ac>
  402fa6:	89 ca                	mov    edx,ecx
  402fa8:	66 83 f8 5c          	cmp    ax,0x5c
  402fac:	75 e6                	jne    402f94 <___mingw_dirname+0x164>
  402fae:	0f b7 02             	movzx  eax,WORD PTR [edx]
  402fb1:	66 83 f8 5c          	cmp    ax,0x5c
  402fb5:	75 0c                	jne    402fc3 <___mingw_dirname+0x193>
  402fb7:	83 c2 02             	add    edx,0x2
  402fba:	0f b7 02             	movzx  eax,WORD PTR [edx]
  402fbd:	66 83 f8 5c          	cmp    ax,0x5c
  402fc1:	74 f4                	je     402fb7 <___mingw_dirname+0x187>
  402fc3:	66 83 f8 2f          	cmp    ax,0x2f
  402fc7:	74 ee                	je     402fb7 <___mingw_dirname+0x187>
  402fc9:	66 85 c0             	test   ax,ax
  402fcc:	74 0e                	je     402fdc <___mingw_dirname+0x1ac>
  402fce:	0f b7 42 02          	movzx  eax,WORD PTR [edx+0x2]
  402fd2:	89 d7                	mov    edi,edx
  402fd4:	8d 4a 02             	lea    ecx,[edx+0x2]
  402fd7:	66 85 c0             	test   ax,ax
  402fda:	75 ca                	jne    402fa6 <___mingw_dirname+0x176>
  402fdc:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  402fdf:	39 f9                	cmp    ecx,edi
  402fe1:	72 7e                	jb     403061 <___mingw_dirname+0x231>
  402fe3:	66 83 7d da 5c       	cmp    WORD PTR [ebp-0x26],0x5c
  402fe8:	74 0b                	je     402ff5 <___mingw_dirname+0x1c5>
  402fea:	66 83 7d da 2f       	cmp    WORD PTR [ebp-0x26],0x2f
  402fef:	0f 85 ba 01 00 00    	jne    4031af <___mingw_dirname+0x37f>
  402ff5:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  402ff8:	83 c0 02             	add    eax,0x2
  402ffb:	31 d2                	xor    edx,edx
  402ffd:	66 89 10             	mov    WORD PTR [eax],dx
  403000:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  403007:	00 
  403008:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  40300b:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  403012:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  403016:	e8 b5 51 00 00       	call   4081d0 <_wcstombs>
  40301b:	8d 78 01             	lea    edi,[eax+0x1]
  40301e:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  403022:	a1 68 d0 40 00       	mov    eax,ds:0x40d068
  403027:	89 04 24             	mov    DWORD PTR [esp],eax
  40302a:	e8 81 51 00 00       	call   4081b0 <_realloc>
  40302f:	a3 68 d0 40 00       	mov    ds:0x40d068,eax
  403034:	89 c6                	mov    esi,eax
  403036:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  40303a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  40303d:	89 34 24             	mov    DWORD PTR [esp],esi
  403040:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  403044:	e8 87 51 00 00       	call   4081d0 <_wcstombs>
  403049:	e9 e9 00 00 00       	jmp    403137 <___mingw_dirname+0x307>
  40304e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  403051:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  403054:	e9 27 ff ff ff       	jmp    402f80 <___mingw_dirname+0x150>
  403059:	66 83 fa 2f          	cmp    dx,0x2f
  40305d:	75 46                	jne    4030a5 <___mingw_dirname+0x275>
  40305f:	89 c7                	mov    edi,eax
  403061:	8d 47 fe             	lea    eax,[edi-0x2]
  403064:	39 c1                	cmp    ecx,eax
  403066:	73 3d                	jae    4030a5 <___mingw_dirname+0x275>
  403068:	0f b7 57 fe          	movzx  edx,WORD PTR [edi-0x2]
  40306c:	66 83 fa 5c          	cmp    dx,0x5c
  403070:	75 e7                	jne    403059 <___mingw_dirname+0x229>
  403072:	89 c7                	mov    edi,eax
  403074:	eb eb                	jmp    403061 <___mingw_dirname+0x231>
  403076:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  403079:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  40307c:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  40307f:	66 83 7c 00 02 3a    	cmp    WORD PTR [eax+eax*1+0x2],0x3a
  403085:	0f 85 f5 fe ff ff    	jne    402f80 <___mingw_dirname+0x150>
  40308b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  40308e:	83 c0 04             	add    eax,0x4
  403091:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  403094:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403097:	0f b7 44 00 04       	movzx  eax,WORD PTR [eax+eax*1+0x4]
  40309c:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
  4030a0:	e9 db fe ff ff       	jmp    402f80 <___mingw_dirname+0x150>
  4030a5:	39 45 dc             	cmp    DWORD PTR [ebp-0x24],eax
  4030a8:	0f 84 37 01 00 00    	je     4031e5 <___mingw_dirname+0x3b5>
  4030ae:	31 d2                	xor    edx,edx
  4030b0:	66 89 50 02          	mov    WORD PTR [eax+0x2],dx
  4030b4:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  4030b7:	0f b7 14 00          	movzx  edx,WORD PTR [eax+eax*1]
  4030bb:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4030be:	66 83 fa 5c          	cmp    dx,0x5c
  4030c2:	0f 85 c7 00 00 00    	jne    40318f <___mingw_dirname+0x35f>
  4030c8:	83 c0 02             	add    eax,0x2
  4030cb:	0f b7 08             	movzx  ecx,WORD PTR [eax]
  4030ce:	66 83 f9 5c          	cmp    cx,0x5c
  4030d2:	74 f4                	je     4030c8 <___mingw_dirname+0x298>
  4030d4:	66 83 f9 2f          	cmp    cx,0x2f
  4030d8:	74 ee                	je     4030c8 <___mingw_dirname+0x298>
  4030da:	89 c1                	mov    ecx,eax
  4030dc:	2b 4d e0             	sub    ecx,DWORD PTR [ebp-0x20]
  4030df:	83 f9 05             	cmp    ecx,0x5
  4030e2:	0f 8e b1 00 00 00    	jle    403199 <___mingw_dirname+0x369>
  4030e8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4030eb:	89 c1                	mov    ecx,eax
  4030ed:	66 85 d2             	test   dx,dx
  4030f0:	74 21                	je     403113 <___mingw_dirname+0x2e3>
  4030f2:	83 c1 02             	add    ecx,0x2
  4030f5:	66 83 fa 2f          	cmp    dx,0x2f
  4030f9:	66 89 51 fe          	mov    WORD PTR [ecx-0x2],dx
  4030fd:	74 63                	je     403162 <___mingw_dirname+0x332>
  4030ff:	66 83 38 5c          	cmp    WORD PTR [eax],0x5c
  403103:	8d 78 02             	lea    edi,[eax+0x2]
  403106:	74 58                	je     403160 <___mingw_dirname+0x330>
  403108:	0f b7 50 02          	movzx  edx,WORD PTR [eax+0x2]
  40310c:	89 f8                	mov    eax,edi
  40310e:	66 85 d2             	test   dx,dx
  403111:	75 df                	jne    4030f2 <___mingw_dirname+0x2c2>
  403113:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  403116:	31 ff                	xor    edi,edi
  403118:	66 89 39             	mov    WORD PTR [ecx],di
  40311b:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40311f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  403122:	89 34 24             	mov    DWORD PTR [esp],esi
  403125:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  403129:	e8 a2 50 00 00       	call   4081d0 <_wcstombs>
  40312e:	83 f8 ff             	cmp    eax,0xffffffff
  403131:	74 04                	je     403137 <___mingw_dirname+0x307>
  403133:	c6 04 06 00          	mov    BYTE PTR [esi+eax*1],0x0
  403137:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  40313b:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  403142:	e8 81 50 00 00       	call   4081c8 <_setlocale>
  403147:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40314a:	e8 49 50 00 00       	call   408198 <_free>
  40314f:	8b 65 d4             	mov    esp,DWORD PTR [ebp-0x2c]
  403152:	8d 65 f4             	lea    esp,[ebp-0xc]
  403155:	5b                   	pop    ebx
  403156:	89 f0                	mov    eax,esi
  403158:	5e                   	pop    esi
  403159:	5f                   	pop    edi
  40315a:	5d                   	pop    ebp
  40315b:	c3                   	ret    
  40315c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403160:	89 f8                	mov    eax,edi
  403162:	0f b7 10             	movzx  edx,WORD PTR [eax]
  403165:	66 83 fa 2f          	cmp    dx,0x2f
  403169:	75 59                	jne    4031c4 <___mingw_dirname+0x394>
  40316b:	90                   	nop
  40316c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403170:	83 c0 02             	add    eax,0x2
  403173:	0f b7 10             	movzx  edx,WORD PTR [eax]
  403176:	66 83 fa 5c          	cmp    dx,0x5c
  40317a:	74 f4                	je     403170 <___mingw_dirname+0x340>
  40317c:	66 83 fa 2f          	cmp    dx,0x2f
  403180:	74 ee                	je     403170 <___mingw_dirname+0x340>
  403182:	e9 66 ff ff ff       	jmp    4030ed <___mingw_dirname+0x2bd>
  403187:	8b 65 d4             	mov    esp,DWORD PTR [ebp-0x2c]
  40318a:	e9 ee fc ff ff       	jmp    402e7d <___mingw_dirname+0x4d>
  40318f:	66 83 fa 2f          	cmp    dx,0x2f
  403193:	0f 84 2f ff ff ff    	je     4030c8 <___mingw_dirname+0x298>
  403199:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
  40319c:	66 39 54 3f 02       	cmp    WORD PTR [edi+edi*1+0x2],dx
  4031a1:	0f 85 41 ff ff ff    	jne    4030e8 <___mingw_dirname+0x2b8>
  4031a7:	0f b7 10             	movzx  edx,WORD PTR [eax]
  4031aa:	e9 3c ff ff ff       	jmp    4030eb <___mingw_dirname+0x2bb>
  4031af:	8b 7d dc             	mov    edi,DWORD PTR [ebp-0x24]
  4031b2:	b9 2e 00 00 00       	mov    ecx,0x2e
  4031b7:	89 f8                	mov    eax,edi
  4031b9:	83 c0 02             	add    eax,0x2
  4031bc:	66 89 0f             	mov    WORD PTR [edi],cx
  4031bf:	e9 37 fe ff ff       	jmp    402ffb <___mingw_dirname+0x1cb>
  4031c4:	66 83 fa 5c          	cmp    dx,0x5c
  4031c8:	74 a6                	je     403170 <___mingw_dirname+0x340>
  4031ca:	e9 1e ff ff ff       	jmp    4030ed <___mingw_dirname+0x2bd>
  4031cf:	66 83 7c 3f 04 00    	cmp    WORD PTR [edi+edi*1+0x4],0x0
  4031d5:	0f 85 a5 fd ff ff    	jne    402f80 <___mingw_dirname+0x150>
  4031db:	90                   	nop
  4031dc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4031e0:	e9 52 ff ff ff       	jmp    403137 <___mingw_dirname+0x307>
  4031e5:	66 83 7d da 5c       	cmp    WORD PTR [ebp-0x26],0x5c
  4031ea:	74 0e                	je     4031fa <___mingw_dirname+0x3ca>
  4031ec:	66 83 7d da 2f       	cmp    WORD PTR [ebp-0x26],0x2f
  4031f1:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4031f4:	0f 85 b4 fe ff ff    	jne    4030ae <___mingw_dirname+0x27e>
  4031fa:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4031fd:	0f b7 4d da          	movzx  ecx,WORD PTR [ebp-0x26]
  403201:	66 39 48 02          	cmp    WORD PTR [eax+0x2],cx
  403205:	0f 85 a3 fe ff ff    	jne    4030ae <___mingw_dirname+0x27e>
  40320b:	0f b7 50 04          	movzx  edx,WORD PTR [eax+0x4]
  40320f:	66 83 fa 2f          	cmp    dx,0x2f
  403213:	0f 84 95 fe ff ff    	je     4030ae <___mingw_dirname+0x27e>
  403219:	66 83 fa 5c          	cmp    dx,0x5c
  40321d:	89 f8                	mov    eax,edi
  40321f:	0f 85 89 fe ff ff    	jne    4030ae <___mingw_dirname+0x27e>
  403225:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  403228:	e9 81 fe ff ff       	jmp    4030ae <___mingw_dirname+0x27e>
  40322d:	90                   	nop
  40322e:	90                   	nop
  40322f:	90                   	nop

00403230 <_dirent_findnext>:
  403230:	55                   	push   ebp
  403231:	89 e5                	mov    ebp,esp
  403233:	56                   	push   esi
  403234:	89 d6                	mov    esi,edx
  403236:	53                   	push   ebx
  403237:	81 ec 50 01 00 00    	sub    esp,0x150
  40323d:	8d 95 b8 fe ff ff    	lea    edx,[ebp-0x148]
  403243:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  403247:	89 04 24             	mov    DWORD PTR [esp],eax
  40324a:	e8 31 50 00 00       	call   408280 <_FindNextFileA@8>
  40324f:	83 ec 08             	sub    esp,0x8
  403252:	85 c0                	test   eax,eax
  403254:	89 c3                	mov    ebx,eax
  403256:	75 20                	jne    403278 <_dirent_findnext+0x48>
  403258:	e8 03 50 00 00       	call   408260 <_GetLastError@0>
  40325d:	31 db                	xor    ebx,ebx
  40325f:	83 f8 12             	cmp    eax,0x12
  403262:	74 0b                	je     40326f <_dirent_findnext+0x3f>
  403264:	e8 57 4f 00 00       	call   4081c0 <__errno>
  403269:	c7 00 02 00 00 00    	mov    DWORD PTR [eax],0x2
  40326f:	8d 65 f8             	lea    esp,[ebp-0x8]
  403272:	89 d8                	mov    eax,ebx
  403274:	5b                   	pop    ebx
  403275:	5e                   	pop    esi
  403276:	5d                   	pop    ebp
  403277:	c3                   	ret    
  403278:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
  40327e:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  403282:	8d 46 0c             	lea    eax,[esi+0xc]
  403285:	c7 44 24 08 4c a1 40 	mov    DWORD PTR [esp+0x8],0x40a14c
  40328c:	00 
  40328d:	c7 44 24 04 04 01 00 	mov    DWORD PTR [esp+0x4],0x104
  403294:	00 
  403295:	89 04 24             	mov    DWORD PTR [esp],eax
  403298:	e8 43 04 00 00       	call   4036e0 <___mingw_snprintf>
  40329d:	66 89 46 06          	mov    WORD PTR [esi+0x6],ax
  4032a1:	8b 85 b8 fe ff ff    	mov    eax,DWORD PTR [ebp-0x148]
  4032a7:	24 58                	and    al,0x58
  4032a9:	83 f8 10             	cmp    eax,0x10
  4032ac:	76 12                	jbe    4032c0 <_dirent_findnext+0x90>
  4032ae:	c7 46 08 18 00 00 00 	mov    DWORD PTR [esi+0x8],0x18
  4032b5:	8d 65 f8             	lea    esp,[ebp-0x8]
  4032b8:	89 d8                	mov    eax,ebx
  4032ba:	5b                   	pop    ebx
  4032bb:	5e                   	pop    esi
  4032bc:	5d                   	pop    ebp
  4032bd:	c3                   	ret    
  4032be:	66 90                	xchg   ax,ax
  4032c0:	89 46 08             	mov    DWORD PTR [esi+0x8],eax
  4032c3:	8d 65 f8             	lea    esp,[ebp-0x8]
  4032c6:	89 d8                	mov    eax,ebx
  4032c8:	5b                   	pop    ebx
  4032c9:	5e                   	pop    esi
  4032ca:	5d                   	pop    ebp
  4032cb:	c3                   	ret    
  4032cc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

004032d0 <_dirent_findfirst>:
  4032d0:	55                   	push   ebp
  4032d1:	89 e5                	mov    ebp,esp
  4032d3:	56                   	push   esi
  4032d4:	53                   	push   ebx
  4032d5:	89 d3                	mov    ebx,edx
  4032d7:	81 ec 50 01 00 00    	sub    esp,0x150
  4032dd:	8d 95 b8 fe ff ff    	lea    edx,[ebp-0x148]
  4032e3:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4032e7:	89 04 24             	mov    DWORD PTR [esp],eax
  4032ea:	e8 99 4f 00 00       	call   408288 <_FindFirstFileA@8>
  4032ef:	83 ec 08             	sub    esp,0x8
  4032f2:	83 f8 ff             	cmp    eax,0xffffffff
  4032f5:	89 c6                	mov    esi,eax
  4032f7:	74 4a                	je     403343 <_dirent_findfirst+0x73>
  4032f9:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
  4032ff:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  403303:	8d 43 0c             	lea    eax,[ebx+0xc]
  403306:	c7 44 24 08 4c a1 40 	mov    DWORD PTR [esp+0x8],0x40a14c
  40330d:	00 
  40330e:	c7 44 24 04 04 01 00 	mov    DWORD PTR [esp+0x4],0x104
  403315:	00 
  403316:	89 04 24             	mov    DWORD PTR [esp],eax
  403319:	e8 c2 03 00 00       	call   4036e0 <___mingw_snprintf>
  40331e:	8b 8d b8 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x148]
  403324:	80 e1 58             	and    cl,0x58
  403327:	83 f9 10             	cmp    ecx,0x10
  40332a:	66 89 43 06          	mov    WORD PTR [ebx+0x6],ax
  40332e:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  403331:	76 07                	jbe    40333a <_dirent_findfirst+0x6a>
  403333:	c7 43 08 18 00 00 00 	mov    DWORD PTR [ebx+0x8],0x18
  40333a:	8d 65 f8             	lea    esp,[ebp-0x8]
  40333d:	89 f0                	mov    eax,esi
  40333f:	5b                   	pop    ebx
  403340:	5e                   	pop    esi
  403341:	5d                   	pop    ebp
  403342:	c3                   	ret    
  403343:	e8 78 4e 00 00       	call   4081c0 <__errno>
  403348:	89 c3                	mov    ebx,eax
  40334a:	e8 11 4f 00 00       	call   408260 <_GetLastError@0>
  40334f:	83 f8 03             	cmp    eax,0x3
  403352:	89 03                	mov    DWORD PTR [ebx],eax
  403354:	74 2a                	je     403380 <_dirent_findfirst+0xb0>
  403356:	e8 65 4e 00 00       	call   4081c0 <__errno>
  40335b:	81 38 0b 01 00 00    	cmp    DWORD PTR [eax],0x10b
  403361:	74 2d                	je     403390 <_dirent_findfirst+0xc0>
  403363:	e8 58 4e 00 00       	call   4081c0 <__errno>
  403368:	83 38 02             	cmp    DWORD PTR [eax],0x2
  40336b:	74 cd                	je     40333a <_dirent_findfirst+0x6a>
  40336d:	8d 76 00             	lea    esi,[esi+0x0]
  403370:	e8 4b 4e 00 00       	call   4081c0 <__errno>
  403375:	c7 00 16 00 00 00    	mov    DWORD PTR [eax],0x16
  40337b:	eb bd                	jmp    40333a <_dirent_findfirst+0x6a>
  40337d:	8d 76 00             	lea    esi,[esi+0x0]
  403380:	e8 3b 4e 00 00       	call   4081c0 <__errno>
  403385:	c7 00 02 00 00 00    	mov    DWORD PTR [eax],0x2
  40338b:	eb ad                	jmp    40333a <_dirent_findfirst+0x6a>
  40338d:	8d 76 00             	lea    esi,[esi+0x0]
  403390:	e8 2b 4e 00 00       	call   4081c0 <__errno>
  403395:	c7 00 14 00 00 00    	mov    DWORD PTR [eax],0x14
  40339b:	eb 9d                	jmp    40333a <_dirent_findfirst+0x6a>
  40339d:	8d 76 00             	lea    esi,[esi+0x0]

004033a0 <___mingw_opendir>:
  4033a0:	55                   	push   ebp
  4033a1:	57                   	push   edi
  4033a2:	56                   	push   esi
  4033a3:	53                   	push   ebx
  4033a4:	81 ec 2c 01 00 00    	sub    esp,0x12c
  4033aa:	8b 84 24 40 01 00 00 	mov    eax,DWORD PTR [esp+0x140]
  4033b1:	85 c0                	test   eax,eax
  4033b3:	0f 84 67 01 00 00    	je     403520 <___mingw_opendir+0x180>
  4033b9:	80 38 00             	cmp    BYTE PTR [eax],0x0
  4033bc:	0f 84 40 01 00 00    	je     403502 <___mingw_opendir+0x162>
  4033c2:	8d 7c 24 1c          	lea    edi,[esp+0x1c]
  4033c6:	c7 44 24 08 04 01 00 	mov    DWORD PTR [esp+0x8],0x104
  4033cd:	00 
  4033ce:	89 fb                	mov    ebx,edi
  4033d0:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4033d4:	89 3c 24             	mov    DWORD PTR [esp],edi
  4033d7:	e8 04 4e 00 00       	call   4081e0 <__fullpath>
  4033dc:	80 7c 24 1c 00       	cmp    BYTE PTR [esp+0x1c],0x0
  4033e1:	74 5d                	je     403440 <___mingw_opendir+0xa0>
  4033e3:	8b 13                	mov    edx,DWORD PTR [ebx]
  4033e5:	83 c3 04             	add    ebx,0x4
  4033e8:	8d 82 ff fe fe fe    	lea    eax,[edx-0x1010101]
  4033ee:	f7 d2                	not    edx
  4033f0:	21 d0                	and    eax,edx
  4033f2:	25 80 80 80 80       	and    eax,0x80808080
  4033f7:	74 ea                	je     4033e3 <___mingw_opendir+0x43>
  4033f9:	a9 80 80 00 00       	test   eax,0x8080
  4033fe:	0f 84 df 00 00 00    	je     4034e3 <___mingw_opendir+0x143>
  403404:	00 c0                	add    al,al
  403406:	83 db 03             	sbb    ebx,0x3
  403409:	29 fb                	sub    ebx,edi
  40340b:	0f b6 44 1c 1b       	movzx  eax,BYTE PTR [esp+ebx*1+0x1b]
  403410:	3c 5c                	cmp    al,0x5c
  403412:	74 50                	je     403464 <___mingw_opendir+0xc4>
  403414:	3c 2f                	cmp    al,0x2f
  403416:	74 4c                	je     403464 <___mingw_opendir+0xc4>
  403418:	b9 5c 00 00 00       	mov    ecx,0x5c
  40341d:	66 89 0c 1f          	mov    WORD PTR [edi+ebx*1],cx
  403421:	89 fb                	mov    ebx,edi
  403423:	8b 13                	mov    edx,DWORD PTR [ebx]
  403425:	83 c3 04             	add    ebx,0x4
  403428:	8d 82 ff fe fe fe    	lea    eax,[edx-0x1010101]
  40342e:	f7 d2                	not    edx
  403430:	21 d0                	and    eax,edx
  403432:	25 80 80 80 80       	and    eax,0x80808080
  403437:	74 ea                	je     403423 <___mingw_opendir+0x83>
  403439:	eb 1b                	jmp    403456 <___mingw_opendir+0xb6>
  40343b:	90                   	nop
  40343c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403440:	8b 13                	mov    edx,DWORD PTR [ebx]
  403442:	83 c3 04             	add    ebx,0x4
  403445:	8d 82 ff fe fe fe    	lea    eax,[edx-0x1010101]
  40344b:	f7 d2                	not    edx
  40344d:	21 d0                	and    eax,edx
  40344f:	25 80 80 80 80       	and    eax,0x80808080
  403454:	74 ea                	je     403440 <___mingw_opendir+0xa0>
  403456:	a9 80 80 00 00       	test   eax,0x8080
  40345b:	74 7b                	je     4034d8 <___mingw_opendir+0x138>
  40345d:	00 c0                	add    al,al
  40345f:	83 db 03             	sbb    ebx,0x3
  403462:	29 fb                	sub    ebx,edi
  403464:	ba 2a 00 00 00       	mov    edx,0x2a
  403469:	8d 83 1d 01 00 00    	lea    eax,[ebx+0x11d]
  40346f:	66 89 14 1f          	mov    WORD PTR [edi+ebx*1],dx
  403473:	89 04 24             	mov    DWORD PTR [esp],eax
  403476:	e8 25 4d 00 00       	call   4081a0 <_malloc>
  40347b:	85 c0                	test   eax,eax
  40347d:	89 c6                	mov    esi,eax
  40347f:	0f 84 8c 00 00 00    	je     403511 <___mingw_opendir+0x171>
  403485:	8d a8 18 01 00 00    	lea    ebp,[eax+0x118]
  40348b:	83 c3 02             	add    ebx,0x2
  40348e:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  403492:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  403496:	89 2c 24             	mov    DWORD PTR [esp],ebp
  403499:	e8 ea 4c 00 00       	call   408188 <_memcpy>
  40349e:	89 f2                	mov    edx,esi
  4034a0:	89 e8                	mov    eax,ebp
  4034a2:	e8 29 fe ff ff       	call   4032d0 <_dirent_findfirst>
  4034a7:	83 f8 ff             	cmp    eax,0xffffffff
  4034aa:	89 86 10 01 00 00    	mov    DWORD PTR [esi+0x110],eax
  4034b0:	74 7d                	je     40352f <___mingw_opendir+0x18f>
  4034b2:	b8 10 01 00 00       	mov    eax,0x110
  4034b7:	66 89 46 04          	mov    WORD PTR [esi+0x4],ax
  4034bb:	89 f0                	mov    eax,esi
  4034bd:	c7 86 14 01 00 00 00 	mov    DWORD PTR [esi+0x114],0x0
  4034c4:	00 00 00 
  4034c7:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
  4034cd:	81 c4 2c 01 00 00    	add    esp,0x12c
  4034d3:	5b                   	pop    ebx
  4034d4:	5e                   	pop    esi
  4034d5:	5f                   	pop    edi
  4034d6:	5d                   	pop    ebp
  4034d7:	c3                   	ret    
  4034d8:	c1 e8 10             	shr    eax,0x10
  4034db:	83 c3 02             	add    ebx,0x2
  4034de:	e9 7a ff ff ff       	jmp    40345d <___mingw_opendir+0xbd>
  4034e3:	c1 e8 10             	shr    eax,0x10
  4034e6:	83 c3 02             	add    ebx,0x2
  4034e9:	00 c0                	add    al,al
  4034eb:	83 db 03             	sbb    ebx,0x3
  4034ee:	29 fb                	sub    ebx,edi
  4034f0:	0f b6 44 1c 1b       	movzx  eax,BYTE PTR [esp+ebx*1+0x1b]
  4034f5:	3c 5c                	cmp    al,0x5c
  4034f7:	0f 84 67 ff ff ff    	je     403464 <___mingw_opendir+0xc4>
  4034fd:	e9 12 ff ff ff       	jmp    403414 <___mingw_opendir+0x74>
  403502:	e8 b9 4c 00 00       	call   4081c0 <__errno>
  403507:	c7 00 02 00 00 00    	mov    DWORD PTR [eax],0x2
  40350d:	31 c0                	xor    eax,eax
  40350f:	eb bc                	jmp    4034cd <___mingw_opendir+0x12d>
  403511:	e8 aa 4c 00 00       	call   4081c0 <__errno>
  403516:	c7 00 0c 00 00 00    	mov    DWORD PTR [eax],0xc
  40351c:	31 c0                	xor    eax,eax
  40351e:	eb ad                	jmp    4034cd <___mingw_opendir+0x12d>
  403520:	e8 9b 4c 00 00       	call   4081c0 <__errno>
  403525:	c7 00 16 00 00 00    	mov    DWORD PTR [eax],0x16
  40352b:	31 c0                	xor    eax,eax
  40352d:	eb 9e                	jmp    4034cd <___mingw_opendir+0x12d>
  40352f:	89 34 24             	mov    DWORD PTR [esp],esi
  403532:	e8 61 4c 00 00       	call   408198 <_free>
  403537:	31 c0                	xor    eax,eax
  403539:	eb 92                	jmp    4034cd <___mingw_opendir+0x12d>
  40353b:	90                   	nop
  40353c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00403540 <___mingw_readdir>:
  403540:	53                   	push   ebx
  403541:	83 ec 08             	sub    esp,0x8
  403544:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
  403548:	85 db                	test   ebx,ebx
  40354a:	74 2b                	je     403577 <___mingw_readdir+0x37>
  40354c:	8b 83 14 01 00 00    	mov    eax,DWORD PTR [ebx+0x114]
  403552:	8d 50 01             	lea    edx,[eax+0x1]
  403555:	85 c0                	test   eax,eax
  403557:	89 93 14 01 00 00    	mov    DWORD PTR [ebx+0x114],edx
  40355d:	7e 11                	jle    403570 <___mingw_readdir+0x30>
  40355f:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  403565:	89 da                	mov    edx,ebx
  403567:	e8 c4 fc ff ff       	call   403230 <_dirent_findnext>
  40356c:	85 c0                	test   eax,eax
  40356e:	74 02                	je     403572 <___mingw_readdir+0x32>
  403570:	89 d8                	mov    eax,ebx
  403572:	83 c4 08             	add    esp,0x8
  403575:	5b                   	pop    ebx
  403576:	c3                   	ret    
  403577:	e8 44 4c 00 00       	call   4081c0 <__errno>
  40357c:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  403582:	31 c0                	xor    eax,eax
  403584:	eb ec                	jmp    403572 <___mingw_readdir+0x32>
  403586:	8d 76 00             	lea    esi,[esi+0x0]
  403589:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00403590 <___mingw_closedir>:
  403590:	55                   	push   ebp
  403591:	89 e5                	mov    ebp,esp
  403593:	53                   	push   ebx
  403594:	83 ec 14             	sub    esp,0x14
  403597:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  40359a:	85 db                	test   ebx,ebx
  40359c:	74 24                	je     4035c2 <___mingw_closedir+0x32>
  40359e:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  4035a4:	89 04 24             	mov    DWORD PTR [esp],eax
  4035a7:	e8 e4 4c 00 00       	call   408290 <_FindClose@4>
  4035ac:	83 ec 04             	sub    esp,0x4
  4035af:	85 c0                	test   eax,eax
  4035b1:	74 0f                	je     4035c2 <___mingw_closedir+0x32>
  4035b3:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4035b6:	e8 dd 4b 00 00       	call   408198 <_free>
  4035bb:	31 c0                	xor    eax,eax
  4035bd:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  4035c0:	c9                   	leave  
  4035c1:	c3                   	ret    
  4035c2:	e8 f9 4b 00 00       	call   4081c0 <__errno>
  4035c7:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  4035cd:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4035d2:	eb e9                	jmp    4035bd <___mingw_closedir+0x2d>
  4035d4:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4035da:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

004035e0 <___mingw_rewinddir>:
  4035e0:	55                   	push   ebp
  4035e1:	89 e5                	mov    ebp,esp
  4035e3:	53                   	push   ebx
  4035e4:	83 ec 14             	sub    esp,0x14
  4035e7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  4035ea:	85 db                	test   ebx,ebx
  4035ec:	74 15                	je     403603 <___mingw_rewinddir+0x23>
  4035ee:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  4035f4:	89 04 24             	mov    DWORD PTR [esp],eax
  4035f7:	e8 94 4c 00 00       	call   408290 <_FindClose@4>
  4035fc:	83 ec 04             	sub    esp,0x4
  4035ff:	85 c0                	test   eax,eax
  403601:	75 10                	jne    403613 <___mingw_rewinddir+0x33>
  403603:	e8 b8 4b 00 00       	call   4081c0 <__errno>
  403608:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  40360e:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  403611:	c9                   	leave  
  403612:	c3                   	ret    
  403613:	8d 83 18 01 00 00    	lea    eax,[ebx+0x118]
  403619:	89 da                	mov    edx,ebx
  40361b:	e8 b0 fc ff ff       	call   4032d0 <_dirent_findfirst>
  403620:	83 f8 ff             	cmp    eax,0xffffffff
  403623:	89 83 10 01 00 00    	mov    DWORD PTR [ebx+0x110],eax
  403629:	74 e3                	je     40360e <___mingw_rewinddir+0x2e>
  40362b:	c7 83 14 01 00 00 00 	mov    DWORD PTR [ebx+0x114],0x0
  403632:	00 00 00 
  403635:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  403638:	c9                   	leave  
  403639:	c3                   	ret    
  40363a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

00403640 <___mingw_telldir>:
  403640:	83 ec 0c             	sub    esp,0xc
  403643:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  403647:	85 c0                	test   eax,eax
  403649:	74 0a                	je     403655 <___mingw_telldir+0x15>
  40364b:	8b 80 14 01 00 00    	mov    eax,DWORD PTR [eax+0x114]
  403651:	83 c4 0c             	add    esp,0xc
  403654:	c3                   	ret    
  403655:	e8 66 4b 00 00       	call   4081c0 <__errno>
  40365a:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  403660:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403665:	eb ea                	jmp    403651 <___mingw_telldir+0x11>
  403667:	89 f6                	mov    esi,esi
  403669:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00403670 <___mingw_seekdir>:
  403670:	56                   	push   esi
  403671:	53                   	push   ebx
  403672:	83 ec 14             	sub    esp,0x14
  403675:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  403679:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
  40367d:	85 f6                	test   esi,esi
  40367f:	78 41                	js     4036c2 <___mingw_seekdir+0x52>
  403681:	89 1c 24             	mov    DWORD PTR [esp],ebx
  403684:	e8 57 ff ff ff       	call   4035e0 <___mingw_rewinddir>
  403689:	85 f6                	test   esi,esi
  40368b:	74 2f                	je     4036bc <___mingw_seekdir+0x4c>
  40368d:	83 bb 10 01 00 00 ff 	cmp    DWORD PTR [ebx+0x110],0xffffffff
  403694:	75 13                	jne    4036a9 <___mingw_seekdir+0x39>
  403696:	eb 24                	jmp    4036bc <___mingw_seekdir+0x4c>
  403698:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  40369e:	89 da                	mov    edx,ebx
  4036a0:	e8 8b fb ff ff       	call   403230 <_dirent_findnext>
  4036a5:	85 c0                	test   eax,eax
  4036a7:	74 13                	je     4036bc <___mingw_seekdir+0x4c>
  4036a9:	8b 83 14 01 00 00    	mov    eax,DWORD PTR [ebx+0x114]
  4036af:	83 c0 01             	add    eax,0x1
  4036b2:	39 c6                	cmp    esi,eax
  4036b4:	89 83 14 01 00 00    	mov    DWORD PTR [ebx+0x114],eax
  4036ba:	7f dc                	jg     403698 <___mingw_seekdir+0x28>
  4036bc:	83 c4 14             	add    esp,0x14
  4036bf:	5b                   	pop    ebx
  4036c0:	5e                   	pop    esi
  4036c1:	c3                   	ret    
  4036c2:	e8 f9 4a 00 00       	call   4081c0 <__errno>
  4036c7:	c7 00 16 00 00 00    	mov    DWORD PTR [eax],0x16
  4036cd:	83 c4 14             	add    esp,0x14
  4036d0:	5b                   	pop    ebx
  4036d1:	5e                   	pop    esi
  4036d2:	c3                   	ret    
  4036d3:	90                   	nop
  4036d4:	90                   	nop
  4036d5:	90                   	nop
  4036d6:	90                   	nop
  4036d7:	90                   	nop
  4036d8:	90                   	nop
  4036d9:	90                   	nop
  4036da:	90                   	nop
  4036db:	90                   	nop
  4036dc:	90                   	nop
  4036dd:	90                   	nop
  4036de:	90                   	nop
  4036df:	90                   	nop

004036e0 <___mingw_snprintf>:
  4036e0:	83 ec 1c             	sub    esp,0x1c
  4036e3:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4036e7:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4036eb:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4036ef:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4036f3:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  4036f7:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4036fb:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4036ff:	89 04 24             	mov    DWORD PTR [esp],eax
  403702:	e8 09 00 00 00       	call   403710 <___mingw_vsnprintf>
  403707:	83 c4 1c             	add    esp,0x1c
  40370a:	c3                   	ret    
  40370b:	90                   	nop
  40370c:	90                   	nop
  40370d:	90                   	nop
  40370e:	90                   	nop
  40370f:	90                   	nop

00403710 <___mingw_vsnprintf>:
  403710:	56                   	push   esi
  403711:	53                   	push   ebx
  403712:	83 ec 24             	sub    esp,0x24
  403715:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  403719:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  40371d:	8b 54 24 38          	mov    edx,DWORD PTR [esp+0x38]
  403721:	8b 4c 24 3c          	mov    ecx,DWORD PTR [esp+0x3c]
  403725:	85 c0                	test   eax,eax
  403727:	74 37                	je     403760 <___mingw_vsnprintf+0x50>
  403729:	8d 70 ff             	lea    esi,[eax-0x1]
  40372c:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  403730:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  403734:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  403738:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  40373c:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  403743:	e8 e8 15 00 00       	call   404d30 <___mingw_pformat>
  403748:	39 f0                	cmp    eax,esi
  40374a:	89 c2                	mov    edx,eax
  40374c:	77 0a                	ja     403758 <___mingw_vsnprintf+0x48>
  40374e:	c6 04 13 00          	mov    BYTE PTR [ebx+edx*1],0x0
  403752:	83 c4 24             	add    esp,0x24
  403755:	5b                   	pop    ebx
  403756:	5e                   	pop    esi
  403757:	c3                   	ret    
  403758:	89 f2                	mov    edx,esi
  40375a:	eb f2                	jmp    40374e <___mingw_vsnprintf+0x3e>
  40375c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403760:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  403764:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  403768:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  40376c:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  403773:	00 
  403774:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  40377b:	e8 b0 15 00 00       	call   404d30 <___mingw_pformat>
  403780:	83 c4 24             	add    esp,0x24
  403783:	5b                   	pop    ebx
  403784:	5e                   	pop    esi
  403785:	c3                   	ret    
  403786:	90                   	nop
  403787:	90                   	nop
  403788:	90                   	nop
  403789:	90                   	nop
  40378a:	90                   	nop
  40378b:	90                   	nop
  40378c:	90                   	nop
  40378d:	90                   	nop
  40378e:	90                   	nop
  40378f:	90                   	nop

00403790 <___pformat_cvt>:
  403790:	53                   	push   ebx
  403791:	89 c1                	mov    ecx,eax
  403793:	83 ec 48             	sub    esp,0x48
  403796:	8b 44 24 50          	mov    eax,DWORD PTR [esp+0x50]
  40379a:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  40379e:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  4037a2:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  4037a6:	8b 44 24 58          	mov    eax,DWORD PTR [esp+0x58]
  4037aa:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
  4037ae:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  4037b2:	db 6c 24 20          	fld    TBYTE PTR [esp+0x20]
  4037b6:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  4037ba:	d9 e5                	fxam   
  4037bc:	9b df e0             	fstsw  ax
  4037bf:	dd d8                	fstp   st(0)
  4037c1:	f6 c4 01             	test   ah,0x1
  4037c4:	74 1a                	je     4037e0 <___pformat_cvt+0x50>
  4037c6:	f6 c4 04             	test   ah,0x4
  4037c9:	0f 84 91 00 00 00    	je     403860 <___pformat_cvt+0xd0>
  4037cf:	c7 44 24 38 03 00 00 	mov    DWORD PTR [esp+0x38],0x3
  4037d6:	00 
  4037d7:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  4037dc:	31 c0                	xor    eax,eax
  4037de:	eb 14                	jmp    4037f4 <___pformat_cvt+0x64>
  4037e0:	f6 c4 04             	test   ah,0x4
  4037e3:	75 5c                	jne    403841 <___pformat_cvt+0xb1>
  4037e5:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  4037ea:	31 c0                	xor    eax,eax
  4037ec:	c7 44 24 38 00 00 00 	mov    DWORD PTR [esp+0x38],0x0
  4037f3:	00 
  4037f4:	81 e2 00 80 00 00    	and    edx,0x8000
  4037fa:	8b 5c 24 68          	mov    ebx,DWORD PTR [esp+0x68]
  4037fe:	89 13                	mov    DWORD PTR [ebx],edx
  403800:	8d 54 24 3c          	lea    edx,[esp+0x3c]
  403804:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  403808:	8b 54 24 64          	mov    edx,DWORD PTR [esp+0x64]
  40380c:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  403810:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  403814:	c7 04 24 0c 90 40 00 	mov    DWORD PTR [esp],0x40900c
  40381b:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  40381f:	8b 54 24 60          	mov    edx,DWORD PTR [esp+0x60]
  403823:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  403827:	8d 54 24 38          	lea    edx,[esp+0x38]
  40382b:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  40382f:	8d 54 24 20          	lea    edx,[esp+0x20]
  403833:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  403837:	e8 64 1e 00 00       	call   4056a0 <___gdtoa>
  40383c:	83 c4 48             	add    esp,0x48
  40383f:	5b                   	pop    ebx
  403840:	c3                   	ret    
  403841:	f6 c4 40             	test   ah,0x40
  403844:	74 2a                	je     403870 <___pformat_cvt+0xe0>
  403846:	c7 44 24 38 02 00 00 	mov    DWORD PTR [esp+0x38],0x2
  40384d:	00 
  40384e:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  403853:	b8 c3 bf ff ff       	mov    eax,0xffffbfc3
  403858:	eb 9a                	jmp    4037f4 <___pformat_cvt+0x64>
  40385a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  403860:	c7 44 24 38 04 00 00 	mov    DWORD PTR [esp+0x38],0x4
  403867:	00 
  403868:	31 c0                	xor    eax,eax
  40386a:	31 d2                	xor    edx,edx
  40386c:	eb 8c                	jmp    4037fa <___pformat_cvt+0x6a>
  40386e:	66 90                	xchg   ax,ax
  403870:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  403875:	c7 44 24 38 01 00 00 	mov    DWORD PTR [esp+0x38],0x1
  40387c:	00 
  40387d:	89 d0                	mov    eax,edx
  40387f:	25 ff 7f 00 00       	and    eax,0x7fff
  403884:	2d 3e 40 00 00       	sub    eax,0x403e
  403889:	e9 66 ff ff ff       	jmp    4037f4 <___pformat_cvt+0x64>
  40388e:	66 90                	xchg   ax,ax

00403890 <___pformat_putc>:
  403890:	53                   	push   ebx
  403891:	83 ec 18             	sub    esp,0x18
  403894:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
  403897:	f6 c5 20             	test   ch,0x20
  40389a:	75 08                	jne    4038a4 <___pformat_putc+0x14>
  40389c:	8b 5a 18             	mov    ebx,DWORD PTR [edx+0x18]
  40389f:	39 5a 1c             	cmp    DWORD PTR [edx+0x1c],ebx
  4038a2:	7e 10                	jle    4038b4 <___pformat_putc+0x24>
  4038a4:	80 e5 10             	and    ch,0x10
  4038a7:	75 17                	jne    4038c0 <___pformat_putc+0x30>
  4038a9:	8b 1a                	mov    ebx,DWORD PTR [edx]
  4038ab:	8b 4a 18             	mov    ecx,DWORD PTR [edx+0x18]
  4038ae:	88 04 0b             	mov    BYTE PTR [ebx+ecx*1],al
  4038b1:	8b 5a 18             	mov    ebx,DWORD PTR [edx+0x18]
  4038b4:	83 c3 01             	add    ebx,0x1
  4038b7:	89 5a 18             	mov    DWORD PTR [edx+0x18],ebx
  4038ba:	83 c4 18             	add    esp,0x18
  4038bd:	5b                   	pop    ebx
  4038be:	c3                   	ret    
  4038bf:	90                   	nop
  4038c0:	8b 0a                	mov    ecx,DWORD PTR [edx]
  4038c2:	89 04 24             	mov    DWORD PTR [esp],eax
  4038c5:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  4038c9:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  4038cd:	e8 16 49 00 00       	call   4081e8 <_fputc>
  4038d2:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  4038d6:	8b 5a 18             	mov    ebx,DWORD PTR [edx+0x18]
  4038d9:	83 c3 01             	add    ebx,0x1
  4038dc:	89 5a 18             	mov    DWORD PTR [edx+0x18],ebx
  4038df:	83 c4 18             	add    esp,0x18
  4038e2:	5b                   	pop    ebx
  4038e3:	c3                   	ret    
  4038e4:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4038ea:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

004038f0 <___pformat_wputchars>:
  4038f0:	55                   	push   ebp
  4038f1:	57                   	push   edi
  4038f2:	56                   	push   esi
  4038f3:	89 d6                	mov    esi,edx
  4038f5:	53                   	push   ebx
  4038f6:	89 cb                	mov    ebx,ecx
  4038f8:	83 ec 4c             	sub    esp,0x4c
  4038fb:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  4038ff:	8d 6c 24 30          	lea    ebp,[esp+0x30]
  403903:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  403907:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40390b:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  403912:	00 
  403913:	89 2c 24             	mov    DWORD PTR [esp],ebp
  403916:	e8 b5 32 00 00       	call   406bd0 <_wcrtomb>
  40391b:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
  40391e:	85 c0                	test   eax,eax
  403920:	78 08                	js     40392a <___pformat_wputchars+0x3a>
  403922:	39 c6                	cmp    esi,eax
  403924:	0f 8f c7 00 00 00    	jg     4039f1 <___pformat_wputchars+0x101>
  40392a:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  40392d:	39 c6                	cmp    esi,eax
  40392f:	0f 8d 8c 00 00 00    	jge    4039c1 <___pformat_wputchars+0xd1>
  403935:	29 f0                	sub    eax,esi
  403937:	85 c0                	test   eax,eax
  403939:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  40393c:	7e 0a                	jle    403948 <___pformat_wputchars+0x58>
  40393e:	f6 43 05 04          	test   BYTE PTR [ebx+0x5],0x4
  403942:	0f 84 85 00 00 00    	je     4039cd <___pformat_wputchars+0xdd>
  403948:	89 74 24 1c          	mov    DWORD PTR [esp+0x1c],esi
  40394c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403950:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  403954:	85 c0                	test   eax,eax
  403956:	7e 54                	jle    4039ac <___pformat_wputchars+0xbc>
  403958:	83 44 24 18 02       	add    DWORD PTR [esp+0x18],0x2
  40395d:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  403961:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  403965:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  403969:	0f b7 40 fe          	movzx  eax,WORD PTR [eax-0x2]
  40396d:	89 2c 24             	mov    DWORD PTR [esp],ebp
  403970:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  403974:	e8 57 32 00 00       	call   406bd0 <_wcrtomb>
  403979:	85 c0                	test   eax,eax
  40397b:	7e 2f                	jle    4039ac <___pformat_wputchars+0xbc>
  40397d:	8d 74 05 00          	lea    esi,[ebp+eax*1+0x0]
  403981:	89 ef                	mov    edi,ebp
  403983:	83 c7 01             	add    edi,0x1
  403986:	0f be 47 ff          	movsx  eax,BYTE PTR [edi-0x1]
  40398a:	89 da                	mov    edx,ebx
  40398c:	e8 ff fe ff ff       	call   403890 <___pformat_putc>
  403991:	39 f7                	cmp    edi,esi
  403993:	75 ee                	jne    403983 <___pformat_wputchars+0x93>
  403995:	83 6c 24 1c 01       	sub    DWORD PTR [esp+0x1c],0x1
  40399a:	eb b4                	jmp    403950 <___pformat_wputchars+0x60>
  40399c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4039a0:	89 da                	mov    edx,ebx
  4039a2:	b8 20 00 00 00       	mov    eax,0x20
  4039a7:	e8 e4 fe ff ff       	call   403890 <___pformat_putc>
  4039ac:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4039af:	8d 50 ff             	lea    edx,[eax-0x1]
  4039b2:	85 c0                	test   eax,eax
  4039b4:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  4039b7:	7f e7                	jg     4039a0 <___pformat_wputchars+0xb0>
  4039b9:	83 c4 4c             	add    esp,0x4c
  4039bc:	5b                   	pop    ebx
  4039bd:	5e                   	pop    esi
  4039be:	5f                   	pop    edi
  4039bf:	5d                   	pop    ebp
  4039c0:	c3                   	ret    
  4039c1:	c7 43 08 ff ff ff ff 	mov    DWORD PTR [ebx+0x8],0xffffffff
  4039c8:	e9 7b ff ff ff       	jmp    403948 <___pformat_wputchars+0x58>
  4039cd:	83 e8 01             	sub    eax,0x1
  4039d0:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  4039d3:	89 da                	mov    edx,ebx
  4039d5:	b8 20 00 00 00       	mov    eax,0x20
  4039da:	e8 b1 fe ff ff       	call   403890 <___pformat_putc>
  4039df:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4039e2:	8d 50 ff             	lea    edx,[eax-0x1]
  4039e5:	85 c0                	test   eax,eax
  4039e7:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  4039ea:	75 e7                	jne    4039d3 <___pformat_wputchars+0xe3>
  4039ec:	e9 57 ff ff ff       	jmp    403948 <___pformat_wputchars+0x58>
  4039f1:	89 c6                	mov    esi,eax
  4039f3:	e9 32 ff ff ff       	jmp    40392a <___pformat_wputchars+0x3a>
  4039f8:	90                   	nop
  4039f9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00403a00 <___pformat_putchars>:
  403a00:	57                   	push   edi
  403a01:	89 c7                	mov    edi,eax
  403a03:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
  403a06:	56                   	push   esi
  403a07:	89 d6                	mov    esi,edx
  403a09:	53                   	push   ebx
  403a0a:	89 cb                	mov    ebx,ecx
  403a0c:	85 c0                	test   eax,eax
  403a0e:	78 08                	js     403a18 <___pformat_putchars+0x18>
  403a10:	39 c2                	cmp    edx,eax
  403a12:	0f 8f 88 00 00 00    	jg     403aa0 <___pformat_putchars+0xa0>
  403a18:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403a1b:	39 c6                	cmp    esi,eax
  403a1d:	7d 71                	jge    403a90 <___pformat_putchars+0x90>
  403a1f:	29 f0                	sub    eax,esi
  403a21:	85 c0                	test   eax,eax
  403a23:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  403a26:	7e 25                	jle    403a4d <___pformat_putchars+0x4d>
  403a28:	f6 43 05 04          	test   BYTE PTR [ebx+0x5],0x4
  403a2c:	75 1f                	jne    403a4d <___pformat_putchars+0x4d>
  403a2e:	83 e8 01             	sub    eax,0x1
  403a31:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  403a34:	89 da                	mov    edx,ebx
  403a36:	b8 20 00 00 00       	mov    eax,0x20
  403a3b:	e8 50 fe ff ff       	call   403890 <___pformat_putc>
  403a40:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403a43:	8d 50 ff             	lea    edx,[eax-0x1]
  403a46:	85 c0                	test   eax,eax
  403a48:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403a4b:	75 e7                	jne    403a34 <___pformat_putchars+0x34>
  403a4d:	85 f6                	test   esi,esi
  403a4f:	74 2c                	je     403a7d <___pformat_putchars+0x7d>
  403a51:	83 c7 01             	add    edi,0x1
  403a54:	0f be 47 ff          	movsx  eax,BYTE PTR [edi-0x1]
  403a58:	89 da                	mov    edx,ebx
  403a5a:	e8 31 fe ff ff       	call   403890 <___pformat_putc>
  403a5f:	83 ee 01             	sub    esi,0x1
  403a62:	75 ed                	jne    403a51 <___pformat_putchars+0x51>
  403a64:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403a67:	8d 50 ff             	lea    edx,[eax-0x1]
  403a6a:	85 c0                	test   eax,eax
  403a6c:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403a6f:	7e 19                	jle    403a8a <___pformat_putchars+0x8a>
  403a71:	89 da                	mov    edx,ebx
  403a73:	b8 20 00 00 00       	mov    eax,0x20
  403a78:	e8 13 fe ff ff       	call   403890 <___pformat_putc>
  403a7d:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403a80:	8d 50 ff             	lea    edx,[eax-0x1]
  403a83:	85 c0                	test   eax,eax
  403a85:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403a88:	7f e7                	jg     403a71 <___pformat_putchars+0x71>
  403a8a:	5b                   	pop    ebx
  403a8b:	5e                   	pop    esi
  403a8c:	5f                   	pop    edi
  403a8d:	c3                   	ret    
  403a8e:	66 90                	xchg   ax,ax
  403a90:	c7 43 08 ff ff ff ff 	mov    DWORD PTR [ebx+0x8],0xffffffff
  403a97:	eb b4                	jmp    403a4d <___pformat_putchars+0x4d>
  403a99:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  403aa0:	89 c6                	mov    esi,eax
  403aa2:	e9 71 ff ff ff       	jmp    403a18 <___pformat_putchars+0x18>
  403aa7:	89 f6                	mov    esi,esi
  403aa9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00403ab0 <___pformat_emit_inf_or_nan>:
  403ab0:	55                   	push   ebp
  403ab1:	57                   	push   edi
  403ab2:	56                   	push   esi
  403ab3:	53                   	push   ebx
  403ab4:	83 ec 1c             	sub    esp,0x1c
  403ab7:	85 c0                	test   eax,eax
  403ab9:	c7 41 0c ff ff ff ff 	mov    DWORD PTR [ecx+0xc],0xffffffff
  403ac0:	74 3e                	je     403b00 <___pformat_emit_inf_or_nan+0x50>
  403ac2:	8b 69 04             	mov    ebp,DWORD PTR [ecx+0x4]
  403ac5:	8d 7c 24 0d          	lea    edi,[esp+0xd]
  403ac9:	c6 44 24 0c 2d       	mov    BYTE PTR [esp+0xc],0x2d
  403ace:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403ad2:	83 e5 20             	and    ebp,0x20
  403ad5:	31 f6                	xor    esi,esi
  403ad7:	0f b6 1c 32          	movzx  ebx,BYTE PTR [edx+esi*1]
  403adb:	83 e3 df             	and    ebx,0xffffffdf
  403ade:	09 eb                	or     ebx,ebp
  403ae0:	88 1c 37             	mov    BYTE PTR [edi+esi*1],bl
  403ae3:	83 c6 01             	add    esi,0x1
  403ae6:	83 fe 03             	cmp    esi,0x3
  403ae9:	75 ec                	jne    403ad7 <___pformat_emit_inf_or_nan+0x27>
  403aeb:	8d 57 03             	lea    edx,[edi+0x3]
  403aee:	29 c2                	sub    edx,eax
  403af0:	e8 0b ff ff ff       	call   403a00 <___pformat_putchars>
  403af5:	83 c4 1c             	add    esp,0x1c
  403af8:	5b                   	pop    ebx
  403af9:	5e                   	pop    esi
  403afa:	5f                   	pop    edi
  403afb:	5d                   	pop    ebp
  403afc:	c3                   	ret    
  403afd:	8d 76 00             	lea    esi,[esi+0x0]
  403b00:	8b 69 04             	mov    ebp,DWORD PTR [ecx+0x4]
  403b03:	f7 c5 00 01 00 00    	test   ebp,0x100
  403b09:	74 15                	je     403b20 <___pformat_emit_inf_or_nan+0x70>
  403b0b:	c6 44 24 0c 2b       	mov    BYTE PTR [esp+0xc],0x2b
  403b10:	8d 7c 24 0d          	lea    edi,[esp+0xd]
  403b14:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403b18:	eb b8                	jmp    403ad2 <___pformat_emit_inf_or_nan+0x22>
  403b1a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  403b20:	f7 c5 40 00 00 00    	test   ebp,0x40
  403b26:	74 0f                	je     403b37 <___pformat_emit_inf_or_nan+0x87>
  403b28:	c6 44 24 0c 20       	mov    BYTE PTR [esp+0xc],0x20
  403b2d:	8d 7c 24 0d          	lea    edi,[esp+0xd]
  403b31:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403b35:	eb 9b                	jmp    403ad2 <___pformat_emit_inf_or_nan+0x22>
  403b37:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403b3b:	89 c7                	mov    edi,eax
  403b3d:	eb 93                	jmp    403ad2 <___pformat_emit_inf_or_nan+0x22>
  403b3f:	90                   	nop

00403b40 <___pformat_int>:
  403b40:	55                   	push   ebp
  403b41:	89 e5                	mov    ebp,esp
  403b43:	57                   	push   edi
  403b44:	89 d7                	mov    edi,edx
  403b46:	56                   	push   esi
  403b47:	89 c6                	mov    esi,eax
  403b49:	53                   	push   ebx
  403b4a:	89 cb                	mov    ebx,ecx
  403b4c:	83 ec 2c             	sub    esp,0x2c
  403b4f:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
  403b52:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  403b55:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  403b58:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  403b5b:	89 d0                	mov    eax,edx
  403b5d:	c1 f8 1f             	sar    eax,0x1f
  403b60:	f7 d0                	not    eax
  403b62:	21 d0                	and    eax,edx
  403b64:	83 c0 17             	add    eax,0x17
  403b67:	39 c8                	cmp    eax,ecx
  403b69:	7d 02                	jge    403b6d <___pformat_int+0x2d>
  403b6b:	89 c8                	mov    eax,ecx
  403b6d:	83 c0 0f             	add    eax,0xf
  403b70:	83 e0 f0             	and    eax,0xfffffff0
  403b73:	e8 a8 e5 ff ff       	call   402120 <___chkstk_ms>
  403b78:	29 c4                	sub    esp,eax
  403b7a:	8d 44 24 10          	lea    eax,[esp+0x10]
  403b7e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  403b81:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  403b84:	a8 80                	test   al,0x80
  403b86:	74 0d                	je     403b95 <___pformat_int+0x55>
  403b88:	85 ff                	test   edi,edi
  403b8a:	0f 88 b0 01 00 00    	js     403d40 <___pformat_int+0x200>
  403b90:	24 7f                	and    al,0x7f
  403b92:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
  403b95:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  403b98:	8b 7d d8             	mov    edi,DWORD PTR [ebp-0x28]
  403b9b:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
  403b9e:	89 c8                	mov    eax,ecx
  403ba0:	09 f8                	or     eax,edi
  403ba2:	74 5d                	je     403c01 <___pformat_int+0xc1>
  403ba4:	89 5d d8             	mov    DWORD PTR [ebp-0x28],ebx
  403ba7:	89 cb                	mov    ebx,ecx
  403ba9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  403bb0:	89 3c 24             	mov    DWORD PTR [esp],edi
  403bb3:	83 c6 01             	add    esi,0x1
  403bb6:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  403bba:	c7 44 24 08 0a 00 00 	mov    DWORD PTR [esp+0x8],0xa
  403bc1:	00 
  403bc2:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  403bc9:	00 
  403bca:	e8 f1 46 00 00       	call   4082c0 <___umoddi3>
  403bcf:	83 c0 30             	add    eax,0x30
  403bd2:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  403bd5:	89 3c 24             	mov    DWORD PTR [esp],edi
  403bd8:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  403bdc:	c7 44 24 08 0a 00 00 	mov    DWORD PTR [esp+0x8],0xa
  403be3:	00 
  403be4:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  403beb:	00 
  403bec:	e8 1f 48 00 00       	call   408410 <___udivdi3>
  403bf1:	89 c7                	mov    edi,eax
  403bf3:	89 d0                	mov    eax,edx
  403bf5:	09 f8                	or     eax,edi
  403bf7:	89 d3                	mov    ebx,edx
  403bf9:	75 b5                	jne    403bb0 <___pformat_int+0x70>
  403bfb:	8b 5d d8             	mov    ebx,DWORD PTR [ebp-0x28]
  403bfe:	8b 53 0c             	mov    edx,DWORD PTR [ebx+0xc]
  403c01:	85 d2                	test   edx,edx
  403c03:	89 f7                	mov    edi,esi
  403c05:	7e 19                	jle    403c20 <___pformat_int+0xe0>
  403c07:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403c0a:	29 f0                	sub    eax,esi
  403c0c:	01 c2                	add    edx,eax
  403c0e:	85 d2                	test   edx,edx
  403c10:	7e 0e                	jle    403c20 <___pformat_int+0xe0>
  403c12:	8d 3c 16             	lea    edi,[esi+edx*1]
  403c15:	83 c6 01             	add    esi,0x1
  403c18:	39 fe                	cmp    esi,edi
  403c1a:	c6 46 ff 30          	mov    BYTE PTR [esi-0x1],0x30
  403c1e:	75 f5                	jne    403c15 <___pformat_int+0xd5>
  403c20:	3b 7d e4             	cmp    edi,DWORD PTR [ebp-0x1c]
  403c23:	0f 84 29 01 00 00    	je     403d52 <___pformat_int+0x212>
  403c29:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403c2c:	85 c0                	test   eax,eax
  403c2e:	7e 59                	jle    403c89 <___pformat_int+0x149>
  403c30:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  403c33:	29 fa                	sub    edx,edi
  403c35:	01 c2                	add    edx,eax
  403c37:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  403c3a:	85 d2                	test   edx,edx
  403c3c:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403c3f:	7e 4b                	jle    403c8c <___pformat_int+0x14c>
  403c41:	a9 c0 01 00 00       	test   eax,0x1c0
  403c46:	74 06                	je     403c4e <___pformat_int+0x10e>
  403c48:	83 ea 01             	sub    edx,0x1
  403c4b:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403c4e:	8b 53 0c             	mov    edx,DWORD PTR [ebx+0xc]
  403c51:	85 d2                	test   edx,edx
  403c53:	0f 88 a7 00 00 00    	js     403d00 <___pformat_int+0x1c0>
  403c59:	f6 c4 04             	test   ah,0x4
  403c5c:	75 2e                	jne    403c8c <___pformat_int+0x14c>
  403c5e:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  403c61:	8d 4a ff             	lea    ecx,[edx-0x1]
  403c64:	85 d2                	test   edx,edx
  403c66:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  403c69:	7e 21                	jle    403c8c <___pformat_int+0x14c>
  403c6b:	90                   	nop
  403c6c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403c70:	89 da                	mov    edx,ebx
  403c72:	b8 20 00 00 00       	mov    eax,0x20
  403c77:	e8 14 fc ff ff       	call   403890 <___pformat_putc>
  403c7c:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403c7f:	8d 50 ff             	lea    edx,[eax-0x1]
  403c82:	85 c0                	test   eax,eax
  403c84:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403c87:	7f e7                	jg     403c70 <___pformat_int+0x130>
  403c89:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  403c8c:	a8 80                	test   al,0x80
  403c8e:	74 51                	je     403ce1 <___pformat_int+0x1a1>
  403c90:	8d 77 01             	lea    esi,[edi+0x1]
  403c93:	c6 07 2d             	mov    BYTE PTR [edi],0x2d
  403c96:	39 75 e4             	cmp    DWORD PTR [ebp-0x1c],esi
  403c99:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
  403c9c:	73 2e                	jae    403ccc <___pformat_int+0x18c>
  403c9e:	66 90                	xchg   ax,ax
  403ca0:	83 ee 01             	sub    esi,0x1
  403ca3:	0f be 06             	movsx  eax,BYTE PTR [esi]
  403ca6:	89 da                	mov    edx,ebx
  403ca8:	e8 e3 fb ff ff       	call   403890 <___pformat_putc>
  403cad:	39 fe                	cmp    esi,edi
  403caf:	75 ef                	jne    403ca0 <___pformat_int+0x160>
  403cb1:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403cb4:	8d 50 ff             	lea    edx,[eax-0x1]
  403cb7:	85 c0                	test   eax,eax
  403cb9:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403cbc:	7e 1b                	jle    403cd9 <___pformat_int+0x199>
  403cbe:	66 90                	xchg   ax,ax
  403cc0:	89 da                	mov    edx,ebx
  403cc2:	b8 20 00 00 00       	mov    eax,0x20
  403cc7:	e8 c4 fb ff ff       	call   403890 <___pformat_putc>
  403ccc:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403ccf:	8d 50 ff             	lea    edx,[eax-0x1]
  403cd2:	85 c0                	test   eax,eax
  403cd4:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403cd7:	7f e7                	jg     403cc0 <___pformat_int+0x180>
  403cd9:	8d 65 f4             	lea    esp,[ebp-0xc]
  403cdc:	5b                   	pop    ebx
  403cdd:	5e                   	pop    esi
  403cde:	5f                   	pop    edi
  403cdf:	5d                   	pop    ebp
  403ce0:	c3                   	ret    
  403ce1:	f6 c4 01             	test   ah,0x1
  403ce4:	74 0a                	je     403cf0 <___pformat_int+0x1b0>
  403ce6:	8d 77 01             	lea    esi,[edi+0x1]
  403ce9:	c6 07 2b             	mov    BYTE PTR [edi],0x2b
  403cec:	eb a8                	jmp    403c96 <___pformat_int+0x156>
  403cee:	66 90                	xchg   ax,ax
  403cf0:	a8 40                	test   al,0x40
  403cf2:	89 fe                	mov    esi,edi
  403cf4:	74 a0                	je     403c96 <___pformat_int+0x156>
  403cf6:	83 c6 01             	add    esi,0x1
  403cf9:	c6 07 20             	mov    BYTE PTR [edi],0x20
  403cfc:	eb 98                	jmp    403c96 <___pformat_int+0x156>
  403cfe:	66 90                	xchg   ax,ax
  403d00:	89 c2                	mov    edx,eax
  403d02:	81 e2 00 06 00 00    	and    edx,0x600
  403d08:	81 fa 00 02 00 00    	cmp    edx,0x200
  403d0e:	0f 85 45 ff ff ff    	jne    403c59 <___pformat_int+0x119>
  403d14:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  403d17:	8d 4a ff             	lea    ecx,[edx-0x1]
  403d1a:	85 d2                	test   edx,edx
  403d1c:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  403d1f:	0f 8e 67 ff ff ff    	jle    403c8c <___pformat_int+0x14c>
  403d25:	83 c7 01             	add    edi,0x1
  403d28:	c6 47 ff 30          	mov    BYTE PTR [edi-0x1],0x30
  403d2c:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403d2f:	8d 50 ff             	lea    edx,[eax-0x1]
  403d32:	85 c0                	test   eax,eax
  403d34:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403d37:	7f ec                	jg     403d25 <___pformat_int+0x1e5>
  403d39:	e9 4b ff ff ff       	jmp    403c89 <___pformat_int+0x149>
  403d3e:	66 90                	xchg   ax,ax
  403d40:	f7 de                	neg    esi
  403d42:	83 d7 00             	adc    edi,0x0
  403d45:	f7 df                	neg    edi
  403d47:	89 75 d8             	mov    DWORD PTR [ebp-0x28],esi
  403d4a:	89 7d dc             	mov    DWORD PTR [ebp-0x24],edi
  403d4d:	e9 43 fe ff ff       	jmp    403b95 <___pformat_int+0x55>
  403d52:	8b 4b 0c             	mov    ecx,DWORD PTR [ebx+0xc]
  403d55:	85 c9                	test   ecx,ecx
  403d57:	0f 84 cc fe ff ff    	je     403c29 <___pformat_int+0xe9>
  403d5d:	c6 07 30             	mov    BYTE PTR [edi],0x30
  403d60:	83 c7 01             	add    edi,0x1
  403d63:	e9 c1 fe ff ff       	jmp    403c29 <___pformat_int+0xe9>
  403d68:	90                   	nop
  403d69:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00403d70 <___pformat_xint>:
  403d70:	55                   	push   ebp
  403d71:	89 e5                	mov    ebp,esp
  403d73:	57                   	push   edi
  403d74:	89 cf                	mov    edi,ecx
  403d76:	56                   	push   esi
  403d77:	89 d6                	mov    esi,edx
  403d79:	53                   	push   ebx
  403d7a:	83 ec 2c             	sub    esp,0x2c
  403d7d:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
  403d80:	31 d2                	xor    edx,edx
  403d82:	83 f8 6f             	cmp    eax,0x6f
  403d85:	0f 94 c2             	sete   dl
  403d88:	83 ea 01             	sub    edx,0x1
  403d8b:	83 e2 fa             	and    edx,0xfffffffa
  403d8e:	89 4d d4             	mov    DWORD PTR [ebp-0x2c],ecx
  403d91:	31 c9                	xor    ecx,ecx
  403d93:	83 f8 6f             	cmp    eax,0x6f
  403d96:	0f 95 c1             	setne  cl
  403d99:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  403d9c:	89 c8                	mov    eax,ecx
  403d9e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  403da1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403da4:	8d 1c cd 07 00 00 00 	lea    ebx,[ecx*8+0x7]
  403dab:	89 5d d0             	mov    DWORD PTR [ebp-0x30],ebx
  403dae:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  403db1:	83 45 e4 03          	add    DWORD PTR [ebp-0x1c],0x3
  403db5:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  403db8:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  403dbb:	89 d8                	mov    eax,ebx
  403dbd:	c1 f8 1f             	sar    eax,0x1f
  403dc0:	f7 d0                	not    eax
  403dc2:	21 d8                	and    eax,ebx
  403dc4:	8d 44 02 18          	lea    eax,[edx+eax*1+0x18]
  403dc8:	39 c8                	cmp    eax,ecx
  403dca:	7d 02                	jge    403dce <___pformat_xint+0x5e>
  403dcc:	89 c8                	mov    eax,ecx
  403dce:	83 c0 0f             	add    eax,0xf
  403dd1:	83 e0 f0             	and    eax,0xfffffff0
  403dd4:	e8 47 e3 ff ff       	call   402120 <___chkstk_ms>
  403dd9:	29 c4                	sub    esp,eax
  403ddb:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  403dde:	0b 45 dc             	or     eax,DWORD PTR [ebp-0x24]
  403de1:	89 65 e0             	mov    DWORD PTR [ebp-0x20],esp
  403de4:	0f 84 4a 02 00 00    	je     404034 <___pformat_xint+0x2c4>
  403dea:	0f b6 4d d8          	movzx  ecx,BYTE PTR [ebp-0x28]
  403dee:	89 e0                	mov    eax,esp
  403df0:	0f b6 5d d0          	movzx  ebx,BYTE PTR [ebp-0x30]
  403df4:	83 e1 20             	and    ecx,0x20
  403df7:	88 4d dc             	mov    BYTE PTR [ebp-0x24],cl
  403dfa:	eb 1f                	jmp    403e1b <___pformat_xint+0xab>
  403dfc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403e00:	88 48 ff             	mov    BYTE PTR [eax-0x1],cl
  403e03:	0f b6 4d e4          	movzx  ecx,BYTE PTR [ebp-0x1c]
  403e07:	0f ad fe             	shrd   esi,edi,cl
  403e0a:	d3 ef                	shr    edi,cl
  403e0c:	f6 c1 20             	test   cl,0x20
  403e0f:	74 04                	je     403e15 <___pformat_xint+0xa5>
  403e11:	89 fe                	mov    esi,edi
  403e13:	31 ff                	xor    edi,edi
  403e15:	89 f9                	mov    ecx,edi
  403e17:	09 f1                	or     ecx,esi
  403e19:	74 1a                	je     403e35 <___pformat_xint+0xc5>
  403e1b:	89 f2                	mov    edx,esi
  403e1d:	83 c0 01             	add    eax,0x1
  403e20:	21 da                	and    edx,ebx
  403e22:	8d 4a 30             	lea    ecx,[edx+0x30]
  403e25:	80 f9 39             	cmp    cl,0x39
  403e28:	7e d6                	jle    403e00 <___pformat_xint+0x90>
  403e2a:	83 c2 37             	add    edx,0x37
  403e2d:	0a 55 dc             	or     dl,BYTE PTR [ebp-0x24]
  403e30:	88 50 ff             	mov    BYTE PTR [eax-0x1],dl
  403e33:	eb ce                	jmp    403e03 <___pformat_xint+0x93>
  403e35:	39 45 e0             	cmp    DWORD PTR [ebp-0x20],eax
  403e38:	0f 84 f0 01 00 00    	je     40402e <___pformat_xint+0x2be>
  403e3e:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  403e41:	8b 5f 0c             	mov    ebx,DWORD PTR [edi+0xc]
  403e44:	85 db                	test   ebx,ebx
  403e46:	0f 8e a5 01 00 00    	jle    403ff1 <___pformat_xint+0x281>
  403e4c:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
  403e4f:	29 c1                	sub    ecx,eax
  403e51:	01 cb                	add    ebx,ecx
  403e53:	85 db                	test   ebx,ebx
  403e55:	0f 8e 96 01 00 00    	jle    403ff1 <___pformat_xint+0x281>
  403e5b:	8d 3c 18             	lea    edi,[eax+ebx*1]
  403e5e:	66 90                	xchg   ax,ax
  403e60:	83 c0 01             	add    eax,0x1
  403e63:	39 f8                	cmp    eax,edi
  403e65:	c6 40 ff 30          	mov    BYTE PTR [eax-0x1],0x30
  403e69:	75 f5                	jne    403e60 <___pformat_xint+0xf0>
  403e6b:	3b 7d e0             	cmp    edi,DWORD PTR [ebp-0x20]
  403e6e:	0f 84 a1 01 00 00    	je     404015 <___pformat_xint+0x2a5>
  403e74:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e77:	8b 70 08             	mov    esi,DWORD PTR [eax+0x8]
  403e7a:	89 f8                	mov    eax,edi
  403e7c:	2b 45 e0             	sub    eax,DWORD PTR [ebp-0x20]
  403e7f:	39 c6                	cmp    esi,eax
  403e81:	0f 8e a9 00 00 00    	jle    403f30 <___pformat_xint+0x1c0>
  403e87:	29 c6                	sub    esi,eax
  403e89:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e8c:	85 f6                	test   esi,esi
  403e8e:	89 70 08             	mov    DWORD PTR [eax+0x8],esi
  403e91:	7e 21                	jle    403eb4 <___pformat_xint+0x144>
  403e93:	83 7d d8 6f          	cmp    DWORD PTR [ebp-0x28],0x6f
  403e97:	74 0d                	je     403ea6 <___pformat_xint+0x136>
  403e99:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e9c:	f6 40 05 08          	test   BYTE PTR [eax+0x5],0x8
  403ea0:	0f 85 00 01 00 00    	jne    403fa6 <___pformat_xint+0x236>
  403ea6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403ea9:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  403eac:	85 db                	test   ebx,ebx
  403eae:	0f 88 09 01 00 00    	js     403fbd <___pformat_xint+0x24d>
  403eb4:	8d 46 ff             	lea    eax,[esi-0x1]
  403eb7:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  403eba:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403ebd:	83 7d d8 6f          	cmp    DWORD PTR [ebp-0x28],0x6f
  403ec1:	89 c3                	mov    ebx,eax
  403ec3:	74 0d                	je     403ed2 <___pformat_xint+0x162>
  403ec5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403ec8:	f6 40 05 08          	test   BYTE PTR [eax+0x5],0x8
  403ecc:	0f 85 be 00 00 00    	jne    403f90 <___pformat_xint+0x220>
  403ed2:	85 f6                	test   esi,esi
  403ed4:	7e 09                	jle    403edf <___pformat_xint+0x16f>
  403ed6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403ed9:	f6 40 05 04          	test   BYTE PTR [eax+0x5],0x4
  403edd:	74 71                	je     403f50 <___pformat_xint+0x1e0>
  403edf:	3b 7d e0             	cmp    edi,DWORD PTR [ebp-0x20]
  403ee2:	76 25                	jbe    403f09 <___pformat_xint+0x199>
  403ee4:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
  403ee7:	8b 75 e0             	mov    esi,DWORD PTR [ebp-0x20]
  403eea:	89 5d e0             	mov    DWORD PTR [ebp-0x20],ebx
  403eed:	89 fb                	mov    ebx,edi
  403eef:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  403ef2:	83 eb 01             	sub    ebx,0x1
  403ef5:	0f be 03             	movsx  eax,BYTE PTR [ebx]
  403ef8:	89 fa                	mov    edx,edi
  403efa:	e8 91 f9 ff ff       	call   403890 <___pformat_putc>
  403eff:	39 f3                	cmp    ebx,esi
  403f01:	75 ef                	jne    403ef2 <___pformat_xint+0x182>
  403f03:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
  403f06:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  403f09:	85 f6                	test   esi,esi
  403f0b:	7e 19                	jle    403f26 <___pformat_xint+0x1b6>
  403f0d:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  403f10:	b8 20 00 00 00       	mov    eax,0x20
  403f15:	83 eb 01             	sub    ebx,0x1
  403f18:	89 f2                	mov    edx,esi
  403f1a:	e8 71 f9 ff ff       	call   403890 <___pformat_putc>
  403f1f:	8d 43 01             	lea    eax,[ebx+0x1]
  403f22:	85 c0                	test   eax,eax
  403f24:	7f ea                	jg     403f10 <___pformat_xint+0x1a0>
  403f26:	8d 65 f4             	lea    esp,[ebp-0xc]
  403f29:	5b                   	pop    ebx
  403f2a:	5e                   	pop    esi
  403f2b:	5f                   	pop    edi
  403f2c:	5d                   	pop    ebp
  403f2d:	c3                   	ret    
  403f2e:	66 90                	xchg   ax,ax
  403f30:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403f33:	be ff ff ff ff       	mov    esi,0xffffffff
  403f38:	c7 45 e4 fe ff ff ff 	mov    DWORD PTR [ebp-0x1c],0xfffffffe
  403f3f:	c7 40 08 ff ff ff ff 	mov    DWORD PTR [eax+0x8],0xffffffff
  403f46:	e9 6f ff ff ff       	jmp    403eba <___pformat_xint+0x14a>
  403f4b:	90                   	nop
  403f4c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403f50:	8b 5d e4             	mov    ebx,DWORD PTR [ebp-0x1c]
  403f53:	89 c6                	mov    esi,eax
  403f55:	b8 20 00 00 00       	mov    eax,0x20
  403f5a:	83 eb 01             	sub    ebx,0x1
  403f5d:	89 f2                	mov    edx,esi
  403f5f:	e8 2c f9 ff ff       	call   403890 <___pformat_putc>
  403f64:	8d 43 01             	lea    eax,[ebx+0x1]
  403f67:	85 c0                	test   eax,eax
  403f69:	7f ea                	jg     403f55 <___pformat_xint+0x1e5>
  403f6b:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  403f6e:	89 c8                	mov    eax,ecx
  403f70:	c1 f8 1f             	sar    eax,0x1f
  403f73:	f7 d0                	not    eax
  403f75:	8d 71 ff             	lea    esi,[ecx-0x1]
  403f78:	21 c8                	and    eax,ecx
  403f7a:	29 c6                	sub    esi,eax
  403f7c:	8d 5e ff             	lea    ebx,[esi-0x1]
  403f7f:	e9 5b ff ff ff       	jmp    403edf <___pformat_xint+0x16f>
  403f84:	83 ee 03             	sub    esi,0x3
  403f87:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
  403f8a:	89 c6                	mov    esi,eax
  403f8c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403f90:	0f b6 45 d8          	movzx  eax,BYTE PTR [ebp-0x28]
  403f94:	83 c7 02             	add    edi,0x2
  403f97:	c6 47 ff 30          	mov    BYTE PTR [edi-0x1],0x30
  403f9b:	8b 5d e4             	mov    ebx,DWORD PTR [ebp-0x1c]
  403f9e:	88 47 fe             	mov    BYTE PTR [edi-0x2],al
  403fa1:	e9 2c ff ff ff       	jmp    403ed2 <___pformat_xint+0x162>
  403fa6:	8d 46 fe             	lea    eax,[esi-0x2]
  403fa9:	85 c0                	test   eax,eax
  403fab:	7e d7                	jle    403f84 <___pformat_xint+0x214>
  403fad:	89 c6                	mov    esi,eax
  403faf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403fb2:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  403fb5:	85 db                	test   ebx,ebx
  403fb7:	0f 89 f7 fe ff ff    	jns    403eb4 <___pformat_xint+0x144>
  403fbd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403fc0:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  403fc3:	25 00 06 00 00       	and    eax,0x600
  403fc8:	3d 00 02 00 00       	cmp    eax,0x200
  403fcd:	0f 85 e1 fe ff ff    	jne    403eb4 <___pformat_xint+0x144>
  403fd3:	01 fe                	add    esi,edi
  403fd5:	83 c7 01             	add    edi,0x1
  403fd8:	39 f7                	cmp    edi,esi
  403fda:	c6 47 ff 30          	mov    BYTE PTR [edi-0x1],0x30
  403fde:	75 f5                	jne    403fd5 <___pformat_xint+0x265>
  403fe0:	c7 45 e4 fe ff ff ff 	mov    DWORD PTR [ebp-0x1c],0xfffffffe
  403fe7:	be ff ff ff ff       	mov    esi,0xffffffff
  403fec:	e9 c9 fe ff ff       	jmp    403eba <___pformat_xint+0x14a>
  403ff1:	83 7d d8 6f          	cmp    DWORD PTR [ebp-0x28],0x6f
  403ff5:	89 c7                	mov    edi,eax
  403ff7:	0f 85 6e fe ff ff    	jne    403e6b <___pformat_xint+0xfb>
  403ffd:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  404000:	f6 46 05 08          	test   BYTE PTR [esi+0x5],0x8
  404004:	0f 84 61 fe ff ff    	je     403e6b <___pformat_xint+0xfb>
  40400a:	83 c7 01             	add    edi,0x1
  40400d:	c6 00 30             	mov    BYTE PTR [eax],0x30
  404010:	e9 56 fe ff ff       	jmp    403e6b <___pformat_xint+0xfb>
  404015:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  404018:	8b 70 0c             	mov    esi,DWORD PTR [eax+0xc]
  40401b:	85 f6                	test   esi,esi
  40401d:	0f 84 51 fe ff ff    	je     403e74 <___pformat_xint+0x104>
  404023:	c6 07 30             	mov    BYTE PTR [edi],0x30
  404026:	83 c7 01             	add    edi,0x1
  404029:	e9 46 fe ff ff       	jmp    403e74 <___pformat_xint+0x104>
  40402e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  404031:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  404034:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  404037:	81 60 04 ff f7 ff ff 	and    DWORD PTR [eax+0x4],0xfffff7ff
  40403e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  404041:	e9 fe fd ff ff       	jmp    403e44 <___pformat_xint+0xd4>
  404046:	8d 76 00             	lea    esi,[esi+0x0]
  404049:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00404050 <___pformat_emit_float>:
  404050:	55                   	push   ebp
  404051:	89 e5                	mov    ebp,esp
  404053:	57                   	push   edi
  404054:	56                   	push   esi
  404055:	89 d6                	mov    esi,edx
  404057:	53                   	push   ebx
  404058:	89 cb                	mov    ebx,ecx
  40405a:	83 ec 3c             	sub    esp,0x3c
  40405d:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  404060:	85 c9                	test   ecx,ecx
  404062:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  404065:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404068:	0f 8e 7a 02 00 00    	jle    4042e8 <___pformat_emit_float+0x298>
  40406e:	39 c1                	cmp    ecx,eax
  404070:	0f 8d 3a 01 00 00    	jge    4041b0 <___pformat_emit_float+0x160>
  404076:	29 c8                	sub    eax,ecx
  404078:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  40407b:	85 c0                	test   eax,eax
  40407d:	0f 88 2d 01 00 00    	js     4041b0 <___pformat_emit_float+0x160>
  404083:	8b 57 0c             	mov    edx,DWORD PTR [edi+0xc]
  404086:	39 c2                	cmp    edx,eax
  404088:	0f 8d 22 01 00 00    	jge    4041b0 <___pformat_emit_float+0x160>
  40408e:	29 d0                	sub    eax,edx
  404090:	85 c0                	test   eax,eax
  404092:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  404095:	0f 8e 1c 01 00 00    	jle    4041b7 <___pformat_emit_float+0x167>
  40409b:	85 d2                	test   edx,edx
  40409d:	0f 8e ad 02 00 00    	jle    404350 <___pformat_emit_float+0x300>
  4040a3:	83 e8 01             	sub    eax,0x1
  4040a6:	85 c0                	test   eax,eax
  4040a8:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  4040ab:	0f 84 06 01 00 00    	je     4041b7 <___pformat_emit_float+0x167>
  4040b1:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  4040b4:	85 d2                	test   edx,edx
  4040b6:	0f 85 ba 01 00 00    	jne    404276 <___pformat_emit_float+0x226>
  4040bc:	8b 57 04             	mov    edx,DWORD PTR [edi+0x4]
  4040bf:	f7 c2 c0 01 00 00    	test   edx,0x1c0
  4040c5:	0f 85 ab 01 00 00    	jne    404276 <___pformat_emit_float+0x226>
  4040cb:	80 e6 06             	and    dh,0x6
  4040ce:	0f 85 e3 00 00 00    	jne    4041b7 <___pformat_emit_float+0x167>
  4040d4:	eb 0c                	jmp    4040e2 <___pformat_emit_float+0x92>
  4040d6:	89 fa                	mov    edx,edi
  4040d8:	b8 20 00 00 00       	mov    eax,0x20
  4040dd:	e8 ae f7 ff ff       	call   403890 <___pformat_putc>
  4040e2:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  4040e5:	8d 50 ff             	lea    edx,[eax-0x1]
  4040e8:	85 c0                	test   eax,eax
  4040ea:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  4040ed:	7f e7                	jg     4040d6 <___pformat_emit_float+0x86>
  4040ef:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4040f2:	85 c0                	test   eax,eax
  4040f4:	0f 84 c8 00 00 00    	je     4041c2 <___pformat_emit_float+0x172>
  4040fa:	89 fa                	mov    edx,edi
  4040fc:	b8 2d 00 00 00       	mov    eax,0x2d
  404101:	e8 8a f7 ff ff       	call   403890 <___pformat_putc>
  404106:	8b 57 08             	mov    edx,DWORD PTR [edi+0x8]
  404109:	85 d2                	test   edx,edx
  40410b:	7e 13                	jle    404120 <___pformat_emit_float+0xd0>
  40410d:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404110:	25 00 06 00 00       	and    eax,0x600
  404115:	3d 00 02 00 00       	cmp    eax,0x200
  40411a:	0f 84 f1 01 00 00    	je     404311 <___pformat_emit_float+0x2c1>
  404120:	85 db                	test   ebx,ebx
  404122:	0f 8e 10 02 00 00    	jle    404338 <___pformat_emit_float+0x2e8>
  404128:	0f b6 16             	movzx  edx,BYTE PTR [esi]
  40412b:	b8 30 00 00 00       	mov    eax,0x30
  404130:	84 d2                	test   dl,dl
  404132:	74 06                	je     40413a <___pformat_emit_float+0xea>
  404134:	83 c6 01             	add    esi,0x1
  404137:	0f be c2             	movsx  eax,dl
  40413a:	89 fa                	mov    edx,edi
  40413c:	e8 4f f7 ff ff       	call   403890 <___pformat_putc>
  404141:	83 eb 01             	sub    ebx,0x1
  404144:	75 e2                	jne    404128 <___pformat_emit_float+0xd8>
  404146:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  404149:	85 c0                	test   eax,eax
  40414b:	0f 8e 3f 01 00 00    	jle    404290 <___pformat_emit_float+0x240>
  404151:	83 7f 10 fd          	cmp    DWORD PTR [edi+0x10],0xfffffffd
  404155:	0f 84 49 01 00 00    	je     4042a4 <___pformat_emit_float+0x254>
  40415b:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  40415f:	66 85 d2             	test   dx,dx
  404162:	0f 85 7f 00 00 00    	jne    4041e7 <___pformat_emit_float+0x197>
  404168:	b8 2e 00 00 00       	mov    eax,0x2e
  40416d:	89 fa                	mov    edx,edi
  40416f:	e8 1c f7 ff ff       	call   403890 <___pformat_putc>
  404174:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  404177:	85 db                	test   ebx,ebx
  404179:	74 21                	je     40419c <___pformat_emit_float+0x14c>
  40417b:	e9 d8 00 00 00       	jmp    404258 <___pformat_emit_float+0x208>
  404180:	0f b6 16             	movzx  edx,BYTE PTR [esi]
  404183:	b8 30 00 00 00       	mov    eax,0x30
  404188:	84 d2                	test   dl,dl
  40418a:	74 06                	je     404192 <___pformat_emit_float+0x142>
  40418c:	83 c6 01             	add    esi,0x1
  40418f:	0f be c2             	movsx  eax,dl
  404192:	89 fa                	mov    edx,edi
  404194:	e8 f7 f6 ff ff       	call   403890 <___pformat_putc>
  404199:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  40419c:	8d 50 ff             	lea    edx,[eax-0x1]
  40419f:	85 c0                	test   eax,eax
  4041a1:	89 57 0c             	mov    DWORD PTR [edi+0xc],edx
  4041a4:	7f da                	jg     404180 <___pformat_emit_float+0x130>
  4041a6:	8d 65 f4             	lea    esp,[ebp-0xc]
  4041a9:	5b                   	pop    ebx
  4041aa:	5e                   	pop    esi
  4041ab:	5f                   	pop    edi
  4041ac:	5d                   	pop    ebp
  4041ad:	c3                   	ret    
  4041ae:	66 90                	xchg   ax,ax
  4041b0:	c7 47 08 ff ff ff ff 	mov    DWORD PTR [edi+0x8],0xffffffff
  4041b7:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4041ba:	85 c0                	test   eax,eax
  4041bc:	0f 85 38 ff ff ff    	jne    4040fa <___pformat_emit_float+0xaa>
  4041c2:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  4041c5:	f6 c4 01             	test   ah,0x1
  4041c8:	0f 85 32 01 00 00    	jne    404300 <___pformat_emit_float+0x2b0>
  4041ce:	a8 40                	test   al,0x40
  4041d0:	0f 84 30 ff ff ff    	je     404106 <___pformat_emit_float+0xb6>
  4041d6:	89 fa                	mov    edx,edi
  4041d8:	b8 20 00 00 00       	mov    eax,0x20
  4041dd:	e8 ae f6 ff ff       	call   403890 <___pformat_putc>
  4041e2:	e9 1f ff ff ff       	jmp    404106 <___pformat_emit_float+0xb6>
  4041e7:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
  4041ea:	89 65 d4             	mov    DWORD PTR [ebp-0x2c],esp
  4041ed:	83 c0 0f             	add    eax,0xf
  4041f0:	83 e0 f0             	and    eax,0xfffffff0
  4041f3:	e8 28 df ff ff       	call   402120 <___chkstk_ms>
  4041f8:	29 c4                	sub    esp,eax
  4041fa:	8d 4c 24 10          	lea    ecx,[esp+0x10]
  4041fe:	8d 45 e4             	lea    eax,[ebp-0x1c]
  404201:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  404208:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40420c:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  404210:	89 0c 24             	mov    DWORD PTR [esp],ecx
  404213:	89 4d d0             	mov    DWORD PTR [ebp-0x30],ecx
  404216:	e8 b5 29 00 00       	call   406bd0 <_wcrtomb>
  40421b:	85 c0                	test   eax,eax
  40421d:	0f 8e 42 01 00 00    	jle    404365 <___pformat_emit_float+0x315>
  404223:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
  404226:	89 5d cc             	mov    DWORD PTR [ebp-0x34],ebx
  404229:	89 75 d0             	mov    DWORD PTR [ebp-0x30],esi
  40422c:	01 c8                	add    eax,ecx
  40422e:	89 cb                	mov    ebx,ecx
  404230:	89 c6                	mov    esi,eax
  404232:	83 c3 01             	add    ebx,0x1
  404235:	0f be 43 ff          	movsx  eax,BYTE PTR [ebx-0x1]
  404239:	89 fa                	mov    edx,edi
  40423b:	e8 50 f6 ff ff       	call   403890 <___pformat_putc>
  404240:	39 f3                	cmp    ebx,esi
  404242:	75 ee                	jne    404232 <___pformat_emit_float+0x1e2>
  404244:	8b 75 d0             	mov    esi,DWORD PTR [ebp-0x30]
  404247:	8b 5d cc             	mov    ebx,DWORD PTR [ebp-0x34]
  40424a:	85 db                	test   ebx,ebx
  40424c:	8b 65 d4             	mov    esp,DWORD PTR [ebp-0x2c]
  40424f:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  404252:	0f 84 44 ff ff ff    	je     40419c <___pformat_emit_float+0x14c>
  404258:	01 d8                	add    eax,ebx
  40425a:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
  40425d:	8d 76 00             	lea    esi,[esi+0x0]
  404260:	89 fa                	mov    edx,edi
  404262:	b8 30 00 00 00       	mov    eax,0x30
  404267:	e8 24 f6 ff ff       	call   403890 <___pformat_putc>
  40426c:	83 c3 01             	add    ebx,0x1
  40426f:	78 ef                	js     404260 <___pformat_emit_float+0x210>
  404271:	e9 23 ff ff ff       	jmp    404199 <___pformat_emit_float+0x149>
  404276:	83 e8 01             	sub    eax,0x1
  404279:	85 c0                	test   eax,eax
  40427b:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  40427e:	0f 84 33 ff ff ff    	je     4041b7 <___pformat_emit_float+0x167>
  404284:	8b 57 04             	mov    edx,DWORD PTR [edi+0x4]
  404287:	e9 3f fe ff ff       	jmp    4040cb <___pformat_emit_float+0x7b>
  40428c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404290:	f6 47 05 08          	test   BYTE PTR [edi+0x5],0x8
  404294:	0f 84 dd fe ff ff    	je     404177 <___pformat_emit_float+0x127>
  40429a:	83 7f 10 fd          	cmp    DWORD PTR [edi+0x10],0xfffffffd
  40429e:	0f 85 b7 fe ff ff    	jne    40415b <___pformat_emit_float+0x10b>
  4042a4:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  4042ab:	e8 40 3f 00 00       	call   4081f0 <_localeconv>
  4042b0:	8d 55 e4             	lea    edx,[ebp-0x1c]
  4042b3:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  4042b7:	c7 44 24 08 10 00 00 	mov    DWORD PTR [esp+0x8],0x10
  4042be:	00 
  4042bf:	8b 00                	mov    eax,DWORD PTR [eax]
  4042c1:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4042c5:	8d 45 e2             	lea    eax,[ebp-0x1e]
  4042c8:	89 04 24             	mov    DWORD PTR [esp],eax
  4042cb:	e8 50 2c 00 00       	call   406f20 <_mbrtowc>
  4042d0:	85 c0                	test   eax,eax
  4042d2:	0f 8e 9e 00 00 00    	jle    404376 <___pformat_emit_float+0x326>
  4042d8:	0f b7 55 e2          	movzx  edx,WORD PTR [ebp-0x1e]
  4042dc:	66 89 57 14          	mov    WORD PTR [edi+0x14],dx
  4042e0:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
  4042e3:	e9 77 fe ff ff       	jmp    40415f <___pformat_emit_float+0x10f>
  4042e8:	85 c0                	test   eax,eax
  4042ea:	0f 8e 8b fd ff ff    	jle    40407b <___pformat_emit_float+0x2b>
  4042f0:	83 e8 01             	sub    eax,0x1
  4042f3:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  4042f6:	e9 88 fd ff ff       	jmp    404083 <___pformat_emit_float+0x33>
  4042fb:	90                   	nop
  4042fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404300:	89 fa                	mov    edx,edi
  404302:	b8 2b 00 00 00       	mov    eax,0x2b
  404307:	e8 84 f5 ff ff       	call   403890 <___pformat_putc>
  40430c:	e9 f5 fd ff ff       	jmp    404106 <___pformat_emit_float+0xb6>
  404311:	83 ea 01             	sub    edx,0x1
  404314:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  404317:	89 fa                	mov    edx,edi
  404319:	b8 30 00 00 00       	mov    eax,0x30
  40431e:	e8 6d f5 ff ff       	call   403890 <___pformat_putc>
  404323:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404326:	8d 50 ff             	lea    edx,[eax-0x1]
  404329:	85 c0                	test   eax,eax
  40432b:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  40432e:	7f e7                	jg     404317 <___pformat_emit_float+0x2c7>
  404330:	85 db                	test   ebx,ebx
  404332:	0f 8f f0 fd ff ff    	jg     404128 <___pformat_emit_float+0xd8>
  404338:	89 fa                	mov    edx,edi
  40433a:	b8 30 00 00 00       	mov    eax,0x30
  40433f:	e8 4c f5 ff ff       	call   403890 <___pformat_putc>
  404344:	e9 fd fd ff ff       	jmp    404146 <___pformat_emit_float+0xf6>
  404349:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  404350:	f6 47 05 08          	test   BYTE PTR [edi+0x5],0x8
  404354:	0f 84 57 fd ff ff    	je     4040b1 <___pformat_emit_float+0x61>
  40435a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404360:	e9 3e fd ff ff       	jmp    4040a3 <___pformat_emit_float+0x53>
  404365:	89 fa                	mov    edx,edi
  404367:	b8 2e 00 00 00       	mov    eax,0x2e
  40436c:	e8 1f f5 ff ff       	call   403890 <___pformat_putc>
  404371:	e9 d4 fe ff ff       	jmp    40424a <___pformat_emit_float+0x1fa>
  404376:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  40437a:	e9 61 ff ff ff       	jmp    4042e0 <___pformat_emit_float+0x290>
  40437f:	90                   	nop

00404380 <___pformat_emit_efloat>:
  404380:	55                   	push   ebp
  404381:	83 e9 01             	sub    ecx,0x1
  404384:	57                   	push   edi
  404385:	89 d5                	mov    ebp,edx
  404387:	56                   	push   esi
  404388:	be 01 00 00 00       	mov    esi,0x1
  40438d:	53                   	push   ebx
  40438e:	bb 67 66 66 66       	mov    ebx,0x66666667
  404393:	83 ec 1c             	sub    esp,0x1c
  404396:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40439a:	89 c8                	mov    eax,ecx
  40439c:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  4043a0:	c1 f8 1f             	sar    eax,0x1f
  4043a3:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4043a7:	89 c8                	mov    eax,ecx
  4043a9:	f7 eb                	imul   ebx
  4043ab:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  4043af:	c1 f9 1f             	sar    ecx,0x1f
  4043b2:	c1 fa 02             	sar    edx,0x2
  4043b5:	89 d3                	mov    ebx,edx
  4043b7:	29 cb                	sub    ebx,ecx
  4043b9:	74 18                	je     4043d3 <___pformat_emit_efloat+0x53>
  4043bb:	b9 67 66 66 66       	mov    ecx,0x66666667
  4043c0:	89 d8                	mov    eax,ebx
  4043c2:	83 c6 01             	add    esi,0x1
  4043c5:	f7 e9                	imul   ecx
  4043c7:	c1 fb 1f             	sar    ebx,0x1f
  4043ca:	c1 fa 02             	sar    edx,0x2
  4043cd:	29 da                	sub    edx,ebx
  4043cf:	89 d3                	mov    ebx,edx
  4043d1:	75 ed                	jne    4043c0 <___pformat_emit_efloat+0x40>
  4043d3:	8b 47 20             	mov    eax,DWORD PTR [edi+0x20]
  4043d6:	39 c6                	cmp    esi,eax
  4043d8:	7d 02                	jge    4043dc <___pformat_emit_efloat+0x5c>
  4043da:	89 c6                	mov    esi,eax
  4043dc:	8b 57 08             	mov    edx,DWORD PTR [edi+0x8]
  4043df:	8d 46 02             	lea    eax,[esi+0x2]
  4043e2:	39 c2                	cmp    edx,eax
  4043e4:	7f 5a                	jg     404440 <___pformat_emit_efloat+0xc0>
  4043e6:	c7 47 08 ff ff ff ff 	mov    DWORD PTR [edi+0x8],0xffffffff
  4043ed:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  4043f1:	b9 01 00 00 00       	mov    ecx,0x1
  4043f6:	89 ea                	mov    edx,ebp
  4043f8:	89 3c 24             	mov    DWORD PTR [esp],edi
  4043fb:	83 c6 01             	add    esi,0x1
  4043fe:	e8 4d fc ff ff       	call   404050 <___pformat_emit_float>
  404403:	8b 47 20             	mov    eax,DWORD PTR [edi+0x20]
  404406:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
  404409:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  40440c:	89 c2                	mov    edx,eax
  40440e:	83 e0 20             	and    eax,0x20
  404411:	81 ca c0 01 00 00    	or     edx,0x1c0
  404417:	83 c8 45             	or     eax,0x45
  40441a:	89 57 04             	mov    DWORD PTR [edi+0x4],edx
  40441d:	89 fa                	mov    edx,edi
  40441f:	e8 6c f4 ff ff       	call   403890 <___pformat_putc>
  404424:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  404428:	89 f9                	mov    ecx,edi
  40442a:	01 77 08             	add    DWORD PTR [edi+0x8],esi
  40442d:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  404431:	e8 0a f7 ff ff       	call   403b40 <___pformat_int>
  404436:	83 c4 1c             	add    esp,0x1c
  404439:	5b                   	pop    ebx
  40443a:	5e                   	pop    esi
  40443b:	5f                   	pop    edi
  40443c:	5d                   	pop    ebp
  40443d:	c3                   	ret    
  40443e:	66 90                	xchg   ax,ax
  404440:	29 c2                	sub    edx,eax
  404442:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  404445:	eb a6                	jmp    4043ed <___pformat_emit_efloat+0x6d>
  404447:	89 f6                	mov    esi,esi
  404449:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00404450 <___pformat_efloat>:
  404450:	56                   	push   esi
  404451:	53                   	push   ebx
  404452:	89 c3                	mov    ebx,eax
  404454:	83 ec 44             	sub    esp,0x44
  404457:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40445a:	85 c0                	test   eax,eax
  40445c:	78 72                	js     4044d0 <___pformat_efloat+0x80>
  40445e:	83 c0 01             	add    eax,0x1
  404461:	db 6c 24 50          	fld    TBYTE PTR [esp+0x50]
  404465:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  404469:	8d 54 24 28          	lea    edx,[esp+0x28]
  40446d:	db 7c 24 30          	fstp   TBYTE PTR [esp+0x30]
  404471:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  404475:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  404479:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  40447d:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  404481:	89 04 24             	mov    DWORD PTR [esp],eax
  404484:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  404488:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40448c:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  404490:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  404494:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  404498:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40449c:	b8 02 00 00 00       	mov    eax,0x2
  4044a1:	e8 ea f2 ff ff       	call   403790 <___pformat_cvt>
  4044a6:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  4044aa:	81 f9 00 80 ff ff    	cmp    ecx,0xffff8000
  4044b0:	89 c6                	mov    esi,eax
  4044b2:	74 2c                	je     4044e0 <___pformat_efloat+0x90>
  4044b4:	89 c2                	mov    edx,eax
  4044b6:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4044ba:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4044bd:	e8 be fe ff ff       	call   404380 <___pformat_emit_efloat>
  4044c2:	89 34 24             	mov    DWORD PTR [esp],esi
  4044c5:	e8 86 2d 00 00       	call   407250 <___freedtoa>
  4044ca:	83 c4 44             	add    esp,0x44
  4044cd:	5b                   	pop    ebx
  4044ce:	5e                   	pop    esi
  4044cf:	c3                   	ret    
  4044d0:	c7 43 0c 06 00 00 00 	mov    DWORD PTR [ebx+0xc],0x6
  4044d7:	b8 07 00 00 00       	mov    eax,0x7
  4044dc:	eb 83                	jmp    404461 <___pformat_efloat+0x11>
  4044de:	66 90                	xchg   ax,ax
  4044e0:	89 c2                	mov    edx,eax
  4044e2:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4044e6:	89 d9                	mov    ecx,ebx
  4044e8:	e8 c3 f5 ff ff       	call   403ab0 <___pformat_emit_inf_or_nan>
  4044ed:	89 34 24             	mov    DWORD PTR [esp],esi
  4044f0:	e8 5b 2d 00 00       	call   407250 <___freedtoa>
  4044f5:	83 c4 44             	add    esp,0x44
  4044f8:	5b                   	pop    ebx
  4044f9:	5e                   	pop    esi
  4044fa:	c3                   	ret    
  4044fb:	90                   	nop
  4044fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00404500 <___pformat_float>:
  404500:	57                   	push   edi
  404501:	56                   	push   esi
  404502:	53                   	push   ebx
  404503:	89 c3                	mov    ebx,eax
  404505:	83 ec 40             	sub    esp,0x40
  404508:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40450b:	85 c0                	test   eax,eax
  40450d:	0f 88 9d 00 00 00    	js     4045b0 <___pformat_float+0xb0>
  404513:	db 6c 24 50          	fld    TBYTE PTR [esp+0x50]
  404517:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40451b:	8d 54 24 28          	lea    edx,[esp+0x28]
  40451f:	db 7c 24 30          	fstp   TBYTE PTR [esp+0x30]
  404523:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  404527:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  40452b:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  40452f:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  404533:	89 04 24             	mov    DWORD PTR [esp],eax
  404536:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  40453a:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40453e:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  404542:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  404546:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  40454a:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40454e:	b8 03 00 00 00       	mov    eax,0x3
  404553:	e8 38 f2 ff ff       	call   403790 <___pformat_cvt>
  404558:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  40455c:	81 f9 00 80 ff ff    	cmp    ecx,0xffff8000
  404562:	89 c7                	mov    edi,eax
  404564:	74 5b                	je     4045c1 <___pformat_float+0xc1>
  404566:	89 c2                	mov    edx,eax
  404568:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  40456c:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40456f:	e8 dc fa ff ff       	call   404050 <___pformat_emit_float>
  404574:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  404577:	8d 50 ff             	lea    edx,[eax-0x1]
  40457a:	85 c0                	test   eax,eax
  40457c:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  40457f:	7e 19                	jle    40459a <___pformat_float+0x9a>
  404581:	89 da                	mov    edx,ebx
  404583:	b8 20 00 00 00       	mov    eax,0x20
  404588:	e8 03 f3 ff ff       	call   403890 <___pformat_putc>
  40458d:	8b 4b 08             	mov    ecx,DWORD PTR [ebx+0x8]
  404590:	8d 71 ff             	lea    esi,[ecx-0x1]
  404593:	85 c9                	test   ecx,ecx
  404595:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
  404598:	7f e7                	jg     404581 <___pformat_float+0x81>
  40459a:	89 3c 24             	mov    DWORD PTR [esp],edi
  40459d:	e8 ae 2c 00 00       	call   407250 <___freedtoa>
  4045a2:	83 c4 40             	add    esp,0x40
  4045a5:	5b                   	pop    ebx
  4045a6:	5e                   	pop    esi
  4045a7:	5f                   	pop    edi
  4045a8:	c3                   	ret    
  4045a9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4045b0:	c7 43 0c 06 00 00 00 	mov    DWORD PTR [ebx+0xc],0x6
  4045b7:	b8 06 00 00 00       	mov    eax,0x6
  4045bc:	e9 52 ff ff ff       	jmp    404513 <___pformat_float+0x13>
  4045c1:	89 c2                	mov    edx,eax
  4045c3:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4045c7:	89 d9                	mov    ecx,ebx
  4045c9:	e8 e2 f4 ff ff       	call   403ab0 <___pformat_emit_inf_or_nan>
  4045ce:	89 3c 24             	mov    DWORD PTR [esp],edi
  4045d1:	e8 7a 2c 00 00       	call   407250 <___freedtoa>
  4045d6:	83 c4 40             	add    esp,0x40
  4045d9:	5b                   	pop    ebx
  4045da:	5e                   	pop    esi
  4045db:	5f                   	pop    edi
  4045dc:	c3                   	ret    
  4045dd:	8d 76 00             	lea    esi,[esi+0x0]

004045e0 <___pformat_gfloat>:
  4045e0:	57                   	push   edi
  4045e1:	56                   	push   esi
  4045e2:	53                   	push   ebx
  4045e3:	89 c3                	mov    ebx,eax
  4045e5:	83 ec 40             	sub    esp,0x40
  4045e8:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4045eb:	85 c0                	test   eax,eax
  4045ed:	0f 88 1d 01 00 00    	js     404710 <___pformat_gfloat+0x130>
  4045f3:	0f 84 fa 00 00 00    	je     4046f3 <___pformat_gfloat+0x113>
  4045f9:	db 6c 24 50          	fld    TBYTE PTR [esp+0x50]
  4045fd:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  404601:	8d 54 24 28          	lea    edx,[esp+0x28]
  404605:	db 7c 24 30          	fstp   TBYTE PTR [esp+0x30]
  404609:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  40460d:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  404611:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  404615:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  404619:	89 04 24             	mov    DWORD PTR [esp],eax
  40461c:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  404620:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  404624:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  404628:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40462c:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  404630:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  404634:	b8 02 00 00 00       	mov    eax,0x2
  404639:	e8 52 f1 ff ff       	call   403790 <___pformat_cvt>
  40463e:	8b 74 24 2c          	mov    esi,DWORD PTR [esp+0x2c]
  404642:	81 fe 00 80 ff ff    	cmp    esi,0xffff8000
  404648:	89 c7                	mov    edi,eax
  40464a:	0f 84 e0 00 00 00    	je     404730 <___pformat_gfloat+0x150>
  404650:	83 fe fd             	cmp    esi,0xfffffffd
  404653:	7c 6b                	jl     4046c0 <___pformat_gfloat+0xe0>
  404655:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
  404658:	39 c6                	cmp    esi,eax
  40465a:	7f 64                	jg     4046c0 <___pformat_gfloat+0xe0>
  40465c:	f6 43 05 08          	test   BYTE PTR [ebx+0x5],0x8
  404660:	0f 85 bb 00 00 00    	jne    404721 <___pformat_gfloat+0x141>
  404666:	89 3c 24             	mov    DWORD PTR [esp],edi
  404669:	e8 f2 3a 00 00       	call   408160 <_strlen>
  40466e:	29 f0                	sub    eax,esi
  404670:	85 c0                	test   eax,eax
  404672:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  404675:	0f 88 c5 00 00 00    	js     404740 <___pformat_gfloat+0x160>
  40467b:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  40467f:	89 fa                	mov    edx,edi
  404681:	89 f1                	mov    ecx,esi
  404683:	89 1c 24             	mov    DWORD PTR [esp],ebx
  404686:	e8 c5 f9 ff ff       	call   404050 <___pformat_emit_float>
  40468b:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  40468e:	8d 50 ff             	lea    edx,[eax-0x1]
  404691:	85 c0                	test   eax,eax
  404693:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  404696:	7e 4c                	jle    4046e4 <___pformat_gfloat+0x104>
  404698:	89 da                	mov    edx,ebx
  40469a:	b8 20 00 00 00       	mov    eax,0x20
  40469f:	e8 ec f1 ff ff       	call   403890 <___pformat_putc>
  4046a4:	8b 4b 08             	mov    ecx,DWORD PTR [ebx+0x8]
  4046a7:	8d 71 ff             	lea    esi,[ecx-0x1]
  4046aa:	85 c9                	test   ecx,ecx
  4046ac:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
  4046af:	7f e7                	jg     404698 <___pformat_gfloat+0xb8>
  4046b1:	89 3c 24             	mov    DWORD PTR [esp],edi
  4046b4:	e8 97 2b 00 00       	call   407250 <___freedtoa>
  4046b9:	83 c4 40             	add    esp,0x40
  4046bc:	5b                   	pop    ebx
  4046bd:	5e                   	pop    esi
  4046be:	5f                   	pop    edi
  4046bf:	c3                   	ret    
  4046c0:	f6 43 05 08          	test   BYTE PTR [ebx+0x5],0x8
  4046c4:	75 3e                	jne    404704 <___pformat_gfloat+0x124>
  4046c6:	89 3c 24             	mov    DWORD PTR [esp],edi
  4046c9:	e8 92 3a 00 00       	call   408160 <_strlen>
  4046ce:	83 e8 01             	sub    eax,0x1
  4046d1:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  4046d4:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4046d8:	89 f1                	mov    ecx,esi
  4046da:	89 fa                	mov    edx,edi
  4046dc:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4046df:	e8 9c fc ff ff       	call   404380 <___pformat_emit_efloat>
  4046e4:	89 3c 24             	mov    DWORD PTR [esp],edi
  4046e7:	e8 64 2b 00 00       	call   407250 <___freedtoa>
  4046ec:	83 c4 40             	add    esp,0x40
  4046ef:	5b                   	pop    ebx
  4046f0:	5e                   	pop    esi
  4046f1:	5f                   	pop    edi
  4046f2:	c3                   	ret    
  4046f3:	c7 43 0c 01 00 00 00 	mov    DWORD PTR [ebx+0xc],0x1
  4046fa:	b8 01 00 00 00       	mov    eax,0x1
  4046ff:	e9 f5 fe ff ff       	jmp    4045f9 <___pformat_gfloat+0x19>
  404704:	83 6b 0c 01          	sub    DWORD PTR [ebx+0xc],0x1
  404708:	eb ca                	jmp    4046d4 <___pformat_gfloat+0xf4>
  40470a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404710:	c7 43 0c 06 00 00 00 	mov    DWORD PTR [ebx+0xc],0x6
  404717:	b8 06 00 00 00       	mov    eax,0x6
  40471c:	e9 d8 fe ff ff       	jmp    4045f9 <___pformat_gfloat+0x19>
  404721:	29 f0                	sub    eax,esi
  404723:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  404726:	e9 50 ff ff ff       	jmp    40467b <___pformat_gfloat+0x9b>
  40472b:	90                   	nop
  40472c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404730:	89 c2                	mov    edx,eax
  404732:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  404736:	89 d9                	mov    ecx,ebx
  404738:	e8 73 f3 ff ff       	call   403ab0 <___pformat_emit_inf_or_nan>
  40473d:	eb a5                	jmp    4046e4 <___pformat_gfloat+0x104>
  40473f:	90                   	nop
  404740:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  404743:	85 d2                	test   edx,edx
  404745:	0f 8e 30 ff ff ff    	jle    40467b <___pformat_gfloat+0x9b>
  40474b:	01 d0                	add    eax,edx
  40474d:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  404750:	e9 26 ff ff ff       	jmp    40467b <___pformat_gfloat+0x9b>
  404755:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404759:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00404760 <___pformat_xldouble>:
  404760:	55                   	push   ebp
  404761:	89 e5                	mov    ebp,esp
  404763:	57                   	push   edi
  404764:	89 c7                	mov    edi,eax
  404766:	56                   	push   esi
  404767:	53                   	push   ebx
  404768:	83 ec 6c             	sub    esp,0x6c
  40476b:	db 6d 08             	fld    TBYTE PTR [ebp+0x8]
  40476e:	d9 c0                	fld    st(0)
  404770:	db 7d c0             	fstp   TBYTE PTR [ebp-0x40]
  404773:	d9 e5                	fxam   
  404775:	9b df e0             	fstsw  ax
  404778:	66 25 00 45          	and    ax,0x4500
  40477c:	66 3d 00 01          	cmp    ax,0x100
  404780:	0f 84 1f 05 00 00    	je     404ca5 <___pformat_xldouble+0x545>
  404786:	0f b7 55 c8          	movzx  edx,WORD PTR [ebp-0x38]
  40478a:	89 d3                	mov    ebx,edx
  40478c:	81 e3 00 80 00 00    	and    ebx,0x8000
  404792:	0f 85 48 01 00 00    	jne    4048e0 <___pformat_xldouble+0x180>
  404798:	d9 e5                	fxam   
  40479a:	9b df e0             	fstsw  ax
  40479d:	dd d8                	fstp   st(0)
  40479f:	66 25 00 45          	and    ax,0x4500
  4047a3:	66 3d 00 05          	cmp    ax,0x500
  4047a7:	0f 84 16 05 00 00    	je     404cc3 <___pformat_xldouble+0x563>
  4047ad:	66 81 e2 ff 7f       	and    dx,0x7fff
  4047b2:	0f 84 b8 01 00 00    	je     404970 <___pformat_xldouble+0x210>
  4047b8:	8d b2 01 c0 ff ff    	lea    esi,[edx-0x3fff]
  4047be:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  4047c1:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  4047c4:	8b 5f 0c             	mov    ebx,DWORD PTR [edi+0xc]
  4047c7:	83 fb 0e             	cmp    ebx,0xe
  4047ca:	0f 86 26 01 00 00    	jbe    4048f6 <___pformat_xldouble+0x196>
  4047d0:	89 d1                	mov    ecx,edx
  4047d2:	09 c1                	or     ecx,eax
  4047d4:	0f 84 fc 04 00 00    	je     404cd6 <___pformat_xldouble+0x576>
  4047da:	8d 4d d6             	lea    ecx,[ebp-0x2a]
  4047dd:	89 4d a4             	mov    DWORD PTR [ebp-0x5c],ecx
  4047e0:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  4047e3:	89 7d a8             	mov    DWORD PTR [ebp-0x58],edi
  4047e6:	eb 5e                	jmp    404846 <___pformat_xldouble+0xe6>
  4047e8:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  4047eb:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4047ee:	85 c9                	test   ecx,ecx
  4047f0:	7e 09                	jle    4047fb <___pformat_xldouble+0x9b>
  4047f2:	8b 5d a8             	mov    ebx,DWORD PTR [ebp-0x58]
  4047f5:	83 e9 01             	sub    ecx,0x1
  4047f8:	89 4b 0c             	mov    DWORD PTR [ebx+0xc],ecx
  4047fb:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  4047fe:	0f ac d0 04          	shrd   eax,edx,0x4
  404802:	c1 ea 04             	shr    edx,0x4
  404805:	85 ff                	test   edi,edi
  404807:	89 4d b0             	mov    DWORD PTR [ebp-0x50],ecx
  40480a:	0f 84 a8 00 00 00    	je     4048b8 <___pformat_xldouble+0x158>
  404810:	8b 4d b0             	mov    ecx,DWORD PTR [ebp-0x50]
  404813:	83 c1 01             	add    ecx,0x1
  404816:	83 ff 09             	cmp    edi,0x9
  404819:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  40481c:	0f 8e b5 00 00 00    	jle    4048d7 <___pformat_xldouble+0x177>
  404822:	8d 4f 37             	lea    ecx,[edi+0x37]
  404825:	8b 7d a8             	mov    edi,DWORD PTR [ebp-0x58]
  404828:	8b 7f 04             	mov    edi,DWORD PTR [edi+0x4]
  40482b:	89 7d a0             	mov    DWORD PTR [ebp-0x60],edi
  40482e:	0f b6 5d a0          	movzx  ebx,BYTE PTR [ebp-0x60]
  404832:	83 e3 20             	and    ebx,0x20
  404835:	09 d9                	or     ecx,ebx
  404837:	8b 7d b0             	mov    edi,DWORD PTR [ebp-0x50]
  40483a:	88 0f                	mov    BYTE PTR [edi],cl
  40483c:	89 d7                	mov    edi,edx
  40483e:	09 c7                	or     edi,eax
  404840:	0f 84 60 01 00 00    	je     4049a6 <___pformat_xldouble+0x246>
  404846:	89 c7                	mov    edi,eax
  404848:	89 c1                	mov    ecx,eax
  40484a:	83 e7 0f             	and    edi,0xf
  40484d:	89 fb                	mov    ebx,edi
  40484f:	31 f9                	xor    ecx,edi
  404851:	c1 fb 1f             	sar    ebx,0x1f
  404854:	31 d3                	xor    ebx,edx
  404856:	09 cb                	or     ebx,ecx
  404858:	75 8e                	jne    4047e8 <___pformat_xldouble+0x88>
  40485a:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  40485d:	39 4d ac             	cmp    DWORD PTR [ebp-0x54],ecx
  404860:	77 1e                	ja     404880 <___pformat_xldouble+0x120>
  404862:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  404865:	f6 41 05 08          	test   BYTE PTR [ecx+0x5],0x8
  404869:	75 15                	jne    404880 <___pformat_xldouble+0x120>
  40486b:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  40486e:	89 4d b0             	mov    DWORD PTR [ebp-0x50],ecx
  404871:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  404874:	8b 59 0c             	mov    ebx,DWORD PTR [ecx+0xc]
  404877:	85 db                	test   ebx,ebx
  404879:	7e 11                	jle    40488c <___pformat_xldouble+0x12c>
  40487b:	90                   	nop
  40487c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404880:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  404883:	8d 59 01             	lea    ebx,[ecx+0x1]
  404886:	89 5d b0             	mov    DWORD PTR [ebp-0x50],ebx
  404889:	c6 01 2e             	mov    BYTE PTR [ecx],0x2e
  40488c:	89 c1                	mov    ecx,eax
  40488e:	83 f1 01             	xor    ecx,0x1
  404891:	09 d1                	or     ecx,edx
  404893:	74 17                	je     4048ac <___pformat_xldouble+0x14c>
  404895:	8d 4e ff             	lea    ecx,[esi-0x1]
  404898:	0f ac d0 01          	shrd   eax,edx,0x1
  40489c:	89 ce                	mov    esi,ecx
  40489e:	89 c3                	mov    ebx,eax
  4048a0:	d1 ea                	shr    edx,1
  4048a2:	83 f3 01             	xor    ebx,0x1
  4048a5:	09 d3                	or     ebx,edx
  4048a7:	8d 4e ff             	lea    ecx,[esi-0x1]
  4048aa:	75 ec                	jne    404898 <___pformat_xldouble+0x138>
  4048ac:	31 c0                	xor    eax,eax
  4048ae:	31 d2                	xor    edx,edx
  4048b0:	85 ff                	test   edi,edi
  4048b2:	0f 85 58 ff ff ff    	jne    404810 <___pformat_xldouble+0xb0>
  4048b8:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  4048bb:	39 4d b0             	cmp    DWORD PTR [ebp-0x50],ecx
  4048be:	77 0e                	ja     4048ce <___pformat_xldouble+0x16e>
  4048c0:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  4048c3:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4048c6:	85 c9                	test   ecx,ecx
  4048c8:	0f 88 b7 01 00 00    	js     404a85 <___pformat_xldouble+0x325>
  4048ce:	8b 4d b0             	mov    ecx,DWORD PTR [ebp-0x50]
  4048d1:	83 c1 01             	add    ecx,0x1
  4048d4:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  4048d7:	8d 4f 30             	lea    ecx,[edi+0x30]
  4048da:	e9 58 ff ff ff       	jmp    404837 <___pformat_xldouble+0xd7>
  4048df:	90                   	nop
  4048e0:	81 4f 04 80 00 00 00 	or     DWORD PTR [edi+0x4],0x80
  4048e7:	e9 ac fe ff ff       	jmp    404798 <___pformat_xldouble+0x38>
  4048ec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4048f0:	0f a4 c2 01          	shld   edx,eax,0x1
  4048f4:	01 c0                	add    eax,eax
  4048f6:	85 d2                	test   edx,edx
  4048f8:	79 f6                	jns    4048f0 <___pformat_xldouble+0x190>
  4048fa:	b9 0e 00 00 00       	mov    ecx,0xe
  4048ff:	0f ac d0 01          	shrd   eax,edx,0x1
  404903:	29 d9                	sub    ecx,ebx
  404905:	d1 ea                	shr    edx,1
  404907:	c1 e1 02             	shl    ecx,0x2
  40490a:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40490d:	b8 04 00 00 00       	mov    eax,0x4
  404912:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
  404915:	31 d2                	xor    edx,edx
  404917:	0f a5 c2             	shld   edx,eax,cl
  40491a:	d3 e0                	shl    eax,cl
  40491c:	f6 c1 20             	test   cl,0x20
  40491f:	74 04                	je     404925 <___pformat_xldouble+0x1c5>
  404921:	89 c2                	mov    edx,eax
  404923:	31 c0                	xor    eax,eax
  404925:	01 45 b0             	add    DWORD PTR [ebp-0x50],eax
  404928:	11 55 b4             	adc    DWORD PTR [ebp-0x4c],edx
  40492b:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  40492e:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
  404931:	85 d2                	test   edx,edx
  404933:	0f 88 64 03 00 00    	js     404c9d <___pformat_xldouble+0x53d>
  404939:	0f a4 c2 01          	shld   edx,eax,0x1
  40493d:	01 c0                	add    eax,eax
  40493f:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  404942:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
  404945:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  404948:	b9 0f 00 00 00       	mov    ecx,0xf
  40494d:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
  404950:	29 d9                	sub    ecx,ebx
  404952:	c1 e1 02             	shl    ecx,0x2
  404955:	0f ad d0             	shrd   eax,edx,cl
  404958:	d3 ea                	shr    edx,cl
  40495a:	f6 c1 20             	test   cl,0x20
  40495d:	0f 84 77 fe ff ff    	je     4047da <___pformat_xldouble+0x7a>
  404963:	89 d0                	mov    eax,edx
  404965:	31 d2                	xor    edx,edx
  404967:	e9 6e fe ff ff       	jmp    4047da <___pformat_xldouble+0x7a>
  40496c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404970:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  404973:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  404976:	89 d6                	mov    esi,edx
  404978:	09 c6                	or     esi,eax
  40497a:	0f 84 d7 02 00 00    	je     404c57 <___pformat_xldouble+0x4f7>
  404980:	85 d2                	test   edx,edx
  404982:	0f 88 84 03 00 00    	js     404d0c <___pformat_xldouble+0x5ac>
  404988:	b9 01 c0 ff ff       	mov    ecx,0xffffc001
  40498d:	8d 76 00             	lea    esi,[esi+0x0]
  404990:	0f a4 c2 01          	shld   edx,eax,0x1
  404994:	89 cb                	mov    ebx,ecx
  404996:	01 c0                	add    eax,eax
  404998:	83 e9 01             	sub    ecx,0x1
  40499b:	85 d2                	test   edx,edx
  40499d:	79 f1                	jns    404990 <___pformat_xldouble+0x230>
  40499f:	89 de                	mov    esi,ebx
  4049a1:	e9 1e fe ff ff       	jmp    4047c4 <___pformat_xldouble+0x64>
  4049a6:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  4049a9:	39 45 ac             	cmp    DWORD PTR [ebp-0x54],eax
  4049ac:	8b 7d a8             	mov    edi,DWORD PTR [ebp-0x58]
  4049af:	0f 84 52 03 00 00    	je     404d07 <___pformat_xldouble+0x5a7>
  4049b5:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  4049b8:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  4049bb:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  4049be:	85 c0                	test   eax,eax
  4049c0:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
  4049c3:	0f 8e 7c 02 00 00    	jle    404c45 <___pformat_xldouble+0x4e5>
  4049c9:	8b 57 0c             	mov    edx,DWORD PTR [edi+0xc]
  4049cc:	0f bf f6             	movsx  esi,si
  4049cf:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
  4049d2:	2b 45 a4             	sub    eax,DWORD PTR [ebp-0x5c]
  4049d5:	89 75 a8             	mov    DWORD PTR [ebp-0x58],esi
  4049d8:	85 d2                	test   edx,edx
  4049da:	7e 02                	jle    4049de <___pformat_xldouble+0x27e>
  4049dc:	01 d0                	add    eax,edx
  4049de:	8b 55 b0             	mov    edx,DWORD PTR [ebp-0x50]
  4049e1:	81 e2 c0 01 00 00    	and    edx,0x1c0
  4049e7:	83 fa 01             	cmp    edx,0x1
  4049ea:	19 d2                	sbb    edx,edx
  4049ec:	8d 74 10 06          	lea    esi,[eax+edx*1+0x6]
  4049f0:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  4049f3:	ba 67 66 66 66       	mov    edx,0x66666667
  4049f8:	f7 ea                	imul   edx
  4049fa:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  4049fd:	c1 fa 02             	sar    edx,0x2
  404a00:	c1 f8 1f             	sar    eax,0x1f
  404a03:	29 c2                	sub    edx,eax
  404a05:	89 d1                	mov    ecx,edx
  404a07:	0f 84 ee 02 00 00    	je     404cfb <___pformat_xldouble+0x59b>
  404a0d:	bb 02 00 00 00       	mov    ebx,0x2
  404a12:	b8 67 66 66 66       	mov    eax,0x66666667
  404a17:	83 c6 01             	add    esi,0x1
  404a1a:	f7 e9                	imul   ecx
  404a1c:	83 c3 01             	add    ebx,0x1
  404a1f:	c1 f9 1f             	sar    ecx,0x1f
  404a22:	c1 fa 02             	sar    edx,0x2
  404a25:	29 ca                	sub    edx,ecx
  404a27:	89 d1                	mov    ecx,edx
  404a29:	75 e7                	jne    404a12 <___pformat_xldouble+0x2b2>
  404a2b:	0f bf c3             	movsx  eax,bx
  404a2e:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  404a31:	39 75 a0             	cmp    DWORD PTR [ebp-0x60],esi
  404a34:	7e 5a                	jle    404a90 <___pformat_xldouble+0x330>
  404a36:	8b 45 a0             	mov    eax,DWORD PTR [ebp-0x60]
  404a39:	29 f0                	sub    eax,esi
  404a3b:	f7 45 b0 00 06 00 00 	test   DWORD PTR [ebp-0x50],0x600
  404a42:	0f 85 1a 02 00 00    	jne    404c62 <___pformat_xldouble+0x502>
  404a48:	8d 50 ff             	lea    edx,[eax-0x1]
  404a4b:	85 c0                	test   eax,eax
  404a4d:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  404a50:	7e 45                	jle    404a97 <___pformat_xldouble+0x337>
  404a52:	89 fa                	mov    edx,edi
  404a54:	b8 20 00 00 00       	mov    eax,0x20
  404a59:	e8 32 ee ff ff       	call   403890 <___pformat_putc>
  404a5e:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404a61:	8d 50 ff             	lea    edx,[eax-0x1]
  404a64:	85 c0                	test   eax,eax
  404a66:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  404a69:	7f e7                	jg     404a52 <___pformat_xldouble+0x2f2>
  404a6b:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404a6e:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  404a71:	f6 45 b0 80          	test   BYTE PTR [ebp-0x50],0x80
  404a75:	74 26                	je     404a9d <___pformat_xldouble+0x33d>
  404a77:	89 fa                	mov    edx,edi
  404a79:	b8 2d 00 00 00       	mov    eax,0x2d
  404a7e:	e8 0d ee ff ff       	call   403890 <___pformat_putc>
  404a83:	eb 2f                	jmp    404ab4 <___pformat_xldouble+0x354>
  404a85:	8b 7d b0             	mov    edi,DWORD PTR [ebp-0x50]
  404a88:	89 7d ac             	mov    DWORD PTR [ebp-0x54],edi
  404a8b:	e9 ac fd ff ff       	jmp    40483c <___pformat_xldouble+0xdc>
  404a90:	c7 47 08 ff ff ff ff 	mov    DWORD PTR [edi+0x8],0xffffffff
  404a97:	f6 45 b0 80          	test   BYTE PTR [ebp-0x50],0x80
  404a9b:	75 da                	jne    404a77 <___pformat_xldouble+0x317>
  404a9d:	f7 45 b0 00 01 00 00 	test   DWORD PTR [ebp-0x50],0x100
  404aa4:	0f 85 c0 01 00 00    	jne    404c6a <___pformat_xldouble+0x50a>
  404aaa:	f6 45 b0 40          	test   BYTE PTR [ebp-0x50],0x40
  404aae:	0f 85 d8 01 00 00    	jne    404c8c <___pformat_xldouble+0x52c>
  404ab4:	89 fa                	mov    edx,edi
  404ab6:	b8 30 00 00 00       	mov    eax,0x30
  404abb:	e8 d0 ed ff ff       	call   403890 <___pformat_putc>
  404ac0:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404ac3:	89 fa                	mov    edx,edi
  404ac5:	83 e0 20             	and    eax,0x20
  404ac8:	83 c8 58             	or     eax,0x58
  404acb:	e8 c0 ed ff ff       	call   403890 <___pformat_putc>
  404ad0:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404ad3:	85 c0                	test   eax,eax
  404ad5:	7e 25                	jle    404afc <___pformat_xldouble+0x39c>
  404ad7:	f6 47 05 02          	test   BYTE PTR [edi+0x5],0x2
  404adb:	74 1f                	je     404afc <___pformat_xldouble+0x39c>
  404add:	83 e8 01             	sub    eax,0x1
  404ae0:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  404ae3:	89 fa                	mov    edx,edi
  404ae5:	b8 30 00 00 00       	mov    eax,0x30
  404aea:	e8 a1 ed ff ff       	call   403890 <___pformat_putc>
  404aef:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404af2:	8d 50 ff             	lea    edx,[eax-0x1]
  404af5:	85 c0                	test   eax,eax
  404af7:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  404afa:	7f e7                	jg     404ae3 <___pformat_xldouble+0x383>
  404afc:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  404aff:	39 45 ac             	cmp    DWORD PTR [ebp-0x54],eax
  404b02:	8b 5d ac             	mov    ebx,DWORD PTR [ebp-0x54]
  404b05:	77 19                	ja     404b20 <___pformat_xldouble+0x3c0>
  404b07:	e9 a1 00 00 00       	jmp    404bad <___pformat_xldouble+0x44d>
  404b0c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404b10:	89 fa                	mov    edx,edi
  404b12:	e8 79 ed ff ff       	call   403890 <___pformat_putc>
  404b17:	3b 5d a4             	cmp    ebx,DWORD PTR [ebp-0x5c]
  404b1a:	0f 84 8d 00 00 00    	je     404bad <___pformat_xldouble+0x44d>
  404b20:	83 eb 01             	sub    ebx,0x1
  404b23:	0f be 03             	movsx  eax,BYTE PTR [ebx]
  404b26:	83 f8 2e             	cmp    eax,0x2e
  404b29:	75 e5                	jne    404b10 <___pformat_xldouble+0x3b0>
  404b2b:	83 7f 10 fd          	cmp    DWORD PTR [edi+0x10],0xfffffffd
  404b2f:	0f 84 cc 00 00 00    	je     404c01 <___pformat_xldouble+0x4a1>
  404b35:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  404b39:	66 85 d2             	test   dx,dx
  404b3c:	0f 84 ae 00 00 00    	je     404bf0 <___pformat_xldouble+0x490>
  404b42:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
  404b45:	89 65 b0             	mov    DWORD PTR [ebp-0x50],esp
  404b48:	83 c0 0f             	add    eax,0xf
  404b4b:	83 e0 f0             	and    eax,0xfffffff0
  404b4e:	e8 cd d5 ff ff       	call   402120 <___chkstk_ms>
  404b53:	29 c4                	sub    esp,eax
  404b55:	8d 74 24 10          	lea    esi,[esp+0x10]
  404b59:	8d 45 bc             	lea    eax,[ebp-0x44]
  404b5c:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
  404b63:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  404b67:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  404b6b:	89 34 24             	mov    DWORD PTR [esp],esi
  404b6e:	e8 5d 20 00 00       	call   406bd0 <_wcrtomb>
  404b73:	85 c0                	test   eax,eax
  404b75:	0f 8e 00 01 00 00    	jle    404c7b <___pformat_xldouble+0x51b>
  404b7b:	01 f0                	add    eax,esi
  404b7d:	89 5d ac             	mov    DWORD PTR [ebp-0x54],ebx
  404b80:	89 f3                	mov    ebx,esi
  404b82:	89 c6                	mov    esi,eax
  404b84:	83 c3 01             	add    ebx,0x1
  404b87:	0f be 43 ff          	movsx  eax,BYTE PTR [ebx-0x1]
  404b8b:	89 fa                	mov    edx,edi
  404b8d:	e8 fe ec ff ff       	call   403890 <___pformat_putc>
  404b92:	39 f3                	cmp    ebx,esi
  404b94:	75 ee                	jne    404b84 <___pformat_xldouble+0x424>
  404b96:	8b 5d ac             	mov    ebx,DWORD PTR [ebp-0x54]
  404b99:	8b 65 b0             	mov    esp,DWORD PTR [ebp-0x50]
  404b9c:	e9 76 ff ff ff       	jmp    404b17 <___pformat_xldouble+0x3b7>
  404ba1:	89 fa                	mov    edx,edi
  404ba3:	b8 30 00 00 00       	mov    eax,0x30
  404ba8:	e8 e3 ec ff ff       	call   403890 <___pformat_putc>
  404bad:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  404bb0:	8d 50 ff             	lea    edx,[eax-0x1]
  404bb3:	85 c0                	test   eax,eax
  404bb5:	89 57 0c             	mov    DWORD PTR [edi+0xc],edx
  404bb8:	7f e7                	jg     404ba1 <___pformat_xldouble+0x441>
  404bba:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404bbd:	89 fa                	mov    edx,edi
  404bbf:	83 e0 20             	and    eax,0x20
  404bc2:	83 c8 50             	or     eax,0x50
  404bc5:	e8 c6 ec ff ff       	call   403890 <___pformat_putc>
  404bca:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  404bcd:	89 f9                	mov    ecx,edi
  404bcf:	01 47 08             	add    DWORD PTR [edi+0x8],eax
  404bd2:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  404bd5:	81 4f 04 c0 01 00 00 	or     DWORD PTR [edi+0x4],0x1c0
  404bdc:	99                   	cdq    
  404bdd:	e8 5e ef ff ff       	call   403b40 <___pformat_int>
  404be2:	8d 65 f4             	lea    esp,[ebp-0xc]
  404be5:	5b                   	pop    ebx
  404be6:	5e                   	pop    esi
  404be7:	5f                   	pop    edi
  404be8:	5d                   	pop    ebp
  404be9:	c3                   	ret    
  404bea:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404bf0:	89 fa                	mov    edx,edi
  404bf2:	b8 2e 00 00 00       	mov    eax,0x2e
  404bf7:	e8 94 ec ff ff       	call   403890 <___pformat_putc>
  404bfc:	e9 16 ff ff ff       	jmp    404b17 <___pformat_xldouble+0x3b7>
  404c01:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
  404c08:	8d 75 bc             	lea    esi,[ebp-0x44]
  404c0b:	e8 e0 35 00 00       	call   4081f0 <_localeconv>
  404c10:	89 74 24 0c          	mov    DWORD PTR [esp+0xc],esi
  404c14:	c7 44 24 08 10 00 00 	mov    DWORD PTR [esp+0x8],0x10
  404c1b:	00 
  404c1c:	8b 00                	mov    eax,DWORD PTR [eax]
  404c1e:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  404c22:	8d 45 ba             	lea    eax,[ebp-0x46]
  404c25:	89 04 24             	mov    DWORD PTR [esp],eax
  404c28:	e8 f3 22 00 00       	call   406f20 <_mbrtowc>
  404c2d:	85 c0                	test   eax,eax
  404c2f:	0f 8e 85 00 00 00    	jle    404cba <___pformat_xldouble+0x55a>
  404c35:	0f b7 55 ba          	movzx  edx,WORD PTR [ebp-0x46]
  404c39:	66 89 57 14          	mov    WORD PTR [edi+0x14],dx
  404c3d:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
  404c40:	e9 f4 fe ff ff       	jmp    404b39 <___pformat_xldouble+0x3d9>
  404c45:	0f bf c6             	movsx  eax,si
  404c48:	c7 45 9c 02 00 00 00 	mov    DWORD PTR [ebp-0x64],0x2
  404c4f:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  404c52:	e9 40 fe ff ff       	jmp    404a97 <___pformat_xldouble+0x337>
  404c57:	31 f6                	xor    esi,esi
  404c59:	31 c0                	xor    eax,eax
  404c5b:	31 d2                	xor    edx,edx
  404c5d:	e9 62 fb ff ff       	jmp    4047c4 <___pformat_xldouble+0x64>
  404c62:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  404c65:	e9 2d fe ff ff       	jmp    404a97 <___pformat_xldouble+0x337>
  404c6a:	89 fa                	mov    edx,edi
  404c6c:	b8 2b 00 00 00       	mov    eax,0x2b
  404c71:	e8 1a ec ff ff       	call   403890 <___pformat_putc>
  404c76:	e9 39 fe ff ff       	jmp    404ab4 <___pformat_xldouble+0x354>
  404c7b:	89 fa                	mov    edx,edi
  404c7d:	b8 2e 00 00 00       	mov    eax,0x2e
  404c82:	e8 09 ec ff ff       	call   403890 <___pformat_putc>
  404c87:	e9 0d ff ff ff       	jmp    404b99 <___pformat_xldouble+0x439>
  404c8c:	89 fa                	mov    edx,edi
  404c8e:	b8 20 00 00 00       	mov    eax,0x20
  404c93:	e8 f8 eb ff ff       	call   403890 <___pformat_putc>
  404c98:	e9 17 fe ff ff       	jmp    404ab4 <___pformat_xldouble+0x354>
  404c9d:	83 c6 01             	add    esi,0x1
  404ca0:	e9 a0 fc ff ff       	jmp    404945 <___pformat_xldouble+0x1e5>
  404ca5:	dd d8                	fstp   st(0)
  404ca7:	89 f9                	mov    ecx,edi
  404ca9:	ba 50 a1 40 00       	mov    edx,0x40a150
  404cae:	31 c0                	xor    eax,eax
  404cb0:	e8 fb ed ff ff       	call   403ab0 <___pformat_emit_inf_or_nan>
  404cb5:	e9 28 ff ff ff       	jmp    404be2 <___pformat_xldouble+0x482>
  404cba:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  404cbe:	e9 7a ff ff ff       	jmp    404c3d <___pformat_xldouble+0x4dd>
  404cc3:	89 f9                	mov    ecx,edi
  404cc5:	ba 54 a1 40 00       	mov    edx,0x40a154
  404cca:	89 d8                	mov    eax,ebx
  404ccc:	e8 df ed ff ff       	call   403ab0 <___pformat_emit_inf_or_nan>
  404cd1:	e9 0c ff ff ff       	jmp    404be2 <___pformat_xldouble+0x482>
  404cd6:	8d 45 d6             	lea    eax,[ebp-0x2a]
  404cd9:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
  404cdc:	85 db                	test   ebx,ebx
  404cde:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404ce1:	7e 33                	jle    404d16 <___pformat_xldouble+0x5b6>
  404ce3:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  404ce6:	c6 45 d6 2e          	mov    BYTE PTR [ebp-0x2a],0x2e
  404cea:	8d 45 d7             	lea    eax,[ebp-0x29]
  404ced:	8d 50 01             	lea    edx,[eax+0x1]
  404cf0:	89 55 ac             	mov    DWORD PTR [ebp-0x54],edx
  404cf3:	c6 00 30             	mov    BYTE PTR [eax],0x30
  404cf6:	e9 c0 fc ff ff       	jmp    4049bb <___pformat_xldouble+0x25b>
  404cfb:	c7 45 9c 02 00 00 00 	mov    DWORD PTR [ebp-0x64],0x2
  404d02:	e9 2a fd ff ff       	jmp    404a31 <___pformat_xldouble+0x2d1>
  404d07:	8b 5f 0c             	mov    ebx,DWORD PTR [edi+0xc]
  404d0a:	eb d0                	jmp    404cdc <___pformat_xldouble+0x57c>
  404d0c:	be 02 c0 ff ff       	mov    esi,0xffffc002
  404d11:	e9 ae fa ff ff       	jmp    4047c4 <___pformat_xldouble+0x64>
  404d16:	89 c2                	mov    edx,eax
  404d18:	80 e6 08             	and    dh,0x8
  404d1b:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  404d1e:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  404d21:	74 ca                	je     404ced <___pformat_xldouble+0x58d>
  404d23:	eb c1                	jmp    404ce6 <___pformat_xldouble+0x586>
  404d25:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404d29:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00404d30 <___mingw_pformat>:
  404d30:	55                   	push   ebp
  404d31:	57                   	push   edi
  404d32:	56                   	push   esi
  404d33:	53                   	push   ebx
  404d34:	83 ec 5c             	sub    esp,0x5c
  404d37:	8b 44 24 74          	mov    eax,DWORD PTR [esp+0x74]
  404d3b:	81 64 24 70 00 30 00 	and    DWORD PTR [esp+0x70],0x3000
  404d42:	00 
  404d43:	8b 74 24 7c          	mov    esi,DWORD PTR [esp+0x7c]
  404d47:	c7 04 24 6d a1 40 00 	mov    DWORD PTR [esp],0x40a16d
  404d4e:	8b ac 24 80 00 00 00 	mov    ebp,DWORD PTR [esp+0x80]
  404d55:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  404d59:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404d5d:	c7 44 24 34 ff ff ff 	mov    DWORD PTR [esp+0x34],0xffffffff
  404d64:	ff 
  404d65:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  404d6c:	ff 
  404d6d:	c7 44 24 3c fd ff ff 	mov    DWORD PTR [esp+0x3c],0xfffffffd
  404d74:	ff 
  404d75:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  404d79:	31 c0                	xor    eax,eax
  404d7b:	66 89 44 24 40       	mov    WORD PTR [esp+0x40],ax
  404d80:	8b 44 24 78          	mov    eax,DWORD PTR [esp+0x78]
  404d84:	c7 44 24 44 00 00 00 	mov    DWORD PTR [esp+0x44],0x0
  404d8b:	00 
  404d8c:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  404d90:	e8 63 34 00 00       	call   4081f8 <_getenv>
  404d95:	85 c0                	test   eax,eax
  404d97:	0f 84 d3 00 00 00    	je     404e70 <___mingw_pformat+0x140>
  404d9d:	0f be 00             	movsx  eax,BYTE PTR [eax]
  404da0:	83 e8 30             	sub    eax,0x30
  404da3:	83 f8 02             	cmp    eax,0x2
  404da6:	0f 87 c4 00 00 00    	ja     404e70 <___mingw_pformat+0x140>
  404dac:	b8 02 00 00 00       	mov    eax,0x2
  404db1:	89 44 24 4c          	mov    DWORD PTR [esp+0x4c],eax
  404db5:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404db9:	80 cc 02             	or     ah,0x2
  404dbc:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  404dc0:	0f be 06             	movsx  eax,BYTE PTR [esi]
  404dc3:	8d 5e 01             	lea    ebx,[esi+0x1]
  404dc6:	89 d9                	mov    ecx,ebx
  404dc8:	85 c0                	test   eax,eax
  404dca:	0f 84 92 00 00 00    	je     404e62 <___mingw_pformat+0x132>
  404dd0:	83 f8 25             	cmp    eax,0x25
  404dd3:	0f 85 de 00 00 00    	jne    404eb7 <___mingw_pformat+0x187>
  404dd9:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404ddd:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  404de4:	ff 
  404de5:	c7 44 24 34 ff ff ff 	mov    DWORD PTR [esp+0x34],0xffffffff
  404dec:	ff 
  404ded:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  404df4:	00 
  404df5:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  404df9:	0f b6 56 01          	movzx  edx,BYTE PTR [esi+0x1]
  404dfd:	8d 44 24 34          	lea    eax,[esp+0x34]
  404e01:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  404e05:	c7 44 24 10 00 00 00 	mov    DWORD PTR [esp+0x10],0x0
  404e0c:	00 
  404e0d:	84 d2                	test   dl,dl
  404e0f:	74 3f                	je     404e50 <___mingw_pformat+0x120>
  404e11:	8d 42 e0             	lea    eax,[edx-0x20]
  404e14:	0f be fa             	movsx  edi,dl
  404e17:	3c 5a                	cmp    al,0x5a
  404e19:	8d 71 01             	lea    esi,[ecx+0x1]
  404e1c:	0f 87 70 04 00 00    	ja     405292 <___mingw_pformat+0x562>
  404e22:	0f b6 c0             	movzx  eax,al
  404e25:	ff 24 85 84 a1 40 00 	jmp    DWORD PTR [eax*4+0x40a184]
  404e2c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404e30:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  404e34:	89 f1                	mov    ecx,esi
  404e36:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  404e3d:	00 
  404e3e:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404e45:	00 
  404e46:	84 d2                	test   dl,dl
  404e48:	75 c7                	jne    404e11 <___mingw_pformat+0xe1>
  404e4a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404e50:	89 ce                	mov    esi,ecx
  404e52:	0f be 06             	movsx  eax,BYTE PTR [esi]
  404e55:	8d 5e 01             	lea    ebx,[esi+0x1]
  404e58:	89 d9                	mov    ecx,ebx
  404e5a:	85 c0                	test   eax,eax
  404e5c:	0f 85 6e ff ff ff    	jne    404dd0 <___mingw_pformat+0xa0>
  404e62:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  404e66:	83 c4 5c             	add    esp,0x5c
  404e69:	5b                   	pop    ebx
  404e6a:	5e                   	pop    esi
  404e6b:	5f                   	pop    edi
  404e6c:	5d                   	pop    ebp
  404e6d:	c3                   	ret    
  404e6e:	66 90                	xchg   ax,ax
  404e70:	f6 05 6c d0 40 00 01 	test   BYTE PTR ds:0x40d06c,0x1
  404e77:	0f 85 2f ff ff ff    	jne    404dac <___mingw_pformat+0x7c>
  404e7d:	b8 03 00 00 00       	mov    eax,0x3
  404e82:	e9 2a ff ff ff       	jmp    404db1 <___mingw_pformat+0x81>
  404e87:	80 79 01 6c          	cmp    BYTE PTR [ecx+0x1],0x6c
  404e8b:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  404e92:	00 
  404e93:	75 0b                	jne    404ea0 <___mingw_pformat+0x170>
  404e95:	8d 71 02             	lea    esi,[ecx+0x2]
  404e98:	c7 44 24 14 03 00 00 	mov    DWORD PTR [esp+0x14],0x3
  404e9f:	00 
  404ea0:	83 4c 24 30 04       	or     DWORD PTR [esp+0x30],0x4
  404ea5:	89 f1                	mov    ecx,esi
  404ea7:	0f b6 16             	movzx  edx,BYTE PTR [esi]
  404eaa:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404eb1:	00 
  404eb2:	e9 56 ff ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  404eb7:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  404ebb:	89 de                	mov    esi,ebx
  404ebd:	e8 ce e9 ff ff       	call   403890 <___pformat_putc>
  404ec2:	e9 f9 fe ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  404ec7:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  404ecb:	89 e8                	mov    eax,ebp
  404ecd:	83 ea 02             	sub    edx,0x2
  404ed0:	83 fa 01             	cmp    edx,0x1
  404ed3:	0f 86 07 05 00 00    	jbe    4053e0 <___mingw_pformat+0x6b0>
  404ed9:	8b 18                	mov    ebx,DWORD PTR [eax]
  404edb:	83 c5 04             	add    ebp,0x4
  404ede:	85 db                	test   ebx,ebx
  404ee0:	0f 84 89 06 00 00    	je     40556f <___mingw_pformat+0x83f>
  404ee6:	89 1c 24             	mov    DWORD PTR [esp],ebx
  404ee9:	e8 72 32 00 00       	call   408160 <_strlen>
  404eee:	89 c2                	mov    edx,eax
  404ef0:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  404ef4:	89 d8                	mov    eax,ebx
  404ef6:	e8 05 eb ff ff       	call   403a00 <___pformat_putchars>
  404efb:	e9 c0 fe ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  404f00:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  404f04:	89 e8                	mov    eax,ebp
  404f06:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  404f0d:	ff 
  404f0e:	83 ea 02             	sub    edx,0x2
  404f11:	83 fa 01             	cmp    edx,0x1
  404f14:	0f 86 23 03 00 00    	jbe    40523d <___mingw_pformat+0x50d>
  404f1a:	8b 00                	mov    eax,DWORD PTR [eax]
  404f1c:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  404f20:	ba 01 00 00 00       	mov    edx,0x1
  404f25:	83 c5 04             	add    ebp,0x4
  404f28:	88 44 24 20          	mov    BYTE PTR [esp+0x20],al
  404f2c:	8d 44 24 20          	lea    eax,[esp+0x20]
  404f30:	e8 cb ea ff ff       	call   403a00 <___pformat_putchars>
  404f35:	e9 86 fe ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  404f3a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404f40:	83 7c 24 14 04       	cmp    DWORD PTR [esp+0x14],0x4
  404f45:	0f 84 f0 05 00 00    	je     40553b <___mingw_pformat+0x80b>
  404f4b:	83 7c 24 14 01       	cmp    DWORD PTR [esp+0x14],0x1
  404f50:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  404f53:	8b 54 24 44          	mov    edx,DWORD PTR [esp+0x44]
  404f57:	0f 84 17 05 00 00    	je     405474 <___mingw_pformat+0x744>
  404f5d:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
  404f62:	0f 84 43 06 00 00    	je     4055ab <___mingw_pformat+0x87b>
  404f68:	83 7c 24 14 03       	cmp    DWORD PTR [esp+0x14],0x3
  404f6d:	89 10                	mov    DWORD PTR [eax],edx
  404f6f:	0f 84 a9 06 00 00    	je     40561e <___mingw_pformat+0x8ee>
  404f75:	83 c5 04             	add    ebp,0x4
  404f78:	e9 43 fe ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  404f7d:	8d 76 00             	lea    esi,[esi+0x0]
  404f80:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  404f84:	89 f1                	mov    ecx,esi
  404f86:	c7 44 24 14 03 00 00 	mov    DWORD PTR [esp+0x14],0x3
  404f8d:	00 
  404f8e:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404f95:	00 
  404f96:	e9 72 fe ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  404f9b:	90                   	nop
  404f9c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404fa0:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  404fa4:	80 fa 68             	cmp    dl,0x68
  404fa7:	0f 84 4c 05 00 00    	je     4054f9 <___mingw_pformat+0x7c9>
  404fad:	89 f1                	mov    ecx,esi
  404faf:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  404fb6:	00 
  404fb7:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404fbe:	00 
  404fbf:	e9 49 fe ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  404fc4:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  404fc8:	85 c0                	test   eax,eax
  404fca:	75 0e                	jne    404fda <___mingw_pformat+0x2aa>
  404fcc:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404fd0:	39 44 24 30          	cmp    DWORD PTR [esp+0x30],eax
  404fd4:	0f 84 a4 05 00 00    	je     40557e <___mingw_pformat+0x84e>
  404fda:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  404fdd:	8d 5d 04             	lea    ebx,[ebp+0x4]
  404fe0:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  404fe7:	00 
  404fe8:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
  404fec:	89 dd                	mov    ebp,ebx
  404fee:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  404ff2:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  404ff6:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  404ffa:	89 04 24             	mov    DWORD PTR [esp],eax
  404ffd:	b8 78 00 00 00       	mov    eax,0x78
  405002:	e8 69 ed ff ff       	call   403d70 <___pformat_xint>
  405007:	e9 b4 fd ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  40500c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405010:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405014:	83 c8 20             	or     eax,0x20
  405017:	a8 04                	test   al,0x4
  405019:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  40501d:	0f 84 4a 02 00 00    	je     40526d <___mingw_pformat+0x53d>
  405023:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  405026:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  405029:	db 3c 24             	fstp   TBYTE PTR [esp]
  40502c:	89 dd                	mov    ebp,ebx
  40502e:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  405032:	e8 29 f7 ff ff       	call   404760 <___pformat_xldouble>
  405037:	e9 84 fd ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  40503c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405040:	83 7c 24 14 03       	cmp    DWORD PTR [esp+0x14],0x3
  405045:	89 f8                	mov    eax,edi
  405047:	0f 84 80 04 00 00    	je     4054cd <___mingw_pformat+0x79d>
  40504d:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
  405052:	0f 84 27 04 00 00    	je     40547f <___mingw_pformat+0x74f>
  405058:	8b 7d 00             	mov    edi,DWORD PTR [ebp+0x0]
  40505b:	8d 55 04             	lea    edx,[ebp+0x4]
  40505e:	83 7c 24 14 01       	cmp    DWORD PTR [esp+0x14],0x1
  405063:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  40506a:	00 
  40506b:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  40506f:	0f 84 1e 05 00 00    	je     405593 <___mingw_pformat+0x863>
  405075:	83 7c 24 14 04       	cmp    DWORD PTR [esp+0x14],0x4
  40507a:	89 d5                	mov    ebp,edx
  40507c:	0f 84 86 05 00 00    	je     405608 <___mingw_pformat+0x8d8>
  405082:	83 f8 75             	cmp    eax,0x75
  405085:	0f 84 ec 00 00 00    	je     405177 <___mingw_pformat+0x447>
  40508b:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  40508f:	8d 7c 24 2c          	lea    edi,[esp+0x2c]
  405093:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
  405097:	89 3c 24             	mov    DWORD PTR [esp],edi
  40509a:	e8 d1 ec ff ff       	call   403d70 <___pformat_xint>
  40509f:	e9 1c fd ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  4050a4:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4050a8:	83 c8 20             	or     eax,0x20
  4050ab:	a8 04                	test   al,0x4
  4050ad:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  4050b1:	0f 84 15 01 00 00    	je     4051cc <___mingw_pformat+0x49c>
  4050b7:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  4050ba:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  4050bd:	db 3c 24             	fstp   TBYTE PTR [esp]
  4050c0:	89 dd                	mov    ebp,ebx
  4050c2:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4050c6:	e8 15 f5 ff ff       	call   4045e0 <___pformat_gfloat>
  4050cb:	e9 f0 fc ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  4050d0:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4050d4:	83 c8 20             	or     eax,0x20
  4050d7:	a8 04                	test   al,0x4
  4050d9:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  4050dd:	0f 84 0e 01 00 00    	je     4051f1 <___mingw_pformat+0x4c1>
  4050e3:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  4050e6:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  4050e9:	db 3c 24             	fstp   TBYTE PTR [esp]
  4050ec:	89 dd                	mov    ebp,ebx
  4050ee:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4050f2:	e8 09 f4 ff ff       	call   404500 <___pformat_float>
  4050f7:	e9 c4 fc ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  4050fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405100:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405104:	83 c8 20             	or     eax,0x20
  405107:	a8 04                	test   al,0x4
  405109:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  40510d:	0f 84 09 01 00 00    	je     40521c <___mingw_pformat+0x4ec>
  405113:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  405116:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  405119:	db 3c 24             	fstp   TBYTE PTR [esp]
  40511c:	89 dd                	mov    ebp,ebx
  40511e:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  405122:	e8 29 f3 ff ff       	call   404450 <___pformat_efloat>
  405127:	e9 94 fc ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  40512c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405130:	81 4c 24 30 80 00 00 	or     DWORD PTR [esp+0x30],0x80
  405137:	00 
  405138:	83 7c 24 14 03       	cmp    DWORD PTR [esp+0x14],0x3
  40513d:	0f 84 a0 03 00 00    	je     4054e3 <___mingw_pformat+0x7b3>
  405143:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
  405148:	0f 84 48 03 00 00    	je     405496 <___mingw_pformat+0x766>
  40514e:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  405151:	8d 55 04             	lea    edx,[ebp+0x4]
  405154:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405158:	c1 f8 1f             	sar    eax,0x1f
  40515b:	83 7c 24 14 01       	cmp    DWORD PTR [esp+0x14],0x1
  405160:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  405164:	0f 84 4b 04 00 00    	je     4055b5 <___mingw_pformat+0x885>
  40516a:	83 7c 24 14 04       	cmp    DWORD PTR [esp+0x14],0x4
  40516f:	89 d5                	mov    ebp,edx
  405171:	0f 84 7c 04 00 00    	je     4055f3 <___mingw_pformat+0x8c3>
  405177:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  40517b:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  40517f:	8b 54 24 24          	mov    edx,DWORD PTR [esp+0x24]
  405183:	e8 b8 e9 ff ff       	call   403b40 <___pformat_int>
  405188:	e9 33 fc ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  40518d:	8d 76 00             	lea    esi,[esi+0x0]
  405190:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405194:	80 fa 36             	cmp    dl,0x36
  405197:	0f 84 78 03 00 00    	je     405515 <___mingw_pformat+0x7e5>
  40519d:	80 fa 33             	cmp    dl,0x33
  4051a0:	0f 84 a8 02 00 00    	je     40544e <___mingw_pformat+0x71e>
  4051a6:	89 f1                	mov    ecx,esi
  4051a8:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  4051af:	00 
  4051b0:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  4051b7:	00 
  4051b8:	e9 50 fc ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  4051bd:	8d 76 00             	lea    esi,[esi+0x0]
  4051c0:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4051c4:	a8 04                	test   al,0x4
  4051c6:	0f 85 eb fe ff ff    	jne    4050b7 <___mingw_pformat+0x387>
  4051cc:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  4051cf:	8d 5d 08             	lea    ebx,[ebp+0x8]
  4051d2:	db 3c 24             	fstp   TBYTE PTR [esp]
  4051d5:	89 dd                	mov    ebp,ebx
  4051d7:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4051db:	e8 00 f4 ff ff       	call   4045e0 <___pformat_gfloat>
  4051e0:	e9 db fb ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  4051e5:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4051e9:	a8 04                	test   al,0x4
  4051eb:	0f 85 f2 fe ff ff    	jne    4050e3 <___mingw_pformat+0x3b3>
  4051f1:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  4051f4:	8d 5d 08             	lea    ebx,[ebp+0x8]
  4051f7:	db 3c 24             	fstp   TBYTE PTR [esp]
  4051fa:	89 dd                	mov    ebp,ebx
  4051fc:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  405200:	e8 fb f2 ff ff       	call   404500 <___pformat_float>
  405205:	e9 b6 fb ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  40520a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  405210:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405214:	a8 04                	test   al,0x4
  405216:	0f 85 f7 fe ff ff    	jne    405113 <___mingw_pformat+0x3e3>
  40521c:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  40521f:	8d 5d 08             	lea    ebx,[ebp+0x8]
  405222:	db 3c 24             	fstp   TBYTE PTR [esp]
  405225:	89 dd                	mov    ebp,ebx
  405227:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  40522b:	e8 20 f2 ff ff       	call   404450 <___pformat_efloat>
  405230:	e9 8b fb ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  405235:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  40523c:	ff 
  40523d:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  405240:	8d 5d 04             	lea    ebx,[ebp+0x4]
  405243:	ba 01 00 00 00       	mov    edx,0x1
  405248:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  40524c:	89 dd                	mov    ebp,ebx
  40524e:	66 89 44 24 20       	mov    WORD PTR [esp+0x20],ax
  405253:	8d 44 24 20          	lea    eax,[esp+0x20]
  405257:	e8 94 e6 ff ff       	call   4038f0 <___pformat_wputchars>
  40525c:	e9 5f fb ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  405261:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405265:	a8 04                	test   al,0x4
  405267:	0f 85 b6 fd ff ff    	jne    405023 <___mingw_pformat+0x2f3>
  40526d:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  405270:	8d 5d 08             	lea    ebx,[ebp+0x8]
  405273:	db 3c 24             	fstp   TBYTE PTR [esp]
  405276:	89 dd                	mov    ebp,ebx
  405278:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  40527c:	e8 df f4 ff ff       	call   404760 <___pformat_xldouble>
  405281:	e9 3a fb ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  405286:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  40528a:	85 c0                	test   eax,eax
  40528c:	0f 84 8e 01 00 00    	je     405420 <___mingw_pformat+0x6f0>
  405292:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405296:	83 f8 04             	cmp    eax,0x4
  405299:	0f 84 c7 03 00 00    	je     405666 <___mingw_pformat+0x936>
  40529f:	83 ea 30             	sub    edx,0x30
  4052a2:	80 fa 09             	cmp    dl,0x9
  4052a5:	0f 87 bb 03 00 00    	ja     405666 <___mingw_pformat+0x936>
  4052ab:	85 c0                	test   eax,eax
  4052ad:	0f 84 5d 01 00 00    	je     405410 <___mingw_pformat+0x6e0>
  4052b3:	83 f8 02             	cmp    eax,0x2
  4052b6:	0f 84 f0 01 00 00    	je     4054ac <___mingw_pformat+0x77c>
  4052bc:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  4052c0:	85 c0                	test   eax,eax
  4052c2:	74 1b                	je     4052df <___mingw_pformat+0x5af>
  4052c4:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  4052c8:	8b 00                	mov    eax,DWORD PTR [eax]
  4052ca:	85 c0                	test   eax,eax
  4052cc:	0f 88 e7 01 00 00    	js     4054b9 <___mingw_pformat+0x789>
  4052d2:	8d 04 80             	lea    eax,[eax+eax*4]
  4052d5:	8d 44 47 d0          	lea    eax,[edi+eax*2-0x30]
  4052d9:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  4052dd:	89 07                	mov    DWORD PTR [edi],eax
  4052df:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4052e3:	89 f1                	mov    ecx,esi
  4052e5:	e9 23 fb ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  4052ea:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4052f0:	83 7c 24 10 01       	cmp    DWORD PTR [esp+0x10],0x1
  4052f5:	0f 86 51 02 00 00    	jbe    40554c <___mingw_pformat+0x81c>
  4052fb:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4052ff:	89 f1                	mov    ecx,esi
  405301:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  405308:	00 
  405309:	e9 ff fa ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  40530e:	66 90                	xchg   ax,ax
  405310:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405314:	85 c0                	test   eax,eax
  405316:	75 c7                	jne    4052df <___mingw_pformat+0x5af>
  405318:	81 4c 24 30 00 04 00 	or     DWORD PTR [esp+0x30],0x400
  40531f:	00 
  405320:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405324:	89 f1                	mov    ecx,esi
  405326:	e9 e2 fa ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  40532b:	90                   	nop
  40532c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405330:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405334:	85 c0                	test   eax,eax
  405336:	75 a7                	jne    4052df <___mingw_pformat+0x5af>
  405338:	81 4c 24 30 00 01 00 	or     DWORD PTR [esp+0x30],0x100
  40533f:	00 
  405340:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405344:	89 f1                	mov    ecx,esi
  405346:	e9 c2 fa ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  40534b:	90                   	nop
  40534c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405350:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  405354:	85 ff                	test   edi,edi
  405356:	74 a3                	je     4052fb <___mingw_pformat+0x5cb>
  405358:	f6 44 24 10 05       	test   BYTE PTR [esp+0x10],0x5
  40535d:	0f 85 d0 00 00 00    	jne    405433 <___mingw_pformat+0x703>
  405363:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  405366:	8d 7d 04             	lea    edi,[ebp+0x4]
  405369:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  40536d:	85 c0                	test   eax,eax
  40536f:	89 02                	mov    DWORD PTR [edx],eax
  405371:	0f 88 5f 02 00 00    	js     4055d6 <___mingw_pformat+0x8a6>
  405377:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  40537b:	89 fd                	mov    ebp,edi
  40537d:	89 f1                	mov    ecx,esi
  40537f:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  405386:	00 
  405387:	e9 81 fa ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  40538c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405390:	89 f8                	mov    eax,edi
  405392:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  405396:	e8 f5 e4 ff ff       	call   403890 <___pformat_putc>
  40539b:	e9 20 fa ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  4053a0:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  4053a4:	85 c0                	test   eax,eax
  4053a6:	0f 85 33 ff ff ff    	jne    4052df <___mingw_pformat+0x5af>
  4053ac:	81 4c 24 30 00 08 00 	or     DWORD PTR [esp+0x30],0x800
  4053b3:	00 
  4053b4:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4053b8:	89 f1                	mov    ecx,esi
  4053ba:	e9 4e fa ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  4053bf:	90                   	nop
  4053c0:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  4053c4:	85 c0                	test   eax,eax
  4053c6:	0f 85 13 ff ff ff    	jne    4052df <___mingw_pformat+0x5af>
  4053cc:	83 4c 24 30 40       	or     DWORD PTR [esp+0x30],0x40
  4053d1:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4053d5:	89 f1                	mov    ecx,esi
  4053d7:	e9 31 fa ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  4053dc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4053e0:	8b 5d 00             	mov    ebx,DWORD PTR [ebp+0x0]
  4053e3:	8d 7d 04             	lea    edi,[ebp+0x4]
  4053e6:	85 db                	test   ebx,ebx
  4053e8:	0f 84 de 01 00 00    	je     4055cc <___mingw_pformat+0x89c>
  4053ee:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4053f1:	89 fd                	mov    ebp,edi
  4053f3:	e8 08 2e 00 00       	call   408200 <_wcslen>
  4053f8:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  4053fc:	89 c2                	mov    edx,eax
  4053fe:	89 d8                	mov    eax,ebx
  405400:	e8 eb e4 ff ff       	call   4038f0 <___pformat_wputchars>
  405405:	e9 b6 f9 ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  40540a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  405410:	c7 44 24 10 01 00 00 	mov    DWORD PTR [esp+0x10],0x1
  405417:	00 
  405418:	e9 9f fe ff ff       	jmp    4052bc <___mingw_pformat+0x58c>
  40541d:	8d 76 00             	lea    esi,[esi+0x0]
  405420:	81 4c 24 30 00 02 00 	or     DWORD PTR [esp+0x30],0x200
  405427:	00 
  405428:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  40542c:	89 f1                	mov    ecx,esi
  40542e:	e9 da f9 ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  405433:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405437:	89 f1                	mov    ecx,esi
  405439:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  405440:	00 
  405441:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  405448:	00 
  405449:	e9 bf f9 ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  40544e:	80 79 02 32          	cmp    BYTE PTR [ecx+0x2],0x32
  405452:	0f 84 f2 01 00 00    	je     40564a <___mingw_pformat+0x91a>
  405458:	89 f1                	mov    ecx,esi
  40545a:	ba 33 00 00 00       	mov    edx,0x33
  40545f:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  405466:	00 
  405467:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  40546e:	00 
  40546f:	e9 9d f9 ff ff       	jmp    404e11 <___mingw_pformat+0xe1>
  405474:	66 89 10             	mov    WORD PTR [eax],dx
  405477:	83 c5 04             	add    ebp,0x4
  40547a:	e9 41 f9 ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  40547f:	8b 7d 00             	mov    edi,DWORD PTR [ebp+0x0]
  405482:	83 c5 04             	add    ebp,0x4
  405485:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  40548c:	00 
  40548d:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  405491:	e9 ec fb ff ff       	jmp    405082 <___mingw_pformat+0x352>
  405496:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  405499:	83 c5 04             	add    ebp,0x4
  40549c:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  4054a0:	c1 f8 1f             	sar    eax,0x1f
  4054a3:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  4054a7:	e9 cb fc ff ff       	jmp    405177 <___mingw_pformat+0x447>
  4054ac:	c7 44 24 10 03 00 00 	mov    DWORD PTR [esp+0x10],0x3
  4054b3:	00 
  4054b4:	e9 03 fe ff ff       	jmp    4052bc <___mingw_pformat+0x58c>
  4054b9:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  4054bd:	83 ef 30             	sub    edi,0x30
  4054c0:	89 38                	mov    DWORD PTR [eax],edi
  4054c2:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4054c6:	89 f1                	mov    ecx,esi
  4054c8:	e9 40 f9 ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  4054cd:	8b 4d 00             	mov    ecx,DWORD PTR [ebp+0x0]
  4054d0:	83 c5 08             	add    ebp,0x8
  4054d3:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  4054d6:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  4054da:	89 5c 24 24          	mov    DWORD PTR [esp+0x24],ebx
  4054de:	e9 9f fb ff ff       	jmp    405082 <___mingw_pformat+0x352>
  4054e3:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  4054e6:	83 c5 08             	add    ebp,0x8
  4054e9:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  4054ec:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  4054f0:	89 54 24 24          	mov    DWORD PTR [esp+0x24],edx
  4054f4:	e9 7e fc ff ff       	jmp    405177 <___mingw_pformat+0x447>
  4054f9:	0f b6 51 02          	movzx  edx,BYTE PTR [ecx+0x2]
  4054fd:	83 c1 02             	add    ecx,0x2
  405500:	c7 44 24 14 04 00 00 	mov    DWORD PTR [esp+0x14],0x4
  405507:	00 
  405508:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  40550f:	00 
  405510:	e9 f8 f8 ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  405515:	80 79 02 34          	cmp    BYTE PTR [ecx+0x2],0x34
  405519:	0f 84 0f 01 00 00    	je     40562e <___mingw_pformat+0x8fe>
  40551f:	89 f1                	mov    ecx,esi
  405521:	ba 36 00 00 00       	mov    edx,0x36
  405526:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  40552d:	00 
  40552e:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  405535:	00 
  405536:	e9 d6 f8 ff ff       	jmp    404e11 <___mingw_pformat+0xe1>
  40553b:	8b 55 00             	mov    edx,DWORD PTR [ebp+0x0]
  40553e:	83 c5 04             	add    ebp,0x4
  405541:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  405545:	88 02                	mov    BYTE PTR [edx],al
  405547:	e9 74 f8 ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  40554c:	8d 44 24 38          	lea    eax,[esp+0x38]
  405550:	c7 44 24 38 00 00 00 	mov    DWORD PTR [esp+0x38],0x0
  405557:	00 
  405558:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  40555c:	89 f1                	mov    ecx,esi
  40555e:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  405562:	c7 44 24 10 02 00 00 	mov    DWORD PTR [esp+0x10],0x2
  405569:	00 
  40556a:	e9 9e f8 ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  40556f:	ba 06 00 00 00       	mov    edx,0x6
  405574:	bb 66 a1 40 00       	mov    ebx,0x40a166
  405579:	e9 72 f9 ff ff       	jmp    404ef0 <___mingw_pformat+0x1c0>
  40557e:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  405582:	c7 44 24 38 08 00 00 	mov    DWORD PTR [esp+0x38],0x8
  405589:	00 
  40558a:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  40558e:	e9 47 fa ff ff       	jmp    404fda <___mingw_pformat+0x2aa>
  405593:	0f b7 4c 24 20       	movzx  ecx,WORD PTR [esp+0x20]
  405598:	89 d5                	mov    ebp,edx
  40559a:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  4055a1:	00 
  4055a2:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  4055a6:	e9 d7 fa ff ff       	jmp    405082 <___mingw_pformat+0x352>
  4055ab:	89 10                	mov    DWORD PTR [eax],edx
  4055ad:	83 c5 04             	add    ebp,0x4
  4055b0:	e9 0b f8 ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  4055b5:	0f bf 44 24 20       	movsx  eax,WORD PTR [esp+0x20]
  4055ba:	89 d5                	mov    ebp,edx
  4055bc:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  4055c0:	c1 f8 1f             	sar    eax,0x1f
  4055c3:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  4055c7:	e9 ab fb ff ff       	jmp    405177 <___mingw_pformat+0x447>
  4055cc:	bb 58 a1 40 00       	mov    ebx,0x40a158
  4055d1:	e9 18 fe ff ff       	jmp    4053ee <___mingw_pformat+0x6be>
  4055d6:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
  4055da:	85 d2                	test   edx,edx
  4055dc:	0f 85 99 00 00 00    	jne    40567b <___mingw_pformat+0x94b>
  4055e2:	81 4c 24 30 00 04 00 	or     DWORD PTR [esp+0x30],0x400
  4055e9:	00 
  4055ea:	f7 5c 24 34          	neg    DWORD PTR [esp+0x34]
  4055ee:	e9 84 fd ff ff       	jmp    405377 <___mingw_pformat+0x647>
  4055f3:	0f be 44 24 20       	movsx  eax,BYTE PTR [esp+0x20]
  4055f8:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  4055fc:	c1 f8 1f             	sar    eax,0x1f
  4055ff:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  405603:	e9 6f fb ff ff       	jmp    405177 <___mingw_pformat+0x447>
  405608:	0f b6 54 24 20       	movzx  edx,BYTE PTR [esp+0x20]
  40560d:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  405614:	00 
  405615:	89 54 24 20          	mov    DWORD PTR [esp+0x20],edx
  405619:	e9 64 fa ff ff       	jmp    405082 <___mingw_pformat+0x352>
  40561e:	89 d7                	mov    edi,edx
  405620:	83 c5 04             	add    ebp,0x4
  405623:	c1 ff 1f             	sar    edi,0x1f
  405626:	89 78 04             	mov    DWORD PTR [eax+0x4],edi
  405629:	e9 92 f7 ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  40562e:	0f b6 51 03          	movzx  edx,BYTE PTR [ecx+0x3]
  405632:	83 c1 03             	add    ecx,0x3
  405635:	c7 44 24 14 03 00 00 	mov    DWORD PTR [esp+0x14],0x3
  40563c:	00 
  40563d:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  405644:	00 
  405645:	e9 c3 f7 ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  40564a:	0f b6 51 03          	movzx  edx,BYTE PTR [ecx+0x3]
  40564e:	83 c1 03             	add    ecx,0x3
  405651:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  405658:	00 
  405659:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  405660:	00 
  405661:	e9 a7 f7 ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  405666:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  40566a:	b8 25 00 00 00       	mov    eax,0x25
  40566f:	89 de                	mov    esi,ebx
  405671:	e8 1a e2 ff ff       	call   403890 <___pformat_putc>
  405676:	e9 45 f7 ff ff       	jmp    404dc0 <___mingw_pformat+0x90>
  40567b:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  405682:	ff 
  405683:	89 fd                	mov    ebp,edi
  405685:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405689:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  405690:	00 
  405691:	89 f1                	mov    ecx,esi
  405693:	e9 75 f7 ff ff       	jmp    404e0d <___mingw_pformat+0xdd>
  405698:	90                   	nop
  405699:	90                   	nop
  40569a:	90                   	nop
  40569b:	90                   	nop
  40569c:	90                   	nop
  40569d:	90                   	nop
  40569e:	90                   	nop
  40569f:	90                   	nop

004056a0 <___gdtoa>:
  4056a0:	55                   	push   ebp
  4056a1:	57                   	push   edi
  4056a2:	56                   	push   esi
  4056a3:	53                   	push   ebx
  4056a4:	83 ec 6c             	sub    esp,0x6c
  4056a7:	8b 84 24 8c 00 00 00 	mov    eax,DWORD PTR [esp+0x8c]
  4056ae:	8b 9c 24 8c 00 00 00 	mov    ebx,DWORD PTR [esp+0x8c]
  4056b5:	8b 30                	mov    esi,DWORD PTR [eax]
  4056b7:	89 f0                	mov    eax,esi
  4056b9:	83 e0 cf             	and    eax,0xffffffcf
  4056bc:	89 03                	mov    DWORD PTR [ebx],eax
  4056be:	89 f0                	mov    eax,esi
  4056c0:	83 e0 07             	and    eax,0x7
  4056c3:	83 f8 04             	cmp    eax,0x4
  4056c6:	0f 87 5f 14 00 00    	ja     406b2b <___gdtoa+0x148b>
  4056cc:	ff 24 85 00 a3 40 00 	jmp    DWORD PTR [eax*4+0x40a300]
  4056d3:	8b 84 24 80 00 00 00 	mov    eax,DWORD PTR [esp+0x80]
  4056da:	31 d2                	xor    edx,edx
  4056dc:	8b 38                	mov    edi,DWORD PTR [eax]
  4056de:	83 ff 20             	cmp    edi,0x20
  4056e1:	7e 0e                	jle    4056f1 <___gdtoa+0x51>
  4056e3:	b8 20 00 00 00       	mov    eax,0x20
  4056e8:	01 c0                	add    eax,eax
  4056ea:	83 c2 01             	add    edx,0x1
  4056ed:	39 c7                	cmp    edi,eax
  4056ef:	7f f7                	jg     4056e8 <___gdtoa+0x48>
  4056f1:	89 14 24             	mov    DWORD PTR [esp],edx
  4056f4:	e8 97 1e 00 00       	call   407590 <___Balloc_D2A>
  4056f9:	8b 8c 24 88 00 00 00 	mov    ecx,DWORD PTR [esp+0x88]
  405700:	89 c3                	mov    ebx,eax
  405702:	8d 47 ff             	lea    eax,[edi-0x1]
  405705:	c1 f8 05             	sar    eax,0x5
  405708:	8d 2c 81             	lea    ebp,[ecx+eax*4]
  40570b:	8b 84 24 88 00 00 00 	mov    eax,DWORD PTR [esp+0x88]
  405712:	8d 4b 14             	lea    ecx,[ebx+0x14]
  405715:	89 ca                	mov    edx,ecx
  405717:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  40571b:	90                   	nop
  40571c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405720:	8b 08                	mov    ecx,DWORD PTR [eax]
  405722:	83 c0 04             	add    eax,0x4
  405725:	83 c2 04             	add    edx,0x4
  405728:	39 c5                	cmp    ebp,eax
  40572a:	89 4a fc             	mov    DWORD PTR [edx-0x4],ecx
  40572d:	73 f1                	jae    405720 <___gdtoa+0x80>
  40572f:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
  405733:	29 ca                	sub    edx,ecx
  405735:	c1 fa 02             	sar    edx,0x2
  405738:	eb 10                	jmp    40574a <___gdtoa+0xaa>
  40573a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  405740:	85 c0                	test   eax,eax
  405742:	0f 84 6e 04 00 00    	je     405bb6 <___gdtoa+0x516>
  405748:	89 c2                	mov    edx,eax
  40574a:	8d 42 ff             	lea    eax,[edx-0x1]
  40574d:	8b 2c 81             	mov    ebp,DWORD PTR [ecx+eax*4]
  405750:	85 ed                	test   ebp,ebp
  405752:	74 ec                	je     405740 <___gdtoa+0xa0>
  405754:	0f bd 44 93 10       	bsr    eax,DWORD PTR [ebx+edx*4+0x10]
  405759:	89 53 10             	mov    DWORD PTR [ebx+0x10],edx
  40575c:	c1 e2 05             	shl    edx,0x5
  40575f:	89 d5                	mov    ebp,edx
  405761:	83 f0 1f             	xor    eax,0x1f
  405764:	29 c5                	sub    ebp,eax
  405766:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405769:	e8 72 29 00 00       	call   4080e0 <___trailz_D2A>
  40576e:	8b 8c 24 84 00 00 00 	mov    ecx,DWORD PTR [esp+0x84]
  405775:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  405779:	85 c0                	test   eax,eax
  40577b:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  40577f:	0f 85 3f 04 00 00    	jne    405bc4 <___gdtoa+0x524>
  405785:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
  405788:	85 c9                	test   ecx,ecx
  40578a:	0f 85 a8 00 00 00    	jne    405838 <___gdtoa+0x198>
  405790:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405793:	e8 c8 1e 00 00       	call   407660 <___Bfree_D2A>
  405798:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  40579f:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
  4057a5:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  4057ac:	c7 44 24 08 01 00 00 	mov    DWORD PTR [esp+0x8],0x1
  4057b3:	00 
  4057b4:	c7 04 24 fd a2 40 00 	mov    DWORD PTR [esp],0x40a2fd
  4057bb:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4057bf:	e8 3c 1a 00 00       	call   407200 <___nrv_alloc_D2A>
  4057c4:	83 c4 6c             	add    esp,0x6c
  4057c7:	5b                   	pop    ebx
  4057c8:	5e                   	pop    esi
  4057c9:	5f                   	pop    edi
  4057ca:	5d                   	pop    ebp
  4057cb:	c3                   	ret    
  4057cc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4057d0:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  4057d7:	c7 00 00 80 ff ff    	mov    DWORD PTR [eax],0xffff8000
  4057dd:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  4057e4:	c7 44 24 08 03 00 00 	mov    DWORD PTR [esp+0x8],0x3
  4057eb:	00 
  4057ec:	c7 04 24 f9 a2 40 00 	mov    DWORD PTR [esp],0x40a2f9
  4057f3:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4057f7:	e8 04 1a 00 00       	call   407200 <___nrv_alloc_D2A>
  4057fc:	83 c4 6c             	add    esp,0x6c
  4057ff:	5b                   	pop    ebx
  405800:	5e                   	pop    esi
  405801:	5f                   	pop    edi
  405802:	5d                   	pop    ebp
  405803:	c3                   	ret    
  405804:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  40580b:	c7 00 00 80 ff ff    	mov    DWORD PTR [eax],0xffff8000
  405811:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  405818:	c7 44 24 08 08 00 00 	mov    DWORD PTR [esp+0x8],0x8
  40581f:	00 
  405820:	c7 04 24 f0 a2 40 00 	mov    DWORD PTR [esp],0x40a2f0
  405827:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40582b:	e8 d0 19 00 00       	call   407200 <___nrv_alloc_D2A>
  405830:	83 c4 6c             	add    esp,0x6c
  405833:	5b                   	pop    ebx
  405834:	5e                   	pop    esi
  405835:	5f                   	pop    edi
  405836:	5d                   	pop    ebp
  405837:	c3                   	ret    
  405838:	8d 44 24 5c          	lea    eax,[esp+0x5c]
  40583c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405840:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405843:	e8 68 25 00 00       	call   407db0 <___b2d_D2A>
  405848:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  40584c:	8d 54 28 ff          	lea    edx,[eax+ebp*1-0x1]
  405850:	89 54 24 48          	mov    DWORD PTR [esp+0x48],edx
  405854:	89 d0                	mov    eax,edx
  405856:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  40585a:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
  40585e:	c1 f8 1f             	sar    eax,0x1f
  405861:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405865:	31 d0                	xor    eax,edx
  405867:	2b 44 24 0c          	sub    eax,DWORD PTR [esp+0xc]
  40586b:	81 e1 ff ff 0f 00    	and    ecx,0xfffff
  405871:	81 c9 00 00 f0 3f    	or     ecx,0x3ff00000
  405877:	89 4c 24 14          	mov    DWORD PTR [esp+0x14],ecx
  40587b:	2d 35 04 00 00       	sub    eax,0x435
  405880:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  405884:	85 c0                	test   eax,eax
  405886:	d8 25 14 a3 40 00    	fsub   DWORD PTR ds:0x40a314
  40588c:	dc 0d 18 a3 40 00    	fmul   QWORD PTR ds:0x40a318
  405892:	dc 05 20 a3 40 00    	fadd   QWORD PTR ds:0x40a320
  405898:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  40589c:	dc 0d 28 a3 40 00    	fmul   QWORD PTR ds:0x40a328
  4058a2:	de c1                	faddp  st(1),st
  4058a4:	7e 10                	jle    4058b6 <___gdtoa+0x216>
  4058a6:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  4058aa:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  4058ae:	dc 0d 30 a3 40 00    	fmul   QWORD PTR ds:0x40a330
  4058b4:	de c1                	faddp  st(1),st
  4058b6:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  4058ba:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  4058bf:	b4 0c                	mov    ah,0xc
  4058c1:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  4058c6:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  4058ca:	db 54 24 0c          	fist   DWORD PTR [esp+0xc]
  4058ce:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  4058d2:	d9 ee                	fldz   
  4058d4:	dd e9                	fucomp st(1)
  4058d6:	df e0                	fnstsw ax
  4058d8:	9e                   	sahf   
  4058d9:	0f 87 76 07 00 00    	ja     406055 <___gdtoa+0x9b5>
  4058df:	dd d8                	fstp   st(0)
  4058e1:	89 d0                	mov    eax,edx
  4058e3:	c1 e0 14             	shl    eax,0x14
  4058e6:	01 c8                	add    eax,ecx
  4058e8:	83 7c 24 0c 16       	cmp    DWORD PTR [esp+0xc],0x16
  4058ed:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  4058f1:	c7 44 24 34 01 00 00 	mov    DWORD PTR [esp+0x34],0x1
  4058f8:	00 
  4058f9:	77 29                	ja     405924 <___gdtoa+0x284>
  4058fb:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4058ff:	dd 04 c5 80 a3 40 00 	fld    QWORD PTR [eax*8+0x40a380]
  405906:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  40590a:	d9 c9                	fxch   st(1)
  40590c:	da e9                	fucompp 
  40590e:	df e0                	fnstsw ax
  405910:	9e                   	sahf   
  405911:	0f 86 6d 06 00 00    	jbe    405f84 <___gdtoa+0x8e4>
  405917:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
  40591c:	c7 44 24 34 00 00 00 	mov    DWORD PTR [esp+0x34],0x0
  405923:	00 
  405924:	89 e8                	mov    eax,ebp
  405926:	29 d0                	sub    eax,edx
  405928:	83 e8 01             	sub    eax,0x1
  40592b:	c7 44 24 28 00 00 00 	mov    DWORD PTR [esp+0x28],0x0
  405932:	00 
  405933:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  405937:	0f 88 05 07 00 00    	js     406042 <___gdtoa+0x9a2>
  40593d:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405941:	85 c0                	test   eax,eax
  405943:	0f 88 de 06 00 00    	js     406027 <___gdtoa+0x987>
  405949:	01 44 24 1c          	add    DWORD PTR [esp+0x1c],eax
  40594d:	89 44 24 3c          	mov    DWORD PTR [esp+0x3c],eax
  405951:	c7 44 24 30 00 00 00 	mov    DWORD PTR [esp+0x30],0x0
  405958:	00 
  405959:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x9
  405960:	09 
  405961:	0f 87 81 02 00 00    	ja     405be8 <___gdtoa+0x548>
  405967:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x5
  40596e:	05 
  40596f:	0f 8e c0 11 00 00    	jle    406b35 <___gdtoa+0x1495>
  405975:	83 ac 24 90 00 00 00 	sub    DWORD PTR [esp+0x90],0x4
  40597c:	04 
  40597d:	31 c0                	xor    eax,eax
  40597f:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x3
  405986:	03 
  405987:	0f 84 11 06 00 00    	je     405f9e <___gdtoa+0x8fe>
  40598d:	0f 8e 18 06 00 00    	jle    405fab <___gdtoa+0x90b>
  405993:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x4
  40599a:	04 
  40599b:	c7 44 24 40 01 00 00 	mov    DWORD PTR [esp+0x40],0x1
  4059a2:	00 
  4059a3:	0f 84 18 06 00 00    	je     405fc1 <___gdtoa+0x921>
  4059a9:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x5
  4059b0:	05 
  4059b1:	0f 85 3c 02 00 00    	jne    405bf3 <___gdtoa+0x553>
  4059b7:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
  4059bb:	03 8c 24 94 00 00 00 	add    ecx,DWORD PTR [esp+0x94]
  4059c2:	89 4c 24 44          	mov    DWORD PTR [esp+0x44],ecx
  4059c6:	83 c1 01             	add    ecx,0x1
  4059c9:	85 c9                	test   ecx,ecx
  4059cb:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
  4059cf:	0f 8e e3 0a 00 00    	jle    4064b8 <___gdtoa+0xe18>
  4059d5:	83 f9 0e             	cmp    ecx,0xe
  4059d8:	0f 96 c2             	setbe  dl
  4059db:	21 c2                	and    edx,eax
  4059dd:	89 c8                	mov    eax,ecx
  4059df:	89 4c 24 5c          	mov    DWORD PTR [esp+0x5c],ecx
  4059e3:	89 04 24             	mov    DWORD PTR [esp],eax
  4059e6:	89 54 24 38          	mov    DWORD PTR [esp+0x38],edx
  4059ea:	e8 d1 17 00 00       	call   4071c0 <___rv_alloc_D2A>
  4059ef:	8b 54 24 38          	mov    edx,DWORD PTR [esp+0x38]
  4059f3:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  4059f7:	8b 84 24 80 00 00 00 	mov    eax,DWORD PTR [esp+0x80]
  4059fe:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  405a01:	83 e8 01             	sub    eax,0x1
  405a04:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  405a08:	74 0f                	je     405a19 <___gdtoa+0x379>
  405a0a:	0f 88 81 05 00 00    	js     405f91 <___gdtoa+0x8f1>
  405a10:	83 e6 08             	and    esi,0x8
  405a13:	0f 85 59 05 00 00    	jne    405f72 <___gdtoa+0x8d2>
  405a19:	84 d2                	test   dl,dl
  405a1b:	90                   	nop
  405a1c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405a20:	0f 84 70 02 00 00    	je     405c96 <___gdtoa+0x5f6>
  405a26:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  405a2a:	0b 44 24 0c          	or     eax,DWORD PTR [esp+0xc]
  405a2e:	0f 85 62 02 00 00    	jne    405c96 <___gdtoa+0x5f6>
  405a34:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  405a38:	c7 44 24 5c 00 00 00 	mov    DWORD PTR [esp+0x5c],0x0
  405a3f:	00 
  405a40:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  405a44:	85 c0                	test   eax,eax
  405a46:	74 0d                	je     405a55 <___gdtoa+0x3b5>
  405a48:	d9 e8                	fld1   
  405a4a:	dd e9                	fucomp st(1)
  405a4c:	df e0                	fnstsw ax
  405a4e:	9e                   	sahf   
  405a4f:	0f 87 e7 0d 00 00    	ja     40683c <___gdtoa+0x119c>
  405a55:	d9 c0                	fld    st(0)
  405a57:	8b 74 24 18          	mov    esi,DWORD PTR [esp+0x18]
  405a5b:	d8 c1                	fadd   st,st(1)
  405a5d:	d8 05 4c a3 40 00    	fadd   DWORD PTR ds:0x40a34c
  405a63:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  405a67:	81 6c 24 14 00 00 40 	sub    DWORD PTR [esp+0x14],0x3400000
  405a6e:	03 
  405a6f:	85 f6                	test   esi,esi
  405a71:	0f 84 e1 01 00 00    	je     405c58 <___gdtoa+0x5b8>
  405a77:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  405a7b:	d9 c0                	fld    st(0)
  405a7d:	c7 44 24 38 00 00 00 	mov    DWORD PTR [esp+0x38],0x0
  405a84:	00 
  405a85:	8b 4c 24 40          	mov    ecx,DWORD PTR [esp+0x40]
  405a89:	85 c9                	test   ecx,ecx
  405a8b:	0f 84 58 0a 00 00    	je     4064e9 <___gdtoa+0xe49>
  405a91:	d9 05 54 a3 40 00    	fld    DWORD PTR ds:0x40a354
  405a97:	dc 34 d5 78 a3 40 00 	fdiv   QWORD PTR [edx*8+0x40a378]
  405a9e:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  405aa2:	c7 44 24 5c 00 00 00 	mov    DWORD PTR [esp+0x5c],0x0
  405aa9:	00 
  405aaa:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  405aaf:	b4 0c                	mov    ah,0xc
  405ab1:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  405ab6:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  405aba:	8d 70 01             	lea    esi,[eax+0x1]
  405abd:	dc 64 24 10          	fsub   QWORD PTR [esp+0x10]
  405ac1:	d9 c9                	fxch   st(1)
  405ac3:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  405ac7:	db 54 24 48          	fist   DWORD PTR [esp+0x48]
  405acb:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  405acf:	8b 4c 24 48          	mov    ecx,DWORD PTR [esp+0x48]
  405ad3:	89 4c 24 48          	mov    DWORD PTR [esp+0x48],ecx
  405ad7:	83 c1 30             	add    ecx,0x30
  405ada:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  405ade:	de e9                	fsubrp st(1),st
  405ae0:	d9 c9                	fxch   st(1)
  405ae2:	88 08                	mov    BYTE PTR [eax],cl
  405ae4:	dd e1                	fucom  st(1)
  405ae6:	df e0                	fnstsw ax
  405ae8:	9e                   	sahf   
  405ae9:	0f 87 9a 00 00 00    	ja     405b89 <___gdtoa+0x4e9>
  405aef:	d9 c1                	fld    st(1)
  405af1:	d8 2d 40 a3 40 00    	fsubr  DWORD PTR ds:0x40a340
  405af7:	d9 c9                	fxch   st(1)
  405af9:	dd e1                	fucom  st(1)
  405afb:	df e0                	fnstsw ax
  405afd:	dd d9                	fstp   st(1)
  405aff:	9e                   	sahf   
  405b00:	0f 87 f1 0a 00 00    	ja     4065f7 <___gdtoa+0xf57>
  405b06:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405b0a:	83 c0 01             	add    eax,0x1
  405b0d:	39 c2                	cmp    edx,eax
  405b0f:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405b13:	0f 8e 69 01 00 00    	jle    405c82 <___gdtoa+0x5e2>
  405b19:	d9 05 44 a3 40 00    	fld    DWORD PTR ds:0x40a344
  405b1f:	eb 2e                	jmp    405b4f <___gdtoa+0x4af>
  405b21:	d9 c1                	fld    st(1)
  405b23:	d8 2d 40 a3 40 00    	fsubr  DWORD PTR ds:0x40a340
  405b29:	d9 c9                	fxch   st(1)
  405b2b:	dd e1                	fucom  st(1)
  405b2d:	df e0                	fnstsw ax
  405b2f:	dd d9                	fstp   st(1)
  405b31:	9e                   	sahf   
  405b32:	0f 87 c7 0a 00 00    	ja     4065ff <___gdtoa+0xf5f>
  405b38:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405b3c:	83 c0 01             	add    eax,0x1
  405b3f:	39 c2                	cmp    edx,eax
  405b41:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405b45:	0f 8e 3d 01 00 00    	jle    405c88 <___gdtoa+0x5e8>
  405b4b:	d9 c9                	fxch   st(1)
  405b4d:	d9 ca                	fxch   st(2)
  405b4f:	dc c9                	fmul   st(1),st
  405b51:	83 c6 01             	add    esi,0x1
  405b54:	dc ca                	fmul   st(2),st
  405b56:	d9 ca                	fxch   st(2)
  405b58:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  405b5c:	db 54 24 48          	fist   DWORD PTR [esp+0x48]
  405b60:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  405b64:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  405b68:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  405b6c:	8d 48 30             	lea    ecx,[eax+0x30]
  405b6f:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  405b73:	de e9                	fsubrp st(1),st
  405b75:	d9 c9                	fxch   st(1)
  405b77:	88 4e ff             	mov    BYTE PTR [esi-0x1],cl
  405b7a:	dd e1                	fucom  st(1)
  405b7c:	df e0                	fnstsw ax
  405b7e:	9e                   	sahf   
  405b7f:	76 a0                	jbe    405b21 <___gdtoa+0x481>
  405b81:	dd d8                	fstp   st(0)
  405b83:	dd d9                	fstp   st(1)
  405b85:	dd d9                	fstp   st(1)
  405b87:	eb 04                	jmp    405b8d <___gdtoa+0x4ed>
  405b89:	dd d8                	fstp   st(0)
  405b8b:	dd d9                	fstp   st(1)
  405b8d:	d9 ee                	fldz   
  405b8f:	d9 c9                	fxch   st(1)
  405b91:	da e9                	fucompp 
  405b93:	df e0                	fnstsw ax
  405b95:	9e                   	sahf   
  405b96:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  405b9a:	7a 06                	jp     405ba2 <___gdtoa+0x502>
  405b9c:	0f 84 ad 05 00 00    	je     40614f <___gdtoa+0xaaf>
  405ba2:	83 c0 01             	add    eax,0x1
  405ba5:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405ba9:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  405bb0:	00 
  405bb1:	e9 77 03 00 00       	jmp    405f2d <___gdtoa+0x88d>
  405bb6:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
  405bbd:	31 ed                	xor    ebp,ebp
  405bbf:	e9 a2 fb ff ff       	jmp    405766 <___gdtoa+0xc6>
  405bc4:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405bc8:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405bcb:	e8 f0 23 00 00       	call   407fc0 <___rshift_D2A>
  405bd0:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405bd4:	8b 8c 24 84 00 00 00 	mov    ecx,DWORD PTR [esp+0x84]
  405bdb:	29 c5                	sub    ebp,eax
  405bdd:	01 c1                	add    ecx,eax
  405bdf:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  405be3:	e9 9d fb ff ff       	jmp    405785 <___gdtoa+0xe5>
  405be8:	c7 84 24 90 00 00 00 	mov    DWORD PTR [esp+0x90],0x0
  405bef:	00 00 00 00 
  405bf3:	89 7c 24 48          	mov    DWORD PTR [esp+0x48],edi
  405bf7:	31 d2                	xor    edx,edx
  405bf9:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  405bfd:	dc 0d 38 a3 40 00    	fmul   QWORD PTR ds:0x40a338
  405c03:	c7 44 24 40 01 00 00 	mov    DWORD PTR [esp+0x40],0x1
  405c0a:	00 
  405c0b:	c7 44 24 44 ff ff ff 	mov    DWORD PTR [esp+0x44],0xffffffff
  405c12:	ff 
  405c13:	c7 44 24 18 ff ff ff 	mov    DWORD PTR [esp+0x18],0xffffffff
  405c1a:	ff 
  405c1b:	c7 84 24 94 00 00 00 	mov    DWORD PTR [esp+0x94],0x0
  405c22:	00 00 00 00 
  405c26:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  405c2a:	db 5c 24 48          	fistp  DWORD PTR [esp+0x48]
  405c2e:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  405c32:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  405c36:	83 c0 03             	add    eax,0x3
  405c39:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405c3d:	e9 a1 fd ff ff       	jmp    4059e3 <___gdtoa+0x343>
  405c42:	d9 c0                	fld    st(0)
  405c44:	d8 c1                	fadd   st,st(1)
  405c46:	d8 05 4c a3 40 00    	fadd   DWORD PTR ds:0x40a34c
  405c4c:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  405c50:	81 6c 24 14 00 00 40 	sub    DWORD PTR [esp+0x14],0x3400000
  405c57:	03 
  405c58:	d9 c0                	fld    st(0)
  405c5a:	d8 25 50 a3 40 00    	fsub   DWORD PTR ds:0x40a350
  405c60:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  405c64:	d9 c9                	fxch   st(1)
  405c66:	dd e1                	fucom  st(1)
  405c68:	df e0                	fnstsw ax
  405c6a:	9e                   	sahf   
  405c6b:	0f 87 52 09 00 00    	ja     4065c3 <___gdtoa+0xf23>
  405c71:	d9 c9                	fxch   st(1)
  405c73:	d9 e0                	fchs   
  405c75:	da e9                	fucompp 
  405c77:	df e0                	fnstsw ax
  405c79:	9e                   	sahf   
  405c7a:	0f 87 77 03 00 00    	ja     405ff7 <___gdtoa+0x957>
  405c80:	eb 10                	jmp    405c92 <___gdtoa+0x5f2>
  405c82:	dd d8                	fstp   st(0)
  405c84:	dd d8                	fstp   st(0)
  405c86:	eb 0a                	jmp    405c92 <___gdtoa+0x5f2>
  405c88:	dd d8                	fstp   st(0)
  405c8a:	dd d8                	fstp   st(0)
  405c8c:	dd d8                	fstp   st(0)
  405c8e:	eb 02                	jmp    405c92 <___gdtoa+0x5f2>
  405c90:	dd d8                	fstp   st(0)
  405c92:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  405c96:	83 7c 24 0c 0e       	cmp    DWORD PTR [esp+0xc],0xe
  405c9b:	0f 8e df 01 00 00    	jle    405e80 <___gdtoa+0x7e0>
  405ca1:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  405ca5:	85 c0                	test   eax,eax
  405ca7:	0f 84 c3 03 00 00    	je     406070 <___gdtoa+0x9d0>
  405cad:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x1
  405cb4:	01 
  405cb5:	0f 8e 93 09 00 00    	jle    40664e <___gdtoa+0xfae>
  405cbb:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405cbf:	83 e8 01             	sub    eax,0x1
  405cc2:	39 44 24 30          	cmp    DWORD PTR [esp+0x30],eax
  405cc6:	0f 8c 08 08 00 00    	jl     4064d4 <___gdtoa+0xe34>
  405ccc:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  405cd0:	29 c7                	sub    edi,eax
  405cd2:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405cd6:	85 c0                	test   eax,eax
  405cd8:	0f 88 15 0a 00 00    	js     4066f3 <___gdtoa+0x1053>
  405cde:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  405ce2:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405ce6:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  405ced:	01 44 24 28          	add    DWORD PTR [esp+0x28],eax
  405cf1:	01 44 24 1c          	add    DWORD PTR [esp+0x1c],eax
  405cf5:	e8 b6 1a 00 00       	call   4077b0 <___i2b_D2A>
  405cfa:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405cfe:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  405d02:	85 c0                	test   eax,eax
  405d04:	7e 1e                	jle    405d24 <___gdtoa+0x684>
  405d06:	85 f6                	test   esi,esi
  405d08:	7e 1a                	jle    405d24 <___gdtoa+0x684>
  405d0a:	8b 4c 24 1c          	mov    ecx,DWORD PTR [esp+0x1c]
  405d0e:	39 f1                	cmp    ecx,esi
  405d10:	89 c8                	mov    eax,ecx
  405d12:	7e 02                	jle    405d16 <___gdtoa+0x676>
  405d14:	89 f0                	mov    eax,esi
  405d16:	29 44 24 28          	sub    DWORD PTR [esp+0x28],eax
  405d1a:	29 c6                	sub    esi,eax
  405d1c:	29 44 24 1c          	sub    DWORD PTR [esp+0x1c],eax
  405d20:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405d24:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  405d28:	85 c9                	test   ecx,ecx
  405d2a:	7e 4e                	jle    405d7a <___gdtoa+0x6da>
  405d2c:	8b 54 24 40          	mov    edx,DWORD PTR [esp+0x40]
  405d30:	85 d2                	test   edx,edx
  405d32:	0f 84 dd 05 00 00    	je     406315 <___gdtoa+0xc75>
  405d38:	85 ff                	test   edi,edi
  405d3a:	7e 32                	jle    405d6e <___gdtoa+0x6ce>
  405d3c:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405d40:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  405d44:	89 04 24             	mov    DWORD PTR [esp],eax
  405d47:	e8 f4 1b 00 00       	call   407940 <___pow5mult_D2A>
  405d4c:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  405d50:	89 04 24             	mov    DWORD PTR [esp],eax
  405d53:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405d57:	e8 84 1a 00 00       	call   4077e0 <___mult_D2A>
  405d5c:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405d5f:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  405d63:	e8 f8 18 00 00       	call   407660 <___Bfree_D2A>
  405d68:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405d6c:	89 c3                	mov    ebx,eax
  405d6e:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405d72:	29 f8                	sub    eax,edi
  405d74:	0f 85 9f 05 00 00    	jne    406319 <___gdtoa+0xc79>
  405d7a:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  405d81:	e8 2a 1a 00 00       	call   4077b0 <___i2b_D2A>
  405d86:	89 c7                	mov    edi,eax
  405d88:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  405d8c:	85 c0                	test   eax,eax
  405d8e:	7e 0e                	jle    405d9e <___gdtoa+0x6fe>
  405d90:	89 3c 24             	mov    DWORD PTR [esp],edi
  405d93:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405d97:	e8 a4 1b 00 00       	call   407940 <___pow5mult_D2A>
  405d9c:	89 c7                	mov    edi,eax
  405d9e:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x1
  405da5:	01 
  405da6:	c7 44 24 10 00 00 00 	mov    DWORD PTR [esp+0x10],0x0
  405dad:	00 
  405dae:	0f 8e 8f 06 00 00    	jle    406443 <___gdtoa+0xda3>
  405db4:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  405db8:	bd 1f 00 00 00       	mov    ebp,0x1f
  405dbd:	85 c0                	test   eax,eax
  405dbf:	74 0b                	je     405dcc <___gdtoa+0x72c>
  405dc1:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
  405dc4:	0f bd 6c 87 10       	bsr    ebp,DWORD PTR [edi+eax*4+0x10]
  405dc9:	83 f5 1f             	xor    ebp,0x1f
  405dcc:	2b 6c 24 1c          	sub    ebp,DWORD PTR [esp+0x1c]
  405dd0:	8b 54 24 28          	mov    edx,DWORD PTR [esp+0x28]
  405dd4:	83 ed 04             	sub    ebp,0x4
  405dd7:	83 e5 1f             	and    ebp,0x1f
  405dda:	01 ea                	add    edx,ebp
  405ddc:	89 e8                	mov    eax,ebp
  405dde:	85 d2                	test   edx,edx
  405de0:	89 6c 24 5c          	mov    DWORD PTR [esp+0x5c],ebp
  405de4:	7e 12                	jle    405df8 <___gdtoa+0x758>
  405de6:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405de9:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  405ded:	e8 de 1c 00 00       	call   407ad0 <___lshift_D2A>
  405df2:	89 c3                	mov    ebx,eax
  405df4:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405df8:	03 44 24 1c          	add    eax,DWORD PTR [esp+0x1c]
  405dfc:	85 c0                	test   eax,eax
  405dfe:	7e 0e                	jle    405e0e <___gdtoa+0x76e>
  405e00:	89 3c 24             	mov    DWORD PTR [esp],edi
  405e03:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405e07:	e8 c4 1c 00 00       	call   407ad0 <___lshift_D2A>
  405e0c:	89 c7                	mov    edi,eax
  405e0e:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  405e12:	85 c0                	test   eax,eax
  405e14:	0f 85 12 05 00 00    	jne    40632c <___gdtoa+0xc8c>
  405e1a:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  405e21:	02 
  405e22:	0f 8e 3b 03 00 00    	jle    406163 <___gdtoa+0xac3>
  405e28:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405e2c:	85 c0                	test   eax,eax
  405e2e:	0f 8f 2f 03 00 00    	jg     406163 <___gdtoa+0xac3>
  405e34:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405e38:	85 c0                	test   eax,eax
  405e3a:	0f 85 c7 01 00 00    	jne    406007 <___gdtoa+0x967>
  405e40:	89 3c 24             	mov    DWORD PTR [esp],edi
  405e43:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  405e4a:	00 
  405e4b:	c7 44 24 04 05 00 00 	mov    DWORD PTR [esp+0x4],0x5
  405e52:	00 
  405e53:	e8 78 18 00 00       	call   4076d0 <___multadd_D2A>
  405e58:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405e5b:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405e5f:	89 c7                	mov    edi,eax
  405e61:	e8 7a 1d 00 00       	call   407be0 <___cmp_D2A>
  405e66:	85 c0                	test   eax,eax
  405e68:	0f 8e 99 01 00 00    	jle    406007 <___gdtoa+0x967>
  405e6e:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405e72:	83 c0 02             	add    eax,0x2
  405e75:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405e79:	eb 72                	jmp    405eed <___gdtoa+0x84d>
  405e7b:	90                   	nop
  405e7c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405e80:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405e84:	85 c0                	test   eax,eax
  405e86:	0f 88 15 fe ff ff    	js     405ca1 <___gdtoa+0x601>
  405e8c:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405e90:	dd 04 c5 80 a3 40 00 	fld    QWORD PTR [eax*8+0x40a380]
  405e97:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405e9b:	85 c0                	test   eax,eax
  405e9d:	0f 8f e2 01 00 00    	jg     406085 <___gdtoa+0x9e5>
  405ea3:	8b 84 24 94 00 00 00 	mov    eax,DWORD PTR [esp+0x94]
  405eaa:	c1 e8 1f             	shr    eax,0x1f
  405ead:	84 c0                	test   al,al
  405eaf:	0f 84 d0 01 00 00    	je     406085 <___gdtoa+0x9e5>
  405eb5:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405eb9:	85 c0                	test   eax,eax
  405ebb:	0f 85 3a 01 00 00    	jne    405ffb <___gdtoa+0x95b>
  405ec1:	d8 0d 50 a3 40 00    	fmul   DWORD PTR ds:0x40a350
  405ec7:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  405ecb:	d9 c9                	fxch   st(1)
  405ecd:	da e9                	fucompp 
  405ecf:	df e0                	fnstsw ax
  405ed1:	9e                   	sahf   
  405ed2:	0f 83 25 01 00 00    	jae    405ffd <___gdtoa+0x95d>
  405ed8:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405edc:	31 ff                	xor    edi,edi
  405ede:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  405ee5:	00 
  405ee6:	83 c0 02             	add    eax,0x2
  405ee9:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405eed:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  405ef1:	31 d2                	xor    edx,edx
  405ef3:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  405efa:	00 
  405efb:	8d 70 01             	lea    esi,[eax+0x1]
  405efe:	c6 00 31             	mov    BYTE PTR [eax],0x31
  405f01:	89 3c 24             	mov    DWORD PTR [esp],edi
  405f04:	89 54 24 10          	mov    DWORD PTR [esp+0x10],edx
  405f08:	e8 53 17 00 00       	call   407660 <___Bfree_D2A>
  405f0d:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405f11:	85 c0                	test   eax,eax
  405f13:	74 18                	je     405f2d <___gdtoa+0x88d>
  405f15:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
  405f19:	39 c2                	cmp    edx,eax
  405f1b:	0f 85 dd 03 00 00    	jne    4062fe <___gdtoa+0xc5e>
  405f21:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405f25:	89 04 24             	mov    DWORD PTR [esp],eax
  405f28:	e8 33 17 00 00       	call   407660 <___Bfree_D2A>
  405f2d:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405f30:	e8 2b 17 00 00       	call   407660 <___Bfree_D2A>
  405f35:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  405f3c:	8b 7c 24 0c          	mov    edi,DWORD PTR [esp+0xc]
  405f40:	c6 06 00             	mov    BYTE PTR [esi],0x0
  405f43:	89 38                	mov    DWORD PTR [eax],edi
  405f45:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  405f4c:	85 c0                	test   eax,eax
  405f4e:	74 09                	je     405f59 <___gdtoa+0x8b9>
  405f50:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  405f57:	89 30                	mov    DWORD PTR [eax],esi
  405f59:	8b 84 24 8c 00 00 00 	mov    eax,DWORD PTR [esp+0x8c]
  405f60:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  405f64:	09 38                	or     DWORD PTR [eax],edi
  405f66:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  405f6a:	83 c4 6c             	add    esp,0x6c
  405f6d:	5b                   	pop    ebx
  405f6e:	5e                   	pop    esi
  405f6f:	5f                   	pop    edi
  405f70:	5d                   	pop    ebp
  405f71:	c3                   	ret    
  405f72:	b8 03 00 00 00       	mov    eax,0x3
  405f77:	2b 44 24 2c          	sub    eax,DWORD PTR [esp+0x2c]
  405f7b:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  405f7f:	e9 95 fa ff ff       	jmp    405a19 <___gdtoa+0x379>
  405f84:	c7 44 24 34 00 00 00 	mov    DWORD PTR [esp+0x34],0x0
  405f8b:	00 
  405f8c:	e9 93 f9 ff ff       	jmp    405924 <___gdtoa+0x284>
  405f91:	c7 44 24 2c 02 00 00 	mov    DWORD PTR [esp+0x2c],0x2
  405f98:	00 
  405f99:	e9 72 fa ff ff       	jmp    405a10 <___gdtoa+0x370>
  405f9e:	c7 44 24 40 00 00 00 	mov    DWORD PTR [esp+0x40],0x0
  405fa5:	00 
  405fa6:	e9 0c fa ff ff       	jmp    4059b7 <___gdtoa+0x317>
  405fab:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  405fb2:	02 
  405fb3:	c7 44 24 40 00 00 00 	mov    DWORD PTR [esp+0x40],0x0
  405fba:	00 
  405fbb:	0f 85 32 fc ff ff    	jne    405bf3 <___gdtoa+0x553>
  405fc1:	8b 94 24 94 00 00 00 	mov    edx,DWORD PTR [esp+0x94]
  405fc8:	85 d2                	test   edx,edx
  405fca:	0f 8e d3 04 00 00    	jle    4064a3 <___gdtoa+0xe03>
  405fd0:	83 bc 24 94 00 00 00 	cmp    DWORD PTR [esp+0x94],0xe
  405fd7:	0e 
  405fd8:	0f 96 c2             	setbe  dl
  405fdb:	8b 8c 24 94 00 00 00 	mov    ecx,DWORD PTR [esp+0x94]
  405fe2:	21 c2                	and    edx,eax
  405fe4:	89 4c 24 5c          	mov    DWORD PTR [esp+0x5c],ecx
  405fe8:	89 c8                	mov    eax,ecx
  405fea:	89 4c 24 44          	mov    DWORD PTR [esp+0x44],ecx
  405fee:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
  405ff2:	e9 ec f9 ff ff       	jmp    4059e3 <___gdtoa+0x343>
  405ff7:	dd d8                	fstp   st(0)
  405ff9:	eb 02                	jmp    405ffd <___gdtoa+0x95d>
  405ffb:	dd d8                	fstp   st(0)
  405ffd:	31 ff                	xor    edi,edi
  405fff:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  406006:	00 
  406007:	8b 84 24 94 00 00 00 	mov    eax,DWORD PTR [esp+0x94]
  40600e:	31 d2                	xor    edx,edx
  406010:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  406014:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  40601b:	00 
  40601c:	f7 d8                	neg    eax
  40601e:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406022:	e9 da fe ff ff       	jmp    405f01 <___gdtoa+0x861>
  406027:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  40602b:	29 44 24 28          	sub    DWORD PTR [esp+0x28],eax
  40602f:	c7 44 24 3c 00 00 00 	mov    DWORD PTR [esp+0x3c],0x0
  406036:	00 
  406037:	f7 d8                	neg    eax
  406039:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  40603d:	e9 17 f9 ff ff       	jmp    405959 <___gdtoa+0x2b9>
  406042:	f7 d8                	neg    eax
  406044:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
  406048:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [esp+0x1c],0x0
  40604f:	00 
  406050:	e9 e8 f8 ff ff       	jmp    40593d <___gdtoa+0x29d>
  406055:	db 44 24 0c          	fild   DWORD PTR [esp+0xc]
  406059:	da e9                	fucompp 
  40605b:	df e0                	fnstsw ax
  40605d:	9e                   	sahf   
  40605e:	7a 06                	jp     406066 <___gdtoa+0x9c6>
  406060:	0f 84 7b f8 ff ff    	je     4058e1 <___gdtoa+0x241>
  406066:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
  40606b:	e9 71 f8 ff ff       	jmp    4058e1 <___gdtoa+0x241>
  406070:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  406074:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  406078:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  40607f:	00 
  406080:	e9 79 fc ff ff       	jmp    405cfe <___gdtoa+0x65e>
  406085:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  406089:	d9 c0                	fld    st(0)
  40608b:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
  40608f:	d8 f2                	fdiv   st,st(2)
  406091:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  406095:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  40609c:	00 
  40609d:	8d 77 01             	lea    esi,[edi+0x1]
  4060a0:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  4060a5:	b4 0c                	mov    ah,0xc
  4060a7:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  4060ac:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  4060b0:	db 5c 24 48          	fistp  DWORD PTR [esp+0x48]
  4060b4:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  4060b8:	8b 4c 24 48          	mov    ecx,DWORD PTR [esp+0x48]
  4060bc:	89 4c 24 48          	mov    DWORD PTR [esp+0x48],ecx
  4060c0:	8d 41 30             	lea    eax,[ecx+0x30]
  4060c3:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  4060c7:	d8 ca                	fmul   st,st(2)
  4060c9:	88 07                	mov    BYTE PTR [edi],al
  4060cb:	de e9                	fsubrp st(1),st
  4060cd:	d9 ee                	fldz   
  4060cf:	d9 c9                	fxch   st(1)
  4060d1:	dd e1                	fucom  st(1)
  4060d3:	df e0                	fnstsw ax
  4060d5:	dd d9                	fstp   st(1)
  4060d7:	9e                   	sahf   
  4060d8:	0f 8b 52 09 00 00    	jnp    406a30 <___gdtoa+0x1390>
  4060de:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  4060e2:	39 44 24 18          	cmp    DWORD PTR [esp+0x18],eax
  4060e6:	0f 84 93 03 00 00    	je     40647f <___gdtoa+0xddf>
  4060ec:	d9 05 44 a3 40 00    	fld    DWORD PTR ds:0x40a344
  4060f2:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  4060f6:	eb 0c                	jmp    406104 <___gdtoa+0xa64>
  4060f8:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  4060fc:	39 c2                	cmp    edx,eax
  4060fe:	0f 84 79 03 00 00    	je     40647d <___gdtoa+0xddd>
  406104:	83 c0 01             	add    eax,0x1
  406107:	dc c9                	fmul   st(1),st
  406109:	83 c6 01             	add    esi,0x1
  40610c:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  406110:	d9 c1                	fld    st(1)
  406112:	d8 f3                	fdiv   st,st(3)
  406114:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  406118:	db 5c 24 48          	fistp  DWORD PTR [esp+0x48]
  40611c:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  406120:	8b 4c 24 48          	mov    ecx,DWORD PTR [esp+0x48]
  406124:	89 4c 24 48          	mov    DWORD PTR [esp+0x48],ecx
  406128:	8d 41 30             	lea    eax,[ecx+0x30]
  40612b:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  40612f:	d8 cb                	fmul   st,st(3)
  406131:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  406134:	de ea                	fsubrp st(2),st
  406136:	d9 ee                	fldz   
  406138:	d9 ca                	fxch   st(2)
  40613a:	dd e2                	fucom  st(2)
  40613c:	df e0                	fnstsw ax
  40613e:	dd da                	fstp   st(2)
  406140:	9e                   	sahf   
  406141:	7a b5                	jp     4060f8 <___gdtoa+0xa58>
  406143:	75 b3                	jne    4060f8 <___gdtoa+0xa58>
  406145:	dd d8                	fstp   st(0)
  406147:	dd d8                	fstp   st(0)
  406149:	dd d8                	fstp   st(0)
  40614b:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  40614f:	83 c0 01             	add    eax,0x1
  406152:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406156:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  40615d:	00 
  40615e:	e9 ca fd ff ff       	jmp    405f2d <___gdtoa+0x88d>
  406163:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  406167:	85 c0                	test   eax,eax
  406169:	0f 84 19 02 00 00    	je     406388 <___gdtoa+0xce8>
  40616f:	8d 04 2e             	lea    eax,[esi+ebp*1]
  406172:	85 c0                	test   eax,eax
  406174:	7e 14                	jle    40618a <___gdtoa+0xaea>
  406176:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40617a:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  40617e:	89 04 24             	mov    DWORD PTR [esp],eax
  406181:	e8 4a 19 00 00       	call   407ad0 <___lshift_D2A>
  406186:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  40618a:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
  40618e:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
  406192:	85 f6                	test   esi,esi
  406194:	0f 85 e9 06 00 00    	jne    406883 <___gdtoa+0x11e3>
  40619a:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  40619e:	89 7c 24 1c          	mov    DWORD PTR [esp+0x1c],edi
  4061a2:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
  4061a6:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  4061ad:	00 
  4061ae:	89 74 24 28          	mov    DWORD PTR [esp+0x28],esi
  4061b2:	e9 d6 00 00 00       	jmp    40628d <___gdtoa+0xbed>
  4061b7:	89 14 24             	mov    DWORD PTR [esp],edx
  4061ba:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  4061be:	e8 9d 14 00 00       	call   407660 <___Bfree_D2A>
  4061c3:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4061c7:	89 c1                	mov    ecx,eax
  4061c9:	0b 8c 24 90 00 00 00 	or     ecx,DWORD PTR [esp+0x90]
  4061d0:	75 18                	jne    4061ea <___gdtoa+0xb4a>
  4061d2:	8b 8c 24 88 00 00 00 	mov    ecx,DWORD PTR [esp+0x88]
  4061d9:	f6 01 01             	test   BYTE PTR [ecx],0x1
  4061dc:	75 0c                	jne    4061ea <___gdtoa+0xb4a>
  4061de:	8b 54 24 2c          	mov    edx,DWORD PTR [esp+0x2c]
  4061e2:	85 d2                	test   edx,edx
  4061e4:	0f 84 55 08 00 00    	je     406a3f <___gdtoa+0x139f>
  4061ea:	85 f6                	test   esi,esi
  4061ec:	0f 88 18 05 00 00    	js     40670a <___gdtoa+0x106a>
  4061f2:	0b b4 24 90 00 00 00 	or     esi,DWORD PTR [esp+0x90]
  4061f9:	75 10                	jne    40620b <___gdtoa+0xb6b>
  4061fb:	8b b4 24 88 00 00 00 	mov    esi,DWORD PTR [esp+0x88]
  406202:	f6 06 01             	test   BYTE PTR [esi],0x1
  406205:	0f 84 ff 04 00 00    	je     40670a <___gdtoa+0x106a>
  40620b:	85 c0                	test   eax,eax
  40620d:	0f 8f c9 06 00 00    	jg     4068dc <___gdtoa+0x123c>
  406213:	83 44 24 28 01       	add    DWORD PTR [esp+0x28],0x1
  406218:	0f b6 44 24 10       	movzx  eax,BYTE PTR [esp+0x10]
  40621d:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  406221:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  406224:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  406228:	39 44 24 5c          	cmp    DWORD PTR [esp+0x5c],eax
  40622c:	0f 84 97 06 00 00    	je     4068c9 <___gdtoa+0x1229>
  406232:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406235:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  40623c:	00 
  40623d:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  406244:	00 
  406245:	e8 86 14 00 00       	call   4076d0 <___multadd_D2A>
  40624a:	39 ef                	cmp    edi,ebp
  40624c:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  406253:	00 
  406254:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  40625b:	00 
  40625c:	89 3c 24             	mov    DWORD PTR [esp],edi
  40625f:	89 c3                	mov    ebx,eax
  406261:	0f 84 8c 00 00 00    	je     4062f3 <___gdtoa+0xc53>
  406267:	e8 64 14 00 00       	call   4076d0 <___multadd_D2A>
  40626c:	89 2c 24             	mov    DWORD PTR [esp],ebp
  40626f:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  406276:	00 
  406277:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  40627e:	00 
  40627f:	89 c7                	mov    edi,eax
  406281:	e8 4a 14 00 00       	call   4076d0 <___multadd_D2A>
  406286:	89 c5                	mov    ebp,eax
  406288:	83 44 24 5c 01       	add    DWORD PTR [esp+0x5c],0x1
  40628d:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  406291:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406294:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406298:	e8 d3 0f 00 00       	call   407270 <___quorem_D2A>
  40629d:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4062a1:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4062a4:	89 c6                	mov    esi,eax
  4062a6:	83 c6 30             	add    esi,0x30
  4062a9:	89 74 24 10          	mov    DWORD PTR [esp+0x10],esi
  4062ad:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  4062b1:	e8 2a 19 00 00       	call   407be0 <___cmp_D2A>
  4062b6:	89 6c 24 04          	mov    DWORD PTR [esp+0x4],ebp
  4062ba:	89 c6                	mov    esi,eax
  4062bc:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  4062c0:	89 04 24             	mov    DWORD PTR [esp],eax
  4062c3:	e8 68 19 00 00       	call   407c30 <___diff_D2A>
  4062c8:	89 c2                	mov    edx,eax
  4062ca:	b8 01 00 00 00       	mov    eax,0x1
  4062cf:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  4062d2:	85 c9                	test   ecx,ecx
  4062d4:	0f 85 dd fe ff ff    	jne    4061b7 <___gdtoa+0xb17>
  4062da:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4062de:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4062e1:	89 54 24 20          	mov    DWORD PTR [esp+0x20],edx
  4062e5:	e8 f6 18 00 00       	call   407be0 <___cmp_D2A>
  4062ea:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  4062ee:	e9 c4 fe ff ff       	jmp    4061b7 <___gdtoa+0xb17>
  4062f3:	e8 d8 13 00 00       	call   4076d0 <___multadd_D2A>
  4062f8:	89 c7                	mov    edi,eax
  4062fa:	89 c5                	mov    ebp,eax
  4062fc:	eb 8a                	jmp    406288 <___gdtoa+0xbe8>
  4062fe:	85 d2                	test   edx,edx
  406300:	0f 84 1b fc ff ff    	je     405f21 <___gdtoa+0x881>
  406306:	89 14 24             	mov    DWORD PTR [esp],edx
  406309:	e8 52 13 00 00       	call   407660 <___Bfree_D2A>
  40630e:	66 90                	xchg   ax,ax
  406310:	e9 0c fc ff ff       	jmp    405f21 <___gdtoa+0x881>
  406315:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  406319:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40631c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406320:	e8 1b 16 00 00       	call   407940 <___pow5mult_D2A>
  406325:	89 c3                	mov    ebx,eax
  406327:	e9 4e fa ff ff       	jmp    405d7a <___gdtoa+0x6da>
  40632c:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  406330:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406333:	e8 a8 18 00 00       	call   407be0 <___cmp_D2A>
  406338:	85 c0                	test   eax,eax
  40633a:	0f 89 da fa ff ff    	jns    405e1a <___gdtoa+0x77a>
  406340:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406343:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  40634a:	00 
  40634b:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  406352:	00 
  406353:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
  406358:	e8 73 13 00 00       	call   4076d0 <___multadd_D2A>
  40635d:	89 c3                	mov    ebx,eax
  40635f:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  406363:	85 c0                	test   eax,eax
  406365:	0f 85 24 07 00 00    	jne    406a8f <___gdtoa+0x13ef>
  40636b:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  406372:	02 
  406373:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  406377:	7e 0b                	jle    406384 <___gdtoa+0xce4>
  406379:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
  40637e:	0f 8e 86 07 00 00    	jle    406b0a <___gdtoa+0x146a>
  406384:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406388:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  40638f:	00 
  406390:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  406394:	8b 6c 24 18          	mov    ebp,DWORD PTR [esp+0x18]
  406398:	eb 25                	jmp    4063bf <___gdtoa+0xd1f>
  40639a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4063a0:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4063a3:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4063aa:	00 
  4063ab:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  4063b2:	00 
  4063b3:	e8 18 13 00 00       	call   4076d0 <___multadd_D2A>
  4063b8:	83 44 24 5c 01       	add    DWORD PTR [esp+0x5c],0x1
  4063bd:	89 c3                	mov    ebx,eax
  4063bf:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4063c3:	83 c6 01             	add    esi,0x1
  4063c6:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4063c9:	e8 a2 0e 00 00       	call   407270 <___quorem_D2A>
  4063ce:	83 c0 30             	add    eax,0x30
  4063d1:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  4063d4:	3b 6c 24 5c          	cmp    ebp,DWORD PTR [esp+0x5c]
  4063d8:	7f c6                	jg     4063a0 <___gdtoa+0xd00>
  4063da:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4063de:	31 d2                	xor    edx,edx
  4063e0:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  4063e4:	85 c0                	test   eax,eax
  4063e6:	0f 84 e5 03 00 00    	je     4067d1 <___gdtoa+0x1131>
  4063ec:	83 f8 02             	cmp    eax,0x2
  4063ef:	0f 84 18 04 00 00    	je     40680d <___gdtoa+0x116d>
  4063f5:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  4063f9:	0f 8e cb 05 00 00    	jle    4069ca <___gdtoa+0x132a>
  4063ff:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  406403:	8b 6c 24 24          	mov    ebp,DWORD PTR [esp+0x24]
  406407:	eb 15                	jmp    40641e <___gdtoa+0xd7e>
  406409:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  406410:	39 e8                	cmp    eax,ebp
  406412:	0f 84 a6 02 00 00    	je     4066be <___gdtoa+0x101e>
  406418:	0f b6 48 ff          	movzx  ecx,BYTE PTR [eax-0x1]
  40641c:	89 c6                	mov    esi,eax
  40641e:	80 f9 39             	cmp    cl,0x39
  406421:	8d 46 ff             	lea    eax,[esi-0x1]
  406424:	74 ea                	je     406410 <___gdtoa+0xd70>
  406426:	83 c1 01             	add    ecx,0x1
  406429:	88 08                	mov    BYTE PTR [eax],cl
  40642b:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  40642f:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406436:	00 
  406437:	83 c0 01             	add    eax,0x1
  40643a:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40643e:	e9 be fa ff ff       	jmp    405f01 <___gdtoa+0x861>
  406443:	83 fd 01             	cmp    ebp,0x1
  406446:	0f 85 68 f9 ff ff    	jne    405db4 <___gdtoa+0x714>
  40644c:	8b 84 24 80 00 00 00 	mov    eax,DWORD PTR [esp+0x80]
  406453:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  406456:	83 c0 01             	add    eax,0x1
  406459:	39 84 24 84 00 00 00 	cmp    DWORD PTR [esp+0x84],eax
  406460:	0f 8e 4e f9 ff ff    	jle    405db4 <___gdtoa+0x714>
  406466:	83 44 24 28 01       	add    DWORD PTR [esp+0x28],0x1
  40646b:	83 44 24 1c 01       	add    DWORD PTR [esp+0x1c],0x1
  406470:	c7 44 24 10 01 00 00 	mov    DWORD PTR [esp+0x10],0x1
  406477:	00 
  406478:	e9 37 f9 ff ff       	jmp    405db4 <___gdtoa+0x714>
  40647d:	dd d8                	fstp   st(0)
  40647f:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  406483:	85 c0                	test   eax,eax
  406485:	0f 84 fe 01 00 00    	je     406689 <___gdtoa+0xfe9>
  40648b:	dd d8                	fstp   st(0)
  40648d:	dd d8                	fstp   st(0)
  40648f:	83 7c 24 2c 01       	cmp    DWORD PTR [esp+0x2c],0x1
  406494:	0f 84 22 03 00 00    	je     4067bc <___gdtoa+0x111c>
  40649a:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  40649e:	e9 ff f6 ff ff       	jmp    405ba2 <___gdtoa+0x502>
  4064a3:	ba 01 00 00 00       	mov    edx,0x1
  4064a8:	c7 84 24 94 00 00 00 	mov    DWORD PTR [esp+0x94],0x1
  4064af:	01 00 00 00 
  4064b3:	e9 23 fb ff ff       	jmp    405fdb <___gdtoa+0x93b>
  4064b8:	83 7c 24 18 0e       	cmp    DWORD PTR [esp+0x18],0xe
  4064bd:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  4064c4:	00 
  4064c5:	0f 96 c2             	setbe  dl
  4064c8:	21 c2                	and    edx,eax
  4064ca:	b8 01 00 00 00       	mov    eax,0x1
  4064cf:	e9 0f f5 ff ff       	jmp    4059e3 <___gdtoa+0x343>
  4064d4:	89 c2                	mov    edx,eax
  4064d6:	31 ff                	xor    edi,edi
  4064d8:	2b 54 24 30          	sub    edx,DWORD PTR [esp+0x30]
  4064dc:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  4064e0:	01 54 24 3c          	add    DWORD PTR [esp+0x3c],edx
  4064e4:	e9 e9 f7 ff ff       	jmp    405cd2 <___gdtoa+0x632>
  4064e9:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  4064ed:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  4064f1:	dc 0c d5 78 a3 40 00 	fmul   QWORD PTR [edx*8+0x40a378]
  4064f8:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  4064ff:	00 
  406500:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  406504:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  406509:	b4 0c                	mov    ah,0xc
  40650b:	d9 05 44 a3 40 00    	fld    DWORD PTR ds:0x40a344
  406511:	d9 ca                	fxch   st(2)
  406513:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  406518:	eb 0f                	jmp    406529 <___gdtoa+0xe89>
  40651a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  406520:	d8 ca                	fmul   st,st(2)
  406522:	83 c0 01             	add    eax,0x1
  406525:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  406529:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  40652d:	db 54 24 48          	fist   DWORD PTR [esp+0x48]
  406531:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  406535:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  406539:	85 c0                	test   eax,eax
  40653b:	74 0a                	je     406547 <___gdtoa+0xea7>
  40653d:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  406541:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  406545:	de e9                	fsubrp st(1),st
  406547:	83 c6 01             	add    esi,0x1
  40654a:	8d 48 30             	lea    ecx,[eax+0x30]
  40654d:	88 4e ff             	mov    BYTE PTR [esi-0x1],cl
  406550:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  406554:	39 d0                	cmp    eax,edx
  406556:	75 c8                	jne    406520 <___gdtoa+0xe80>
  406558:	dd da                	fstp   st(2)
  40655a:	d9 c9                	fxch   st(1)
  40655c:	d9 05 54 a3 40 00    	fld    DWORD PTR ds:0x40a354
  406562:	d9 c2                	fld    st(2)
  406564:	d8 c1                	fadd   st,st(1)
  406566:	d9 ca                	fxch   st(2)
  406568:	dd e2                	fucom  st(2)
  40656a:	df e0                	fnstsw ax
  40656c:	dd da                	fstp   st(2)
  40656e:	9e                   	sahf   
  40656f:	0f 87 94 00 00 00    	ja     406609 <___gdtoa+0xf69>
  406575:	de e2                	fsubp  st(2),st
  406577:	d9 c9                	fxch   st(1)
  406579:	dd e9                	fucomp st(1)
  40657b:	df e0                	fnstsw ax
  40657d:	9e                   	sahf   
  40657e:	0f 86 0c f7 ff ff    	jbe    405c90 <___gdtoa+0x5f0>
  406584:	dd d9                	fstp   st(1)
  406586:	d9 ee                	fldz   
  406588:	d9 c9                	fxch   st(1)
  40658a:	da e9                	fucompp 
  40658c:	df e0                	fnstsw ax
  40658e:	9e                   	sahf   
  40658f:	0f 8a 4d 04 00 00    	jp     4069e2 <___gdtoa+0x1342>
  406595:	0f 85 47 04 00 00    	jne    4069e2 <___gdtoa+0x1342>
  40659b:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  4065a2:	00 
  4065a3:	eb 06                	jmp    4065ab <___gdtoa+0xf0b>
  4065a5:	0f b6 48 ff          	movzx  ecx,BYTE PTR [eax-0x1]
  4065a9:	89 c6                	mov    esi,eax
  4065ab:	80 f9 30             	cmp    cl,0x30
  4065ae:	8d 46 ff             	lea    eax,[esi-0x1]
  4065b1:	74 f2                	je     4065a5 <___gdtoa+0xf05>
  4065b3:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  4065b7:	83 c0 01             	add    eax,0x1
  4065ba:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4065be:	e9 6a f9 ff ff       	jmp    405f2d <___gdtoa+0x88d>
  4065c3:	dd d8                	fstp   st(0)
  4065c5:	dd d8                	fstp   st(0)
  4065c7:	dd d8                	fstp   st(0)
  4065c9:	c7 44 24 0c 02 00 00 	mov    DWORD PTR [esp+0xc],0x2
  4065d0:	00 
  4065d1:	31 ff                	xor    edi,edi
  4065d3:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  4065da:	00 
  4065db:	e9 0d f9 ff ff       	jmp    405eed <___gdtoa+0x84d>
  4065e0:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4065e4:	83 e1 01             	and    ecx,0x1
  4065e7:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  4065eb:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  4065ef:	0f 84 ed 03 00 00    	je     4069e2 <___gdtoa+0x1342>
  4065f5:	eb 1a                	jmp    406611 <___gdtoa+0xf71>
  4065f7:	dd d8                	fstp   st(0)
  4065f9:	dd d8                	fstp   st(0)
  4065fb:	dd d8                	fstp   st(0)
  4065fd:	eb 12                	jmp    406611 <___gdtoa+0xf71>
  4065ff:	dd d8                	fstp   st(0)
  406601:	dd d8                	fstp   st(0)
  406603:	dd d8                	fstp   st(0)
  406605:	dd d8                	fstp   st(0)
  406607:	eb 08                	jmp    406611 <___gdtoa+0xf71>
  406609:	dd d8                	fstp   st(0)
  40660b:	dd d8                	fstp   st(0)
  40660d:	dd d8                	fstp   st(0)
  40660f:	dd d8                	fstp   st(0)
  406611:	8b 54 24 24          	mov    edx,DWORD PTR [esp+0x24]
  406615:	eb 0e                	jmp    406625 <___gdtoa+0xf85>
  406617:	39 d0                	cmp    eax,edx
  406619:	0f 84 be 00 00 00    	je     4066dd <___gdtoa+0x103d>
  40661f:	0f b6 48 ff          	movzx  ecx,BYTE PTR [eax-0x1]
  406623:	89 c6                	mov    esi,eax
  406625:	80 f9 39             	cmp    cl,0x39
  406628:	8d 46 ff             	lea    eax,[esi-0x1]
  40662b:	74 ea                	je     406617 <___gdtoa+0xf77>
  40662d:	89 54 24 24          	mov    DWORD PTR [esp+0x24],edx
  406631:	83 c1 01             	add    ecx,0x1
  406634:	88 08                	mov    BYTE PTR [eax],cl
  406636:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  40663a:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406641:	00 
  406642:	83 c0 01             	add    eax,0x1
  406645:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406649:	e9 df f8 ff ff       	jmp    405f2d <___gdtoa+0x88d>
  40664e:	8b b4 24 80 00 00 00 	mov    esi,DWORD PTR [esp+0x80]
  406655:	29 ef                	sub    edi,ebp
  406657:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  40665b:	8d 47 01             	lea    eax,[edi+0x1]
  40665e:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  406662:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
  406665:	29 fa                	sub    edx,edi
  406667:	39 ca                	cmp    edx,ecx
  406669:	0f 8d be 02 00 00    	jge    40692d <___gdtoa+0x128d>
  40666f:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  406673:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  406677:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  40667b:	29 c8                	sub    eax,ecx
  40667d:	83 c0 01             	add    eax,0x1
  406680:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  406684:	e9 5d f6 ff ff       	jmp    405ce6 <___gdtoa+0x646>
  406689:	d8 c0                	fadd   st,st(0)
  40668b:	dd e1                	fucom  st(1)
  40668d:	df e0                	fnstsw ax
  40668f:	9e                   	sahf   
  406690:	0f 87 22 01 00 00    	ja     4067b8 <___gdtoa+0x1118>
  406696:	d9 c9                	fxch   st(1)
  406698:	da e9                	fucompp 
  40669a:	df e0                	fnstsw ax
  40669c:	9e                   	sahf   
  40669d:	7a 06                	jp     4066a5 <___gdtoa+0x1005>
  40669f:	0f 84 3b ff ff ff    	je     4065e0 <___gdtoa+0xf40>
  4066a5:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4066a9:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  4066ad:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  4066b4:	00 
  4066b5:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  4066b9:	e9 ed fe ff ff       	jmp    4065ab <___gdtoa+0xf0b>
  4066be:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  4066c2:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  4066c9:	00 
  4066ca:	c6 00 31             	mov    BYTE PTR [eax],0x31
  4066cd:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4066d1:	83 c0 02             	add    eax,0x2
  4066d4:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4066d8:	e9 24 f8 ff ff       	jmp    405f01 <___gdtoa+0x861>
  4066dd:	89 54 24 24          	mov    DWORD PTR [esp+0x24],edx
  4066e1:	b9 31 00 00 00       	mov    ecx,0x31
  4066e6:	83 44 24 38 01       	add    DWORD PTR [esp+0x38],0x1
  4066eb:	c6 02 30             	mov    BYTE PTR [edx],0x30
  4066ee:	e9 41 ff ff ff       	jmp    406634 <___gdtoa+0xf94>
  4066f3:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4066f7:	31 c0                	xor    eax,eax
  4066f9:	2b 74 24 18          	sub    esi,DWORD PTR [esp+0x18]
  4066fd:	c7 44 24 5c 00 00 00 	mov    DWORD PTR [esp+0x5c],0x0
  406704:	00 
  406705:	e9 dc f5 ff ff       	jmp    405ce6 <___gdtoa+0x646>
  40670a:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  40670e:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  406712:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  406716:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  40671a:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
  40671e:	85 c9                	test   ecx,ecx
  406720:	0f 84 1e 02 00 00    	je     406944 <___gdtoa+0x12a4>
  406726:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  40672a:	0f 8e 0a 02 00 00    	jle    40693a <___gdtoa+0x129a>
  406730:	83 7c 24 2c 02       	cmp    DWORD PTR [esp+0x2c],0x2
  406735:	75 3a                	jne    406771 <___gdtoa+0x10d1>
  406737:	e9 63 02 00 00       	jmp    40699f <___gdtoa+0x12ff>
  40673c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406740:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406743:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  40674a:	00 
  40674b:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  406752:	00 
  406753:	e8 78 0f 00 00       	call   4076d0 <___multadd_D2A>
  406758:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  40675c:	89 04 24             	mov    DWORD PTR [esp],eax
  40675f:	89 c3                	mov    ebx,eax
  406761:	e8 0a 0b 00 00       	call   407270 <___quorem_D2A>
  406766:	8b 6c 24 18          	mov    ebp,DWORD PTR [esp+0x18]
  40676a:	83 c0 30             	add    eax,0x30
  40676d:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406771:	89 6c 24 04          	mov    DWORD PTR [esp+0x4],ebp
  406775:	89 3c 24             	mov    DWORD PTR [esp],edi
  406778:	e8 63 14 00 00       	call   407be0 <___cmp_D2A>
  40677d:	85 c0                	test   eax,eax
  40677f:	0f 8e 88 02 00 00    	jle    406a0d <___gdtoa+0x136d>
  406785:	0f b6 44 24 10       	movzx  eax,BYTE PTR [esp+0x10]
  40678a:	83 c6 01             	add    esi,0x1
  40678d:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  406790:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  406797:	00 
  406798:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  40679f:	00 
  4067a0:	89 2c 24             	mov    DWORD PTR [esp],ebp
  4067a3:	e8 28 0f 00 00       	call   4076d0 <___multadd_D2A>
  4067a8:	39 6c 24 20          	cmp    DWORD PTR [esp+0x20],ebp
  4067ac:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  4067b0:	75 8e                	jne    406740 <___gdtoa+0x10a0>
  4067b2:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  4067b6:	eb 88                	jmp    406740 <___gdtoa+0x10a0>
  4067b8:	dd d8                	fstp   st(0)
  4067ba:	dd d8                	fstp   st(0)
  4067bc:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4067c0:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  4067c4:	8b 54 24 24          	mov    edx,DWORD PTR [esp+0x24]
  4067c8:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  4067cc:	e9 54 fe ff ff       	jmp    406625 <___gdtoa+0xf85>
  4067d1:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4067d4:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  4067db:	00 
  4067dc:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  4067e0:	e8 eb 12 00 00       	call   407ad0 <___lshift_D2A>
  4067e5:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4067e9:	89 04 24             	mov    DWORD PTR [esp],eax
  4067ec:	89 c3                	mov    ebx,eax
  4067ee:	e8 ed 13 00 00       	call   407be0 <___cmp_D2A>
  4067f3:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  4067f7:	83 f8 00             	cmp    eax,0x0
  4067fa:	0f 8f ff fb ff ff    	jg     4063ff <___gdtoa+0xd5f>
  406800:	75 0b                	jne    40680d <___gdtoa+0x116d>
  406802:	f6 44 24 10 01       	test   BYTE PTR [esp+0x10],0x1
  406807:	0f 85 f2 fb ff ff    	jne    4063ff <___gdtoa+0xd5f>
  40680d:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  406811:	0f 8e dc 02 00 00    	jle    406af3 <___gdtoa+0x1453>
  406817:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  40681e:	00 
  40681f:	eb 02                	jmp    406823 <___gdtoa+0x1183>
  406821:	89 c6                	mov    esi,eax
  406823:	80 7e ff 30          	cmp    BYTE PTR [esi-0x1],0x30
  406827:	8d 46 ff             	lea    eax,[esi-0x1]
  40682a:	74 f5                	je     406821 <___gdtoa+0x1181>
  40682c:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406830:	83 c0 01             	add    eax,0x1
  406833:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406837:	e9 c5 f6 ff ff       	jmp    405f01 <___gdtoa+0x861>
  40683c:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  406840:	85 c0                	test   eax,eax
  406842:	0f 84 fa f3 ff ff    	je     405c42 <___gdtoa+0x5a2>
  406848:	8b 54 24 44          	mov    edx,DWORD PTR [esp+0x44]
  40684c:	85 d2                	test   edx,edx
  40684e:	0f 8e 3e f4 ff ff    	jle    405c92 <___gdtoa+0x5f2>
  406854:	d9 c0                	fld    st(0)
  406856:	d8 0d 44 a3 40 00    	fmul   DWORD PTR ds:0x40a344
  40685c:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  406863:	ff 
  406864:	d9 c0                	fld    st(0)
  406866:	d8 0d 48 a3 40 00    	fmul   DWORD PTR ds:0x40a348
  40686c:	d8 05 4c a3 40 00    	fadd   DWORD PTR ds:0x40a34c
  406872:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  406876:	81 6c 24 14 00 00 40 	sub    DWORD PTR [esp+0x14],0x3400000
  40687d:	03 
  40687e:	e9 02 f2 ff ff       	jmp    405a85 <___gdtoa+0x3e5>
  406883:	8b 45 04             	mov    eax,DWORD PTR [ebp+0x4]
  406886:	89 04 24             	mov    DWORD PTR [esp],eax
  406889:	e8 02 0d 00 00       	call   407590 <___Balloc_D2A>
  40688e:	8d 48 0c             	lea    ecx,[eax+0xc]
  406891:	89 c6                	mov    esi,eax
  406893:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  406896:	89 0c 24             	mov    DWORD PTR [esp],ecx
  406899:	8d 14 85 08 00 00 00 	lea    edx,[eax*4+0x8]
  4068a0:	89 e8                	mov    eax,ebp
  4068a2:	83 c0 0c             	add    eax,0xc
  4068a5:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  4068a9:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4068ad:	e8 d6 18 00 00       	call   408188 <_memcpy>
  4068b2:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  4068b9:	00 
  4068ba:	89 34 24             	mov    DWORD PTR [esp],esi
  4068bd:	e8 0e 12 00 00       	call   407ad0 <___lshift_D2A>
  4068c2:	89 c5                	mov    ebp,eax
  4068c4:	e9 d1 f8 ff ff       	jmp    40619a <___gdtoa+0xafa>
  4068c9:	89 fa                	mov    edx,edi
  4068cb:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4068cf:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  4068d3:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  4068d7:	e9 04 fb ff ff       	jmp    4063e0 <___gdtoa+0xd40>
  4068dc:	83 7c 24 2c 02       	cmp    DWORD PTR [esp+0x2c],0x2
  4068e1:	0f 84 2c f9 ff ff    	je     406213 <___gdtoa+0xb73>
  4068e7:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4068eb:	83 7c 24 10 39       	cmp    DWORD PTR [esp+0x10],0x39
  4068f0:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  4068f4:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  4068f8:	89 f0                	mov    eax,esi
  4068fa:	0f 84 f1 00 00 00    	je     4069f1 <___gdtoa+0x1351>
  406900:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [esp+0x10]
  406905:	83 c6 01             	add    esi,0x1
  406908:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  40690c:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406913:	00 
  406914:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  406918:	83 c1 01             	add    ecx,0x1
  40691b:	88 08                	mov    BYTE PTR [eax],cl
  40691d:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406921:	83 c0 01             	add    eax,0x1
  406924:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406928:	e9 d4 f5 ff ff       	jmp    405f01 <___gdtoa+0x861>
  40692d:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  406931:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  406935:	e9 ac f3 ff ff       	jmp    405ce6 <___gdtoa+0x646>
  40693a:	83 7b 14 00          	cmp    DWORD PTR [ebx+0x14],0x0
  40693e:	0f 85 ec fd ff ff    	jne    406730 <___gdtoa+0x1090>
  406944:	85 c0                	test   eax,eax
  406946:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  40694a:	0f 8e d3 00 00 00    	jle    406a23 <___gdtoa+0x1383>
  406950:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406953:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  40695a:	00 
  40695b:	e8 70 11 00 00       	call   407ad0 <___lshift_D2A>
  406960:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  406964:	89 04 24             	mov    DWORD PTR [esp],eax
  406967:	89 c3                	mov    ebx,eax
  406969:	e8 72 12 00 00       	call   407be0 <___cmp_D2A>
  40696e:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  406972:	83 f8 00             	cmp    eax,0x0
  406975:	0f 8e 98 01 00 00    	jle    406b13 <___gdtoa+0x1473>
  40697b:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  40697f:	83 c0 31             	add    eax,0x31
  406982:	83 fa 39             	cmp    edx,0x39
  406985:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406989:	74 64                	je     4069ef <___gdtoa+0x134f>
  40698b:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406992:	00 
  406993:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  406997:	7f 06                	jg     40699f <___gdtoa+0x12ff>
  406999:	83 7b 14 00          	cmp    DWORD PTR [ebx+0x14],0x0
  40699d:	74 08                	je     4069a7 <___gdtoa+0x1307>
  40699f:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  4069a6:	00 
  4069a7:	0f b6 44 24 10       	movzx  eax,BYTE PTR [esp+0x10]
  4069ac:	83 c6 01             	add    esi,0x1
  4069af:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  4069b3:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  4069b7:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  4069ba:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4069be:	83 c0 01             	add    eax,0x1
  4069c1:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4069c5:	e9 37 f5 ff ff       	jmp    405f01 <___gdtoa+0x861>
  4069ca:	8b 4b 14             	mov    ecx,DWORD PTR [ebx+0x14]
  4069cd:	85 c9                	test   ecx,ecx
  4069cf:	0f 85 2a fa ff ff    	jne    4063ff <___gdtoa+0xd5f>
  4069d5:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  4069dc:	00 
  4069dd:	e9 41 fe ff ff       	jmp    406823 <___gdtoa+0x1183>
  4069e2:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  4069e9:	00 
  4069ea:	e9 bc fb ff ff       	jmp    4065ab <___gdtoa+0xf0b>
  4069ef:	89 f0                	mov    eax,esi
  4069f1:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  4069f5:	83 c6 01             	add    esi,0x1
  4069f8:	b9 39 00 00 00       	mov    ecx,0x39
  4069fd:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  406a01:	8b 6c 24 24          	mov    ebp,DWORD PTR [esp+0x24]
  406a05:	c6 00 39             	mov    BYTE PTR [eax],0x39
  406a08:	e9 11 fa ff ff       	jmp    40641e <___gdtoa+0xd7e>
  406a0d:	83 7c 24 10 39       	cmp    DWORD PTR [esp+0x10],0x39
  406a12:	74 db                	je     4069ef <___gdtoa+0x134f>
  406a14:	83 44 24 10 01       	add    DWORD PTR [esp+0x10],0x1
  406a19:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406a20:	00 
  406a21:	eb 84                	jmp    4069a7 <___gdtoa+0x1307>
  406a23:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  406a2a:	00 
  406a2b:	e9 63 ff ff ff       	jmp    406993 <___gdtoa+0x12f3>
  406a30:	0f 85 a8 f6 ff ff    	jne    4060de <___gdtoa+0xa3e>
  406a36:	dd d8                	fstp   st(0)
  406a38:	dd d8                	fstp   st(0)
  406a3a:	e9 0c f7 ff ff       	jmp    40614b <___gdtoa+0xaab>
  406a3f:	89 f1                	mov    ecx,esi
  406a41:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  406a45:	83 7c 24 10 39       	cmp    DWORD PTR [esp+0x10],0x39
  406a4a:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  406a4e:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  406a52:	89 f0                	mov    eax,esi
  406a54:	74 99                	je     4069ef <___gdtoa+0x134f>
  406a56:	85 c9                	test   ecx,ecx
  406a58:	7e 73                	jle    406acd <___gdtoa+0x142d>
  406a5a:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  406a5e:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406a65:	00 
  406a66:	83 c1 31             	add    ecx,0x31
  406a69:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  406a6d:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [esp+0x10]
  406a72:	83 c6 01             	add    esi,0x1
  406a75:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  406a79:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  406a7d:	88 08                	mov    BYTE PTR [eax],cl
  406a7f:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406a83:	83 c0 01             	add    eax,0x1
  406a86:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406a8a:	e9 72 f4 ff ff       	jmp    405f01 <___gdtoa+0x861>
  406a8f:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  406a93:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  406a9a:	00 
  406a9b:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  406aa2:	00 
  406aa3:	89 04 24             	mov    DWORD PTR [esp],eax
  406aa6:	e8 25 0c 00 00       	call   4076d0 <___multadd_D2A>
  406aab:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
  406ab0:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  406ab4:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  406ab8:	7f 0a                	jg     406ac4 <___gdtoa+0x1424>
  406aba:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  406ac1:	02 
  406ac2:	7f 46                	jg     406b0a <___gdtoa+0x146a>
  406ac4:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406ac8:	e9 a2 f6 ff ff       	jmp    40616f <___gdtoa+0xacf>
  406acd:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  406ad1:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  406ad8:	00 
  406ad9:	7f 92                	jg     406a6d <___gdtoa+0x13cd>
  406adb:	83 7b 14 01          	cmp    DWORD PTR [ebx+0x14],0x1
  406adf:	19 c9                	sbb    ecx,ecx
  406ae1:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
  406ae5:	f7 54 24 18          	not    DWORD PTR [esp+0x18]
  406ae9:	83 64 24 18 10       	and    DWORD PTR [esp+0x18],0x10
  406aee:	e9 7a ff ff ff       	jmp    406a6d <___gdtoa+0x13cd>
  406af3:	83 7b 14 00          	cmp    DWORD PTR [ebx+0x14],0x0
  406af7:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  406afe:	00 
  406aff:	0f 85 12 fd ff ff    	jne    406817 <___gdtoa+0x1177>
  406b05:	e9 19 fd ff ff       	jmp    406823 <___gdtoa+0x1183>
  406b0a:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406b0e:	e9 21 f3 ff ff       	jmp    405e34 <___gdtoa+0x794>
  406b13:	0f 85 72 fe ff ff    	jne    40698b <___gdtoa+0x12eb>
  406b19:	f6 44 24 10 01       	test   BYTE PTR [esp+0x10],0x1
  406b1e:	66 90                	xchg   ax,ax
  406b20:	0f 84 65 fe ff ff    	je     40698b <___gdtoa+0x12eb>
  406b26:	e9 50 fe ff ff       	jmp    40697b <___gdtoa+0x12db>
  406b2b:	31 c0                	xor    eax,eax
  406b2d:	8d 76 00             	lea    esi,[esi+0x0]
  406b30:	e9 8f ec ff ff       	jmp    4057c4 <___gdtoa+0x124>
  406b35:	b8 01 00 00 00       	mov    eax,0x1
  406b3a:	e9 40 ee ff ff       	jmp    40597f <___gdtoa+0x2df>
  406b3f:	90                   	nop

00406b40 <___wcrtomb_cp>:
  406b40:	55                   	push   ebp
  406b41:	89 e5                	mov    ebp,esp
  406b43:	83 ec 48             	sub    esp,0x48
  406b46:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
  406b49:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  406b4c:	85 d2                	test   edx,edx
  406b4e:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
  406b52:	75 12                	jne    406b66 <___wcrtomb_cp+0x26>
  406b54:	66 3d ff 00          	cmp    ax,0xff
  406b58:	77 5d                	ja     406bb7 <___wcrtomb_cp+0x77>
  406b5a:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  406b5d:	88 01                	mov    BYTE PTR [ecx],al
  406b5f:	b8 01 00 00 00       	mov    eax,0x1
  406b64:	c9                   	leave  
  406b65:	c3                   	ret    
  406b66:	8d 45 f4             	lea    eax,[ebp-0xc]
  406b69:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  406b6d:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  406b70:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  406b77:	00 
  406b78:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
  406b7f:	00 
  406b80:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406b87:	00 
  406b88:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  406b8c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406b8f:	89 14 24             	mov    DWORD PTR [esp],edx
  406b92:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  406b99:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406b9d:	8d 45 e4             	lea    eax,[ebp-0x1c]
  406ba0:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  406ba4:	e8 ef 16 00 00       	call   408298 <_WideCharToMultiByte@32>
  406ba9:	83 ec 20             	sub    esp,0x20
  406bac:	85 c0                	test   eax,eax
  406bae:	74 07                	je     406bb7 <___wcrtomb_cp+0x77>
  406bb0:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  406bb3:	85 d2                	test   edx,edx
  406bb5:	74 ad                	je     406b64 <___wcrtomb_cp+0x24>
  406bb7:	e8 04 16 00 00       	call   4081c0 <__errno>
  406bbc:	c7 00 2a 00 00 00    	mov    DWORD PTR [eax],0x2a
  406bc2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  406bc7:	c9                   	leave  
  406bc8:	c3                   	ret    
  406bc9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00406bd0 <_wcrtomb>:
  406bd0:	57                   	push   edi
  406bd1:	56                   	push   esi
  406bd2:	53                   	push   ebx
  406bd3:	83 ec 20             	sub    esp,0x20
  406bd6:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  406bda:	8b 74 24 34          	mov    esi,DWORD PTR [esp+0x34]
  406bde:	85 db                	test   ebx,ebx
  406be0:	74 5e                	je     406c40 <_wcrtomb+0x70>
  406be2:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  406be7:	8b 38                	mov    edi,DWORD PTR [eax]
  406be9:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406bf0:	00 
  406bf1:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406bf8:	e8 cb 15 00 00       	call   4081c8 <_setlocale>
  406bfd:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406c04:	00 
  406c05:	89 04 24             	mov    DWORD PTR [esp],eax
  406c08:	e8 fb 15 00 00       	call   408208 <_strchr>
  406c0d:	31 d2                	xor    edx,edx
  406c0f:	85 c0                	test   eax,eax
  406c11:	74 0d                	je     406c20 <_wcrtomb+0x50>
  406c13:	83 c0 01             	add    eax,0x1
  406c16:	89 04 24             	mov    DWORD PTR [esp],eax
  406c19:	e8 f2 15 00 00       	call   408210 <_atoi>
  406c1e:	89 c2                	mov    edx,eax
  406c20:	0f b7 f6             	movzx  esi,si
  406c23:	89 7c 24 0c          	mov    DWORD PTR [esp+0xc],edi
  406c27:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  406c2b:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406c2e:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  406c32:	e8 09 ff ff ff       	call   406b40 <___wcrtomb_cp>
  406c37:	83 c4 20             	add    esp,0x20
  406c3a:	5b                   	pop    ebx
  406c3b:	5e                   	pop    esi
  406c3c:	5f                   	pop    edi
  406c3d:	c3                   	ret    
  406c3e:	66 90                	xchg   ax,ax
  406c40:	8d 5c 24 1e          	lea    ebx,[esp+0x1e]
  406c44:	eb 9c                	jmp    406be2 <_wcrtomb+0x12>
  406c46:	8d 76 00             	lea    esi,[esi+0x0]
  406c49:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00406c50 <_wcsrtombs>:
  406c50:	55                   	push   ebp
  406c51:	57                   	push   edi
  406c52:	56                   	push   esi
  406c53:	31 f6                	xor    esi,esi
  406c55:	53                   	push   ebx
  406c56:	83 ec 3c             	sub    esp,0x3c
  406c59:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406c60:	00 
  406c61:	8b 5c 24 50          	mov    ebx,DWORD PTR [esp+0x50]
  406c65:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406c6c:	e8 57 15 00 00       	call   4081c8 <_setlocale>
  406c71:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406c78:	00 
  406c79:	89 04 24             	mov    DWORD PTR [esp],eax
  406c7c:	e8 87 15 00 00       	call   408208 <_strchr>
  406c81:	85 c0                	test   eax,eax
  406c83:	74 0d                	je     406c92 <_wcsrtombs+0x42>
  406c85:	83 c0 01             	add    eax,0x1
  406c88:	89 04 24             	mov    DWORD PTR [esp],eax
  406c8b:	e8 80 15 00 00       	call   408210 <_atoi>
  406c90:	89 c6                	mov    esi,eax
  406c92:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  406c97:	8b 00                	mov    eax,DWORD PTR [eax]
  406c99:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  406c9d:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  406ca1:	8b 38                	mov    edi,DWORD PTR [eax]
  406ca3:	85 ff                	test   edi,edi
  406ca5:	0f 84 cc 00 00 00    	je     406d77 <_wcsrtombs+0x127>
  406cab:	31 ed                	xor    ebp,ebp
  406cad:	85 db                	test   ebx,ebx
  406caf:	74 76                	je     406d27 <_wcsrtombs+0xd7>
  406cb1:	8b 4c 24 58          	mov    ecx,DWORD PTR [esp+0x58]
  406cb5:	85 c9                	test   ecx,ecx
  406cb7:	74 49                	je     406d02 <_wcsrtombs+0xb2>
  406cb9:	89 f0                	mov    eax,esi
  406cbb:	89 fe                	mov    esi,edi
  406cbd:	89 c7                	mov    edi,eax
  406cbf:	eb 13                	jmp    406cd4 <_wcsrtombs+0x84>
  406cc1:	01 c3                	add    ebx,eax
  406cc3:	01 c5                	add    ebp,eax
  406cc5:	80 7b ff 00          	cmp    BYTE PTR [ebx-0x1],0x0
  406cc9:	74 47                	je     406d12 <_wcsrtombs+0xc2>
  406ccb:	83 c6 02             	add    esi,0x2
  406cce:	39 6c 24 58          	cmp    DWORD PTR [esp+0x58],ebp
  406cd2:	76 2c                	jbe    406d00 <_wcsrtombs+0xb0>
  406cd4:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  406cd8:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  406cdc:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406ce0:	0f b7 06             	movzx  eax,WORD PTR [esi]
  406ce3:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406ce6:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406cea:	e8 51 fe ff ff       	call   406b40 <___wcrtomb_cp>
  406cef:	85 c0                	test   eax,eax
  406cf1:	7f ce                	jg     406cc1 <_wcsrtombs+0x71>
  406cf3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  406cf8:	83 c4 3c             	add    esp,0x3c
  406cfb:	5b                   	pop    ebx
  406cfc:	5e                   	pop    esi
  406cfd:	5f                   	pop    edi
  406cfe:	5d                   	pop    ebp
  406cff:	c3                   	ret    
  406d00:	89 f7                	mov    edi,esi
  406d02:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  406d06:	89 38                	mov    DWORD PTR [eax],edi
  406d08:	83 c4 3c             	add    esp,0x3c
  406d0b:	89 e8                	mov    eax,ebp
  406d0d:	5b                   	pop    ebx
  406d0e:	5e                   	pop    esi
  406d0f:	5f                   	pop    edi
  406d10:	5d                   	pop    ebp
  406d11:	c3                   	ret    
  406d12:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  406d16:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  406d1c:	83 c4 3c             	add    esp,0x3c
  406d1f:	5b                   	pop    ebx
  406d20:	8d 45 ff             	lea    eax,[ebp-0x1]
  406d23:	5e                   	pop    esi
  406d24:	5f                   	pop    edi
  406d25:	5d                   	pop    ebp
  406d26:	c3                   	ret    
  406d27:	8b 44 24 58          	mov    eax,DWORD PTR [esp+0x58]
  406d2b:	85 c0                	test   eax,eax
  406d2d:	74 63                	je     406d92 <_wcsrtombs+0x142>
  406d2f:	89 e8                	mov    eax,ebp
  406d31:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
  406d35:	89 fd                	mov    ebp,edi
  406d37:	89 c7                	mov    edi,eax
  406d39:	eb 17                	jmp    406d52 <_wcsrtombs+0x102>
  406d3b:	90                   	nop
  406d3c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406d40:	01 c7                	add    edi,eax
  406d42:	80 7c 04 2d 00       	cmp    BYTE PTR [esp+eax*1+0x2d],0x0
  406d47:	74 38                	je     406d81 <_wcsrtombs+0x131>
  406d49:	83 c5 02             	add    ebp,0x2
  406d4c:	39 7c 24 58          	cmp    DWORD PTR [esp+0x58],edi
  406d50:	76 37                	jbe    406d89 <_wcsrtombs+0x139>
  406d52:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  406d56:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  406d5a:	0f b7 45 00          	movzx  eax,WORD PTR [ebp+0x0]
  406d5e:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406d62:	8d 44 24 2e          	lea    eax,[esp+0x2e]
  406d66:	89 04 24             	mov    DWORD PTR [esp],eax
  406d69:	e8 d2 fd ff ff       	call   406b40 <___wcrtomb_cp>
  406d6e:	85 c0                	test   eax,eax
  406d70:	7f ce                	jg     406d40 <_wcsrtombs+0xf0>
  406d72:	e9 7c ff ff ff       	jmp    406cf3 <_wcsrtombs+0xa3>
  406d77:	83 c4 3c             	add    esp,0x3c
  406d7a:	31 c0                	xor    eax,eax
  406d7c:	5b                   	pop    ebx
  406d7d:	5e                   	pop    esi
  406d7e:	5f                   	pop    edi
  406d7f:	5d                   	pop    ebp
  406d80:	c3                   	ret    
  406d81:	8d 47 ff             	lea    eax,[edi-0x1]
  406d84:	e9 6f ff ff ff       	jmp    406cf8 <_wcsrtombs+0xa8>
  406d89:	89 fd                	mov    ebp,edi
  406d8b:	89 e8                	mov    eax,ebp
  406d8d:	e9 66 ff ff ff       	jmp    406cf8 <_wcsrtombs+0xa8>
  406d92:	89 dd                	mov    ebp,ebx
  406d94:	89 e8                	mov    eax,ebp
  406d96:	e9 5d ff ff ff       	jmp    406cf8 <_wcsrtombs+0xa8>
  406d9b:	90                   	nop
  406d9c:	90                   	nop
  406d9d:	90                   	nop
  406d9e:	90                   	nop
  406d9f:	90                   	nop

00406da0 <___mbrtowc_cp>:
  406da0:	55                   	push   ebp
  406da1:	89 e5                	mov    ebp,esp
  406da3:	56                   	push   esi
  406da4:	53                   	push   ebx
  406da5:	83 ec 30             	sub    esp,0x30
  406da8:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
  406dab:	8b 75 14             	mov    esi,DWORD PTR [ebp+0x14]
  406dae:	85 db                	test   ebx,ebx
  406db0:	0f 84 2d 01 00 00    	je     406ee3 <___mbrtowc_cp+0x143>
  406db6:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
  406db9:	85 c9                	test   ecx,ecx
  406dbb:	0f 84 2f 01 00 00    	je     406ef0 <___mbrtowc_cp+0x150>
  406dc1:	8b 06                	mov    eax,DWORD PTR [esi]
  406dc3:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
  406dc9:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  406dcc:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  406dcf:	84 c0                	test   al,al
  406dd1:	0f 84 99 00 00 00    	je     406e70 <___mbrtowc_cp+0xd0>
  406dd7:	83 7d 1c 01          	cmp    DWORD PTR [ebp+0x1c],0x1
  406ddb:	76 73                	jbe    406e50 <___mbrtowc_cp+0xb0>
  406ddd:	80 7d f4 00          	cmp    BYTE PTR [ebp-0xc],0x0
  406de1:	0f 85 9a 00 00 00    	jne    406e81 <___mbrtowc_cp+0xe1>
  406de7:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406deb:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406dee:	89 04 24             	mov    DWORD PTR [esp],eax
  406df1:	e8 aa 14 00 00       	call   4082a0 <_IsDBCSLeadByteEx@8>
  406df6:	83 ec 08             	sub    esp,0x8
  406df9:	85 c0                	test   eax,eax
  406dfb:	74 53                	je     406e50 <___mbrtowc_cp+0xb0>
  406dfd:	83 7d 10 01          	cmp    DWORD PTR [ebp+0x10],0x1
  406e01:	0f 86 05 01 00 00    	jbe    406f0c <___mbrtowc_cp+0x16c>
  406e07:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406e0a:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  406e11:	00 
  406e12:	c7 44 24 0c 02 00 00 	mov    DWORD PTR [esp+0xc],0x2
  406e19:	00 
  406e1a:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  406e1e:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406e22:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406e25:	c7 44 24 04 08 00 00 	mov    DWORD PTR [esp+0x4],0x8
  406e2c:	00 
  406e2d:	89 04 24             	mov    DWORD PTR [esp],eax
  406e30:	e8 73 14 00 00       	call   4082a8 <_MultiByteToWideChar@24>
  406e35:	83 ec 18             	sub    esp,0x18
  406e38:	85 c0                	test   eax,eax
  406e3a:	0f 84 b7 00 00 00    	je     406ef7 <___mbrtowc_cp+0x157>
  406e40:	8d 65 f8             	lea    esp,[ebp-0x8]
  406e43:	b8 02 00 00 00       	mov    eax,0x2
  406e48:	5b                   	pop    ebx
  406e49:	5e                   	pop    esi
  406e4a:	5d                   	pop    ebp
  406e4b:	c3                   	ret    
  406e4c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406e50:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406e53:	85 c0                	test   eax,eax
  406e55:	75 50                	jne    406ea7 <___mbrtowc_cp+0x107>
  406e57:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  406e5a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  406e5d:	66 89 02             	mov    WORD PTR [edx],ax
  406e60:	8d 65 f8             	lea    esp,[ebp-0x8]
  406e63:	b8 01 00 00 00       	mov    eax,0x1
  406e68:	5b                   	pop    ebx
  406e69:	5e                   	pop    esi
  406e6a:	5d                   	pop    ebp
  406e6b:	c3                   	ret    
  406e6c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406e70:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406e73:	31 d2                	xor    edx,edx
  406e75:	66 89 10             	mov    WORD PTR [eax],dx
  406e78:	31 c0                	xor    eax,eax
  406e7a:	8d 65 f8             	lea    esp,[ebp-0x8]
  406e7d:	5b                   	pop    ebx
  406e7e:	5e                   	pop    esi
  406e7f:	5d                   	pop    ebp
  406e80:	c3                   	ret    
  406e81:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
  406e84:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406e87:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  406e8e:	00 
  406e8f:	c7 44 24 0c 02 00 00 	mov    DWORD PTR [esp+0xc],0x2
  406e96:	00 
  406e97:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406e9b:	8d 45 f4             	lea    eax,[ebp-0xc]
  406e9e:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  406ea2:	e9 7b ff ff ff       	jmp    406e22 <___mbrtowc_cp+0x82>
  406ea7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406eaa:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  406eb1:	00 
  406eb2:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
  406eb9:	00 
  406eba:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  406ebe:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406ec2:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406ec5:	c7 44 24 04 08 00 00 	mov    DWORD PTR [esp+0x4],0x8
  406ecc:	00 
  406ecd:	89 04 24             	mov    DWORD PTR [esp],eax
  406ed0:	e8 d3 13 00 00       	call   4082a8 <_MultiByteToWideChar@24>
  406ed5:	83 ec 18             	sub    esp,0x18
  406ed8:	85 c0                	test   eax,eax
  406eda:	74 1b                	je     406ef7 <___mbrtowc_cp+0x157>
  406edc:	b8 01 00 00 00       	mov    eax,0x1
  406ee1:	eb 97                	jmp    406e7a <___mbrtowc_cp+0xda>
  406ee3:	8d 65 f8             	lea    esp,[ebp-0x8]
  406ee6:	31 c0                	xor    eax,eax
  406ee8:	5b                   	pop    ebx
  406ee9:	5e                   	pop    esi
  406eea:	5d                   	pop    ebp
  406eeb:	c3                   	ret    
  406eec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406ef0:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  406ef5:	eb 83                	jmp    406e7a <___mbrtowc_cp+0xda>
  406ef7:	e8 c4 12 00 00       	call   4081c0 <__errno>
  406efc:	c7 00 2a 00 00 00    	mov    DWORD PTR [eax],0x2a
  406f02:	b8 ff ff ff ff       	mov    eax,0xffffffff
  406f07:	e9 6e ff ff ff       	jmp    406e7a <___mbrtowc_cp+0xda>
  406f0c:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  406f0f:	88 06                	mov    BYTE PTR [esi],al
  406f11:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  406f16:	e9 5f ff ff ff       	jmp    406e7a <___mbrtowc_cp+0xda>
  406f1b:	90                   	nop
  406f1c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00406f20 <_mbrtowc>:
  406f20:	56                   	push   esi
  406f21:	31 f6                	xor    esi,esi
  406f23:	53                   	push   ebx
  406f24:	83 ec 34             	sub    esp,0x34
  406f27:	8b 5c 24 40          	mov    ebx,DWORD PTR [esp+0x40]
  406f2b:	66 89 74 24 2e       	mov    WORD PTR [esp+0x2e],si
  406f30:	85 db                	test   ebx,ebx
  406f32:	74 70                	je     406fa4 <_mbrtowc+0x84>
  406f34:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  406f39:	8b 30                	mov    esi,DWORD PTR [eax]
  406f3b:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406f42:	00 
  406f43:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406f4a:	e8 79 12 00 00       	call   4081c8 <_setlocale>
  406f4f:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406f56:	00 
  406f57:	89 04 24             	mov    DWORD PTR [esp],eax
  406f5a:	e8 a9 12 00 00       	call   408208 <_strchr>
  406f5f:	31 c9                	xor    ecx,ecx
  406f61:	85 c0                	test   eax,eax
  406f63:	74 0d                	je     406f72 <_mbrtowc+0x52>
  406f65:	83 c0 01             	add    eax,0x1
  406f68:	89 04 24             	mov    DWORD PTR [esp],eax
  406f6b:	e8 a0 12 00 00       	call   408210 <_atoi>
  406f70:	89 c1                	mov    ecx,eax
  406f72:	8b 54 24 4c          	mov    edx,DWORD PTR [esp+0x4c]
  406f76:	85 d2                	test   edx,edx
  406f78:	74 36                	je     406fb0 <_mbrtowc+0x90>
  406f7a:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  406f7e:	89 74 24 14          	mov    DWORD PTR [esp+0x14],esi
  406f82:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406f85:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  406f89:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  406f8d:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  406f91:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  406f95:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406f99:	e8 02 fe ff ff       	call   406da0 <___mbrtowc_cp>
  406f9e:	83 c4 34             	add    esp,0x34
  406fa1:	5b                   	pop    ebx
  406fa2:	5e                   	pop    esi
  406fa3:	c3                   	ret    
  406fa4:	8d 5c 24 2e          	lea    ebx,[esp+0x2e]
  406fa8:	eb 8a                	jmp    406f34 <_mbrtowc+0x14>
  406faa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  406fb0:	ba 78 d0 40 00       	mov    edx,0x40d078
  406fb5:	eb c3                	jmp    406f7a <_mbrtowc+0x5a>
  406fb7:	89 f6                	mov    esi,esi
  406fb9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00406fc0 <_mbsrtowcs>:
  406fc0:	55                   	push   ebp
  406fc1:	57                   	push   edi
  406fc2:	56                   	push   esi
  406fc3:	53                   	push   ebx
  406fc4:	83 ec 3c             	sub    esp,0x3c
  406fc7:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  406fcb:	8b 5c 24 50          	mov    ebx,DWORD PTR [esp+0x50]
  406fcf:	8b 74 24 54          	mov    esi,DWORD PTR [esp+0x54]
  406fd3:	8b 7c 24 58          	mov    edi,DWORD PTR [esp+0x58]
  406fd7:	85 c0                	test   eax,eax
  406fd9:	0f 84 41 01 00 00    	je     407120 <_mbsrtowcs+0x160>
  406fdf:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406fe6:	00 
  406fe7:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406fee:	e8 d5 11 00 00       	call   4081c8 <_setlocale>
  406ff3:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406ffa:	00 
  406ffb:	89 04 24             	mov    DWORD PTR [esp],eax
  406ffe:	e8 05 12 00 00       	call   408208 <_strchr>
  407003:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  40700a:	00 
  40700b:	85 c0                	test   eax,eax
  40700d:	74 0f                	je     40701e <_mbsrtowcs+0x5e>
  40700f:	83 c0 01             	add    eax,0x1
  407012:	89 04 24             	mov    DWORD PTR [esp],eax
  407015:	e8 f6 11 00 00       	call   408210 <_atoi>
  40701a:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  40701e:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  407023:	85 f6                	test   esi,esi
  407025:	8b 00                	mov    eax,DWORD PTR [eax]
  407027:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  40702b:	0f 84 df 00 00 00    	je     407110 <_mbsrtowcs+0x150>
  407031:	8b 0e                	mov    ecx,DWORD PTR [esi]
  407033:	85 c9                	test   ecx,ecx
  407035:	0f 84 d5 00 00 00    	je     407110 <_mbsrtowcs+0x150>
  40703b:	85 db                	test   ebx,ebx
  40703d:	74 71                	je     4070b0 <_mbsrtowcs+0xf0>
  40703f:	85 ff                	test   edi,edi
  407041:	0f 84 c9 00 00 00    	je     407110 <_mbsrtowcs+0x150>
  407047:	89 74 24 54          	mov    DWORD PTR [esp+0x54],esi
  40704b:	31 ed                	xor    ebp,ebp
  40704d:	89 de                	mov    esi,ebx
  40704f:	8b 5c 24 54          	mov    ebx,DWORD PTR [esp+0x54]
  407053:	eb 0f                	jmp    407064 <_mbsrtowcs+0xa4>
  407055:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  407057:	01 c5                	add    ebp,eax
  407059:	83 c6 02             	add    esi,0x2
  40705c:	01 c1                	add    ecx,eax
  40705e:	39 ef                	cmp    edi,ebp
  407060:	89 0b                	mov    DWORD PTR [ebx],ecx
  407062:	76 30                	jbe    407094 <_mbsrtowcs+0xd4>
  407064:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  407068:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  40706c:	89 34 24             	mov    DWORD PTR [esp],esi
  40706f:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  407073:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  407077:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40707b:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  40707f:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  407083:	89 f8                	mov    eax,edi
  407085:	29 e8                	sub    eax,ebp
  407087:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40708b:	e8 10 fd ff ff       	call   406da0 <___mbrtowc_cp>
  407090:	85 c0                	test   eax,eax
  407092:	7f c1                	jg     407055 <_mbsrtowcs+0x95>
  407094:	85 c0                	test   eax,eax
  407096:	75 6e                	jne    407106 <_mbsrtowcs+0x146>
  407098:	39 fd                	cmp    ebp,edi
  40709a:	73 6a                	jae    407106 <_mbsrtowcs+0x146>
  40709c:	c7 03 00 00 00 00    	mov    DWORD PTR [ebx],0x0
  4070a2:	83 c4 3c             	add    esp,0x3c
  4070a5:	89 e8                	mov    eax,ebp
  4070a7:	5b                   	pop    ebx
  4070a8:	5e                   	pop    esi
  4070a9:	5f                   	pop    edi
  4070aa:	5d                   	pop    ebp
  4070ab:	c3                   	ret    
  4070ac:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4070b0:	31 ed                	xor    ebp,ebp
  4070b2:	66 89 6c 24 2e       	mov    WORD PTR [esp+0x2e],bp
  4070b7:	31 ed                	xor    ebp,ebp
  4070b9:	85 ff                	test   edi,edi
  4070bb:	74 49                	je     407106 <_mbsrtowcs+0x146>
  4070bd:	89 7c 24 58          	mov    DWORD PTR [esp+0x58],edi
  4070c1:	8d 5c 24 2e          	lea    ebx,[esp+0x2e]
  4070c5:	89 f7                	mov    edi,esi
  4070c7:	8b 74 24 1c          	mov    esi,DWORD PTR [esp+0x1c]
  4070cb:	eb 11                	jmp    4070de <_mbsrtowcs+0x11e>
  4070cd:	8d 76 00             	lea    esi,[esi+0x0]
  4070d0:	8b 0f                	mov    ecx,DWORD PTR [edi]
  4070d2:	01 c5                	add    ebp,eax
  4070d4:	01 c1                	add    ecx,eax
  4070d6:	39 6c 24 58          	cmp    DWORD PTR [esp+0x58],ebp
  4070da:	89 0f                	mov    DWORD PTR [edi],ecx
  4070dc:	76 28                	jbe    407106 <_mbsrtowcs+0x146>
  4070de:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  4070e2:	89 74 24 14          	mov    DWORD PTR [esp+0x14],esi
  4070e6:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  4070ea:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  4070ee:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4070f2:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  4070f6:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4070f9:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4070fd:	e8 9e fc ff ff       	call   406da0 <___mbrtowc_cp>
  407102:	85 c0                	test   eax,eax
  407104:	7f ca                	jg     4070d0 <_mbsrtowcs+0x110>
  407106:	83 c4 3c             	add    esp,0x3c
  407109:	89 e8                	mov    eax,ebp
  40710b:	5b                   	pop    ebx
  40710c:	5e                   	pop    esi
  40710d:	5f                   	pop    edi
  40710e:	5d                   	pop    ebp
  40710f:	c3                   	ret    
  407110:	83 c4 3c             	add    esp,0x3c
  407113:	31 c0                	xor    eax,eax
  407115:	5b                   	pop    ebx
  407116:	5e                   	pop    esi
  407117:	5f                   	pop    edi
  407118:	5d                   	pop    ebp
  407119:	c3                   	ret    
  40711a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  407120:	c7 44 24 5c 74 d0 40 	mov    DWORD PTR [esp+0x5c],0x40d074
  407127:	00 
  407128:	e9 b2 fe ff ff       	jmp    406fdf <_mbsrtowcs+0x1f>
  40712d:	8d 76 00             	lea    esi,[esi+0x0]

00407130 <_mbrlen>:
  407130:	53                   	push   ebx
  407131:	31 c0                	xor    eax,eax
  407133:	83 ec 38             	sub    esp,0x38
  407136:	66 89 44 24 2e       	mov    WORD PTR [esp+0x2e],ax
  40713b:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  407140:	8b 18                	mov    ebx,DWORD PTR [eax]
  407142:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  407149:	00 
  40714a:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  407151:	e8 72 10 00 00       	call   4081c8 <_setlocale>
  407156:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  40715d:	00 
  40715e:	89 04 24             	mov    DWORD PTR [esp],eax
  407161:	e8 a2 10 00 00       	call   408208 <_strchr>
  407166:	31 c9                	xor    ecx,ecx
  407168:	85 c0                	test   eax,eax
  40716a:	74 0d                	je     407179 <_mbrlen+0x49>
  40716c:	83 c0 01             	add    eax,0x1
  40716f:	89 04 24             	mov    DWORD PTR [esp],eax
  407172:	e8 99 10 00 00       	call   408210 <_atoi>
  407177:	89 c1                	mov    ecx,eax
  407179:	8b 54 24 48          	mov    edx,DWORD PTR [esp+0x48]
  40717d:	85 d2                	test   edx,edx
  40717f:	74 2f                	je     4071b0 <_mbrlen+0x80>
  407181:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  407185:	89 5c 24 14          	mov    DWORD PTR [esp+0x14],ebx
  407189:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  40718d:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  407191:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  407195:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407199:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40719d:	8d 44 24 2e          	lea    eax,[esp+0x2e]
  4071a1:	89 04 24             	mov    DWORD PTR [esp],eax
  4071a4:	e8 f7 fb ff ff       	call   406da0 <___mbrtowc_cp>
  4071a9:	83 c4 38             	add    esp,0x38
  4071ac:	5b                   	pop    ebx
  4071ad:	c3                   	ret    
  4071ae:	66 90                	xchg   ax,ax
  4071b0:	ba 70 d0 40 00       	mov    edx,0x40d070
  4071b5:	eb ca                	jmp    407181 <_mbrlen+0x51>
  4071b7:	90                   	nop
  4071b8:	90                   	nop
  4071b9:	90                   	nop
  4071ba:	90                   	nop
  4071bb:	90                   	nop
  4071bc:	90                   	nop
  4071bd:	90                   	nop
  4071be:	90                   	nop
  4071bf:	90                   	nop

004071c0 <___rv_alloc_D2A>:
  4071c0:	53                   	push   ebx
  4071c1:	31 db                	xor    ebx,ebx
  4071c3:	83 ec 18             	sub    esp,0x18
  4071c6:	8b 4c 24 20          	mov    ecx,DWORD PTR [esp+0x20]
  4071ca:	83 f9 13             	cmp    ecx,0x13
  4071cd:	76 11                	jbe    4071e0 <___rv_alloc_D2A+0x20>
  4071cf:	b8 04 00 00 00       	mov    eax,0x4
  4071d4:	01 c0                	add    eax,eax
  4071d6:	83 c3 01             	add    ebx,0x1
  4071d9:	8d 50 10             	lea    edx,[eax+0x10]
  4071dc:	39 ca                	cmp    edx,ecx
  4071de:	76 f4                	jbe    4071d4 <___rv_alloc_D2A+0x14>
  4071e0:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4071e3:	e8 a8 03 00 00       	call   407590 <___Balloc_D2A>
  4071e8:	89 18                	mov    DWORD PTR [eax],ebx
  4071ea:	83 c4 18             	add    esp,0x18
  4071ed:	83 c0 04             	add    eax,0x4
  4071f0:	5b                   	pop    ebx
  4071f1:	c3                   	ret    
  4071f2:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4071f9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00407200 <___nrv_alloc_D2A>:
  407200:	56                   	push   esi
  407201:	53                   	push   ebx
  407202:	83 ec 14             	sub    esp,0x14
  407205:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  407209:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
  40720d:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  407211:	89 04 24             	mov    DWORD PTR [esp],eax
  407214:	e8 a7 ff ff ff       	call   4071c0 <___rv_alloc_D2A>
  407219:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
  40721c:	8d 4b 01             	lea    ecx,[ebx+0x1]
  40721f:	84 d2                	test   dl,dl
  407221:	88 10                	mov    BYTE PTR [eax],dl
  407223:	89 c2                	mov    edx,eax
  407225:	74 10                	je     407237 <___nrv_alloc_D2A+0x37>
  407227:	83 c1 01             	add    ecx,0x1
  40722a:	0f b6 59 ff          	movzx  ebx,BYTE PTR [ecx-0x1]
  40722e:	83 c2 01             	add    edx,0x1
  407231:	84 db                	test   bl,bl
  407233:	88 1a                	mov    BYTE PTR [edx],bl
  407235:	75 f0                	jne    407227 <___nrv_alloc_D2A+0x27>
  407237:	85 f6                	test   esi,esi
  407239:	74 02                	je     40723d <___nrv_alloc_D2A+0x3d>
  40723b:	89 16                	mov    DWORD PTR [esi],edx
  40723d:	83 c4 14             	add    esp,0x14
  407240:	5b                   	pop    ebx
  407241:	5e                   	pop    esi
  407242:	c3                   	ret    
  407243:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  407249:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00407250 <___freedtoa>:
  407250:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  407254:	ba 01 00 00 00       	mov    edx,0x1
  407259:	8b 48 fc             	mov    ecx,DWORD PTR [eax-0x4]
  40725c:	83 e8 04             	sub    eax,0x4
  40725f:	d3 e2                	shl    edx,cl
  407261:	89 48 04             	mov    DWORD PTR [eax+0x4],ecx
  407264:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
  407267:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40726b:	e9 f0 03 00 00       	jmp    407660 <___Bfree_D2A>

00407270 <___quorem_D2A>:
  407270:	55                   	push   ebp
  407271:	57                   	push   edi
  407272:	56                   	push   esi
  407273:	53                   	push   ebx
  407274:	83 ec 4c             	sub    esp,0x4c
  407277:	8b 44 24 64          	mov    eax,DWORD PTR [esp+0x64]
  40727b:	8b 7c 24 60          	mov    edi,DWORD PTR [esp+0x60]
  40727f:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
  407282:	31 c0                	xor    eax,eax
  407284:	3b 57 10             	cmp    edx,DWORD PTR [edi+0x10]
  407287:	0f 8f d6 01 00 00    	jg     407463 <___quorem_D2A+0x1f3>
  40728d:	8b 44 24 64          	mov    eax,DWORD PTR [esp+0x64]
  407291:	8b 74 24 60          	mov    esi,DWORD PTR [esp+0x60]
  407295:	83 c0 14             	add    eax,0x14
  407298:	89 c7                	mov    edi,eax
  40729a:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  40729e:	8d 42 ff             	lea    eax,[edx-0x1]
  4072a1:	31 d2                	xor    edx,edx
  4072a3:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  4072a7:	c1 e0 02             	shl    eax,0x2
  4072aa:	01 c7                	add    edi,eax
  4072ac:	8d 5e 14             	lea    ebx,[esi+0x14]
  4072af:	01 d8                	add    eax,ebx
  4072b1:	89 7c 24 28          	mov    DWORD PTR [esp+0x28],edi
  4072b5:	8b 3f                	mov    edi,DWORD PTR [edi]
  4072b7:	89 44 24 3c          	mov    DWORD PTR [esp+0x3c],eax
  4072bb:	8b 00                	mov    eax,DWORD PTR [eax]
  4072bd:	89 5c 24 2c          	mov    DWORD PTR [esp+0x2c],ebx
  4072c1:	8d 4f 01             	lea    ecx,[edi+0x1]
  4072c4:	f7 f1                	div    ecx
  4072c6:	89 7c 24 10          	mov    DWORD PTR [esp+0x10],edi
  4072ca:	85 c0                	test   eax,eax
  4072cc:	89 c5                	mov    ebp,eax
  4072ce:	89 44 24 34          	mov    DWORD PTR [esp+0x34],eax
  4072d2:	0f 84 c7 00 00 00    	je     40739f <___quorem_D2A+0x12f>
  4072d8:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
  4072dc:	89 de                	mov    esi,ebx
  4072de:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  4072e5:	00 
  4072e6:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  4072ed:	00 
  4072ee:	c7 44 24 10 00 00 00 	mov    DWORD PTR [esp+0x10],0x0
  4072f5:	00 
  4072f6:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  4072fd:	00 
  4072fe:	66 90                	xchg   ax,ax
  407300:	83 c7 04             	add    edi,0x4
  407303:	89 e8                	mov    eax,ebp
  407305:	f7 67 fc             	mul    DWORD PTR [edi-0x4]
  407308:	03 44 24 20          	add    eax,DWORD PTR [esp+0x20]
  40730c:	13 54 24 24          	adc    edx,DWORD PTR [esp+0x24]
  407310:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [esp+0x1c],0x0
  407317:	00 
  407318:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  40731c:	89 d3                	mov    ebx,edx
  40731e:	89 d9                	mov    ecx,ebx
  407320:	31 db                	xor    ebx,ebx
  407322:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  407326:	8b 0e                	mov    ecx,DWORD PTR [esi]
  407328:	89 5c 24 24          	mov    DWORD PTR [esp+0x24],ebx
  40732c:	31 db                	xor    ebx,ebx
  40732e:	2b 4c 24 18          	sub    ecx,DWORD PTR [esp+0x18]
  407332:	1b 5c 24 1c          	sbb    ebx,DWORD PTR [esp+0x1c]
  407336:	2b 4c 24 10          	sub    ecx,DWORD PTR [esp+0x10]
  40733a:	1b 5c 24 14          	sbb    ebx,DWORD PTR [esp+0x14]
  40733e:	83 c6 04             	add    esi,0x4
  407341:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  407348:	00 
  407349:	89 d8                	mov    eax,ebx
  40734b:	83 e0 01             	and    eax,0x1
  40734e:	39 7c 24 28          	cmp    DWORD PTR [esp+0x28],edi
  407352:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  407356:	89 4e fc             	mov    DWORD PTR [esi-0x4],ecx
  407359:	73 a5                	jae    407300 <___quorem_D2A+0x90>
  40735b:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  40735f:	8b 38                	mov    edi,DWORD PTR [eax]
  407361:	85 ff                	test   edi,edi
  407363:	75 3a                	jne    40739f <___quorem_D2A+0x12f>
  407365:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  407369:	89 c6                	mov    esi,eax
  40736b:	83 e8 04             	sub    eax,0x4
  40736e:	39 c1                	cmp    ecx,eax
  407370:	73 22                	jae    407394 <___quorem_D2A+0x124>
  407372:	8b 76 fc             	mov    esi,DWORD PTR [esi-0x4]
  407375:	85 f6                	test   esi,esi
  407377:	75 1b                	jne    407394 <___quorem_D2A+0x124>
  407379:	8b 54 24 30          	mov    edx,DWORD PTR [esp+0x30]
  40737d:	eb 07                	jmp    407386 <___quorem_D2A+0x116>
  40737f:	90                   	nop
  407380:	8b 18                	mov    ebx,DWORD PTR [eax]
  407382:	85 db                	test   ebx,ebx
  407384:	75 0a                	jne    407390 <___quorem_D2A+0x120>
  407386:	83 e8 04             	sub    eax,0x4
  407389:	83 ea 01             	sub    edx,0x1
  40738c:	39 c1                	cmp    ecx,eax
  40738e:	72 f0                	jb     407380 <___quorem_D2A+0x110>
  407390:	89 54 24 30          	mov    DWORD PTR [esp+0x30],edx
  407394:	8b 44 24 60          	mov    eax,DWORD PTR [esp+0x60]
  407398:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  40739c:	89 78 10             	mov    DWORD PTR [eax+0x10],edi
  40739f:	8b 44 24 64          	mov    eax,DWORD PTR [esp+0x64]
  4073a3:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4073a7:	8b 44 24 60          	mov    eax,DWORD PTR [esp+0x60]
  4073ab:	89 04 24             	mov    DWORD PTR [esp],eax
  4073ae:	e8 2d 08 00 00       	call   407be0 <___cmp_D2A>
  4073b3:	85 c0                	test   eax,eax
  4073b5:	0f 88 a4 00 00 00    	js     40745f <___quorem_D2A+0x1ef>
  4073bb:	31 f6                	xor    esi,esi
  4073bd:	31 ff                	xor    edi,edi
  4073bf:	8d 45 01             	lea    eax,[ebp+0x1]
  4073c2:	8b 6c 24 2c          	mov    ebp,DWORD PTR [esp+0x2c]
  4073c6:	89 74 24 10          	mov    DWORD PTR [esp+0x10],esi
  4073ca:	8b 74 24 38          	mov    esi,DWORD PTR [esp+0x38]
  4073ce:	89 7c 24 14          	mov    DWORD PTR [esp+0x14],edi
  4073d2:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
  4073d6:	89 44 24 34          	mov    DWORD PTR [esp+0x34],eax
  4073da:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4073e0:	83 c6 04             	add    esi,0x4
  4073e3:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  4073e6:	31 db                	xor    ebx,ebx
  4073e8:	8b 4e fc             	mov    ecx,DWORD PTR [esi-0x4]
  4073eb:	31 d2                	xor    edx,edx
  4073ed:	29 c8                	sub    eax,ecx
  4073ef:	19 da                	sbb    edx,ebx
  4073f1:	2b 44 24 10          	sub    eax,DWORD PTR [esp+0x10]
  4073f5:	1b 54 24 14          	sbb    edx,DWORD PTR [esp+0x14]
  4073f9:	83 c5 04             	add    ebp,0x4
  4073fc:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  407403:	00 
  407404:	89 d3                	mov    ebx,edx
  407406:	83 e3 01             	and    ebx,0x1
  407409:	39 f7                	cmp    edi,esi
  40740b:	89 5c 24 10          	mov    DWORD PTR [esp+0x10],ebx
  40740f:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  407412:	73 cc                	jae    4073e0 <___quorem_D2A+0x170>
  407414:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  407418:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  40741c:	8d 14 98             	lea    edx,[eax+ebx*4]
  40741f:	8b 3a                	mov    edi,DWORD PTR [edx]
  407421:	85 ff                	test   edi,edi
  407423:	75 3a                	jne    40745f <___quorem_D2A+0x1ef>
  407425:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  407429:	8d 42 fc             	lea    eax,[edx-0x4]
  40742c:	39 c1                	cmp    ecx,eax
  40742e:	73 24                	jae    407454 <___quorem_D2A+0x1e4>
  407430:	8b 72 fc             	mov    esi,DWORD PTR [edx-0x4]
  407433:	85 f6                	test   esi,esi
  407435:	75 1d                	jne    407454 <___quorem_D2A+0x1e4>
  407437:	89 da                	mov    edx,ebx
  407439:	eb 0b                	jmp    407446 <___quorem_D2A+0x1d6>
  40743b:	90                   	nop
  40743c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407440:	8b 18                	mov    ebx,DWORD PTR [eax]
  407442:	85 db                	test   ebx,ebx
  407444:	75 0a                	jne    407450 <___quorem_D2A+0x1e0>
  407446:	83 e8 04             	sub    eax,0x4
  407449:	83 ea 01             	sub    edx,0x1
  40744c:	39 c1                	cmp    ecx,eax
  40744e:	72 f0                	jb     407440 <___quorem_D2A+0x1d0>
  407450:	89 54 24 30          	mov    DWORD PTR [esp+0x30],edx
  407454:	8b 44 24 60          	mov    eax,DWORD PTR [esp+0x60]
  407458:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  40745c:	89 78 10             	mov    DWORD PTR [eax+0x10],edi
  40745f:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  407463:	83 c4 4c             	add    esp,0x4c
  407466:	5b                   	pop    ebx
  407467:	5e                   	pop    esi
  407468:	5f                   	pop    edi
  407469:	5d                   	pop    ebp
  40746a:	c3                   	ret    
  40746b:	90                   	nop
  40746c:	90                   	nop
  40746d:	90                   	nop
  40746e:	90                   	nop
  40746f:	90                   	nop

00407470 <_dtoa_lock>:
  407470:	55                   	push   ebp
  407471:	89 e5                	mov    ebp,esp
  407473:	53                   	push   ebx
  407474:	89 c3                	mov    ebx,eax
  407476:	83 ec 14             	sub    esp,0x14
  407479:	8b 15 c8 d9 40 00    	mov    edx,DWORD PTR ds:0x40d9c8
  40747f:	83 fa 02             	cmp    edx,0x2
  407482:	74 7f                	je     407503 <_dtoa_lock+0x93>
  407484:	85 d2                	test   edx,edx
  407486:	75 1d                	jne    4074a5 <_dtoa_lock+0x35>
  407488:	eb 2a                	jmp    4074b4 <_dtoa_lock+0x44>
  40748a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  407490:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  407497:	e8 14 0e 00 00       	call   4082b0 <_Sleep@4>
  40749c:	83 ec 04             	sub    esp,0x4
  40749f:	8b 15 c8 d9 40 00    	mov    edx,DWORD PTR ds:0x40d9c8
  4074a5:	83 fa 01             	cmp    edx,0x1
  4074a8:	74 e6                	je     407490 <_dtoa_lock+0x20>
  4074aa:	83 fa 02             	cmp    edx,0x2
  4074ad:	74 54                	je     407503 <_dtoa_lock+0x93>
  4074af:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  4074b2:	c9                   	leave  
  4074b3:	c3                   	ret    
  4074b4:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  4074bb:	00 
  4074bc:	c7 04 24 c8 d9 40 00 	mov    DWORD PTR [esp],0x40d9c8
  4074c3:	e8 f0 0d 00 00       	call   4082b8 <_InterlockedExchange@8>
  4074c8:	83 ec 08             	sub    esp,0x8
  4074cb:	85 c0                	test   eax,eax
  4074cd:	75 51                	jne    407520 <_dtoa_lock+0xb0>
  4074cf:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  4074d6:	e8 9d 0d 00 00       	call   408278 <_InitializeCriticalSection@4>
  4074db:	83 ec 04             	sub    esp,0x4
  4074de:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  4074e5:	e8 8e 0d 00 00       	call   408278 <_InitializeCriticalSection@4>
  4074ea:	83 ec 04             	sub    esp,0x4
  4074ed:	c7 04 24 40 75 40 00 	mov    DWORD PTR [esp],0x407540
  4074f4:	e8 e7 9d ff ff       	call   4012e0 <_atexit>
  4074f9:	c7 05 c8 d9 40 00 02 	mov    DWORD PTR ds:0x40d9c8,0x2
  407500:	00 00 00 
  407503:	8d 04 5b             	lea    eax,[ebx+ebx*2]
  407506:	8d 04 c5 e0 d9 40 00 	lea    eax,[eax*8+0x40d9e0]
  40750d:	89 04 24             	mov    DWORD PTR [esp],eax
  407510:	e8 3b 0d 00 00       	call   408250 <_EnterCriticalSection@4>
  407515:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  407518:	83 ec 04             	sub    esp,0x4
  40751b:	c9                   	leave  
  40751c:	c3                   	ret    
  40751d:	8d 76 00             	lea    esi,[esi+0x0]
  407520:	83 f8 02             	cmp    eax,0x2
  407523:	0f 85 76 ff ff ff    	jne    40749f <_dtoa_lock+0x2f>
  407529:	c7 05 c8 d9 40 00 02 	mov    DWORD PTR ds:0x40d9c8,0x2
  407530:	00 00 00 
  407533:	eb ce                	jmp    407503 <_dtoa_lock+0x93>
  407535:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407539:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00407540 <_dtoa_lock_cleanup>:
  407540:	55                   	push   ebp
  407541:	89 e5                	mov    ebp,esp
  407543:	83 ec 18             	sub    esp,0x18
  407546:	c7 44 24 04 03 00 00 	mov    DWORD PTR [esp+0x4],0x3
  40754d:	00 
  40754e:	c7 04 24 c8 d9 40 00 	mov    DWORD PTR [esp],0x40d9c8
  407555:	e8 5e 0d 00 00       	call   4082b8 <_InterlockedExchange@8>
  40755a:	83 ec 08             	sub    esp,0x8
  40755d:	83 f8 02             	cmp    eax,0x2
  407560:	74 02                	je     407564 <_dtoa_lock_cleanup+0x24>
  407562:	c9                   	leave  
  407563:	c3                   	ret    
  407564:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  40756b:	e8 00 0d 00 00       	call   408270 <_DeleteCriticalSection@4>
  407570:	83 ec 04             	sub    esp,0x4
  407573:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  40757a:	e8 f1 0c 00 00       	call   408270 <_DeleteCriticalSection@4>
  40757f:	83 ec 04             	sub    esp,0x4
  407582:	c9                   	leave  
  407583:	c3                   	ret    
  407584:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  40758a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00407590 <___Balloc_D2A>:
  407590:	55                   	push   ebp
  407591:	31 c0                	xor    eax,eax
  407593:	89 e5                	mov    ebp,esp
  407595:	57                   	push   edi
  407596:	56                   	push   esi
  407597:	53                   	push   ebx
  407598:	83 ec 1c             	sub    esp,0x1c
  40759b:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  40759e:	e8 cd fe ff ff       	call   407470 <_dtoa_lock>
  4075a3:	83 fe 09             	cmp    esi,0x9
  4075a6:	7f 2e                	jg     4075d6 <___Balloc_D2A+0x46>
  4075a8:	8b 1c b5 a0 d9 40 00 	mov    ebx,DWORD PTR [esi*4+0x40d9a0]
  4075af:	85 db                	test   ebx,ebx
  4075b1:	74 6e                	je     407621 <___Balloc_D2A+0x91>
  4075b3:	8b 03                	mov    eax,DWORD PTR [ebx]
  4075b5:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  4075bc:	89 04 b5 a0 d9 40 00 	mov    DWORD PTR [esi*4+0x40d9a0],eax
  4075c3:	75 44                	jne    407609 <___Balloc_D2A+0x79>
  4075c5:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  4075cc:	e8 97 0c 00 00       	call   408268 <_LeaveCriticalSection@4>
  4075d1:	83 ec 04             	sub    esp,0x4
  4075d4:	eb 33                	jmp    407609 <___Balloc_D2A+0x79>
  4075d6:	bf 01 00 00 00       	mov    edi,0x1
  4075db:	89 f1                	mov    ecx,esi
  4075dd:	d3 e7                	shl    edi,cl
  4075df:	8d 04 bd 1b 00 00 00 	lea    eax,[edi*4+0x1b]
  4075e6:	c1 e8 03             	shr    eax,0x3
  4075e9:	c1 e0 03             	shl    eax,0x3
  4075ec:	89 04 24             	mov    DWORD PTR [esp],eax
  4075ef:	e8 ac 0b 00 00       	call   4081a0 <_malloc>
  4075f4:	85 c0                	test   eax,eax
  4075f6:	89 c3                	mov    ebx,eax
  4075f8:	74 5f                	je     407659 <___Balloc_D2A+0xc9>
  4075fa:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  407601:	89 73 04             	mov    DWORD PTR [ebx+0x4],esi
  407604:	89 7b 08             	mov    DWORD PTR [ebx+0x8],edi
  407607:	74 bc                	je     4075c5 <___Balloc_D2A+0x35>
  407609:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
  407610:	89 d8                	mov    eax,ebx
  407612:	c7 43 0c 00 00 00 00 	mov    DWORD PTR [ebx+0xc],0x0
  407619:	8d 65 f4             	lea    esp,[ebp-0xc]
  40761c:	5b                   	pop    ebx
  40761d:	5e                   	pop    esi
  40761e:	5f                   	pop    edi
  40761f:	5d                   	pop    ebp
  407620:	c3                   	ret    
  407621:	8b 1d 20 90 40 00    	mov    ebx,DWORD PTR ds:0x409020
  407627:	bf 01 00 00 00       	mov    edi,0x1
  40762c:	89 f1                	mov    ecx,esi
  40762e:	d3 e7                	shl    edi,cl
  407630:	8d 04 bd 1b 00 00 00 	lea    eax,[edi*4+0x1b]
  407637:	c1 e8 03             	shr    eax,0x3
  40763a:	89 da                	mov    edx,ebx
  40763c:	81 ea a0 d0 40 00    	sub    edx,0x40d0a0
  407642:	c1 fa 03             	sar    edx,0x3
  407645:	01 c2                	add    edx,eax
  407647:	81 fa 20 01 00 00    	cmp    edx,0x120
  40764d:	77 9a                	ja     4075e9 <___Balloc_D2A+0x59>
  40764f:	8d 04 c3             	lea    eax,[ebx+eax*8]
  407652:	a3 20 90 40 00       	mov    ds:0x409020,eax
  407657:	eb a1                	jmp    4075fa <___Balloc_D2A+0x6a>
  407659:	31 c0                	xor    eax,eax
  40765b:	eb bc                	jmp    407619 <___Balloc_D2A+0x89>
  40765d:	8d 76 00             	lea    esi,[esi+0x0]

00407660 <___Bfree_D2A>:
  407660:	55                   	push   ebp
  407661:	89 e5                	mov    ebp,esp
  407663:	53                   	push   ebx
  407664:	83 ec 14             	sub    esp,0x14
  407667:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  40766a:	85 db                	test   ebx,ebx
  40766c:	74 29                	je     407697 <___Bfree_D2A+0x37>
  40766e:	83 7b 04 09          	cmp    DWORD PTR [ebx+0x4],0x9
  407672:	7f 2c                	jg     4076a0 <___Bfree_D2A+0x40>
  407674:	31 c0                	xor    eax,eax
  407676:	e8 f5 fd ff ff       	call   407470 <_dtoa_lock>
  40767b:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  40767e:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  407685:	8b 14 85 a0 d9 40 00 	mov    edx,DWORD PTR [eax*4+0x40d9a0]
  40768c:	89 1c 85 a0 d9 40 00 	mov    DWORD PTR [eax*4+0x40d9a0],ebx
  407693:	89 13                	mov    DWORD PTR [ebx],edx
  407695:	74 19                	je     4076b0 <___Bfree_D2A+0x50>
  407697:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  40769a:	c9                   	leave  
  40769b:	c3                   	ret    
  40769c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4076a0:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  4076a3:	c9                   	leave  
  4076a4:	e9 ef 0a 00 00       	jmp    408198 <_free>
  4076a9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4076b0:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  4076b7:	e8 ac 0b 00 00       	call   408268 <_LeaveCriticalSection@4>
  4076bc:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  4076bf:	83 ec 04             	sub    esp,0x4
  4076c2:	c9                   	leave  
  4076c3:	c3                   	ret    
  4076c4:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4076ca:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

004076d0 <___multadd_D2A>:
  4076d0:	55                   	push   ebp
  4076d1:	31 c9                	xor    ecx,ecx
  4076d3:	57                   	push   edi
  4076d4:	56                   	push   esi
  4076d5:	53                   	push   ebx
  4076d6:	83 ec 2c             	sub    esp,0x2c
  4076d9:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  4076dd:	8b 7c 24 48          	mov    edi,DWORD PTR [esp+0x48]
  4076e1:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  4076e4:	89 fd                	mov    ebp,edi
  4076e6:	c1 fd 1f             	sar    ebp,0x1f
  4076e9:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  4076ed:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  4076f1:	8d 58 14             	lea    ebx,[eax+0x14]
  4076f4:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  4076f8:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4076fc:	c1 f8 1f             	sar    eax,0x1f
  4076ff:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  407703:	8b 04 8b             	mov    eax,DWORD PTR [ebx+ecx*4]
  407706:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
  40770a:	0f af f0             	imul   esi,eax
  40770d:	f7 64 24 10          	mul    DWORD PTR [esp+0x10]
  407711:	01 f2                	add    edx,esi
  407713:	01 f8                	add    eax,edi
  407715:	11 ea                	adc    edx,ebp
  407717:	89 d5                	mov    ebp,edx
  407719:	89 ef                	mov    edi,ebp
  40771b:	31 ed                	xor    ebp,ebp
  40771d:	89 04 8b             	mov    DWORD PTR [ebx+ecx*4],eax
  407720:	83 c1 01             	add    ecx,0x1
  407723:	39 4c 24 1c          	cmp    DWORD PTR [esp+0x1c],ecx
  407727:	7f da                	jg     407703 <___multadd_D2A+0x33>
  407729:	89 ea                	mov    edx,ebp
  40772b:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  40772f:	09 fa                	or     edx,edi
  407731:	74 1d                	je     407750 <___multadd_D2A+0x80>
  407733:	8b 54 24 1c          	mov    edx,DWORD PTR [esp+0x1c]
  407737:	3b 50 08             	cmp    edx,DWORD PTR [eax+0x8]
  40773a:	7d 1c                	jge    407758 <___multadd_D2A+0x88>
  40773c:	8b 54 24 40          	mov    edx,DWORD PTR [esp+0x40]
  407740:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  407744:	89 7c 82 14          	mov    DWORD PTR [edx+eax*4+0x14],edi
  407748:	83 c0 01             	add    eax,0x1
  40774b:	89 42 10             	mov    DWORD PTR [edx+0x10],eax
  40774e:	89 d0                	mov    eax,edx
  407750:	83 c4 2c             	add    esp,0x2c
  407753:	5b                   	pop    ebx
  407754:	5e                   	pop    esi
  407755:	5f                   	pop    edi
  407756:	5d                   	pop    ebp
  407757:	c3                   	ret    
  407758:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40775b:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40775f:	83 c0 01             	add    eax,0x1
  407762:	89 04 24             	mov    DWORD PTR [esp],eax
  407765:	e8 26 fe ff ff       	call   407590 <___Balloc_D2A>
  40776a:	85 c0                	test   eax,eax
  40776c:	89 c3                	mov    ebx,eax
  40776e:	74 3a                	je     4077aa <___multadd_D2A+0xda>
  407770:	8d 48 0c             	lea    ecx,[eax+0xc]
  407773:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407777:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  40777a:	89 0c 24             	mov    DWORD PTR [esp],ecx
  40777d:	8d 14 85 08 00 00 00 	lea    edx,[eax*4+0x8]
  407784:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407788:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  40778c:	83 c0 0c             	add    eax,0xc
  40778f:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  407793:	e8 f0 09 00 00       	call   408188 <_memcpy>
  407798:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  40779c:	89 04 24             	mov    DWORD PTR [esp],eax
  40779f:	e8 bc fe ff ff       	call   407660 <___Bfree_D2A>
  4077a4:	89 5c 24 40          	mov    DWORD PTR [esp+0x40],ebx
  4077a8:	eb 92                	jmp    40773c <___multadd_D2A+0x6c>
  4077aa:	31 c0                	xor    eax,eax
  4077ac:	eb a2                	jmp    407750 <___multadd_D2A+0x80>
  4077ae:	66 90                	xchg   ax,ax

004077b0 <___i2b_D2A>:
  4077b0:	83 ec 1c             	sub    esp,0x1c
  4077b3:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  4077ba:	e8 d1 fd ff ff       	call   407590 <___Balloc_D2A>
  4077bf:	85 c0                	test   eax,eax
  4077c1:	74 0e                	je     4077d1 <___i2b_D2A+0x21>
  4077c3:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  4077c7:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  4077ce:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
  4077d1:	83 c4 1c             	add    esp,0x1c
  4077d4:	c3                   	ret    
  4077d5:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4077d9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004077e0 <___mult_D2A>:
  4077e0:	55                   	push   ebp
  4077e1:	57                   	push   edi
  4077e2:	56                   	push   esi
  4077e3:	53                   	push   ebx
  4077e4:	83 ec 3c             	sub    esp,0x3c
  4077e7:	8b 7c 24 50          	mov    edi,DWORD PTR [esp+0x50]
  4077eb:	8b 6c 24 54          	mov    ebp,DWORD PTR [esp+0x54]
  4077ef:	8b 77 10             	mov    esi,DWORD PTR [edi+0x10]
  4077f2:	8b 5d 10             	mov    ebx,DWORD PTR [ebp+0x10]
  4077f5:	39 de                	cmp    esi,ebx
  4077f7:	7d 0c                	jge    407805 <___mult_D2A+0x25>
  4077f9:	89 f0                	mov    eax,esi
  4077fb:	89 de                	mov    esi,ebx
  4077fd:	89 c3                	mov    ebx,eax
  4077ff:	89 f8                	mov    eax,edi
  407801:	89 ef                	mov    edi,ebp
  407803:	89 c5                	mov    ebp,eax
  407805:	8d 04 1e             	lea    eax,[esi+ebx*1]
  407808:	3b 47 08             	cmp    eax,DWORD PTR [edi+0x8]
  40780b:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  40780f:	0f 9f c0             	setg   al
  407812:	0f b6 c0             	movzx  eax,al
  407815:	03 47 04             	add    eax,DWORD PTR [edi+0x4]
  407818:	89 04 24             	mov    DWORD PTR [esp],eax
  40781b:	e8 70 fd ff ff       	call   407590 <___Balloc_D2A>
  407820:	85 c0                	test   eax,eax
  407822:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  407826:	0f 84 08 01 00 00    	je     407934 <___mult_D2A+0x154>
  40782c:	8b 4c 24 20          	mov    ecx,DWORD PTR [esp+0x20]
  407830:	8d 40 14             	lea    eax,[eax+0x14]
  407833:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  407837:	8d 0c 88             	lea    ecx,[eax+ecx*4]
  40783a:	89 ca                	mov    edx,ecx
  40783c:	39 d0                	cmp    eax,edx
  40783e:	89 4c 24 28          	mov    DWORD PTR [esp+0x28],ecx
  407842:	73 11                	jae    407855 <___mult_D2A+0x75>
  407844:	8b 54 24 28          	mov    edx,DWORD PTR [esp+0x28]
  407848:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  40784e:	83 c0 04             	add    eax,0x4
  407851:	39 c2                	cmp    edx,eax
  407853:	77 f3                	ja     407848 <___mult_D2A+0x68>
  407855:	8d 47 14             	lea    eax,[edi+0x14]
  407858:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  40785c:	8d 04 b0             	lea    eax,[eax+esi*4]
  40785f:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  407863:	8d 45 14             	lea    eax,[ebp+0x14]
  407866:	8d 1c 98             	lea    ebx,[eax+ebx*4]
  407869:	39 d8                	cmp    eax,ebx
  40786b:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  40786f:	89 5c 24 1c          	mov    DWORD PTR [esp+0x1c],ebx
  407873:	73 74                	jae    4078e9 <___mult_D2A+0x109>
  407875:	83 44 24 14 04       	add    DWORD PTR [esp+0x14],0x4
  40787a:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
  40787e:	8b 68 fc             	mov    ebp,DWORD PTR [eax-0x4]
  407881:	85 ed                	test   ebp,ebp
  407883:	74 55                	je     4078da <___mult_D2A+0xfa>
  407885:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  407889:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  40788d:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  407894:	00 
  407895:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  40789c:	00 
  40789d:	eb 03                	jmp    4078a2 <___mult_D2A+0xc2>
  40789f:	90                   	nop
  4078a0:	89 c7                	mov    edi,eax
  4078a2:	83 c6 04             	add    esi,0x4
  4078a5:	8b 0f                	mov    ecx,DWORD PTR [edi]
  4078a7:	89 e8                	mov    eax,ebp
  4078a9:	f7 66 fc             	mul    DWORD PTR [esi-0x4]
  4078ac:	31 db                	xor    ebx,ebx
  4078ae:	01 c1                	add    ecx,eax
  4078b0:	11 d3                	adc    ebx,edx
  4078b2:	03 4c 24 08          	add    ecx,DWORD PTR [esp+0x8]
  4078b6:	13 5c 24 0c          	adc    ebx,DWORD PTR [esp+0xc]
  4078ba:	89 0f                	mov    DWORD PTR [edi],ecx
  4078bc:	89 da                	mov    edx,ebx
  4078be:	89 d0                	mov    eax,edx
  4078c0:	31 d2                	xor    edx,edx
  4078c2:	39 74 24 10          	cmp    DWORD PTR [esp+0x10],esi
  4078c6:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4078ca:	8d 47 04             	lea    eax,[edi+0x4]
  4078cd:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  4078d1:	77 cd                	ja     4078a0 <___mult_D2A+0xc0>
  4078d3:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  4078d7:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
  4078da:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
  4078de:	83 44 24 18 04       	add    DWORD PTR [esp+0x18],0x4
  4078e3:	39 44 24 1c          	cmp    DWORD PTR [esp+0x1c],eax
  4078e7:	77 8c                	ja     407875 <___mult_D2A+0x95>
  4078e9:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
  4078ed:	85 ff                	test   edi,edi
  4078ef:	7e 30                	jle    407921 <___mult_D2A+0x141>
  4078f1:	8b 5c 24 28          	mov    ebx,DWORD PTR [esp+0x28]
  4078f5:	8b 73 fc             	mov    esi,DWORD PTR [ebx-0x4]
  4078f8:	85 f6                	test   esi,esi
  4078fa:	75 25                	jne    407921 <___mult_D2A+0x141>
  4078fc:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  407900:	89 d0                	mov    eax,edx
  407902:	c1 e0 02             	shl    eax,0x2
  407905:	29 c3                	sub    ebx,eax
  407907:	89 d8                	mov    eax,ebx
  407909:	eb 0d                	jmp    407918 <___mult_D2A+0x138>
  40790b:	90                   	nop
  40790c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407910:	8b 4c 90 fc          	mov    ecx,DWORD PTR [eax+edx*4-0x4]
  407914:	85 c9                	test   ecx,ecx
  407916:	75 05                	jne    40791d <___mult_D2A+0x13d>
  407918:	83 ea 01             	sub    edx,0x1
  40791b:	75 f3                	jne    407910 <___mult_D2A+0x130>
  40791d:	89 54 24 20          	mov    DWORD PTR [esp+0x20],edx
  407921:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  407925:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
  407929:	89 58 10             	mov    DWORD PTR [eax+0x10],ebx
  40792c:	83 c4 3c             	add    esp,0x3c
  40792f:	5b                   	pop    ebx
  407930:	5e                   	pop    esi
  407931:	5f                   	pop    edi
  407932:	5d                   	pop    ebp
  407933:	c3                   	ret    
  407934:	31 c0                	xor    eax,eax
  407936:	eb f4                	jmp    40792c <___mult_D2A+0x14c>
  407938:	90                   	nop
  407939:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00407940 <___pow5mult_D2A>:
  407940:	55                   	push   ebp
  407941:	89 e5                	mov    ebp,esp
  407943:	57                   	push   edi
  407944:	56                   	push   esi
  407945:	53                   	push   ebx
  407946:	83 ec 1c             	sub    esp,0x1c
  407949:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
  40794c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  40794f:	89 d8                	mov    eax,ebx
  407951:	83 e0 03             	and    eax,0x3
  407954:	0f 85 9e 00 00 00    	jne    4079f8 <___pow5mult_D2A+0xb8>
  40795a:	c1 fb 02             	sar    ebx,0x2
  40795d:	89 d0                	mov    eax,edx
  40795f:	85 db                	test   ebx,ebx
  407961:	74 4e                	je     4079b1 <___pow5mult_D2A+0x71>
  407963:	8b 3d 80 d0 40 00    	mov    edi,DWORD PTR ds:0x40d080
  407969:	85 ff                	test   edi,edi
  40796b:	0f 84 d5 00 00 00    	je     407a46 <___pow5mult_D2A+0x106>
  407971:	f6 c3 01             	test   bl,0x1
  407974:	75 13                	jne    407989 <___pow5mult_D2A+0x49>
  407976:	d1 fb                	sar    ebx,1
  407978:	74 35                	je     4079af <___pow5mult_D2A+0x6f>
  40797a:	8b 37                	mov    esi,DWORD PTR [edi]
  40797c:	85 f6                	test   esi,esi
  40797e:	66 90                	xchg   ax,ax
  407980:	74 3e                	je     4079c0 <___pow5mult_D2A+0x80>
  407982:	89 f7                	mov    edi,esi
  407984:	f6 c3 01             	test   bl,0x1
  407987:	74 ed                	je     407976 <___pow5mult_D2A+0x36>
  407989:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  40798d:	89 14 24             	mov    DWORD PTR [esp],edx
  407990:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  407993:	e8 48 fe ff ff       	call   4077e0 <___mult_D2A>
  407998:	85 c0                	test   eax,eax
  40799a:	89 c6                	mov    esi,eax
  40799c:	74 7f                	je     407a1d <___pow5mult_D2A+0xdd>
  40799e:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  4079a1:	89 14 24             	mov    DWORD PTR [esp],edx
  4079a4:	e8 b7 fc ff ff       	call   407660 <___Bfree_D2A>
  4079a9:	d1 fb                	sar    ebx,1
  4079ab:	89 f2                	mov    edx,esi
  4079ad:	75 cb                	jne    40797a <___pow5mult_D2A+0x3a>
  4079af:	89 d0                	mov    eax,edx
  4079b1:	8d 65 f4             	lea    esp,[ebp-0xc]
  4079b4:	5b                   	pop    ebx
  4079b5:	5e                   	pop    esi
  4079b6:	5f                   	pop    edi
  4079b7:	5d                   	pop    ebp
  4079b8:	c3                   	ret    
  4079b9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4079c0:	b8 01 00 00 00       	mov    eax,0x1
  4079c5:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  4079c8:	e8 a3 fa ff ff       	call   407470 <_dtoa_lock>
  4079cd:	8b 37                	mov    esi,DWORD PTR [edi]
  4079cf:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  4079d2:	85 f6                	test   esi,esi
  4079d4:	74 51                	je     407a27 <___pow5mult_D2A+0xe7>
  4079d6:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  4079dd:	75 a3                	jne    407982 <___pow5mult_D2A+0x42>
  4079df:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  4079e6:	89 f7                	mov    edi,esi
  4079e8:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  4079eb:	e8 78 08 00 00       	call   408268 <_LeaveCriticalSection@4>
  4079f0:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  4079f3:	83 ec 04             	sub    esp,0x4
  4079f6:	eb 8c                	jmp    407984 <___pow5mult_D2A+0x44>
  4079f8:	8b 04 85 5c a3 40 00 	mov    eax,DWORD PTR [eax*4+0x40a35c]
  4079ff:	89 14 24             	mov    DWORD PTR [esp],edx
  407a02:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  407a09:	00 
  407a0a:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  407a0e:	e8 bd fc ff ff       	call   4076d0 <___multadd_D2A>
  407a13:	85 c0                	test   eax,eax
  407a15:	89 c2                	mov    edx,eax
  407a17:	0f 85 3d ff ff ff    	jne    40795a <___pow5mult_D2A+0x1a>
  407a1d:	31 c0                	xor    eax,eax
  407a1f:	8d 65 f4             	lea    esp,[ebp-0xc]
  407a22:	5b                   	pop    ebx
  407a23:	5e                   	pop    esi
  407a24:	5f                   	pop    edi
  407a25:	5d                   	pop    ebp
  407a26:	c3                   	ret    
  407a27:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  407a2b:	89 3c 24             	mov    DWORD PTR [esp],edi
  407a2e:	e8 ad fd ff ff       	call   4077e0 <___mult_D2A>
  407a33:	85 c0                	test   eax,eax
  407a35:	89 c6                	mov    esi,eax
  407a37:	89 07                	mov    DWORD PTR [edi],eax
  407a39:	74 e2                	je     407a1d <___pow5mult_D2A+0xdd>
  407a3b:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  407a41:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407a44:	eb 90                	jmp    4079d6 <___pow5mult_D2A+0x96>
  407a46:	b8 01 00 00 00       	mov    eax,0x1
  407a4b:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  407a4e:	e8 1d fa ff ff       	call   407470 <_dtoa_lock>
  407a53:	8b 3d 80 d0 40 00    	mov    edi,DWORD PTR ds:0x40d080
  407a59:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407a5c:	85 ff                	test   edi,edi
  407a5e:	74 27                	je     407a87 <___pow5mult_D2A+0x147>
  407a60:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  407a67:	0f 85 04 ff ff ff    	jne    407971 <___pow5mult_D2A+0x31>
  407a6d:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  407a74:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  407a77:	e8 ec 07 00 00       	call   408268 <_LeaveCriticalSection@4>
  407a7c:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407a7f:	83 ec 04             	sub    esp,0x4
  407a82:	e9 ea fe ff ff       	jmp    407971 <___pow5mult_D2A+0x31>
  407a87:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  407a8e:	e8 fd fa ff ff       	call   407590 <___Balloc_D2A>
  407a93:	85 c0                	test   eax,eax
  407a95:	89 c7                	mov    edi,eax
  407a97:	74 1e                	je     407ab7 <___pow5mult_D2A+0x177>
  407a99:	c7 40 14 71 02 00 00 	mov    DWORD PTR [eax+0x14],0x271
  407aa0:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407aa3:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  407aaa:	a3 80 d0 40 00       	mov    ds:0x40d080,eax
  407aaf:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  407ab5:	eb a9                	jmp    407a60 <___pow5mult_D2A+0x120>
  407ab7:	c7 05 80 d0 40 00 00 	mov    DWORD PTR ds:0x40d080,0x0
  407abe:	00 00 00 
  407ac1:	31 c0                	xor    eax,eax
  407ac3:	e9 57 ff ff ff       	jmp    407a1f <___pow5mult_D2A+0xdf>
  407ac8:	90                   	nop
  407ac9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00407ad0 <___lshift_D2A>:
  407ad0:	55                   	push   ebp
  407ad1:	57                   	push   edi
  407ad2:	56                   	push   esi
  407ad3:	53                   	push   ebx
  407ad4:	83 ec 2c             	sub    esp,0x2c
  407ad7:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407adb:	8b 74 24 44          	mov    esi,DWORD PTR [esp+0x44]
  407adf:	89 c7                	mov    edi,eax
  407ae1:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
  407ae4:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  407ae7:	89 f3                	mov    ebx,esi
  407ae9:	c1 fb 05             	sar    ebx,0x5
  407aec:	01 d8                	add    eax,ebx
  407aee:	8d 68 01             	lea    ebp,[eax+0x1]
  407af1:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  407af5:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  407af8:	39 c5                	cmp    ebp,eax
  407afa:	7e 0d                	jle    407b09 <___lshift_D2A+0x39>
  407afc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407b00:	01 c0                	add    eax,eax
  407b02:	83 c2 01             	add    edx,0x1
  407b05:	39 c5                	cmp    ebp,eax
  407b07:	7f f7                	jg     407b00 <___lshift_D2A+0x30>
  407b09:	89 14 24             	mov    DWORD PTR [esp],edx
  407b0c:	e8 7f fa ff ff       	call   407590 <___Balloc_D2A>
  407b11:	85 c0                	test   eax,eax
  407b13:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  407b17:	0f 84 bc 00 00 00    	je     407bd9 <___lshift_D2A+0x109>
  407b1d:	85 db                	test   ebx,ebx
  407b1f:	8d 50 14             	lea    edx,[eax+0x14]
  407b22:	7e 13                	jle    407b37 <___lshift_D2A+0x67>
  407b24:	31 c0                	xor    eax,eax
  407b26:	c7 04 82 00 00 00 00 	mov    DWORD PTR [edx+eax*4],0x0
  407b2d:	83 c0 01             	add    eax,0x1
  407b30:	39 d8                	cmp    eax,ebx
  407b32:	75 f2                	jne    407b26 <___lshift_D2A+0x56>
  407b34:	8d 14 82             	lea    edx,[edx+eax*4]
  407b37:	8b 7c 24 40          	mov    edi,DWORD PTR [esp+0x40]
  407b3b:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407b3f:	8b 4f 10             	mov    ecx,DWORD PTR [edi+0x10]
  407b42:	83 c0 14             	add    eax,0x14
  407b45:	83 e6 1f             	and    esi,0x1f
  407b48:	89 74 24 0c          	mov    DWORD PTR [esp+0xc],esi
  407b4c:	8d 3c 88             	lea    edi,[eax+ecx*4]
  407b4f:	89 f9                	mov    ecx,edi
  407b51:	74 72                	je     407bc5 <___lshift_D2A+0xf5>
  407b53:	c7 44 24 10 20 00 00 	mov    DWORD PTR [esp+0x10],0x20
  407b5a:	00 
  407b5b:	89 6c 24 1c          	mov    DWORD PTR [esp+0x1c],ebp
  407b5f:	89 cd                	mov    ebp,ecx
  407b61:	29 74 24 10          	sub    DWORD PTR [esp+0x10],esi
  407b65:	31 f6                	xor    esi,esi
  407b67:	eb 09                	jmp    407b72 <___lshift_D2A+0xa2>
  407b69:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  407b70:	89 fa                	mov    edx,edi
  407b72:	8b 18                	mov    ebx,DWORD PTR [eax]
  407b74:	83 c0 04             	add    eax,0x4
  407b77:	0f b6 4c 24 0c       	movzx  ecx,BYTE PTR [esp+0xc]
  407b7c:	8d 7a 04             	lea    edi,[edx+0x4]
  407b7f:	d3 e3                	shl    ebx,cl
  407b81:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [esp+0x10]
  407b86:	09 f3                	or     ebx,esi
  407b88:	89 1a                	mov    DWORD PTR [edx],ebx
  407b8a:	8b 70 fc             	mov    esi,DWORD PTR [eax-0x4]
  407b8d:	d3 ee                	shr    esi,cl
  407b8f:	39 c5                	cmp    ebp,eax
  407b91:	77 dd                	ja     407b70 <___lshift_D2A+0xa0>
  407b93:	85 f6                	test   esi,esi
  407b95:	8b 6c 24 1c          	mov    ebp,DWORD PTR [esp+0x1c]
  407b99:	89 72 04             	mov    DWORD PTR [edx+0x4],esi
  407b9c:	74 07                	je     407ba5 <___lshift_D2A+0xd5>
  407b9e:	8b 6c 24 18          	mov    ebp,DWORD PTR [esp+0x18]
  407ba2:	83 c5 02             	add    ebp,0x2
  407ba5:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
  407ba9:	8d 45 ff             	lea    eax,[ebp-0x1]
  407bac:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
  407baf:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407bb3:	89 04 24             	mov    DWORD PTR [esp],eax
  407bb6:	e8 a5 fa ff ff       	call   407660 <___Bfree_D2A>
  407bbb:	89 f8                	mov    eax,edi
  407bbd:	83 c4 2c             	add    esp,0x2c
  407bc0:	5b                   	pop    ebx
  407bc1:	5e                   	pop    esi
  407bc2:	5f                   	pop    edi
  407bc3:	5d                   	pop    ebp
  407bc4:	c3                   	ret    
  407bc5:	89 fb                	mov    ebx,edi
  407bc7:	83 c0 04             	add    eax,0x4
  407bca:	8b 48 fc             	mov    ecx,DWORD PTR [eax-0x4]
  407bcd:	83 c2 04             	add    edx,0x4
  407bd0:	39 c3                	cmp    ebx,eax
  407bd2:	89 4a fc             	mov    DWORD PTR [edx-0x4],ecx
  407bd5:	77 f0                	ja     407bc7 <___lshift_D2A+0xf7>
  407bd7:	eb cc                	jmp    407ba5 <___lshift_D2A+0xd5>
  407bd9:	31 c0                	xor    eax,eax
  407bdb:	eb e0                	jmp    407bbd <___lshift_D2A+0xed>
  407bdd:	8d 76 00             	lea    esi,[esi+0x0]

00407be0 <___cmp_D2A>:
  407be0:	53                   	push   ebx
  407be1:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  407be5:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  407be9:	8b 41 10             	mov    eax,DWORD PTR [ecx+0x10]
  407bec:	8b 5a 10             	mov    ebx,DWORD PTR [edx+0x10]
  407bef:	29 d8                	sub    eax,ebx
  407bf1:	85 c0                	test   eax,eax
  407bf3:	75 24                	jne    407c19 <___cmp_D2A+0x39>
  407bf5:	c1 e3 02             	shl    ebx,0x2
  407bf8:	83 c1 14             	add    ecx,0x14
  407bfb:	8d 04 19             	lea    eax,[ecx+ebx*1]
  407bfe:	8d 54 1a 14          	lea    edx,[edx+ebx*1+0x14]
  407c02:	eb 04                	jmp    407c08 <___cmp_D2A+0x28>
  407c04:	39 c1                	cmp    ecx,eax
  407c06:	73 18                	jae    407c20 <___cmp_D2A+0x40>
  407c08:	83 ea 04             	sub    edx,0x4
  407c0b:	83 e8 04             	sub    eax,0x4
  407c0e:	8b 1a                	mov    ebx,DWORD PTR [edx]
  407c10:	39 18                	cmp    DWORD PTR [eax],ebx
  407c12:	74 f0                	je     407c04 <___cmp_D2A+0x24>
  407c14:	19 c0                	sbb    eax,eax
  407c16:	83 c8 01             	or     eax,0x1
  407c19:	5b                   	pop    ebx
  407c1a:	c3                   	ret    
  407c1b:	90                   	nop
  407c1c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407c20:	31 c0                	xor    eax,eax
  407c22:	5b                   	pop    ebx
  407c23:	c3                   	ret    
  407c24:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  407c2a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00407c30 <___diff_D2A>:
  407c30:	55                   	push   ebp
  407c31:	57                   	push   edi
  407c32:	56                   	push   esi
  407c33:	53                   	push   ebx
  407c34:	83 ec 2c             	sub    esp,0x2c
  407c37:	8b 74 24 40          	mov    esi,DWORD PTR [esp+0x40]
  407c3b:	8b 5c 24 44          	mov    ebx,DWORD PTR [esp+0x44]
  407c3f:	89 34 24             	mov    DWORD PTR [esp],esi
  407c42:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  407c46:	e8 95 ff ff ff       	call   407be0 <___cmp_D2A>
  407c4b:	85 c0                	test   eax,eax
  407c4d:	0f 84 1f 01 00 00    	je     407d72 <___diff_D2A+0x142>
  407c53:	0f 88 3f 01 00 00    	js     407d98 <___diff_D2A+0x168>
  407c59:	31 ff                	xor    edi,edi
  407c5b:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  407c5e:	89 04 24             	mov    DWORD PTR [esp],eax
  407c61:	e8 2a f9 ff ff       	call   407590 <___Balloc_D2A>
  407c66:	85 c0                	test   eax,eax
  407c68:	89 c2                	mov    edx,eax
  407c6a:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  407c6e:	0f 84 34 01 00 00    	je     407da8 <___diff_D2A+0x178>
  407c74:	89 78 0c             	mov    DWORD PTR [eax+0xc],edi
  407c77:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
  407c7a:	83 c6 14             	add    esi,0x14
  407c7d:	8d 6b 14             	lea    ebp,[ebx+0x14]
  407c80:	8d 7a 14             	lea    edi,[edx+0x14]
  407c83:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  407c8a:	00 
  407c8b:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  407c8f:	8d 04 86             	lea    eax,[esi+eax*4]
  407c92:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  407c96:	8b 43 10             	mov    eax,DWORD PTR [ebx+0x10]
  407c99:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  407ca0:	00 
  407ca1:	8d 44 85 00          	lea    eax,[ebp+eax*4+0x0]
  407ca5:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  407ca9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  407cb0:	83 c5 04             	add    ebp,0x4
  407cb3:	83 c6 04             	add    esi,0x4
  407cb6:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  407cb9:	8b 46 fc             	mov    eax,DWORD PTR [esi-0x4]
  407cbc:	31 d2                	xor    edx,edx
  407cbe:	31 db                	xor    ebx,ebx
  407cc0:	29 c8                	sub    eax,ecx
  407cc2:	19 da                	sbb    edx,ebx
  407cc4:	2b 44 24 08          	sub    eax,DWORD PTR [esp+0x8]
  407cc8:	1b 54 24 0c          	sbb    edx,DWORD PTR [esp+0xc]
  407ccc:	83 c7 04             	add    edi,0x4
  407ccf:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  407cd6:	00 
  407cd7:	89 d1                	mov    ecx,edx
  407cd9:	83 e1 01             	and    ecx,0x1
  407cdc:	39 6c 24 14          	cmp    DWORD PTR [esp+0x14],ebp
  407ce0:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  407ce4:	89 47 fc             	mov    DWORD PTR [edi-0x4],eax
  407ce7:	77 c7                	ja     407cb0 <___diff_D2A+0x80>
  407ce9:	39 74 24 10          	cmp    DWORD PTR [esp+0x10],esi
  407ced:	76 4b                	jbe    407d3a <___diff_D2A+0x10a>
  407cef:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
  407cf3:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  407cf7:	89 7c 24 14          	mov    DWORD PTR [esp+0x14],edi
  407cfb:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  407cff:	90                   	nop
  407d00:	83 c6 04             	add    esi,0x4
  407d03:	8b 46 fc             	mov    eax,DWORD PTR [esi-0x4]
  407d06:	31 d2                	xor    edx,edx
  407d08:	29 c8                	sub    eax,ecx
  407d0a:	19 da                	sbb    edx,ebx
  407d0c:	83 c7 04             	add    edi,0x4
  407d0f:	89 d5                	mov    ebp,edx
  407d11:	31 db                	xor    ebx,ebx
  407d13:	83 e5 01             	and    ebp,0x1
  407d16:	39 74 24 10          	cmp    DWORD PTR [esp+0x10],esi
  407d1a:	89 e9                	mov    ecx,ebp
  407d1c:	89 47 fc             	mov    DWORD PTR [edi-0x4],eax
  407d1f:	77 df                	ja     407d00 <___diff_D2A+0xd0>
  407d21:	8b 6c 24 08          	mov    ebp,DWORD PTR [esp+0x8]
  407d25:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
  407d29:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
  407d2d:	f7 d5                	not    ebp
  407d2f:	8d 54 3d 00          	lea    edx,[ebp+edi*1+0x0]
  407d33:	c1 ea 02             	shr    edx,0x2
  407d36:	8d 7c 93 04          	lea    edi,[ebx+edx*4+0x4]
  407d3a:	85 c0                	test   eax,eax
  407d3c:	75 21                	jne    407d5f <___diff_D2A+0x12f>
  407d3e:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  407d42:	89 d0                	mov    eax,edx
  407d44:	c1 e0 02             	shl    eax,0x2
  407d47:	29 c7                	sub    edi,eax
  407d49:	89 d0                	mov    eax,edx
  407d4b:	90                   	nop
  407d4c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407d50:	83 e8 01             	sub    eax,0x1
  407d53:	8b 6c 87 fc          	mov    ebp,DWORD PTR [edi+eax*4-0x4]
  407d57:	85 ed                	test   ebp,ebp
  407d59:	74 f5                	je     407d50 <___diff_D2A+0x120>
  407d5b:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  407d5f:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  407d63:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  407d67:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
  407d6a:	83 c4 2c             	add    esp,0x2c
  407d6d:	5b                   	pop    ebx
  407d6e:	5e                   	pop    esi
  407d6f:	5f                   	pop    edi
  407d70:	5d                   	pop    ebp
  407d71:	c3                   	ret    
  407d72:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  407d79:	e8 12 f8 ff ff       	call   407590 <___Balloc_D2A>
  407d7e:	85 c0                	test   eax,eax
  407d80:	74 26                	je     407da8 <___diff_D2A+0x178>
  407d82:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  407d89:	c7 40 14 00 00 00 00 	mov    DWORD PTR [eax+0x14],0x0
  407d90:	83 c4 2c             	add    esp,0x2c
  407d93:	5b                   	pop    ebx
  407d94:	5e                   	pop    esi
  407d95:	5f                   	pop    edi
  407d96:	5d                   	pop    ebp
  407d97:	c3                   	ret    
  407d98:	89 f0                	mov    eax,esi
  407d9a:	bf 01 00 00 00       	mov    edi,0x1
  407d9f:	89 de                	mov    esi,ebx
  407da1:	89 c3                	mov    ebx,eax
  407da3:	e9 b3 fe ff ff       	jmp    407c5b <___diff_D2A+0x2b>
  407da8:	31 c0                	xor    eax,eax
  407daa:	eb be                	jmp    407d6a <___diff_D2A+0x13a>
  407dac:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00407db0 <___b2d_D2A>:
  407db0:	55                   	push   ebp
  407db1:	b9 20 00 00 00       	mov    ecx,0x20
  407db6:	57                   	push   edi
  407db7:	56                   	push   esi
  407db8:	53                   	push   ebx
  407db9:	83 ec 14             	sub    esp,0x14
  407dbc:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  407dc0:	8b 7c 24 2c          	mov    edi,DWORD PTR [esp+0x2c]
  407dc4:	8d 58 14             	lea    ebx,[eax+0x14]
  407dc7:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  407dca:	8d 2c 83             	lea    ebp,[ebx+eax*4]
  407dcd:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  407dd0:	8d 75 fc             	lea    esi,[ebp-0x4]
  407dd3:	0f bd c2             	bsr    eax,edx
  407dd6:	83 f0 1f             	xor    eax,0x1f
  407dd9:	29 c1                	sub    ecx,eax
  407ddb:	83 f8 0a             	cmp    eax,0xa
  407dde:	89 0f                	mov    DWORD PTR [edi],ecx
  407de0:	7f 3e                	jg     407e20 <___b2d_D2A+0x70>
  407de2:	b9 0b 00 00 00       	mov    ecx,0xb
  407de7:	89 d7                	mov    edi,edx
  407de9:	29 c1                	sub    ecx,eax
  407deb:	d3 ef                	shr    edi,cl
  407ded:	81 cf 00 00 f0 3f    	or     edi,0x3ff00000
  407df3:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  407df7:	31 ff                	xor    edi,edi
  407df9:	39 f3                	cmp    ebx,esi
  407dfb:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  407e02:	73 05                	jae    407e09 <___b2d_D2A+0x59>
  407e04:	8b 7d f8             	mov    edi,DWORD PTR [ebp-0x8]
  407e07:	d3 ef                	shr    edi,cl
  407e09:	8d 48 15             	lea    ecx,[eax+0x15]
  407e0c:	d3 e2                	shl    edx,cl
  407e0e:	09 d7                	or     edi,edx
  407e10:	89 3c 24             	mov    DWORD PTR [esp],edi
  407e13:	dd 04 24             	fld    QWORD PTR [esp]
  407e16:	83 c4 14             	add    esp,0x14
  407e19:	5b                   	pop    ebx
  407e1a:	5e                   	pop    esi
  407e1b:	5f                   	pop    edi
  407e1c:	5d                   	pop    ebp
  407e1d:	c3                   	ret    
  407e1e:	66 90                	xchg   ax,ax
  407e20:	31 ff                	xor    edi,edi
  407e22:	39 f3                	cmp    ebx,esi
  407e24:	73 06                	jae    407e2c <___b2d_D2A+0x7c>
  407e26:	8b 7d f8             	mov    edi,DWORD PTR [ebp-0x8]
  407e29:	8d 75 f8             	lea    esi,[ebp-0x8]
  407e2c:	89 c1                	mov    ecx,eax
  407e2e:	83 e9 0b             	sub    ecx,0xb
  407e31:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  407e35:	74 49                	je     407e80 <___b2d_D2A+0xd0>
  407e37:	0f b6 4c 24 0c       	movzx  ecx,BYTE PTR [esp+0xc]
  407e3c:	bd 2b 00 00 00       	mov    ebp,0x2b
  407e41:	29 c5                	sub    ebp,eax
  407e43:	89 f8                	mov    eax,edi
  407e45:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  407e4c:	d3 e2                	shl    edx,cl
  407e4e:	89 e9                	mov    ecx,ebp
  407e50:	d3 e8                	shr    eax,cl
  407e52:	81 ca 00 00 f0 3f    	or     edx,0x3ff00000
  407e58:	09 c2                	or     edx,eax
  407e5a:	31 c0                	xor    eax,eax
  407e5c:	39 de                	cmp    esi,ebx
  407e5e:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  407e62:	76 05                	jbe    407e69 <___b2d_D2A+0xb9>
  407e64:	8b 46 fc             	mov    eax,DWORD PTR [esi-0x4]
  407e67:	d3 e8                	shr    eax,cl
  407e69:	0f b6 4c 24 0c       	movzx  ecx,BYTE PTR [esp+0xc]
  407e6e:	d3 e7                	shl    edi,cl
  407e70:	09 f8                	or     eax,edi
  407e72:	89 04 24             	mov    DWORD PTR [esp],eax
  407e75:	dd 04 24             	fld    QWORD PTR [esp]
  407e78:	83 c4 14             	add    esp,0x14
  407e7b:	5b                   	pop    ebx
  407e7c:	5e                   	pop    esi
  407e7d:	5f                   	pop    edi
  407e7e:	5d                   	pop    ebp
  407e7f:	c3                   	ret    
  407e80:	81 ca 00 00 f0 3f    	or     edx,0x3ff00000
  407e86:	89 3c 24             	mov    DWORD PTR [esp],edi
  407e89:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  407e8d:	dd 04 24             	fld    QWORD PTR [esp]
  407e90:	83 c4 14             	add    esp,0x14
  407e93:	5b                   	pop    ebx
  407e94:	5e                   	pop    esi
  407e95:	5f                   	pop    edi
  407e96:	5d                   	pop    ebp
  407e97:	c3                   	ret    
  407e98:	90                   	nop
  407e99:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00407ea0 <___d2b_D2A>:
  407ea0:	55                   	push   ebp
  407ea1:	57                   	push   edi
  407ea2:	56                   	push   esi
  407ea3:	53                   	push   ebx
  407ea4:	83 ec 1c             	sub    esp,0x1c
  407ea7:	dd 44 24 30          	fld    QWORD PTR [esp+0x30]
  407eab:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  407eb2:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
  407eb6:	e8 d5 f6 ff ff       	call   407590 <___Balloc_D2A>
  407ebb:	85 c0                	test   eax,eax
  407ebd:	0f 84 c5 00 00 00    	je     407f88 <___d2b_D2A+0xe8>
  407ec3:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  407ec7:	89 d3                	mov    ebx,edx
  407ec9:	81 e2 ff ff ff 7f    	and    edx,0x7fffffff
  407ecf:	c1 ea 14             	shr    edx,0x14
  407ed2:	81 e3 ff ff 0f 00    	and    ebx,0xfffff
  407ed8:	85 d2                	test   edx,edx
  407eda:	74 06                	je     407ee2 <___d2b_D2A+0x42>
  407edc:	81 cb 00 00 10 00    	or     ebx,0x100000
  407ee2:	8b 7c 24 08          	mov    edi,DWORD PTR [esp+0x8]
  407ee6:	85 ff                	test   edi,edi
  407ee8:	75 3e                	jne    407f28 <___d2b_D2A+0x88>
  407eea:	f3 0f bc cb          	tzcnt  ecx,ebx
  407eee:	d3 eb                	shr    ebx,cl
  407ef0:	85 d2                	test   edx,edx
  407ef2:	8d 71 20             	lea    esi,[ecx+0x20]
  407ef5:	b9 01 00 00 00       	mov    ecx,0x1
  407efa:	89 58 14             	mov    DWORD PTR [eax+0x14],ebx
  407efd:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  407f04:	74 56                	je     407f5c <___d2b_D2A+0xbc>
  407f06:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
  407f0a:	8d 94 16 cd fb ff ff 	lea    edx,[esi+edx*1-0x433]
  407f11:	89 17                	mov    DWORD PTR [edi],edx
  407f13:	ba 35 00 00 00       	mov    edx,0x35
  407f18:	29 f2                	sub    edx,esi
  407f1a:	8b 74 24 3c          	mov    esi,DWORD PTR [esp+0x3c]
  407f1e:	89 16                	mov    DWORD PTR [esi],edx
  407f20:	83 c4 1c             	add    esp,0x1c
  407f23:	5b                   	pop    ebx
  407f24:	5e                   	pop    esi
  407f25:	5f                   	pop    edi
  407f26:	5d                   	pop    ebp
  407f27:	c3                   	ret    
  407f28:	f3 0f bc f7          	tzcnt  esi,edi
  407f2c:	89 f1                	mov    ecx,esi
  407f2e:	d3 ef                	shr    edi,cl
  407f30:	85 f6                	test   esi,esi
  407f32:	74 4f                	je     407f83 <___d2b_D2A+0xe3>
  407f34:	b9 20 00 00 00       	mov    ecx,0x20
  407f39:	89 dd                	mov    ebp,ebx
  407f3b:	29 f1                	sub    ecx,esi
  407f3d:	d3 e5                	shl    ebp,cl
  407f3f:	89 e9                	mov    ecx,ebp
  407f41:	09 f9                	or     ecx,edi
  407f43:	89 48 14             	mov    DWORD PTR [eax+0x14],ecx
  407f46:	89 f1                	mov    ecx,esi
  407f48:	d3 eb                	shr    ebx,cl
  407f4a:	83 fb 01             	cmp    ebx,0x1
  407f4d:	19 c9                	sbb    ecx,ecx
  407f4f:	83 c1 02             	add    ecx,0x2
  407f52:	85 d2                	test   edx,edx
  407f54:	89 58 18             	mov    DWORD PTR [eax+0x18],ebx
  407f57:	89 48 10             	mov    DWORD PTR [eax+0x10],ecx
  407f5a:	75 aa                	jne    407f06 <___d2b_D2A+0x66>
  407f5c:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
  407f60:	81 ee 32 04 00 00    	sub    esi,0x432
  407f66:	0f bd 54 88 10       	bsr    edx,DWORD PTR [eax+ecx*4+0x10]
  407f6b:	c1 e1 05             	shl    ecx,0x5
  407f6e:	89 37                	mov    DWORD PTR [edi],esi
  407f70:	8b 74 24 3c          	mov    esi,DWORD PTR [esp+0x3c]
  407f74:	83 f2 1f             	xor    edx,0x1f
  407f77:	29 d1                	sub    ecx,edx
  407f79:	89 0e                	mov    DWORD PTR [esi],ecx
  407f7b:	83 c4 1c             	add    esp,0x1c
  407f7e:	5b                   	pop    ebx
  407f7f:	5e                   	pop    esi
  407f80:	5f                   	pop    edi
  407f81:	5d                   	pop    ebp
  407f82:	c3                   	ret    
  407f83:	89 78 14             	mov    DWORD PTR [eax+0x14],edi
  407f86:	eb c2                	jmp    407f4a <___d2b_D2A+0xaa>
  407f88:	31 c0                	xor    eax,eax
  407f8a:	eb 94                	jmp    407f20 <___d2b_D2A+0x80>
  407f8c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00407f90 <___strcp_D2A>:
  407f90:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  407f94:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  407f98:	8d 51 01             	lea    edx,[ecx+0x1]
  407f9b:	0f b6 09             	movzx  ecx,BYTE PTR [ecx]
  407f9e:	84 c9                	test   cl,cl
  407fa0:	88 08                	mov    BYTE PTR [eax],cl
  407fa2:	74 10                	je     407fb4 <___strcp_D2A+0x24>
  407fa4:	83 c2 01             	add    edx,0x1
  407fa7:	0f b6 4a ff          	movzx  ecx,BYTE PTR [edx-0x1]
  407fab:	83 c0 01             	add    eax,0x1
  407fae:	84 c9                	test   cl,cl
  407fb0:	88 08                	mov    BYTE PTR [eax],cl
  407fb2:	75 f0                	jne    407fa4 <___strcp_D2A+0x14>
  407fb4:	f3 c3                	repz ret 
  407fb6:	90                   	nop
  407fb7:	90                   	nop
  407fb8:	90                   	nop
  407fb9:	90                   	nop
  407fba:	90                   	nop
  407fbb:	90                   	nop
  407fbc:	90                   	nop
  407fbd:	90                   	nop
  407fbe:	90                   	nop
  407fbf:	90                   	nop

00407fc0 <___rshift_D2A>:
  407fc0:	55                   	push   ebp
  407fc1:	57                   	push   edi
  407fc2:	56                   	push   esi
  407fc3:	53                   	push   ebx
  407fc4:	83 ec 10             	sub    esp,0x10
  407fc7:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  407fcb:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  407fcf:	8b 4c 24 28          	mov    ecx,DWORD PTR [esp+0x28]
  407fd3:	8b 56 10             	mov    edx,DWORD PTR [esi+0x10]
  407fd6:	8d 68 14             	lea    ebp,[eax+0x14]
  407fd9:	89 c8                	mov    eax,ecx
  407fdb:	c1 f8 05             	sar    eax,0x5
  407fde:	39 d0                	cmp    eax,edx
  407fe0:	0f 8d 8a 00 00 00    	jge    408070 <___rshift_D2A+0xb0>
  407fe6:	8d 44 85 00          	lea    eax,[ebp+eax*4+0x0]
  407fea:	83 e1 1f             	and    ecx,0x1f
  407fed:	8d 7c 95 00          	lea    edi,[ebp+edx*4+0x0]
  407ff1:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  407ff5:	89 0c 24             	mov    DWORD PTR [esp],ecx
  407ff8:	0f 84 92 00 00 00    	je     408090 <___rshift_D2A+0xd0>
  407ffe:	8b 74 24 04          	mov    esi,DWORD PTR [esp+0x4]
  408002:	8b 04 24             	mov    eax,DWORD PTR [esp]
  408005:	c7 44 24 08 20 00 00 	mov    DWORD PTR [esp+0x8],0x20
  40800c:	00 
  40800d:	29 44 24 08          	sub    DWORD PTR [esp+0x8],eax
  408011:	8b 1e                	mov    ebx,DWORD PTR [esi]
  408013:	8d 56 04             	lea    edx,[esi+0x4]
  408016:	89 c1                	mov    ecx,eax
  408018:	d3 eb                	shr    ebx,cl
  40801a:	39 d7                	cmp    edi,edx
  40801c:	0f 86 ac 00 00 00    	jbe    4080ce <___rshift_D2A+0x10e>
  408022:	89 ee                	mov    esi,ebp
  408024:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
  408028:	8b 6c 24 08          	mov    ebp,DWORD PTR [esp+0x8]
  40802c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  408030:	8b 02                	mov    eax,DWORD PTR [edx]
  408032:	89 e9                	mov    ecx,ebp
  408034:	83 c6 04             	add    esi,0x4
  408037:	83 c2 04             	add    edx,0x4
  40803a:	d3 e0                	shl    eax,cl
  40803c:	0f b6 0c 24          	movzx  ecx,BYTE PTR [esp]
  408040:	09 d8                	or     eax,ebx
  408042:	89 46 fc             	mov    DWORD PTR [esi-0x4],eax
  408045:	8b 5a fc             	mov    ebx,DWORD PTR [edx-0x4]
  408048:	d3 eb                	shr    ebx,cl
  40804a:	39 d7                	cmp    edi,edx
  40804c:	77 e2                	ja     408030 <___rshift_D2A+0x70>
  40804e:	2b 7c 24 04          	sub    edi,DWORD PTR [esp+0x4]
  408052:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
  408056:	8d 47 fb             	lea    eax,[edi-0x5]
  408059:	c1 e8 02             	shr    eax,0x2
  40805c:	8d 44 85 04          	lea    eax,[ebp+eax*4+0x4]
  408060:	85 db                	test   ebx,ebx
  408062:	89 18                	mov    DWORD PTR [eax],ebx
  408064:	74 03                	je     408069 <___rshift_D2A+0xa9>
  408066:	83 c0 04             	add    eax,0x4
  408069:	29 e8                	sub    eax,ebp
  40806b:	c1 f8 02             	sar    eax,0x2
  40806e:	eb 4b                	jmp    4080bb <___rshift_D2A+0xfb>
  408070:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  408074:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
  40807b:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  40807f:	c7 40 14 00 00 00 00 	mov    DWORD PTR [eax+0x14],0x0
  408086:	83 c4 10             	add    esp,0x10
  408089:	5b                   	pop    ebx
  40808a:	5e                   	pop    esi
  40808b:	5f                   	pop    edi
  40808c:	5d                   	pop    ebp
  40808d:	c3                   	ret    
  40808e:	66 90                	xchg   ax,ax
  408090:	39 c7                	cmp    edi,eax
  408092:	89 ea                	mov    edx,ebp
  408094:	76 da                	jbe    408070 <___rshift_D2A+0xb0>
  408096:	83 c0 04             	add    eax,0x4
  408099:	8b 48 fc             	mov    ecx,DWORD PTR [eax-0x4]
  40809c:	83 c2 04             	add    edx,0x4
  40809f:	39 c7                	cmp    edi,eax
  4080a1:	89 4a fc             	mov    DWORD PTR [edx-0x4],ecx
  4080a4:	77 f0                	ja     408096 <___rshift_D2A+0xd6>
  4080a6:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  4080aa:	f7 d0                	not    eax
  4080ac:	01 f8                	add    eax,edi
  4080ae:	c1 e8 02             	shr    eax,0x2
  4080b1:	8d 04 85 04 00 00 00 	lea    eax,[eax*4+0x4]
  4080b8:	c1 f8 02             	sar    eax,0x2
  4080bb:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  4080bf:	85 c0                	test   eax,eax
  4080c1:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
  4080c4:	74 b5                	je     40807b <___rshift_D2A+0xbb>
  4080c6:	83 c4 10             	add    esp,0x10
  4080c9:	5b                   	pop    ebx
  4080ca:	5e                   	pop    esi
  4080cb:	5f                   	pop    edi
  4080cc:	5d                   	pop    ebp
  4080cd:	c3                   	ret    
  4080ce:	89 e8                	mov    eax,ebp
  4080d0:	eb 8e                	jmp    408060 <___rshift_D2A+0xa0>
  4080d2:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4080d9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004080e0 <___trailz_D2A>:
  4080e0:	53                   	push   ebx
  4080e1:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  4080e5:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  4080e8:	8d 50 14             	lea    edx,[eax+0x14]
  4080eb:	8d 1c 8a             	lea    ebx,[edx+ecx*4]
  4080ee:	39 da                	cmp    edx,ebx
  4080f0:	73 28                	jae    40811a <___trailz_D2A+0x3a>
  4080f2:	8b 48 14             	mov    ecx,DWORD PTR [eax+0x14]
  4080f5:	31 c0                	xor    eax,eax
  4080f7:	85 c9                	test   ecx,ecx
  4080f9:	74 0b                	je     408106 <___trailz_D2A+0x26>
  4080fb:	eb 15                	jmp    408112 <___trailz_D2A+0x32>
  4080fd:	8d 76 00             	lea    esi,[esi+0x0]
  408100:	8b 0a                	mov    ecx,DWORD PTR [edx]
  408102:	85 c9                	test   ecx,ecx
  408104:	75 0c                	jne    408112 <___trailz_D2A+0x32>
  408106:	83 c2 04             	add    edx,0x4
  408109:	83 c0 20             	add    eax,0x20
  40810c:	39 d3                	cmp    ebx,edx
  40810e:	77 f0                	ja     408100 <___trailz_D2A+0x20>
  408110:	5b                   	pop    ebx
  408111:	c3                   	ret    
  408112:	f3 0f bc c9          	tzcnt  ecx,ecx
  408116:	01 c8                	add    eax,ecx
  408118:	5b                   	pop    ebx
  408119:	c3                   	ret    
  40811a:	31 c0                	xor    eax,eax
  40811c:	5b                   	pop    ebx
  40811d:	c3                   	ret    
  40811e:	90                   	nop
  40811f:	90                   	nop

00408120 <_signal>:
  408120:	ff 25 1c e2 40 00    	jmp    DWORD PTR ds:0x40e21c
  408126:	90                   	nop
  408127:	90                   	nop

00408128 <__setmode>:
  408128:	ff 25 d4 e1 40 00    	jmp    DWORD PTR ds:0x40e1d4
  40812e:	90                   	nop
  40812f:	90                   	nop

00408130 <___p__fmode>:
  408130:	ff 25 b8 e1 40 00    	jmp    DWORD PTR ds:0x40e1b8
  408136:	90                   	nop
  408137:	90                   	nop

00408138 <___p__environ>:
  408138:	ff 25 b4 e1 40 00    	jmp    DWORD PTR ds:0x40e1b4
  40813e:	90                   	nop
  40813f:	90                   	nop

00408140 <__cexit>:
  408140:	ff 25 c0 e1 40 00    	jmp    DWORD PTR ds:0x40e1c0
  408146:	90                   	nop
  408147:	90                   	nop

00408148 <___getmainargs>:
  408148:	ff 25 ac e1 40 00    	jmp    DWORD PTR ds:0x40e1ac
  40814e:	90                   	nop
  40814f:	90                   	nop

00408150 <_clock>:
  408150:	ff 25 e8 e1 40 00    	jmp    DWORD PTR ds:0x40e1e8
  408156:	90                   	nop
  408157:	90                   	nop

00408158 <_printf>:
  408158:	ff 25 10 e2 40 00    	jmp    DWORD PTR ds:0x40e210
  40815e:	90                   	nop
  40815f:	90                   	nop

00408160 <_strlen>:
  408160:	ff 25 28 e2 40 00    	jmp    DWORD PTR ds:0x40e228
  408166:	90                   	nop
  408167:	90                   	nop

00408168 <_isspace>:
  408168:	ff 25 fc e1 40 00    	jmp    DWORD PTR ds:0x40e1fc
  40816e:	90                   	nop
  40816f:	90                   	nop

00408170 <_fwrite>:
  408170:	ff 25 f4 e1 40 00    	jmp    DWORD PTR ds:0x40e1f4
  408176:	90                   	nop
  408177:	90                   	nop

00408178 <_vfprintf>:
  408178:	ff 25 30 e2 40 00    	jmp    DWORD PTR ds:0x40e230
  40817e:	90                   	nop
  40817f:	90                   	nop

00408180 <_abort>:
  408180:	ff 25 d8 e1 40 00    	jmp    DWORD PTR ds:0x40e1d8
  408186:	90                   	nop
  408187:	90                   	nop

00408188 <_memcpy>:
  408188:	ff 25 0c e2 40 00    	jmp    DWORD PTR ds:0x40e20c
  40818e:	90                   	nop
  40818f:	90                   	nop

00408190 <_calloc>:
  408190:	ff 25 e4 e1 40 00    	jmp    DWORD PTR ds:0x40e1e4
  408196:	90                   	nop
  408197:	90                   	nop

00408198 <_free>:
  408198:	ff 25 f0 e1 40 00    	jmp    DWORD PTR ds:0x40e1f0
  40819e:	90                   	nop
  40819f:	90                   	nop

004081a0 <_malloc>:
  4081a0:	ff 25 04 e2 40 00    	jmp    DWORD PTR ds:0x40e204
  4081a6:	90                   	nop
  4081a7:	90                   	nop

004081a8 <_tolower>:
  4081a8:	ff 25 2c e2 40 00    	jmp    DWORD PTR ds:0x40e22c
  4081ae:	90                   	nop
  4081af:	90                   	nop

004081b0 <_realloc>:
  4081b0:	ff 25 14 e2 40 00    	jmp    DWORD PTR ds:0x40e214
  4081b6:	90                   	nop
  4081b7:	90                   	nop

004081b8 <_strcoll>:
  4081b8:	ff 25 24 e2 40 00    	jmp    DWORD PTR ds:0x40e224
  4081be:	90                   	nop
  4081bf:	90                   	nop

004081c0 <__errno>:
  4081c0:	ff 25 c4 e1 40 00    	jmp    DWORD PTR ds:0x40e1c4
  4081c6:	90                   	nop
  4081c7:	90                   	nop

004081c8 <_setlocale>:
  4081c8:	ff 25 18 e2 40 00    	jmp    DWORD PTR ds:0x40e218
  4081ce:	90                   	nop
  4081cf:	90                   	nop

004081d0 <_wcstombs>:
  4081d0:	ff 25 38 e2 40 00    	jmp    DWORD PTR ds:0x40e238
  4081d6:	90                   	nop
  4081d7:	90                   	nop

004081d8 <_mbstowcs>:
  4081d8:	ff 25 08 e2 40 00    	jmp    DWORD PTR ds:0x40e208
  4081de:	90                   	nop
  4081df:	90                   	nop

004081e0 <__fullpath>:
  4081e0:	ff 25 c8 e1 40 00    	jmp    DWORD PTR ds:0x40e1c8
  4081e6:	90                   	nop
  4081e7:	90                   	nop

004081e8 <_fputc>:
  4081e8:	ff 25 ec e1 40 00    	jmp    DWORD PTR ds:0x40e1ec
  4081ee:	90                   	nop
  4081ef:	90                   	nop

004081f0 <_localeconv>:
  4081f0:	ff 25 00 e2 40 00    	jmp    DWORD PTR ds:0x40e200
  4081f6:	90                   	nop
  4081f7:	90                   	nop

004081f8 <_getenv>:
  4081f8:	ff 25 f8 e1 40 00    	jmp    DWORD PTR ds:0x40e1f8
  4081fe:	90                   	nop
  4081ff:	90                   	nop

00408200 <_wcslen>:
  408200:	ff 25 34 e2 40 00    	jmp    DWORD PTR ds:0x40e234
  408206:	90                   	nop
  408207:	90                   	nop

00408208 <_strchr>:
  408208:	ff 25 20 e2 40 00    	jmp    DWORD PTR ds:0x40e220
  40820e:	90                   	nop
  40820f:	90                   	nop

00408210 <_atoi>:
  408210:	ff 25 e0 e1 40 00    	jmp    DWORD PTR ds:0x40e1e0
  408216:	90                   	nop
  408217:	90                   	nop

00408218 <_SetUnhandledExceptionFilter@4>:
  408218:	ff 25 84 e1 40 00    	jmp    DWORD PTR ds:0x40e184
  40821e:	90                   	nop
  40821f:	90                   	nop

00408220 <_ExitProcess@4>:
  408220:	ff 25 50 e1 40 00    	jmp    DWORD PTR ds:0x40e150
  408226:	90                   	nop
  408227:	90                   	nop

00408228 <_GetModuleHandleA@4>:
  408228:	ff 25 68 e1 40 00    	jmp    DWORD PTR ds:0x40e168
  40822e:	90                   	nop
  40822f:	90                   	nop

00408230 <_GetProcAddress@8>:
  408230:	ff 25 6c e1 40 00    	jmp    DWORD PTR ds:0x40e16c
  408236:	90                   	nop
  408237:	90                   	nop

00408238 <_GetCommandLineA@0>:
  408238:	ff 25 60 e1 40 00    	jmp    DWORD PTR ds:0x40e160
  40823e:	90                   	nop
  40823f:	90                   	nop

00408240 <_VirtualQuery@12>:
  408240:	ff 25 94 e1 40 00    	jmp    DWORD PTR ds:0x40e194
  408246:	90                   	nop
  408247:	90                   	nop

00408248 <_VirtualProtect@16>:
  408248:	ff 25 90 e1 40 00    	jmp    DWORD PTR ds:0x40e190
  40824e:	90                   	nop
  40824f:	90                   	nop

00408250 <_EnterCriticalSection@4>:
  408250:	ff 25 4c e1 40 00    	jmp    DWORD PTR ds:0x40e14c
  408256:	90                   	nop
  408257:	90                   	nop

00408258 <_TlsGetValue@4>:
  408258:	ff 25 8c e1 40 00    	jmp    DWORD PTR ds:0x40e18c
  40825e:	90                   	nop
  40825f:	90                   	nop

00408260 <_GetLastError@0>:
  408260:	ff 25 64 e1 40 00    	jmp    DWORD PTR ds:0x40e164
  408266:	90                   	nop
  408267:	90                   	nop

00408268 <_LeaveCriticalSection@4>:
  408268:	ff 25 7c e1 40 00    	jmp    DWORD PTR ds:0x40e17c
  40826e:	90                   	nop
  40826f:	90                   	nop

00408270 <_DeleteCriticalSection@4>:
  408270:	ff 25 48 e1 40 00    	jmp    DWORD PTR ds:0x40e148
  408276:	90                   	nop
  408277:	90                   	nop

00408278 <_InitializeCriticalSection@4>:
  408278:	ff 25 70 e1 40 00    	jmp    DWORD PTR ds:0x40e170
  40827e:	90                   	nop
  40827f:	90                   	nop

00408280 <_FindNextFileA@8>:
  408280:	ff 25 5c e1 40 00    	jmp    DWORD PTR ds:0x40e15c
  408286:	90                   	nop
  408287:	90                   	nop

00408288 <_FindFirstFileA@8>:
  408288:	ff 25 58 e1 40 00    	jmp    DWORD PTR ds:0x40e158
  40828e:	90                   	nop
  40828f:	90                   	nop

00408290 <_FindClose@4>:
  408290:	ff 25 54 e1 40 00    	jmp    DWORD PTR ds:0x40e154
  408296:	90                   	nop
  408297:	90                   	nop

00408298 <_WideCharToMultiByte@32>:
  408298:	ff 25 98 e1 40 00    	jmp    DWORD PTR ds:0x40e198
  40829e:	90                   	nop
  40829f:	90                   	nop

004082a0 <_IsDBCSLeadByteEx@8>:
  4082a0:	ff 25 78 e1 40 00    	jmp    DWORD PTR ds:0x40e178
  4082a6:	90                   	nop
  4082a7:	90                   	nop

004082a8 <_MultiByteToWideChar@24>:
  4082a8:	ff 25 80 e1 40 00    	jmp    DWORD PTR ds:0x40e180
  4082ae:	90                   	nop
  4082af:	90                   	nop

004082b0 <_Sleep@4>:
  4082b0:	ff 25 88 e1 40 00    	jmp    DWORD PTR ds:0x40e188
  4082b6:	90                   	nop
  4082b7:	90                   	nop

004082b8 <_InterlockedExchange@8>:
  4082b8:	ff 25 74 e1 40 00    	jmp    DWORD PTR ds:0x40e174
  4082be:	90                   	nop
  4082bf:	90                   	nop

004082c0 <___umoddi3>:
  4082c0:	55                   	push   ebp
  4082c1:	57                   	push   edi
  4082c2:	56                   	push   esi
  4082c3:	53                   	push   ebx
  4082c4:	83 ec 1c             	sub    esp,0x1c
  4082c7:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  4082cb:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  4082cf:	8b 6c 24 34          	mov    ebp,DWORD PTR [esp+0x34]
  4082d3:	8b 5c 24 38          	mov    ebx,DWORD PTR [esp+0x38]
  4082d7:	85 c0                	test   eax,eax
  4082d9:	89 c2                	mov    edx,eax
  4082db:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  4082df:	89 ee                	mov    esi,ebp
  4082e1:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4082e4:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  4082e8:	89 6c 24 08          	mov    DWORD PTR [esp+0x8],ebp
  4082ec:	75 16                	jne    408304 <___umoddi3+0x44>
  4082ee:	39 eb                	cmp    ebx,ebp
  4082f0:	76 4e                	jbe    408340 <___umoddi3+0x80>
  4082f2:	89 c8                	mov    eax,ecx
  4082f4:	89 ea                	mov    edx,ebp
  4082f6:	f7 f3                	div    ebx
  4082f8:	89 d0                	mov    eax,edx
  4082fa:	31 d2                	xor    edx,edx
  4082fc:	83 c4 1c             	add    esp,0x1c
  4082ff:	5b                   	pop    ebx
  408300:	5e                   	pop    esi
  408301:	5f                   	pop    edi
  408302:	5d                   	pop    ebp
  408303:	c3                   	ret    
  408304:	39 e8                	cmp    eax,ebp
  408306:	77 58                	ja     408360 <___umoddi3+0xa0>
  408308:	0f bd f8             	bsr    edi,eax
  40830b:	83 f7 1f             	xor    edi,0x1f
  40830e:	75 60                	jne    408370 <___umoddi3+0xb0>
  408310:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
  408314:	39 3c 24             	cmp    DWORD PTR [esp],edi
  408317:	0f 87 e4 00 00 00    	ja     408401 <___umoddi3+0x141>
  40831d:	89 ef                	mov    edi,ebp
  40831f:	89 ce                	mov    esi,ecx
  408321:	29 de                	sub    esi,ebx
  408323:	19 c7                	sbb    edi,eax
  408325:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  408329:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  40832d:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  408331:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
  408335:	83 c4 1c             	add    esp,0x1c
  408338:	5b                   	pop    ebx
  408339:	5e                   	pop    esi
  40833a:	5f                   	pop    edi
  40833b:	5d                   	pop    ebp
  40833c:	c3                   	ret    
  40833d:	8d 76 00             	lea    esi,[esi+0x0]
  408340:	85 db                	test   ebx,ebx
  408342:	89 df                	mov    edi,ebx
  408344:	75 0b                	jne    408351 <___umoddi3+0x91>
  408346:	b8 01 00 00 00       	mov    eax,0x1
  40834b:	31 d2                	xor    edx,edx
  40834d:	f7 f3                	div    ebx
  40834f:	89 c7                	mov    edi,eax
  408351:	89 e8                	mov    eax,ebp
  408353:	31 d2                	xor    edx,edx
  408355:	f7 f7                	div    edi
  408357:	89 c8                	mov    eax,ecx
  408359:	f7 f7                	div    edi
  40835b:	eb 9b                	jmp    4082f8 <___umoddi3+0x38>
  40835d:	8d 76 00             	lea    esi,[esi+0x0]
  408360:	89 c8                	mov    eax,ecx
  408362:	89 ea                	mov    edx,ebp
  408364:	83 c4 1c             	add    esp,0x1c
  408367:	5b                   	pop    ebx
  408368:	5e                   	pop    esi
  408369:	5f                   	pop    edi
  40836a:	5d                   	pop    ebp
  40836b:	c3                   	ret    
  40836c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  408370:	8b 2c 24             	mov    ebp,DWORD PTR [esp]
  408373:	bb 20 00 00 00       	mov    ebx,0x20
  408378:	89 f9                	mov    ecx,edi
  40837a:	29 fb                	sub    ebx,edi
  40837c:	d3 e2                	shl    edx,cl
  40837e:	89 d9                	mov    ecx,ebx
  408380:	89 e8                	mov    eax,ebp
  408382:	d3 e8                	shr    eax,cl
  408384:	89 f9                	mov    ecx,edi
  408386:	89 04 24             	mov    DWORD PTR [esp],eax
  408389:	89 e8                	mov    eax,ebp
  40838b:	d3 e0                	shl    eax,cl
  40838d:	89 d9                	mov    ecx,ebx
  40838f:	89 c5                	mov    ebp,eax
  408391:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  408395:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  408399:	09 14 24             	or     DWORD PTR [esp],edx
  40839c:	89 f2                	mov    edx,esi
  40839e:	d3 ea                	shr    edx,cl
  4083a0:	89 f9                	mov    ecx,edi
  4083a2:	d3 e6                	shl    esi,cl
  4083a4:	89 d9                	mov    ecx,ebx
  4083a6:	d3 e8                	shr    eax,cl
  4083a8:	89 f9                	mov    ecx,edi
  4083aa:	09 f0                	or     eax,esi
  4083ac:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
  4083b0:	f7 34 24             	div    DWORD PTR [esp]
  4083b3:	d3 e6                	shl    esi,cl
  4083b5:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  4083b9:	89 d6                	mov    esi,edx
  4083bb:	f7 e5                	mul    ebp
  4083bd:	39 d6                	cmp    esi,edx
  4083bf:	89 c1                	mov    ecx,eax
  4083c1:	89 d5                	mov    ebp,edx
  4083c3:	72 2f                	jb     4083f4 <___umoddi3+0x134>
  4083c5:	39 44 24 04          	cmp    DWORD PTR [esp+0x4],eax
  4083c9:	72 25                	jb     4083f0 <___umoddi3+0x130>
  4083cb:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  4083cf:	29 c8                	sub    eax,ecx
  4083d1:	19 ee                	sbb    esi,ebp
  4083d3:	89 f9                	mov    ecx,edi
  4083d5:	89 f2                	mov    edx,esi
  4083d7:	d3 e8                	shr    eax,cl
  4083d9:	89 d9                	mov    ecx,ebx
  4083db:	d3 e2                	shl    edx,cl
  4083dd:	89 f9                	mov    ecx,edi
  4083df:	d3 ee                	shr    esi,cl
  4083e1:	09 d0                	or     eax,edx
  4083e3:	89 f2                	mov    edx,esi
  4083e5:	83 c4 1c             	add    esp,0x1c
  4083e8:	5b                   	pop    ebx
  4083e9:	5e                   	pop    esi
  4083ea:	5f                   	pop    edi
  4083eb:	5d                   	pop    ebp
  4083ec:	c3                   	ret    
  4083ed:	8d 76 00             	lea    esi,[esi+0x0]
  4083f0:	39 d6                	cmp    esi,edx
  4083f2:	75 d7                	jne    4083cb <___umoddi3+0x10b>
  4083f4:	89 d5                	mov    ebp,edx
  4083f6:	89 c1                	mov    ecx,eax
  4083f8:	2b 4c 24 08          	sub    ecx,DWORD PTR [esp+0x8]
  4083fc:	1b 2c 24             	sbb    ebp,DWORD PTR [esp]
  4083ff:	eb ca                	jmp    4083cb <___umoddi3+0x10b>
  408401:	3b 44 24 08          	cmp    eax,DWORD PTR [esp+0x8]
  408405:	0f 82 12 ff ff ff    	jb     40831d <___umoddi3+0x5d>
  40840b:	e9 1d ff ff ff       	jmp    40832d <___umoddi3+0x6d>

00408410 <___udivdi3>:
  408410:	55                   	push   ebp
  408411:	57                   	push   edi
  408412:	56                   	push   esi
  408413:	53                   	push   ebx
  408414:	83 ec 14             	sub    esp,0x14
  408417:	8b 74 24 34          	mov    esi,DWORD PTR [esp+0x34]
  40841b:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
  40841f:	8b 6c 24 2c          	mov    ebp,DWORD PTR [esp+0x2c]
  408423:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  408427:	85 f6                	test   esi,esi
  408429:	89 3c 24             	mov    DWORD PTR [esp],edi
  40842c:	89 e8                	mov    eax,ebp
  40842e:	89 ca                	mov    edx,ecx
  408430:	75 2e                	jne    408460 <___udivdi3+0x50>
  408432:	39 e9                	cmp    ecx,ebp
  408434:	77 5c                	ja     408492 <___udivdi3+0x82>
  408436:	85 c9                	test   ecx,ecx
  408438:	89 cb                	mov    ebx,ecx
  40843a:	75 0b                	jne    408447 <___udivdi3+0x37>
  40843c:	b8 01 00 00 00       	mov    eax,0x1
  408441:	31 d2                	xor    edx,edx
  408443:	f7 f1                	div    ecx
  408445:	89 c3                	mov    ebx,eax
  408447:	89 e8                	mov    eax,ebp
  408449:	31 d2                	xor    edx,edx
  40844b:	f7 f3                	div    ebx
  40844d:	89 c5                	mov    ebp,eax
  40844f:	89 f8                	mov    eax,edi
  408451:	f7 f3                	div    ebx
  408453:	89 ea                	mov    edx,ebp
  408455:	83 c4 14             	add    esp,0x14
  408458:	5b                   	pop    ebx
  408459:	5e                   	pop    esi
  40845a:	5f                   	pop    edi
  40845b:	5d                   	pop    ebp
  40845c:	c3                   	ret    
  40845d:	8d 76 00             	lea    esi,[esi+0x0]
  408460:	39 ee                	cmp    esi,ebp
  408462:	77 22                	ja     408486 <___udivdi3+0x76>
  408464:	0f bd de             	bsr    ebx,esi
  408467:	83 f3 1f             	xor    ebx,0x1f
  40846a:	75 36                	jne    4084a2 <___udivdi3+0x92>
  40846c:	3b 0c 24             	cmp    ecx,DWORD PTR [esp]
  40846f:	ba 00 00 00 00       	mov    edx,0x0
  408474:	0f 86 86 00 00 00    	jbe    408500 <___udivdi3+0xf0>
  40847a:	39 ee                	cmp    esi,ebp
  40847c:	0f 82 7e 00 00 00    	jb     408500 <___udivdi3+0xf0>
  408482:	31 c0                	xor    eax,eax
  408484:	eb cf                	jmp    408455 <___udivdi3+0x45>
  408486:	31 d2                	xor    edx,edx
  408488:	31 c0                	xor    eax,eax
  40848a:	83 c4 14             	add    esp,0x14
  40848d:	5b                   	pop    ebx
  40848e:	5e                   	pop    esi
  40848f:	5f                   	pop    edi
  408490:	5d                   	pop    ebp
  408491:	c3                   	ret    
  408492:	89 f8                	mov    eax,edi
  408494:	89 ea                	mov    edx,ebp
  408496:	f7 f1                	div    ecx
  408498:	31 d2                	xor    edx,edx
  40849a:	83 c4 14             	add    esp,0x14
  40849d:	5b                   	pop    ebx
  40849e:	5e                   	pop    esi
  40849f:	5f                   	pop    edi
  4084a0:	5d                   	pop    ebp
  4084a1:	c3                   	ret    
  4084a2:	bf 20 00 00 00       	mov    edi,0x20
  4084a7:	89 d9                	mov    ecx,ebx
  4084a9:	29 df                	sub    edi,ebx
  4084ab:	89 d5                	mov    ebp,edx
  4084ad:	d3 e6                	shl    esi,cl
  4084af:	89 f9                	mov    ecx,edi
  4084b1:	d3 ed                	shr    ebp,cl
  4084b3:	89 d9                	mov    ecx,ebx
  4084b5:	d3 e2                	shl    edx,cl
  4084b7:	09 f5                	or     ebp,esi
  4084b9:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4084bd:	8b 14 24             	mov    edx,DWORD PTR [esp]
  4084c0:	89 f9                	mov    ecx,edi
  4084c2:	89 c6                	mov    esi,eax
  4084c4:	d3 ee                	shr    esi,cl
  4084c6:	89 d9                	mov    ecx,ebx
  4084c8:	d3 e0                	shl    eax,cl
  4084ca:	89 f9                	mov    ecx,edi
  4084cc:	d3 ea                	shr    edx,cl
  4084ce:	89 d7                	mov    edi,edx
  4084d0:	89 f2                	mov    edx,esi
  4084d2:	09 c7                	or     edi,eax
  4084d4:	89 f8                	mov    eax,edi
  4084d6:	f7 f5                	div    ebp
  4084d8:	89 d6                	mov    esi,edx
  4084da:	89 c7                	mov    edi,eax
  4084dc:	f7 64 24 04          	mul    DWORD PTR [esp+0x4]
  4084e0:	39 d6                	cmp    esi,edx
  4084e2:	72 2c                	jb     408510 <___udivdi3+0x100>
  4084e4:	8b 2c 24             	mov    ebp,DWORD PTR [esp]
  4084e7:	89 d9                	mov    ecx,ebx
  4084e9:	d3 e5                	shl    ebp,cl
  4084eb:	39 c5                	cmp    ebp,eax
  4084ed:	73 04                	jae    4084f3 <___udivdi3+0xe3>
  4084ef:	39 d6                	cmp    esi,edx
  4084f1:	74 1d                	je     408510 <___udivdi3+0x100>
  4084f3:	89 f8                	mov    eax,edi
  4084f5:	31 d2                	xor    edx,edx
  4084f7:	e9 59 ff ff ff       	jmp    408455 <___udivdi3+0x45>
  4084fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  408500:	b8 01 00 00 00       	mov    eax,0x1
  408505:	e9 4b ff ff ff       	jmp    408455 <___udivdi3+0x45>
  40850a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  408510:	8d 47 ff             	lea    eax,[edi-0x1]
  408513:	31 d2                	xor    edx,edx
  408515:	83 c4 14             	add    esp,0x14
  408518:	5b                   	pop    ebx
  408519:	5e                   	pop    esi
  40851a:	5f                   	pop    edi
  40851b:	5d                   	pop    ebp
  40851c:	c3                   	ret    
  40851d:	90                   	nop
  40851e:	90                   	nop
  40851f:	90                   	nop

00408520 <_strdup>:
  408520:	ff 25 a0 e1 40 00    	jmp    DWORD PTR ds:0x40e1a0
  408526:	90                   	nop
  408527:	90                   	nop

00408528 <_stricoll>:
  408528:	ff 25 a4 e1 40 00    	jmp    DWORD PTR ds:0x40e1a4
  40852e:	90                   	nop
  40852f:	90                   	nop

00408530 <_main>:
  408530:	55                   	push   ebp
  408531:	89 e5                	mov    ebp,esp
  408533:	57                   	push   edi
  408534:	56                   	push   esi
  408535:	53                   	push   ebx
  408536:	bb 40 4b 4c 00       	mov    ebx,0x4c4b40
  40853b:	83 e4 f0             	and    esp,0xfffffff0
  40853e:	83 c4 80             	add    esp,0xffffff80
  408541:	e8 7a 99 ff ff       	call   401ec0 <___main>
  408546:	8d 44 24 50          	lea    eax,[esp+0x50]
  40854a:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40854e:	8d 44 24 20          	lea    eax,[esp+0x20]
  408552:	89 04 24             	mov    DWORD PTR [esp],eax
  408555:	8d 7c 24 40          	lea    edi,[esp+0x40]
  408559:	c7 44 24 50 01 00 00 	mov    DWORD PTR [esp+0x50],0x1
  408560:	00 
  408561:	8d 74 24 30          	lea    esi,[esp+0x30]
  408565:	e8 76 8e ff ff       	call   4013e0 <_encrypt>
  40856a:	e8 e1 fb ff ff       	call   408150 <_clock>
  40856f:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  408573:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  408577:	89 34 24             	mov    DWORD PTR [esp],esi
  40857a:	e8 61 8e ff ff       	call   4013e0 <_encrypt>
  40857f:	83 eb 01             	sub    ebx,0x1
  408582:	75 ef                	jne    408573 <_main+0x43>
  408584:	e8 c7 fb ff ff       	call   408150 <_clock>
  408589:	c7 04 24 64 a0 40 00 	mov    DWORD PTR [esp],0x40a064
  408590:	2b 44 24 18          	sub    eax,DWORD PTR [esp+0x18]
  408594:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  408598:	db 44 24 1c          	fild   DWORD PTR [esp+0x1c]
  40859c:	d8 35 7c a0 40 00    	fdiv   DWORD PTR ds:0x40a07c
  4085a2:	dd 5c 24 04          	fstp   QWORD PTR [esp+0x4]
  4085a6:	e8 ad fb ff ff       	call   408158 <_printf>
  4085ab:	8d 65 f4             	lea    esp,[ebp-0xc]
  4085ae:	31 c0                	xor    eax,eax
  4085b0:	5b                   	pop    ebx
  4085b1:	5e                   	pop    esi
  4085b2:	5f                   	pop    edi
  4085b3:	5d                   	pop    ebp
  4085b4:	c3                   	ret    
  4085b5:	90                   	nop
  4085b6:	90                   	nop
  4085b7:	90                   	nop
  4085b8:	90                   	nop
  4085b9:	90                   	nop
  4085ba:	90                   	nop
  4085bb:	90                   	nop
  4085bc:	90                   	nop
  4085bd:	90                   	nop
  4085be:	90                   	nop
  4085bf:	90                   	nop

004085c0 <_register_frame_ctor>:
  4085c0:	55                   	push   ebp
  4085c1:	89 e5                	mov    ebp,esp
  4085c3:	83 ec 18             	sub    esp,0x18
  4085c6:	e8 35 8d ff ff       	call   401300 <___gcc_register_frame>
  4085cb:	c7 04 24 90 13 40 00 	mov    DWORD PTR [esp],0x401390
  4085d2:	e8 09 8d ff ff       	call   4012e0 <_atexit>
  4085d7:	c9                   	leave  
  4085d8:	c3                   	ret    
  4085d9:	90                   	nop
  4085da:	90                   	nop
  4085db:	90                   	nop
  4085dc:	90                   	nop
  4085dd:	90                   	nop
  4085de:	90                   	nop
  4085df:	90                   	nop

004085e0 <__CTOR_LIST__>:
  4085e0:	ff                   	(bad)  
  4085e1:	ff                   	(bad)  
  4085e2:	ff                   	(bad)  
  4085e3:	ff c0                	inc    eax

004085e4 <.ctors.65535>:
  4085e4:	c0 85 40 00 00 00 00 	rol    BYTE PTR [ebp+0x40],0x0
	...

004085ec <__DTOR_LIST__>:
  4085ec:	ff                   	(bad)  
  4085ed:	ff                   	(bad)  
  4085ee:	ff                   	(bad)  
  4085ef:	ff 00                	inc    DWORD PTR [eax]
  4085f1:	00 00                	add    BYTE PTR [eax],al
	...
