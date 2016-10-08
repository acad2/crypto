
blockcipher256.exe:     file format pei-i386


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
  401034:	e8 a7 70 00 00       	call   4080e0 <_signal>
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
  401091:	e8 4a 70 00 00       	call   4080e0 <_signal>
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
  4010c9:	e8 12 70 00 00       	call   4080e0 <_signal>
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
  401112:	e8 c9 6f 00 00       	call   4080e0 <_signal>
  401117:	83 c8 ff             	or     eax,0xffffffff
  40111a:	e9 33 ff ff ff       	jmp    401052 <__gnu_exception_handler@4+0x52>
  40111f:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401126:	00 
  401127:	c7 04 24 04 00 00 00 	mov    DWORD PTR [esp],0x4
  40112e:	e8 ad 6f 00 00       	call   4080e0 <_signal>
  401133:	83 c8 ff             	or     eax,0xffffffff
  401136:	e9 17 ff ff ff       	jmp    401052 <__gnu_exception_handler@4+0x52>
  40113b:	90                   	nop
  40113c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401140:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401147:	00 
  401148:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  40114f:	e8 8c 6f 00 00       	call   4080e0 <_signal>
  401154:	85 db                	test   ebx,ebx
  401156:	b8 ff ff ff ff       	mov    eax,0xffffffff
  40115b:	0f 84 f1 fe ff ff    	je     401052 <__gnu_exception_handler@4+0x52>
  401161:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401165:	e8 76 05 00 00       	call   4016e0 <__fpreset>
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
  4011b3:	e8 20 70 00 00       	call   4081d8 <_SetUnhandledExceptionFilter@4>
  4011b8:	83 ec 04             	sub    esp,0x4
  4011bb:	e8 30 05 00 00       	call   4016f0 <___cpu_features_init>
  4011c0:	e8 1b 05 00 00       	call   4016e0 <__fpreset>
  4011c5:	e8 06 06 00 00       	call   4017d0 <__setargv>
  4011ca:	a1 30 d0 40 00       	mov    eax,ds:0x40d030
  4011cf:	85 c0                	test   eax,eax
  4011d1:	74 42                	je     401215 <___mingw_CRTStartup+0x95>
  4011d3:	8b 1d cc e1 40 00    	mov    ebx,DWORD PTR ds:0x40e1cc
  4011d9:	a3 00 90 40 00       	mov    ds:0x409000,eax
  4011de:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4011e2:	8b 43 10             	mov    eax,DWORD PTR [ebx+0x10]
  4011e5:	89 04 24             	mov    DWORD PTR [esp],eax
  4011e8:	e8 fb 6e 00 00       	call   4080e8 <__setmode>
  4011ed:	a1 30 d0 40 00       	mov    eax,ds:0x40d030
  4011f2:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4011f6:	8b 43 30             	mov    eax,DWORD PTR [ebx+0x30]
  4011f9:	89 04 24             	mov    DWORD PTR [esp],eax
  4011fc:	e8 e7 6e 00 00       	call   4080e8 <__setmode>
  401201:	a1 30 d0 40 00       	mov    eax,ds:0x40d030
  401206:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40120a:	8b 43 50             	mov    eax,DWORD PTR [ebx+0x50]
  40120d:	89 04 24             	mov    DWORD PTR [esp],eax
  401210:	e8 d3 6e 00 00       	call   4080e8 <__setmode>
  401215:	e8 d6 6e 00 00       	call   4080f0 <___p__fmode>
  40121a:	8b 15 00 90 40 00    	mov    edx,DWORD PTR ds:0x409000
  401220:	89 10                	mov    DWORD PTR [eax],edx
  401222:	e8 f9 09 00 00       	call   401c20 <__pei386_runtime_relocator>
  401227:	83 e4 f0             	and    esp,0xfffffff0
  40122a:	e8 51 0c 00 00       	call   401e80 <___main>
  40122f:	e8 c4 6e 00 00       	call   4080f8 <___p__environ>
  401234:	8b 00                	mov    eax,DWORD PTR [eax]
  401236:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40123a:	a1 00 d0 40 00       	mov    eax,ds:0x40d000
  40123f:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401243:	a1 04 d0 40 00       	mov    eax,ds:0x40d004
  401248:	89 04 24             	mov    DWORD PTR [esp],eax
  40124b:	e8 a0 72 00 00       	call   4084f0 <_main>
  401250:	89 c3                	mov    ebx,eax
  401252:	e8 a9 6e 00 00       	call   408100 <__cexit>
  401257:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40125a:	e8 81 6f 00 00       	call   4081e0 <_ExitProcess@4>
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
  401296:	e8 6d 6e 00 00       	call   408108 <___getmainargs>
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
  40130d:	e8 d6 6e 00 00       	call   4081e8 <_GetModuleHandleA@4>
  401312:	ba 00 00 00 00       	mov    edx,0x0
  401317:	83 ec 04             	sub    esp,0x4
  40131a:	85 c0                	test   eax,eax
  40131c:	74 15                	je     401333 <___gcc_register_frame+0x33>
  40131e:	c7 44 24 04 13 a0 40 	mov    DWORD PTR [esp+0x4],0x40a013
  401325:	00 
  401326:	89 04 24             	mov    DWORD PTR [esp],eax
  401329:	e8 c2 6e 00 00       	call   4081f0 <_GetProcAddress@8>
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
  401358:	e8 8b 6e 00 00       	call   4081e8 <_GetModuleHandleA@4>
  40135d:	ba 00 00 00 00       	mov    edx,0x0
  401362:	83 ec 04             	sub    esp,0x4
  401365:	85 c0                	test   eax,eax
  401367:	74 15                	je     40137e <___gcc_register_frame+0x7e>
  401369:	c7 44 24 04 37 a0 40 	mov    DWORD PTR [esp+0x4],0x40a037
  401370:	00 
  401371:	89 04 24             	mov    DWORD PTR [esp],eax
  401374:	e8 77 6e 00 00       	call   4081f0 <_GetProcAddress@8>
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
  40139d:	e8 46 6e 00 00       	call   4081e8 <_GetModuleHandleA@4>
  4013a2:	ba 00 00 00 00       	mov    edx,0x0
  4013a7:	83 ec 04             	sub    esp,0x4
  4013aa:	85 c0                	test   eax,eax
  4013ac:	74 15                	je     4013c3 <___gcc_deregister_frame+0x33>
  4013ae:	c7 44 24 04 4b a0 40 	mov    DWORD PTR [esp+0x4],0x40a04b
  4013b5:	00 
  4013b6:	89 04 24             	mov    DWORD PTR [esp],eax
  4013b9:	e8 32 6e 00 00       	call   4081f0 <_GetProcAddress@8>
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
  4013e4:	83 ec 1c             	sub    esp,0x1c
  4013e7:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  4013eb:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4013ef:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  4013f6:	00 
  4013f7:	8b 4b 0c             	mov    ecx,DWORD PTR [ebx+0xc]
  4013fa:	8b 5b 10             	mov    ebx,DWORD PTR [ebx+0x10]
  4013fd:	8b 00                	mov    eax,DWORD PTR [eax]
  4013ff:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  401403:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  401407:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40140b:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  40140f:	8b 5b 14             	mov    ebx,DWORD PTR [ebx+0x14]
  401412:	8b 78 04             	mov    edi,DWORD PTR [eax+0x4]
  401415:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
  401418:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  40141c:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  401420:	89 c2                	mov    edx,eax
  401422:	8b 6b 18             	mov    ebp,DWORD PTR [ebx+0x18]
  401425:	8b 5b 1c             	mov    ebx,DWORD PTR [ebx+0x1c]
  401428:	89 e8                	mov    eax,ebp
  40142a:	89 dd                	mov    ebp,ebx
  40142c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401430:	8d 1c 3a             	lea    ebx,[edx+edi*1]
  401433:	89 d6                	mov    esi,edx
  401435:	01 cb                	add    ebx,ecx
  401437:	31 fe                	xor    esi,edi
  401439:	33 5c 24 04          	xor    ebx,DWORD PTR [esp+0x4]
  40143d:	31 ce                	xor    esi,ecx
  40143f:	c1 cb 18             	ror    ebx,0x18
  401442:	01 f3                	add    ebx,esi
  401444:	c1 cb 16             	ror    ebx,0x16
  401447:	8d 34 11             	lea    esi,[ecx+edx*1]
  40144a:	01 de                	add    esi,ebx
  40144c:	31 fe                	xor    esi,edi
  40144e:	89 cf                	mov    edi,ecx
  401450:	31 d7                	xor    edi,edx
  401452:	c1 ce 17             	ror    esi,0x17
  401455:	31 df                	xor    edi,ebx
  401457:	01 f7                	add    edi,esi
  401459:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  40145d:	8d 34 0b             	lea    esi,[ebx+ecx*1]
  401460:	c1 4c 24 04 15       	ror    DWORD PTR [esp+0x4],0x15
  401465:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
  401469:	01 fe                	add    esi,edi
  40146b:	31 d6                	xor    esi,edx
  40146d:	89 da                	mov    edx,ebx
  40146f:	31 ca                	xor    edx,ecx
  401471:	31 fa                	xor    edx,edi
  401473:	c1 ce 16             	ror    esi,0x16
  401476:	01 d6                	add    esi,edx
  401478:	89 34 24             	mov    DWORD PTR [esp],esi
  40147b:	8d 14 1f             	lea    edx,[edi+ebx*1]
  40147e:	c1 0c 24 14          	ror    DWORD PTR [esp],0x14
  401482:	03 14 24             	add    edx,DWORD PTR [esp]
  401485:	31 ca                	xor    edx,ecx
  401487:	89 f9                	mov    ecx,edi
  401489:	8b 7c 24 0c          	mov    edi,DWORD PTR [esp+0xc]
  40148d:	31 d9                	xor    ecx,ebx
  40148f:	89 ce                	mov    esi,ecx
  401491:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
  401494:	c1 ca 14             	ror    edx,0x14
  401497:	89 74 24 14          	mov    DWORD PTR [esp+0x14],esi
  40149b:	31 f1                	xor    ecx,esi
  40149d:	01 ca                	add    edx,ecx
  40149f:	89 f9                	mov    ecx,edi
  4014a1:	89 54 24 10          	mov    DWORD PTR [esp+0x10],edx
  4014a5:	89 fa                	mov    edx,edi
  4014a7:	31 c1                	xor    ecx,eax
  4014a9:	01 c2                	add    edx,eax
  4014ab:	01 ea                	add    edx,ebp
  4014ad:	33 54 24 08          	xor    edx,DWORD PTR [esp+0x8]
  4014b1:	c1 4c 24 10 12       	ror    DWORD PTR [esp+0x10],0x12
  4014b6:	8d 74 05 00          	lea    esi,[ebp+eax*1+0x0]
  4014ba:	c1 ca 12             	ror    edx,0x12
  4014bd:	31 e9                	xor    ecx,ebp
  4014bf:	01 ca                	add    edx,ecx
  4014c1:	89 e9                	mov    ecx,ebp
  4014c3:	c1 ca 10             	ror    edx,0x10
  4014c6:	31 c1                	xor    ecx,eax
  4014c8:	01 d6                	add    esi,edx
  4014ca:	31 d1                	xor    ecx,edx
  4014cc:	31 fe                	xor    esi,edi
  4014ce:	c1 ce 0e             	ror    esi,0xe
  4014d1:	01 ce                	add    esi,ecx
  4014d3:	c1 ce 0c             	ror    esi,0xc
  4014d6:	8d 0c 2a             	lea    ecx,[edx+ebp*1]
  4014d9:	89 f7                	mov    edi,esi
  4014db:	01 f1                	add    ecx,esi
  4014dd:	31 d7                	xor    edi,edx
  4014df:	31 c1                	xor    ecx,eax
  4014e1:	89 d0                	mov    eax,edx
  4014e3:	31 e8                	xor    eax,ebp
  4014e5:	31 f0                	xor    eax,esi
  4014e7:	c1 c9 0c             	ror    ecx,0xc
  4014ea:	01 c1                	add    ecx,eax
  4014ec:	c1 c9 0a             	ror    ecx,0xa
  4014ef:	8d 04 16             	lea    eax,[esi+edx*1]
  4014f2:	01 c8                	add    eax,ecx
  4014f4:	31 e8                	xor    eax,ebp
  4014f6:	89 cd                	mov    ebp,ecx
  4014f8:	31 fd                	xor    ebp,edi
  4014fa:	c1 c8 08             	ror    eax,0x8
  4014fd:	01 e8                	add    eax,ebp
  4014ff:	8b 6c 24 14          	mov    ebp,DWORD PTR [esp+0x14]
  401503:	23 2c 24             	and    ebp,DWORD PTR [esp]
  401506:	23 7c 24 10          	and    edi,DWORD PTR [esp+0x10]
  40150a:	c1 c8 06             	ror    eax,0x6
  40150d:	31 eb                	xor    ebx,ebp
  40150f:	33 6c 24 04          	xor    ebp,DWORD PTR [esp+0x4]
  401513:	31 fe                	xor    esi,edi
  401515:	c1 ce 1d             	ror    esi,0x1d
  401518:	31 d7                	xor    edi,edx
  40151a:	89 f2                	mov    edx,esi
  40151c:	c1 cd 1f             	ror    ebp,0x1f
  40151f:	c1 cb 1e             	ror    ebx,0x1e
  401522:	c1 cf 1b             	ror    edi,0x1b
  401525:	31 ea                	xor    edx,ebp
  401527:	21 ca                	and    edx,ecx
  401529:	31 d6                	xor    esi,edx
  40152b:	31 ea                	xor    edx,ebp
  40152d:	8b 6c 24 10          	mov    ebp,DWORD PTR [esp+0x10]
  401531:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  401535:	89 fa                	mov    edx,edi
  401537:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  40153b:	31 da                	xor    edx,ebx
  40153d:	8b 34 24             	mov    esi,DWORD PTR [esp]
  401540:	21 c2                	and    edx,eax
  401542:	31 d7                	xor    edi,edx
  401544:	31 da                	xor    edx,ebx
  401546:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  40154a:	89 eb                	mov    ebx,ebp
  40154c:	89 c2                	mov    edx,eax
  40154e:	c1 4c 24 04 18       	ror    DWORD PTR [esp+0x4],0x18
  401553:	31 f3                	xor    ebx,esi
  401555:	31 ca                	xor    edx,ecx
  401557:	23 5c 24 04          	and    ebx,DWORD PTR [esp+0x4]
  40155b:	c1 cf 10             	ror    edi,0x10
  40155e:	21 fa                	and    edx,edi
  401560:	31 d0                	xor    eax,edx
  401562:	31 de                	xor    esi,ebx
  401564:	c1 c8 1d             	ror    eax,0x1d
  401567:	31 eb                	xor    ebx,ebp
  401569:	c1 4c 24 08 08       	ror    DWORD PTR [esp+0x8],0x8
  40156e:	89 c5                	mov    ebp,eax
  401570:	c1 cb 1f             	ror    ebx,0x1f
  401573:	31 d1                	xor    ecx,edx
  401575:	31 dd                	xor    ebp,ebx
  401577:	23 6c 24 08          	and    ebp,DWORD PTR [esp+0x8]
  40157b:	c1 c9 1b             	ror    ecx,0x1b
  40157e:	c1 4c 24 0c 1c       	ror    DWORD PTR [esp+0xc],0x1c
  401583:	31 e8                	xor    eax,ebp
  401585:	c1 ce 1e             	ror    esi,0x1e
  401588:	89 c2                	mov    edx,eax
  40158a:	89 e8                	mov    eax,ebp
  40158c:	89 cd                	mov    ebp,ecx
  40158e:	31 f5                	xor    ebp,esi
  401590:	31 d8                	xor    eax,ebx
  401592:	23 6c 24 0c          	and    ebp,DWORD PTR [esp+0xc]
  401596:	31 e9                	xor    ecx,ebp
  401598:	31 f5                	xor    ebp,esi
  40159a:	c1 ca 18             	ror    edx,0x18
  40159d:	c1 c9 10             	ror    ecx,0x10
  4015a0:	c1 c8 08             	ror    eax,0x8
  4015a3:	c1 cd 1c             	ror    ebp,0x1c
  4015a6:	83 6c 24 18 01       	sub    DWORD PTR [esp+0x18],0x1
  4015ab:	0f 85 7f fe ff ff    	jne    401430 <_encrypt+0x50>
  4015b1:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  4015b5:	8b 74 24 04          	mov    esi,DWORD PTR [esp+0x4]
  4015b9:	89 2c 24             	mov    DWORD PTR [esp],ebp
  4015bc:	89 c5                	mov    ebp,eax
  4015be:	89 7b 04             	mov    DWORD PTR [ebx+0x4],edi
  4015c1:	89 d8                	mov    eax,ebx
  4015c3:	89 33                	mov    DWORD PTR [ebx],esi
  4015c5:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  4015c8:	89 4b 0c             	mov    DWORD PTR [ebx+0xc],ecx
  4015cb:	8b 5c 24 08          	mov    ebx,DWORD PTR [esp+0x8]
  4015cf:	89 68 18             	mov    DWORD PTR [eax+0x18],ebp
  4015d2:	89 58 10             	mov    DWORD PTR [eax+0x10],ebx
  4015d5:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
  4015d9:	89 58 14             	mov    DWORD PTR [eax+0x14],ebx
  4015dc:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
  4015df:	89 58 1c             	mov    DWORD PTR [eax+0x1c],ebx
  4015e2:	83 c4 1c             	add    esp,0x1c
  4015e5:	5b                   	pop    ebx
  4015e6:	5e                   	pop    esi
  4015e7:	5f                   	pop    edi
  4015e8:	5d                   	pop    ebp
  4015e9:	c3                   	ret    
  4015ea:	90                   	nop
  4015eb:	90                   	nop
  4015ec:	90                   	nop
  4015ed:	90                   	nop
  4015ee:	90                   	nop
  4015ef:	90                   	nop

004015f0 <___dyn_tls_dtor@12>:
  4015f0:	83 ec 1c             	sub    esp,0x1c
  4015f3:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  4015f7:	85 c0                	test   eax,eax
  4015f9:	74 15                	je     401610 <___dyn_tls_dtor@12+0x20>
  4015fb:	83 f8 03             	cmp    eax,0x3
  4015fe:	74 10                	je     401610 <___dyn_tls_dtor@12+0x20>
  401600:	b8 01 00 00 00       	mov    eax,0x1
  401605:	83 c4 1c             	add    esp,0x1c
  401608:	c2 0c 00             	ret    0xc
  40160b:	90                   	nop
  40160c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401610:	8b 54 24 28          	mov    edx,DWORD PTR [esp+0x28]
  401614:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401618:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  40161c:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  401620:	89 04 24             	mov    DWORD PTR [esp],eax
  401623:	e8 18 0a 00 00       	call   402040 <___mingw_TLScallback>
  401628:	b8 01 00 00 00       	mov    eax,0x1
  40162d:	83 c4 1c             	add    esp,0x1c
  401630:	c2 0c 00             	ret    0xc
  401633:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401639:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401640 <___dyn_tls_init@12>:
  401640:	56                   	push   esi
  401641:	53                   	push   ebx
  401642:	83 ec 14             	sub    esp,0x14
  401645:	83 3d 40 d0 40 00 02 	cmp    DWORD PTR ds:0x40d040,0x2
  40164c:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  401650:	74 0a                	je     40165c <___dyn_tls_init@12+0x1c>
  401652:	c7 05 40 d0 40 00 02 	mov    DWORD PTR ds:0x40d040,0x2
  401659:	00 00 00 
  40165c:	83 f8 02             	cmp    eax,0x2
  40165f:	74 12                	je     401673 <___dyn_tls_init@12+0x33>
  401661:	83 f8 01             	cmp    eax,0x1
  401664:	74 42                	je     4016a8 <___dyn_tls_init@12+0x68>
  401666:	83 c4 14             	add    esp,0x14
  401669:	b8 01 00 00 00       	mov    eax,0x1
  40166e:	5b                   	pop    ebx
  40166f:	5e                   	pop    esi
  401670:	c2 0c 00             	ret    0xc
  401673:	be 14 f0 40 00       	mov    esi,0x40f014
  401678:	81 ee 14 f0 40 00    	sub    esi,0x40f014
  40167e:	c1 fe 02             	sar    esi,0x2
  401681:	85 f6                	test   esi,esi
  401683:	7e e1                	jle    401666 <___dyn_tls_init@12+0x26>
  401685:	31 db                	xor    ebx,ebx
  401687:	8b 04 9d 14 f0 40 00 	mov    eax,DWORD PTR [ebx*4+0x40f014]
  40168e:	85 c0                	test   eax,eax
  401690:	74 02                	je     401694 <___dyn_tls_init@12+0x54>
  401692:	ff d0                	call   eax
  401694:	83 c3 01             	add    ebx,0x1
  401697:	39 f3                	cmp    ebx,esi
  401699:	75 ec                	jne    401687 <___dyn_tls_init@12+0x47>
  40169b:	83 c4 14             	add    esp,0x14
  40169e:	b8 01 00 00 00       	mov    eax,0x1
  4016a3:	5b                   	pop    ebx
  4016a4:	5e                   	pop    esi
  4016a5:	c2 0c 00             	ret    0xc
  4016a8:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4016ac:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  4016b3:	00 
  4016b4:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4016b8:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4016bc:	89 04 24             	mov    DWORD PTR [esp],eax
  4016bf:	e8 7c 09 00 00       	call   402040 <___mingw_TLScallback>
  4016c4:	eb a0                	jmp    401666 <___dyn_tls_init@12+0x26>
  4016c6:	8d 76 00             	lea    esi,[esi+0x0]
  4016c9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004016d0 <___tlregdtor>:
  4016d0:	31 c0                	xor    eax,eax
  4016d2:	c3                   	ret    
  4016d3:	90                   	nop
  4016d4:	90                   	nop
  4016d5:	90                   	nop
  4016d6:	90                   	nop
  4016d7:	90                   	nop
  4016d8:	90                   	nop
  4016d9:	90                   	nop
  4016da:	90                   	nop
  4016db:	90                   	nop
  4016dc:	90                   	nop
  4016dd:	90                   	nop
  4016de:	90                   	nop
  4016df:	90                   	nop

004016e0 <__fpreset>:
  4016e0:	db e3                	fninit 
  4016e2:	c3                   	ret    
  4016e3:	90                   	nop
  4016e4:	90                   	nop
  4016e5:	90                   	nop
  4016e6:	90                   	nop
  4016e7:	90                   	nop
  4016e8:	90                   	nop
  4016e9:	90                   	nop
  4016ea:	90                   	nop
  4016eb:	90                   	nop
  4016ec:	90                   	nop
  4016ed:	90                   	nop
  4016ee:	90                   	nop
  4016ef:	90                   	nop

004016f0 <___cpu_features_init>:
  4016f0:	9c                   	pushf  
  4016f1:	9c                   	pushf  
  4016f2:	58                   	pop    eax
  4016f3:	89 c2                	mov    edx,eax
  4016f5:	35 00 00 20 00       	xor    eax,0x200000
  4016fa:	50                   	push   eax
  4016fb:	9d                   	popf   
  4016fc:	9c                   	pushf  
  4016fd:	58                   	pop    eax
  4016fe:	9d                   	popf   
  4016ff:	31 d0                	xor    eax,edx
  401701:	a9 00 00 20 00       	test   eax,0x200000
  401706:	0f 84 a5 00 00 00    	je     4017b1 <___cpu_features_init+0xc1>
  40170c:	53                   	push   ebx
  40170d:	31 c0                	xor    eax,eax
  40170f:	0f a2                	cpuid  
  401711:	85 c0                	test   eax,eax
  401713:	0f 84 97 00 00 00    	je     4017b0 <___cpu_features_init+0xc0>
  401719:	b8 01 00 00 00       	mov    eax,0x1
  40171e:	0f a2                	cpuid  
  401720:	f6 c6 01             	test   dh,0x1
  401723:	74 07                	je     40172c <___cpu_features_init+0x3c>
  401725:	83 0d 34 d0 40 00 01 	or     DWORD PTR ds:0x40d034,0x1
  40172c:	f6 c6 80             	test   dh,0x80
  40172f:	74 07                	je     401738 <___cpu_features_init+0x48>
  401731:	83 0d 34 d0 40 00 02 	or     DWORD PTR ds:0x40d034,0x2
  401738:	f7 c2 00 00 80 00    	test   edx,0x800000
  40173e:	74 07                	je     401747 <___cpu_features_init+0x57>
  401740:	83 0d 34 d0 40 00 04 	or     DWORD PTR ds:0x40d034,0x4
  401747:	f7 c2 00 00 00 01    	test   edx,0x1000000
  40174d:	74 07                	je     401756 <___cpu_features_init+0x66>
  40174f:	83 0d 34 d0 40 00 08 	or     DWORD PTR ds:0x40d034,0x8
  401756:	f7 c2 00 00 00 02    	test   edx,0x2000000
  40175c:	74 07                	je     401765 <___cpu_features_init+0x75>
  40175e:	83 0d 34 d0 40 00 10 	or     DWORD PTR ds:0x40d034,0x10
  401765:	81 e2 00 00 00 04    	and    edx,0x4000000
  40176b:	74 07                	je     401774 <___cpu_features_init+0x84>
  40176d:	83 0d 34 d0 40 00 20 	or     DWORD PTR ds:0x40d034,0x20
  401774:	f6 c1 01             	test   cl,0x1
  401777:	74 07                	je     401780 <___cpu_features_init+0x90>
  401779:	83 0d 34 d0 40 00 40 	or     DWORD PTR ds:0x40d034,0x40
  401780:	80 e5 20             	and    ch,0x20
  401783:	75 2e                	jne    4017b3 <___cpu_features_init+0xc3>
  401785:	b8 00 00 00 80       	mov    eax,0x80000000
  40178a:	0f a2                	cpuid  
  40178c:	3d 00 00 00 80       	cmp    eax,0x80000000
  401791:	76 1d                	jbe    4017b0 <___cpu_features_init+0xc0>
  401793:	b8 01 00 00 80       	mov    eax,0x80000001
  401798:	0f a2                	cpuid  
  40179a:	85 d2                	test   edx,edx
  40179c:	78 22                	js     4017c0 <___cpu_features_init+0xd0>
  40179e:	81 e2 00 00 00 40    	and    edx,0x40000000
  4017a4:	74 0a                	je     4017b0 <___cpu_features_init+0xc0>
  4017a6:	81 0d 34 d0 40 00 00 	or     DWORD PTR ds:0x40d034,0x200
  4017ad:	02 00 00 
  4017b0:	5b                   	pop    ebx
  4017b1:	f3 c3                	repz ret 
  4017b3:	81 0d 34 d0 40 00 80 	or     DWORD PTR ds:0x40d034,0x80
  4017ba:	00 00 00 
  4017bd:	eb c6                	jmp    401785 <___cpu_features_init+0x95>
  4017bf:	90                   	nop
  4017c0:	81 0d 34 d0 40 00 00 	or     DWORD PTR ds:0x40d034,0x100
  4017c7:	01 00 00 
  4017ca:	eb d2                	jmp    40179e <___cpu_features_init+0xae>
  4017cc:	90                   	nop
  4017cd:	90                   	nop
  4017ce:	90                   	nop
  4017cf:	90                   	nop

004017d0 <__setargv>:
  4017d0:	55                   	push   ebp
  4017d1:	89 e5                	mov    ebp,esp
  4017d3:	57                   	push   edi
  4017d4:	56                   	push   esi
  4017d5:	53                   	push   ebx
  4017d6:	83 ec 4c             	sub    esp,0x4c
  4017d9:	f6 05 04 90 40 00 02 	test   BYTE PTR ds:0x409004,0x2
  4017e0:	0f 84 ba 02 00 00    	je     401aa0 <__setargv+0x2d0>
  4017e6:	e8 0d 6a 00 00       	call   4081f8 <_GetCommandLineA@0>
  4017eb:	89 65 c0             	mov    DWORD PTR [ebp-0x40],esp
  4017ee:	89 04 24             	mov    DWORD PTR [esp],eax
  4017f1:	89 c6                	mov    esi,eax
  4017f3:	e8 28 69 00 00       	call   408120 <_strlen>
  4017f8:	8d 44 00 11          	lea    eax,[eax+eax*1+0x11]
  4017fc:	83 e0 f0             	and    eax,0xfffffff0
  4017ff:	e8 dc 08 00 00       	call   4020e0 <___chkstk_ms>
  401804:	29 c4                	sub    esp,eax
  401806:	8d 44 24 10          	lea    eax,[esp+0x10]
  40180a:	89 c2                	mov    edx,eax
  40180c:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  40180f:	a1 04 90 40 00       	mov    eax,ds:0x409004
  401814:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  40181b:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
  401822:	c7 45 cc 00 00 00 00 	mov    DWORD PTR [ebp-0x34],0x0
  401829:	83 e0 40             	and    eax,0x40
  40182c:	83 f8 01             	cmp    eax,0x1
  40182f:	19 c0                	sbb    eax,eax
  401831:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  401834:	31 c0                	xor    eax,eax
  401836:	81 65 c8 00 c0 ff ff 	and    DWORD PTR [ebp-0x38],0xffffc000
  40183d:	81 45 c8 10 40 00 00 	add    DWORD PTR [ebp-0x38],0x4010
  401844:	89 55 d4             	mov    DWORD PTR [ebp-0x2c],edx
  401847:	83 c6 01             	add    esi,0x1
  40184a:	0f b6 5e ff          	movzx  ebx,BYTE PTR [esi-0x1]
  40184e:	0f be cb             	movsx  ecx,bl
  401851:	85 c9                	test   ecx,ecx
  401853:	74 7b                	je     4018d0 <__setargv+0x100>
  401855:	80 fb 3f             	cmp    bl,0x3f
  401858:	0f 84 13 01 00 00    	je     401971 <__setargv+0x1a1>
  40185e:	0f 8f ec 00 00 00    	jg     401950 <__setargv+0x180>
  401864:	80 fb 27             	cmp    bl,0x27
  401867:	0f 84 e3 01 00 00    	je     401a50 <__setargv+0x280>
  40186d:	80 fb 2a             	cmp    bl,0x2a
  401870:	0f 84 fb 00 00 00    	je     401971 <__setargv+0x1a1>
  401876:	80 fb 22             	cmp    bl,0x22
  401879:	0f 85 36 01 00 00    	jne    4019b5 <__setargv+0x1e5>
  40187f:	89 c3                	mov    ebx,eax
  401881:	d1 fb                	sar    ebx,1
  401883:	0f 84 3e 02 00 00    	je     401ac7 <__setargv+0x2f7>
  401889:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  40188c:	01 d3                	add    ebx,edx
  40188e:	66 90                	xchg   ax,ax
  401890:	83 c2 01             	add    edx,0x1
  401893:	39 da                	cmp    edx,ebx
  401895:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  401899:	75 f5                	jne    401890 <__setargv+0xc0>
  40189b:	a8 01                	test   al,0x1
  40189d:	0f 85 93 00 00 00    	jne    401936 <__setargv+0x166>
  4018a3:	83 7d d0 27          	cmp    DWORD PTR [ebp-0x30],0x27
  4018a7:	0f 84 89 00 00 00    	je     401936 <__setargv+0x166>
  4018ad:	83 c6 01             	add    esi,0x1
  4018b0:	31 c0                	xor    eax,eax
  4018b2:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
  4018b5:	0f b6 5e ff          	movzx  ebx,BYTE PTR [esi-0x1]
  4018b9:	31 4d d0             	xor    DWORD PTR [ebp-0x30],ecx
  4018bc:	c7 45 cc 01 00 00 00 	mov    DWORD PTR [ebp-0x34],0x1
  4018c3:	0f be cb             	movsx  ecx,bl
  4018c6:	85 c9                	test   ecx,ecx
  4018c8:	75 8b                	jne    401855 <__setargv+0x85>
  4018ca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4018d0:	85 c0                	test   eax,eax
  4018d2:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  4018d5:	0f 84 f4 01 00 00    	je     401acf <__setargv+0x2ff>
  4018db:	01 d0                	add    eax,edx
  4018dd:	8d 76 00             	lea    esi,[esi+0x0]
  4018e0:	83 c2 01             	add    edx,0x1
  4018e3:	39 c2                	cmp    edx,eax
  4018e5:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  4018e9:	75 f5                	jne    4018e0 <__setargv+0x110>
  4018eb:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  4018ee:	85 d2                	test   edx,edx
  4018f0:	75 05                	jne    4018f7 <__setargv+0x127>
  4018f2:	39 45 c4             	cmp    DWORD PTR [ebp-0x3c],eax
  4018f5:	73 24                	jae    40191b <__setargv+0x14b>
  4018f7:	c6 00 00             	mov    BYTE PTR [eax],0x0
  4018fa:	8d 45 d8             	lea    eax,[ebp-0x28]
  4018fd:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401901:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  401908:	00 
  401909:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  40190c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401910:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
  401913:	89 04 24             	mov    DWORD PTR [esp],eax
  401916:	e8 f5 13 00 00       	call   402d10 <___mingw_glob>
  40191b:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  40191e:	a3 04 d0 40 00       	mov    ds:0x40d004,eax
  401923:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  401926:	a3 00 d0 40 00       	mov    ds:0x40d000,eax
  40192b:	8b 65 c0             	mov    esp,DWORD PTR [ebp-0x40]
  40192e:	8d 65 f4             	lea    esp,[ebp-0xc]
  401931:	5b                   	pop    ebx
  401932:	5e                   	pop    esi
  401933:	5f                   	pop    edi
  401934:	5d                   	pop    ebp
  401935:	c3                   	ret    
  401936:	8d 43 01             	lea    eax,[ebx+0x1]
  401939:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  40193c:	31 c0                	xor    eax,eax
  40193e:	c6 03 22             	mov    BYTE PTR [ebx],0x22
  401941:	c7 45 cc 01 00 00 00 	mov    DWORD PTR [ebp-0x34],0x1
  401948:	e9 fa fe ff ff       	jmp    401847 <__setargv+0x77>
  40194d:	8d 76 00             	lea    esi,[esi+0x0]
  401950:	80 fb 5c             	cmp    bl,0x5c
  401953:	0f 84 3f 01 00 00    	je     401a98 <__setargv+0x2c8>
  401959:	80 fb 7f             	cmp    bl,0x7f
  40195c:	74 13                	je     401971 <__setargv+0x1a1>
  40195e:	80 fb 5b             	cmp    bl,0x5b
  401961:	75 52                	jne    4019b5 <__setargv+0x1e5>
  401963:	f6 05 04 90 40 00 20 	test   BYTE PTR ds:0x409004,0x20
  40196a:	bf 01 00 00 00       	mov    edi,0x1
  40196f:	74 0a                	je     40197b <__setargv+0x1ab>
  401971:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  401974:	85 d2                	test   edx,edx
  401976:	0f 95 c2             	setne  dl
  401979:	89 d7                	mov    edi,edx
  40197b:	85 c0                	test   eax,eax
  40197d:	0f 84 34 01 00 00    	je     401ab7 <__setargv+0x2e7>
  401983:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  401986:	01 d0                	add    eax,edx
  401988:	83 c2 01             	add    edx,0x1
  40198b:	39 c2                	cmp    edx,eax
  40198d:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  401991:	75 f5                	jne    401988 <__setargv+0x1b8>
  401993:	89 fa                	mov    edx,edi
  401995:	84 d2                	test   dl,dl
  401997:	0f 85 a3 00 00 00    	jne    401a40 <__setargv+0x270>
  40199d:	83 f9 7f             	cmp    ecx,0x7f
  4019a0:	0f 84 9a 00 00 00    	je     401a40 <__setargv+0x270>
  4019a6:	8d 48 01             	lea    ecx,[eax+0x1]
  4019a9:	88 18                	mov    BYTE PTR [eax],bl
  4019ab:	31 c0                	xor    eax,eax
  4019ad:	89 4d d4             	mov    DWORD PTR [ebp-0x2c],ecx
  4019b0:	e9 92 fe ff ff       	jmp    401847 <__setargv+0x77>
  4019b5:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
  4019b8:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  4019bb:	01 c7                	add    edi,eax
  4019bd:	85 c0                	test   eax,eax
  4019bf:	0f 84 fa 00 00 00    	je     401abf <__setargv+0x2ef>
  4019c5:	83 c2 01             	add    edx,0x1
  4019c8:	39 fa                	cmp    edx,edi
  4019ca:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  4019ce:	75 f5                	jne    4019c5 <__setargv+0x1f5>
  4019d0:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  4019d3:	85 c0                	test   eax,eax
  4019d5:	75 59                	jne    401a30 <__setargv+0x260>
  4019d7:	89 0c 24             	mov    DWORD PTR [esp],ecx
  4019da:	e8 49 67 00 00       	call   408128 <_isspace>
  4019df:	85 c0                	test   eax,eax
  4019e1:	74 4d                	je     401a30 <__setargv+0x260>
  4019e3:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  4019e6:	85 c9                	test   ecx,ecx
  4019e8:	75 09                	jne    4019f3 <__setargv+0x223>
  4019ea:	39 7d c4             	cmp    DWORD PTR [ebp-0x3c],edi
  4019ed:	0f 83 ba 00 00 00    	jae    401aad <__setargv+0x2dd>
  4019f3:	8d 45 d8             	lea    eax,[ebp-0x28]
  4019f6:	c6 07 00             	mov    BYTE PTR [edi],0x0
  4019f9:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4019fd:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  401a04:	00 
  401a05:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  401a08:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401a0c:	8b 7d c4             	mov    edi,DWORD PTR [ebp-0x3c]
  401a0f:	89 3c 24             	mov    DWORD PTR [esp],edi
  401a12:	e8 f9 12 00 00       	call   402d10 <___mingw_glob>
  401a17:	31 c0                	xor    eax,eax
  401a19:	83 4d c8 01          	or     DWORD PTR [ebp-0x38],0x1
  401a1d:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
  401a20:	c7 45 cc 00 00 00 00 	mov    DWORD PTR [ebp-0x34],0x0
  401a27:	e9 1b fe ff ff       	jmp    401847 <__setargv+0x77>
  401a2c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401a30:	8d 47 01             	lea    eax,[edi+0x1]
  401a33:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  401a36:	31 c0                	xor    eax,eax
  401a38:	88 1f                	mov    BYTE PTR [edi],bl
  401a3a:	e9 08 fe ff ff       	jmp    401847 <__setargv+0x77>
  401a3f:	90                   	nop
  401a40:	c6 00 7f             	mov    BYTE PTR [eax],0x7f
  401a43:	83 c0 01             	add    eax,0x1
  401a46:	e9 5b ff ff ff       	jmp    4019a6 <__setargv+0x1d6>
  401a4b:	90                   	nop
  401a4c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401a50:	f6 05 04 90 40 00 10 	test   BYTE PTR ds:0x409004,0x10
  401a57:	0f 84 58 ff ff ff    	je     4019b5 <__setargv+0x1e5>
  401a5d:	89 c3                	mov    ebx,eax
  401a5f:	d1 fb                	sar    ebx,1
  401a61:	74 73                	je     401ad6 <__setargv+0x306>
  401a63:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  401a66:	01 d3                	add    ebx,edx
  401a68:	83 c2 01             	add    edx,0x1
  401a6b:	39 da                	cmp    edx,ebx
  401a6d:	c6 42 ff 5c          	mov    BYTE PTR [edx-0x1],0x5c
  401a71:	75 f5                	jne    401a68 <__setargv+0x298>
  401a73:	a8 01                	test   al,0x1
  401a75:	75 0a                	jne    401a81 <__setargv+0x2b1>
  401a77:	83 7d d0 22          	cmp    DWORD PTR [ebp-0x30],0x22
  401a7b:	0f 85 2c fe ff ff    	jne    4018ad <__setargv+0xdd>
  401a81:	8d 43 01             	lea    eax,[ebx+0x1]
  401a84:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  401a87:	31 c0                	xor    eax,eax
  401a89:	c6 03 27             	mov    BYTE PTR [ebx],0x27
  401a8c:	c7 45 cc 01 00 00 00 	mov    DWORD PTR [ebp-0x34],0x1
  401a93:	e9 af fd ff ff       	jmp    401847 <__setargv+0x77>
  401a98:	83 c0 01             	add    eax,0x1
  401a9b:	e9 a7 fd ff ff       	jmp    401847 <__setargv+0x77>
  401aa0:	e8 bb f7 ff ff       	call   401260 <__mingw32_init_mainargs>
  401aa5:	8d 65 f4             	lea    esp,[ebp-0xc]
  401aa8:	5b                   	pop    ebx
  401aa9:	5e                   	pop    esi
  401aaa:	5f                   	pop    edi
  401aab:	5d                   	pop    ebp
  401aac:	c3                   	ret    
  401aad:	89 7d d4             	mov    DWORD PTR [ebp-0x2c],edi
  401ab0:	31 c0                	xor    eax,eax
  401ab2:	e9 90 fd ff ff       	jmp    401847 <__setargv+0x77>
  401ab7:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  401aba:	e9 d4 fe ff ff       	jmp    401993 <__setargv+0x1c3>
  401abf:	8b 7d d4             	mov    edi,DWORD PTR [ebp-0x2c]
  401ac2:	e9 09 ff ff ff       	jmp    4019d0 <__setargv+0x200>
  401ac7:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
  401aca:	e9 cc fd ff ff       	jmp    40189b <__setargv+0xcb>
  401acf:	89 d0                	mov    eax,edx
  401ad1:	e9 15 fe ff ff       	jmp    4018eb <__setargv+0x11b>
  401ad6:	8b 5d d4             	mov    ebx,DWORD PTR [ebp-0x2c]
  401ad9:	eb 98                	jmp    401a73 <__setargv+0x2a3>
  401adb:	90                   	nop
  401adc:	90                   	nop
  401add:	90                   	nop
  401ade:	90                   	nop
  401adf:	90                   	nop

00401ae0 <___report_error>:
  401ae0:	56                   	push   esi
  401ae1:	53                   	push   ebx
  401ae2:	83 ec 14             	sub    esp,0x14
  401ae5:	a1 cc e1 40 00       	mov    eax,ds:0x40e1cc
  401aea:	c7 44 24 08 17 00 00 	mov    DWORD PTR [esp+0x8],0x17
  401af1:	00 
  401af2:	8d 74 24 24          	lea    esi,[esp+0x24]
  401af6:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  401afd:	00 
  401afe:	c7 04 24 84 a0 40 00 	mov    DWORD PTR [esp],0x40a084
  401b05:	8d 58 40             	lea    ebx,[eax+0x40]
  401b08:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  401b0c:	e8 1f 66 00 00       	call   408130 <_fwrite>
  401b11:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  401b15:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  401b19:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401b1c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401b20:	e8 13 66 00 00       	call   408138 <_vfprintf>
  401b25:	e8 16 66 00 00       	call   408140 <_abort>
  401b2a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

00401b30 <___write_memory.part.0>:
  401b30:	55                   	push   ebp
  401b31:	89 e5                	mov    ebp,esp
  401b33:	57                   	push   edi
  401b34:	89 cf                	mov    edi,ecx
  401b36:	56                   	push   esi
  401b37:	89 d6                	mov    esi,edx
  401b39:	53                   	push   ebx
  401b3a:	89 c3                	mov    ebx,eax
  401b3c:	83 ec 4c             	sub    esp,0x4c
  401b3f:	8d 45 cc             	lea    eax,[ebp-0x34]
  401b42:	c7 44 24 08 1c 00 00 	mov    DWORD PTR [esp+0x8],0x1c
  401b49:	00 
  401b4a:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401b4e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401b51:	e8 aa 66 00 00       	call   408200 <_VirtualQuery@12>
  401b56:	83 ec 0c             	sub    esp,0xc
  401b59:	85 c0                	test   eax,eax
  401b5b:	0f 84 9a 00 00 00    	je     401bfb <___write_memory.part.0+0xcb>
  401b61:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  401b64:	83 f8 04             	cmp    eax,0x4
  401b67:	75 18                	jne    401b81 <___write_memory.part.0+0x51>
  401b69:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  401b6d:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  401b71:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401b74:	e8 cf 65 00 00       	call   408148 <_memcpy>
  401b79:	8d 65 f4             	lea    esp,[ebp-0xc]
  401b7c:	5b                   	pop    ebx
  401b7d:	5e                   	pop    esi
  401b7e:	5f                   	pop    edi
  401b7f:	5d                   	pop    ebp
  401b80:	c3                   	ret    
  401b81:	83 f8 40             	cmp    eax,0x40
  401b84:	74 e3                	je     401b69 <___write_memory.part.0+0x39>
  401b86:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  401b89:	8d 55 c8             	lea    edx,[ebp-0x38]
  401b8c:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  401b90:	c7 44 24 08 40 00 00 	mov    DWORD PTR [esp+0x8],0x40
  401b97:	00 
  401b98:	89 55 c4             	mov    DWORD PTR [ebp-0x3c],edx
  401b9b:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401b9f:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  401ba2:	89 04 24             	mov    DWORD PTR [esp],eax
  401ba5:	e8 5e 66 00 00       	call   408208 <_VirtualProtect@16>
  401baa:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
  401bad:	89 4d c0             	mov    DWORD PTR [ebp-0x40],ecx
  401bb0:	83 ec 10             	sub    esp,0x10
  401bb3:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  401bb7:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  401bbb:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401bbe:	e8 85 65 00 00       	call   408148 <_memcpy>
  401bc3:	8b 4d c0             	mov    ecx,DWORD PTR [ebp-0x40]
  401bc6:	83 f9 04             	cmp    ecx,0x4
  401bc9:	74 ae                	je     401b79 <___write_memory.part.0+0x49>
  401bcb:	83 f9 40             	cmp    ecx,0x40
  401bce:	74 a9                	je     401b79 <___write_memory.part.0+0x49>
  401bd0:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  401bd3:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  401bd6:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401bda:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  401bdd:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  401be1:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401be5:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  401be8:	89 04 24             	mov    DWORD PTR [esp],eax
  401beb:	e8 18 66 00 00       	call   408208 <_VirtualProtect@16>
  401bf0:	83 ec 10             	sub    esp,0x10
  401bf3:	8d 65 f4             	lea    esp,[ebp-0xc]
  401bf6:	5b                   	pop    ebx
  401bf7:	5e                   	pop    esi
  401bf8:	5f                   	pop    edi
  401bf9:	5d                   	pop    ebp
  401bfa:	c3                   	ret    
  401bfb:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  401bff:	c7 44 24 04 1c 00 00 	mov    DWORD PTR [esp+0x4],0x1c
  401c06:	00 
  401c07:	c7 04 24 9c a0 40 00 	mov    DWORD PTR [esp],0x40a09c
  401c0e:	e8 cd fe ff ff       	call   401ae0 <___report_error>
  401c13:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401c19:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401c20 <__pei386_runtime_relocator>:
  401c20:	a1 38 d0 40 00       	mov    eax,ds:0x40d038
  401c25:	85 c0                	test   eax,eax
  401c27:	74 07                	je     401c30 <__pei386_runtime_relocator+0x10>
  401c29:	c3                   	ret    
  401c2a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401c30:	b8 40 a7 40 00       	mov    eax,0x40a740
  401c35:	2d 40 a7 40 00       	sub    eax,0x40a740
  401c3a:	83 f8 07             	cmp    eax,0x7
  401c3d:	c7 05 38 d0 40 00 01 	mov    DWORD PTR ds:0x40d038,0x1
  401c44:	00 00 00 
  401c47:	7e e0                	jle    401c29 <__pei386_runtime_relocator+0x9>
  401c49:	57                   	push   edi
  401c4a:	56                   	push   esi
  401c4b:	53                   	push   ebx
  401c4c:	83 ec 20             	sub    esp,0x20
  401c4f:	83 f8 0b             	cmp    eax,0xb
  401c52:	0f 8e de 00 00 00    	jle    401d36 <__pei386_runtime_relocator+0x116>
  401c58:	8b 35 40 a7 40 00    	mov    esi,DWORD PTR ds:0x40a740
  401c5e:	85 f6                	test   esi,esi
  401c60:	0f 85 8a 00 00 00    	jne    401cf0 <__pei386_runtime_relocator+0xd0>
  401c66:	8b 1d 44 a7 40 00    	mov    ebx,DWORD PTR ds:0x40a744
  401c6c:	85 db                	test   ebx,ebx
  401c6e:	0f 85 7c 00 00 00    	jne    401cf0 <__pei386_runtime_relocator+0xd0>
  401c74:	8b 0d 48 a7 40 00    	mov    ecx,DWORD PTR ds:0x40a748
  401c7a:	bb 4c a7 40 00       	mov    ebx,0x40a74c
  401c7f:	85 c9                	test   ecx,ecx
  401c81:	0f 84 b4 00 00 00    	je     401d3b <__pei386_runtime_relocator+0x11b>
  401c87:	bb 40 a7 40 00       	mov    ebx,0x40a740
  401c8c:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  401c8f:	83 f8 01             	cmp    eax,0x1
  401c92:	0f 85 49 01 00 00    	jne    401de1 <__pei386_runtime_relocator+0x1c1>
  401c98:	83 c3 0c             	add    ebx,0xc
  401c9b:	81 fb 40 a7 40 00    	cmp    ebx,0x40a740
  401ca1:	0f 83 88 00 00 00    	jae    401d2f <__pei386_runtime_relocator+0x10f>
  401ca7:	0f b6 53 08          	movzx  edx,BYTE PTR [ebx+0x8]
  401cab:	8b 73 04             	mov    esi,DWORD PTR [ebx+0x4]
  401cae:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  401cb0:	83 fa 10             	cmp    edx,0x10
  401cb3:	8d 86 00 00 40 00    	lea    eax,[esi+0x400000]
  401cb9:	8b b9 00 00 40 00    	mov    edi,DWORD PTR [ecx+0x400000]
  401cbf:	0f 84 8b 00 00 00    	je     401d50 <__pei386_runtime_relocator+0x130>
  401cc5:	83 fa 20             	cmp    edx,0x20
  401cc8:	0f 84 f2 00 00 00    	je     401dc0 <__pei386_runtime_relocator+0x1a0>
  401cce:	83 fa 08             	cmp    edx,0x8
  401cd1:	0f 84 af 00 00 00    	je     401d86 <__pei386_runtime_relocator+0x166>
  401cd7:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  401cdb:	c7 04 24 04 a1 40 00 	mov    DWORD PTR [esp],0x40a104
  401ce2:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [esp+0x1c],0x0
  401ce9:	00 
  401cea:	e8 f1 fd ff ff       	call   401ae0 <___report_error>
  401cef:	90                   	nop
  401cf0:	bb 40 a7 40 00       	mov    ebx,0x40a740
  401cf5:	81 fb 40 a7 40 00    	cmp    ebx,0x40a740
  401cfb:	73 32                	jae    401d2f <__pei386_runtime_relocator+0x10f>
  401cfd:	8d 76 00             	lea    esi,[esi+0x0]
  401d00:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
  401d03:	b9 04 00 00 00       	mov    ecx,0x4
  401d08:	83 c3 08             	add    ebx,0x8
  401d0b:	8d 82 00 00 40 00    	lea    eax,[edx+0x400000]
  401d11:	8b 92 00 00 40 00    	mov    edx,DWORD PTR [edx+0x400000]
  401d17:	03 53 f8             	add    edx,DWORD PTR [ebx-0x8]
  401d1a:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  401d1e:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401d22:	e8 09 fe ff ff       	call   401b30 <___write_memory.part.0>
  401d27:	81 fb 40 a7 40 00    	cmp    ebx,0x40a740
  401d2d:	72 d1                	jb     401d00 <__pei386_runtime_relocator+0xe0>
  401d2f:	83 c4 20             	add    esp,0x20
  401d32:	5b                   	pop    ebx
  401d33:	5e                   	pop    esi
  401d34:	5f                   	pop    edi
  401d35:	c3                   	ret    
  401d36:	bb 40 a7 40 00       	mov    ebx,0x40a740
  401d3b:	8b 13                	mov    edx,DWORD PTR [ebx]
  401d3d:	85 d2                	test   edx,edx
  401d3f:	75 b4                	jne    401cf5 <__pei386_runtime_relocator+0xd5>
  401d41:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  401d44:	85 c0                	test   eax,eax
  401d46:	0f 84 40 ff ff ff    	je     401c8c <__pei386_runtime_relocator+0x6c>
  401d4c:	eb a7                	jmp    401cf5 <__pei386_runtime_relocator+0xd5>
  401d4e:	66 90                	xchg   ax,ax
  401d50:	0f b7 b6 00 00 40 00 	movzx  esi,WORD PTR [esi+0x400000]
  401d57:	66 85 f6             	test   si,si
  401d5a:	0f b7 d6             	movzx  edx,si
  401d5d:	79 06                	jns    401d65 <__pei386_runtime_relocator+0x145>
  401d5f:	81 ca 00 00 ff ff    	or     edx,0xffff0000
  401d65:	29 ca                	sub    edx,ecx
  401d67:	b9 02 00 00 00       	mov    ecx,0x2
  401d6c:	81 ea 00 00 40 00    	sub    edx,0x400000
  401d72:	01 fa                	add    edx,edi
  401d74:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  401d78:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401d7c:	e8 af fd ff ff       	call   401b30 <___write_memory.part.0>
  401d81:	e9 12 ff ff ff       	jmp    401c98 <__pei386_runtime_relocator+0x78>
  401d86:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  401d89:	84 d2                	test   dl,dl
  401d8b:	0f b6 f2             	movzx  esi,dl
  401d8e:	79 06                	jns    401d96 <__pei386_runtime_relocator+0x176>
  401d90:	81 ce 00 ff ff ff    	or     esi,0xffffff00
  401d96:	81 ee 00 00 40 00    	sub    esi,0x400000
  401d9c:	89 f2                	mov    edx,esi
  401d9e:	29 ca                	sub    edx,ecx
  401da0:	b9 01 00 00 00       	mov    ecx,0x1
  401da5:	01 fa                	add    edx,edi
  401da7:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  401dab:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401daf:	e8 7c fd ff ff       	call   401b30 <___write_memory.part.0>
  401db4:	e9 df fe ff ff       	jmp    401c98 <__pei386_runtime_relocator+0x78>
  401db9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401dc0:	81 c1 00 00 40 00    	add    ecx,0x400000
  401dc6:	29 cf                	sub    edi,ecx
  401dc8:	b9 04 00 00 00       	mov    ecx,0x4
  401dcd:	03 38                	add    edi,DWORD PTR [eax]
  401dcf:	8d 54 24 1c          	lea    edx,[esp+0x1c]
  401dd3:	89 7c 24 1c          	mov    DWORD PTR [esp+0x1c],edi
  401dd7:	e8 54 fd ff ff       	call   401b30 <___write_memory.part.0>
  401ddc:	e9 b7 fe ff ff       	jmp    401c98 <__pei386_runtime_relocator+0x78>
  401de1:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401de5:	c7 04 24 d0 a0 40 00 	mov    DWORD PTR [esp],0x40a0d0
  401dec:	e8 ef fc ff ff       	call   401ae0 <___report_error>
  401df1:	90                   	nop
  401df2:	90                   	nop
  401df3:	90                   	nop
  401df4:	90                   	nop
  401df5:	90                   	nop
  401df6:	90                   	nop
  401df7:	90                   	nop
  401df8:	90                   	nop
  401df9:	90                   	nop
  401dfa:	90                   	nop
  401dfb:	90                   	nop
  401dfc:	90                   	nop
  401dfd:	90                   	nop
  401dfe:	90                   	nop
  401dff:	90                   	nop

00401e00 <___do_global_dtors>:
  401e00:	a1 08 90 40 00       	mov    eax,ds:0x409008
  401e05:	8b 00                	mov    eax,DWORD PTR [eax]
  401e07:	85 c0                	test   eax,eax
  401e09:	74 1f                	je     401e2a <___do_global_dtors+0x2a>
  401e0b:	83 ec 0c             	sub    esp,0xc
  401e0e:	66 90                	xchg   ax,ax
  401e10:	ff d0                	call   eax
  401e12:	a1 08 90 40 00       	mov    eax,ds:0x409008
  401e17:	8d 50 04             	lea    edx,[eax+0x4]
  401e1a:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401e1d:	89 15 08 90 40 00    	mov    DWORD PTR ds:0x409008,edx
  401e23:	85 c0                	test   eax,eax
  401e25:	75 e9                	jne    401e10 <___do_global_dtors+0x10>
  401e27:	83 c4 0c             	add    esp,0xc
  401e2a:	f3 c3                	repz ret 
  401e2c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00401e30 <___do_global_ctors>:
  401e30:	53                   	push   ebx
  401e31:	83 ec 18             	sub    esp,0x18
  401e34:	8b 1d 70 85 40 00    	mov    ebx,DWORD PTR ds:0x408570
  401e3a:	83 fb ff             	cmp    ebx,0xffffffff
  401e3d:	74 24                	je     401e63 <___do_global_ctors+0x33>
  401e3f:	85 db                	test   ebx,ebx
  401e41:	74 0f                	je     401e52 <___do_global_ctors+0x22>
  401e43:	ff 14 9d 70 85 40 00 	call   DWORD PTR [ebx*4+0x408570]
  401e4a:	83 eb 01             	sub    ebx,0x1
  401e4d:	8d 76 00             	lea    esi,[esi+0x0]
  401e50:	75 f1                	jne    401e43 <___do_global_ctors+0x13>
  401e52:	c7 04 24 00 1e 40 00 	mov    DWORD PTR [esp],0x401e00
  401e59:	e8 82 f4 ff ff       	call   4012e0 <_atexit>
  401e5e:	83 c4 18             	add    esp,0x18
  401e61:	5b                   	pop    ebx
  401e62:	c3                   	ret    
  401e63:	31 db                	xor    ebx,ebx
  401e65:	eb 02                	jmp    401e69 <___do_global_ctors+0x39>
  401e67:	89 c3                	mov    ebx,eax
  401e69:	8d 43 01             	lea    eax,[ebx+0x1]
  401e6c:	8b 14 85 70 85 40 00 	mov    edx,DWORD PTR [eax*4+0x408570]
  401e73:	85 d2                	test   edx,edx
  401e75:	75 f0                	jne    401e67 <___do_global_ctors+0x37>
  401e77:	eb c6                	jmp    401e3f <___do_global_ctors+0xf>
  401e79:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00401e80 <___main>:
  401e80:	8b 0d 3c d0 40 00    	mov    ecx,DWORD PTR ds:0x40d03c
  401e86:	85 c9                	test   ecx,ecx
  401e88:	74 06                	je     401e90 <___main+0x10>
  401e8a:	f3 c3                	repz ret 
  401e8c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401e90:	c7 05 3c d0 40 00 01 	mov    DWORD PTR ds:0x40d03c,0x1
  401e97:	00 00 00 
  401e9a:	eb 94                	jmp    401e30 <___do_global_ctors>
  401e9c:	90                   	nop
  401e9d:	90                   	nop
  401e9e:	90                   	nop
  401e9f:	90                   	nop

00401ea0 <___mingwthr_run_key_dtors.part.0>:
  401ea0:	55                   	push   ebp
  401ea1:	89 e5                	mov    ebp,esp
  401ea3:	56                   	push   esi
  401ea4:	53                   	push   ebx
  401ea5:	83 ec 10             	sub    esp,0x10
  401ea8:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401eaf:	e8 5c 63 00 00       	call   408210 <_EnterCriticalSection@4>
  401eb4:	8b 1d 44 d0 40 00    	mov    ebx,DWORD PTR ds:0x40d044
  401eba:	83 ec 04             	sub    esp,0x4
  401ebd:	85 db                	test   ebx,ebx
  401ebf:	74 2b                	je     401eec <___mingwthr_run_key_dtors.part.0+0x4c>
  401ec1:	8b 03                	mov    eax,DWORD PTR [ebx]
  401ec3:	89 04 24             	mov    DWORD PTR [esp],eax
  401ec6:	e8 4d 63 00 00       	call   408218 <_TlsGetValue@4>
  401ecb:	83 ec 04             	sub    esp,0x4
  401ece:	89 c6                	mov    esi,eax
  401ed0:	e8 4b 63 00 00       	call   408220 <_GetLastError@0>
  401ed5:	85 c0                	test   eax,eax
  401ed7:	75 0c                	jne    401ee5 <___mingwthr_run_key_dtors.part.0+0x45>
  401ed9:	85 f6                	test   esi,esi
  401edb:	74 08                	je     401ee5 <___mingwthr_run_key_dtors.part.0+0x45>
  401edd:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  401ee0:	89 34 24             	mov    DWORD PTR [esp],esi
  401ee3:	ff d0                	call   eax
  401ee5:	8b 5b 08             	mov    ebx,DWORD PTR [ebx+0x8]
  401ee8:	85 db                	test   ebx,ebx
  401eea:	75 d5                	jne    401ec1 <___mingwthr_run_key_dtors.part.0+0x21>
  401eec:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401ef3:	e8 30 63 00 00       	call   408228 <_LeaveCriticalSection@4>
  401ef8:	83 ec 04             	sub    esp,0x4
  401efb:	8d 65 f8             	lea    esp,[ebp-0x8]
  401efe:	5b                   	pop    ebx
  401eff:	5e                   	pop    esi
  401f00:	5d                   	pop    ebp
  401f01:	c3                   	ret    
  401f02:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401f09:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00401f10 <____w64_mingwthr_add_key_dtor>:
  401f10:	55                   	push   ebp
  401f11:	89 e5                	mov    ebp,esp
  401f13:	56                   	push   esi
  401f14:	31 f6                	xor    esi,esi
  401f16:	53                   	push   ebx
  401f17:	83 ec 10             	sub    esp,0x10
  401f1a:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  401f1f:	85 c0                	test   eax,eax
  401f21:	75 0d                	jne    401f30 <____w64_mingwthr_add_key_dtor+0x20>
  401f23:	8d 65 f8             	lea    esp,[ebp-0x8]
  401f26:	89 f0                	mov    eax,esi
  401f28:	5b                   	pop    ebx
  401f29:	5e                   	pop    esi
  401f2a:	5d                   	pop    ebp
  401f2b:	c3                   	ret    
  401f2c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401f30:	c7 44 24 04 0c 00 00 	mov    DWORD PTR [esp+0x4],0xc
  401f37:	00 
  401f38:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  401f3f:	e8 0c 62 00 00       	call   408150 <_calloc>
  401f44:	85 c0                	test   eax,eax
  401f46:	89 c3                	mov    ebx,eax
  401f48:	74 40                	je     401f8a <____w64_mingwthr_add_key_dtor+0x7a>
  401f4a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401f4d:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401f54:	89 03                	mov    DWORD PTR [ebx],eax
  401f56:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  401f59:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
  401f5c:	e8 af 62 00 00       	call   408210 <_EnterCriticalSection@4>
  401f61:	a1 44 d0 40 00       	mov    eax,ds:0x40d044
  401f66:	89 1d 44 d0 40 00    	mov    DWORD PTR ds:0x40d044,ebx
  401f6c:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  401f6f:	83 ec 04             	sub    esp,0x4
  401f72:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401f79:	e8 aa 62 00 00       	call   408228 <_LeaveCriticalSection@4>
  401f7e:	89 f0                	mov    eax,esi
  401f80:	83 ec 04             	sub    esp,0x4
  401f83:	8d 65 f8             	lea    esp,[ebp-0x8]
  401f86:	5b                   	pop    ebx
  401f87:	5e                   	pop    esi
  401f88:	5d                   	pop    ebp
  401f89:	c3                   	ret    
  401f8a:	be ff ff ff ff       	mov    esi,0xffffffff
  401f8f:	eb 92                	jmp    401f23 <____w64_mingwthr_add_key_dtor+0x13>
  401f91:	eb 0d                	jmp    401fa0 <____w64_mingwthr_remove_key_dtor>
  401f93:	90                   	nop
  401f94:	90                   	nop
  401f95:	90                   	nop
  401f96:	90                   	nop
  401f97:	90                   	nop
  401f98:	90                   	nop
  401f99:	90                   	nop
  401f9a:	90                   	nop
  401f9b:	90                   	nop
  401f9c:	90                   	nop
  401f9d:	90                   	nop
  401f9e:	90                   	nop
  401f9f:	90                   	nop

00401fa0 <____w64_mingwthr_remove_key_dtor>:
  401fa0:	55                   	push   ebp
  401fa1:	89 e5                	mov    ebp,esp
  401fa3:	53                   	push   ebx
  401fa4:	83 ec 14             	sub    esp,0x14
  401fa7:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  401fac:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  401faf:	85 c0                	test   eax,eax
  401fb1:	75 0d                	jne    401fc0 <____w64_mingwthr_remove_key_dtor+0x20>
  401fb3:	31 c0                	xor    eax,eax
  401fb5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  401fb8:	c9                   	leave  
  401fb9:	c3                   	ret    
  401fba:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401fc0:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401fc7:	e8 44 62 00 00       	call   408210 <_EnterCriticalSection@4>
  401fcc:	8b 15 44 d0 40 00    	mov    edx,DWORD PTR ds:0x40d044
  401fd2:	83 ec 04             	sub    esp,0x4
  401fd5:	85 d2                	test   edx,edx
  401fd7:	74 17                	je     401ff0 <____w64_mingwthr_remove_key_dtor+0x50>
  401fd9:	8b 02                	mov    eax,DWORD PTR [edx]
  401fdb:	39 d8                	cmp    eax,ebx
  401fdd:	75 0a                	jne    401fe9 <____w64_mingwthr_remove_key_dtor+0x49>
  401fdf:	eb 44                	jmp    402025 <____w64_mingwthr_remove_key_dtor+0x85>
  401fe1:	8b 08                	mov    ecx,DWORD PTR [eax]
  401fe3:	39 d9                	cmp    ecx,ebx
  401fe5:	74 1f                	je     402006 <____w64_mingwthr_remove_key_dtor+0x66>
  401fe7:	89 c2                	mov    edx,eax
  401fe9:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
  401fec:	85 c0                	test   eax,eax
  401fee:	75 f1                	jne    401fe1 <____w64_mingwthr_remove_key_dtor+0x41>
  401ff0:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  401ff7:	e8 2c 62 00 00       	call   408228 <_LeaveCriticalSection@4>
  401ffc:	83 ec 04             	sub    esp,0x4
  401fff:	31 c0                	xor    eax,eax
  402001:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  402004:	c9                   	leave  
  402005:	c3                   	ret    
  402006:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
  402009:	89 4a 08             	mov    DWORD PTR [edx+0x8],ecx
  40200c:	89 04 24             	mov    DWORD PTR [esp],eax
  40200f:	e8 44 61 00 00       	call   408158 <_free>
  402014:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  40201b:	e8 08 62 00 00       	call   408228 <_LeaveCriticalSection@4>
  402020:	83 ec 04             	sub    esp,0x4
  402023:	eb da                	jmp    401fff <____w64_mingwthr_remove_key_dtor+0x5f>
  402025:	8b 42 08             	mov    eax,DWORD PTR [edx+0x8]
  402028:	a3 44 d0 40 00       	mov    ds:0x40d044,eax
  40202d:	89 d0                	mov    eax,edx
  40202f:	eb db                	jmp    40200c <____w64_mingwthr_remove_key_dtor+0x6c>
  402031:	eb 0d                	jmp    402040 <___mingw_TLScallback>
  402033:	90                   	nop
  402034:	90                   	nop
  402035:	90                   	nop
  402036:	90                   	nop
  402037:	90                   	nop
  402038:	90                   	nop
  402039:	90                   	nop
  40203a:	90                   	nop
  40203b:	90                   	nop
  40203c:	90                   	nop
  40203d:	90                   	nop
  40203e:	90                   	nop
  40203f:	90                   	nop

00402040 <___mingw_TLScallback>:
  402040:	55                   	push   ebp
  402041:	89 e5                	mov    ebp,esp
  402043:	83 ec 18             	sub    esp,0x18
  402046:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  402049:	83 f8 01             	cmp    eax,0x1
  40204c:	74 45                	je     402093 <___mingw_TLScallback+0x53>
  40204e:	72 15                	jb     402065 <___mingw_TLScallback+0x25>
  402050:	83 f8 03             	cmp    eax,0x3
  402053:	75 09                	jne    40205e <___mingw_TLScallback+0x1e>
  402055:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  40205a:	85 c0                	test   eax,eax
  40205c:	75 63                	jne    4020c1 <___mingw_TLScallback+0x81>
  40205e:	b8 01 00 00 00       	mov    eax,0x1
  402063:	c9                   	leave  
  402064:	c3                   	ret    
  402065:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  40206a:	85 c0                	test   eax,eax
  40206c:	75 5a                	jne    4020c8 <___mingw_TLScallback+0x88>
  40206e:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  402073:	83 f8 01             	cmp    eax,0x1
  402076:	75 e6                	jne    40205e <___mingw_TLScallback+0x1e>
  402078:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  40207f:	c7 05 48 d0 40 00 00 	mov    DWORD PTR ds:0x40d048,0x0
  402086:	00 00 00 
  402089:	e8 a2 61 00 00       	call   408230 <_DeleteCriticalSection@4>
  40208e:	83 ec 04             	sub    esp,0x4
  402091:	eb cb                	jmp    40205e <___mingw_TLScallback+0x1e>
  402093:	a1 48 d0 40 00       	mov    eax,ds:0x40d048
  402098:	85 c0                	test   eax,eax
  40209a:	74 14                	je     4020b0 <___mingw_TLScallback+0x70>
  40209c:	c7 05 48 d0 40 00 01 	mov    DWORD PTR ds:0x40d048,0x1
  4020a3:	00 00 00 
  4020a6:	b8 01 00 00 00       	mov    eax,0x1
  4020ab:	c9                   	leave  
  4020ac:	c3                   	ret    
  4020ad:	8d 76 00             	lea    esi,[esi+0x0]
  4020b0:	c7 04 24 4c d0 40 00 	mov    DWORD PTR [esp],0x40d04c
  4020b7:	e8 7c 61 00 00       	call   408238 <_InitializeCriticalSection@4>
  4020bc:	83 ec 04             	sub    esp,0x4
  4020bf:	eb db                	jmp    40209c <___mingw_TLScallback+0x5c>
  4020c1:	e8 da fd ff ff       	call   401ea0 <___mingwthr_run_key_dtors.part.0>
  4020c6:	eb 96                	jmp    40205e <___mingw_TLScallback+0x1e>
  4020c8:	90                   	nop
  4020c9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4020d0:	e8 cb fd ff ff       	call   401ea0 <___mingwthr_run_key_dtors.part.0>
  4020d5:	eb 97                	jmp    40206e <___mingw_TLScallback+0x2e>
  4020d7:	90                   	nop
  4020d8:	90                   	nop
  4020d9:	90                   	nop
  4020da:	90                   	nop
  4020db:	90                   	nop
  4020dc:	90                   	nop
  4020dd:	90                   	nop
  4020de:	90                   	nop
  4020df:	90                   	nop

004020e0 <___chkstk_ms>:
  4020e0:	51                   	push   ecx
  4020e1:	50                   	push   eax
  4020e2:	3d 00 10 00 00       	cmp    eax,0x1000
  4020e7:	8d 4c 24 0c          	lea    ecx,[esp+0xc]
  4020eb:	72 15                	jb     402102 <___chkstk_ms+0x22>
  4020ed:	81 e9 00 10 00 00    	sub    ecx,0x1000
  4020f3:	83 09 00             	or     DWORD PTR [ecx],0x0
  4020f6:	2d 00 10 00 00       	sub    eax,0x1000
  4020fb:	3d 00 10 00 00       	cmp    eax,0x1000
  402100:	77 eb                	ja     4020ed <___chkstk_ms+0xd>
  402102:	29 c1                	sub    ecx,eax
  402104:	83 09 00             	or     DWORD PTR [ecx],0x0
  402107:	58                   	pop    eax
  402108:	59                   	pop    ecx
  402109:	c3                   	ret    
  40210a:	90                   	nop
  40210b:	90                   	nop

0040210c <.text>:
  40210c:	66 90                	xchg   ax,ax
  40210e:	66 90                	xchg   ax,ax

00402110 <_is_glob_pattern>:
  402110:	57                   	push   edi
  402111:	85 c0                	test   eax,eax
  402113:	56                   	push   esi
  402114:	53                   	push   ebx
  402115:	89 c3                	mov    ebx,eax
  402117:	74 44                	je     40215d <_is_glob_pattern+0x4d>
  402119:	0f be 0b             	movsx  ecx,BYTE PTR [ebx]
  40211c:	89 d6                	mov    esi,edx
  40211e:	31 c0                	xor    eax,eax
  402120:	83 e6 20             	and    esi,0x20
  402123:	8d 53 01             	lea    edx,[ebx+0x1]
  402126:	85 c9                	test   ecx,ecx
  402128:	74 33                	je     40215d <_is_glob_pattern+0x4d>
  40212a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402130:	85 f6                	test   esi,esi
  402132:	89 f7                	mov    edi,esi
  402134:	75 05                	jne    40213b <_is_glob_pattern+0x2b>
  402136:	83 f9 7f             	cmp    ecx,0x7f
  402139:	74 45                	je     402180 <_is_glob_pattern+0x70>
  40213b:	85 c0                	test   eax,eax
  40213d:	75 26                	jne    402165 <_is_glob_pattern+0x55>
  40213f:	83 f9 3f             	cmp    ecx,0x3f
  402142:	74 51                	je     402195 <_is_glob_pattern+0x85>
  402144:	83 f9 2a             	cmp    ecx,0x2a
  402147:	74 4c                	je     402195 <_is_glob_pattern+0x85>
  402149:	31 c0                	xor    eax,eax
  40214b:	83 f9 5b             	cmp    ecx,0x5b
  40214e:	0f 94 c0             	sete   al
  402151:	89 d3                	mov    ebx,edx
  402153:	0f be 0b             	movsx  ecx,BYTE PTR [ebx]
  402156:	8d 53 01             	lea    edx,[ebx+0x1]
  402159:	85 c9                	test   ecx,ecx
  40215b:	75 d3                	jne    402130 <_is_glob_pattern+0x20>
  40215d:	31 ff                	xor    edi,edi
  40215f:	89 f8                	mov    eax,edi
  402161:	5b                   	pop    ebx
  402162:	5e                   	pop    esi
  402163:	5f                   	pop    edi
  402164:	c3                   	ret    
  402165:	83 f9 5d             	cmp    ecx,0x5d
  402168:	74 26                	je     402190 <_is_glob_pattern+0x80>
  40216a:	83 f9 21             	cmp    ecx,0x21
  40216d:	89 d3                	mov    ebx,edx
  40216f:	0f 95 c1             	setne  cl
  402172:	0f b6 c9             	movzx  ecx,cl
  402175:	01 c8                	add    eax,ecx
  402177:	eb da                	jmp    402153 <_is_glob_pattern+0x43>
  402179:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402180:	80 7b 01 00          	cmp    BYTE PTR [ebx+0x1],0x0
  402184:	8d 53 02             	lea    edx,[ebx+0x2]
  402187:	75 b2                	jne    40213b <_is_glob_pattern+0x2b>
  402189:	eb d4                	jmp    40215f <_is_glob_pattern+0x4f>
  40218b:	90                   	nop
  40218c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402190:	83 f8 01             	cmp    eax,0x1
  402193:	7e d5                	jle    40216a <_is_glob_pattern+0x5a>
  402195:	bf 01 00 00 00       	mov    edi,0x1
  40219a:	89 f8                	mov    eax,edi
  40219c:	5b                   	pop    ebx
  40219d:	5e                   	pop    esi
  40219e:	5f                   	pop    edi
  40219f:	c3                   	ret    

004021a0 <_glob_in_set>:
  4021a0:	55                   	push   ebp
  4021a1:	57                   	push   edi
  4021a2:	56                   	push   esi
  4021a3:	53                   	push   ebx
  4021a4:	83 ec 04             	sub    esp,0x4
  4021a7:	0f b6 18             	movzx  ebx,BYTE PTR [eax]
  4021aa:	89 0c 24             	mov    DWORD PTR [esp],ecx
  4021ad:	0f be fb             	movsx  edi,bl
  4021b0:	83 ff 5d             	cmp    edi,0x5d
  4021b3:	0f 84 d7 00 00 00    	je     402290 <_glob_in_set+0xf0>
  4021b9:	83 ff 2d             	cmp    edi,0x2d
  4021bc:	89 d9                	mov    ecx,ebx
  4021be:	75 2e                	jne    4021ee <_glob_in_set+0x4e>
  4021c0:	e9 cb 00 00 00       	jmp    402290 <_glob_in_set+0xf0>
  4021c5:	85 db                	test   ebx,ebx
  4021c7:	0f 84 b3 00 00 00    	je     402280 <_glob_in_set+0xe0>
  4021cd:	83 fb 5c             	cmp    ebx,0x5c
  4021d0:	0f 84 aa 00 00 00    	je     402280 <_glob_in_set+0xe0>
  4021d6:	83 fb 2f             	cmp    ebx,0x2f
  4021d9:	0f 84 a1 00 00 00    	je     402280 <_glob_in_set+0xe0>
  4021df:	89 df                	mov    edi,ebx
  4021e1:	0f b6 0e             	movzx  ecx,BYTE PTR [esi]
  4021e4:	89 f0                	mov    eax,esi
  4021e6:	39 d7                	cmp    edi,edx
  4021e8:	0f 84 ca 00 00 00    	je     4022b8 <_glob_in_set+0x118>
  4021ee:	0f be d9             	movsx  ebx,cl
  4021f1:	83 fb 5d             	cmp    ebx,0x5d
  4021f4:	8d 70 01             	lea    esi,[eax+0x1]
  4021f7:	0f 84 83 00 00 00    	je     402280 <_glob_in_set+0xe0>
  4021fd:	83 fb 2d             	cmp    ebx,0x2d
  402200:	75 c3                	jne    4021c5 <_glob_in_set+0x25>
  402202:	0f b6 58 01          	movzx  ebx,BYTE PTR [eax+0x1]
  402206:	80 fb 5d             	cmp    bl,0x5d
  402209:	0f 84 95 00 00 00    	je     4022a4 <_glob_in_set+0x104>
  40220f:	0f be eb             	movsx  ebp,bl
  402212:	85 ed                	test   ebp,ebp
  402214:	89 eb                	mov    ebx,ebp
  402216:	74 68                	je     402280 <_glob_in_set+0xe0>
  402218:	39 ef                	cmp    edi,ebp
  40221a:	8d 70 02             	lea    esi,[eax+0x2]
  40221d:	0f 8d 85 01 00 00    	jge    4023a8 <_glob_in_set+0x208>
  402223:	39 d7                	cmp    edi,edx
  402225:	8d 47 01             	lea    eax,[edi+0x1]
  402228:	75 14                	jne    40223e <_glob_in_set+0x9e>
  40222a:	e9 c1 00 00 00       	jmp    4022f0 <_glob_in_set+0x150>
  40222f:	90                   	nop
  402230:	83 c0 01             	add    eax,0x1
  402233:	8d 78 ff             	lea    edi,[eax-0x1]
  402236:	39 fa                	cmp    edx,edi
  402238:	0f 84 b2 00 00 00    	je     4022f0 <_glob_in_set+0x150>
  40223e:	39 c5                	cmp    ebp,eax
  402240:	7f ee                	jg     402230 <_glob_in_set+0x90>
  402242:	39 c5                	cmp    ebp,eax
  402244:	7d 87                	jge    4021cd <_glob_in_set+0x2d>
  402246:	39 c2                	cmp    edx,eax
  402248:	74 15                	je     40225f <_glob_in_set+0xbf>
  40224a:	83 c5 01             	add    ebp,0x1
  40224d:	8d 76 00             	lea    esi,[esi+0x0]
  402250:	39 e8                	cmp    eax,ebp
  402252:	0f 84 75 ff ff ff    	je     4021cd <_glob_in_set+0x2d>
  402258:	83 e8 01             	sub    eax,0x1
  40225b:	39 c2                	cmp    edx,eax
  40225d:	75 f1                	jne    402250 <_glob_in_set+0xb0>
  40225f:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
  402262:	83 e1 20             	and    ecx,0x20
  402265:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  402268:	3c 5d                	cmp    al,0x5d
  40226a:	0f 84 a3 00 00 00    	je     402313 <_glob_in_set+0x173>
  402270:	3c 7f                	cmp    al,0x7f
  402272:	0f 84 bd 00 00 00    	je     402335 <_glob_in_set+0x195>
  402278:	83 c6 01             	add    esi,0x1
  40227b:	84 c0                	test   al,al
  40227d:	75 e6                	jne    402265 <_glob_in_set+0xc5>
  40227f:	90                   	nop
  402280:	83 c4 04             	add    esp,0x4
  402283:	31 c0                	xor    eax,eax
  402285:	5b                   	pop    ebx
  402286:	5e                   	pop    esi
  402287:	5f                   	pop    edi
  402288:	5d                   	pop    ebp
  402289:	c3                   	ret    
  40228a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402290:	39 d7                	cmp    edi,edx
  402292:	0f 84 b8 00 00 00    	je     402350 <_glob_in_set+0x1b0>
  402298:	0f b6 48 01          	movzx  ecx,BYTE PTR [eax+0x1]
  40229c:	83 c0 01             	add    eax,0x1
  40229f:	e9 4a ff ff ff       	jmp    4021ee <_glob_in_set+0x4e>
  4022a4:	bf 2d 00 00 00       	mov    edi,0x2d
  4022a9:	89 f0                	mov    eax,esi
  4022ab:	39 d7                	cmp    edi,edx
  4022ad:	b9 5d 00 00 00       	mov    ecx,0x5d
  4022b2:	0f 85 36 ff ff ff    	jne    4021ee <_glob_in_set+0x4e>
  4022b8:	8b 14 24             	mov    edx,DWORD PTR [esp]
  4022bb:	83 e2 20             	and    edx,0x20
  4022be:	eb 0a                	jmp    4022ca <_glob_in_set+0x12a>
  4022c0:	83 c0 01             	add    eax,0x1
  4022c3:	84 c9                	test   cl,cl
  4022c5:	74 b9                	je     402280 <_glob_in_set+0xe0>
  4022c7:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
  4022ca:	80 f9 5d             	cmp    cl,0x5d
  4022cd:	0f 84 c2 00 00 00    	je     402395 <_glob_in_set+0x1f5>
  4022d3:	80 f9 7f             	cmp    cl,0x7f
  4022d6:	75 e8                	jne    4022c0 <_glob_in_set+0x120>
  4022d8:	85 d2                	test   edx,edx
  4022da:	0f 85 c0 00 00 00    	jne    4023a0 <_glob_in_set+0x200>
  4022e0:	0f b6 48 01          	movzx  ecx,BYTE PTR [eax+0x1]
  4022e4:	83 c0 01             	add    eax,0x1
  4022e7:	eb d7                	jmp    4022c0 <_glob_in_set+0x120>
  4022e9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4022f0:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
  4022f3:	83 e1 20             	and    ecx,0x20
  4022f6:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  4022f9:	3c 5d                	cmp    al,0x5d
  4022fb:	74 16                	je     402313 <_glob_in_set+0x173>
  4022fd:	3c 7f                	cmp    al,0x7f
  4022ff:	74 1f                	je     402320 <_glob_in_set+0x180>
  402301:	83 c6 01             	add    esi,0x1
  402304:	84 c0                	test   al,al
  402306:	0f 84 74 ff ff ff    	je     402280 <_glob_in_set+0xe0>
  40230c:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  40230f:	3c 5d                	cmp    al,0x5d
  402311:	75 ea                	jne    4022fd <_glob_in_set+0x15d>
  402313:	83 c4 04             	add    esp,0x4
  402316:	5b                   	pop    ebx
  402317:	8d 46 01             	lea    eax,[esi+0x1]
  40231a:	5e                   	pop    esi
  40231b:	5f                   	pop    edi
  40231c:	5d                   	pop    ebp
  40231d:	c3                   	ret    
  40231e:	66 90                	xchg   ax,ax
  402320:	85 c9                	test   ecx,ecx
  402322:	75 0c                	jne    402330 <_glob_in_set+0x190>
  402324:	0f b6 46 01          	movzx  eax,BYTE PTR [esi+0x1]
  402328:	83 c6 01             	add    esi,0x1
  40232b:	eb d4                	jmp    402301 <_glob_in_set+0x161>
  40232d:	8d 76 00             	lea    esi,[esi+0x0]
  402330:	83 c6 01             	add    esi,0x1
  402333:	eb c1                	jmp    4022f6 <_glob_in_set+0x156>
  402335:	85 c9                	test   ecx,ecx
  402337:	75 0c                	jne    402345 <_glob_in_set+0x1a5>
  402339:	0f b6 46 01          	movzx  eax,BYTE PTR [esi+0x1]
  40233d:	83 c6 01             	add    esi,0x1
  402340:	e9 33 ff ff ff       	jmp    402278 <_glob_in_set+0xd8>
  402345:	83 c6 01             	add    esi,0x1
  402348:	e9 18 ff ff ff       	jmp    402265 <_glob_in_set+0xc5>
  40234d:	8d 76 00             	lea    esi,[esi+0x0]
  402350:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
  402353:	83 c0 01             	add    eax,0x1
  402356:	83 e1 20             	and    ecx,0x20
  402359:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402360:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  402363:	80 fa 5d             	cmp    dl,0x5d
  402366:	74 2d                	je     402395 <_glob_in_set+0x1f5>
  402368:	80 fa 7f             	cmp    dl,0x7f
  40236b:	74 13                	je     402380 <_glob_in_set+0x1e0>
  40236d:	83 c0 01             	add    eax,0x1
  402370:	84 d2                	test   dl,dl
  402372:	75 ec                	jne    402360 <_glob_in_set+0x1c0>
  402374:	e9 07 ff ff ff       	jmp    402280 <_glob_in_set+0xe0>
  402379:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402380:	85 c9                	test   ecx,ecx
  402382:	75 0c                	jne    402390 <_glob_in_set+0x1f0>
  402384:	0f b6 50 01          	movzx  edx,BYTE PTR [eax+0x1]
  402388:	83 c0 01             	add    eax,0x1
  40238b:	eb e0                	jmp    40236d <_glob_in_set+0x1cd>
  40238d:	8d 76 00             	lea    esi,[esi+0x0]
  402390:	83 c0 01             	add    eax,0x1
  402393:	eb cb                	jmp    402360 <_glob_in_set+0x1c0>
  402395:	83 c4 04             	add    esp,0x4
  402398:	83 c0 01             	add    eax,0x1
  40239b:	5b                   	pop    ebx
  40239c:	5e                   	pop    esi
  40239d:	5f                   	pop    edi
  40239e:	5d                   	pop    ebp
  40239f:	c3                   	ret    
  4023a0:	83 c0 01             	add    eax,0x1
  4023a3:	e9 1f ff ff ff       	jmp    4022c7 <_glob_in_set+0x127>
  4023a8:	89 f8                	mov    eax,edi
  4023aa:	e9 93 fe ff ff       	jmp    402242 <_glob_in_set+0xa2>
  4023af:	90                   	nop

004023b0 <_glob_initialise>:
  4023b0:	55                   	push   ebp
  4023b1:	57                   	push   edi
  4023b2:	56                   	push   esi
  4023b3:	89 c6                	mov    esi,eax
  4023b5:	53                   	push   ebx
  4023b6:	83 ec 1c             	sub    esp,0x1c
  4023b9:	85 c0                	test   eax,eax
  4023bb:	74 47                	je     402404 <_glob_initialise+0x54>
  4023bd:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4023c0:	8d 78 01             	lea    edi,[eax+0x1]
  4023c3:	8d 2c bd 00 00 00 00 	lea    ebp,[edi*4+0x0]
  4023ca:	89 2c 24             	mov    DWORD PTR [esp],ebp
  4023cd:	e8 8e 5d 00 00       	call   408160 <_malloc>
  4023d2:	89 c3                	mov    ebx,eax
  4023d4:	85 db                	test   ebx,ebx
  4023d6:	89 46 08             	mov    DWORD PTR [esi+0x8],eax
  4023d9:	b8 03 00 00 00       	mov    eax,0x3
  4023de:	74 26                	je     402406 <_glob_initialise+0x56>
  4023e0:	85 ff                	test   edi,edi
  4023e2:	89 fa                	mov    edx,edi
  4023e4:	c7 46 04 00 00 00 00 	mov    DWORD PTR [esi+0x4],0x0
  4023eb:	7e 17                	jle    402404 <_glob_initialise+0x54>
  4023ed:	8d 4d fc             	lea    ecx,[ebp-0x4]
  4023f0:	eb 03                	jmp    4023f5 <_glob_initialise+0x45>
  4023f2:	8b 5e 08             	mov    ebx,DWORD PTR [esi+0x8]
  4023f5:	c7 04 0b 00 00 00 00 	mov    DWORD PTR [ebx+ecx*1],0x0
  4023fc:	83 e9 04             	sub    ecx,0x4
  4023ff:	83 ea 01             	sub    edx,0x1
  402402:	75 ee                	jne    4023f2 <_glob_initialise+0x42>
  402404:	31 c0                	xor    eax,eax
  402406:	83 c4 1c             	add    esp,0x1c
  402409:	5b                   	pop    ebx
  40240a:	5e                   	pop    esi
  40240b:	5f                   	pop    edi
  40240c:	5d                   	pop    ebp
  40240d:	c3                   	ret    
  40240e:	66 90                	xchg   ax,ax

00402410 <_glob_strcmp>:
  402410:	55                   	push   ebp
  402411:	57                   	push   edi
  402412:	89 c7                	mov    edi,eax
  402414:	56                   	push   esi
  402415:	53                   	push   ebx
  402416:	83 ec 2c             	sub    esp,0x2c
  402419:	80 3a 2e             	cmp    BYTE PTR [edx],0x2e
  40241c:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  402420:	0f 84 5a 01 00 00    	je     402580 <_glob_strcmp+0x170>
  402426:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
  402429:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
  40242d:	8d 6a 01             	lea    ebp,[edx+0x1]
  402430:	89 f0                	mov    eax,esi
  402432:	83 e0 20             	and    eax,0x20
  402435:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  402439:	89 f0                	mov    eax,esi
  40243b:	25 00 40 00 00       	and    eax,0x4000
  402440:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  402444:	0f be d1             	movsx  edx,cl
  402447:	85 d2                	test   edx,edx
  402449:	8d 75 ff             	lea    esi,[ebp-0x1]
  40244c:	8d 47 01             	lea    eax,[edi+0x1]
  40244f:	0f 84 70 01 00 00    	je     4025c5 <_glob_strcmp+0x1b5>
  402455:	80 f9 3f             	cmp    cl,0x3f
  402458:	0f 84 e4 00 00 00    	je     402542 <_glob_strcmp+0x132>
  40245e:	80 f9 5b             	cmp    cl,0x5b
  402461:	0f 84 ab 00 00 00    	je     402512 <_glob_strcmp+0x102>
  402467:	80 f9 2a             	cmp    cl,0x2a
  40246a:	74 5c                	je     4024c8 <_glob_strcmp+0xb8>
  40246c:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
  402470:	85 c9                	test   ecx,ecx
  402472:	0f 84 d8 00 00 00    	je     402550 <_glob_strcmp+0x140>
  402478:	89 c7                	mov    edi,eax
  40247a:	0f be 5d ff          	movsx  ebx,BYTE PTR [ebp-0x1]
  40247e:	84 db                	test   bl,bl
  402480:	0f 84 92 01 00 00    	je     402618 <_glob_strcmp+0x208>
  402486:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  40248a:	85 c0                	test   eax,eax
  40248c:	0f 85 de 00 00 00    	jne    402570 <_glob_strcmp+0x160>
  402492:	89 14 24             	mov    DWORD PTR [esp],edx
  402495:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  402499:	e8 ca 5c 00 00       	call   408168 <_tolower>
  40249e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4024a1:	89 c6                	mov    esi,eax
  4024a3:	e8 c0 5c 00 00       	call   408168 <_tolower>
  4024a8:	8b 54 24 1c          	mov    edx,DWORD PTR [esp+0x1c]
  4024ac:	29 c6                	sub    esi,eax
  4024ae:	85 f6                	test   esi,esi
  4024b0:	0f 84 81 00 00 00    	je     402537 <_glob_strcmp+0x127>
  4024b6:	89 d0                	mov    eax,edx
  4024b8:	29 d8                	sub    eax,ebx
  4024ba:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4024c0:	83 c4 2c             	add    esp,0x2c
  4024c3:	5b                   	pop    ebx
  4024c4:	5e                   	pop    esi
  4024c5:	5f                   	pop    edi
  4024c6:	5d                   	pop    ebp
  4024c7:	c3                   	ret    
  4024c8:	0f b6 57 01          	movzx  edx,BYTE PTR [edi+0x1]
  4024cc:	89 c3                	mov    ebx,eax
  4024ce:	80 fa 2a             	cmp    dl,0x2a
  4024d1:	75 0b                	jne    4024de <_glob_strcmp+0xce>
  4024d3:	83 c3 01             	add    ebx,0x1
  4024d6:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
  4024d9:	80 fa 2a             	cmp    dl,0x2a
  4024dc:	74 f5                	je     4024d3 <_glob_strcmp+0xc3>
  4024de:	31 c0                	xor    eax,eax
  4024e0:	84 d2                	test   dl,dl
  4024e2:	74 dc                	je     4024c0 <_glob_strcmp+0xb0>
  4024e4:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
  4024e8:	81 cf 00 00 01 00    	or     edi,0x10000
  4024ee:	eb 09                	jmp    4024f9 <_glob_strcmp+0xe9>
  4024f0:	83 c6 01             	add    esi,0x1
  4024f3:	80 7e ff 00          	cmp    BYTE PTR [esi-0x1],0x0
  4024f7:	74 c7                	je     4024c0 <_glob_strcmp+0xb0>
  4024f9:	89 f9                	mov    ecx,edi
  4024fb:	89 f2                	mov    edx,esi
  4024fd:	89 d8                	mov    eax,ebx
  4024ff:	e8 0c ff ff ff       	call   402410 <_glob_strcmp>
  402504:	85 c0                	test   eax,eax
  402506:	75 e8                	jne    4024f0 <_glob_strcmp+0xe0>
  402508:	83 c4 2c             	add    esp,0x2c
  40250b:	31 c0                	xor    eax,eax
  40250d:	5b                   	pop    ebx
  40250e:	5e                   	pop    esi
  40250f:	5f                   	pop    edi
  402510:	5d                   	pop    ebp
  402511:	c3                   	ret    
  402512:	0f be 55 ff          	movsx  edx,BYTE PTR [ebp-0x1]
  402516:	85 d2                	test   edx,edx
  402518:	0f 84 0b 01 00 00    	je     402629 <_glob_strcmp+0x219>
  40251e:	80 7f 01 21          	cmp    BYTE PTR [edi+0x1],0x21
  402522:	74 7c                	je     4025a0 <_glob_strcmp+0x190>
  402524:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
  402528:	e8 73 fc ff ff       	call   4021a0 <_glob_in_set>
  40252d:	85 c0                	test   eax,eax
  40252f:	89 c7                	mov    edi,eax
  402531:	0f 84 d7 00 00 00    	je     40260e <_glob_strcmp+0x1fe>
  402537:	0f b6 0f             	movzx  ecx,BYTE PTR [edi]
  40253a:	83 c5 01             	add    ebp,0x1
  40253d:	e9 02 ff ff ff       	jmp    402444 <_glob_strcmp+0x34>
  402542:	80 7d ff 00          	cmp    BYTE PTR [ebp-0x1],0x0
  402546:	0f 84 d3 00 00 00    	je     40261f <_glob_strcmp+0x20f>
  40254c:	89 c7                	mov    edi,eax
  40254e:	eb e7                	jmp    402537 <_glob_strcmp+0x127>
  402550:	83 fa 7f             	cmp    edx,0x7f
  402553:	0f 85 1f ff ff ff    	jne    402478 <_glob_strcmp+0x68>
  402559:	0f be 57 01          	movsx  edx,BYTE PTR [edi+0x1]
  40255d:	83 c7 02             	add    edi,0x2
  402560:	85 d2                	test   edx,edx
  402562:	0f 85 12 ff ff ff    	jne    40247a <_glob_strcmp+0x6a>
  402568:	e9 0b ff ff ff       	jmp    402478 <_glob_strcmp+0x68>
  40256d:	8d 76 00             	lea    esi,[esi+0x0]
  402570:	89 d6                	mov    esi,edx
  402572:	29 de                	sub    esi,ebx
  402574:	e9 35 ff ff ff       	jmp    4024ae <_glob_strcmp+0x9e>
  402579:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  402580:	0f be 00             	movsx  eax,BYTE PTR [eax]
  402583:	3c 2e                	cmp    al,0x2e
  402585:	74 32                	je     4025b9 <_glob_strcmp+0x1a9>
  402587:	89 c1                	mov    ecx,eax
  402589:	83 e8 2e             	sub    eax,0x2e
  40258c:	f7 44 24 10 00 00 01 	test   DWORD PTR [esp+0x10],0x10000
  402593:	00 
  402594:	0f 85 8f fe ff ff    	jne    402429 <_glob_strcmp+0x19>
  40259a:	e9 21 ff ff ff       	jmp    4024c0 <_glob_strcmp+0xb0>
  40259f:	90                   	nop
  4025a0:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
  4025a4:	8d 5f 02             	lea    ebx,[edi+0x2]
  4025a7:	89 d8                	mov    eax,ebx
  4025a9:	e8 f2 fb ff ff       	call   4021a0 <_glob_in_set>
  4025ae:	85 c0                	test   eax,eax
  4025b0:	74 1d                	je     4025cf <_glob_strcmp+0x1bf>
  4025b2:	89 df                	mov    edi,ebx
  4025b4:	e9 7e ff ff ff       	jmp    402537 <_glob_strcmp+0x127>
  4025b9:	b9 2e 00 00 00       	mov    ecx,0x2e
  4025be:	66 90                	xchg   ax,ax
  4025c0:	e9 64 fe ff ff       	jmp    402429 <_glob_strcmp+0x19>
  4025c5:	0f be 06             	movsx  eax,BYTE PTR [esi]
  4025c8:	f7 d8                	neg    eax
  4025ca:	e9 f1 fe ff ff       	jmp    4024c0 <_glob_strcmp+0xb0>
  4025cf:	0f b6 47 02          	movzx  eax,BYTE PTR [edi+0x2]
  4025d3:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  4025d7:	3c 5d                	cmp    al,0x5d
  4025d9:	75 0f                	jne    4025ea <_glob_strcmp+0x1da>
  4025db:	eb 56                	jmp    402633 <_glob_strcmp+0x223>
  4025dd:	8d 76 00             	lea    esi,[esi+0x0]
  4025e0:	83 c3 01             	add    ebx,0x1
  4025e3:	84 c0                	test   al,al
  4025e5:	74 27                	je     40260e <_glob_strcmp+0x1fe>
  4025e7:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  4025ea:	3c 5d                	cmp    al,0x5d
  4025ec:	74 16                	je     402604 <_glob_strcmp+0x1f4>
  4025ee:	3c 7f                	cmp    al,0x7f
  4025f0:	75 ee                	jne    4025e0 <_glob_strcmp+0x1d0>
  4025f2:	85 d2                	test   edx,edx
  4025f4:	75 09                	jne    4025ff <_glob_strcmp+0x1ef>
  4025f6:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  4025fa:	83 c3 01             	add    ebx,0x1
  4025fd:	eb e1                	jmp    4025e0 <_glob_strcmp+0x1d0>
  4025ff:	83 c3 01             	add    ebx,0x1
  402602:	eb e3                	jmp    4025e7 <_glob_strcmp+0x1d7>
  402604:	83 c3 01             	add    ebx,0x1
  402607:	89 df                	mov    edi,ebx
  402609:	e9 29 ff ff ff       	jmp    402537 <_glob_strcmp+0x127>
  40260e:	b8 5d 00 00 00       	mov    eax,0x5d
  402613:	e9 a8 fe ff ff       	jmp    4024c0 <_glob_strcmp+0xb0>
  402618:	31 db                	xor    ebx,ebx
  40261a:	e9 97 fe ff ff       	jmp    4024b6 <_glob_strcmp+0xa6>
  40261f:	b8 3f 00 00 00       	mov    eax,0x3f
  402624:	e9 97 fe ff ff       	jmp    4024c0 <_glob_strcmp+0xb0>
  402629:	b8 5b 00 00 00       	mov    eax,0x5b
  40262e:	e9 8d fe ff ff       	jmp    4024c0 <_glob_strcmp+0xb0>
  402633:	8d 5f 03             	lea    ebx,[edi+0x3]
  402636:	0f b6 47 03          	movzx  eax,BYTE PTR [edi+0x3]
  40263a:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  40263e:	eb aa                	jmp    4025ea <_glob_strcmp+0x1da>

00402640 <_glob_registry.part.1>:
  402640:	57                   	push   edi
  402641:	89 c7                	mov    edi,eax
  402643:	56                   	push   esi
  402644:	53                   	push   ebx
  402645:	83 ec 10             	sub    esp,0x10
  402648:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40264b:	8b 4f 0c             	mov    ecx,DWORD PTR [edi+0xc]
  40264e:	85 c0                	test   eax,eax
  402650:	8d 70 ff             	lea    esi,[eax-0x1]
  402653:	8d 1c 8d 00 00 00 00 	lea    ebx,[ecx*4+0x0]
  40265a:	7e 1d                	jle    402679 <_glob_registry.part.1+0x39>
  40265c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402660:	8b 57 08             	mov    edx,DWORD PTR [edi+0x8]
  402663:	83 ee 01             	sub    esi,0x1
  402666:	8b 14 1a             	mov    edx,DWORD PTR [edx+ebx*1]
  402669:	83 c3 04             	add    ebx,0x4
  40266c:	89 14 24             	mov    DWORD PTR [esp],edx
  40266f:	e8 e4 5a 00 00       	call   408158 <_free>
  402674:	83 fe ff             	cmp    esi,0xffffffff
  402677:	75 e7                	jne    402660 <_glob_registry.part.1+0x20>
  402679:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  40267c:	89 04 24             	mov    DWORD PTR [esp],eax
  40267f:	e8 d4 5a 00 00       	call   408158 <_free>
  402684:	83 c4 10             	add    esp,0x10
  402687:	31 c0                	xor    eax,eax
  402689:	5b                   	pop    ebx
  40268a:	5e                   	pop    esi
  40268b:	5f                   	pop    edi
  40268c:	c3                   	ret    
  40268d:	8d 76 00             	lea    esi,[esi+0x0]

00402690 <_glob_store_entry.part.2>:
  402690:	57                   	push   edi
  402691:	56                   	push   esi
  402692:	89 c6                	mov    esi,eax
  402694:	53                   	push   ebx
  402695:	89 d3                	mov    ebx,edx
  402697:	83 ec 10             	sub    esp,0x10
  40269a:	8b 52 04             	mov    edx,DWORD PTR [edx+0x4]
  40269d:	03 53 0c             	add    edx,DWORD PTR [ebx+0xc]
  4026a0:	8d 04 95 08 00 00 00 	lea    eax,[edx*4+0x8]
  4026a7:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4026ab:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4026ae:	89 04 24             	mov    DWORD PTR [esp],eax
  4026b1:	e8 ba 5a 00 00       	call   408170 <_realloc>
  4026b6:	85 c0                	test   eax,eax
  4026b8:	89 c2                	mov    edx,eax
  4026ba:	74 29                	je     4026e5 <_glob_store_entry.part.2+0x55>
  4026bc:	8b 7b 04             	mov    edi,DWORD PTR [ebx+0x4]
  4026bf:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  4026c2:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
  4026c5:	8d 4f 01             	lea    ecx,[edi+0x1]
  4026c8:	01 c7                	add    edi,eax
  4026ca:	01 c8                	add    eax,ecx
  4026cc:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
  4026cf:	89 34 ba             	mov    DWORD PTR [edx+edi*4],esi
  4026d2:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  4026d5:	c7 04 82 00 00 00 00 	mov    DWORD PTR [edx+eax*4],0x0
  4026dc:	83 c4 10             	add    esp,0x10
  4026df:	31 c0                	xor    eax,eax
  4026e1:	5b                   	pop    ebx
  4026e2:	5e                   	pop    esi
  4026e3:	5f                   	pop    edi
  4026e4:	c3                   	ret    
  4026e5:	83 c4 10             	add    esp,0x10
  4026e8:	b8 01 00 00 00       	mov    eax,0x1
  4026ed:	5b                   	pop    ebx
  4026ee:	5e                   	pop    esi
  4026ef:	5f                   	pop    edi
  4026f0:	c3                   	ret    
  4026f1:	eb 0d                	jmp    402700 <_glob_store_entry>
  4026f3:	90                   	nop
  4026f4:	90                   	nop
  4026f5:	90                   	nop
  4026f6:	90                   	nop
  4026f7:	90                   	nop
  4026f8:	90                   	nop
  4026f9:	90                   	nop
  4026fa:	90                   	nop
  4026fb:	90                   	nop
  4026fc:	90                   	nop
  4026fd:	90                   	nop
  4026fe:	90                   	nop
  4026ff:	90                   	nop

00402700 <_glob_store_entry>:
  402700:	85 c0                	test   eax,eax
  402702:	75 0c                	jne    402710 <_glob_store_entry+0x10>
  402704:	b8 01 00 00 00       	mov    eax,0x1
  402709:	c3                   	ret    
  40270a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402710:	85 d2                	test   edx,edx
  402712:	74 f0                	je     402704 <_glob_store_entry+0x4>
  402714:	e9 77 ff ff ff       	jmp    402690 <_glob_store_entry.part.2>
  402719:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00402720 <_glob_store_collated_entries>:
  402720:	56                   	push   esi
  402721:	89 d6                	mov    esi,edx
  402723:	53                   	push   ebx
  402724:	89 c3                	mov    ebx,eax
  402726:	83 ec 14             	sub    esp,0x14
  402729:	8b 00                	mov    eax,DWORD PTR [eax]
  40272b:	85 c0                	test   eax,eax
  40272d:	74 05                	je     402734 <_glob_store_collated_entries+0x14>
  40272f:	e8 ec ff ff ff       	call   402720 <_glob_store_collated_entries>
  402734:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  402737:	89 f2                	mov    edx,esi
  402739:	e8 c2 ff ff ff       	call   402700 <_glob_store_entry>
  40273e:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  402741:	85 c0                	test   eax,eax
  402743:	74 07                	je     40274c <_glob_store_collated_entries+0x2c>
  402745:	89 f2                	mov    edx,esi
  402747:	e8 d4 ff ff ff       	call   402720 <_glob_store_collated_entries>
  40274c:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40274f:	e8 04 5a 00 00       	call   408158 <_free>
  402754:	83 c4 14             	add    esp,0x14
  402757:	5b                   	pop    ebx
  402758:	5e                   	pop    esi
  402759:	c3                   	ret    
  40275a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

00402760 <_glob_match>:
  402760:	55                   	push   ebp
  402761:	89 e5                	mov    ebp,esp
  402763:	57                   	push   edi
  402764:	56                   	push   esi
  402765:	53                   	push   ebx
  402766:	89 c3                	mov    ebx,eax
  402768:	83 ec 6c             	sub    esp,0x6c
  40276b:	89 55 cc             	mov    DWORD PTR [ebp-0x34],edx
  40276e:	89 4d a4             	mov    DWORD PTR [ebp-0x5c],ecx
  402771:	89 04 24             	mov    DWORD PTR [esp],eax
  402774:	e8 a7 59 00 00       	call   408120 <_strlen>
  402779:	8d 50 01             	lea    edx,[eax+0x1]
  40277c:	83 c0 10             	add    eax,0x10
  40277f:	83 e0 f0             	and    eax,0xfffffff0
  402782:	e8 59 f9 ff ff       	call   4020e0 <___chkstk_ms>
  402787:	29 c4                	sub    esp,eax
  402789:	8d 44 24 0c          	lea    eax,[esp+0xc]
  40278d:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  402791:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  402795:	89 04 24             	mov    DWORD PTR [esp],eax
  402798:	e8 ab 59 00 00       	call   408148 <_memcpy>
  40279d:	89 04 24             	mov    DWORD PTR [esp],eax
  4027a0:	e8 4b 06 00 00       	call   402df0 <___mingw_dirname>
  4027a5:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  4027ac:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  4027af:	8d 45 d8             	lea    eax,[ebp-0x28]
  4027b2:	e8 f9 fb ff ff       	call   4023b0 <_glob_initialise>
  4027b7:	85 c0                	test   eax,eax
  4027b9:	74 08                	je     4027c3 <_glob_match+0x63>
  4027bb:	8d 65 f4             	lea    esp,[ebp-0xc]
  4027be:	5b                   	pop    ebx
  4027bf:	5e                   	pop    esi
  4027c0:	5f                   	pop    edi
  4027c1:	5d                   	pop    ebp
  4027c2:	c3                   	ret    
  4027c3:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  4027c6:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  4027c9:	e8 42 f9 ff ff       	call   402110 <_is_glob_pattern>
  4027ce:	85 c0                	test   eax,eax
  4027d0:	0f 84 5a 02 00 00    	je     402a30 <_glob_match+0x2d0>
  4027d6:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  4027d9:	8d 45 d8             	lea    eax,[ebp-0x28]
  4027dc:	89 04 24             	mov    DWORD PTR [esp],eax
  4027df:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  4027e2:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  4027e5:	80 ce 80             	or     dh,0x80
  4027e8:	e8 73 ff ff ff       	call   402760 <_glob_match>
  4027ed:	85 c0                	test   eax,eax
  4027ef:	75 ca                	jne    4027bb <_glob_match+0x5b>
  4027f1:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  4027f5:	3c 5c                	cmp    al,0x5c
  4027f7:	0f 84 5b 03 00 00    	je     402b58 <_glob_match+0x3f8>
  4027fd:	3c 2f                	cmp    al,0x2f
  4027ff:	0f 84 53 03 00 00    	je     402b58 <_glob_match+0x3f8>
  402805:	8b 75 b8             	mov    esi,DWORD PTR [ebp-0x48]
  402808:	bf 30 a1 40 00       	mov    edi,0x40a130
  40280d:	b9 02 00 00 00       	mov    ecx,0x2
  402812:	f3 a6                	repz cmps BYTE PTR ds:[esi],BYTE PTR es:[edi]
  402814:	0f 85 3e 03 00 00    	jne    402b58 <_glob_match+0x3f8>
  40281a:	c6 45 a3 5c          	mov    BYTE PTR [ebp-0x5d],0x5c
  40281e:	f6 45 cc 10          	test   BYTE PTR [ebp-0x34],0x10
  402822:	89 5d c0             	mov    DWORD PTR [ebp-0x40],ebx
  402825:	c7 45 b8 00 00 00 00 	mov    DWORD PTR [ebp-0x48],0x0
  40282c:	0f 85 33 04 00 00    	jne    402c65 <_glob_match+0x505>
  402832:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402835:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  402838:	8b 00                	mov    eax,DWORD PTR [eax]
  40283a:	85 c0                	test   eax,eax
  40283c:	0f 84 71 04 00 00    	je     402cb3 <_glob_match+0x553>
  402842:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  402845:	c7 45 c4 02 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x2
  40284c:	89 cf                	mov    edi,ecx
  40284e:	83 e7 04             	and    edi,0x4
  402851:	89 7d 98             	mov    DWORD PTR [ebp-0x68],edi
  402854:	89 cf                	mov    edi,ecx
  402856:	81 e7 00 80 00 00    	and    edi,0x8000
  40285c:	89 7d d0             	mov    DWORD PTR [ebp-0x30],edi
  40285f:	90                   	nop
  402860:	83 7d c4 01          	cmp    DWORD PTR [ebp-0x3c],0x1
  402864:	0f 84 58 02 00 00    	je     402ac2 <_glob_match+0x362>
  40286a:	89 04 24             	mov    DWORD PTR [esp],eax
  40286d:	e8 ee 0a 00 00       	call   403360 <___mingw_opendir>
  402872:	85 c0                	test   eax,eax
  402874:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  402877:	0f 84 76 03 00 00    	je     402bf3 <_glob_match+0x493>
  40287d:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402880:	85 c0                	test   eax,eax
  402882:	0f 84 bd 03 00 00    	je     402c45 <_glob_match+0x4e5>
  402888:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  40288b:	8b 00                	mov    eax,DWORD PTR [eax]
  40288d:	89 04 24             	mov    DWORD PTR [esp],eax
  402890:	e8 8b 58 00 00       	call   408120 <_strlen>
  402895:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  402898:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  40289b:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
  4028a2:	83 e0 40             	and    eax,0x40
  4028a5:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  4028a8:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4028ab:	89 04 24             	mov    DWORD PTR [esp],eax
  4028ae:	e8 4d 0c 00 00       	call   403500 <___mingw_readdir>
  4028b3:	85 c0                	test   eax,eax
  4028b5:	89 c6                	mov    esi,eax
  4028b7:	0f 84 e8 01 00 00    	je     402aa5 <_glob_match+0x345>
  4028bd:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  4028c0:	85 c0                	test   eax,eax
  4028c2:	74 06                	je     4028ca <_glob_match+0x16a>
  4028c4:	83 7e 08 10          	cmp    DWORD PTR [esi+0x8],0x10
  4028c8:	75 de                	jne    4028a8 <_glob_match+0x148>
  4028ca:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  4028cd:	8d 5e 0c             	lea    ebx,[esi+0xc]
  4028d0:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  4028d3:	89 da                	mov    edx,ebx
  4028d5:	e8 36 fb ff ff       	call   402410 <_glob_strcmp>
  4028da:	85 c0                	test   eax,eax
  4028dc:	75 ca                	jne    4028a8 <_glob_match+0x148>
  4028de:	0f b7 56 06          	movzx  edx,WORD PTR [esi+0x6]
  4028e2:	8b 4d b4             	mov    ecx,DWORD PTR [ebp-0x4c]
  4028e5:	89 65 b0             	mov    DWORD PTR [ebp-0x50],esp
  4028e8:	8d 44 11 11          	lea    eax,[ecx+edx*1+0x11]
  4028ec:	83 e0 f0             	and    eax,0xfffffff0
  4028ef:	e8 ec f7 ff ff       	call   4020e0 <___chkstk_ms>
  4028f4:	29 c4                	sub    esp,eax
  4028f6:	31 c0                	xor    eax,eax
  4028f8:	8d 7c 24 0c          	lea    edi,[esp+0xc]
  4028fc:	85 c9                	test   ecx,ecx
  4028fe:	89 7d ac             	mov    DWORD PTR [ebp-0x54],edi
  402901:	0f 85 ed 01 00 00    	jne    402af4 <_glob_match+0x394>
  402907:	83 c2 01             	add    edx,0x1
  40290a:	01 f8                	add    eax,edi
  40290c:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  402910:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  402914:	89 e3                	mov    ebx,esp
  402916:	89 04 24             	mov    DWORD PTR [esp],eax
  402919:	e8 2a 58 00 00       	call   408148 <_memcpy>
  40291e:	89 3c 24             	mov    DWORD PTR [esp],edi
  402921:	e8 fa 57 00 00       	call   408120 <_strlen>
  402926:	83 c0 10             	add    eax,0x10
  402929:	83 e0 f0             	and    eax,0xfffffff0
  40292c:	e8 af f7 ff ff       	call   4020e0 <___chkstk_ms>
  402931:	8b 75 ac             	mov    esi,DWORD PTR [ebp-0x54]
  402934:	29 c4                	sub    esp,eax
  402936:	8d 4c 24 0c          	lea    ecx,[esp+0xc]
  40293a:	89 ca                	mov    edx,ecx
  40293c:	eb 0f                	jmp    40294d <_glob_match+0x1ed>
  40293e:	66 90                	xchg   ax,ax
  402940:	83 c2 01             	add    edx,0x1
  402943:	83 c6 01             	add    esi,0x1
  402946:	84 c0                	test   al,al
  402948:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  40294b:	74 1b                	je     402968 <_glob_match+0x208>
  40294d:	0f b6 06             	movzx  eax,BYTE PTR [esi]
  402950:	3c 7f                	cmp    al,0x7f
  402952:	75 ec                	jne    402940 <_glob_match+0x1e0>
  402954:	0f b6 46 01          	movzx  eax,BYTE PTR [esi+0x1]
  402958:	83 c6 01             	add    esi,0x1
  40295b:	83 c2 01             	add    edx,0x1
  40295e:	83 c6 01             	add    esi,0x1
  402961:	84 c0                	test   al,al
  402963:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  402966:	75 e5                	jne    40294d <_glob_match+0x1ed>
  402968:	89 0c 24             	mov    DWORD PTR [esp],ecx
  40296b:	e8 70 5b 00 00       	call   4084e0 <_strdup>
  402970:	89 dc                	mov    esp,ebx
  402972:	85 c0                	test   eax,eax
  402974:	89 c6                	mov    esi,eax
  402976:	0f 84 c6 01 00 00    	je     402b42 <_glob_match+0x3e2>
  40297c:	31 c0                	xor    eax,eax
  40297e:	83 7d c4 02          	cmp    DWORD PTR [ebp-0x3c],0x2
  402982:	0f 94 c0             	sete   al
  402985:	83 e8 01             	sub    eax,0x1
  402988:	21 45 c4             	and    DWORD PTR [ebp-0x3c],eax
  40298b:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  40298e:	85 c0                	test   eax,eax
  402990:	0f 85 9d 01 00 00    	jne    402b33 <_glob_match+0x3d3>
  402996:	8b 5d bc             	mov    ebx,DWORD PTR [ebp-0x44]
  402999:	85 db                	test   ebx,ebx
  40299b:	0f 84 bb 02 00 00    	je     402c5c <_glob_match+0x4fc>
  4029a1:	8b 7d cc             	mov    edi,DWORD PTR [ebp-0x34]
  4029a4:	81 e7 00 40 00 00    	and    edi,0x4000
  4029aa:	eb 18                	jmp    4029c4 <_glob_match+0x264>
  4029ac:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4029b0:	e8 c3 57 00 00       	call   408178 <_strcoll>
  4029b5:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  4029b7:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
  4029ba:	85 c0                	test   eax,eax
  4029bc:	7e 22                	jle    4029e0 <_glob_match+0x280>
  4029be:	85 d2                	test   edx,edx
  4029c0:	74 24                	je     4029e6 <_glob_match+0x286>
  4029c2:	89 d3                	mov    ebx,edx
  4029c4:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4029c7:	85 ff                	test   edi,edi
  4029c9:	89 34 24             	mov    DWORD PTR [esp],esi
  4029cc:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4029d0:	75 de                	jne    4029b0 <_glob_match+0x250>
  4029d2:	e8 11 5b 00 00       	call   4084e8 <_stricoll>
  4029d7:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  4029d9:	8b 53 04             	mov    edx,DWORD PTR [ebx+0x4]
  4029dc:	85 c0                	test   eax,eax
  4029de:	7f de                	jg     4029be <_glob_match+0x25e>
  4029e0:	89 ca                	mov    edx,ecx
  4029e2:	85 d2                	test   edx,edx
  4029e4:	75 dc                	jne    4029c2 <_glob_match+0x262>
  4029e6:	89 c1                	mov    ecx,eax
  4029e8:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  4029eb:	c7 04 24 0c 00 00 00 	mov    DWORD PTR [esp],0xc
  4029f2:	e8 69 57 00 00       	call   408160 <_malloc>
  4029f7:	85 c0                	test   eax,eax
  4029f9:	74 22                	je     402a1d <_glob_match+0x2bd>
  4029fb:	85 db                	test   ebx,ebx
  4029fd:	89 70 08             	mov    DWORD PTR [eax+0x8],esi
  402a00:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
  402a07:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  402a0d:	74 0e                	je     402a1d <_glob_match+0x2bd>
  402a0f:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  402a12:	85 c9                	test   ecx,ecx
  402a14:	0f 8e 16 02 00 00    	jle    402c30 <_glob_match+0x4d0>
  402a1a:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
  402a1d:	8b 7d bc             	mov    edi,DWORD PTR [ebp-0x44]
  402a20:	85 ff                	test   edi,edi
  402a22:	0f 84 15 02 00 00    	je     402c3d <_glob_match+0x4dd>
  402a28:	8b 65 b0             	mov    esp,DWORD PTR [ebp-0x50]
  402a2b:	e9 78 fe ff ff       	jmp    4028a8 <_glob_match+0x148>
  402a30:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402a33:	89 e6                	mov    esi,esp
  402a35:	89 04 24             	mov    DWORD PTR [esp],eax
  402a38:	e8 e3 56 00 00       	call   408120 <_strlen>
  402a3d:	83 c0 10             	add    eax,0x10
  402a40:	83 e0 f0             	and    eax,0xfffffff0
  402a43:	e8 98 f6 ff ff       	call   4020e0 <___chkstk_ms>
  402a48:	8b 55 b8             	mov    edx,DWORD PTR [ebp-0x48]
  402a4b:	29 c4                	sub    esp,eax
  402a4d:	8d 7c 24 0c          	lea    edi,[esp+0xc]
  402a51:	89 f9                	mov    ecx,edi
  402a53:	eb 0d                	jmp    402a62 <_glob_match+0x302>
  402a55:	83 c1 01             	add    ecx,0x1
  402a58:	83 c2 01             	add    edx,0x1
  402a5b:	84 c0                	test   al,al
  402a5d:	88 41 ff             	mov    BYTE PTR [ecx-0x1],al
  402a60:	74 1b                	je     402a7d <_glob_match+0x31d>
  402a62:	0f b6 02             	movzx  eax,BYTE PTR [edx]
  402a65:	3c 7f                	cmp    al,0x7f
  402a67:	75 ec                	jne    402a55 <_glob_match+0x2f5>
  402a69:	0f b6 42 01          	movzx  eax,BYTE PTR [edx+0x1]
  402a6d:	83 c2 01             	add    edx,0x1
  402a70:	83 c1 01             	add    ecx,0x1
  402a73:	83 c2 01             	add    edx,0x1
  402a76:	84 c0                	test   al,al
  402a78:	88 41 ff             	mov    BYTE PTR [ecx-0x1],al
  402a7b:	75 e5                	jne    402a62 <_glob_match+0x302>
  402a7d:	89 3c 24             	mov    DWORD PTR [esp],edi
  402a80:	e8 5b 5a 00 00       	call   4084e0 <_strdup>
  402a85:	89 f4                	mov    esp,esi
  402a87:	89 c1                	mov    ecx,eax
  402a89:	b8 01 00 00 00       	mov    eax,0x1
  402a8e:	85 c9                	test   ecx,ecx
  402a90:	0f 84 25 fd ff ff    	je     4027bb <_glob_match+0x5b>
  402a96:	8d 55 d8             	lea    edx,[ebp-0x28]
  402a99:	89 c8                	mov    eax,ecx
  402a9b:	e8 f0 fb ff ff       	call   402690 <_glob_store_entry.part.2>
  402aa0:	e9 48 fd ff ff       	jmp    4027ed <_glob_match+0x8d>
  402aa5:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  402aa8:	89 04 24             	mov    DWORD PTR [esp],eax
  402aab:	e8 a0 0a 00 00       	call   403550 <___mingw_closedir>
  402ab0:	8b 75 bc             	mov    esi,DWORD PTR [ebp-0x44]
  402ab3:	85 f6                	test   esi,esi
  402ab5:	74 0b                	je     402ac2 <_glob_match+0x362>
  402ab7:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402aba:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  402abd:	e8 5e fc ff ff       	call   402720 <_glob_store_collated_entries>
  402ac2:	83 45 c8 04          	add    DWORD PTR [ebp-0x38],0x4
  402ac6:	8b 7d c8             	mov    edi,DWORD PTR [ebp-0x38]
  402ac9:	8b 47 fc             	mov    eax,DWORD PTR [edi-0x4]
  402acc:	89 04 24             	mov    DWORD PTR [esp],eax
  402acf:	e8 84 56 00 00       	call   408158 <_free>
  402ad4:	8b 07                	mov    eax,DWORD PTR [edi]
  402ad6:	85 c0                	test   eax,eax
  402ad8:	0f 85 82 fd ff ff    	jne    402860 <_glob_match+0x100>
  402ade:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402ae1:	89 04 24             	mov    DWORD PTR [esp],eax
  402ae4:	e8 6f 56 00 00       	call   408158 <_free>
  402ae9:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
  402aec:	8d 65 f4             	lea    esp,[ebp-0xc]
  402aef:	5b                   	pop    ebx
  402af0:	5e                   	pop    esi
  402af1:	5f                   	pop    edi
  402af2:	5d                   	pop    ebp
  402af3:	c3                   	ret    
  402af4:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  402af7:	8b 75 b4             	mov    esi,DWORD PTR [ebp-0x4c]
  402afa:	89 55 9c             	mov    DWORD PTR [ebp-0x64],edx
  402afd:	8b 00                	mov    eax,DWORD PTR [eax]
  402aff:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  402b03:	89 3c 24             	mov    DWORD PTR [esp],edi
  402b06:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  402b0a:	e8 39 56 00 00       	call   408148 <_memcpy>
  402b0f:	0f b6 44 34 0b       	movzx  eax,BYTE PTR [esp+esi*1+0xb]
  402b14:	8b 55 9c             	mov    edx,DWORD PTR [ebp-0x64]
  402b17:	3c 5c                	cmp    al,0x5c
  402b19:	74 35                	je     402b50 <_glob_match+0x3f0>
  402b1b:	3c 2f                	cmp    al,0x2f
  402b1d:	74 31                	je     402b50 <_glob_match+0x3f0>
  402b1f:	8b 75 b4             	mov    esi,DWORD PTR [ebp-0x4c]
  402b22:	0f b6 4d a3          	movzx  ecx,BYTE PTR [ebp-0x5d]
  402b26:	89 f0                	mov    eax,esi
  402b28:	83 c0 01             	add    eax,0x1
  402b2b:	88 0c 37             	mov    BYTE PTR [edi+esi*1],cl
  402b2e:	e9 d4 fd ff ff       	jmp    402907 <_glob_match+0x1a7>
  402b33:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402b36:	89 f0                	mov    eax,esi
  402b38:	e8 c3 fb ff ff       	call   402700 <_glob_store_entry>
  402b3d:	e9 e6 fe ff ff       	jmp    402a28 <_glob_match+0x2c8>
  402b42:	c7 45 c4 03 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x3
  402b49:	e9 da fe ff ff       	jmp    402a28 <_glob_match+0x2c8>
  402b4e:	66 90                	xchg   ax,ax
  402b50:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  402b53:	e9 af fd ff ff       	jmp    402907 <_glob_match+0x1a7>
  402b58:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402b5b:	89 04 24             	mov    DWORD PTR [esp],eax
  402b5e:	e8 bd 55 00 00       	call   408120 <_strlen>
  402b63:	01 d8                	add    eax,ebx
  402b65:	39 c3                	cmp    ebx,eax
  402b67:	0f 83 94 01 00 00    	jae    402d01 <_glob_match+0x5a1>
  402b6d:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  402b70:	80 fa 2f             	cmp    dl,0x2f
  402b73:	0f 84 7d 01 00 00    	je     402cf6 <_glob_match+0x596>
  402b79:	80 fa 5c             	cmp    dl,0x5c
  402b7c:	75 1d                	jne    402b9b <_glob_match+0x43b>
  402b7e:	66 90                	xchg   ax,ax
  402b80:	e9 71 01 00 00       	jmp    402cf6 <_glob_match+0x596>
  402b85:	0f b6 40 ff          	movzx  eax,BYTE PTR [eax-0x1]
  402b89:	3c 5c                	cmp    al,0x5c
  402b8b:	0f 84 c0 00 00 00    	je     402c51 <_glob_match+0x4f1>
  402b91:	3c 2f                	cmp    al,0x2f
  402b93:	0f 84 b8 00 00 00    	je     402c51 <_glob_match+0x4f1>
  402b99:	89 d0                	mov    eax,edx
  402b9b:	8d 50 ff             	lea    edx,[eax-0x1]
  402b9e:	39 da                	cmp    edx,ebx
  402ba0:	75 e3                	jne    402b85 <_glob_match+0x425>
  402ba2:	0f b6 40 ff          	movzx  eax,BYTE PTR [eax-0x1]
  402ba6:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
  402ba9:	88 45 a3             	mov    BYTE PTR [ebp-0x5d],al
  402bac:	80 7d a3 5c          	cmp    BYTE PTR [ebp-0x5d],0x5c
  402bb0:	0f 85 0c 01 00 00    	jne    402cc2 <_glob_match+0x562>
  402bb6:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  402bb9:	0f b6 4d a3          	movzx  ecx,BYTE PTR [ebp-0x5d]
  402bbd:	83 c0 01             	add    eax,0x1
  402bc0:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  402bc3:	80 fa 5c             	cmp    dl,0x5c
  402bc6:	75 0d                	jne    402bd5 <_glob_match+0x475>
  402bc8:	83 c0 01             	add    eax,0x1
  402bcb:	89 d1                	mov    ecx,edx
  402bcd:	0f b6 10             	movzx  edx,BYTE PTR [eax]
  402bd0:	80 fa 5c             	cmp    dl,0x5c
  402bd3:	74 f3                	je     402bc8 <_glob_match+0x468>
  402bd5:	80 fa 2f             	cmp    dl,0x2f
  402bd8:	74 ee                	je     402bc8 <_glob_match+0x468>
  402bda:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  402bdd:	88 4d a3             	mov    BYTE PTR [ebp-0x5d],cl
  402be0:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  402be3:	85 c0                	test   eax,eax
  402be5:	0f 85 47 fc ff ff    	jne    402832 <_glob_match+0xd2>
  402beb:	8b 5d c0             	mov    ebx,DWORD PTR [ebp-0x40]
  402bee:	e9 2b fc ff ff       	jmp    40281e <_glob_match+0xbe>
  402bf3:	8b 5d 98             	mov    ebx,DWORD PTR [ebp-0x68]
  402bf6:	85 db                	test   ebx,ebx
  402bf8:	75 28                	jne    402c22 <_glob_match+0x4c2>
  402bfa:	8b 7d a4             	mov    edi,DWORD PTR [ebp-0x5c]
  402bfd:	85 ff                	test   edi,edi
  402bff:	0f 84 bd fe ff ff    	je     402ac2 <_glob_match+0x362>
  402c05:	e8 76 55 00 00       	call   408180 <__errno>
  402c0a:	8b 00                	mov    eax,DWORD PTR [eax]
  402c0c:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  402c10:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  402c13:	8b 00                	mov    eax,DWORD PTR [eax]
  402c15:	89 04 24             	mov    DWORD PTR [esp],eax
  402c18:	ff d7                	call   edi
  402c1a:	85 c0                	test   eax,eax
  402c1c:	0f 84 a0 fe ff ff    	je     402ac2 <_glob_match+0x362>
  402c22:	c7 45 c4 01 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x1
  402c29:	e9 94 fe ff ff       	jmp    402ac2 <_glob_match+0x362>
  402c2e:	66 90                	xchg   ax,ax
  402c30:	8b 7d bc             	mov    edi,DWORD PTR [ebp-0x44]
  402c33:	89 03                	mov    DWORD PTR [ebx],eax
  402c35:	85 ff                	test   edi,edi
  402c37:	0f 85 eb fd ff ff    	jne    402a28 <_glob_match+0x2c8>
  402c3d:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  402c40:	e9 e3 fd ff ff       	jmp    402a28 <_glob_match+0x2c8>
  402c45:	c7 45 b4 00 00 00 00 	mov    DWORD PTR [ebp-0x4c],0x0
  402c4c:	e9 47 fc ff ff       	jmp    402898 <_glob_match+0x138>
  402c51:	89 55 c0             	mov    DWORD PTR [ebp-0x40],edx
  402c54:	88 45 a3             	mov    BYTE PTR [ebp-0x5d],al
  402c57:	e9 50 ff ff ff       	jmp    402bac <_glob_match+0x44c>
  402c5c:	31 db                	xor    ebx,ebx
  402c5e:	31 c9                	xor    ecx,ecx
  402c60:	e9 83 fd ff ff       	jmp    4029e8 <_glob_match+0x288>
  402c65:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
  402c68:	89 d8                	mov    eax,ebx
  402c6a:	e8 a1 f4 ff ff       	call   402110 <_is_glob_pattern>
  402c6f:	85 c0                	test   eax,eax
  402c71:	0f 85 bb fb ff ff    	jne    402832 <_glob_match+0xd2>
  402c77:	89 1c 24             	mov    DWORD PTR [esp],ebx
  402c7a:	89 e6                	mov    esi,esp
  402c7c:	e8 9f 54 00 00       	call   408120 <_strlen>
  402c81:	83 c0 10             	add    eax,0x10
  402c84:	83 e0 f0             	and    eax,0xfffffff0
  402c87:	e8 54 f4 ff ff       	call   4020e0 <___chkstk_ms>
  402c8c:	29 c4                	sub    esp,eax
  402c8e:	8d 4c 24 0c          	lea    ecx,[esp+0xc]
  402c92:	89 ca                	mov    edx,ecx
  402c94:	eb 0d                	jmp    402ca3 <_glob_match+0x543>
  402c96:	83 c2 01             	add    edx,0x1
  402c99:	83 c3 01             	add    ebx,0x1
  402c9c:	84 c0                	test   al,al
  402c9e:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  402ca1:	74 32                	je     402cd5 <_glob_match+0x575>
  402ca3:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  402ca6:	3c 7f                	cmp    al,0x7f
  402ca8:	75 ec                	jne    402c96 <_glob_match+0x536>
  402caa:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  402cae:	83 c3 01             	add    ebx,0x1
  402cb1:	eb e3                	jmp    402c96 <_glob_match+0x536>
  402cb3:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  402cb6:	c7 45 c4 02 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x2
  402cbd:	e9 1f fe ff ff       	jmp    402ae1 <_glob_match+0x381>
  402cc2:	80 7d a3 2f          	cmp    BYTE PTR [ebp-0x5d],0x2f
  402cc6:	0f 84 ea fe ff ff    	je     402bb6 <_glob_match+0x456>
  402ccc:	c6 45 a3 5c          	mov    BYTE PTR [ebp-0x5d],0x5c
  402cd0:	e9 0b ff ff ff       	jmp    402be0 <_glob_match+0x480>
  402cd5:	89 0c 24             	mov    DWORD PTR [esp],ecx
  402cd8:	e8 03 58 00 00       	call   4084e0 <_strdup>
  402cdd:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  402ce0:	89 f4                	mov    esp,esi
  402ce2:	e8 19 fa ff ff       	call   402700 <_glob_store_entry>
  402ce7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402cea:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x0
  402cf1:	e9 eb fd ff ff       	jmp    402ae1 <_glob_match+0x381>
  402cf6:	88 55 a3             	mov    BYTE PTR [ebp-0x5d],dl
  402cf9:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  402cfc:	e9 ab fe ff ff       	jmp    402bac <_glob_match+0x44c>
  402d01:	0f b6 08             	movzx  ecx,BYTE PTR [eax]
  402d04:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  402d07:	88 4d a3             	mov    BYTE PTR [ebp-0x5d],cl
  402d0a:	e9 9d fe ff ff       	jmp    402bac <_glob_match+0x44c>
  402d0f:	90                   	nop

00402d10 <___mingw_glob>:
  402d10:	55                   	push   ebp
  402d11:	89 e5                	mov    ebp,esp
  402d13:	57                   	push   edi
  402d14:	56                   	push   esi
  402d15:	53                   	push   ebx
  402d16:	83 ec 1c             	sub    esp,0x1c
  402d19:	8b 75 14             	mov    esi,DWORD PTR [ebp+0x14]
  402d1c:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  402d1f:	81 3e 32 a1 40 00    	cmp    DWORD PTR [esi],0x40a132
  402d25:	74 0d                	je     402d34 <___mingw_glob+0x24>
  402d27:	89 f0                	mov    eax,esi
  402d29:	e8 82 f6 ff ff       	call   4023b0 <_glob_initialise>
  402d2e:	c7 06 32 a1 40 00    	mov    DWORD PTR [esi],0x40a132
  402d34:	89 34 24             	mov    DWORD PTR [esp],esi
  402d37:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
  402d3a:	89 d8                	mov    eax,ebx
  402d3c:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  402d3f:	e8 1c fa ff ff       	call   402760 <_glob_match>
  402d44:	83 f8 02             	cmp    eax,0x2
  402d47:	89 c7                	mov    edi,eax
  402d49:	74 0a                	je     402d55 <___mingw_glob+0x45>
  402d4b:	8d 65 f4             	lea    esp,[ebp-0xc]
  402d4e:	89 f8                	mov    eax,edi
  402d50:	5b                   	pop    ebx
  402d51:	5e                   	pop    esi
  402d52:	5f                   	pop    edi
  402d53:	5d                   	pop    ebp
  402d54:	c3                   	ret    
  402d55:	f6 45 0c 10          	test   BYTE PTR [ebp+0xc],0x10
  402d59:	74 f0                	je     402d4b <___mingw_glob+0x3b>
  402d5b:	89 65 e4             	mov    DWORD PTR [ebp-0x1c],esp
  402d5e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  402d61:	e8 ba 53 00 00       	call   408120 <_strlen>
  402d66:	83 c0 10             	add    eax,0x10
  402d69:	83 e0 f0             	and    eax,0xfffffff0
  402d6c:	e8 6f f3 ff ff       	call   4020e0 <___chkstk_ms>
  402d71:	29 c4                	sub    esp,eax
  402d73:	8d 4c 24 04          	lea    ecx,[esp+0x4]
  402d77:	89 ca                	mov    edx,ecx
  402d79:	eb 12                	jmp    402d8d <___mingw_glob+0x7d>
  402d7b:	90                   	nop
  402d7c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402d80:	83 c2 01             	add    edx,0x1
  402d83:	83 c3 01             	add    ebx,0x1
  402d86:	84 c0                	test   al,al
  402d88:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  402d8b:	74 1b                	je     402da8 <___mingw_glob+0x98>
  402d8d:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  402d90:	3c 7f                	cmp    al,0x7f
  402d92:	75 ec                	jne    402d80 <___mingw_glob+0x70>
  402d94:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  402d98:	83 c3 01             	add    ebx,0x1
  402d9b:	83 c2 01             	add    edx,0x1
  402d9e:	83 c3 01             	add    ebx,0x1
  402da1:	84 c0                	test   al,al
  402da3:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
  402da6:	75 e5                	jne    402d8d <___mingw_glob+0x7d>
  402da8:	89 0c 24             	mov    DWORD PTR [esp],ecx
  402dab:	e8 30 57 00 00       	call   4084e0 <_strdup>
  402db0:	8b 65 e4             	mov    esp,DWORD PTR [ebp-0x1c]
  402db3:	89 f2                	mov    edx,esi
  402db5:	e8 46 f9 ff ff       	call   402700 <_glob_store_entry>
  402dba:	8d 65 f4             	lea    esp,[ebp-0xc]
  402dbd:	89 f8                	mov    eax,edi
  402dbf:	5b                   	pop    ebx
  402dc0:	5e                   	pop    esi
  402dc1:	5f                   	pop    edi
  402dc2:	5d                   	pop    ebp
  402dc3:	c3                   	ret    
  402dc4:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  402dca:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00402dd0 <___mingw_globfree>:
  402dd0:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  402dd4:	81 38 32 a1 40 00    	cmp    DWORD PTR [eax],0x40a132
  402dda:	74 04                	je     402de0 <___mingw_globfree+0x10>
  402ddc:	f3 c3                	repz ret 
  402dde:	66 90                	xchg   ax,ax
  402de0:	e9 5b f8 ff ff       	jmp    402640 <_glob_registry.part.1>
  402de5:	90                   	nop
  402de6:	90                   	nop
  402de7:	90                   	nop
  402de8:	90                   	nop
  402de9:	90                   	nop
  402dea:	90                   	nop
  402deb:	90                   	nop
  402dec:	90                   	nop
  402ded:	90                   	nop
  402dee:	90                   	nop
  402def:	90                   	nop

00402df0 <___mingw_dirname>:
  402df0:	55                   	push   ebp
  402df1:	89 e5                	mov    ebp,esp
  402df3:	57                   	push   edi
  402df4:	56                   	push   esi
  402df5:	53                   	push   ebx
  402df6:	83 ec 3c             	sub    esp,0x3c
  402df9:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  402dfc:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  402e03:	00 
  402e04:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  402e0b:	e8 78 53 00 00       	call   408188 <_setlocale>
  402e10:	85 c0                	test   eax,eax
  402e12:	89 c3                	mov    ebx,eax
  402e14:	74 0a                	je     402e20 <___mingw_dirname+0x30>
  402e16:	89 04 24             	mov    DWORD PTR [esp],eax
  402e19:	e8 c2 56 00 00       	call   4084e0 <_strdup>
  402e1e:	89 c3                	mov    ebx,eax
  402e20:	c7 44 24 04 44 a1 40 	mov    DWORD PTR [esp+0x4],0x40a144
  402e27:	00 
  402e28:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  402e2f:	e8 54 53 00 00       	call   408188 <_setlocale>
  402e34:	85 f6                	test   esi,esi
  402e36:	74 05                	je     402e3d <___mingw_dirname+0x4d>
  402e38:	80 3e 00             	cmp    BYTE PTR [esi],0x0
  402e3b:	75 73                	jne    402eb0 <___mingw_dirname+0xc0>
  402e3d:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  402e44:	00 
  402e45:	c7 44 24 04 46 a1 40 	mov    DWORD PTR [esp+0x4],0x40a146
  402e4c:	00 
  402e4d:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  402e54:	e8 37 53 00 00       	call   408190 <_wcstombs>
  402e59:	8d 70 01             	lea    esi,[eax+0x1]
  402e5c:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  402e60:	a1 68 d0 40 00       	mov    eax,ds:0x40d068
  402e65:	89 04 24             	mov    DWORD PTR [esp],eax
  402e68:	e8 03 53 00 00       	call   408170 <_realloc>
  402e6d:	a3 68 d0 40 00       	mov    ds:0x40d068,eax
  402e72:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  402e76:	c7 44 24 04 46 a1 40 	mov    DWORD PTR [esp+0x4],0x40a146
  402e7d:	00 
  402e7e:	89 04 24             	mov    DWORD PTR [esp],eax
  402e81:	e8 0a 53 00 00       	call   408190 <_wcstombs>
  402e86:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  402e8a:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  402e91:	e8 f2 52 00 00       	call   408188 <_setlocale>
  402e96:	89 1c 24             	mov    DWORD PTR [esp],ebx
  402e99:	e8 ba 52 00 00       	call   408158 <_free>
  402e9e:	a1 68 d0 40 00       	mov    eax,ds:0x40d068
  402ea3:	8d 65 f4             	lea    esp,[ebp-0xc]
  402ea6:	5b                   	pop    ebx
  402ea7:	5e                   	pop    esi
  402ea8:	5f                   	pop    edi
  402ea9:	5d                   	pop    ebp
  402eaa:	c3                   	ret    
  402eab:	90                   	nop
  402eac:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  402eb0:	89 65 d4             	mov    DWORD PTR [ebp-0x2c],esp
  402eb3:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  402eba:	00 
  402ebb:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  402ebf:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  402ec6:	e8 cd 52 00 00       	call   408198 <_mbstowcs>
  402ecb:	89 c2                	mov    edx,eax
  402ecd:	8d 44 00 12          	lea    eax,[eax+eax*1+0x12]
  402ed1:	83 e0 f0             	and    eax,0xfffffff0
  402ed4:	e8 07 f2 ff ff       	call   4020e0 <___chkstk_ms>
  402ed9:	29 c4                	sub    esp,eax
  402edb:	8d 44 24 0d          	lea    eax,[esp+0xd]
  402edf:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  402ee2:	d1 6d e4             	shr    DWORD PTR [ebp-0x1c],1
  402ee5:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  402ee8:	01 c0                	add    eax,eax
  402eea:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  402eed:	89 c7                	mov    edi,eax
  402eef:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  402ef3:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  402ef7:	89 04 24             	mov    DWORD PTR [esp],eax
  402efa:	e8 99 52 00 00       	call   408198 <_mbstowcs>
  402eff:	31 c9                	xor    ecx,ecx
  402f01:	66 89 0c 47          	mov    WORD PTR [edi+eax*2],cx
  402f05:	83 f8 01             	cmp    eax,0x1
  402f08:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  402f0b:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  402f0e:	0f b7 04 00          	movzx  eax,WORD PTR [eax+eax*1]
  402f12:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
  402f16:	0f 86 f2 00 00 00    	jbe    40300e <___mingw_dirname+0x21e>
  402f1c:	66 83 f8 5c          	cmp    ax,0x5c
  402f20:	74 0a                	je     402f2c <___mingw_dirname+0x13c>
  402f22:	66 83 f8 2f          	cmp    ax,0x2f
  402f26:	0f 85 0a 01 00 00    	jne    403036 <___mingw_dirname+0x246>
  402f2c:	8b 7d e0             	mov    edi,DWORD PTR [ebp-0x20]
  402f2f:	89 7d dc             	mov    DWORD PTR [ebp-0x24],edi
  402f32:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
  402f35:	66 3b 44 3f 02       	cmp    ax,WORD PTR [edi+edi*1+0x2]
  402f3a:	0f 84 4f 02 00 00    	je     40318f <___mingw_dirname+0x39f>
  402f40:	0f b7 45 da          	movzx  eax,WORD PTR [ebp-0x26]
  402f44:	66 85 c0             	test   ax,ax
  402f47:	0f 84 fa 01 00 00    	je     403147 <___mingw_dirname+0x357>
  402f4d:	8b 55 dc             	mov    edx,DWORD PTR [ebp-0x24]
  402f50:	89 d7                	mov    edi,edx
  402f52:	eb 14                	jmp    402f68 <___mingw_dirname+0x178>
  402f54:	66 83 f8 2f          	cmp    ax,0x2f
  402f58:	74 20                	je     402f7a <___mingw_dirname+0x18a>
  402f5a:	0f b7 42 02          	movzx  eax,WORD PTR [edx+0x2]
  402f5e:	8d 4a 02             	lea    ecx,[edx+0x2]
  402f61:	66 85 c0             	test   ax,ax
  402f64:	74 36                	je     402f9c <___mingw_dirname+0x1ac>
  402f66:	89 ca                	mov    edx,ecx
  402f68:	66 83 f8 5c          	cmp    ax,0x5c
  402f6c:	75 e6                	jne    402f54 <___mingw_dirname+0x164>
  402f6e:	0f b7 02             	movzx  eax,WORD PTR [edx]
  402f71:	66 83 f8 5c          	cmp    ax,0x5c
  402f75:	75 0c                	jne    402f83 <___mingw_dirname+0x193>
  402f77:	83 c2 02             	add    edx,0x2
  402f7a:	0f b7 02             	movzx  eax,WORD PTR [edx]
  402f7d:	66 83 f8 5c          	cmp    ax,0x5c
  402f81:	74 f4                	je     402f77 <___mingw_dirname+0x187>
  402f83:	66 83 f8 2f          	cmp    ax,0x2f
  402f87:	74 ee                	je     402f77 <___mingw_dirname+0x187>
  402f89:	66 85 c0             	test   ax,ax
  402f8c:	74 0e                	je     402f9c <___mingw_dirname+0x1ac>
  402f8e:	0f b7 42 02          	movzx  eax,WORD PTR [edx+0x2]
  402f92:	89 d7                	mov    edi,edx
  402f94:	8d 4a 02             	lea    ecx,[edx+0x2]
  402f97:	66 85 c0             	test   ax,ax
  402f9a:	75 ca                	jne    402f66 <___mingw_dirname+0x176>
  402f9c:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  402f9f:	39 f9                	cmp    ecx,edi
  402fa1:	72 7e                	jb     403021 <___mingw_dirname+0x231>
  402fa3:	66 83 7d da 5c       	cmp    WORD PTR [ebp-0x26],0x5c
  402fa8:	74 0b                	je     402fb5 <___mingw_dirname+0x1c5>
  402faa:	66 83 7d da 2f       	cmp    WORD PTR [ebp-0x26],0x2f
  402faf:	0f 85 ba 01 00 00    	jne    40316f <___mingw_dirname+0x37f>
  402fb5:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  402fb8:	83 c0 02             	add    eax,0x2
  402fbb:	31 d2                	xor    edx,edx
  402fbd:	66 89 10             	mov    WORD PTR [eax],dx
  402fc0:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  402fc7:	00 
  402fc8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402fcb:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  402fd2:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  402fd6:	e8 b5 51 00 00       	call   408190 <_wcstombs>
  402fdb:	8d 78 01             	lea    edi,[eax+0x1]
  402fde:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  402fe2:	a1 68 d0 40 00       	mov    eax,ds:0x40d068
  402fe7:	89 04 24             	mov    DWORD PTR [esp],eax
  402fea:	e8 81 51 00 00       	call   408170 <_realloc>
  402fef:	a3 68 d0 40 00       	mov    ds:0x40d068,eax
  402ff4:	89 c6                	mov    esi,eax
  402ff6:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  402ffa:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  402ffd:	89 34 24             	mov    DWORD PTR [esp],esi
  403000:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  403004:	e8 87 51 00 00       	call   408190 <_wcstombs>
  403009:	e9 e9 00 00 00       	jmp    4030f7 <___mingw_dirname+0x307>
  40300e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  403011:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  403014:	e9 27 ff ff ff       	jmp    402f40 <___mingw_dirname+0x150>
  403019:	66 83 fa 2f          	cmp    dx,0x2f
  40301d:	75 46                	jne    403065 <___mingw_dirname+0x275>
  40301f:	89 c7                	mov    edi,eax
  403021:	8d 47 fe             	lea    eax,[edi-0x2]
  403024:	39 c1                	cmp    ecx,eax
  403026:	73 3d                	jae    403065 <___mingw_dirname+0x275>
  403028:	0f b7 57 fe          	movzx  edx,WORD PTR [edi-0x2]
  40302c:	66 83 fa 5c          	cmp    dx,0x5c
  403030:	75 e7                	jne    403019 <___mingw_dirname+0x229>
  403032:	89 c7                	mov    edi,eax
  403034:	eb eb                	jmp    403021 <___mingw_dirname+0x231>
  403036:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  403039:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  40303c:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  40303f:	66 83 7c 00 02 3a    	cmp    WORD PTR [eax+eax*1+0x2],0x3a
  403045:	0f 85 f5 fe ff ff    	jne    402f40 <___mingw_dirname+0x150>
  40304b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  40304e:	83 c0 04             	add    eax,0x4
  403051:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  403054:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403057:	0f b7 44 00 04       	movzx  eax,WORD PTR [eax+eax*1+0x4]
  40305c:	66 89 45 da          	mov    WORD PTR [ebp-0x26],ax
  403060:	e9 db fe ff ff       	jmp    402f40 <___mingw_dirname+0x150>
  403065:	39 45 dc             	cmp    DWORD PTR [ebp-0x24],eax
  403068:	0f 84 37 01 00 00    	je     4031a5 <___mingw_dirname+0x3b5>
  40306e:	31 d2                	xor    edx,edx
  403070:	66 89 50 02          	mov    WORD PTR [eax+0x2],dx
  403074:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403077:	0f b7 14 00          	movzx  edx,WORD PTR [eax+eax*1]
  40307b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  40307e:	66 83 fa 5c          	cmp    dx,0x5c
  403082:	0f 85 c7 00 00 00    	jne    40314f <___mingw_dirname+0x35f>
  403088:	83 c0 02             	add    eax,0x2
  40308b:	0f b7 08             	movzx  ecx,WORD PTR [eax]
  40308e:	66 83 f9 5c          	cmp    cx,0x5c
  403092:	74 f4                	je     403088 <___mingw_dirname+0x298>
  403094:	66 83 f9 2f          	cmp    cx,0x2f
  403098:	74 ee                	je     403088 <___mingw_dirname+0x298>
  40309a:	89 c1                	mov    ecx,eax
  40309c:	2b 4d e0             	sub    ecx,DWORD PTR [ebp-0x20]
  40309f:	83 f9 05             	cmp    ecx,0x5
  4030a2:	0f 8e b1 00 00 00    	jle    403159 <___mingw_dirname+0x369>
  4030a8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4030ab:	89 c1                	mov    ecx,eax
  4030ad:	66 85 d2             	test   dx,dx
  4030b0:	74 21                	je     4030d3 <___mingw_dirname+0x2e3>
  4030b2:	83 c1 02             	add    ecx,0x2
  4030b5:	66 83 fa 2f          	cmp    dx,0x2f
  4030b9:	66 89 51 fe          	mov    WORD PTR [ecx-0x2],dx
  4030bd:	74 63                	je     403122 <___mingw_dirname+0x332>
  4030bf:	66 83 38 5c          	cmp    WORD PTR [eax],0x5c
  4030c3:	8d 78 02             	lea    edi,[eax+0x2]
  4030c6:	74 58                	je     403120 <___mingw_dirname+0x330>
  4030c8:	0f b7 50 02          	movzx  edx,WORD PTR [eax+0x2]
  4030cc:	89 f8                	mov    eax,edi
  4030ce:	66 85 d2             	test   dx,dx
  4030d1:	75 df                	jne    4030b2 <___mingw_dirname+0x2c2>
  4030d3:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  4030d6:	31 ff                	xor    edi,edi
  4030d8:	66 89 39             	mov    WORD PTR [ecx],di
  4030db:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4030df:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  4030e2:	89 34 24             	mov    DWORD PTR [esp],esi
  4030e5:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4030e9:	e8 a2 50 00 00       	call   408190 <_wcstombs>
  4030ee:	83 f8 ff             	cmp    eax,0xffffffff
  4030f1:	74 04                	je     4030f7 <___mingw_dirname+0x307>
  4030f3:	c6 04 06 00          	mov    BYTE PTR [esi+eax*1],0x0
  4030f7:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  4030fb:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  403102:	e8 81 50 00 00       	call   408188 <_setlocale>
  403107:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40310a:	e8 49 50 00 00       	call   408158 <_free>
  40310f:	8b 65 d4             	mov    esp,DWORD PTR [ebp-0x2c]
  403112:	8d 65 f4             	lea    esp,[ebp-0xc]
  403115:	5b                   	pop    ebx
  403116:	89 f0                	mov    eax,esi
  403118:	5e                   	pop    esi
  403119:	5f                   	pop    edi
  40311a:	5d                   	pop    ebp
  40311b:	c3                   	ret    
  40311c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403120:	89 f8                	mov    eax,edi
  403122:	0f b7 10             	movzx  edx,WORD PTR [eax]
  403125:	66 83 fa 2f          	cmp    dx,0x2f
  403129:	75 59                	jne    403184 <___mingw_dirname+0x394>
  40312b:	90                   	nop
  40312c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403130:	83 c0 02             	add    eax,0x2
  403133:	0f b7 10             	movzx  edx,WORD PTR [eax]
  403136:	66 83 fa 5c          	cmp    dx,0x5c
  40313a:	74 f4                	je     403130 <___mingw_dirname+0x340>
  40313c:	66 83 fa 2f          	cmp    dx,0x2f
  403140:	74 ee                	je     403130 <___mingw_dirname+0x340>
  403142:	e9 66 ff ff ff       	jmp    4030ad <___mingw_dirname+0x2bd>
  403147:	8b 65 d4             	mov    esp,DWORD PTR [ebp-0x2c]
  40314a:	e9 ee fc ff ff       	jmp    402e3d <___mingw_dirname+0x4d>
  40314f:	66 83 fa 2f          	cmp    dx,0x2f
  403153:	0f 84 2f ff ff ff    	je     403088 <___mingw_dirname+0x298>
  403159:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
  40315c:	66 39 54 3f 02       	cmp    WORD PTR [edi+edi*1+0x2],dx
  403161:	0f 85 41 ff ff ff    	jne    4030a8 <___mingw_dirname+0x2b8>
  403167:	0f b7 10             	movzx  edx,WORD PTR [eax]
  40316a:	e9 3c ff ff ff       	jmp    4030ab <___mingw_dirname+0x2bb>
  40316f:	8b 7d dc             	mov    edi,DWORD PTR [ebp-0x24]
  403172:	b9 2e 00 00 00       	mov    ecx,0x2e
  403177:	89 f8                	mov    eax,edi
  403179:	83 c0 02             	add    eax,0x2
  40317c:	66 89 0f             	mov    WORD PTR [edi],cx
  40317f:	e9 37 fe ff ff       	jmp    402fbb <___mingw_dirname+0x1cb>
  403184:	66 83 fa 5c          	cmp    dx,0x5c
  403188:	74 a6                	je     403130 <___mingw_dirname+0x340>
  40318a:	e9 1e ff ff ff       	jmp    4030ad <___mingw_dirname+0x2bd>
  40318f:	66 83 7c 3f 04 00    	cmp    WORD PTR [edi+edi*1+0x4],0x0
  403195:	0f 85 a5 fd ff ff    	jne    402f40 <___mingw_dirname+0x150>
  40319b:	90                   	nop
  40319c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4031a0:	e9 52 ff ff ff       	jmp    4030f7 <___mingw_dirname+0x307>
  4031a5:	66 83 7d da 5c       	cmp    WORD PTR [ebp-0x26],0x5c
  4031aa:	74 0e                	je     4031ba <___mingw_dirname+0x3ca>
  4031ac:	66 83 7d da 2f       	cmp    WORD PTR [ebp-0x26],0x2f
  4031b1:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4031b4:	0f 85 b4 fe ff ff    	jne    40306e <___mingw_dirname+0x27e>
  4031ba:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4031bd:	0f b7 4d da          	movzx  ecx,WORD PTR [ebp-0x26]
  4031c1:	66 39 48 02          	cmp    WORD PTR [eax+0x2],cx
  4031c5:	0f 85 a3 fe ff ff    	jne    40306e <___mingw_dirname+0x27e>
  4031cb:	0f b7 50 04          	movzx  edx,WORD PTR [eax+0x4]
  4031cf:	66 83 fa 2f          	cmp    dx,0x2f
  4031d3:	0f 84 95 fe ff ff    	je     40306e <___mingw_dirname+0x27e>
  4031d9:	66 83 fa 5c          	cmp    dx,0x5c
  4031dd:	89 f8                	mov    eax,edi
  4031df:	0f 85 89 fe ff ff    	jne    40306e <___mingw_dirname+0x27e>
  4031e5:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  4031e8:	e9 81 fe ff ff       	jmp    40306e <___mingw_dirname+0x27e>
  4031ed:	90                   	nop
  4031ee:	90                   	nop
  4031ef:	90                   	nop

004031f0 <_dirent_findnext>:
  4031f0:	55                   	push   ebp
  4031f1:	89 e5                	mov    ebp,esp
  4031f3:	56                   	push   esi
  4031f4:	89 d6                	mov    esi,edx
  4031f6:	53                   	push   ebx
  4031f7:	81 ec 50 01 00 00    	sub    esp,0x150
  4031fd:	8d 95 b8 fe ff ff    	lea    edx,[ebp-0x148]
  403203:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  403207:	89 04 24             	mov    DWORD PTR [esp],eax
  40320a:	e8 31 50 00 00       	call   408240 <_FindNextFileA@8>
  40320f:	83 ec 08             	sub    esp,0x8
  403212:	85 c0                	test   eax,eax
  403214:	89 c3                	mov    ebx,eax
  403216:	75 20                	jne    403238 <_dirent_findnext+0x48>
  403218:	e8 03 50 00 00       	call   408220 <_GetLastError@0>
  40321d:	31 db                	xor    ebx,ebx
  40321f:	83 f8 12             	cmp    eax,0x12
  403222:	74 0b                	je     40322f <_dirent_findnext+0x3f>
  403224:	e8 57 4f 00 00       	call   408180 <__errno>
  403229:	c7 00 02 00 00 00    	mov    DWORD PTR [eax],0x2
  40322f:	8d 65 f8             	lea    esp,[ebp-0x8]
  403232:	89 d8                	mov    eax,ebx
  403234:	5b                   	pop    ebx
  403235:	5e                   	pop    esi
  403236:	5d                   	pop    ebp
  403237:	c3                   	ret    
  403238:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
  40323e:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  403242:	8d 46 0c             	lea    eax,[esi+0xc]
  403245:	c7 44 24 08 4c a1 40 	mov    DWORD PTR [esp+0x8],0x40a14c
  40324c:	00 
  40324d:	c7 44 24 04 04 01 00 	mov    DWORD PTR [esp+0x4],0x104
  403254:	00 
  403255:	89 04 24             	mov    DWORD PTR [esp],eax
  403258:	e8 43 04 00 00       	call   4036a0 <___mingw_snprintf>
  40325d:	66 89 46 06          	mov    WORD PTR [esi+0x6],ax
  403261:	8b 85 b8 fe ff ff    	mov    eax,DWORD PTR [ebp-0x148]
  403267:	24 58                	and    al,0x58
  403269:	83 f8 10             	cmp    eax,0x10
  40326c:	76 12                	jbe    403280 <_dirent_findnext+0x90>
  40326e:	c7 46 08 18 00 00 00 	mov    DWORD PTR [esi+0x8],0x18
  403275:	8d 65 f8             	lea    esp,[ebp-0x8]
  403278:	89 d8                	mov    eax,ebx
  40327a:	5b                   	pop    ebx
  40327b:	5e                   	pop    esi
  40327c:	5d                   	pop    ebp
  40327d:	c3                   	ret    
  40327e:	66 90                	xchg   ax,ax
  403280:	89 46 08             	mov    DWORD PTR [esi+0x8],eax
  403283:	8d 65 f8             	lea    esp,[ebp-0x8]
  403286:	89 d8                	mov    eax,ebx
  403288:	5b                   	pop    ebx
  403289:	5e                   	pop    esi
  40328a:	5d                   	pop    ebp
  40328b:	c3                   	ret    
  40328c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00403290 <_dirent_findfirst>:
  403290:	55                   	push   ebp
  403291:	89 e5                	mov    ebp,esp
  403293:	56                   	push   esi
  403294:	53                   	push   ebx
  403295:	89 d3                	mov    ebx,edx
  403297:	81 ec 50 01 00 00    	sub    esp,0x150
  40329d:	8d 95 b8 fe ff ff    	lea    edx,[ebp-0x148]
  4032a3:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4032a7:	89 04 24             	mov    DWORD PTR [esp],eax
  4032aa:	e8 99 4f 00 00       	call   408248 <_FindFirstFileA@8>
  4032af:	83 ec 08             	sub    esp,0x8
  4032b2:	83 f8 ff             	cmp    eax,0xffffffff
  4032b5:	89 c6                	mov    esi,eax
  4032b7:	74 4a                	je     403303 <_dirent_findfirst+0x73>
  4032b9:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
  4032bf:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4032c3:	8d 43 0c             	lea    eax,[ebx+0xc]
  4032c6:	c7 44 24 08 4c a1 40 	mov    DWORD PTR [esp+0x8],0x40a14c
  4032cd:	00 
  4032ce:	c7 44 24 04 04 01 00 	mov    DWORD PTR [esp+0x4],0x104
  4032d5:	00 
  4032d6:	89 04 24             	mov    DWORD PTR [esp],eax
  4032d9:	e8 c2 03 00 00       	call   4036a0 <___mingw_snprintf>
  4032de:	8b 8d b8 fe ff ff    	mov    ecx,DWORD PTR [ebp-0x148]
  4032e4:	80 e1 58             	and    cl,0x58
  4032e7:	83 f9 10             	cmp    ecx,0x10
  4032ea:	66 89 43 06          	mov    WORD PTR [ebx+0x6],ax
  4032ee:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  4032f1:	76 07                	jbe    4032fa <_dirent_findfirst+0x6a>
  4032f3:	c7 43 08 18 00 00 00 	mov    DWORD PTR [ebx+0x8],0x18
  4032fa:	8d 65 f8             	lea    esp,[ebp-0x8]
  4032fd:	89 f0                	mov    eax,esi
  4032ff:	5b                   	pop    ebx
  403300:	5e                   	pop    esi
  403301:	5d                   	pop    ebp
  403302:	c3                   	ret    
  403303:	e8 78 4e 00 00       	call   408180 <__errno>
  403308:	89 c3                	mov    ebx,eax
  40330a:	e8 11 4f 00 00       	call   408220 <_GetLastError@0>
  40330f:	83 f8 03             	cmp    eax,0x3
  403312:	89 03                	mov    DWORD PTR [ebx],eax
  403314:	74 2a                	je     403340 <_dirent_findfirst+0xb0>
  403316:	e8 65 4e 00 00       	call   408180 <__errno>
  40331b:	81 38 0b 01 00 00    	cmp    DWORD PTR [eax],0x10b
  403321:	74 2d                	je     403350 <_dirent_findfirst+0xc0>
  403323:	e8 58 4e 00 00       	call   408180 <__errno>
  403328:	83 38 02             	cmp    DWORD PTR [eax],0x2
  40332b:	74 cd                	je     4032fa <_dirent_findfirst+0x6a>
  40332d:	8d 76 00             	lea    esi,[esi+0x0]
  403330:	e8 4b 4e 00 00       	call   408180 <__errno>
  403335:	c7 00 16 00 00 00    	mov    DWORD PTR [eax],0x16
  40333b:	eb bd                	jmp    4032fa <_dirent_findfirst+0x6a>
  40333d:	8d 76 00             	lea    esi,[esi+0x0]
  403340:	e8 3b 4e 00 00       	call   408180 <__errno>
  403345:	c7 00 02 00 00 00    	mov    DWORD PTR [eax],0x2
  40334b:	eb ad                	jmp    4032fa <_dirent_findfirst+0x6a>
  40334d:	8d 76 00             	lea    esi,[esi+0x0]
  403350:	e8 2b 4e 00 00       	call   408180 <__errno>
  403355:	c7 00 14 00 00 00    	mov    DWORD PTR [eax],0x14
  40335b:	eb 9d                	jmp    4032fa <_dirent_findfirst+0x6a>
  40335d:	8d 76 00             	lea    esi,[esi+0x0]

00403360 <___mingw_opendir>:
  403360:	55                   	push   ebp
  403361:	57                   	push   edi
  403362:	56                   	push   esi
  403363:	53                   	push   ebx
  403364:	81 ec 2c 01 00 00    	sub    esp,0x12c
  40336a:	8b 84 24 40 01 00 00 	mov    eax,DWORD PTR [esp+0x140]
  403371:	85 c0                	test   eax,eax
  403373:	0f 84 67 01 00 00    	je     4034e0 <___mingw_opendir+0x180>
  403379:	80 38 00             	cmp    BYTE PTR [eax],0x0
  40337c:	0f 84 40 01 00 00    	je     4034c2 <___mingw_opendir+0x162>
  403382:	8d 7c 24 1c          	lea    edi,[esp+0x1c]
  403386:	c7 44 24 08 04 01 00 	mov    DWORD PTR [esp+0x8],0x104
  40338d:	00 
  40338e:	89 fb                	mov    ebx,edi
  403390:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  403394:	89 3c 24             	mov    DWORD PTR [esp],edi
  403397:	e8 04 4e 00 00       	call   4081a0 <__fullpath>
  40339c:	80 7c 24 1c 00       	cmp    BYTE PTR [esp+0x1c],0x0
  4033a1:	74 5d                	je     403400 <___mingw_opendir+0xa0>
  4033a3:	8b 13                	mov    edx,DWORD PTR [ebx]
  4033a5:	83 c3 04             	add    ebx,0x4
  4033a8:	8d 82 ff fe fe fe    	lea    eax,[edx-0x1010101]
  4033ae:	f7 d2                	not    edx
  4033b0:	21 d0                	and    eax,edx
  4033b2:	25 80 80 80 80       	and    eax,0x80808080
  4033b7:	74 ea                	je     4033a3 <___mingw_opendir+0x43>
  4033b9:	a9 80 80 00 00       	test   eax,0x8080
  4033be:	0f 84 df 00 00 00    	je     4034a3 <___mingw_opendir+0x143>
  4033c4:	00 c0                	add    al,al
  4033c6:	83 db 03             	sbb    ebx,0x3
  4033c9:	29 fb                	sub    ebx,edi
  4033cb:	0f b6 44 1c 1b       	movzx  eax,BYTE PTR [esp+ebx*1+0x1b]
  4033d0:	3c 5c                	cmp    al,0x5c
  4033d2:	74 50                	je     403424 <___mingw_opendir+0xc4>
  4033d4:	3c 2f                	cmp    al,0x2f
  4033d6:	74 4c                	je     403424 <___mingw_opendir+0xc4>
  4033d8:	b9 5c 00 00 00       	mov    ecx,0x5c
  4033dd:	66 89 0c 1f          	mov    WORD PTR [edi+ebx*1],cx
  4033e1:	89 fb                	mov    ebx,edi
  4033e3:	8b 13                	mov    edx,DWORD PTR [ebx]
  4033e5:	83 c3 04             	add    ebx,0x4
  4033e8:	8d 82 ff fe fe fe    	lea    eax,[edx-0x1010101]
  4033ee:	f7 d2                	not    edx
  4033f0:	21 d0                	and    eax,edx
  4033f2:	25 80 80 80 80       	and    eax,0x80808080
  4033f7:	74 ea                	je     4033e3 <___mingw_opendir+0x83>
  4033f9:	eb 1b                	jmp    403416 <___mingw_opendir+0xb6>
  4033fb:	90                   	nop
  4033fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403400:	8b 13                	mov    edx,DWORD PTR [ebx]
  403402:	83 c3 04             	add    ebx,0x4
  403405:	8d 82 ff fe fe fe    	lea    eax,[edx-0x1010101]
  40340b:	f7 d2                	not    edx
  40340d:	21 d0                	and    eax,edx
  40340f:	25 80 80 80 80       	and    eax,0x80808080
  403414:	74 ea                	je     403400 <___mingw_opendir+0xa0>
  403416:	a9 80 80 00 00       	test   eax,0x8080
  40341b:	74 7b                	je     403498 <___mingw_opendir+0x138>
  40341d:	00 c0                	add    al,al
  40341f:	83 db 03             	sbb    ebx,0x3
  403422:	29 fb                	sub    ebx,edi
  403424:	ba 2a 00 00 00       	mov    edx,0x2a
  403429:	8d 83 1d 01 00 00    	lea    eax,[ebx+0x11d]
  40342f:	66 89 14 1f          	mov    WORD PTR [edi+ebx*1],dx
  403433:	89 04 24             	mov    DWORD PTR [esp],eax
  403436:	e8 25 4d 00 00       	call   408160 <_malloc>
  40343b:	85 c0                	test   eax,eax
  40343d:	89 c6                	mov    esi,eax
  40343f:	0f 84 8c 00 00 00    	je     4034d1 <___mingw_opendir+0x171>
  403445:	8d a8 18 01 00 00    	lea    ebp,[eax+0x118]
  40344b:	83 c3 02             	add    ebx,0x2
  40344e:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  403452:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  403456:	89 2c 24             	mov    DWORD PTR [esp],ebp
  403459:	e8 ea 4c 00 00       	call   408148 <_memcpy>
  40345e:	89 f2                	mov    edx,esi
  403460:	89 e8                	mov    eax,ebp
  403462:	e8 29 fe ff ff       	call   403290 <_dirent_findfirst>
  403467:	83 f8 ff             	cmp    eax,0xffffffff
  40346a:	89 86 10 01 00 00    	mov    DWORD PTR [esi+0x110],eax
  403470:	74 7d                	je     4034ef <___mingw_opendir+0x18f>
  403472:	b8 10 01 00 00       	mov    eax,0x110
  403477:	66 89 46 04          	mov    WORD PTR [esi+0x4],ax
  40347b:	89 f0                	mov    eax,esi
  40347d:	c7 86 14 01 00 00 00 	mov    DWORD PTR [esi+0x114],0x0
  403484:	00 00 00 
  403487:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
  40348d:	81 c4 2c 01 00 00    	add    esp,0x12c
  403493:	5b                   	pop    ebx
  403494:	5e                   	pop    esi
  403495:	5f                   	pop    edi
  403496:	5d                   	pop    ebp
  403497:	c3                   	ret    
  403498:	c1 e8 10             	shr    eax,0x10
  40349b:	83 c3 02             	add    ebx,0x2
  40349e:	e9 7a ff ff ff       	jmp    40341d <___mingw_opendir+0xbd>
  4034a3:	c1 e8 10             	shr    eax,0x10
  4034a6:	83 c3 02             	add    ebx,0x2
  4034a9:	00 c0                	add    al,al
  4034ab:	83 db 03             	sbb    ebx,0x3
  4034ae:	29 fb                	sub    ebx,edi
  4034b0:	0f b6 44 1c 1b       	movzx  eax,BYTE PTR [esp+ebx*1+0x1b]
  4034b5:	3c 5c                	cmp    al,0x5c
  4034b7:	0f 84 67 ff ff ff    	je     403424 <___mingw_opendir+0xc4>
  4034bd:	e9 12 ff ff ff       	jmp    4033d4 <___mingw_opendir+0x74>
  4034c2:	e8 b9 4c 00 00       	call   408180 <__errno>
  4034c7:	c7 00 02 00 00 00    	mov    DWORD PTR [eax],0x2
  4034cd:	31 c0                	xor    eax,eax
  4034cf:	eb bc                	jmp    40348d <___mingw_opendir+0x12d>
  4034d1:	e8 aa 4c 00 00       	call   408180 <__errno>
  4034d6:	c7 00 0c 00 00 00    	mov    DWORD PTR [eax],0xc
  4034dc:	31 c0                	xor    eax,eax
  4034de:	eb ad                	jmp    40348d <___mingw_opendir+0x12d>
  4034e0:	e8 9b 4c 00 00       	call   408180 <__errno>
  4034e5:	c7 00 16 00 00 00    	mov    DWORD PTR [eax],0x16
  4034eb:	31 c0                	xor    eax,eax
  4034ed:	eb 9e                	jmp    40348d <___mingw_opendir+0x12d>
  4034ef:	89 34 24             	mov    DWORD PTR [esp],esi
  4034f2:	e8 61 4c 00 00       	call   408158 <_free>
  4034f7:	31 c0                	xor    eax,eax
  4034f9:	eb 92                	jmp    40348d <___mingw_opendir+0x12d>
  4034fb:	90                   	nop
  4034fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00403500 <___mingw_readdir>:
  403500:	53                   	push   ebx
  403501:	83 ec 08             	sub    esp,0x8
  403504:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
  403508:	85 db                	test   ebx,ebx
  40350a:	74 2b                	je     403537 <___mingw_readdir+0x37>
  40350c:	8b 83 14 01 00 00    	mov    eax,DWORD PTR [ebx+0x114]
  403512:	8d 50 01             	lea    edx,[eax+0x1]
  403515:	85 c0                	test   eax,eax
  403517:	89 93 14 01 00 00    	mov    DWORD PTR [ebx+0x114],edx
  40351d:	7e 11                	jle    403530 <___mingw_readdir+0x30>
  40351f:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  403525:	89 da                	mov    edx,ebx
  403527:	e8 c4 fc ff ff       	call   4031f0 <_dirent_findnext>
  40352c:	85 c0                	test   eax,eax
  40352e:	74 02                	je     403532 <___mingw_readdir+0x32>
  403530:	89 d8                	mov    eax,ebx
  403532:	83 c4 08             	add    esp,0x8
  403535:	5b                   	pop    ebx
  403536:	c3                   	ret    
  403537:	e8 44 4c 00 00       	call   408180 <__errno>
  40353c:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  403542:	31 c0                	xor    eax,eax
  403544:	eb ec                	jmp    403532 <___mingw_readdir+0x32>
  403546:	8d 76 00             	lea    esi,[esi+0x0]
  403549:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00403550 <___mingw_closedir>:
  403550:	55                   	push   ebp
  403551:	89 e5                	mov    ebp,esp
  403553:	53                   	push   ebx
  403554:	83 ec 14             	sub    esp,0x14
  403557:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  40355a:	85 db                	test   ebx,ebx
  40355c:	74 24                	je     403582 <___mingw_closedir+0x32>
  40355e:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  403564:	89 04 24             	mov    DWORD PTR [esp],eax
  403567:	e8 e4 4c 00 00       	call   408250 <_FindClose@4>
  40356c:	83 ec 04             	sub    esp,0x4
  40356f:	85 c0                	test   eax,eax
  403571:	74 0f                	je     403582 <___mingw_closedir+0x32>
  403573:	89 1c 24             	mov    DWORD PTR [esp],ebx
  403576:	e8 dd 4b 00 00       	call   408158 <_free>
  40357b:	31 c0                	xor    eax,eax
  40357d:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  403580:	c9                   	leave  
  403581:	c3                   	ret    
  403582:	e8 f9 4b 00 00       	call   408180 <__errno>
  403587:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  40358d:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403592:	eb e9                	jmp    40357d <___mingw_closedir+0x2d>
  403594:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  40359a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

004035a0 <___mingw_rewinddir>:
  4035a0:	55                   	push   ebp
  4035a1:	89 e5                	mov    ebp,esp
  4035a3:	53                   	push   ebx
  4035a4:	83 ec 14             	sub    esp,0x14
  4035a7:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  4035aa:	85 db                	test   ebx,ebx
  4035ac:	74 15                	je     4035c3 <___mingw_rewinddir+0x23>
  4035ae:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  4035b4:	89 04 24             	mov    DWORD PTR [esp],eax
  4035b7:	e8 94 4c 00 00       	call   408250 <_FindClose@4>
  4035bc:	83 ec 04             	sub    esp,0x4
  4035bf:	85 c0                	test   eax,eax
  4035c1:	75 10                	jne    4035d3 <___mingw_rewinddir+0x33>
  4035c3:	e8 b8 4b 00 00       	call   408180 <__errno>
  4035c8:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  4035ce:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  4035d1:	c9                   	leave  
  4035d2:	c3                   	ret    
  4035d3:	8d 83 18 01 00 00    	lea    eax,[ebx+0x118]
  4035d9:	89 da                	mov    edx,ebx
  4035db:	e8 b0 fc ff ff       	call   403290 <_dirent_findfirst>
  4035e0:	83 f8 ff             	cmp    eax,0xffffffff
  4035e3:	89 83 10 01 00 00    	mov    DWORD PTR [ebx+0x110],eax
  4035e9:	74 e3                	je     4035ce <___mingw_rewinddir+0x2e>
  4035eb:	c7 83 14 01 00 00 00 	mov    DWORD PTR [ebx+0x114],0x0
  4035f2:	00 00 00 
  4035f5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  4035f8:	c9                   	leave  
  4035f9:	c3                   	ret    
  4035fa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]

00403600 <___mingw_telldir>:
  403600:	83 ec 0c             	sub    esp,0xc
  403603:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  403607:	85 c0                	test   eax,eax
  403609:	74 0a                	je     403615 <___mingw_telldir+0x15>
  40360b:	8b 80 14 01 00 00    	mov    eax,DWORD PTR [eax+0x114]
  403611:	83 c4 0c             	add    esp,0xc
  403614:	c3                   	ret    
  403615:	e8 66 4b 00 00       	call   408180 <__errno>
  40361a:	c7 00 09 00 00 00    	mov    DWORD PTR [eax],0x9
  403620:	b8 ff ff ff ff       	mov    eax,0xffffffff
  403625:	eb ea                	jmp    403611 <___mingw_telldir+0x11>
  403627:	89 f6                	mov    esi,esi
  403629:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00403630 <___mingw_seekdir>:
  403630:	56                   	push   esi
  403631:	53                   	push   ebx
  403632:	83 ec 14             	sub    esp,0x14
  403635:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  403639:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
  40363d:	85 f6                	test   esi,esi
  40363f:	78 41                	js     403682 <___mingw_seekdir+0x52>
  403641:	89 1c 24             	mov    DWORD PTR [esp],ebx
  403644:	e8 57 ff ff ff       	call   4035a0 <___mingw_rewinddir>
  403649:	85 f6                	test   esi,esi
  40364b:	74 2f                	je     40367c <___mingw_seekdir+0x4c>
  40364d:	83 bb 10 01 00 00 ff 	cmp    DWORD PTR [ebx+0x110],0xffffffff
  403654:	75 13                	jne    403669 <___mingw_seekdir+0x39>
  403656:	eb 24                	jmp    40367c <___mingw_seekdir+0x4c>
  403658:	8b 83 10 01 00 00    	mov    eax,DWORD PTR [ebx+0x110]
  40365e:	89 da                	mov    edx,ebx
  403660:	e8 8b fb ff ff       	call   4031f0 <_dirent_findnext>
  403665:	85 c0                	test   eax,eax
  403667:	74 13                	je     40367c <___mingw_seekdir+0x4c>
  403669:	8b 83 14 01 00 00    	mov    eax,DWORD PTR [ebx+0x114]
  40366f:	83 c0 01             	add    eax,0x1
  403672:	39 c6                	cmp    esi,eax
  403674:	89 83 14 01 00 00    	mov    DWORD PTR [ebx+0x114],eax
  40367a:	7f dc                	jg     403658 <___mingw_seekdir+0x28>
  40367c:	83 c4 14             	add    esp,0x14
  40367f:	5b                   	pop    ebx
  403680:	5e                   	pop    esi
  403681:	c3                   	ret    
  403682:	e8 f9 4a 00 00       	call   408180 <__errno>
  403687:	c7 00 16 00 00 00    	mov    DWORD PTR [eax],0x16
  40368d:	83 c4 14             	add    esp,0x14
  403690:	5b                   	pop    ebx
  403691:	5e                   	pop    esi
  403692:	c3                   	ret    
  403693:	90                   	nop
  403694:	90                   	nop
  403695:	90                   	nop
  403696:	90                   	nop
  403697:	90                   	nop
  403698:	90                   	nop
  403699:	90                   	nop
  40369a:	90                   	nop
  40369b:	90                   	nop
  40369c:	90                   	nop
  40369d:	90                   	nop
  40369e:	90                   	nop
  40369f:	90                   	nop

004036a0 <___mingw_snprintf>:
  4036a0:	83 ec 1c             	sub    esp,0x1c
  4036a3:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4036a7:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4036ab:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4036af:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4036b3:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  4036b7:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4036bb:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  4036bf:	89 04 24             	mov    DWORD PTR [esp],eax
  4036c2:	e8 09 00 00 00       	call   4036d0 <___mingw_vsnprintf>
  4036c7:	83 c4 1c             	add    esp,0x1c
  4036ca:	c3                   	ret    
  4036cb:	90                   	nop
  4036cc:	90                   	nop
  4036cd:	90                   	nop
  4036ce:	90                   	nop
  4036cf:	90                   	nop

004036d0 <___mingw_vsnprintf>:
  4036d0:	56                   	push   esi
  4036d1:	53                   	push   ebx
  4036d2:	83 ec 24             	sub    esp,0x24
  4036d5:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  4036d9:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  4036dd:	8b 54 24 38          	mov    edx,DWORD PTR [esp+0x38]
  4036e1:	8b 4c 24 3c          	mov    ecx,DWORD PTR [esp+0x3c]
  4036e5:	85 c0                	test   eax,eax
  4036e7:	74 37                	je     403720 <___mingw_vsnprintf+0x50>
  4036e9:	8d 70 ff             	lea    esi,[eax-0x1]
  4036ec:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  4036f0:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  4036f4:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  4036f8:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  4036fc:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  403703:	e8 e8 15 00 00       	call   404cf0 <___mingw_pformat>
  403708:	39 f0                	cmp    eax,esi
  40370a:	89 c2                	mov    edx,eax
  40370c:	77 0a                	ja     403718 <___mingw_vsnprintf+0x48>
  40370e:	c6 04 13 00          	mov    BYTE PTR [ebx+edx*1],0x0
  403712:	83 c4 24             	add    esp,0x24
  403715:	5b                   	pop    ebx
  403716:	5e                   	pop    esi
  403717:	c3                   	ret    
  403718:	89 f2                	mov    edx,esi
  40371a:	eb f2                	jmp    40370e <___mingw_vsnprintf+0x3e>
  40371c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403720:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  403724:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  403728:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  40372c:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  403733:	00 
  403734:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  40373b:	e8 b0 15 00 00       	call   404cf0 <___mingw_pformat>
  403740:	83 c4 24             	add    esp,0x24
  403743:	5b                   	pop    ebx
  403744:	5e                   	pop    esi
  403745:	c3                   	ret    
  403746:	90                   	nop
  403747:	90                   	nop
  403748:	90                   	nop
  403749:	90                   	nop
  40374a:	90                   	nop
  40374b:	90                   	nop
  40374c:	90                   	nop
  40374d:	90                   	nop
  40374e:	90                   	nop
  40374f:	90                   	nop

00403750 <___pformat_cvt>:
  403750:	53                   	push   ebx
  403751:	89 c1                	mov    ecx,eax
  403753:	83 ec 48             	sub    esp,0x48
  403756:	8b 44 24 50          	mov    eax,DWORD PTR [esp+0x50]
  40375a:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  40375e:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  403762:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  403766:	8b 44 24 58          	mov    eax,DWORD PTR [esp+0x58]
  40376a:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
  40376e:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  403772:	db 6c 24 20          	fld    TBYTE PTR [esp+0x20]
  403776:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  40377a:	d9 e5                	fxam   
  40377c:	9b df e0             	fstsw  ax
  40377f:	dd d8                	fstp   st(0)
  403781:	f6 c4 01             	test   ah,0x1
  403784:	74 1a                	je     4037a0 <___pformat_cvt+0x50>
  403786:	f6 c4 04             	test   ah,0x4
  403789:	0f 84 91 00 00 00    	je     403820 <___pformat_cvt+0xd0>
  40378f:	c7 44 24 38 03 00 00 	mov    DWORD PTR [esp+0x38],0x3
  403796:	00 
  403797:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  40379c:	31 c0                	xor    eax,eax
  40379e:	eb 14                	jmp    4037b4 <___pformat_cvt+0x64>
  4037a0:	f6 c4 04             	test   ah,0x4
  4037a3:	75 5c                	jne    403801 <___pformat_cvt+0xb1>
  4037a5:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  4037aa:	31 c0                	xor    eax,eax
  4037ac:	c7 44 24 38 00 00 00 	mov    DWORD PTR [esp+0x38],0x0
  4037b3:	00 
  4037b4:	81 e2 00 80 00 00    	and    edx,0x8000
  4037ba:	8b 5c 24 68          	mov    ebx,DWORD PTR [esp+0x68]
  4037be:	89 13                	mov    DWORD PTR [ebx],edx
  4037c0:	8d 54 24 3c          	lea    edx,[esp+0x3c]
  4037c4:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
  4037c8:	8b 54 24 64          	mov    edx,DWORD PTR [esp+0x64]
  4037cc:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  4037d0:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4037d4:	c7 04 24 0c 90 40 00 	mov    DWORD PTR [esp],0x40900c
  4037db:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  4037df:	8b 54 24 60          	mov    edx,DWORD PTR [esp+0x60]
  4037e3:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  4037e7:	8d 54 24 38          	lea    edx,[esp+0x38]
  4037eb:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  4037ef:	8d 54 24 20          	lea    edx,[esp+0x20]
  4037f3:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  4037f7:	e8 64 1e 00 00       	call   405660 <___gdtoa>
  4037fc:	83 c4 48             	add    esp,0x48
  4037ff:	5b                   	pop    ebx
  403800:	c3                   	ret    
  403801:	f6 c4 40             	test   ah,0x40
  403804:	74 2a                	je     403830 <___pformat_cvt+0xe0>
  403806:	c7 44 24 38 02 00 00 	mov    DWORD PTR [esp+0x38],0x2
  40380d:	00 
  40380e:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  403813:	b8 c3 bf ff ff       	mov    eax,0xffffbfc3
  403818:	eb 9a                	jmp    4037b4 <___pformat_cvt+0x64>
  40381a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  403820:	c7 44 24 38 04 00 00 	mov    DWORD PTR [esp+0x38],0x4
  403827:	00 
  403828:	31 c0                	xor    eax,eax
  40382a:	31 d2                	xor    edx,edx
  40382c:	eb 8c                	jmp    4037ba <___pformat_cvt+0x6a>
  40382e:	66 90                	xchg   ax,ax
  403830:	0f b7 54 24 28       	movzx  edx,WORD PTR [esp+0x28]
  403835:	c7 44 24 38 01 00 00 	mov    DWORD PTR [esp+0x38],0x1
  40383c:	00 
  40383d:	89 d0                	mov    eax,edx
  40383f:	25 ff 7f 00 00       	and    eax,0x7fff
  403844:	2d 3e 40 00 00       	sub    eax,0x403e
  403849:	e9 66 ff ff ff       	jmp    4037b4 <___pformat_cvt+0x64>
  40384e:	66 90                	xchg   ax,ax

00403850 <___pformat_putc>:
  403850:	53                   	push   ebx
  403851:	83 ec 18             	sub    esp,0x18
  403854:	8b 4a 04             	mov    ecx,DWORD PTR [edx+0x4]
  403857:	f6 c5 20             	test   ch,0x20
  40385a:	75 08                	jne    403864 <___pformat_putc+0x14>
  40385c:	8b 5a 18             	mov    ebx,DWORD PTR [edx+0x18]
  40385f:	39 5a 1c             	cmp    DWORD PTR [edx+0x1c],ebx
  403862:	7e 10                	jle    403874 <___pformat_putc+0x24>
  403864:	80 e5 10             	and    ch,0x10
  403867:	75 17                	jne    403880 <___pformat_putc+0x30>
  403869:	8b 1a                	mov    ebx,DWORD PTR [edx]
  40386b:	8b 4a 18             	mov    ecx,DWORD PTR [edx+0x18]
  40386e:	88 04 0b             	mov    BYTE PTR [ebx+ecx*1],al
  403871:	8b 5a 18             	mov    ebx,DWORD PTR [edx+0x18]
  403874:	83 c3 01             	add    ebx,0x1
  403877:	89 5a 18             	mov    DWORD PTR [edx+0x18],ebx
  40387a:	83 c4 18             	add    esp,0x18
  40387d:	5b                   	pop    ebx
  40387e:	c3                   	ret    
  40387f:	90                   	nop
  403880:	8b 0a                	mov    ecx,DWORD PTR [edx]
  403882:	89 04 24             	mov    DWORD PTR [esp],eax
  403885:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  403889:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  40388d:	e8 16 49 00 00       	call   4081a8 <_fputc>
  403892:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  403896:	8b 5a 18             	mov    ebx,DWORD PTR [edx+0x18]
  403899:	83 c3 01             	add    ebx,0x1
  40389c:	89 5a 18             	mov    DWORD PTR [edx+0x18],ebx
  40389f:	83 c4 18             	add    esp,0x18
  4038a2:	5b                   	pop    ebx
  4038a3:	c3                   	ret    
  4038a4:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4038aa:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

004038b0 <___pformat_wputchars>:
  4038b0:	55                   	push   ebp
  4038b1:	57                   	push   edi
  4038b2:	56                   	push   esi
  4038b3:	89 d6                	mov    esi,edx
  4038b5:	53                   	push   ebx
  4038b6:	89 cb                	mov    ebx,ecx
  4038b8:	83 ec 4c             	sub    esp,0x4c
  4038bb:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  4038bf:	8d 6c 24 30          	lea    ebp,[esp+0x30]
  4038c3:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4038c7:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4038cb:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  4038d2:	00 
  4038d3:	89 2c 24             	mov    DWORD PTR [esp],ebp
  4038d6:	e8 b5 32 00 00       	call   406b90 <_wcrtomb>
  4038db:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
  4038de:	85 c0                	test   eax,eax
  4038e0:	78 08                	js     4038ea <___pformat_wputchars+0x3a>
  4038e2:	39 c6                	cmp    esi,eax
  4038e4:	0f 8f c7 00 00 00    	jg     4039b1 <___pformat_wputchars+0x101>
  4038ea:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4038ed:	39 c6                	cmp    esi,eax
  4038ef:	0f 8d 8c 00 00 00    	jge    403981 <___pformat_wputchars+0xd1>
  4038f5:	29 f0                	sub    eax,esi
  4038f7:	85 c0                	test   eax,eax
  4038f9:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  4038fc:	7e 0a                	jle    403908 <___pformat_wputchars+0x58>
  4038fe:	f6 43 05 04          	test   BYTE PTR [ebx+0x5],0x4
  403902:	0f 84 85 00 00 00    	je     40398d <___pformat_wputchars+0xdd>
  403908:	89 74 24 1c          	mov    DWORD PTR [esp+0x1c],esi
  40390c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403910:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  403914:	85 c0                	test   eax,eax
  403916:	7e 54                	jle    40396c <___pformat_wputchars+0xbc>
  403918:	83 44 24 18 02       	add    DWORD PTR [esp+0x18],0x2
  40391d:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  403921:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  403925:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  403929:	0f b7 40 fe          	movzx  eax,WORD PTR [eax-0x2]
  40392d:	89 2c 24             	mov    DWORD PTR [esp],ebp
  403930:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  403934:	e8 57 32 00 00       	call   406b90 <_wcrtomb>
  403939:	85 c0                	test   eax,eax
  40393b:	7e 2f                	jle    40396c <___pformat_wputchars+0xbc>
  40393d:	8d 74 05 00          	lea    esi,[ebp+eax*1+0x0]
  403941:	89 ef                	mov    edi,ebp
  403943:	83 c7 01             	add    edi,0x1
  403946:	0f be 47 ff          	movsx  eax,BYTE PTR [edi-0x1]
  40394a:	89 da                	mov    edx,ebx
  40394c:	e8 ff fe ff ff       	call   403850 <___pformat_putc>
  403951:	39 f7                	cmp    edi,esi
  403953:	75 ee                	jne    403943 <___pformat_wputchars+0x93>
  403955:	83 6c 24 1c 01       	sub    DWORD PTR [esp+0x1c],0x1
  40395a:	eb b4                	jmp    403910 <___pformat_wputchars+0x60>
  40395c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403960:	89 da                	mov    edx,ebx
  403962:	b8 20 00 00 00       	mov    eax,0x20
  403967:	e8 e4 fe ff ff       	call   403850 <___pformat_putc>
  40396c:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  40396f:	8d 50 ff             	lea    edx,[eax-0x1]
  403972:	85 c0                	test   eax,eax
  403974:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403977:	7f e7                	jg     403960 <___pformat_wputchars+0xb0>
  403979:	83 c4 4c             	add    esp,0x4c
  40397c:	5b                   	pop    ebx
  40397d:	5e                   	pop    esi
  40397e:	5f                   	pop    edi
  40397f:	5d                   	pop    ebp
  403980:	c3                   	ret    
  403981:	c7 43 08 ff ff ff ff 	mov    DWORD PTR [ebx+0x8],0xffffffff
  403988:	e9 7b ff ff ff       	jmp    403908 <___pformat_wputchars+0x58>
  40398d:	83 e8 01             	sub    eax,0x1
  403990:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  403993:	89 da                	mov    edx,ebx
  403995:	b8 20 00 00 00       	mov    eax,0x20
  40399a:	e8 b1 fe ff ff       	call   403850 <___pformat_putc>
  40399f:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4039a2:	8d 50 ff             	lea    edx,[eax-0x1]
  4039a5:	85 c0                	test   eax,eax
  4039a7:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  4039aa:	75 e7                	jne    403993 <___pformat_wputchars+0xe3>
  4039ac:	e9 57 ff ff ff       	jmp    403908 <___pformat_wputchars+0x58>
  4039b1:	89 c6                	mov    esi,eax
  4039b3:	e9 32 ff ff ff       	jmp    4038ea <___pformat_wputchars+0x3a>
  4039b8:	90                   	nop
  4039b9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

004039c0 <___pformat_putchars>:
  4039c0:	57                   	push   edi
  4039c1:	89 c7                	mov    edi,eax
  4039c3:	8b 41 0c             	mov    eax,DWORD PTR [ecx+0xc]
  4039c6:	56                   	push   esi
  4039c7:	89 d6                	mov    esi,edx
  4039c9:	53                   	push   ebx
  4039ca:	89 cb                	mov    ebx,ecx
  4039cc:	85 c0                	test   eax,eax
  4039ce:	78 08                	js     4039d8 <___pformat_putchars+0x18>
  4039d0:	39 c2                	cmp    edx,eax
  4039d2:	0f 8f 88 00 00 00    	jg     403a60 <___pformat_putchars+0xa0>
  4039d8:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  4039db:	39 c6                	cmp    esi,eax
  4039dd:	7d 71                	jge    403a50 <___pformat_putchars+0x90>
  4039df:	29 f0                	sub    eax,esi
  4039e1:	85 c0                	test   eax,eax
  4039e3:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  4039e6:	7e 25                	jle    403a0d <___pformat_putchars+0x4d>
  4039e8:	f6 43 05 04          	test   BYTE PTR [ebx+0x5],0x4
  4039ec:	75 1f                	jne    403a0d <___pformat_putchars+0x4d>
  4039ee:	83 e8 01             	sub    eax,0x1
  4039f1:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  4039f4:	89 da                	mov    edx,ebx
  4039f6:	b8 20 00 00 00       	mov    eax,0x20
  4039fb:	e8 50 fe ff ff       	call   403850 <___pformat_putc>
  403a00:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403a03:	8d 50 ff             	lea    edx,[eax-0x1]
  403a06:	85 c0                	test   eax,eax
  403a08:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403a0b:	75 e7                	jne    4039f4 <___pformat_putchars+0x34>
  403a0d:	85 f6                	test   esi,esi
  403a0f:	74 2c                	je     403a3d <___pformat_putchars+0x7d>
  403a11:	83 c7 01             	add    edi,0x1
  403a14:	0f be 47 ff          	movsx  eax,BYTE PTR [edi-0x1]
  403a18:	89 da                	mov    edx,ebx
  403a1a:	e8 31 fe ff ff       	call   403850 <___pformat_putc>
  403a1f:	83 ee 01             	sub    esi,0x1
  403a22:	75 ed                	jne    403a11 <___pformat_putchars+0x51>
  403a24:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403a27:	8d 50 ff             	lea    edx,[eax-0x1]
  403a2a:	85 c0                	test   eax,eax
  403a2c:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403a2f:	7e 19                	jle    403a4a <___pformat_putchars+0x8a>
  403a31:	89 da                	mov    edx,ebx
  403a33:	b8 20 00 00 00       	mov    eax,0x20
  403a38:	e8 13 fe ff ff       	call   403850 <___pformat_putc>
  403a3d:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403a40:	8d 50 ff             	lea    edx,[eax-0x1]
  403a43:	85 c0                	test   eax,eax
  403a45:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403a48:	7f e7                	jg     403a31 <___pformat_putchars+0x71>
  403a4a:	5b                   	pop    ebx
  403a4b:	5e                   	pop    esi
  403a4c:	5f                   	pop    edi
  403a4d:	c3                   	ret    
  403a4e:	66 90                	xchg   ax,ax
  403a50:	c7 43 08 ff ff ff ff 	mov    DWORD PTR [ebx+0x8],0xffffffff
  403a57:	eb b4                	jmp    403a0d <___pformat_putchars+0x4d>
  403a59:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  403a60:	89 c6                	mov    esi,eax
  403a62:	e9 71 ff ff ff       	jmp    4039d8 <___pformat_putchars+0x18>
  403a67:	89 f6                	mov    esi,esi
  403a69:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00403a70 <___pformat_emit_inf_or_nan>:
  403a70:	55                   	push   ebp
  403a71:	57                   	push   edi
  403a72:	56                   	push   esi
  403a73:	53                   	push   ebx
  403a74:	83 ec 1c             	sub    esp,0x1c
  403a77:	85 c0                	test   eax,eax
  403a79:	c7 41 0c ff ff ff ff 	mov    DWORD PTR [ecx+0xc],0xffffffff
  403a80:	74 3e                	je     403ac0 <___pformat_emit_inf_or_nan+0x50>
  403a82:	8b 69 04             	mov    ebp,DWORD PTR [ecx+0x4]
  403a85:	8d 7c 24 0d          	lea    edi,[esp+0xd]
  403a89:	c6 44 24 0c 2d       	mov    BYTE PTR [esp+0xc],0x2d
  403a8e:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403a92:	83 e5 20             	and    ebp,0x20
  403a95:	31 f6                	xor    esi,esi
  403a97:	0f b6 1c 32          	movzx  ebx,BYTE PTR [edx+esi*1]
  403a9b:	83 e3 df             	and    ebx,0xffffffdf
  403a9e:	09 eb                	or     ebx,ebp
  403aa0:	88 1c 37             	mov    BYTE PTR [edi+esi*1],bl
  403aa3:	83 c6 01             	add    esi,0x1
  403aa6:	83 fe 03             	cmp    esi,0x3
  403aa9:	75 ec                	jne    403a97 <___pformat_emit_inf_or_nan+0x27>
  403aab:	8d 57 03             	lea    edx,[edi+0x3]
  403aae:	29 c2                	sub    edx,eax
  403ab0:	e8 0b ff ff ff       	call   4039c0 <___pformat_putchars>
  403ab5:	83 c4 1c             	add    esp,0x1c
  403ab8:	5b                   	pop    ebx
  403ab9:	5e                   	pop    esi
  403aba:	5f                   	pop    edi
  403abb:	5d                   	pop    ebp
  403abc:	c3                   	ret    
  403abd:	8d 76 00             	lea    esi,[esi+0x0]
  403ac0:	8b 69 04             	mov    ebp,DWORD PTR [ecx+0x4]
  403ac3:	f7 c5 00 01 00 00    	test   ebp,0x100
  403ac9:	74 15                	je     403ae0 <___pformat_emit_inf_or_nan+0x70>
  403acb:	c6 44 24 0c 2b       	mov    BYTE PTR [esp+0xc],0x2b
  403ad0:	8d 7c 24 0d          	lea    edi,[esp+0xd]
  403ad4:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403ad8:	eb b8                	jmp    403a92 <___pformat_emit_inf_or_nan+0x22>
  403ada:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  403ae0:	f7 c5 40 00 00 00    	test   ebp,0x40
  403ae6:	74 0f                	je     403af7 <___pformat_emit_inf_or_nan+0x87>
  403ae8:	c6 44 24 0c 20       	mov    BYTE PTR [esp+0xc],0x20
  403aed:	8d 7c 24 0d          	lea    edi,[esp+0xd]
  403af1:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403af5:	eb 9b                	jmp    403a92 <___pformat_emit_inf_or_nan+0x22>
  403af7:	8d 44 24 0c          	lea    eax,[esp+0xc]
  403afb:	89 c7                	mov    edi,eax
  403afd:	eb 93                	jmp    403a92 <___pformat_emit_inf_or_nan+0x22>
  403aff:	90                   	nop

00403b00 <___pformat_int>:
  403b00:	55                   	push   ebp
  403b01:	89 e5                	mov    ebp,esp
  403b03:	57                   	push   edi
  403b04:	89 d7                	mov    edi,edx
  403b06:	56                   	push   esi
  403b07:	89 c6                	mov    esi,eax
  403b09:	53                   	push   ebx
  403b0a:	89 cb                	mov    ebx,ecx
  403b0c:	83 ec 2c             	sub    esp,0x2c
  403b0f:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
  403b12:	8b 51 0c             	mov    edx,DWORD PTR [ecx+0xc]
  403b15:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  403b18:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  403b1b:	89 d0                	mov    eax,edx
  403b1d:	c1 f8 1f             	sar    eax,0x1f
  403b20:	f7 d0                	not    eax
  403b22:	21 d0                	and    eax,edx
  403b24:	83 c0 17             	add    eax,0x17
  403b27:	39 c8                	cmp    eax,ecx
  403b29:	7d 02                	jge    403b2d <___pformat_int+0x2d>
  403b2b:	89 c8                	mov    eax,ecx
  403b2d:	83 c0 0f             	add    eax,0xf
  403b30:	83 e0 f0             	and    eax,0xfffffff0
  403b33:	e8 a8 e5 ff ff       	call   4020e0 <___chkstk_ms>
  403b38:	29 c4                	sub    esp,eax
  403b3a:	8d 44 24 10          	lea    eax,[esp+0x10]
  403b3e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  403b41:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  403b44:	a8 80                	test   al,0x80
  403b46:	74 0d                	je     403b55 <___pformat_int+0x55>
  403b48:	85 ff                	test   edi,edi
  403b4a:	0f 88 b0 01 00 00    	js     403d00 <___pformat_int+0x200>
  403b50:	24 7f                	and    al,0x7f
  403b52:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
  403b55:	8b 4d dc             	mov    ecx,DWORD PTR [ebp-0x24]
  403b58:	8b 7d d8             	mov    edi,DWORD PTR [ebp-0x28]
  403b5b:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
  403b5e:	89 c8                	mov    eax,ecx
  403b60:	09 f8                	or     eax,edi
  403b62:	74 5d                	je     403bc1 <___pformat_int+0xc1>
  403b64:	89 5d d8             	mov    DWORD PTR [ebp-0x28],ebx
  403b67:	89 cb                	mov    ebx,ecx
  403b69:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  403b70:	89 3c 24             	mov    DWORD PTR [esp],edi
  403b73:	83 c6 01             	add    esi,0x1
  403b76:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  403b7a:	c7 44 24 08 0a 00 00 	mov    DWORD PTR [esp+0x8],0xa
  403b81:	00 
  403b82:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  403b89:	00 
  403b8a:	e8 f1 46 00 00       	call   408280 <___umoddi3>
  403b8f:	83 c0 30             	add    eax,0x30
  403b92:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  403b95:	89 3c 24             	mov    DWORD PTR [esp],edi
  403b98:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  403b9c:	c7 44 24 08 0a 00 00 	mov    DWORD PTR [esp+0x8],0xa
  403ba3:	00 
  403ba4:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  403bab:	00 
  403bac:	e8 1f 48 00 00       	call   4083d0 <___udivdi3>
  403bb1:	89 c7                	mov    edi,eax
  403bb3:	89 d0                	mov    eax,edx
  403bb5:	09 f8                	or     eax,edi
  403bb7:	89 d3                	mov    ebx,edx
  403bb9:	75 b5                	jne    403b70 <___pformat_int+0x70>
  403bbb:	8b 5d d8             	mov    ebx,DWORD PTR [ebp-0x28]
  403bbe:	8b 53 0c             	mov    edx,DWORD PTR [ebx+0xc]
  403bc1:	85 d2                	test   edx,edx
  403bc3:	89 f7                	mov    edi,esi
  403bc5:	7e 19                	jle    403be0 <___pformat_int+0xe0>
  403bc7:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403bca:	29 f0                	sub    eax,esi
  403bcc:	01 c2                	add    edx,eax
  403bce:	85 d2                	test   edx,edx
  403bd0:	7e 0e                	jle    403be0 <___pformat_int+0xe0>
  403bd2:	8d 3c 16             	lea    edi,[esi+edx*1]
  403bd5:	83 c6 01             	add    esi,0x1
  403bd8:	39 fe                	cmp    esi,edi
  403bda:	c6 46 ff 30          	mov    BYTE PTR [esi-0x1],0x30
  403bde:	75 f5                	jne    403bd5 <___pformat_int+0xd5>
  403be0:	3b 7d e4             	cmp    edi,DWORD PTR [ebp-0x1c]
  403be3:	0f 84 29 01 00 00    	je     403d12 <___pformat_int+0x212>
  403be9:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403bec:	85 c0                	test   eax,eax
  403bee:	7e 59                	jle    403c49 <___pformat_int+0x149>
  403bf0:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  403bf3:	29 fa                	sub    edx,edi
  403bf5:	01 c2                	add    edx,eax
  403bf7:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  403bfa:	85 d2                	test   edx,edx
  403bfc:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403bff:	7e 4b                	jle    403c4c <___pformat_int+0x14c>
  403c01:	a9 c0 01 00 00       	test   eax,0x1c0
  403c06:	74 06                	je     403c0e <___pformat_int+0x10e>
  403c08:	83 ea 01             	sub    edx,0x1
  403c0b:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403c0e:	8b 53 0c             	mov    edx,DWORD PTR [ebx+0xc]
  403c11:	85 d2                	test   edx,edx
  403c13:	0f 88 a7 00 00 00    	js     403cc0 <___pformat_int+0x1c0>
  403c19:	f6 c4 04             	test   ah,0x4
  403c1c:	75 2e                	jne    403c4c <___pformat_int+0x14c>
  403c1e:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  403c21:	8d 4a ff             	lea    ecx,[edx-0x1]
  403c24:	85 d2                	test   edx,edx
  403c26:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  403c29:	7e 21                	jle    403c4c <___pformat_int+0x14c>
  403c2b:	90                   	nop
  403c2c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403c30:	89 da                	mov    edx,ebx
  403c32:	b8 20 00 00 00       	mov    eax,0x20
  403c37:	e8 14 fc ff ff       	call   403850 <___pformat_putc>
  403c3c:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403c3f:	8d 50 ff             	lea    edx,[eax-0x1]
  403c42:	85 c0                	test   eax,eax
  403c44:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403c47:	7f e7                	jg     403c30 <___pformat_int+0x130>
  403c49:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  403c4c:	a8 80                	test   al,0x80
  403c4e:	74 51                	je     403ca1 <___pformat_int+0x1a1>
  403c50:	8d 77 01             	lea    esi,[edi+0x1]
  403c53:	c6 07 2d             	mov    BYTE PTR [edi],0x2d
  403c56:	39 75 e4             	cmp    DWORD PTR [ebp-0x1c],esi
  403c59:	8b 7d e4             	mov    edi,DWORD PTR [ebp-0x1c]
  403c5c:	73 2e                	jae    403c8c <___pformat_int+0x18c>
  403c5e:	66 90                	xchg   ax,ax
  403c60:	83 ee 01             	sub    esi,0x1
  403c63:	0f be 06             	movsx  eax,BYTE PTR [esi]
  403c66:	89 da                	mov    edx,ebx
  403c68:	e8 e3 fb ff ff       	call   403850 <___pformat_putc>
  403c6d:	39 fe                	cmp    esi,edi
  403c6f:	75 ef                	jne    403c60 <___pformat_int+0x160>
  403c71:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403c74:	8d 50 ff             	lea    edx,[eax-0x1]
  403c77:	85 c0                	test   eax,eax
  403c79:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403c7c:	7e 1b                	jle    403c99 <___pformat_int+0x199>
  403c7e:	66 90                	xchg   ax,ax
  403c80:	89 da                	mov    edx,ebx
  403c82:	b8 20 00 00 00       	mov    eax,0x20
  403c87:	e8 c4 fb ff ff       	call   403850 <___pformat_putc>
  403c8c:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403c8f:	8d 50 ff             	lea    edx,[eax-0x1]
  403c92:	85 c0                	test   eax,eax
  403c94:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403c97:	7f e7                	jg     403c80 <___pformat_int+0x180>
  403c99:	8d 65 f4             	lea    esp,[ebp-0xc]
  403c9c:	5b                   	pop    ebx
  403c9d:	5e                   	pop    esi
  403c9e:	5f                   	pop    edi
  403c9f:	5d                   	pop    ebp
  403ca0:	c3                   	ret    
  403ca1:	f6 c4 01             	test   ah,0x1
  403ca4:	74 0a                	je     403cb0 <___pformat_int+0x1b0>
  403ca6:	8d 77 01             	lea    esi,[edi+0x1]
  403ca9:	c6 07 2b             	mov    BYTE PTR [edi],0x2b
  403cac:	eb a8                	jmp    403c56 <___pformat_int+0x156>
  403cae:	66 90                	xchg   ax,ax
  403cb0:	a8 40                	test   al,0x40
  403cb2:	89 fe                	mov    esi,edi
  403cb4:	74 a0                	je     403c56 <___pformat_int+0x156>
  403cb6:	83 c6 01             	add    esi,0x1
  403cb9:	c6 07 20             	mov    BYTE PTR [edi],0x20
  403cbc:	eb 98                	jmp    403c56 <___pformat_int+0x156>
  403cbe:	66 90                	xchg   ax,ax
  403cc0:	89 c2                	mov    edx,eax
  403cc2:	81 e2 00 06 00 00    	and    edx,0x600
  403cc8:	81 fa 00 02 00 00    	cmp    edx,0x200
  403cce:	0f 85 45 ff ff ff    	jne    403c19 <___pformat_int+0x119>
  403cd4:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  403cd7:	8d 4a ff             	lea    ecx,[edx-0x1]
  403cda:	85 d2                	test   edx,edx
  403cdc:	89 4b 08             	mov    DWORD PTR [ebx+0x8],ecx
  403cdf:	0f 8e 67 ff ff ff    	jle    403c4c <___pformat_int+0x14c>
  403ce5:	83 c7 01             	add    edi,0x1
  403ce8:	c6 47 ff 30          	mov    BYTE PTR [edi-0x1],0x30
  403cec:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  403cef:	8d 50 ff             	lea    edx,[eax-0x1]
  403cf2:	85 c0                	test   eax,eax
  403cf4:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  403cf7:	7f ec                	jg     403ce5 <___pformat_int+0x1e5>
  403cf9:	e9 4b ff ff ff       	jmp    403c49 <___pformat_int+0x149>
  403cfe:	66 90                	xchg   ax,ax
  403d00:	f7 de                	neg    esi
  403d02:	83 d7 00             	adc    edi,0x0
  403d05:	f7 df                	neg    edi
  403d07:	89 75 d8             	mov    DWORD PTR [ebp-0x28],esi
  403d0a:	89 7d dc             	mov    DWORD PTR [ebp-0x24],edi
  403d0d:	e9 43 fe ff ff       	jmp    403b55 <___pformat_int+0x55>
  403d12:	8b 4b 0c             	mov    ecx,DWORD PTR [ebx+0xc]
  403d15:	85 c9                	test   ecx,ecx
  403d17:	0f 84 cc fe ff ff    	je     403be9 <___pformat_int+0xe9>
  403d1d:	c6 07 30             	mov    BYTE PTR [edi],0x30
  403d20:	83 c7 01             	add    edi,0x1
  403d23:	e9 c1 fe ff ff       	jmp    403be9 <___pformat_int+0xe9>
  403d28:	90                   	nop
  403d29:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00403d30 <___pformat_xint>:
  403d30:	55                   	push   ebp
  403d31:	89 e5                	mov    ebp,esp
  403d33:	57                   	push   edi
  403d34:	89 cf                	mov    edi,ecx
  403d36:	56                   	push   esi
  403d37:	89 d6                	mov    esi,edx
  403d39:	53                   	push   ebx
  403d3a:	83 ec 2c             	sub    esp,0x2c
  403d3d:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
  403d40:	31 d2                	xor    edx,edx
  403d42:	83 f8 6f             	cmp    eax,0x6f
  403d45:	0f 94 c2             	sete   dl
  403d48:	83 ea 01             	sub    edx,0x1
  403d4b:	83 e2 fa             	and    edx,0xfffffffa
  403d4e:	89 4d d4             	mov    DWORD PTR [ebp-0x2c],ecx
  403d51:	31 c9                	xor    ecx,ecx
  403d53:	83 f8 6f             	cmp    eax,0x6f
  403d56:	0f 95 c1             	setne  cl
  403d59:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  403d5c:	89 c8                	mov    eax,ecx
  403d5e:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  403d61:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403d64:	8d 1c cd 07 00 00 00 	lea    ebx,[ecx*8+0x7]
  403d6b:	89 5d d0             	mov    DWORD PTR [ebp-0x30],ebx
  403d6e:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  403d71:	83 45 e4 03          	add    DWORD PTR [ebp-0x1c],0x3
  403d75:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  403d78:	8b 49 08             	mov    ecx,DWORD PTR [ecx+0x8]
  403d7b:	89 d8                	mov    eax,ebx
  403d7d:	c1 f8 1f             	sar    eax,0x1f
  403d80:	f7 d0                	not    eax
  403d82:	21 d8                	and    eax,ebx
  403d84:	8d 44 02 18          	lea    eax,[edx+eax*1+0x18]
  403d88:	39 c8                	cmp    eax,ecx
  403d8a:	7d 02                	jge    403d8e <___pformat_xint+0x5e>
  403d8c:	89 c8                	mov    eax,ecx
  403d8e:	83 c0 0f             	add    eax,0xf
  403d91:	83 e0 f0             	and    eax,0xfffffff0
  403d94:	e8 47 e3 ff ff       	call   4020e0 <___chkstk_ms>
  403d99:	29 c4                	sub    esp,eax
  403d9b:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  403d9e:	0b 45 dc             	or     eax,DWORD PTR [ebp-0x24]
  403da1:	89 65 e0             	mov    DWORD PTR [ebp-0x20],esp
  403da4:	0f 84 4a 02 00 00    	je     403ff4 <___pformat_xint+0x2c4>
  403daa:	0f b6 4d d8          	movzx  ecx,BYTE PTR [ebp-0x28]
  403dae:	89 e0                	mov    eax,esp
  403db0:	0f b6 5d d0          	movzx  ebx,BYTE PTR [ebp-0x30]
  403db4:	83 e1 20             	and    ecx,0x20
  403db7:	88 4d dc             	mov    BYTE PTR [ebp-0x24],cl
  403dba:	eb 1f                	jmp    403ddb <___pformat_xint+0xab>
  403dbc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403dc0:	88 48 ff             	mov    BYTE PTR [eax-0x1],cl
  403dc3:	0f b6 4d e4          	movzx  ecx,BYTE PTR [ebp-0x1c]
  403dc7:	0f ad fe             	shrd   esi,edi,cl
  403dca:	d3 ef                	shr    edi,cl
  403dcc:	f6 c1 20             	test   cl,0x20
  403dcf:	74 04                	je     403dd5 <___pformat_xint+0xa5>
  403dd1:	89 fe                	mov    esi,edi
  403dd3:	31 ff                	xor    edi,edi
  403dd5:	89 f9                	mov    ecx,edi
  403dd7:	09 f1                	or     ecx,esi
  403dd9:	74 1a                	je     403df5 <___pformat_xint+0xc5>
  403ddb:	89 f2                	mov    edx,esi
  403ddd:	83 c0 01             	add    eax,0x1
  403de0:	21 da                	and    edx,ebx
  403de2:	8d 4a 30             	lea    ecx,[edx+0x30]
  403de5:	80 f9 39             	cmp    cl,0x39
  403de8:	7e d6                	jle    403dc0 <___pformat_xint+0x90>
  403dea:	83 c2 37             	add    edx,0x37
  403ded:	0a 55 dc             	or     dl,BYTE PTR [ebp-0x24]
  403df0:	88 50 ff             	mov    BYTE PTR [eax-0x1],dl
  403df3:	eb ce                	jmp    403dc3 <___pformat_xint+0x93>
  403df5:	39 45 e0             	cmp    DWORD PTR [ebp-0x20],eax
  403df8:	0f 84 f0 01 00 00    	je     403fee <___pformat_xint+0x2be>
  403dfe:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  403e01:	8b 5f 0c             	mov    ebx,DWORD PTR [edi+0xc]
  403e04:	85 db                	test   ebx,ebx
  403e06:	0f 8e a5 01 00 00    	jle    403fb1 <___pformat_xint+0x281>
  403e0c:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
  403e0f:	29 c1                	sub    ecx,eax
  403e11:	01 cb                	add    ebx,ecx
  403e13:	85 db                	test   ebx,ebx
  403e15:	0f 8e 96 01 00 00    	jle    403fb1 <___pformat_xint+0x281>
  403e1b:	8d 3c 18             	lea    edi,[eax+ebx*1]
  403e1e:	66 90                	xchg   ax,ax
  403e20:	83 c0 01             	add    eax,0x1
  403e23:	39 f8                	cmp    eax,edi
  403e25:	c6 40 ff 30          	mov    BYTE PTR [eax-0x1],0x30
  403e29:	75 f5                	jne    403e20 <___pformat_xint+0xf0>
  403e2b:	3b 7d e0             	cmp    edi,DWORD PTR [ebp-0x20]
  403e2e:	0f 84 a1 01 00 00    	je     403fd5 <___pformat_xint+0x2a5>
  403e34:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e37:	8b 70 08             	mov    esi,DWORD PTR [eax+0x8]
  403e3a:	89 f8                	mov    eax,edi
  403e3c:	2b 45 e0             	sub    eax,DWORD PTR [ebp-0x20]
  403e3f:	39 c6                	cmp    esi,eax
  403e41:	0f 8e a9 00 00 00    	jle    403ef0 <___pformat_xint+0x1c0>
  403e47:	29 c6                	sub    esi,eax
  403e49:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e4c:	85 f6                	test   esi,esi
  403e4e:	89 70 08             	mov    DWORD PTR [eax+0x8],esi
  403e51:	7e 21                	jle    403e74 <___pformat_xint+0x144>
  403e53:	83 7d d8 6f          	cmp    DWORD PTR [ebp-0x28],0x6f
  403e57:	74 0d                	je     403e66 <___pformat_xint+0x136>
  403e59:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e5c:	f6 40 05 08          	test   BYTE PTR [eax+0x5],0x8
  403e60:	0f 85 00 01 00 00    	jne    403f66 <___pformat_xint+0x236>
  403e66:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e69:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  403e6c:	85 db                	test   ebx,ebx
  403e6e:	0f 88 09 01 00 00    	js     403f7d <___pformat_xint+0x24d>
  403e74:	8d 46 ff             	lea    eax,[esi-0x1]
  403e77:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  403e7a:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  403e7d:	83 7d d8 6f          	cmp    DWORD PTR [ebp-0x28],0x6f
  403e81:	89 c3                	mov    ebx,eax
  403e83:	74 0d                	je     403e92 <___pformat_xint+0x162>
  403e85:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e88:	f6 40 05 08          	test   BYTE PTR [eax+0x5],0x8
  403e8c:	0f 85 be 00 00 00    	jne    403f50 <___pformat_xint+0x220>
  403e92:	85 f6                	test   esi,esi
  403e94:	7e 09                	jle    403e9f <___pformat_xint+0x16f>
  403e96:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403e99:	f6 40 05 04          	test   BYTE PTR [eax+0x5],0x4
  403e9d:	74 71                	je     403f10 <___pformat_xint+0x1e0>
  403e9f:	3b 7d e0             	cmp    edi,DWORD PTR [ebp-0x20]
  403ea2:	76 25                	jbe    403ec9 <___pformat_xint+0x199>
  403ea4:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
  403ea7:	8b 75 e0             	mov    esi,DWORD PTR [ebp-0x20]
  403eaa:	89 5d e0             	mov    DWORD PTR [ebp-0x20],ebx
  403ead:	89 fb                	mov    ebx,edi
  403eaf:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  403eb2:	83 eb 01             	sub    ebx,0x1
  403eb5:	0f be 03             	movsx  eax,BYTE PTR [ebx]
  403eb8:	89 fa                	mov    edx,edi
  403eba:	e8 91 f9 ff ff       	call   403850 <___pformat_putc>
  403ebf:	39 f3                	cmp    ebx,esi
  403ec1:	75 ef                	jne    403eb2 <___pformat_xint+0x182>
  403ec3:	8b 75 e4             	mov    esi,DWORD PTR [ebp-0x1c]
  403ec6:	8b 5d e0             	mov    ebx,DWORD PTR [ebp-0x20]
  403ec9:	85 f6                	test   esi,esi
  403ecb:	7e 19                	jle    403ee6 <___pformat_xint+0x1b6>
  403ecd:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  403ed0:	b8 20 00 00 00       	mov    eax,0x20
  403ed5:	83 eb 01             	sub    ebx,0x1
  403ed8:	89 f2                	mov    edx,esi
  403eda:	e8 71 f9 ff ff       	call   403850 <___pformat_putc>
  403edf:	8d 43 01             	lea    eax,[ebx+0x1]
  403ee2:	85 c0                	test   eax,eax
  403ee4:	7f ea                	jg     403ed0 <___pformat_xint+0x1a0>
  403ee6:	8d 65 f4             	lea    esp,[ebp-0xc]
  403ee9:	5b                   	pop    ebx
  403eea:	5e                   	pop    esi
  403eeb:	5f                   	pop    edi
  403eec:	5d                   	pop    ebp
  403eed:	c3                   	ret    
  403eee:	66 90                	xchg   ax,ax
  403ef0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403ef3:	be ff ff ff ff       	mov    esi,0xffffffff
  403ef8:	c7 45 e4 fe ff ff ff 	mov    DWORD PTR [ebp-0x1c],0xfffffffe
  403eff:	c7 40 08 ff ff ff ff 	mov    DWORD PTR [eax+0x8],0xffffffff
  403f06:	e9 6f ff ff ff       	jmp    403e7a <___pformat_xint+0x14a>
  403f0b:	90                   	nop
  403f0c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403f10:	8b 5d e4             	mov    ebx,DWORD PTR [ebp-0x1c]
  403f13:	89 c6                	mov    esi,eax
  403f15:	b8 20 00 00 00       	mov    eax,0x20
  403f1a:	83 eb 01             	sub    ebx,0x1
  403f1d:	89 f2                	mov    edx,esi
  403f1f:	e8 2c f9 ff ff       	call   403850 <___pformat_putc>
  403f24:	8d 43 01             	lea    eax,[ebx+0x1]
  403f27:	85 c0                	test   eax,eax
  403f29:	7f ea                	jg     403f15 <___pformat_xint+0x1e5>
  403f2b:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  403f2e:	89 c8                	mov    eax,ecx
  403f30:	c1 f8 1f             	sar    eax,0x1f
  403f33:	f7 d0                	not    eax
  403f35:	8d 71 ff             	lea    esi,[ecx-0x1]
  403f38:	21 c8                	and    eax,ecx
  403f3a:	29 c6                	sub    esi,eax
  403f3c:	8d 5e ff             	lea    ebx,[esi-0x1]
  403f3f:	e9 5b ff ff ff       	jmp    403e9f <___pformat_xint+0x16f>
  403f44:	83 ee 03             	sub    esi,0x3
  403f47:	89 75 e4             	mov    DWORD PTR [ebp-0x1c],esi
  403f4a:	89 c6                	mov    esi,eax
  403f4c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  403f50:	0f b6 45 d8          	movzx  eax,BYTE PTR [ebp-0x28]
  403f54:	83 c7 02             	add    edi,0x2
  403f57:	c6 47 ff 30          	mov    BYTE PTR [edi-0x1],0x30
  403f5b:	8b 5d e4             	mov    ebx,DWORD PTR [ebp-0x1c]
  403f5e:	88 47 fe             	mov    BYTE PTR [edi-0x2],al
  403f61:	e9 2c ff ff ff       	jmp    403e92 <___pformat_xint+0x162>
  403f66:	8d 46 fe             	lea    eax,[esi-0x2]
  403f69:	85 c0                	test   eax,eax
  403f6b:	7e d7                	jle    403f44 <___pformat_xint+0x214>
  403f6d:	89 c6                	mov    esi,eax
  403f6f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403f72:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  403f75:	85 db                	test   ebx,ebx
  403f77:	0f 89 f7 fe ff ff    	jns    403e74 <___pformat_xint+0x144>
  403f7d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403f80:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  403f83:	25 00 06 00 00       	and    eax,0x600
  403f88:	3d 00 02 00 00       	cmp    eax,0x200
  403f8d:	0f 85 e1 fe ff ff    	jne    403e74 <___pformat_xint+0x144>
  403f93:	01 fe                	add    esi,edi
  403f95:	83 c7 01             	add    edi,0x1
  403f98:	39 f7                	cmp    edi,esi
  403f9a:	c6 47 ff 30          	mov    BYTE PTR [edi-0x1],0x30
  403f9e:	75 f5                	jne    403f95 <___pformat_xint+0x265>
  403fa0:	c7 45 e4 fe ff ff ff 	mov    DWORD PTR [ebp-0x1c],0xfffffffe
  403fa7:	be ff ff ff ff       	mov    esi,0xffffffff
  403fac:	e9 c9 fe ff ff       	jmp    403e7a <___pformat_xint+0x14a>
  403fb1:	83 7d d8 6f          	cmp    DWORD PTR [ebp-0x28],0x6f
  403fb5:	89 c7                	mov    edi,eax
  403fb7:	0f 85 6e fe ff ff    	jne    403e2b <___pformat_xint+0xfb>
  403fbd:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  403fc0:	f6 46 05 08          	test   BYTE PTR [esi+0x5],0x8
  403fc4:	0f 84 61 fe ff ff    	je     403e2b <___pformat_xint+0xfb>
  403fca:	83 c7 01             	add    edi,0x1
  403fcd:	c6 00 30             	mov    BYTE PTR [eax],0x30
  403fd0:	e9 56 fe ff ff       	jmp    403e2b <___pformat_xint+0xfb>
  403fd5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403fd8:	8b 70 0c             	mov    esi,DWORD PTR [eax+0xc]
  403fdb:	85 f6                	test   esi,esi
  403fdd:	0f 84 51 fe ff ff    	je     403e34 <___pformat_xint+0x104>
  403fe3:	c6 07 30             	mov    BYTE PTR [edi],0x30
  403fe6:	83 c7 01             	add    edi,0x1
  403fe9:	e9 46 fe ff ff       	jmp    403e34 <___pformat_xint+0x104>
  403fee:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403ff1:	8b 58 0c             	mov    ebx,DWORD PTR [eax+0xc]
  403ff4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  403ff7:	81 60 04 ff f7 ff ff 	and    DWORD PTR [eax+0x4],0xfffff7ff
  403ffe:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  404001:	e9 fe fd ff ff       	jmp    403e04 <___pformat_xint+0xd4>
  404006:	8d 76 00             	lea    esi,[esi+0x0]
  404009:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00404010 <___pformat_emit_float>:
  404010:	55                   	push   ebp
  404011:	89 e5                	mov    ebp,esp
  404013:	57                   	push   edi
  404014:	56                   	push   esi
  404015:	89 d6                	mov    esi,edx
  404017:	53                   	push   ebx
  404018:	89 cb                	mov    ebx,ecx
  40401a:	83 ec 3c             	sub    esp,0x3c
  40401d:	8b 7d 08             	mov    edi,DWORD PTR [ebp+0x8]
  404020:	85 c9                	test   ecx,ecx
  404022:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  404025:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404028:	0f 8e 7a 02 00 00    	jle    4042a8 <___pformat_emit_float+0x298>
  40402e:	39 c1                	cmp    ecx,eax
  404030:	0f 8d 3a 01 00 00    	jge    404170 <___pformat_emit_float+0x160>
  404036:	29 c8                	sub    eax,ecx
  404038:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  40403b:	85 c0                	test   eax,eax
  40403d:	0f 88 2d 01 00 00    	js     404170 <___pformat_emit_float+0x160>
  404043:	8b 57 0c             	mov    edx,DWORD PTR [edi+0xc]
  404046:	39 c2                	cmp    edx,eax
  404048:	0f 8d 22 01 00 00    	jge    404170 <___pformat_emit_float+0x160>
  40404e:	29 d0                	sub    eax,edx
  404050:	85 c0                	test   eax,eax
  404052:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  404055:	0f 8e 1c 01 00 00    	jle    404177 <___pformat_emit_float+0x167>
  40405b:	85 d2                	test   edx,edx
  40405d:	0f 8e ad 02 00 00    	jle    404310 <___pformat_emit_float+0x300>
  404063:	83 e8 01             	sub    eax,0x1
  404066:	85 c0                	test   eax,eax
  404068:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  40406b:	0f 84 06 01 00 00    	je     404177 <___pformat_emit_float+0x167>
  404071:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  404074:	85 d2                	test   edx,edx
  404076:	0f 85 ba 01 00 00    	jne    404236 <___pformat_emit_float+0x226>
  40407c:	8b 57 04             	mov    edx,DWORD PTR [edi+0x4]
  40407f:	f7 c2 c0 01 00 00    	test   edx,0x1c0
  404085:	0f 85 ab 01 00 00    	jne    404236 <___pformat_emit_float+0x226>
  40408b:	80 e6 06             	and    dh,0x6
  40408e:	0f 85 e3 00 00 00    	jne    404177 <___pformat_emit_float+0x167>
  404094:	eb 0c                	jmp    4040a2 <___pformat_emit_float+0x92>
  404096:	89 fa                	mov    edx,edi
  404098:	b8 20 00 00 00       	mov    eax,0x20
  40409d:	e8 ae f7 ff ff       	call   403850 <___pformat_putc>
  4040a2:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  4040a5:	8d 50 ff             	lea    edx,[eax-0x1]
  4040a8:	85 c0                	test   eax,eax
  4040aa:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  4040ad:	7f e7                	jg     404096 <___pformat_emit_float+0x86>
  4040af:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4040b2:	85 c0                	test   eax,eax
  4040b4:	0f 84 c8 00 00 00    	je     404182 <___pformat_emit_float+0x172>
  4040ba:	89 fa                	mov    edx,edi
  4040bc:	b8 2d 00 00 00       	mov    eax,0x2d
  4040c1:	e8 8a f7 ff ff       	call   403850 <___pformat_putc>
  4040c6:	8b 57 08             	mov    edx,DWORD PTR [edi+0x8]
  4040c9:	85 d2                	test   edx,edx
  4040cb:	7e 13                	jle    4040e0 <___pformat_emit_float+0xd0>
  4040cd:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  4040d0:	25 00 06 00 00       	and    eax,0x600
  4040d5:	3d 00 02 00 00       	cmp    eax,0x200
  4040da:	0f 84 f1 01 00 00    	je     4042d1 <___pformat_emit_float+0x2c1>
  4040e0:	85 db                	test   ebx,ebx
  4040e2:	0f 8e 10 02 00 00    	jle    4042f8 <___pformat_emit_float+0x2e8>
  4040e8:	0f b6 16             	movzx  edx,BYTE PTR [esi]
  4040eb:	b8 30 00 00 00       	mov    eax,0x30
  4040f0:	84 d2                	test   dl,dl
  4040f2:	74 06                	je     4040fa <___pformat_emit_float+0xea>
  4040f4:	83 c6 01             	add    esi,0x1
  4040f7:	0f be c2             	movsx  eax,dl
  4040fa:	89 fa                	mov    edx,edi
  4040fc:	e8 4f f7 ff ff       	call   403850 <___pformat_putc>
  404101:	83 eb 01             	sub    ebx,0x1
  404104:	75 e2                	jne    4040e8 <___pformat_emit_float+0xd8>
  404106:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  404109:	85 c0                	test   eax,eax
  40410b:	0f 8e 3f 01 00 00    	jle    404250 <___pformat_emit_float+0x240>
  404111:	83 7f 10 fd          	cmp    DWORD PTR [edi+0x10],0xfffffffd
  404115:	0f 84 49 01 00 00    	je     404264 <___pformat_emit_float+0x254>
  40411b:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  40411f:	66 85 d2             	test   dx,dx
  404122:	0f 85 7f 00 00 00    	jne    4041a7 <___pformat_emit_float+0x197>
  404128:	b8 2e 00 00 00       	mov    eax,0x2e
  40412d:	89 fa                	mov    edx,edi
  40412f:	e8 1c f7 ff ff       	call   403850 <___pformat_putc>
  404134:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  404137:	85 db                	test   ebx,ebx
  404139:	74 21                	je     40415c <___pformat_emit_float+0x14c>
  40413b:	e9 d8 00 00 00       	jmp    404218 <___pformat_emit_float+0x208>
  404140:	0f b6 16             	movzx  edx,BYTE PTR [esi]
  404143:	b8 30 00 00 00       	mov    eax,0x30
  404148:	84 d2                	test   dl,dl
  40414a:	74 06                	je     404152 <___pformat_emit_float+0x142>
  40414c:	83 c6 01             	add    esi,0x1
  40414f:	0f be c2             	movsx  eax,dl
  404152:	89 fa                	mov    edx,edi
  404154:	e8 f7 f6 ff ff       	call   403850 <___pformat_putc>
  404159:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  40415c:	8d 50 ff             	lea    edx,[eax-0x1]
  40415f:	85 c0                	test   eax,eax
  404161:	89 57 0c             	mov    DWORD PTR [edi+0xc],edx
  404164:	7f da                	jg     404140 <___pformat_emit_float+0x130>
  404166:	8d 65 f4             	lea    esp,[ebp-0xc]
  404169:	5b                   	pop    ebx
  40416a:	5e                   	pop    esi
  40416b:	5f                   	pop    edi
  40416c:	5d                   	pop    ebp
  40416d:	c3                   	ret    
  40416e:	66 90                	xchg   ax,ax
  404170:	c7 47 08 ff ff ff ff 	mov    DWORD PTR [edi+0x8],0xffffffff
  404177:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  40417a:	85 c0                	test   eax,eax
  40417c:	0f 85 38 ff ff ff    	jne    4040ba <___pformat_emit_float+0xaa>
  404182:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404185:	f6 c4 01             	test   ah,0x1
  404188:	0f 85 32 01 00 00    	jne    4042c0 <___pformat_emit_float+0x2b0>
  40418e:	a8 40                	test   al,0x40
  404190:	0f 84 30 ff ff ff    	je     4040c6 <___pformat_emit_float+0xb6>
  404196:	89 fa                	mov    edx,edi
  404198:	b8 20 00 00 00       	mov    eax,0x20
  40419d:	e8 ae f6 ff ff       	call   403850 <___pformat_putc>
  4041a2:	e9 1f ff ff ff       	jmp    4040c6 <___pformat_emit_float+0xb6>
  4041a7:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
  4041aa:	89 65 d4             	mov    DWORD PTR [ebp-0x2c],esp
  4041ad:	83 c0 0f             	add    eax,0xf
  4041b0:	83 e0 f0             	and    eax,0xfffffff0
  4041b3:	e8 28 df ff ff       	call   4020e0 <___chkstk_ms>
  4041b8:	29 c4                	sub    esp,eax
  4041ba:	8d 4c 24 10          	lea    ecx,[esp+0x10]
  4041be:	8d 45 e4             	lea    eax,[ebp-0x1c]
  4041c1:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  4041c8:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4041cc:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4041d0:	89 0c 24             	mov    DWORD PTR [esp],ecx
  4041d3:	89 4d d0             	mov    DWORD PTR [ebp-0x30],ecx
  4041d6:	e8 b5 29 00 00       	call   406b90 <_wcrtomb>
  4041db:	85 c0                	test   eax,eax
  4041dd:	0f 8e 42 01 00 00    	jle    404325 <___pformat_emit_float+0x315>
  4041e3:	8b 4d d0             	mov    ecx,DWORD PTR [ebp-0x30]
  4041e6:	89 5d cc             	mov    DWORD PTR [ebp-0x34],ebx
  4041e9:	89 75 d0             	mov    DWORD PTR [ebp-0x30],esi
  4041ec:	01 c8                	add    eax,ecx
  4041ee:	89 cb                	mov    ebx,ecx
  4041f0:	89 c6                	mov    esi,eax
  4041f2:	83 c3 01             	add    ebx,0x1
  4041f5:	0f be 43 ff          	movsx  eax,BYTE PTR [ebx-0x1]
  4041f9:	89 fa                	mov    edx,edi
  4041fb:	e8 50 f6 ff ff       	call   403850 <___pformat_putc>
  404200:	39 f3                	cmp    ebx,esi
  404202:	75 ee                	jne    4041f2 <___pformat_emit_float+0x1e2>
  404204:	8b 75 d0             	mov    esi,DWORD PTR [ebp-0x30]
  404207:	8b 5d cc             	mov    ebx,DWORD PTR [ebp-0x34]
  40420a:	85 db                	test   ebx,ebx
  40420c:	8b 65 d4             	mov    esp,DWORD PTR [ebp-0x2c]
  40420f:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  404212:	0f 84 44 ff ff ff    	je     40415c <___pformat_emit_float+0x14c>
  404218:	01 d8                	add    eax,ebx
  40421a:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
  40421d:	8d 76 00             	lea    esi,[esi+0x0]
  404220:	89 fa                	mov    edx,edi
  404222:	b8 30 00 00 00       	mov    eax,0x30
  404227:	e8 24 f6 ff ff       	call   403850 <___pformat_putc>
  40422c:	83 c3 01             	add    ebx,0x1
  40422f:	78 ef                	js     404220 <___pformat_emit_float+0x210>
  404231:	e9 23 ff ff ff       	jmp    404159 <___pformat_emit_float+0x149>
  404236:	83 e8 01             	sub    eax,0x1
  404239:	85 c0                	test   eax,eax
  40423b:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  40423e:	0f 84 33 ff ff ff    	je     404177 <___pformat_emit_float+0x167>
  404244:	8b 57 04             	mov    edx,DWORD PTR [edi+0x4]
  404247:	e9 3f fe ff ff       	jmp    40408b <___pformat_emit_float+0x7b>
  40424c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404250:	f6 47 05 08          	test   BYTE PTR [edi+0x5],0x8
  404254:	0f 84 dd fe ff ff    	je     404137 <___pformat_emit_float+0x127>
  40425a:	83 7f 10 fd          	cmp    DWORD PTR [edi+0x10],0xfffffffd
  40425e:	0f 85 b7 fe ff ff    	jne    40411b <___pformat_emit_float+0x10b>
  404264:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
  40426b:	e8 40 3f 00 00       	call   4081b0 <_localeconv>
  404270:	8d 55 e4             	lea    edx,[ebp-0x1c]
  404273:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  404277:	c7 44 24 08 10 00 00 	mov    DWORD PTR [esp+0x8],0x10
  40427e:	00 
  40427f:	8b 00                	mov    eax,DWORD PTR [eax]
  404281:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  404285:	8d 45 e2             	lea    eax,[ebp-0x1e]
  404288:	89 04 24             	mov    DWORD PTR [esp],eax
  40428b:	e8 50 2c 00 00       	call   406ee0 <_mbrtowc>
  404290:	85 c0                	test   eax,eax
  404292:	0f 8e 9e 00 00 00    	jle    404336 <___pformat_emit_float+0x326>
  404298:	0f b7 55 e2          	movzx  edx,WORD PTR [ebp-0x1e]
  40429c:	66 89 57 14          	mov    WORD PTR [edi+0x14],dx
  4042a0:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
  4042a3:	e9 77 fe ff ff       	jmp    40411f <___pformat_emit_float+0x10f>
  4042a8:	85 c0                	test   eax,eax
  4042aa:	0f 8e 8b fd ff ff    	jle    40403b <___pformat_emit_float+0x2b>
  4042b0:	83 e8 01             	sub    eax,0x1
  4042b3:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  4042b6:	e9 88 fd ff ff       	jmp    404043 <___pformat_emit_float+0x33>
  4042bb:	90                   	nop
  4042bc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4042c0:	89 fa                	mov    edx,edi
  4042c2:	b8 2b 00 00 00       	mov    eax,0x2b
  4042c7:	e8 84 f5 ff ff       	call   403850 <___pformat_putc>
  4042cc:	e9 f5 fd ff ff       	jmp    4040c6 <___pformat_emit_float+0xb6>
  4042d1:	83 ea 01             	sub    edx,0x1
  4042d4:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  4042d7:	89 fa                	mov    edx,edi
  4042d9:	b8 30 00 00 00       	mov    eax,0x30
  4042de:	e8 6d f5 ff ff       	call   403850 <___pformat_putc>
  4042e3:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  4042e6:	8d 50 ff             	lea    edx,[eax-0x1]
  4042e9:	85 c0                	test   eax,eax
  4042eb:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  4042ee:	7f e7                	jg     4042d7 <___pformat_emit_float+0x2c7>
  4042f0:	85 db                	test   ebx,ebx
  4042f2:	0f 8f f0 fd ff ff    	jg     4040e8 <___pformat_emit_float+0xd8>
  4042f8:	89 fa                	mov    edx,edi
  4042fa:	b8 30 00 00 00       	mov    eax,0x30
  4042ff:	e8 4c f5 ff ff       	call   403850 <___pformat_putc>
  404304:	e9 fd fd ff ff       	jmp    404106 <___pformat_emit_float+0xf6>
  404309:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  404310:	f6 47 05 08          	test   BYTE PTR [edi+0x5],0x8
  404314:	0f 84 57 fd ff ff    	je     404071 <___pformat_emit_float+0x61>
  40431a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404320:	e9 3e fd ff ff       	jmp    404063 <___pformat_emit_float+0x53>
  404325:	89 fa                	mov    edx,edi
  404327:	b8 2e 00 00 00       	mov    eax,0x2e
  40432c:	e8 1f f5 ff ff       	call   403850 <___pformat_putc>
  404331:	e9 d4 fe ff ff       	jmp    40420a <___pformat_emit_float+0x1fa>
  404336:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  40433a:	e9 61 ff ff ff       	jmp    4042a0 <___pformat_emit_float+0x290>
  40433f:	90                   	nop

00404340 <___pformat_emit_efloat>:
  404340:	55                   	push   ebp
  404341:	83 e9 01             	sub    ecx,0x1
  404344:	57                   	push   edi
  404345:	89 d5                	mov    ebp,edx
  404347:	56                   	push   esi
  404348:	be 01 00 00 00       	mov    esi,0x1
  40434d:	53                   	push   ebx
  40434e:	bb 67 66 66 66       	mov    ebx,0x66666667
  404353:	83 ec 1c             	sub    esp,0x1c
  404356:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40435a:	89 c8                	mov    eax,ecx
  40435c:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  404360:	c1 f8 1f             	sar    eax,0x1f
  404363:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  404367:	89 c8                	mov    eax,ecx
  404369:	f7 eb                	imul   ebx
  40436b:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  40436f:	c1 f9 1f             	sar    ecx,0x1f
  404372:	c1 fa 02             	sar    edx,0x2
  404375:	89 d3                	mov    ebx,edx
  404377:	29 cb                	sub    ebx,ecx
  404379:	74 18                	je     404393 <___pformat_emit_efloat+0x53>
  40437b:	b9 67 66 66 66       	mov    ecx,0x66666667
  404380:	89 d8                	mov    eax,ebx
  404382:	83 c6 01             	add    esi,0x1
  404385:	f7 e9                	imul   ecx
  404387:	c1 fb 1f             	sar    ebx,0x1f
  40438a:	c1 fa 02             	sar    edx,0x2
  40438d:	29 da                	sub    edx,ebx
  40438f:	89 d3                	mov    ebx,edx
  404391:	75 ed                	jne    404380 <___pformat_emit_efloat+0x40>
  404393:	8b 47 20             	mov    eax,DWORD PTR [edi+0x20]
  404396:	39 c6                	cmp    esi,eax
  404398:	7d 02                	jge    40439c <___pformat_emit_efloat+0x5c>
  40439a:	89 c6                	mov    esi,eax
  40439c:	8b 57 08             	mov    edx,DWORD PTR [edi+0x8]
  40439f:	8d 46 02             	lea    eax,[esi+0x2]
  4043a2:	39 c2                	cmp    edx,eax
  4043a4:	7f 5a                	jg     404400 <___pformat_emit_efloat+0xc0>
  4043a6:	c7 47 08 ff ff ff ff 	mov    DWORD PTR [edi+0x8],0xffffffff
  4043ad:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  4043b1:	b9 01 00 00 00       	mov    ecx,0x1
  4043b6:	89 ea                	mov    edx,ebp
  4043b8:	89 3c 24             	mov    DWORD PTR [esp],edi
  4043bb:	83 c6 01             	add    esi,0x1
  4043be:	e8 4d fc ff ff       	call   404010 <___pformat_emit_float>
  4043c3:	8b 47 20             	mov    eax,DWORD PTR [edi+0x20]
  4043c6:	89 47 0c             	mov    DWORD PTR [edi+0xc],eax
  4043c9:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  4043cc:	89 c2                	mov    edx,eax
  4043ce:	83 e0 20             	and    eax,0x20
  4043d1:	81 ca c0 01 00 00    	or     edx,0x1c0
  4043d7:	83 c8 45             	or     eax,0x45
  4043da:	89 57 04             	mov    DWORD PTR [edi+0x4],edx
  4043dd:	89 fa                	mov    edx,edi
  4043df:	e8 6c f4 ff ff       	call   403850 <___pformat_putc>
  4043e4:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  4043e8:	89 f9                	mov    ecx,edi
  4043ea:	01 77 08             	add    DWORD PTR [edi+0x8],esi
  4043ed:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  4043f1:	e8 0a f7 ff ff       	call   403b00 <___pformat_int>
  4043f6:	83 c4 1c             	add    esp,0x1c
  4043f9:	5b                   	pop    ebx
  4043fa:	5e                   	pop    esi
  4043fb:	5f                   	pop    edi
  4043fc:	5d                   	pop    ebp
  4043fd:	c3                   	ret    
  4043fe:	66 90                	xchg   ax,ax
  404400:	29 c2                	sub    edx,eax
  404402:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  404405:	eb a6                	jmp    4043ad <___pformat_emit_efloat+0x6d>
  404407:	89 f6                	mov    esi,esi
  404409:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00404410 <___pformat_efloat>:
  404410:	56                   	push   esi
  404411:	53                   	push   ebx
  404412:	89 c3                	mov    ebx,eax
  404414:	83 ec 44             	sub    esp,0x44
  404417:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  40441a:	85 c0                	test   eax,eax
  40441c:	78 72                	js     404490 <___pformat_efloat+0x80>
  40441e:	83 c0 01             	add    eax,0x1
  404421:	db 6c 24 50          	fld    TBYTE PTR [esp+0x50]
  404425:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  404429:	8d 54 24 28          	lea    edx,[esp+0x28]
  40442d:	db 7c 24 30          	fstp   TBYTE PTR [esp+0x30]
  404431:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  404435:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  404439:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  40443d:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  404441:	89 04 24             	mov    DWORD PTR [esp],eax
  404444:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  404448:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40444c:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  404450:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  404454:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  404458:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40445c:	b8 02 00 00 00       	mov    eax,0x2
  404461:	e8 ea f2 ff ff       	call   403750 <___pformat_cvt>
  404466:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  40446a:	81 f9 00 80 ff ff    	cmp    ecx,0xffff8000
  404470:	89 c6                	mov    esi,eax
  404472:	74 2c                	je     4044a0 <___pformat_efloat+0x90>
  404474:	89 c2                	mov    edx,eax
  404476:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  40447a:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40447d:	e8 be fe ff ff       	call   404340 <___pformat_emit_efloat>
  404482:	89 34 24             	mov    DWORD PTR [esp],esi
  404485:	e8 86 2d 00 00       	call   407210 <___freedtoa>
  40448a:	83 c4 44             	add    esp,0x44
  40448d:	5b                   	pop    ebx
  40448e:	5e                   	pop    esi
  40448f:	c3                   	ret    
  404490:	c7 43 0c 06 00 00 00 	mov    DWORD PTR [ebx+0xc],0x6
  404497:	b8 07 00 00 00       	mov    eax,0x7
  40449c:	eb 83                	jmp    404421 <___pformat_efloat+0x11>
  40449e:	66 90                	xchg   ax,ax
  4044a0:	89 c2                	mov    edx,eax
  4044a2:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4044a6:	89 d9                	mov    ecx,ebx
  4044a8:	e8 c3 f5 ff ff       	call   403a70 <___pformat_emit_inf_or_nan>
  4044ad:	89 34 24             	mov    DWORD PTR [esp],esi
  4044b0:	e8 5b 2d 00 00       	call   407210 <___freedtoa>
  4044b5:	83 c4 44             	add    esp,0x44
  4044b8:	5b                   	pop    ebx
  4044b9:	5e                   	pop    esi
  4044ba:	c3                   	ret    
  4044bb:	90                   	nop
  4044bc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

004044c0 <___pformat_float>:
  4044c0:	57                   	push   edi
  4044c1:	56                   	push   esi
  4044c2:	53                   	push   ebx
  4044c3:	89 c3                	mov    ebx,eax
  4044c5:	83 ec 40             	sub    esp,0x40
  4044c8:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4044cb:	85 c0                	test   eax,eax
  4044cd:	0f 88 9d 00 00 00    	js     404570 <___pformat_float+0xb0>
  4044d3:	db 6c 24 50          	fld    TBYTE PTR [esp+0x50]
  4044d7:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4044db:	8d 54 24 28          	lea    edx,[esp+0x28]
  4044df:	db 7c 24 30          	fstp   TBYTE PTR [esp+0x30]
  4044e3:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4044e7:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  4044eb:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  4044ef:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  4044f3:	89 04 24             	mov    DWORD PTR [esp],eax
  4044f6:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  4044fa:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4044fe:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  404502:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  404506:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  40450a:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40450e:	b8 03 00 00 00       	mov    eax,0x3
  404513:	e8 38 f2 ff ff       	call   403750 <___pformat_cvt>
  404518:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  40451c:	81 f9 00 80 ff ff    	cmp    ecx,0xffff8000
  404522:	89 c7                	mov    edi,eax
  404524:	74 5b                	je     404581 <___pformat_float+0xc1>
  404526:	89 c2                	mov    edx,eax
  404528:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  40452c:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40452f:	e8 dc fa ff ff       	call   404010 <___pformat_emit_float>
  404534:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  404537:	8d 50 ff             	lea    edx,[eax-0x1]
  40453a:	85 c0                	test   eax,eax
  40453c:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  40453f:	7e 19                	jle    40455a <___pformat_float+0x9a>
  404541:	89 da                	mov    edx,ebx
  404543:	b8 20 00 00 00       	mov    eax,0x20
  404548:	e8 03 f3 ff ff       	call   403850 <___pformat_putc>
  40454d:	8b 4b 08             	mov    ecx,DWORD PTR [ebx+0x8]
  404550:	8d 71 ff             	lea    esi,[ecx-0x1]
  404553:	85 c9                	test   ecx,ecx
  404555:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
  404558:	7f e7                	jg     404541 <___pformat_float+0x81>
  40455a:	89 3c 24             	mov    DWORD PTR [esp],edi
  40455d:	e8 ae 2c 00 00       	call   407210 <___freedtoa>
  404562:	83 c4 40             	add    esp,0x40
  404565:	5b                   	pop    ebx
  404566:	5e                   	pop    esi
  404567:	5f                   	pop    edi
  404568:	c3                   	ret    
  404569:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  404570:	c7 43 0c 06 00 00 00 	mov    DWORD PTR [ebx+0xc],0x6
  404577:	b8 06 00 00 00       	mov    eax,0x6
  40457c:	e9 52 ff ff ff       	jmp    4044d3 <___pformat_float+0x13>
  404581:	89 c2                	mov    edx,eax
  404583:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  404587:	89 d9                	mov    ecx,ebx
  404589:	e8 e2 f4 ff ff       	call   403a70 <___pformat_emit_inf_or_nan>
  40458e:	89 3c 24             	mov    DWORD PTR [esp],edi
  404591:	e8 7a 2c 00 00       	call   407210 <___freedtoa>
  404596:	83 c4 40             	add    esp,0x40
  404599:	5b                   	pop    ebx
  40459a:	5e                   	pop    esi
  40459b:	5f                   	pop    edi
  40459c:	c3                   	ret    
  40459d:	8d 76 00             	lea    esi,[esi+0x0]

004045a0 <___pformat_gfloat>:
  4045a0:	57                   	push   edi
  4045a1:	56                   	push   esi
  4045a2:	53                   	push   ebx
  4045a3:	89 c3                	mov    ebx,eax
  4045a5:	83 ec 40             	sub    esp,0x40
  4045a8:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4045ab:	85 c0                	test   eax,eax
  4045ad:	0f 88 1d 01 00 00    	js     4046d0 <___pformat_gfloat+0x130>
  4045b3:	0f 84 fa 00 00 00    	je     4046b3 <___pformat_gfloat+0x113>
  4045b9:	db 6c 24 50          	fld    TBYTE PTR [esp+0x50]
  4045bd:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4045c1:	8d 54 24 28          	lea    edx,[esp+0x28]
  4045c5:	db 7c 24 30          	fstp   TBYTE PTR [esp+0x30]
  4045c9:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4045cd:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  4045d1:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  4045d5:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
  4045d9:	89 04 24             	mov    DWORD PTR [esp],eax
  4045dc:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  4045e0:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4045e4:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  4045e8:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4045ec:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  4045f0:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4045f4:	b8 02 00 00 00       	mov    eax,0x2
  4045f9:	e8 52 f1 ff ff       	call   403750 <___pformat_cvt>
  4045fe:	8b 74 24 2c          	mov    esi,DWORD PTR [esp+0x2c]
  404602:	81 fe 00 80 ff ff    	cmp    esi,0xffff8000
  404608:	89 c7                	mov    edi,eax
  40460a:	0f 84 e0 00 00 00    	je     4046f0 <___pformat_gfloat+0x150>
  404610:	83 fe fd             	cmp    esi,0xfffffffd
  404613:	7c 6b                	jl     404680 <___pformat_gfloat+0xe0>
  404615:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
  404618:	39 c6                	cmp    esi,eax
  40461a:	7f 64                	jg     404680 <___pformat_gfloat+0xe0>
  40461c:	f6 43 05 08          	test   BYTE PTR [ebx+0x5],0x8
  404620:	0f 85 bb 00 00 00    	jne    4046e1 <___pformat_gfloat+0x141>
  404626:	89 3c 24             	mov    DWORD PTR [esp],edi
  404629:	e8 f2 3a 00 00       	call   408120 <_strlen>
  40462e:	29 f0                	sub    eax,esi
  404630:	85 c0                	test   eax,eax
  404632:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  404635:	0f 88 c5 00 00 00    	js     404700 <___pformat_gfloat+0x160>
  40463b:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  40463f:	89 fa                	mov    edx,edi
  404641:	89 f1                	mov    ecx,esi
  404643:	89 1c 24             	mov    DWORD PTR [esp],ebx
  404646:	e8 c5 f9 ff ff       	call   404010 <___pformat_emit_float>
  40464b:	8b 43 08             	mov    eax,DWORD PTR [ebx+0x8]
  40464e:	8d 50 ff             	lea    edx,[eax-0x1]
  404651:	85 c0                	test   eax,eax
  404653:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
  404656:	7e 4c                	jle    4046a4 <___pformat_gfloat+0x104>
  404658:	89 da                	mov    edx,ebx
  40465a:	b8 20 00 00 00       	mov    eax,0x20
  40465f:	e8 ec f1 ff ff       	call   403850 <___pformat_putc>
  404664:	8b 4b 08             	mov    ecx,DWORD PTR [ebx+0x8]
  404667:	8d 71 ff             	lea    esi,[ecx-0x1]
  40466a:	85 c9                	test   ecx,ecx
  40466c:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
  40466f:	7f e7                	jg     404658 <___pformat_gfloat+0xb8>
  404671:	89 3c 24             	mov    DWORD PTR [esp],edi
  404674:	e8 97 2b 00 00       	call   407210 <___freedtoa>
  404679:	83 c4 40             	add    esp,0x40
  40467c:	5b                   	pop    ebx
  40467d:	5e                   	pop    esi
  40467e:	5f                   	pop    edi
  40467f:	c3                   	ret    
  404680:	f6 43 05 08          	test   BYTE PTR [ebx+0x5],0x8
  404684:	75 3e                	jne    4046c4 <___pformat_gfloat+0x124>
  404686:	89 3c 24             	mov    DWORD PTR [esp],edi
  404689:	e8 92 3a 00 00       	call   408120 <_strlen>
  40468e:	83 e8 01             	sub    eax,0x1
  404691:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  404694:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  404698:	89 f1                	mov    ecx,esi
  40469a:	89 fa                	mov    edx,edi
  40469c:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40469f:	e8 9c fc ff ff       	call   404340 <___pformat_emit_efloat>
  4046a4:	89 3c 24             	mov    DWORD PTR [esp],edi
  4046a7:	e8 64 2b 00 00       	call   407210 <___freedtoa>
  4046ac:	83 c4 40             	add    esp,0x40
  4046af:	5b                   	pop    ebx
  4046b0:	5e                   	pop    esi
  4046b1:	5f                   	pop    edi
  4046b2:	c3                   	ret    
  4046b3:	c7 43 0c 01 00 00 00 	mov    DWORD PTR [ebx+0xc],0x1
  4046ba:	b8 01 00 00 00       	mov    eax,0x1
  4046bf:	e9 f5 fe ff ff       	jmp    4045b9 <___pformat_gfloat+0x19>
  4046c4:	83 6b 0c 01          	sub    DWORD PTR [ebx+0xc],0x1
  4046c8:	eb ca                	jmp    404694 <___pformat_gfloat+0xf4>
  4046ca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4046d0:	c7 43 0c 06 00 00 00 	mov    DWORD PTR [ebx+0xc],0x6
  4046d7:	b8 06 00 00 00       	mov    eax,0x6
  4046dc:	e9 d8 fe ff ff       	jmp    4045b9 <___pformat_gfloat+0x19>
  4046e1:	29 f0                	sub    eax,esi
  4046e3:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
  4046e6:	e9 50 ff ff ff       	jmp    40463b <___pformat_gfloat+0x9b>
  4046eb:	90                   	nop
  4046ec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4046f0:	89 c2                	mov    edx,eax
  4046f2:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4046f6:	89 d9                	mov    ecx,ebx
  4046f8:	e8 73 f3 ff ff       	call   403a70 <___pformat_emit_inf_or_nan>
  4046fd:	eb a5                	jmp    4046a4 <___pformat_gfloat+0x104>
  4046ff:	90                   	nop
  404700:	8b 53 08             	mov    edx,DWORD PTR [ebx+0x8]
  404703:	85 d2                	test   edx,edx
  404705:	0f 8e 30 ff ff ff    	jle    40463b <___pformat_gfloat+0x9b>
  40470b:	01 d0                	add    eax,edx
  40470d:	89 43 08             	mov    DWORD PTR [ebx+0x8],eax
  404710:	e9 26 ff ff ff       	jmp    40463b <___pformat_gfloat+0x9b>
  404715:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404719:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00404720 <___pformat_xldouble>:
  404720:	55                   	push   ebp
  404721:	89 e5                	mov    ebp,esp
  404723:	57                   	push   edi
  404724:	89 c7                	mov    edi,eax
  404726:	56                   	push   esi
  404727:	53                   	push   ebx
  404728:	83 ec 6c             	sub    esp,0x6c
  40472b:	db 6d 08             	fld    TBYTE PTR [ebp+0x8]
  40472e:	d9 c0                	fld    st(0)
  404730:	db 7d c0             	fstp   TBYTE PTR [ebp-0x40]
  404733:	d9 e5                	fxam   
  404735:	9b df e0             	fstsw  ax
  404738:	66 25 00 45          	and    ax,0x4500
  40473c:	66 3d 00 01          	cmp    ax,0x100
  404740:	0f 84 1f 05 00 00    	je     404c65 <___pformat_xldouble+0x545>
  404746:	0f b7 55 c8          	movzx  edx,WORD PTR [ebp-0x38]
  40474a:	89 d3                	mov    ebx,edx
  40474c:	81 e3 00 80 00 00    	and    ebx,0x8000
  404752:	0f 85 48 01 00 00    	jne    4048a0 <___pformat_xldouble+0x180>
  404758:	d9 e5                	fxam   
  40475a:	9b df e0             	fstsw  ax
  40475d:	dd d8                	fstp   st(0)
  40475f:	66 25 00 45          	and    ax,0x4500
  404763:	66 3d 00 05          	cmp    ax,0x500
  404767:	0f 84 16 05 00 00    	je     404c83 <___pformat_xldouble+0x563>
  40476d:	66 81 e2 ff 7f       	and    dx,0x7fff
  404772:	0f 84 b8 01 00 00    	je     404930 <___pformat_xldouble+0x210>
  404778:	8d b2 01 c0 ff ff    	lea    esi,[edx-0x3fff]
  40477e:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  404781:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  404784:	8b 5f 0c             	mov    ebx,DWORD PTR [edi+0xc]
  404787:	83 fb 0e             	cmp    ebx,0xe
  40478a:	0f 86 26 01 00 00    	jbe    4048b6 <___pformat_xldouble+0x196>
  404790:	89 d1                	mov    ecx,edx
  404792:	09 c1                	or     ecx,eax
  404794:	0f 84 fc 04 00 00    	je     404c96 <___pformat_xldouble+0x576>
  40479a:	8d 4d d6             	lea    ecx,[ebp-0x2a]
  40479d:	89 4d a4             	mov    DWORD PTR [ebp-0x5c],ecx
  4047a0:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  4047a3:	89 7d a8             	mov    DWORD PTR [ebp-0x58],edi
  4047a6:	eb 5e                	jmp    404806 <___pformat_xldouble+0xe6>
  4047a8:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  4047ab:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  4047ae:	85 c9                	test   ecx,ecx
  4047b0:	7e 09                	jle    4047bb <___pformat_xldouble+0x9b>
  4047b2:	8b 5d a8             	mov    ebx,DWORD PTR [ebp-0x58]
  4047b5:	83 e9 01             	sub    ecx,0x1
  4047b8:	89 4b 0c             	mov    DWORD PTR [ebx+0xc],ecx
  4047bb:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  4047be:	0f ac d0 04          	shrd   eax,edx,0x4
  4047c2:	c1 ea 04             	shr    edx,0x4
  4047c5:	85 ff                	test   edi,edi
  4047c7:	89 4d b0             	mov    DWORD PTR [ebp-0x50],ecx
  4047ca:	0f 84 a8 00 00 00    	je     404878 <___pformat_xldouble+0x158>
  4047d0:	8b 4d b0             	mov    ecx,DWORD PTR [ebp-0x50]
  4047d3:	83 c1 01             	add    ecx,0x1
  4047d6:	83 ff 09             	cmp    edi,0x9
  4047d9:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  4047dc:	0f 8e b5 00 00 00    	jle    404897 <___pformat_xldouble+0x177>
  4047e2:	8d 4f 37             	lea    ecx,[edi+0x37]
  4047e5:	8b 7d a8             	mov    edi,DWORD PTR [ebp-0x58]
  4047e8:	8b 7f 04             	mov    edi,DWORD PTR [edi+0x4]
  4047eb:	89 7d a0             	mov    DWORD PTR [ebp-0x60],edi
  4047ee:	0f b6 5d a0          	movzx  ebx,BYTE PTR [ebp-0x60]
  4047f2:	83 e3 20             	and    ebx,0x20
  4047f5:	09 d9                	or     ecx,ebx
  4047f7:	8b 7d b0             	mov    edi,DWORD PTR [ebp-0x50]
  4047fa:	88 0f                	mov    BYTE PTR [edi],cl
  4047fc:	89 d7                	mov    edi,edx
  4047fe:	09 c7                	or     edi,eax
  404800:	0f 84 60 01 00 00    	je     404966 <___pformat_xldouble+0x246>
  404806:	89 c7                	mov    edi,eax
  404808:	89 c1                	mov    ecx,eax
  40480a:	83 e7 0f             	and    edi,0xf
  40480d:	89 fb                	mov    ebx,edi
  40480f:	31 f9                	xor    ecx,edi
  404811:	c1 fb 1f             	sar    ebx,0x1f
  404814:	31 d3                	xor    ebx,edx
  404816:	09 cb                	or     ebx,ecx
  404818:	75 8e                	jne    4047a8 <___pformat_xldouble+0x88>
  40481a:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  40481d:	39 4d ac             	cmp    DWORD PTR [ebp-0x54],ecx
  404820:	77 1e                	ja     404840 <___pformat_xldouble+0x120>
  404822:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  404825:	f6 41 05 08          	test   BYTE PTR [ecx+0x5],0x8
  404829:	75 15                	jne    404840 <___pformat_xldouble+0x120>
  40482b:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  40482e:	89 4d b0             	mov    DWORD PTR [ebp-0x50],ecx
  404831:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  404834:	8b 59 0c             	mov    ebx,DWORD PTR [ecx+0xc]
  404837:	85 db                	test   ebx,ebx
  404839:	7e 11                	jle    40484c <___pformat_xldouble+0x12c>
  40483b:	90                   	nop
  40483c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404840:	8b 4d ac             	mov    ecx,DWORD PTR [ebp-0x54]
  404843:	8d 59 01             	lea    ebx,[ecx+0x1]
  404846:	89 5d b0             	mov    DWORD PTR [ebp-0x50],ebx
  404849:	c6 01 2e             	mov    BYTE PTR [ecx],0x2e
  40484c:	89 c1                	mov    ecx,eax
  40484e:	83 f1 01             	xor    ecx,0x1
  404851:	09 d1                	or     ecx,edx
  404853:	74 17                	je     40486c <___pformat_xldouble+0x14c>
  404855:	8d 4e ff             	lea    ecx,[esi-0x1]
  404858:	0f ac d0 01          	shrd   eax,edx,0x1
  40485c:	89 ce                	mov    esi,ecx
  40485e:	89 c3                	mov    ebx,eax
  404860:	d1 ea                	shr    edx,1
  404862:	83 f3 01             	xor    ebx,0x1
  404865:	09 d3                	or     ebx,edx
  404867:	8d 4e ff             	lea    ecx,[esi-0x1]
  40486a:	75 ec                	jne    404858 <___pformat_xldouble+0x138>
  40486c:	31 c0                	xor    eax,eax
  40486e:	31 d2                	xor    edx,edx
  404870:	85 ff                	test   edi,edi
  404872:	0f 85 58 ff ff ff    	jne    4047d0 <___pformat_xldouble+0xb0>
  404878:	8b 4d a4             	mov    ecx,DWORD PTR [ebp-0x5c]
  40487b:	39 4d b0             	cmp    DWORD PTR [ebp-0x50],ecx
  40487e:	77 0e                	ja     40488e <___pformat_xldouble+0x16e>
  404880:	8b 4d a8             	mov    ecx,DWORD PTR [ebp-0x58]
  404883:	8b 49 0c             	mov    ecx,DWORD PTR [ecx+0xc]
  404886:	85 c9                	test   ecx,ecx
  404888:	0f 88 b7 01 00 00    	js     404a45 <___pformat_xldouble+0x325>
  40488e:	8b 4d b0             	mov    ecx,DWORD PTR [ebp-0x50]
  404891:	83 c1 01             	add    ecx,0x1
  404894:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  404897:	8d 4f 30             	lea    ecx,[edi+0x30]
  40489a:	e9 58 ff ff ff       	jmp    4047f7 <___pformat_xldouble+0xd7>
  40489f:	90                   	nop
  4048a0:	81 4f 04 80 00 00 00 	or     DWORD PTR [edi+0x4],0x80
  4048a7:	e9 ac fe ff ff       	jmp    404758 <___pformat_xldouble+0x38>
  4048ac:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4048b0:	0f a4 c2 01          	shld   edx,eax,0x1
  4048b4:	01 c0                	add    eax,eax
  4048b6:	85 d2                	test   edx,edx
  4048b8:	79 f6                	jns    4048b0 <___pformat_xldouble+0x190>
  4048ba:	b9 0e 00 00 00       	mov    ecx,0xe
  4048bf:	0f ac d0 01          	shrd   eax,edx,0x1
  4048c3:	29 d9                	sub    ecx,ebx
  4048c5:	d1 ea                	shr    edx,1
  4048c7:	c1 e1 02             	shl    ecx,0x2
  4048ca:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  4048cd:	b8 04 00 00 00       	mov    eax,0x4
  4048d2:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
  4048d5:	31 d2                	xor    edx,edx
  4048d7:	0f a5 c2             	shld   edx,eax,cl
  4048da:	d3 e0                	shl    eax,cl
  4048dc:	f6 c1 20             	test   cl,0x20
  4048df:	74 04                	je     4048e5 <___pformat_xldouble+0x1c5>
  4048e1:	89 c2                	mov    edx,eax
  4048e3:	31 c0                	xor    eax,eax
  4048e5:	01 45 b0             	add    DWORD PTR [ebp-0x50],eax
  4048e8:	11 55 b4             	adc    DWORD PTR [ebp-0x4c],edx
  4048eb:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  4048ee:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
  4048f1:	85 d2                	test   edx,edx
  4048f3:	0f 88 64 03 00 00    	js     404c5d <___pformat_xldouble+0x53d>
  4048f9:	0f a4 c2 01          	shld   edx,eax,0x1
  4048fd:	01 c0                	add    eax,eax
  4048ff:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  404902:	89 55 b4             	mov    DWORD PTR [ebp-0x4c],edx
  404905:	8b 55 b4             	mov    edx,DWORD PTR [ebp-0x4c]
  404908:	b9 0f 00 00 00       	mov    ecx,0xf
  40490d:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
  404910:	29 d9                	sub    ecx,ebx
  404912:	c1 e1 02             	shl    ecx,0x2
  404915:	0f ad d0             	shrd   eax,edx,cl
  404918:	d3 ea                	shr    edx,cl
  40491a:	f6 c1 20             	test   cl,0x20
  40491d:	0f 84 77 fe ff ff    	je     40479a <___pformat_xldouble+0x7a>
  404923:	89 d0                	mov    eax,edx
  404925:	31 d2                	xor    edx,edx
  404927:	e9 6e fe ff ff       	jmp    40479a <___pformat_xldouble+0x7a>
  40492c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404930:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  404933:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  404936:	89 d6                	mov    esi,edx
  404938:	09 c6                	or     esi,eax
  40493a:	0f 84 d7 02 00 00    	je     404c17 <___pformat_xldouble+0x4f7>
  404940:	85 d2                	test   edx,edx
  404942:	0f 88 84 03 00 00    	js     404ccc <___pformat_xldouble+0x5ac>
  404948:	b9 01 c0 ff ff       	mov    ecx,0xffffc001
  40494d:	8d 76 00             	lea    esi,[esi+0x0]
  404950:	0f a4 c2 01          	shld   edx,eax,0x1
  404954:	89 cb                	mov    ebx,ecx
  404956:	01 c0                	add    eax,eax
  404958:	83 e9 01             	sub    ecx,0x1
  40495b:	85 d2                	test   edx,edx
  40495d:	79 f1                	jns    404950 <___pformat_xldouble+0x230>
  40495f:	89 de                	mov    esi,ebx
  404961:	e9 1e fe ff ff       	jmp    404784 <___pformat_xldouble+0x64>
  404966:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  404969:	39 45 ac             	cmp    DWORD PTR [ebp-0x54],eax
  40496c:	8b 7d a8             	mov    edi,DWORD PTR [ebp-0x58]
  40496f:	0f 84 52 03 00 00    	je     404cc7 <___pformat_xldouble+0x5a7>
  404975:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404978:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  40497b:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  40497e:	85 c0                	test   eax,eax
  404980:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
  404983:	0f 8e 7c 02 00 00    	jle    404c05 <___pformat_xldouble+0x4e5>
  404989:	8b 57 0c             	mov    edx,DWORD PTR [edi+0xc]
  40498c:	0f bf f6             	movsx  esi,si
  40498f:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
  404992:	2b 45 a4             	sub    eax,DWORD PTR [ebp-0x5c]
  404995:	89 75 a8             	mov    DWORD PTR [ebp-0x58],esi
  404998:	85 d2                	test   edx,edx
  40499a:	7e 02                	jle    40499e <___pformat_xldouble+0x27e>
  40499c:	01 d0                	add    eax,edx
  40499e:	8b 55 b0             	mov    edx,DWORD PTR [ebp-0x50]
  4049a1:	81 e2 c0 01 00 00    	and    edx,0x1c0
  4049a7:	83 fa 01             	cmp    edx,0x1
  4049aa:	19 d2                	sbb    edx,edx
  4049ac:	8d 74 10 06          	lea    esi,[eax+edx*1+0x6]
  4049b0:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  4049b3:	ba 67 66 66 66       	mov    edx,0x66666667
  4049b8:	f7 ea                	imul   edx
  4049ba:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  4049bd:	c1 fa 02             	sar    edx,0x2
  4049c0:	c1 f8 1f             	sar    eax,0x1f
  4049c3:	29 c2                	sub    edx,eax
  4049c5:	89 d1                	mov    ecx,edx
  4049c7:	0f 84 ee 02 00 00    	je     404cbb <___pformat_xldouble+0x59b>
  4049cd:	bb 02 00 00 00       	mov    ebx,0x2
  4049d2:	b8 67 66 66 66       	mov    eax,0x66666667
  4049d7:	83 c6 01             	add    esi,0x1
  4049da:	f7 e9                	imul   ecx
  4049dc:	83 c3 01             	add    ebx,0x1
  4049df:	c1 f9 1f             	sar    ecx,0x1f
  4049e2:	c1 fa 02             	sar    edx,0x2
  4049e5:	29 ca                	sub    edx,ecx
  4049e7:	89 d1                	mov    ecx,edx
  4049e9:	75 e7                	jne    4049d2 <___pformat_xldouble+0x2b2>
  4049eb:	0f bf c3             	movsx  eax,bx
  4049ee:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  4049f1:	39 75 a0             	cmp    DWORD PTR [ebp-0x60],esi
  4049f4:	7e 5a                	jle    404a50 <___pformat_xldouble+0x330>
  4049f6:	8b 45 a0             	mov    eax,DWORD PTR [ebp-0x60]
  4049f9:	29 f0                	sub    eax,esi
  4049fb:	f7 45 b0 00 06 00 00 	test   DWORD PTR [ebp-0x50],0x600
  404a02:	0f 85 1a 02 00 00    	jne    404c22 <___pformat_xldouble+0x502>
  404a08:	8d 50 ff             	lea    edx,[eax-0x1]
  404a0b:	85 c0                	test   eax,eax
  404a0d:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  404a10:	7e 45                	jle    404a57 <___pformat_xldouble+0x337>
  404a12:	89 fa                	mov    edx,edi
  404a14:	b8 20 00 00 00       	mov    eax,0x20
  404a19:	e8 32 ee ff ff       	call   403850 <___pformat_putc>
  404a1e:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404a21:	8d 50 ff             	lea    edx,[eax-0x1]
  404a24:	85 c0                	test   eax,eax
  404a26:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  404a29:	7f e7                	jg     404a12 <___pformat_xldouble+0x2f2>
  404a2b:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404a2e:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  404a31:	f6 45 b0 80          	test   BYTE PTR [ebp-0x50],0x80
  404a35:	74 26                	je     404a5d <___pformat_xldouble+0x33d>
  404a37:	89 fa                	mov    edx,edi
  404a39:	b8 2d 00 00 00       	mov    eax,0x2d
  404a3e:	e8 0d ee ff ff       	call   403850 <___pformat_putc>
  404a43:	eb 2f                	jmp    404a74 <___pformat_xldouble+0x354>
  404a45:	8b 7d b0             	mov    edi,DWORD PTR [ebp-0x50]
  404a48:	89 7d ac             	mov    DWORD PTR [ebp-0x54],edi
  404a4b:	e9 ac fd ff ff       	jmp    4047fc <___pformat_xldouble+0xdc>
  404a50:	c7 47 08 ff ff ff ff 	mov    DWORD PTR [edi+0x8],0xffffffff
  404a57:	f6 45 b0 80          	test   BYTE PTR [ebp-0x50],0x80
  404a5b:	75 da                	jne    404a37 <___pformat_xldouble+0x317>
  404a5d:	f7 45 b0 00 01 00 00 	test   DWORD PTR [ebp-0x50],0x100
  404a64:	0f 85 c0 01 00 00    	jne    404c2a <___pformat_xldouble+0x50a>
  404a6a:	f6 45 b0 40          	test   BYTE PTR [ebp-0x50],0x40
  404a6e:	0f 85 d8 01 00 00    	jne    404c4c <___pformat_xldouble+0x52c>
  404a74:	89 fa                	mov    edx,edi
  404a76:	b8 30 00 00 00       	mov    eax,0x30
  404a7b:	e8 d0 ed ff ff       	call   403850 <___pformat_putc>
  404a80:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404a83:	89 fa                	mov    edx,edi
  404a85:	83 e0 20             	and    eax,0x20
  404a88:	83 c8 58             	or     eax,0x58
  404a8b:	e8 c0 ed ff ff       	call   403850 <___pformat_putc>
  404a90:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404a93:	85 c0                	test   eax,eax
  404a95:	7e 25                	jle    404abc <___pformat_xldouble+0x39c>
  404a97:	f6 47 05 02          	test   BYTE PTR [edi+0x5],0x2
  404a9b:	74 1f                	je     404abc <___pformat_xldouble+0x39c>
  404a9d:	83 e8 01             	sub    eax,0x1
  404aa0:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  404aa3:	89 fa                	mov    edx,edi
  404aa5:	b8 30 00 00 00       	mov    eax,0x30
  404aaa:	e8 a1 ed ff ff       	call   403850 <___pformat_putc>
  404aaf:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  404ab2:	8d 50 ff             	lea    edx,[eax-0x1]
  404ab5:	85 c0                	test   eax,eax
  404ab7:	89 57 08             	mov    DWORD PTR [edi+0x8],edx
  404aba:	7f e7                	jg     404aa3 <___pformat_xldouble+0x383>
  404abc:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  404abf:	39 45 ac             	cmp    DWORD PTR [ebp-0x54],eax
  404ac2:	8b 5d ac             	mov    ebx,DWORD PTR [ebp-0x54]
  404ac5:	77 19                	ja     404ae0 <___pformat_xldouble+0x3c0>
  404ac7:	e9 a1 00 00 00       	jmp    404b6d <___pformat_xldouble+0x44d>
  404acc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404ad0:	89 fa                	mov    edx,edi
  404ad2:	e8 79 ed ff ff       	call   403850 <___pformat_putc>
  404ad7:	3b 5d a4             	cmp    ebx,DWORD PTR [ebp-0x5c]
  404ada:	0f 84 8d 00 00 00    	je     404b6d <___pformat_xldouble+0x44d>
  404ae0:	83 eb 01             	sub    ebx,0x1
  404ae3:	0f be 03             	movsx  eax,BYTE PTR [ebx]
  404ae6:	83 f8 2e             	cmp    eax,0x2e
  404ae9:	75 e5                	jne    404ad0 <___pformat_xldouble+0x3b0>
  404aeb:	83 7f 10 fd          	cmp    DWORD PTR [edi+0x10],0xfffffffd
  404aef:	0f 84 cc 00 00 00    	je     404bc1 <___pformat_xldouble+0x4a1>
  404af5:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  404af9:	66 85 d2             	test   dx,dx
  404afc:	0f 84 ae 00 00 00    	je     404bb0 <___pformat_xldouble+0x490>
  404b02:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
  404b05:	89 65 b0             	mov    DWORD PTR [ebp-0x50],esp
  404b08:	83 c0 0f             	add    eax,0xf
  404b0b:	83 e0 f0             	and    eax,0xfffffff0
  404b0e:	e8 cd d5 ff ff       	call   4020e0 <___chkstk_ms>
  404b13:	29 c4                	sub    esp,eax
  404b15:	8d 74 24 10          	lea    esi,[esp+0x10]
  404b19:	8d 45 bc             	lea    eax,[ebp-0x44]
  404b1c:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
  404b23:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  404b27:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  404b2b:	89 34 24             	mov    DWORD PTR [esp],esi
  404b2e:	e8 5d 20 00 00       	call   406b90 <_wcrtomb>
  404b33:	85 c0                	test   eax,eax
  404b35:	0f 8e 00 01 00 00    	jle    404c3b <___pformat_xldouble+0x51b>
  404b3b:	01 f0                	add    eax,esi
  404b3d:	89 5d ac             	mov    DWORD PTR [ebp-0x54],ebx
  404b40:	89 f3                	mov    ebx,esi
  404b42:	89 c6                	mov    esi,eax
  404b44:	83 c3 01             	add    ebx,0x1
  404b47:	0f be 43 ff          	movsx  eax,BYTE PTR [ebx-0x1]
  404b4b:	89 fa                	mov    edx,edi
  404b4d:	e8 fe ec ff ff       	call   403850 <___pformat_putc>
  404b52:	39 f3                	cmp    ebx,esi
  404b54:	75 ee                	jne    404b44 <___pformat_xldouble+0x424>
  404b56:	8b 5d ac             	mov    ebx,DWORD PTR [ebp-0x54]
  404b59:	8b 65 b0             	mov    esp,DWORD PTR [ebp-0x50]
  404b5c:	e9 76 ff ff ff       	jmp    404ad7 <___pformat_xldouble+0x3b7>
  404b61:	89 fa                	mov    edx,edi
  404b63:	b8 30 00 00 00       	mov    eax,0x30
  404b68:	e8 e3 ec ff ff       	call   403850 <___pformat_putc>
  404b6d:	8b 47 0c             	mov    eax,DWORD PTR [edi+0xc]
  404b70:	8d 50 ff             	lea    edx,[eax-0x1]
  404b73:	85 c0                	test   eax,eax
  404b75:	89 57 0c             	mov    DWORD PTR [edi+0xc],edx
  404b78:	7f e7                	jg     404b61 <___pformat_xldouble+0x441>
  404b7a:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404b7d:	89 fa                	mov    edx,edi
  404b7f:	83 e0 20             	and    eax,0x20
  404b82:	83 c8 50             	or     eax,0x50
  404b85:	e8 c6 ec ff ff       	call   403850 <___pformat_putc>
  404b8a:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  404b8d:	89 f9                	mov    ecx,edi
  404b8f:	01 47 08             	add    DWORD PTR [edi+0x8],eax
  404b92:	8b 45 a8             	mov    eax,DWORD PTR [ebp-0x58]
  404b95:	81 4f 04 c0 01 00 00 	or     DWORD PTR [edi+0x4],0x1c0
  404b9c:	99                   	cdq    
  404b9d:	e8 5e ef ff ff       	call   403b00 <___pformat_int>
  404ba2:	8d 65 f4             	lea    esp,[ebp-0xc]
  404ba5:	5b                   	pop    ebx
  404ba6:	5e                   	pop    esi
  404ba7:	5f                   	pop    edi
  404ba8:	5d                   	pop    ebp
  404ba9:	c3                   	ret    
  404baa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404bb0:	89 fa                	mov    edx,edi
  404bb2:	b8 2e 00 00 00       	mov    eax,0x2e
  404bb7:	e8 94 ec ff ff       	call   403850 <___pformat_putc>
  404bbc:	e9 16 ff ff ff       	jmp    404ad7 <___pformat_xldouble+0x3b7>
  404bc1:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
  404bc8:	8d 75 bc             	lea    esi,[ebp-0x44]
  404bcb:	e8 e0 35 00 00       	call   4081b0 <_localeconv>
  404bd0:	89 74 24 0c          	mov    DWORD PTR [esp+0xc],esi
  404bd4:	c7 44 24 08 10 00 00 	mov    DWORD PTR [esp+0x8],0x10
  404bdb:	00 
  404bdc:	8b 00                	mov    eax,DWORD PTR [eax]
  404bde:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  404be2:	8d 45 ba             	lea    eax,[ebp-0x46]
  404be5:	89 04 24             	mov    DWORD PTR [esp],eax
  404be8:	e8 f3 22 00 00       	call   406ee0 <_mbrtowc>
  404bed:	85 c0                	test   eax,eax
  404bef:	0f 8e 85 00 00 00    	jle    404c7a <___pformat_xldouble+0x55a>
  404bf5:	0f b7 55 ba          	movzx  edx,WORD PTR [ebp-0x46]
  404bf9:	66 89 57 14          	mov    WORD PTR [edi+0x14],dx
  404bfd:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
  404c00:	e9 f4 fe ff ff       	jmp    404af9 <___pformat_xldouble+0x3d9>
  404c05:	0f bf c6             	movsx  eax,si
  404c08:	c7 45 9c 02 00 00 00 	mov    DWORD PTR [ebp-0x64],0x2
  404c0f:	89 45 a8             	mov    DWORD PTR [ebp-0x58],eax
  404c12:	e9 40 fe ff ff       	jmp    404a57 <___pformat_xldouble+0x337>
  404c17:	31 f6                	xor    esi,esi
  404c19:	31 c0                	xor    eax,eax
  404c1b:	31 d2                	xor    edx,edx
  404c1d:	e9 62 fb ff ff       	jmp    404784 <___pformat_xldouble+0x64>
  404c22:	89 47 08             	mov    DWORD PTR [edi+0x8],eax
  404c25:	e9 2d fe ff ff       	jmp    404a57 <___pformat_xldouble+0x337>
  404c2a:	89 fa                	mov    edx,edi
  404c2c:	b8 2b 00 00 00       	mov    eax,0x2b
  404c31:	e8 1a ec ff ff       	call   403850 <___pformat_putc>
  404c36:	e9 39 fe ff ff       	jmp    404a74 <___pformat_xldouble+0x354>
  404c3b:	89 fa                	mov    edx,edi
  404c3d:	b8 2e 00 00 00       	mov    eax,0x2e
  404c42:	e8 09 ec ff ff       	call   403850 <___pformat_putc>
  404c47:	e9 0d ff ff ff       	jmp    404b59 <___pformat_xldouble+0x439>
  404c4c:	89 fa                	mov    edx,edi
  404c4e:	b8 20 00 00 00       	mov    eax,0x20
  404c53:	e8 f8 eb ff ff       	call   403850 <___pformat_putc>
  404c58:	e9 17 fe ff ff       	jmp    404a74 <___pformat_xldouble+0x354>
  404c5d:	83 c6 01             	add    esi,0x1
  404c60:	e9 a0 fc ff ff       	jmp    404905 <___pformat_xldouble+0x1e5>
  404c65:	dd d8                	fstp   st(0)
  404c67:	89 f9                	mov    ecx,edi
  404c69:	ba 50 a1 40 00       	mov    edx,0x40a150
  404c6e:	31 c0                	xor    eax,eax
  404c70:	e8 fb ed ff ff       	call   403a70 <___pformat_emit_inf_or_nan>
  404c75:	e9 28 ff ff ff       	jmp    404ba2 <___pformat_xldouble+0x482>
  404c7a:	0f b7 57 14          	movzx  edx,WORD PTR [edi+0x14]
  404c7e:	e9 7a ff ff ff       	jmp    404bfd <___pformat_xldouble+0x4dd>
  404c83:	89 f9                	mov    ecx,edi
  404c85:	ba 54 a1 40 00       	mov    edx,0x40a154
  404c8a:	89 d8                	mov    eax,ebx
  404c8c:	e8 df ed ff ff       	call   403a70 <___pformat_emit_inf_or_nan>
  404c91:	e9 0c ff ff ff       	jmp    404ba2 <___pformat_xldouble+0x482>
  404c96:	8d 45 d6             	lea    eax,[ebp-0x2a]
  404c99:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
  404c9c:	85 db                	test   ebx,ebx
  404c9e:	8b 47 04             	mov    eax,DWORD PTR [edi+0x4]
  404ca1:	7e 33                	jle    404cd6 <___pformat_xldouble+0x5b6>
  404ca3:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  404ca6:	c6 45 d6 2e          	mov    BYTE PTR [ebp-0x2a],0x2e
  404caa:	8d 45 d7             	lea    eax,[ebp-0x29]
  404cad:	8d 50 01             	lea    edx,[eax+0x1]
  404cb0:	89 55 ac             	mov    DWORD PTR [ebp-0x54],edx
  404cb3:	c6 00 30             	mov    BYTE PTR [eax],0x30
  404cb6:	e9 c0 fc ff ff       	jmp    40497b <___pformat_xldouble+0x25b>
  404cbb:	c7 45 9c 02 00 00 00 	mov    DWORD PTR [ebp-0x64],0x2
  404cc2:	e9 2a fd ff ff       	jmp    4049f1 <___pformat_xldouble+0x2d1>
  404cc7:	8b 5f 0c             	mov    ebx,DWORD PTR [edi+0xc]
  404cca:	eb d0                	jmp    404c9c <___pformat_xldouble+0x57c>
  404ccc:	be 02 c0 ff ff       	mov    esi,0xffffc002
  404cd1:	e9 ae fa ff ff       	jmp    404784 <___pformat_xldouble+0x64>
  404cd6:	89 c2                	mov    edx,eax
  404cd8:	80 e6 08             	and    dh,0x8
  404cdb:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  404cde:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
  404ce1:	74 ca                	je     404cad <___pformat_xldouble+0x58d>
  404ce3:	eb c1                	jmp    404ca6 <___pformat_xldouble+0x586>
  404ce5:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404ce9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00404cf0 <___mingw_pformat>:
  404cf0:	55                   	push   ebp
  404cf1:	57                   	push   edi
  404cf2:	56                   	push   esi
  404cf3:	53                   	push   ebx
  404cf4:	83 ec 5c             	sub    esp,0x5c
  404cf7:	8b 44 24 74          	mov    eax,DWORD PTR [esp+0x74]
  404cfb:	81 64 24 70 00 30 00 	and    DWORD PTR [esp+0x70],0x3000
  404d02:	00 
  404d03:	8b 74 24 7c          	mov    esi,DWORD PTR [esp+0x7c]
  404d07:	c7 04 24 6d a1 40 00 	mov    DWORD PTR [esp],0x40a16d
  404d0e:	8b ac 24 80 00 00 00 	mov    ebp,DWORD PTR [esp+0x80]
  404d15:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  404d19:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404d1d:	c7 44 24 34 ff ff ff 	mov    DWORD PTR [esp+0x34],0xffffffff
  404d24:	ff 
  404d25:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  404d2c:	ff 
  404d2d:	c7 44 24 3c fd ff ff 	mov    DWORD PTR [esp+0x3c],0xfffffffd
  404d34:	ff 
  404d35:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  404d39:	31 c0                	xor    eax,eax
  404d3b:	66 89 44 24 40       	mov    WORD PTR [esp+0x40],ax
  404d40:	8b 44 24 78          	mov    eax,DWORD PTR [esp+0x78]
  404d44:	c7 44 24 44 00 00 00 	mov    DWORD PTR [esp+0x44],0x0
  404d4b:	00 
  404d4c:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  404d50:	e8 63 34 00 00       	call   4081b8 <_getenv>
  404d55:	85 c0                	test   eax,eax
  404d57:	0f 84 d3 00 00 00    	je     404e30 <___mingw_pformat+0x140>
  404d5d:	0f be 00             	movsx  eax,BYTE PTR [eax]
  404d60:	83 e8 30             	sub    eax,0x30
  404d63:	83 f8 02             	cmp    eax,0x2
  404d66:	0f 87 c4 00 00 00    	ja     404e30 <___mingw_pformat+0x140>
  404d6c:	b8 02 00 00 00       	mov    eax,0x2
  404d71:	89 44 24 4c          	mov    DWORD PTR [esp+0x4c],eax
  404d75:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404d79:	80 cc 02             	or     ah,0x2
  404d7c:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  404d80:	0f be 06             	movsx  eax,BYTE PTR [esi]
  404d83:	8d 5e 01             	lea    ebx,[esi+0x1]
  404d86:	89 d9                	mov    ecx,ebx
  404d88:	85 c0                	test   eax,eax
  404d8a:	0f 84 92 00 00 00    	je     404e22 <___mingw_pformat+0x132>
  404d90:	83 f8 25             	cmp    eax,0x25
  404d93:	0f 85 de 00 00 00    	jne    404e77 <___mingw_pformat+0x187>
  404d99:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404d9d:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  404da4:	ff 
  404da5:	c7 44 24 34 ff ff ff 	mov    DWORD PTR [esp+0x34],0xffffffff
  404dac:	ff 
  404dad:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  404db4:	00 
  404db5:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  404db9:	0f b6 56 01          	movzx  edx,BYTE PTR [esi+0x1]
  404dbd:	8d 44 24 34          	lea    eax,[esp+0x34]
  404dc1:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  404dc5:	c7 44 24 10 00 00 00 	mov    DWORD PTR [esp+0x10],0x0
  404dcc:	00 
  404dcd:	84 d2                	test   dl,dl
  404dcf:	74 3f                	je     404e10 <___mingw_pformat+0x120>
  404dd1:	8d 42 e0             	lea    eax,[edx-0x20]
  404dd4:	0f be fa             	movsx  edi,dl
  404dd7:	3c 5a                	cmp    al,0x5a
  404dd9:	8d 71 01             	lea    esi,[ecx+0x1]
  404ddc:	0f 87 70 04 00 00    	ja     405252 <___mingw_pformat+0x562>
  404de2:	0f b6 c0             	movzx  eax,al
  404de5:	ff 24 85 84 a1 40 00 	jmp    DWORD PTR [eax*4+0x40a184]
  404dec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404df0:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  404df4:	89 f1                	mov    ecx,esi
  404df6:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  404dfd:	00 
  404dfe:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404e05:	00 
  404e06:	84 d2                	test   dl,dl
  404e08:	75 c7                	jne    404dd1 <___mingw_pformat+0xe1>
  404e0a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404e10:	89 ce                	mov    esi,ecx
  404e12:	0f be 06             	movsx  eax,BYTE PTR [esi]
  404e15:	8d 5e 01             	lea    ebx,[esi+0x1]
  404e18:	89 d9                	mov    ecx,ebx
  404e1a:	85 c0                	test   eax,eax
  404e1c:	0f 85 6e ff ff ff    	jne    404d90 <___mingw_pformat+0xa0>
  404e22:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  404e26:	83 c4 5c             	add    esp,0x5c
  404e29:	5b                   	pop    ebx
  404e2a:	5e                   	pop    esi
  404e2b:	5f                   	pop    edi
  404e2c:	5d                   	pop    ebp
  404e2d:	c3                   	ret    
  404e2e:	66 90                	xchg   ax,ax
  404e30:	f6 05 6c d0 40 00 01 	test   BYTE PTR ds:0x40d06c,0x1
  404e37:	0f 85 2f ff ff ff    	jne    404d6c <___mingw_pformat+0x7c>
  404e3d:	b8 03 00 00 00       	mov    eax,0x3
  404e42:	e9 2a ff ff ff       	jmp    404d71 <___mingw_pformat+0x81>
  404e47:	80 79 01 6c          	cmp    BYTE PTR [ecx+0x1],0x6c
  404e4b:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  404e52:	00 
  404e53:	75 0b                	jne    404e60 <___mingw_pformat+0x170>
  404e55:	8d 71 02             	lea    esi,[ecx+0x2]
  404e58:	c7 44 24 14 03 00 00 	mov    DWORD PTR [esp+0x14],0x3
  404e5f:	00 
  404e60:	83 4c 24 30 04       	or     DWORD PTR [esp+0x30],0x4
  404e65:	89 f1                	mov    ecx,esi
  404e67:	0f b6 16             	movzx  edx,BYTE PTR [esi]
  404e6a:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404e71:	00 
  404e72:	e9 56 ff ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  404e77:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  404e7b:	89 de                	mov    esi,ebx
  404e7d:	e8 ce e9 ff ff       	call   403850 <___pformat_putc>
  404e82:	e9 f9 fe ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  404e87:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  404e8b:	89 e8                	mov    eax,ebp
  404e8d:	83 ea 02             	sub    edx,0x2
  404e90:	83 fa 01             	cmp    edx,0x1
  404e93:	0f 86 07 05 00 00    	jbe    4053a0 <___mingw_pformat+0x6b0>
  404e99:	8b 18                	mov    ebx,DWORD PTR [eax]
  404e9b:	83 c5 04             	add    ebp,0x4
  404e9e:	85 db                	test   ebx,ebx
  404ea0:	0f 84 89 06 00 00    	je     40552f <___mingw_pformat+0x83f>
  404ea6:	89 1c 24             	mov    DWORD PTR [esp],ebx
  404ea9:	e8 72 32 00 00       	call   408120 <_strlen>
  404eae:	89 c2                	mov    edx,eax
  404eb0:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  404eb4:	89 d8                	mov    eax,ebx
  404eb6:	e8 05 eb ff ff       	call   4039c0 <___pformat_putchars>
  404ebb:	e9 c0 fe ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  404ec0:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  404ec4:	89 e8                	mov    eax,ebp
  404ec6:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  404ecd:	ff 
  404ece:	83 ea 02             	sub    edx,0x2
  404ed1:	83 fa 01             	cmp    edx,0x1
  404ed4:	0f 86 23 03 00 00    	jbe    4051fd <___mingw_pformat+0x50d>
  404eda:	8b 00                	mov    eax,DWORD PTR [eax]
  404edc:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  404ee0:	ba 01 00 00 00       	mov    edx,0x1
  404ee5:	83 c5 04             	add    ebp,0x4
  404ee8:	88 44 24 20          	mov    BYTE PTR [esp+0x20],al
  404eec:	8d 44 24 20          	lea    eax,[esp+0x20]
  404ef0:	e8 cb ea ff ff       	call   4039c0 <___pformat_putchars>
  404ef5:	e9 86 fe ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  404efa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  404f00:	83 7c 24 14 04       	cmp    DWORD PTR [esp+0x14],0x4
  404f05:	0f 84 f0 05 00 00    	je     4054fb <___mingw_pformat+0x80b>
  404f0b:	83 7c 24 14 01       	cmp    DWORD PTR [esp+0x14],0x1
  404f10:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  404f13:	8b 54 24 44          	mov    edx,DWORD PTR [esp+0x44]
  404f17:	0f 84 17 05 00 00    	je     405434 <___mingw_pformat+0x744>
  404f1d:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
  404f22:	0f 84 43 06 00 00    	je     40556b <___mingw_pformat+0x87b>
  404f28:	83 7c 24 14 03       	cmp    DWORD PTR [esp+0x14],0x3
  404f2d:	89 10                	mov    DWORD PTR [eax],edx
  404f2f:	0f 84 a9 06 00 00    	je     4055de <___mingw_pformat+0x8ee>
  404f35:	83 c5 04             	add    ebp,0x4
  404f38:	e9 43 fe ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  404f3d:	8d 76 00             	lea    esi,[esi+0x0]
  404f40:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  404f44:	89 f1                	mov    ecx,esi
  404f46:	c7 44 24 14 03 00 00 	mov    DWORD PTR [esp+0x14],0x3
  404f4d:	00 
  404f4e:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404f55:	00 
  404f56:	e9 72 fe ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  404f5b:	90                   	nop
  404f5c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404f60:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  404f64:	80 fa 68             	cmp    dl,0x68
  404f67:	0f 84 4c 05 00 00    	je     4054b9 <___mingw_pformat+0x7c9>
  404f6d:	89 f1                	mov    ecx,esi
  404f6f:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  404f76:	00 
  404f77:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  404f7e:	00 
  404f7f:	e9 49 fe ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  404f84:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  404f88:	85 c0                	test   eax,eax
  404f8a:	75 0e                	jne    404f9a <___mingw_pformat+0x2aa>
  404f8c:	8b 44 24 70          	mov    eax,DWORD PTR [esp+0x70]
  404f90:	39 44 24 30          	cmp    DWORD PTR [esp+0x30],eax
  404f94:	0f 84 a4 05 00 00    	je     40553e <___mingw_pformat+0x84e>
  404f9a:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  404f9d:	8d 5d 04             	lea    ebx,[ebp+0x4]
  404fa0:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  404fa7:	00 
  404fa8:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
  404fac:	89 dd                	mov    ebp,ebx
  404fae:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  404fb2:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  404fb6:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  404fba:	89 04 24             	mov    DWORD PTR [esp],eax
  404fbd:	b8 78 00 00 00       	mov    eax,0x78
  404fc2:	e8 69 ed ff ff       	call   403d30 <___pformat_xint>
  404fc7:	e9 b4 fd ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  404fcc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  404fd0:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  404fd4:	83 c8 20             	or     eax,0x20
  404fd7:	a8 04                	test   al,0x4
  404fd9:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  404fdd:	0f 84 4a 02 00 00    	je     40522d <___mingw_pformat+0x53d>
  404fe3:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  404fe6:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  404fe9:	db 3c 24             	fstp   TBYTE PTR [esp]
  404fec:	89 dd                	mov    ebp,ebx
  404fee:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  404ff2:	e8 29 f7 ff ff       	call   404720 <___pformat_xldouble>
  404ff7:	e9 84 fd ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  404ffc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405000:	83 7c 24 14 03       	cmp    DWORD PTR [esp+0x14],0x3
  405005:	89 f8                	mov    eax,edi
  405007:	0f 84 80 04 00 00    	je     40548d <___mingw_pformat+0x79d>
  40500d:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
  405012:	0f 84 27 04 00 00    	je     40543f <___mingw_pformat+0x74f>
  405018:	8b 7d 00             	mov    edi,DWORD PTR [ebp+0x0]
  40501b:	8d 55 04             	lea    edx,[ebp+0x4]
  40501e:	83 7c 24 14 01       	cmp    DWORD PTR [esp+0x14],0x1
  405023:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  40502a:	00 
  40502b:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  40502f:	0f 84 1e 05 00 00    	je     405553 <___mingw_pformat+0x863>
  405035:	83 7c 24 14 04       	cmp    DWORD PTR [esp+0x14],0x4
  40503a:	89 d5                	mov    ebp,edx
  40503c:	0f 84 86 05 00 00    	je     4055c8 <___mingw_pformat+0x8d8>
  405042:	83 f8 75             	cmp    eax,0x75
  405045:	0f 84 ec 00 00 00    	je     405137 <___mingw_pformat+0x447>
  40504b:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  40504f:	8d 7c 24 2c          	lea    edi,[esp+0x2c]
  405053:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
  405057:	89 3c 24             	mov    DWORD PTR [esp],edi
  40505a:	e8 d1 ec ff ff       	call   403d30 <___pformat_xint>
  40505f:	e9 1c fd ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  405064:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405068:	83 c8 20             	or     eax,0x20
  40506b:	a8 04                	test   al,0x4
  40506d:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  405071:	0f 84 15 01 00 00    	je     40518c <___mingw_pformat+0x49c>
  405077:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  40507a:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  40507d:	db 3c 24             	fstp   TBYTE PTR [esp]
  405080:	89 dd                	mov    ebp,ebx
  405082:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  405086:	e8 15 f5 ff ff       	call   4045a0 <___pformat_gfloat>
  40508b:	e9 f0 fc ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  405090:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405094:	83 c8 20             	or     eax,0x20
  405097:	a8 04                	test   al,0x4
  405099:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  40509d:	0f 84 0e 01 00 00    	je     4051b1 <___mingw_pformat+0x4c1>
  4050a3:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  4050a6:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  4050a9:	db 3c 24             	fstp   TBYTE PTR [esp]
  4050ac:	89 dd                	mov    ebp,ebx
  4050ae:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4050b2:	e8 09 f4 ff ff       	call   4044c0 <___pformat_float>
  4050b7:	e9 c4 fc ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  4050bc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4050c0:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4050c4:	83 c8 20             	or     eax,0x20
  4050c7:	a8 04                	test   al,0x4
  4050c9:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  4050cd:	0f 84 09 01 00 00    	je     4051dc <___mingw_pformat+0x4ec>
  4050d3:	db 6d 00             	fld    TBYTE PTR [ebp+0x0]
  4050d6:	8d 5d 0c             	lea    ebx,[ebp+0xc]
  4050d9:	db 3c 24             	fstp   TBYTE PTR [esp]
  4050dc:	89 dd                	mov    ebp,ebx
  4050de:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4050e2:	e8 29 f3 ff ff       	call   404410 <___pformat_efloat>
  4050e7:	e9 94 fc ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  4050ec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4050f0:	81 4c 24 30 80 00 00 	or     DWORD PTR [esp+0x30],0x80
  4050f7:	00 
  4050f8:	83 7c 24 14 03       	cmp    DWORD PTR [esp+0x14],0x3
  4050fd:	0f 84 a0 03 00 00    	je     4054a3 <___mingw_pformat+0x7b3>
  405103:	83 7c 24 14 02       	cmp    DWORD PTR [esp+0x14],0x2
  405108:	0f 84 48 03 00 00    	je     405456 <___mingw_pformat+0x766>
  40510e:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  405111:	8d 55 04             	lea    edx,[ebp+0x4]
  405114:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405118:	c1 f8 1f             	sar    eax,0x1f
  40511b:	83 7c 24 14 01       	cmp    DWORD PTR [esp+0x14],0x1
  405120:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  405124:	0f 84 4b 04 00 00    	je     405575 <___mingw_pformat+0x885>
  40512a:	83 7c 24 14 04       	cmp    DWORD PTR [esp+0x14],0x4
  40512f:	89 d5                	mov    ebp,edx
  405131:	0f 84 7c 04 00 00    	je     4055b3 <___mingw_pformat+0x8c3>
  405137:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  40513b:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  40513f:	8b 54 24 24          	mov    edx,DWORD PTR [esp+0x24]
  405143:	e8 b8 e9 ff ff       	call   403b00 <___pformat_int>
  405148:	e9 33 fc ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  40514d:	8d 76 00             	lea    esi,[esi+0x0]
  405150:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405154:	80 fa 36             	cmp    dl,0x36
  405157:	0f 84 78 03 00 00    	je     4054d5 <___mingw_pformat+0x7e5>
  40515d:	80 fa 33             	cmp    dl,0x33
  405160:	0f 84 a8 02 00 00    	je     40540e <___mingw_pformat+0x71e>
  405166:	89 f1                	mov    ecx,esi
  405168:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  40516f:	00 
  405170:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  405177:	00 
  405178:	e9 50 fc ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  40517d:	8d 76 00             	lea    esi,[esi+0x0]
  405180:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405184:	a8 04                	test   al,0x4
  405186:	0f 85 eb fe ff ff    	jne    405077 <___mingw_pformat+0x387>
  40518c:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  40518f:	8d 5d 08             	lea    ebx,[ebp+0x8]
  405192:	db 3c 24             	fstp   TBYTE PTR [esp]
  405195:	89 dd                	mov    ebp,ebx
  405197:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  40519b:	e8 00 f4 ff ff       	call   4045a0 <___pformat_gfloat>
  4051a0:	e9 db fb ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  4051a5:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4051a9:	a8 04                	test   al,0x4
  4051ab:	0f 85 f2 fe ff ff    	jne    4050a3 <___mingw_pformat+0x3b3>
  4051b1:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  4051b4:	8d 5d 08             	lea    ebx,[ebp+0x8]
  4051b7:	db 3c 24             	fstp   TBYTE PTR [esp]
  4051ba:	89 dd                	mov    ebp,ebx
  4051bc:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4051c0:	e8 fb f2 ff ff       	call   4044c0 <___pformat_float>
  4051c5:	e9 b6 fb ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  4051ca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4051d0:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4051d4:	a8 04                	test   al,0x4
  4051d6:	0f 85 f7 fe ff ff    	jne    4050d3 <___mingw_pformat+0x3e3>
  4051dc:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  4051df:	8d 5d 08             	lea    ebx,[ebp+0x8]
  4051e2:	db 3c 24             	fstp   TBYTE PTR [esp]
  4051e5:	89 dd                	mov    ebp,ebx
  4051e7:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  4051eb:	e8 20 f2 ff ff       	call   404410 <___pformat_efloat>
  4051f0:	e9 8b fb ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  4051f5:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  4051fc:	ff 
  4051fd:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  405200:	8d 5d 04             	lea    ebx,[ebp+0x4]
  405203:	ba 01 00 00 00       	mov    edx,0x1
  405208:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  40520c:	89 dd                	mov    ebp,ebx
  40520e:	66 89 44 24 20       	mov    WORD PTR [esp+0x20],ax
  405213:	8d 44 24 20          	lea    eax,[esp+0x20]
  405217:	e8 94 e6 ff ff       	call   4038b0 <___pformat_wputchars>
  40521c:	e9 5f fb ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  405221:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405225:	a8 04                	test   al,0x4
  405227:	0f 85 b6 fd ff ff    	jne    404fe3 <___mingw_pformat+0x2f3>
  40522d:	dd 45 00             	fld    QWORD PTR [ebp+0x0]
  405230:	8d 5d 08             	lea    ebx,[ebp+0x8]
  405233:	db 3c 24             	fstp   TBYTE PTR [esp]
  405236:	89 dd                	mov    ebp,ebx
  405238:	8d 44 24 2c          	lea    eax,[esp+0x2c]
  40523c:	e8 df f4 ff ff       	call   404720 <___pformat_xldouble>
  405241:	e9 3a fb ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  405246:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  40524a:	85 c0                	test   eax,eax
  40524c:	0f 84 8e 01 00 00    	je     4053e0 <___mingw_pformat+0x6f0>
  405252:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405256:	83 f8 04             	cmp    eax,0x4
  405259:	0f 84 c7 03 00 00    	je     405626 <___mingw_pformat+0x936>
  40525f:	83 ea 30             	sub    edx,0x30
  405262:	80 fa 09             	cmp    dl,0x9
  405265:	0f 87 bb 03 00 00    	ja     405626 <___mingw_pformat+0x936>
  40526b:	85 c0                	test   eax,eax
  40526d:	0f 84 5d 01 00 00    	je     4053d0 <___mingw_pformat+0x6e0>
  405273:	83 f8 02             	cmp    eax,0x2
  405276:	0f 84 f0 01 00 00    	je     40546c <___mingw_pformat+0x77c>
  40527c:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405280:	85 c0                	test   eax,eax
  405282:	74 1b                	je     40529f <___mingw_pformat+0x5af>
  405284:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405288:	8b 00                	mov    eax,DWORD PTR [eax]
  40528a:	85 c0                	test   eax,eax
  40528c:	0f 88 e7 01 00 00    	js     405479 <___mingw_pformat+0x789>
  405292:	8d 04 80             	lea    eax,[eax+eax*4]
  405295:	8d 44 47 d0          	lea    eax,[edi+eax*2-0x30]
  405299:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  40529d:	89 07                	mov    DWORD PTR [edi],eax
  40529f:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4052a3:	89 f1                	mov    ecx,esi
  4052a5:	e9 23 fb ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  4052aa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4052b0:	83 7c 24 10 01       	cmp    DWORD PTR [esp+0x10],0x1
  4052b5:	0f 86 51 02 00 00    	jbe    40550c <___mingw_pformat+0x81c>
  4052bb:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4052bf:	89 f1                	mov    ecx,esi
  4052c1:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  4052c8:	00 
  4052c9:	e9 ff fa ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  4052ce:	66 90                	xchg   ax,ax
  4052d0:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  4052d4:	85 c0                	test   eax,eax
  4052d6:	75 c7                	jne    40529f <___mingw_pformat+0x5af>
  4052d8:	81 4c 24 30 00 04 00 	or     DWORD PTR [esp+0x30],0x400
  4052df:	00 
  4052e0:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4052e4:	89 f1                	mov    ecx,esi
  4052e6:	e9 e2 fa ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  4052eb:	90                   	nop
  4052ec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4052f0:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  4052f4:	85 c0                	test   eax,eax
  4052f6:	75 a7                	jne    40529f <___mingw_pformat+0x5af>
  4052f8:	81 4c 24 30 00 01 00 	or     DWORD PTR [esp+0x30],0x100
  4052ff:	00 
  405300:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405304:	89 f1                	mov    ecx,esi
  405306:	e9 c2 fa ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  40530b:	90                   	nop
  40530c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405310:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  405314:	85 ff                	test   edi,edi
  405316:	74 a3                	je     4052bb <___mingw_pformat+0x5cb>
  405318:	f6 44 24 10 05       	test   BYTE PTR [esp+0x10],0x5
  40531d:	0f 85 d0 00 00 00    	jne    4053f3 <___mingw_pformat+0x703>
  405323:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  405326:	8d 7d 04             	lea    edi,[ebp+0x4]
  405329:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  40532d:	85 c0                	test   eax,eax
  40532f:	89 02                	mov    DWORD PTR [edx],eax
  405331:	0f 88 5f 02 00 00    	js     405596 <___mingw_pformat+0x8a6>
  405337:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  40533b:	89 fd                	mov    ebp,edi
  40533d:	89 f1                	mov    ecx,esi
  40533f:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  405346:	00 
  405347:	e9 81 fa ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  40534c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405350:	89 f8                	mov    eax,edi
  405352:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  405356:	e8 f5 e4 ff ff       	call   403850 <___pformat_putc>
  40535b:	e9 20 fa ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  405360:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405364:	85 c0                	test   eax,eax
  405366:	0f 85 33 ff ff ff    	jne    40529f <___mingw_pformat+0x5af>
  40536c:	81 4c 24 30 00 08 00 	or     DWORD PTR [esp+0x30],0x800
  405373:	00 
  405374:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405378:	89 f1                	mov    ecx,esi
  40537a:	e9 4e fa ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  40537f:	90                   	nop
  405380:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405384:	85 c0                	test   eax,eax
  405386:	0f 85 13 ff ff ff    	jne    40529f <___mingw_pformat+0x5af>
  40538c:	83 4c 24 30 40       	or     DWORD PTR [esp+0x30],0x40
  405391:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405395:	89 f1                	mov    ecx,esi
  405397:	e9 31 fa ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  40539c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4053a0:	8b 5d 00             	mov    ebx,DWORD PTR [ebp+0x0]
  4053a3:	8d 7d 04             	lea    edi,[ebp+0x4]
  4053a6:	85 db                	test   ebx,ebx
  4053a8:	0f 84 de 01 00 00    	je     40558c <___mingw_pformat+0x89c>
  4053ae:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4053b1:	89 fd                	mov    ebp,edi
  4053b3:	e8 08 2e 00 00       	call   4081c0 <_wcslen>
  4053b8:	8d 4c 24 2c          	lea    ecx,[esp+0x2c]
  4053bc:	89 c2                	mov    edx,eax
  4053be:	89 d8                	mov    eax,ebx
  4053c0:	e8 eb e4 ff ff       	call   4038b0 <___pformat_wputchars>
  4053c5:	e9 b6 f9 ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  4053ca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4053d0:	c7 44 24 10 01 00 00 	mov    DWORD PTR [esp+0x10],0x1
  4053d7:	00 
  4053d8:	e9 9f fe ff ff       	jmp    40527c <___mingw_pformat+0x58c>
  4053dd:	8d 76 00             	lea    esi,[esi+0x0]
  4053e0:	81 4c 24 30 00 02 00 	or     DWORD PTR [esp+0x30],0x200
  4053e7:	00 
  4053e8:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4053ec:	89 f1                	mov    ecx,esi
  4053ee:	e9 da f9 ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  4053f3:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  4053f7:	89 f1                	mov    ecx,esi
  4053f9:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  405400:	00 
  405401:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  405408:	00 
  405409:	e9 bf f9 ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  40540e:	80 79 02 32          	cmp    BYTE PTR [ecx+0x2],0x32
  405412:	0f 84 f2 01 00 00    	je     40560a <___mingw_pformat+0x91a>
  405418:	89 f1                	mov    ecx,esi
  40541a:	ba 33 00 00 00       	mov    edx,0x33
  40541f:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  405426:	00 
  405427:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  40542e:	00 
  40542f:	e9 9d f9 ff ff       	jmp    404dd1 <___mingw_pformat+0xe1>
  405434:	66 89 10             	mov    WORD PTR [eax],dx
  405437:	83 c5 04             	add    ebp,0x4
  40543a:	e9 41 f9 ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  40543f:	8b 7d 00             	mov    edi,DWORD PTR [ebp+0x0]
  405442:	83 c5 04             	add    ebp,0x4
  405445:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  40544c:	00 
  40544d:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  405451:	e9 ec fb ff ff       	jmp    405042 <___mingw_pformat+0x352>
  405456:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  405459:	83 c5 04             	add    ebp,0x4
  40545c:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405460:	c1 f8 1f             	sar    eax,0x1f
  405463:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  405467:	e9 cb fc ff ff       	jmp    405137 <___mingw_pformat+0x447>
  40546c:	c7 44 24 10 03 00 00 	mov    DWORD PTR [esp+0x10],0x3
  405473:	00 
  405474:	e9 03 fe ff ff       	jmp    40527c <___mingw_pformat+0x58c>
  405479:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  40547d:	83 ef 30             	sub    edi,0x30
  405480:	89 38                	mov    DWORD PTR [eax],edi
  405482:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405486:	89 f1                	mov    ecx,esi
  405488:	e9 40 f9 ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  40548d:	8b 4d 00             	mov    ecx,DWORD PTR [ebp+0x0]
  405490:	83 c5 08             	add    ebp,0x8
  405493:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  405496:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  40549a:	89 5c 24 24          	mov    DWORD PTR [esp+0x24],ebx
  40549e:	e9 9f fb ff ff       	jmp    405042 <___mingw_pformat+0x352>
  4054a3:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  4054a6:	83 c5 08             	add    ebp,0x8
  4054a9:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  4054ac:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  4054b0:	89 54 24 24          	mov    DWORD PTR [esp+0x24],edx
  4054b4:	e9 7e fc ff ff       	jmp    405137 <___mingw_pformat+0x447>
  4054b9:	0f b6 51 02          	movzx  edx,BYTE PTR [ecx+0x2]
  4054bd:	83 c1 02             	add    ecx,0x2
  4054c0:	c7 44 24 14 04 00 00 	mov    DWORD PTR [esp+0x14],0x4
  4054c7:	00 
  4054c8:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  4054cf:	00 
  4054d0:	e9 f8 f8 ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  4054d5:	80 79 02 34          	cmp    BYTE PTR [ecx+0x2],0x34
  4054d9:	0f 84 0f 01 00 00    	je     4055ee <___mingw_pformat+0x8fe>
  4054df:	89 f1                	mov    ecx,esi
  4054e1:	ba 36 00 00 00       	mov    edx,0x36
  4054e6:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  4054ed:	00 
  4054ee:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  4054f5:	00 
  4054f6:	e9 d6 f8 ff ff       	jmp    404dd1 <___mingw_pformat+0xe1>
  4054fb:	8b 55 00             	mov    edx,DWORD PTR [ebp+0x0]
  4054fe:	83 c5 04             	add    ebp,0x4
  405501:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  405505:	88 02                	mov    BYTE PTR [edx],al
  405507:	e9 74 f8 ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  40550c:	8d 44 24 38          	lea    eax,[esp+0x38]
  405510:	c7 44 24 38 00 00 00 	mov    DWORD PTR [esp+0x38],0x0
  405517:	00 
  405518:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  40551c:	89 f1                	mov    ecx,esi
  40551e:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  405522:	c7 44 24 10 02 00 00 	mov    DWORD PTR [esp+0x10],0x2
  405529:	00 
  40552a:	e9 9e f8 ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  40552f:	ba 06 00 00 00       	mov    edx,0x6
  405534:	bb 66 a1 40 00       	mov    ebx,0x40a166
  405539:	e9 72 f9 ff ff       	jmp    404eb0 <___mingw_pformat+0x1c0>
  40553e:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  405542:	c7 44 24 38 08 00 00 	mov    DWORD PTR [esp+0x38],0x8
  405549:	00 
  40554a:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  40554e:	e9 47 fa ff ff       	jmp    404f9a <___mingw_pformat+0x2aa>
  405553:	0f b7 4c 24 20       	movzx  ecx,WORD PTR [esp+0x20]
  405558:	89 d5                	mov    ebp,edx
  40555a:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  405561:	00 
  405562:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  405566:	e9 d7 fa ff ff       	jmp    405042 <___mingw_pformat+0x352>
  40556b:	89 10                	mov    DWORD PTR [eax],edx
  40556d:	83 c5 04             	add    ebp,0x4
  405570:	e9 0b f8 ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  405575:	0f bf 44 24 20       	movsx  eax,WORD PTR [esp+0x20]
  40557a:	89 d5                	mov    ebp,edx
  40557c:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405580:	c1 f8 1f             	sar    eax,0x1f
  405583:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  405587:	e9 ab fb ff ff       	jmp    405137 <___mingw_pformat+0x447>
  40558c:	bb 58 a1 40 00       	mov    ebx,0x40a158
  405591:	e9 18 fe ff ff       	jmp    4053ae <___mingw_pformat+0x6be>
  405596:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
  40559a:	85 d2                	test   edx,edx
  40559c:	0f 85 99 00 00 00    	jne    40563b <___mingw_pformat+0x94b>
  4055a2:	81 4c 24 30 00 04 00 	or     DWORD PTR [esp+0x30],0x400
  4055a9:	00 
  4055aa:	f7 5c 24 34          	neg    DWORD PTR [esp+0x34]
  4055ae:	e9 84 fd ff ff       	jmp    405337 <___mingw_pformat+0x647>
  4055b3:	0f be 44 24 20       	movsx  eax,BYTE PTR [esp+0x20]
  4055b8:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  4055bc:	c1 f8 1f             	sar    eax,0x1f
  4055bf:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  4055c3:	e9 6f fb ff ff       	jmp    405137 <___mingw_pformat+0x447>
  4055c8:	0f b6 54 24 20       	movzx  edx,BYTE PTR [esp+0x20]
  4055cd:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  4055d4:	00 
  4055d5:	89 54 24 20          	mov    DWORD PTR [esp+0x20],edx
  4055d9:	e9 64 fa ff ff       	jmp    405042 <___mingw_pformat+0x352>
  4055de:	89 d7                	mov    edi,edx
  4055e0:	83 c5 04             	add    ebp,0x4
  4055e3:	c1 ff 1f             	sar    edi,0x1f
  4055e6:	89 78 04             	mov    DWORD PTR [eax+0x4],edi
  4055e9:	e9 92 f7 ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  4055ee:	0f b6 51 03          	movzx  edx,BYTE PTR [ecx+0x3]
  4055f2:	83 c1 03             	add    ecx,0x3
  4055f5:	c7 44 24 14 03 00 00 	mov    DWORD PTR [esp+0x14],0x3
  4055fc:	00 
  4055fd:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  405604:	00 
  405605:	e9 c3 f7 ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  40560a:	0f b6 51 03          	movzx  edx,BYTE PTR [ecx+0x3]
  40560e:	83 c1 03             	add    ecx,0x3
  405611:	c7 44 24 14 02 00 00 	mov    DWORD PTR [esp+0x14],0x2
  405618:	00 
  405619:	c7 44 24 10 04 00 00 	mov    DWORD PTR [esp+0x10],0x4
  405620:	00 
  405621:	e9 a7 f7 ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  405626:	8d 54 24 2c          	lea    edx,[esp+0x2c]
  40562a:	b8 25 00 00 00       	mov    eax,0x25
  40562f:	89 de                	mov    esi,ebx
  405631:	e8 1a e2 ff ff       	call   403850 <___pformat_putc>
  405636:	e9 45 f7 ff ff       	jmp    404d80 <___mingw_pformat+0x90>
  40563b:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  405642:	ff 
  405643:	89 fd                	mov    ebp,edi
  405645:	0f b6 51 01          	movzx  edx,BYTE PTR [ecx+0x1]
  405649:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  405650:	00 
  405651:	89 f1                	mov    ecx,esi
  405653:	e9 75 f7 ff ff       	jmp    404dcd <___mingw_pformat+0xdd>
  405658:	90                   	nop
  405659:	90                   	nop
  40565a:	90                   	nop
  40565b:	90                   	nop
  40565c:	90                   	nop
  40565d:	90                   	nop
  40565e:	90                   	nop
  40565f:	90                   	nop

00405660 <___gdtoa>:
  405660:	55                   	push   ebp
  405661:	57                   	push   edi
  405662:	56                   	push   esi
  405663:	53                   	push   ebx
  405664:	83 ec 6c             	sub    esp,0x6c
  405667:	8b 84 24 8c 00 00 00 	mov    eax,DWORD PTR [esp+0x8c]
  40566e:	8b 9c 24 8c 00 00 00 	mov    ebx,DWORD PTR [esp+0x8c]
  405675:	8b 30                	mov    esi,DWORD PTR [eax]
  405677:	89 f0                	mov    eax,esi
  405679:	83 e0 cf             	and    eax,0xffffffcf
  40567c:	89 03                	mov    DWORD PTR [ebx],eax
  40567e:	89 f0                	mov    eax,esi
  405680:	83 e0 07             	and    eax,0x7
  405683:	83 f8 04             	cmp    eax,0x4
  405686:	0f 87 5f 14 00 00    	ja     406aeb <___gdtoa+0x148b>
  40568c:	ff 24 85 00 a3 40 00 	jmp    DWORD PTR [eax*4+0x40a300]
  405693:	8b 84 24 80 00 00 00 	mov    eax,DWORD PTR [esp+0x80]
  40569a:	31 d2                	xor    edx,edx
  40569c:	8b 38                	mov    edi,DWORD PTR [eax]
  40569e:	83 ff 20             	cmp    edi,0x20
  4056a1:	7e 0e                	jle    4056b1 <___gdtoa+0x51>
  4056a3:	b8 20 00 00 00       	mov    eax,0x20
  4056a8:	01 c0                	add    eax,eax
  4056aa:	83 c2 01             	add    edx,0x1
  4056ad:	39 c7                	cmp    edi,eax
  4056af:	7f f7                	jg     4056a8 <___gdtoa+0x48>
  4056b1:	89 14 24             	mov    DWORD PTR [esp],edx
  4056b4:	e8 97 1e 00 00       	call   407550 <___Balloc_D2A>
  4056b9:	8b 8c 24 88 00 00 00 	mov    ecx,DWORD PTR [esp+0x88]
  4056c0:	89 c3                	mov    ebx,eax
  4056c2:	8d 47 ff             	lea    eax,[edi-0x1]
  4056c5:	c1 f8 05             	sar    eax,0x5
  4056c8:	8d 2c 81             	lea    ebp,[ecx+eax*4]
  4056cb:	8b 84 24 88 00 00 00 	mov    eax,DWORD PTR [esp+0x88]
  4056d2:	8d 4b 14             	lea    ecx,[ebx+0x14]
  4056d5:	89 ca                	mov    edx,ecx
  4056d7:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  4056db:	90                   	nop
  4056dc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4056e0:	8b 08                	mov    ecx,DWORD PTR [eax]
  4056e2:	83 c0 04             	add    eax,0x4
  4056e5:	83 c2 04             	add    edx,0x4
  4056e8:	39 c5                	cmp    ebp,eax
  4056ea:	89 4a fc             	mov    DWORD PTR [edx-0x4],ecx
  4056ed:	73 f1                	jae    4056e0 <___gdtoa+0x80>
  4056ef:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
  4056f3:	29 ca                	sub    edx,ecx
  4056f5:	c1 fa 02             	sar    edx,0x2
  4056f8:	eb 10                	jmp    40570a <___gdtoa+0xaa>
  4056fa:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  405700:	85 c0                	test   eax,eax
  405702:	0f 84 6e 04 00 00    	je     405b76 <___gdtoa+0x516>
  405708:	89 c2                	mov    edx,eax
  40570a:	8d 42 ff             	lea    eax,[edx-0x1]
  40570d:	8b 2c 81             	mov    ebp,DWORD PTR [ecx+eax*4]
  405710:	85 ed                	test   ebp,ebp
  405712:	74 ec                	je     405700 <___gdtoa+0xa0>
  405714:	0f bd 44 93 10       	bsr    eax,DWORD PTR [ebx+edx*4+0x10]
  405719:	89 53 10             	mov    DWORD PTR [ebx+0x10],edx
  40571c:	c1 e2 05             	shl    edx,0x5
  40571f:	89 d5                	mov    ebp,edx
  405721:	83 f0 1f             	xor    eax,0x1f
  405724:	29 c5                	sub    ebp,eax
  405726:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405729:	e8 72 29 00 00       	call   4080a0 <___trailz_D2A>
  40572e:	8b 8c 24 84 00 00 00 	mov    ecx,DWORD PTR [esp+0x84]
  405735:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  405739:	85 c0                	test   eax,eax
  40573b:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  40573f:	0f 85 3f 04 00 00    	jne    405b84 <___gdtoa+0x524>
  405745:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
  405748:	85 c9                	test   ecx,ecx
  40574a:	0f 85 a8 00 00 00    	jne    4057f8 <___gdtoa+0x198>
  405750:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405753:	e8 c8 1e 00 00       	call   407620 <___Bfree_D2A>
  405758:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  40575f:	c7 00 01 00 00 00    	mov    DWORD PTR [eax],0x1
  405765:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  40576c:	c7 44 24 08 01 00 00 	mov    DWORD PTR [esp+0x8],0x1
  405773:	00 
  405774:	c7 04 24 fd a2 40 00 	mov    DWORD PTR [esp],0x40a2fd
  40577b:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40577f:	e8 3c 1a 00 00       	call   4071c0 <___nrv_alloc_D2A>
  405784:	83 c4 6c             	add    esp,0x6c
  405787:	5b                   	pop    ebx
  405788:	5e                   	pop    esi
  405789:	5f                   	pop    edi
  40578a:	5d                   	pop    ebp
  40578b:	c3                   	ret    
  40578c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405790:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  405797:	c7 00 00 80 ff ff    	mov    DWORD PTR [eax],0xffff8000
  40579d:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  4057a4:	c7 44 24 08 03 00 00 	mov    DWORD PTR [esp+0x8],0x3
  4057ab:	00 
  4057ac:	c7 04 24 f9 a2 40 00 	mov    DWORD PTR [esp],0x40a2f9
  4057b3:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4057b7:	e8 04 1a 00 00       	call   4071c0 <___nrv_alloc_D2A>
  4057bc:	83 c4 6c             	add    esp,0x6c
  4057bf:	5b                   	pop    ebx
  4057c0:	5e                   	pop    esi
  4057c1:	5f                   	pop    edi
  4057c2:	5d                   	pop    ebp
  4057c3:	c3                   	ret    
  4057c4:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  4057cb:	c7 00 00 80 ff ff    	mov    DWORD PTR [eax],0xffff8000
  4057d1:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  4057d8:	c7 44 24 08 08 00 00 	mov    DWORD PTR [esp+0x8],0x8
  4057df:	00 
  4057e0:	c7 04 24 f0 a2 40 00 	mov    DWORD PTR [esp],0x40a2f0
  4057e7:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4057eb:	e8 d0 19 00 00       	call   4071c0 <___nrv_alloc_D2A>
  4057f0:	83 c4 6c             	add    esp,0x6c
  4057f3:	5b                   	pop    ebx
  4057f4:	5e                   	pop    esi
  4057f5:	5f                   	pop    edi
  4057f6:	5d                   	pop    ebp
  4057f7:	c3                   	ret    
  4057f8:	8d 44 24 5c          	lea    eax,[esp+0x5c]
  4057fc:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405800:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405803:	e8 68 25 00 00       	call   407d70 <___b2d_D2A>
  405808:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  40580c:	8d 54 28 ff          	lea    edx,[eax+ebp*1-0x1]
  405810:	89 54 24 48          	mov    DWORD PTR [esp+0x48],edx
  405814:	89 d0                	mov    eax,edx
  405816:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  40581a:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
  40581e:	c1 f8 1f             	sar    eax,0x1f
  405821:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405825:	31 d0                	xor    eax,edx
  405827:	2b 44 24 0c          	sub    eax,DWORD PTR [esp+0xc]
  40582b:	81 e1 ff ff 0f 00    	and    ecx,0xfffff
  405831:	81 c9 00 00 f0 3f    	or     ecx,0x3ff00000
  405837:	89 4c 24 14          	mov    DWORD PTR [esp+0x14],ecx
  40583b:	2d 35 04 00 00       	sub    eax,0x435
  405840:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  405844:	85 c0                	test   eax,eax
  405846:	d8 25 14 a3 40 00    	fsub   DWORD PTR ds:0x40a314
  40584c:	dc 0d 18 a3 40 00    	fmul   QWORD PTR ds:0x40a318
  405852:	dc 05 20 a3 40 00    	fadd   QWORD PTR ds:0x40a320
  405858:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  40585c:	dc 0d 28 a3 40 00    	fmul   QWORD PTR ds:0x40a328
  405862:	de c1                	faddp  st(1),st
  405864:	7e 10                	jle    405876 <___gdtoa+0x216>
  405866:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  40586a:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  40586e:	dc 0d 30 a3 40 00    	fmul   QWORD PTR ds:0x40a330
  405874:	de c1                	faddp  st(1),st
  405876:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  40587a:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  40587f:	b4 0c                	mov    ah,0xc
  405881:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  405886:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  40588a:	db 54 24 0c          	fist   DWORD PTR [esp+0xc]
  40588e:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  405892:	d9 ee                	fldz   
  405894:	dd e9                	fucomp st(1)
  405896:	df e0                	fnstsw ax
  405898:	9e                   	sahf   
  405899:	0f 87 76 07 00 00    	ja     406015 <___gdtoa+0x9b5>
  40589f:	dd d8                	fstp   st(0)
  4058a1:	89 d0                	mov    eax,edx
  4058a3:	c1 e0 14             	shl    eax,0x14
  4058a6:	01 c8                	add    eax,ecx
  4058a8:	83 7c 24 0c 16       	cmp    DWORD PTR [esp+0xc],0x16
  4058ad:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  4058b1:	c7 44 24 34 01 00 00 	mov    DWORD PTR [esp+0x34],0x1
  4058b8:	00 
  4058b9:	77 29                	ja     4058e4 <___gdtoa+0x284>
  4058bb:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4058bf:	dd 04 c5 80 a3 40 00 	fld    QWORD PTR [eax*8+0x40a380]
  4058c6:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  4058ca:	d9 c9                	fxch   st(1)
  4058cc:	da e9                	fucompp 
  4058ce:	df e0                	fnstsw ax
  4058d0:	9e                   	sahf   
  4058d1:	0f 86 6d 06 00 00    	jbe    405f44 <___gdtoa+0x8e4>
  4058d7:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
  4058dc:	c7 44 24 34 00 00 00 	mov    DWORD PTR [esp+0x34],0x0
  4058e3:	00 
  4058e4:	89 e8                	mov    eax,ebp
  4058e6:	29 d0                	sub    eax,edx
  4058e8:	83 e8 01             	sub    eax,0x1
  4058eb:	c7 44 24 28 00 00 00 	mov    DWORD PTR [esp+0x28],0x0
  4058f2:	00 
  4058f3:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  4058f7:	0f 88 05 07 00 00    	js     406002 <___gdtoa+0x9a2>
  4058fd:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405901:	85 c0                	test   eax,eax
  405903:	0f 88 de 06 00 00    	js     405fe7 <___gdtoa+0x987>
  405909:	01 44 24 1c          	add    DWORD PTR [esp+0x1c],eax
  40590d:	89 44 24 3c          	mov    DWORD PTR [esp+0x3c],eax
  405911:	c7 44 24 30 00 00 00 	mov    DWORD PTR [esp+0x30],0x0
  405918:	00 
  405919:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x9
  405920:	09 
  405921:	0f 87 81 02 00 00    	ja     405ba8 <___gdtoa+0x548>
  405927:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x5
  40592e:	05 
  40592f:	0f 8e c0 11 00 00    	jle    406af5 <___gdtoa+0x1495>
  405935:	83 ac 24 90 00 00 00 	sub    DWORD PTR [esp+0x90],0x4
  40593c:	04 
  40593d:	31 c0                	xor    eax,eax
  40593f:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x3
  405946:	03 
  405947:	0f 84 11 06 00 00    	je     405f5e <___gdtoa+0x8fe>
  40594d:	0f 8e 18 06 00 00    	jle    405f6b <___gdtoa+0x90b>
  405953:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x4
  40595a:	04 
  40595b:	c7 44 24 40 01 00 00 	mov    DWORD PTR [esp+0x40],0x1
  405962:	00 
  405963:	0f 84 18 06 00 00    	je     405f81 <___gdtoa+0x921>
  405969:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x5
  405970:	05 
  405971:	0f 85 3c 02 00 00    	jne    405bb3 <___gdtoa+0x553>
  405977:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
  40597b:	03 8c 24 94 00 00 00 	add    ecx,DWORD PTR [esp+0x94]
  405982:	89 4c 24 44          	mov    DWORD PTR [esp+0x44],ecx
  405986:	83 c1 01             	add    ecx,0x1
  405989:	85 c9                	test   ecx,ecx
  40598b:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
  40598f:	0f 8e e3 0a 00 00    	jle    406478 <___gdtoa+0xe18>
  405995:	83 f9 0e             	cmp    ecx,0xe
  405998:	0f 96 c2             	setbe  dl
  40599b:	21 c2                	and    edx,eax
  40599d:	89 c8                	mov    eax,ecx
  40599f:	89 4c 24 5c          	mov    DWORD PTR [esp+0x5c],ecx
  4059a3:	89 04 24             	mov    DWORD PTR [esp],eax
  4059a6:	89 54 24 38          	mov    DWORD PTR [esp+0x38],edx
  4059aa:	e8 d1 17 00 00       	call   407180 <___rv_alloc_D2A>
  4059af:	8b 54 24 38          	mov    edx,DWORD PTR [esp+0x38]
  4059b3:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  4059b7:	8b 84 24 80 00 00 00 	mov    eax,DWORD PTR [esp+0x80]
  4059be:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
  4059c1:	83 e8 01             	sub    eax,0x1
  4059c4:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  4059c8:	74 0f                	je     4059d9 <___gdtoa+0x379>
  4059ca:	0f 88 81 05 00 00    	js     405f51 <___gdtoa+0x8f1>
  4059d0:	83 e6 08             	and    esi,0x8
  4059d3:	0f 85 59 05 00 00    	jne    405f32 <___gdtoa+0x8d2>
  4059d9:	84 d2                	test   dl,dl
  4059db:	90                   	nop
  4059dc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4059e0:	0f 84 70 02 00 00    	je     405c56 <___gdtoa+0x5f6>
  4059e6:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  4059ea:	0b 44 24 0c          	or     eax,DWORD PTR [esp+0xc]
  4059ee:	0f 85 62 02 00 00    	jne    405c56 <___gdtoa+0x5f6>
  4059f4:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  4059f8:	c7 44 24 5c 00 00 00 	mov    DWORD PTR [esp+0x5c],0x0
  4059ff:	00 
  405a00:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  405a04:	85 c0                	test   eax,eax
  405a06:	74 0d                	je     405a15 <___gdtoa+0x3b5>
  405a08:	d9 e8                	fld1   
  405a0a:	dd e9                	fucomp st(1)
  405a0c:	df e0                	fnstsw ax
  405a0e:	9e                   	sahf   
  405a0f:	0f 87 e7 0d 00 00    	ja     4067fc <___gdtoa+0x119c>
  405a15:	d9 c0                	fld    st(0)
  405a17:	8b 74 24 18          	mov    esi,DWORD PTR [esp+0x18]
  405a1b:	d8 c1                	fadd   st,st(1)
  405a1d:	d8 05 4c a3 40 00    	fadd   DWORD PTR ds:0x40a34c
  405a23:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  405a27:	81 6c 24 14 00 00 40 	sub    DWORD PTR [esp+0x14],0x3400000
  405a2e:	03 
  405a2f:	85 f6                	test   esi,esi
  405a31:	0f 84 e1 01 00 00    	je     405c18 <___gdtoa+0x5b8>
  405a37:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  405a3b:	d9 c0                	fld    st(0)
  405a3d:	c7 44 24 38 00 00 00 	mov    DWORD PTR [esp+0x38],0x0
  405a44:	00 
  405a45:	8b 4c 24 40          	mov    ecx,DWORD PTR [esp+0x40]
  405a49:	85 c9                	test   ecx,ecx
  405a4b:	0f 84 58 0a 00 00    	je     4064a9 <___gdtoa+0xe49>
  405a51:	d9 05 54 a3 40 00    	fld    DWORD PTR ds:0x40a354
  405a57:	dc 34 d5 78 a3 40 00 	fdiv   QWORD PTR [edx*8+0x40a378]
  405a5e:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  405a62:	c7 44 24 5c 00 00 00 	mov    DWORD PTR [esp+0x5c],0x0
  405a69:	00 
  405a6a:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  405a6f:	b4 0c                	mov    ah,0xc
  405a71:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  405a76:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  405a7a:	8d 70 01             	lea    esi,[eax+0x1]
  405a7d:	dc 64 24 10          	fsub   QWORD PTR [esp+0x10]
  405a81:	d9 c9                	fxch   st(1)
  405a83:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  405a87:	db 54 24 48          	fist   DWORD PTR [esp+0x48]
  405a8b:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  405a8f:	8b 4c 24 48          	mov    ecx,DWORD PTR [esp+0x48]
  405a93:	89 4c 24 48          	mov    DWORD PTR [esp+0x48],ecx
  405a97:	83 c1 30             	add    ecx,0x30
  405a9a:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  405a9e:	de e9                	fsubrp st(1),st
  405aa0:	d9 c9                	fxch   st(1)
  405aa2:	88 08                	mov    BYTE PTR [eax],cl
  405aa4:	dd e1                	fucom  st(1)
  405aa6:	df e0                	fnstsw ax
  405aa8:	9e                   	sahf   
  405aa9:	0f 87 9a 00 00 00    	ja     405b49 <___gdtoa+0x4e9>
  405aaf:	d9 c1                	fld    st(1)
  405ab1:	d8 2d 40 a3 40 00    	fsubr  DWORD PTR ds:0x40a340
  405ab7:	d9 c9                	fxch   st(1)
  405ab9:	dd e1                	fucom  st(1)
  405abb:	df e0                	fnstsw ax
  405abd:	dd d9                	fstp   st(1)
  405abf:	9e                   	sahf   
  405ac0:	0f 87 f1 0a 00 00    	ja     4065b7 <___gdtoa+0xf57>
  405ac6:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405aca:	83 c0 01             	add    eax,0x1
  405acd:	39 c2                	cmp    edx,eax
  405acf:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405ad3:	0f 8e 69 01 00 00    	jle    405c42 <___gdtoa+0x5e2>
  405ad9:	d9 05 44 a3 40 00    	fld    DWORD PTR ds:0x40a344
  405adf:	eb 2e                	jmp    405b0f <___gdtoa+0x4af>
  405ae1:	d9 c1                	fld    st(1)
  405ae3:	d8 2d 40 a3 40 00    	fsubr  DWORD PTR ds:0x40a340
  405ae9:	d9 c9                	fxch   st(1)
  405aeb:	dd e1                	fucom  st(1)
  405aed:	df e0                	fnstsw ax
  405aef:	dd d9                	fstp   st(1)
  405af1:	9e                   	sahf   
  405af2:	0f 87 c7 0a 00 00    	ja     4065bf <___gdtoa+0xf5f>
  405af8:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405afc:	83 c0 01             	add    eax,0x1
  405aff:	39 c2                	cmp    edx,eax
  405b01:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405b05:	0f 8e 3d 01 00 00    	jle    405c48 <___gdtoa+0x5e8>
  405b0b:	d9 c9                	fxch   st(1)
  405b0d:	d9 ca                	fxch   st(2)
  405b0f:	dc c9                	fmul   st(1),st
  405b11:	83 c6 01             	add    esi,0x1
  405b14:	dc ca                	fmul   st(2),st
  405b16:	d9 ca                	fxch   st(2)
  405b18:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  405b1c:	db 54 24 48          	fist   DWORD PTR [esp+0x48]
  405b20:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  405b24:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  405b28:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  405b2c:	8d 48 30             	lea    ecx,[eax+0x30]
  405b2f:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  405b33:	de e9                	fsubrp st(1),st
  405b35:	d9 c9                	fxch   st(1)
  405b37:	88 4e ff             	mov    BYTE PTR [esi-0x1],cl
  405b3a:	dd e1                	fucom  st(1)
  405b3c:	df e0                	fnstsw ax
  405b3e:	9e                   	sahf   
  405b3f:	76 a0                	jbe    405ae1 <___gdtoa+0x481>
  405b41:	dd d8                	fstp   st(0)
  405b43:	dd d9                	fstp   st(1)
  405b45:	dd d9                	fstp   st(1)
  405b47:	eb 04                	jmp    405b4d <___gdtoa+0x4ed>
  405b49:	dd d8                	fstp   st(0)
  405b4b:	dd d9                	fstp   st(1)
  405b4d:	d9 ee                	fldz   
  405b4f:	d9 c9                	fxch   st(1)
  405b51:	da e9                	fucompp 
  405b53:	df e0                	fnstsw ax
  405b55:	9e                   	sahf   
  405b56:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  405b5a:	7a 06                	jp     405b62 <___gdtoa+0x502>
  405b5c:	0f 84 ad 05 00 00    	je     40610f <___gdtoa+0xaaf>
  405b62:	83 c0 01             	add    eax,0x1
  405b65:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405b69:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  405b70:	00 
  405b71:	e9 77 03 00 00       	jmp    405eed <___gdtoa+0x88d>
  405b76:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
  405b7d:	31 ed                	xor    ebp,ebp
  405b7f:	e9 a2 fb ff ff       	jmp    405726 <___gdtoa+0xc6>
  405b84:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405b88:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405b8b:	e8 f0 23 00 00       	call   407f80 <___rshift_D2A>
  405b90:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405b94:	8b 8c 24 84 00 00 00 	mov    ecx,DWORD PTR [esp+0x84]
  405b9b:	29 c5                	sub    ebp,eax
  405b9d:	01 c1                	add    ecx,eax
  405b9f:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  405ba3:	e9 9d fb ff ff       	jmp    405745 <___gdtoa+0xe5>
  405ba8:	c7 84 24 90 00 00 00 	mov    DWORD PTR [esp+0x90],0x0
  405baf:	00 00 00 00 
  405bb3:	89 7c 24 48          	mov    DWORD PTR [esp+0x48],edi
  405bb7:	31 d2                	xor    edx,edx
  405bb9:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  405bbd:	dc 0d 38 a3 40 00    	fmul   QWORD PTR ds:0x40a338
  405bc3:	c7 44 24 40 01 00 00 	mov    DWORD PTR [esp+0x40],0x1
  405bca:	00 
  405bcb:	c7 44 24 44 ff ff ff 	mov    DWORD PTR [esp+0x44],0xffffffff
  405bd2:	ff 
  405bd3:	c7 44 24 18 ff ff ff 	mov    DWORD PTR [esp+0x18],0xffffffff
  405bda:	ff 
  405bdb:	c7 84 24 94 00 00 00 	mov    DWORD PTR [esp+0x94],0x0
  405be2:	00 00 00 00 
  405be6:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  405bea:	db 5c 24 48          	fistp  DWORD PTR [esp+0x48]
  405bee:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  405bf2:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  405bf6:	83 c0 03             	add    eax,0x3
  405bf9:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405bfd:	e9 a1 fd ff ff       	jmp    4059a3 <___gdtoa+0x343>
  405c02:	d9 c0                	fld    st(0)
  405c04:	d8 c1                	fadd   st,st(1)
  405c06:	d8 05 4c a3 40 00    	fadd   DWORD PTR ds:0x40a34c
  405c0c:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  405c10:	81 6c 24 14 00 00 40 	sub    DWORD PTR [esp+0x14],0x3400000
  405c17:	03 
  405c18:	d9 c0                	fld    st(0)
  405c1a:	d8 25 50 a3 40 00    	fsub   DWORD PTR ds:0x40a350
  405c20:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  405c24:	d9 c9                	fxch   st(1)
  405c26:	dd e1                	fucom  st(1)
  405c28:	df e0                	fnstsw ax
  405c2a:	9e                   	sahf   
  405c2b:	0f 87 52 09 00 00    	ja     406583 <___gdtoa+0xf23>
  405c31:	d9 c9                	fxch   st(1)
  405c33:	d9 e0                	fchs   
  405c35:	da e9                	fucompp 
  405c37:	df e0                	fnstsw ax
  405c39:	9e                   	sahf   
  405c3a:	0f 87 77 03 00 00    	ja     405fb7 <___gdtoa+0x957>
  405c40:	eb 10                	jmp    405c52 <___gdtoa+0x5f2>
  405c42:	dd d8                	fstp   st(0)
  405c44:	dd d8                	fstp   st(0)
  405c46:	eb 0a                	jmp    405c52 <___gdtoa+0x5f2>
  405c48:	dd d8                	fstp   st(0)
  405c4a:	dd d8                	fstp   st(0)
  405c4c:	dd d8                	fstp   st(0)
  405c4e:	eb 02                	jmp    405c52 <___gdtoa+0x5f2>
  405c50:	dd d8                	fstp   st(0)
  405c52:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  405c56:	83 7c 24 0c 0e       	cmp    DWORD PTR [esp+0xc],0xe
  405c5b:	0f 8e df 01 00 00    	jle    405e40 <___gdtoa+0x7e0>
  405c61:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  405c65:	85 c0                	test   eax,eax
  405c67:	0f 84 c3 03 00 00    	je     406030 <___gdtoa+0x9d0>
  405c6d:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x1
  405c74:	01 
  405c75:	0f 8e 93 09 00 00    	jle    40660e <___gdtoa+0xfae>
  405c7b:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405c7f:	83 e8 01             	sub    eax,0x1
  405c82:	39 44 24 30          	cmp    DWORD PTR [esp+0x30],eax
  405c86:	0f 8c 08 08 00 00    	jl     406494 <___gdtoa+0xe34>
  405c8c:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  405c90:	29 c7                	sub    edi,eax
  405c92:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405c96:	85 c0                	test   eax,eax
  405c98:	0f 88 15 0a 00 00    	js     4066b3 <___gdtoa+0x1053>
  405c9e:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  405ca2:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405ca6:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  405cad:	01 44 24 28          	add    DWORD PTR [esp+0x28],eax
  405cb1:	01 44 24 1c          	add    DWORD PTR [esp+0x1c],eax
  405cb5:	e8 b6 1a 00 00       	call   407770 <___i2b_D2A>
  405cba:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405cbe:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  405cc2:	85 c0                	test   eax,eax
  405cc4:	7e 1e                	jle    405ce4 <___gdtoa+0x684>
  405cc6:	85 f6                	test   esi,esi
  405cc8:	7e 1a                	jle    405ce4 <___gdtoa+0x684>
  405cca:	8b 4c 24 1c          	mov    ecx,DWORD PTR [esp+0x1c]
  405cce:	39 f1                	cmp    ecx,esi
  405cd0:	89 c8                	mov    eax,ecx
  405cd2:	7e 02                	jle    405cd6 <___gdtoa+0x676>
  405cd4:	89 f0                	mov    eax,esi
  405cd6:	29 44 24 28          	sub    DWORD PTR [esp+0x28],eax
  405cda:	29 c6                	sub    esi,eax
  405cdc:	29 44 24 1c          	sub    DWORD PTR [esp+0x1c],eax
  405ce0:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  405ce4:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  405ce8:	85 c9                	test   ecx,ecx
  405cea:	7e 4e                	jle    405d3a <___gdtoa+0x6da>
  405cec:	8b 54 24 40          	mov    edx,DWORD PTR [esp+0x40]
  405cf0:	85 d2                	test   edx,edx
  405cf2:	0f 84 dd 05 00 00    	je     4062d5 <___gdtoa+0xc75>
  405cf8:	85 ff                	test   edi,edi
  405cfa:	7e 32                	jle    405d2e <___gdtoa+0x6ce>
  405cfc:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405d00:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  405d04:	89 04 24             	mov    DWORD PTR [esp],eax
  405d07:	e8 f4 1b 00 00       	call   407900 <___pow5mult_D2A>
  405d0c:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  405d10:	89 04 24             	mov    DWORD PTR [esp],eax
  405d13:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  405d17:	e8 84 1a 00 00       	call   4077a0 <___mult_D2A>
  405d1c:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405d1f:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  405d23:	e8 f8 18 00 00       	call   407620 <___Bfree_D2A>
  405d28:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  405d2c:	89 c3                	mov    ebx,eax
  405d2e:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  405d32:	29 f8                	sub    eax,edi
  405d34:	0f 85 9f 05 00 00    	jne    4062d9 <___gdtoa+0xc79>
  405d3a:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  405d41:	e8 2a 1a 00 00       	call   407770 <___i2b_D2A>
  405d46:	89 c7                	mov    edi,eax
  405d48:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  405d4c:	85 c0                	test   eax,eax
  405d4e:	7e 0e                	jle    405d5e <___gdtoa+0x6fe>
  405d50:	89 3c 24             	mov    DWORD PTR [esp],edi
  405d53:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405d57:	e8 a4 1b 00 00       	call   407900 <___pow5mult_D2A>
  405d5c:	89 c7                	mov    edi,eax
  405d5e:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x1
  405d65:	01 
  405d66:	c7 44 24 10 00 00 00 	mov    DWORD PTR [esp+0x10],0x0
  405d6d:	00 
  405d6e:	0f 8e 8f 06 00 00    	jle    406403 <___gdtoa+0xda3>
  405d74:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  405d78:	bd 1f 00 00 00       	mov    ebp,0x1f
  405d7d:	85 c0                	test   eax,eax
  405d7f:	74 0b                	je     405d8c <___gdtoa+0x72c>
  405d81:	8b 47 10             	mov    eax,DWORD PTR [edi+0x10]
  405d84:	0f bd 6c 87 10       	bsr    ebp,DWORD PTR [edi+eax*4+0x10]
  405d89:	83 f5 1f             	xor    ebp,0x1f
  405d8c:	2b 6c 24 1c          	sub    ebp,DWORD PTR [esp+0x1c]
  405d90:	8b 54 24 28          	mov    edx,DWORD PTR [esp+0x28]
  405d94:	83 ed 04             	sub    ebp,0x4
  405d97:	83 e5 1f             	and    ebp,0x1f
  405d9a:	01 ea                	add    edx,ebp
  405d9c:	89 e8                	mov    eax,ebp
  405d9e:	85 d2                	test   edx,edx
  405da0:	89 6c 24 5c          	mov    DWORD PTR [esp+0x5c],ebp
  405da4:	7e 12                	jle    405db8 <___gdtoa+0x758>
  405da6:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405da9:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  405dad:	e8 de 1c 00 00       	call   407a90 <___lshift_D2A>
  405db2:	89 c3                	mov    ebx,eax
  405db4:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  405db8:	03 44 24 1c          	add    eax,DWORD PTR [esp+0x1c]
  405dbc:	85 c0                	test   eax,eax
  405dbe:	7e 0e                	jle    405dce <___gdtoa+0x76e>
  405dc0:	89 3c 24             	mov    DWORD PTR [esp],edi
  405dc3:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405dc7:	e8 c4 1c 00 00       	call   407a90 <___lshift_D2A>
  405dcc:	89 c7                	mov    edi,eax
  405dce:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  405dd2:	85 c0                	test   eax,eax
  405dd4:	0f 85 12 05 00 00    	jne    4062ec <___gdtoa+0xc8c>
  405dda:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  405de1:	02 
  405de2:	0f 8e 3b 03 00 00    	jle    406123 <___gdtoa+0xac3>
  405de8:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405dec:	85 c0                	test   eax,eax
  405dee:	0f 8f 2f 03 00 00    	jg     406123 <___gdtoa+0xac3>
  405df4:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405df8:	85 c0                	test   eax,eax
  405dfa:	0f 85 c7 01 00 00    	jne    405fc7 <___gdtoa+0x967>
  405e00:	89 3c 24             	mov    DWORD PTR [esp],edi
  405e03:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  405e0a:	00 
  405e0b:	c7 44 24 04 05 00 00 	mov    DWORD PTR [esp+0x4],0x5
  405e12:	00 
  405e13:	e8 78 18 00 00       	call   407690 <___multadd_D2A>
  405e18:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405e1b:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  405e1f:	89 c7                	mov    edi,eax
  405e21:	e8 7a 1d 00 00       	call   407ba0 <___cmp_D2A>
  405e26:	85 c0                	test   eax,eax
  405e28:	0f 8e 99 01 00 00    	jle    405fc7 <___gdtoa+0x967>
  405e2e:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405e32:	83 c0 02             	add    eax,0x2
  405e35:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405e39:	eb 72                	jmp    405ead <___gdtoa+0x84d>
  405e3b:	90                   	nop
  405e3c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  405e40:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405e44:	85 c0                	test   eax,eax
  405e46:	0f 88 15 fe ff ff    	js     405c61 <___gdtoa+0x601>
  405e4c:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405e50:	dd 04 c5 80 a3 40 00 	fld    QWORD PTR [eax*8+0x40a380]
  405e57:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405e5b:	85 c0                	test   eax,eax
  405e5d:	0f 8f e2 01 00 00    	jg     406045 <___gdtoa+0x9e5>
  405e63:	8b 84 24 94 00 00 00 	mov    eax,DWORD PTR [esp+0x94]
  405e6a:	c1 e8 1f             	shr    eax,0x1f
  405e6d:	84 c0                	test   al,al
  405e6f:	0f 84 d0 01 00 00    	je     406045 <___gdtoa+0x9e5>
  405e75:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  405e79:	85 c0                	test   eax,eax
  405e7b:	0f 85 3a 01 00 00    	jne    405fbb <___gdtoa+0x95b>
  405e81:	d8 0d 50 a3 40 00    	fmul   DWORD PTR ds:0x40a350
  405e87:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  405e8b:	d9 c9                	fxch   st(1)
  405e8d:	da e9                	fucompp 
  405e8f:	df e0                	fnstsw ax
  405e91:	9e                   	sahf   
  405e92:	0f 83 25 01 00 00    	jae    405fbd <___gdtoa+0x95d>
  405e98:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405e9c:	31 ff                	xor    edi,edi
  405e9e:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  405ea5:	00 
  405ea6:	83 c0 02             	add    eax,0x2
  405ea9:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405ead:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  405eb1:	31 d2                	xor    edx,edx
  405eb3:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  405eba:	00 
  405ebb:	8d 70 01             	lea    esi,[eax+0x1]
  405ebe:	c6 00 31             	mov    BYTE PTR [eax],0x31
  405ec1:	89 3c 24             	mov    DWORD PTR [esp],edi
  405ec4:	89 54 24 10          	mov    DWORD PTR [esp+0x10],edx
  405ec8:	e8 53 17 00 00       	call   407620 <___Bfree_D2A>
  405ecd:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405ed1:	85 c0                	test   eax,eax
  405ed3:	74 18                	je     405eed <___gdtoa+0x88d>
  405ed5:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
  405ed9:	39 c2                	cmp    edx,eax
  405edb:	0f 85 dd 03 00 00    	jne    4062be <___gdtoa+0xc5e>
  405ee1:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  405ee5:	89 04 24             	mov    DWORD PTR [esp],eax
  405ee8:	e8 33 17 00 00       	call   407620 <___Bfree_D2A>
  405eed:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405ef0:	e8 2b 17 00 00       	call   407620 <___Bfree_D2A>
  405ef5:	8b 84 24 98 00 00 00 	mov    eax,DWORD PTR [esp+0x98]
  405efc:	8b 7c 24 0c          	mov    edi,DWORD PTR [esp+0xc]
  405f00:	c6 06 00             	mov    BYTE PTR [esi],0x0
  405f03:	89 38                	mov    DWORD PTR [eax],edi
  405f05:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  405f0c:	85 c0                	test   eax,eax
  405f0e:	74 09                	je     405f19 <___gdtoa+0x8b9>
  405f10:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [esp+0x9c]
  405f17:	89 30                	mov    DWORD PTR [eax],esi
  405f19:	8b 84 24 8c 00 00 00 	mov    eax,DWORD PTR [esp+0x8c]
  405f20:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  405f24:	09 38                	or     DWORD PTR [eax],edi
  405f26:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  405f2a:	83 c4 6c             	add    esp,0x6c
  405f2d:	5b                   	pop    ebx
  405f2e:	5e                   	pop    esi
  405f2f:	5f                   	pop    edi
  405f30:	5d                   	pop    ebp
  405f31:	c3                   	ret    
  405f32:	b8 03 00 00 00       	mov    eax,0x3
  405f37:	2b 44 24 2c          	sub    eax,DWORD PTR [esp+0x2c]
  405f3b:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  405f3f:	e9 95 fa ff ff       	jmp    4059d9 <___gdtoa+0x379>
  405f44:	c7 44 24 34 00 00 00 	mov    DWORD PTR [esp+0x34],0x0
  405f4b:	00 
  405f4c:	e9 93 f9 ff ff       	jmp    4058e4 <___gdtoa+0x284>
  405f51:	c7 44 24 2c 02 00 00 	mov    DWORD PTR [esp+0x2c],0x2
  405f58:	00 
  405f59:	e9 72 fa ff ff       	jmp    4059d0 <___gdtoa+0x370>
  405f5e:	c7 44 24 40 00 00 00 	mov    DWORD PTR [esp+0x40],0x0
  405f65:	00 
  405f66:	e9 0c fa ff ff       	jmp    405977 <___gdtoa+0x317>
  405f6b:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  405f72:	02 
  405f73:	c7 44 24 40 00 00 00 	mov    DWORD PTR [esp+0x40],0x0
  405f7a:	00 
  405f7b:	0f 85 32 fc ff ff    	jne    405bb3 <___gdtoa+0x553>
  405f81:	8b 94 24 94 00 00 00 	mov    edx,DWORD PTR [esp+0x94]
  405f88:	85 d2                	test   edx,edx
  405f8a:	0f 8e d3 04 00 00    	jle    406463 <___gdtoa+0xe03>
  405f90:	83 bc 24 94 00 00 00 	cmp    DWORD PTR [esp+0x94],0xe
  405f97:	0e 
  405f98:	0f 96 c2             	setbe  dl
  405f9b:	8b 8c 24 94 00 00 00 	mov    ecx,DWORD PTR [esp+0x94]
  405fa2:	21 c2                	and    edx,eax
  405fa4:	89 4c 24 5c          	mov    DWORD PTR [esp+0x5c],ecx
  405fa8:	89 c8                	mov    eax,ecx
  405faa:	89 4c 24 44          	mov    DWORD PTR [esp+0x44],ecx
  405fae:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
  405fb2:	e9 ec f9 ff ff       	jmp    4059a3 <___gdtoa+0x343>
  405fb7:	dd d8                	fstp   st(0)
  405fb9:	eb 02                	jmp    405fbd <___gdtoa+0x95d>
  405fbb:	dd d8                	fstp   st(0)
  405fbd:	31 ff                	xor    edi,edi
  405fbf:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  405fc6:	00 
  405fc7:	8b 84 24 94 00 00 00 	mov    eax,DWORD PTR [esp+0x94]
  405fce:	31 d2                	xor    edx,edx
  405fd0:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  405fd4:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  405fdb:	00 
  405fdc:	f7 d8                	neg    eax
  405fde:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  405fe2:	e9 da fe ff ff       	jmp    405ec1 <___gdtoa+0x861>
  405fe7:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  405feb:	29 44 24 28          	sub    DWORD PTR [esp+0x28],eax
  405fef:	c7 44 24 3c 00 00 00 	mov    DWORD PTR [esp+0x3c],0x0
  405ff6:	00 
  405ff7:	f7 d8                	neg    eax
  405ff9:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  405ffd:	e9 17 f9 ff ff       	jmp    405919 <___gdtoa+0x2b9>
  406002:	f7 d8                	neg    eax
  406004:	89 44 24 28          	mov    DWORD PTR [esp+0x28],eax
  406008:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [esp+0x1c],0x0
  40600f:	00 
  406010:	e9 e8 f8 ff ff       	jmp    4058fd <___gdtoa+0x29d>
  406015:	db 44 24 0c          	fild   DWORD PTR [esp+0xc]
  406019:	da e9                	fucompp 
  40601b:	df e0                	fnstsw ax
  40601d:	9e                   	sahf   
  40601e:	7a 06                	jp     406026 <___gdtoa+0x9c6>
  406020:	0f 84 7b f8 ff ff    	je     4058a1 <___gdtoa+0x241>
  406026:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
  40602b:	e9 71 f8 ff ff       	jmp    4058a1 <___gdtoa+0x241>
  406030:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  406034:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  406038:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  40603f:	00 
  406040:	e9 79 fc ff ff       	jmp    405cbe <___gdtoa+0x65e>
  406045:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  406049:	d9 c0                	fld    st(0)
  40604b:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
  40604f:	d8 f2                	fdiv   st,st(2)
  406051:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  406055:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  40605c:	00 
  40605d:	8d 77 01             	lea    esi,[edi+0x1]
  406060:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  406065:	b4 0c                	mov    ah,0xc
  406067:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  40606c:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  406070:	db 5c 24 48          	fistp  DWORD PTR [esp+0x48]
  406074:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  406078:	8b 4c 24 48          	mov    ecx,DWORD PTR [esp+0x48]
  40607c:	89 4c 24 48          	mov    DWORD PTR [esp+0x48],ecx
  406080:	8d 41 30             	lea    eax,[ecx+0x30]
  406083:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  406087:	d8 ca                	fmul   st,st(2)
  406089:	88 07                	mov    BYTE PTR [edi],al
  40608b:	de e9                	fsubrp st(1),st
  40608d:	d9 ee                	fldz   
  40608f:	d9 c9                	fxch   st(1)
  406091:	dd e1                	fucom  st(1)
  406093:	df e0                	fnstsw ax
  406095:	dd d9                	fstp   st(1)
  406097:	9e                   	sahf   
  406098:	0f 8b 52 09 00 00    	jnp    4069f0 <___gdtoa+0x1390>
  40609e:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  4060a2:	39 44 24 18          	cmp    DWORD PTR [esp+0x18],eax
  4060a6:	0f 84 93 03 00 00    	je     40643f <___gdtoa+0xddf>
  4060ac:	d9 05 44 a3 40 00    	fld    DWORD PTR ds:0x40a344
  4060b2:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  4060b6:	eb 0c                	jmp    4060c4 <___gdtoa+0xa64>
  4060b8:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  4060bc:	39 c2                	cmp    edx,eax
  4060be:	0f 84 79 03 00 00    	je     40643d <___gdtoa+0xddd>
  4060c4:	83 c0 01             	add    eax,0x1
  4060c7:	dc c9                	fmul   st(1),st
  4060c9:	83 c6 01             	add    esi,0x1
  4060cc:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  4060d0:	d9 c1                	fld    st(1)
  4060d2:	d8 f3                	fdiv   st,st(3)
  4060d4:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  4060d8:	db 5c 24 48          	fistp  DWORD PTR [esp+0x48]
  4060dc:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  4060e0:	8b 4c 24 48          	mov    ecx,DWORD PTR [esp+0x48]
  4060e4:	89 4c 24 48          	mov    DWORD PTR [esp+0x48],ecx
  4060e8:	8d 41 30             	lea    eax,[ecx+0x30]
  4060eb:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  4060ef:	d8 cb                	fmul   st,st(3)
  4060f1:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  4060f4:	de ea                	fsubrp st(2),st
  4060f6:	d9 ee                	fldz   
  4060f8:	d9 ca                	fxch   st(2)
  4060fa:	dd e2                	fucom  st(2)
  4060fc:	df e0                	fnstsw ax
  4060fe:	dd da                	fstp   st(2)
  406100:	9e                   	sahf   
  406101:	7a b5                	jp     4060b8 <___gdtoa+0xa58>
  406103:	75 b3                	jne    4060b8 <___gdtoa+0xa58>
  406105:	dd d8                	fstp   st(0)
  406107:	dd d8                	fstp   st(0)
  406109:	dd d8                	fstp   st(0)
  40610b:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  40610f:	83 c0 01             	add    eax,0x1
  406112:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406116:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  40611d:	00 
  40611e:	e9 ca fd ff ff       	jmp    405eed <___gdtoa+0x88d>
  406123:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  406127:	85 c0                	test   eax,eax
  406129:	0f 84 19 02 00 00    	je     406348 <___gdtoa+0xce8>
  40612f:	8d 04 2e             	lea    eax,[esi+ebp*1]
  406132:	85 c0                	test   eax,eax
  406134:	7e 14                	jle    40614a <___gdtoa+0xaea>
  406136:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40613a:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  40613e:	89 04 24             	mov    DWORD PTR [esp],eax
  406141:	e8 4a 19 00 00       	call   407a90 <___lshift_D2A>
  406146:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  40614a:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
  40614e:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
  406152:	85 f6                	test   esi,esi
  406154:	0f 85 e9 06 00 00    	jne    406843 <___gdtoa+0x11e3>
  40615a:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  40615e:	89 7c 24 1c          	mov    DWORD PTR [esp+0x1c],edi
  406162:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
  406166:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  40616d:	00 
  40616e:	89 74 24 28          	mov    DWORD PTR [esp+0x28],esi
  406172:	e9 d6 00 00 00       	jmp    40624d <___gdtoa+0xbed>
  406177:	89 14 24             	mov    DWORD PTR [esp],edx
  40617a:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  40617e:	e8 9d 14 00 00       	call   407620 <___Bfree_D2A>
  406183:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  406187:	89 c1                	mov    ecx,eax
  406189:	0b 8c 24 90 00 00 00 	or     ecx,DWORD PTR [esp+0x90]
  406190:	75 18                	jne    4061aa <___gdtoa+0xb4a>
  406192:	8b 8c 24 88 00 00 00 	mov    ecx,DWORD PTR [esp+0x88]
  406199:	f6 01 01             	test   BYTE PTR [ecx],0x1
  40619c:	75 0c                	jne    4061aa <___gdtoa+0xb4a>
  40619e:	8b 54 24 2c          	mov    edx,DWORD PTR [esp+0x2c]
  4061a2:	85 d2                	test   edx,edx
  4061a4:	0f 84 55 08 00 00    	je     4069ff <___gdtoa+0x139f>
  4061aa:	85 f6                	test   esi,esi
  4061ac:	0f 88 18 05 00 00    	js     4066ca <___gdtoa+0x106a>
  4061b2:	0b b4 24 90 00 00 00 	or     esi,DWORD PTR [esp+0x90]
  4061b9:	75 10                	jne    4061cb <___gdtoa+0xb6b>
  4061bb:	8b b4 24 88 00 00 00 	mov    esi,DWORD PTR [esp+0x88]
  4061c2:	f6 06 01             	test   BYTE PTR [esi],0x1
  4061c5:	0f 84 ff 04 00 00    	je     4066ca <___gdtoa+0x106a>
  4061cb:	85 c0                	test   eax,eax
  4061cd:	0f 8f c9 06 00 00    	jg     40689c <___gdtoa+0x123c>
  4061d3:	83 44 24 28 01       	add    DWORD PTR [esp+0x28],0x1
  4061d8:	0f b6 44 24 10       	movzx  eax,BYTE PTR [esp+0x10]
  4061dd:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4061e1:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  4061e4:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  4061e8:	39 44 24 5c          	cmp    DWORD PTR [esp+0x5c],eax
  4061ec:	0f 84 97 06 00 00    	je     406889 <___gdtoa+0x1229>
  4061f2:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4061f5:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4061fc:	00 
  4061fd:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  406204:	00 
  406205:	e8 86 14 00 00       	call   407690 <___multadd_D2A>
  40620a:	39 ef                	cmp    edi,ebp
  40620c:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  406213:	00 
  406214:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  40621b:	00 
  40621c:	89 3c 24             	mov    DWORD PTR [esp],edi
  40621f:	89 c3                	mov    ebx,eax
  406221:	0f 84 8c 00 00 00    	je     4062b3 <___gdtoa+0xc53>
  406227:	e8 64 14 00 00       	call   407690 <___multadd_D2A>
  40622c:	89 2c 24             	mov    DWORD PTR [esp],ebp
  40622f:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  406236:	00 
  406237:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  40623e:	00 
  40623f:	89 c7                	mov    edi,eax
  406241:	e8 4a 14 00 00       	call   407690 <___multadd_D2A>
  406246:	89 c5                	mov    ebp,eax
  406248:	83 44 24 5c 01       	add    DWORD PTR [esp+0x5c],0x1
  40624d:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  406251:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406254:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406258:	e8 d3 0f 00 00       	call   407230 <___quorem_D2A>
  40625d:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  406261:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406264:	89 c6                	mov    esi,eax
  406266:	83 c6 30             	add    esi,0x30
  406269:	89 74 24 10          	mov    DWORD PTR [esp+0x10],esi
  40626d:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  406271:	e8 2a 19 00 00       	call   407ba0 <___cmp_D2A>
  406276:	89 6c 24 04          	mov    DWORD PTR [esp+0x4],ebp
  40627a:	89 c6                	mov    esi,eax
  40627c:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  406280:	89 04 24             	mov    DWORD PTR [esp],eax
  406283:	e8 68 19 00 00       	call   407bf0 <___diff_D2A>
  406288:	89 c2                	mov    edx,eax
  40628a:	b8 01 00 00 00       	mov    eax,0x1
  40628f:	8b 4a 0c             	mov    ecx,DWORD PTR [edx+0xc]
  406292:	85 c9                	test   ecx,ecx
  406294:	0f 85 dd fe ff ff    	jne    406177 <___gdtoa+0xb17>
  40629a:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  40629e:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4062a1:	89 54 24 20          	mov    DWORD PTR [esp+0x20],edx
  4062a5:	e8 f6 18 00 00       	call   407ba0 <___cmp_D2A>
  4062aa:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  4062ae:	e9 c4 fe ff ff       	jmp    406177 <___gdtoa+0xb17>
  4062b3:	e8 d8 13 00 00       	call   407690 <___multadd_D2A>
  4062b8:	89 c7                	mov    edi,eax
  4062ba:	89 c5                	mov    ebp,eax
  4062bc:	eb 8a                	jmp    406248 <___gdtoa+0xbe8>
  4062be:	85 d2                	test   edx,edx
  4062c0:	0f 84 1b fc ff ff    	je     405ee1 <___gdtoa+0x881>
  4062c6:	89 14 24             	mov    DWORD PTR [esp],edx
  4062c9:	e8 52 13 00 00       	call   407620 <___Bfree_D2A>
  4062ce:	66 90                	xchg   ax,ax
  4062d0:	e9 0c fc ff ff       	jmp    405ee1 <___gdtoa+0x881>
  4062d5:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  4062d9:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4062dc:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4062e0:	e8 1b 16 00 00       	call   407900 <___pow5mult_D2A>
  4062e5:	89 c3                	mov    ebx,eax
  4062e7:	e9 4e fa ff ff       	jmp    405d3a <___gdtoa+0x6da>
  4062ec:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4062f0:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4062f3:	e8 a8 18 00 00       	call   407ba0 <___cmp_D2A>
  4062f8:	85 c0                	test   eax,eax
  4062fa:	0f 89 da fa ff ff    	jns    405dda <___gdtoa+0x77a>
  406300:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406303:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  40630a:	00 
  40630b:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  406312:	00 
  406313:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
  406318:	e8 73 13 00 00       	call   407690 <___multadd_D2A>
  40631d:	89 c3                	mov    ebx,eax
  40631f:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  406323:	85 c0                	test   eax,eax
  406325:	0f 85 24 07 00 00    	jne    406a4f <___gdtoa+0x13ef>
  40632b:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  406332:	02 
  406333:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  406337:	7e 0b                	jle    406344 <___gdtoa+0xce4>
  406339:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
  40633e:	0f 8e 86 07 00 00    	jle    406aca <___gdtoa+0x146a>
  406344:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406348:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  40634f:	00 
  406350:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  406354:	8b 6c 24 18          	mov    ebp,DWORD PTR [esp+0x18]
  406358:	eb 25                	jmp    40637f <___gdtoa+0xd1f>
  40635a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  406360:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406363:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  40636a:	00 
  40636b:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  406372:	00 
  406373:	e8 18 13 00 00       	call   407690 <___multadd_D2A>
  406378:	83 44 24 5c 01       	add    DWORD PTR [esp+0x5c],0x1
  40637d:	89 c3                	mov    ebx,eax
  40637f:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  406383:	83 c6 01             	add    esi,0x1
  406386:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406389:	e8 a2 0e 00 00       	call   407230 <___quorem_D2A>
  40638e:	83 c0 30             	add    eax,0x30
  406391:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  406394:	3b 6c 24 5c          	cmp    ebp,DWORD PTR [esp+0x5c]
  406398:	7f c6                	jg     406360 <___gdtoa+0xd00>
  40639a:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40639e:	31 d2                	xor    edx,edx
  4063a0:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  4063a4:	85 c0                	test   eax,eax
  4063a6:	0f 84 e5 03 00 00    	je     406791 <___gdtoa+0x1131>
  4063ac:	83 f8 02             	cmp    eax,0x2
  4063af:	0f 84 18 04 00 00    	je     4067cd <___gdtoa+0x116d>
  4063b5:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  4063b9:	0f 8e cb 05 00 00    	jle    40698a <___gdtoa+0x132a>
  4063bf:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  4063c3:	8b 6c 24 24          	mov    ebp,DWORD PTR [esp+0x24]
  4063c7:	eb 15                	jmp    4063de <___gdtoa+0xd7e>
  4063c9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4063d0:	39 e8                	cmp    eax,ebp
  4063d2:	0f 84 a6 02 00 00    	je     40667e <___gdtoa+0x101e>
  4063d8:	0f b6 48 ff          	movzx  ecx,BYTE PTR [eax-0x1]
  4063dc:	89 c6                	mov    esi,eax
  4063de:	80 f9 39             	cmp    cl,0x39
  4063e1:	8d 46 ff             	lea    eax,[esi-0x1]
  4063e4:	74 ea                	je     4063d0 <___gdtoa+0xd70>
  4063e6:	83 c1 01             	add    ecx,0x1
  4063e9:	88 08                	mov    BYTE PTR [eax],cl
  4063eb:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4063ef:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  4063f6:	00 
  4063f7:	83 c0 01             	add    eax,0x1
  4063fa:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4063fe:	e9 be fa ff ff       	jmp    405ec1 <___gdtoa+0x861>
  406403:	83 fd 01             	cmp    ebp,0x1
  406406:	0f 85 68 f9 ff ff    	jne    405d74 <___gdtoa+0x714>
  40640c:	8b 84 24 80 00 00 00 	mov    eax,DWORD PTR [esp+0x80]
  406413:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  406416:	83 c0 01             	add    eax,0x1
  406419:	39 84 24 84 00 00 00 	cmp    DWORD PTR [esp+0x84],eax
  406420:	0f 8e 4e f9 ff ff    	jle    405d74 <___gdtoa+0x714>
  406426:	83 44 24 28 01       	add    DWORD PTR [esp+0x28],0x1
  40642b:	83 44 24 1c 01       	add    DWORD PTR [esp+0x1c],0x1
  406430:	c7 44 24 10 01 00 00 	mov    DWORD PTR [esp+0x10],0x1
  406437:	00 
  406438:	e9 37 f9 ff ff       	jmp    405d74 <___gdtoa+0x714>
  40643d:	dd d8                	fstp   st(0)
  40643f:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  406443:	85 c0                	test   eax,eax
  406445:	0f 84 fe 01 00 00    	je     406649 <___gdtoa+0xfe9>
  40644b:	dd d8                	fstp   st(0)
  40644d:	dd d8                	fstp   st(0)
  40644f:	83 7c 24 2c 01       	cmp    DWORD PTR [esp+0x2c],0x1
  406454:	0f 84 22 03 00 00    	je     40677c <___gdtoa+0x111c>
  40645a:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  40645e:	e9 ff f6 ff ff       	jmp    405b62 <___gdtoa+0x502>
  406463:	ba 01 00 00 00       	mov    edx,0x1
  406468:	c7 84 24 94 00 00 00 	mov    DWORD PTR [esp+0x94],0x1
  40646f:	01 00 00 00 
  406473:	e9 23 fb ff ff       	jmp    405f9b <___gdtoa+0x93b>
  406478:	83 7c 24 18 0e       	cmp    DWORD PTR [esp+0x18],0xe
  40647d:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  406484:	00 
  406485:	0f 96 c2             	setbe  dl
  406488:	21 c2                	and    edx,eax
  40648a:	b8 01 00 00 00       	mov    eax,0x1
  40648f:	e9 0f f5 ff ff       	jmp    4059a3 <___gdtoa+0x343>
  406494:	89 c2                	mov    edx,eax
  406496:	31 ff                	xor    edi,edi
  406498:	2b 54 24 30          	sub    edx,DWORD PTR [esp+0x30]
  40649c:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  4064a0:	01 54 24 3c          	add    DWORD PTR [esp+0x3c],edx
  4064a4:	e9 e9 f7 ff ff       	jmp    405c92 <___gdtoa+0x632>
  4064a9:	d9 7c 24 4e          	fnstcw WORD PTR [esp+0x4e]
  4064ad:	dd 44 24 10          	fld    QWORD PTR [esp+0x10]
  4064b1:	dc 0c d5 78 a3 40 00 	fmul   QWORD PTR [edx*8+0x40a378]
  4064b8:	c7 44 24 5c 01 00 00 	mov    DWORD PTR [esp+0x5c],0x1
  4064bf:	00 
  4064c0:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  4064c4:	0f b7 44 24 4e       	movzx  eax,WORD PTR [esp+0x4e]
  4064c9:	b4 0c                	mov    ah,0xc
  4064cb:	d9 05 44 a3 40 00    	fld    DWORD PTR ds:0x40a344
  4064d1:	d9 ca                	fxch   st(2)
  4064d3:	66 89 44 24 4c       	mov    WORD PTR [esp+0x4c],ax
  4064d8:	eb 0f                	jmp    4064e9 <___gdtoa+0xe89>
  4064da:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4064e0:	d8 ca                	fmul   st,st(2)
  4064e2:	83 c0 01             	add    eax,0x1
  4064e5:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  4064e9:	d9 6c 24 4c          	fldcw  WORD PTR [esp+0x4c]
  4064ed:	db 54 24 48          	fist   DWORD PTR [esp+0x48]
  4064f1:	d9 6c 24 4e          	fldcw  WORD PTR [esp+0x4e]
  4064f5:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  4064f9:	85 c0                	test   eax,eax
  4064fb:	74 0a                	je     406507 <___gdtoa+0xea7>
  4064fd:	89 44 24 48          	mov    DWORD PTR [esp+0x48],eax
  406501:	db 44 24 48          	fild   DWORD PTR [esp+0x48]
  406505:	de e9                	fsubrp st(1),st
  406507:	83 c6 01             	add    esi,0x1
  40650a:	8d 48 30             	lea    ecx,[eax+0x30]
  40650d:	88 4e ff             	mov    BYTE PTR [esi-0x1],cl
  406510:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  406514:	39 d0                	cmp    eax,edx
  406516:	75 c8                	jne    4064e0 <___gdtoa+0xe80>
  406518:	dd da                	fstp   st(2)
  40651a:	d9 c9                	fxch   st(1)
  40651c:	d9 05 54 a3 40 00    	fld    DWORD PTR ds:0x40a354
  406522:	d9 c2                	fld    st(2)
  406524:	d8 c1                	fadd   st,st(1)
  406526:	d9 ca                	fxch   st(2)
  406528:	dd e2                	fucom  st(2)
  40652a:	df e0                	fnstsw ax
  40652c:	dd da                	fstp   st(2)
  40652e:	9e                   	sahf   
  40652f:	0f 87 94 00 00 00    	ja     4065c9 <___gdtoa+0xf69>
  406535:	de e2                	fsubp  st(2),st
  406537:	d9 c9                	fxch   st(1)
  406539:	dd e9                	fucomp st(1)
  40653b:	df e0                	fnstsw ax
  40653d:	9e                   	sahf   
  40653e:	0f 86 0c f7 ff ff    	jbe    405c50 <___gdtoa+0x5f0>
  406544:	dd d9                	fstp   st(1)
  406546:	d9 ee                	fldz   
  406548:	d9 c9                	fxch   st(1)
  40654a:	da e9                	fucompp 
  40654c:	df e0                	fnstsw ax
  40654e:	9e                   	sahf   
  40654f:	0f 8a 4d 04 00 00    	jp     4069a2 <___gdtoa+0x1342>
  406555:	0f 85 47 04 00 00    	jne    4069a2 <___gdtoa+0x1342>
  40655b:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  406562:	00 
  406563:	eb 06                	jmp    40656b <___gdtoa+0xf0b>
  406565:	0f b6 48 ff          	movzx  ecx,BYTE PTR [eax-0x1]
  406569:	89 c6                	mov    esi,eax
  40656b:	80 f9 30             	cmp    cl,0x30
  40656e:	8d 46 ff             	lea    eax,[esi-0x1]
  406571:	74 f2                	je     406565 <___gdtoa+0xf05>
  406573:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  406577:	83 c0 01             	add    eax,0x1
  40657a:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40657e:	e9 6a f9 ff ff       	jmp    405eed <___gdtoa+0x88d>
  406583:	dd d8                	fstp   st(0)
  406585:	dd d8                	fstp   st(0)
  406587:	dd d8                	fstp   st(0)
  406589:	c7 44 24 0c 02 00 00 	mov    DWORD PTR [esp+0xc],0x2
  406590:	00 
  406591:	31 ff                	xor    edi,edi
  406593:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  40659a:	00 
  40659b:	e9 0d f9 ff ff       	jmp    405ead <___gdtoa+0x84d>
  4065a0:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4065a4:	83 e1 01             	and    ecx,0x1
  4065a7:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  4065ab:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  4065af:	0f 84 ed 03 00 00    	je     4069a2 <___gdtoa+0x1342>
  4065b5:	eb 1a                	jmp    4065d1 <___gdtoa+0xf71>
  4065b7:	dd d8                	fstp   st(0)
  4065b9:	dd d8                	fstp   st(0)
  4065bb:	dd d8                	fstp   st(0)
  4065bd:	eb 12                	jmp    4065d1 <___gdtoa+0xf71>
  4065bf:	dd d8                	fstp   st(0)
  4065c1:	dd d8                	fstp   st(0)
  4065c3:	dd d8                	fstp   st(0)
  4065c5:	dd d8                	fstp   st(0)
  4065c7:	eb 08                	jmp    4065d1 <___gdtoa+0xf71>
  4065c9:	dd d8                	fstp   st(0)
  4065cb:	dd d8                	fstp   st(0)
  4065cd:	dd d8                	fstp   st(0)
  4065cf:	dd d8                	fstp   st(0)
  4065d1:	8b 54 24 24          	mov    edx,DWORD PTR [esp+0x24]
  4065d5:	eb 0e                	jmp    4065e5 <___gdtoa+0xf85>
  4065d7:	39 d0                	cmp    eax,edx
  4065d9:	0f 84 be 00 00 00    	je     40669d <___gdtoa+0x103d>
  4065df:	0f b6 48 ff          	movzx  ecx,BYTE PTR [eax-0x1]
  4065e3:	89 c6                	mov    esi,eax
  4065e5:	80 f9 39             	cmp    cl,0x39
  4065e8:	8d 46 ff             	lea    eax,[esi-0x1]
  4065eb:	74 ea                	je     4065d7 <___gdtoa+0xf77>
  4065ed:	89 54 24 24          	mov    DWORD PTR [esp+0x24],edx
  4065f1:	83 c1 01             	add    ecx,0x1
  4065f4:	88 08                	mov    BYTE PTR [eax],cl
  4065f6:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
  4065fa:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406601:	00 
  406602:	83 c0 01             	add    eax,0x1
  406605:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406609:	e9 df f8 ff ff       	jmp    405eed <___gdtoa+0x88d>
  40660e:	8b b4 24 80 00 00 00 	mov    esi,DWORD PTR [esp+0x80]
  406615:	29 ef                	sub    edi,ebp
  406617:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  40661b:	8d 47 01             	lea    eax,[edi+0x1]
  40661e:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  406622:	8b 4e 04             	mov    ecx,DWORD PTR [esi+0x4]
  406625:	29 fa                	sub    edx,edi
  406627:	39 ca                	cmp    edx,ecx
  406629:	0f 8d be 02 00 00    	jge    4068ed <___gdtoa+0x128d>
  40662f:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  406633:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  406637:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  40663b:	29 c8                	sub    eax,ecx
  40663d:	83 c0 01             	add    eax,0x1
  406640:	89 44 24 5c          	mov    DWORD PTR [esp+0x5c],eax
  406644:	e9 5d f6 ff ff       	jmp    405ca6 <___gdtoa+0x646>
  406649:	d8 c0                	fadd   st,st(0)
  40664b:	dd e1                	fucom  st(1)
  40664d:	df e0                	fnstsw ax
  40664f:	9e                   	sahf   
  406650:	0f 87 22 01 00 00    	ja     406778 <___gdtoa+0x1118>
  406656:	d9 c9                	fxch   st(1)
  406658:	da e9                	fucompp 
  40665a:	df e0                	fnstsw ax
  40665c:	9e                   	sahf   
  40665d:	7a 06                	jp     406665 <___gdtoa+0x1005>
  40665f:	0f 84 3b ff ff ff    	je     4065a0 <___gdtoa+0xf40>
  406665:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406669:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  40666d:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  406674:	00 
  406675:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  406679:	e9 ed fe ff ff       	jmp    40656b <___gdtoa+0xf0b>
  40667e:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  406682:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406689:	00 
  40668a:	c6 00 31             	mov    BYTE PTR [eax],0x31
  40668d:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406691:	83 c0 02             	add    eax,0x2
  406694:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406698:	e9 24 f8 ff ff       	jmp    405ec1 <___gdtoa+0x861>
  40669d:	89 54 24 24          	mov    DWORD PTR [esp+0x24],edx
  4066a1:	b9 31 00 00 00       	mov    ecx,0x31
  4066a6:	83 44 24 38 01       	add    DWORD PTR [esp+0x38],0x1
  4066ab:	c6 02 30             	mov    BYTE PTR [edx],0x30
  4066ae:	e9 41 ff ff ff       	jmp    4065f4 <___gdtoa+0xf94>
  4066b3:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4066b7:	31 c0                	xor    eax,eax
  4066b9:	2b 74 24 18          	sub    esi,DWORD PTR [esp+0x18]
  4066bd:	c7 44 24 5c 00 00 00 	mov    DWORD PTR [esp+0x5c],0x0
  4066c4:	00 
  4066c5:	e9 dc f5 ff ff       	jmp    405ca6 <___gdtoa+0x646>
  4066ca:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  4066ce:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  4066d2:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4066d6:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  4066da:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
  4066de:	85 c9                	test   ecx,ecx
  4066e0:	0f 84 1e 02 00 00    	je     406904 <___gdtoa+0x12a4>
  4066e6:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  4066ea:	0f 8e 0a 02 00 00    	jle    4068fa <___gdtoa+0x129a>
  4066f0:	83 7c 24 2c 02       	cmp    DWORD PTR [esp+0x2c],0x2
  4066f5:	75 3a                	jne    406731 <___gdtoa+0x10d1>
  4066f7:	e9 63 02 00 00       	jmp    40695f <___gdtoa+0x12ff>
  4066fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406700:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406703:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  40670a:	00 
  40670b:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  406712:	00 
  406713:	e8 78 0f 00 00       	call   407690 <___multadd_D2A>
  406718:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  40671c:	89 04 24             	mov    DWORD PTR [esp],eax
  40671f:	89 c3                	mov    ebx,eax
  406721:	e8 0a 0b 00 00       	call   407230 <___quorem_D2A>
  406726:	8b 6c 24 18          	mov    ebp,DWORD PTR [esp+0x18]
  40672a:	83 c0 30             	add    eax,0x30
  40672d:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406731:	89 6c 24 04          	mov    DWORD PTR [esp+0x4],ebp
  406735:	89 3c 24             	mov    DWORD PTR [esp],edi
  406738:	e8 63 14 00 00       	call   407ba0 <___cmp_D2A>
  40673d:	85 c0                	test   eax,eax
  40673f:	0f 8e 88 02 00 00    	jle    4069cd <___gdtoa+0x136d>
  406745:	0f b6 44 24 10       	movzx  eax,BYTE PTR [esp+0x10]
  40674a:	83 c6 01             	add    esi,0x1
  40674d:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  406750:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  406757:	00 
  406758:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  40675f:	00 
  406760:	89 2c 24             	mov    DWORD PTR [esp],ebp
  406763:	e8 28 0f 00 00       	call   407690 <___multadd_D2A>
  406768:	39 6c 24 20          	cmp    DWORD PTR [esp+0x20],ebp
  40676c:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406770:	75 8e                	jne    406700 <___gdtoa+0x10a0>
  406772:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  406776:	eb 88                	jmp    406700 <___gdtoa+0x10a0>
  406778:	dd d8                	fstp   st(0)
  40677a:	dd d8                	fstp   st(0)
  40677c:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406780:	0f b6 4e ff          	movzx  ecx,BYTE PTR [esi-0x1]
  406784:	8b 54 24 24          	mov    edx,DWORD PTR [esp+0x24]
  406788:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  40678c:	e9 54 fe ff ff       	jmp    4065e5 <___gdtoa+0xf85>
  406791:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406794:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  40679b:	00 
  40679c:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  4067a0:	e8 eb 12 00 00       	call   407a90 <___lshift_D2A>
  4067a5:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4067a9:	89 04 24             	mov    DWORD PTR [esp],eax
  4067ac:	89 c3                	mov    ebx,eax
  4067ae:	e8 ed 13 00 00       	call   407ba0 <___cmp_D2A>
  4067b3:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  4067b7:	83 f8 00             	cmp    eax,0x0
  4067ba:	0f 8f ff fb ff ff    	jg     4063bf <___gdtoa+0xd5f>
  4067c0:	75 0b                	jne    4067cd <___gdtoa+0x116d>
  4067c2:	f6 44 24 10 01       	test   BYTE PTR [esp+0x10],0x1
  4067c7:	0f 85 f2 fb ff ff    	jne    4063bf <___gdtoa+0xd5f>
  4067cd:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  4067d1:	0f 8e dc 02 00 00    	jle    406ab3 <___gdtoa+0x1453>
  4067d7:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  4067de:	00 
  4067df:	eb 02                	jmp    4067e3 <___gdtoa+0x1183>
  4067e1:	89 c6                	mov    esi,eax
  4067e3:	80 7e ff 30          	cmp    BYTE PTR [esi-0x1],0x30
  4067e7:	8d 46 ff             	lea    eax,[esi-0x1]
  4067ea:	74 f5                	je     4067e1 <___gdtoa+0x1181>
  4067ec:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4067f0:	83 c0 01             	add    eax,0x1
  4067f3:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4067f7:	e9 c5 f6 ff ff       	jmp    405ec1 <___gdtoa+0x861>
  4067fc:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  406800:	85 c0                	test   eax,eax
  406802:	0f 84 fa f3 ff ff    	je     405c02 <___gdtoa+0x5a2>
  406808:	8b 54 24 44          	mov    edx,DWORD PTR [esp+0x44]
  40680c:	85 d2                	test   edx,edx
  40680e:	0f 8e 3e f4 ff ff    	jle    405c52 <___gdtoa+0x5f2>
  406814:	d9 c0                	fld    st(0)
  406816:	d8 0d 44 a3 40 00    	fmul   DWORD PTR ds:0x40a344
  40681c:	c7 44 24 38 ff ff ff 	mov    DWORD PTR [esp+0x38],0xffffffff
  406823:	ff 
  406824:	d9 c0                	fld    st(0)
  406826:	d8 0d 48 a3 40 00    	fmul   DWORD PTR ds:0x40a348
  40682c:	d8 05 4c a3 40 00    	fadd   DWORD PTR ds:0x40a34c
  406832:	dd 5c 24 10          	fstp   QWORD PTR [esp+0x10]
  406836:	81 6c 24 14 00 00 40 	sub    DWORD PTR [esp+0x14],0x3400000
  40683d:	03 
  40683e:	e9 02 f2 ff ff       	jmp    405a45 <___gdtoa+0x3e5>
  406843:	8b 45 04             	mov    eax,DWORD PTR [ebp+0x4]
  406846:	89 04 24             	mov    DWORD PTR [esp],eax
  406849:	e8 02 0d 00 00       	call   407550 <___Balloc_D2A>
  40684e:	8d 48 0c             	lea    ecx,[eax+0xc]
  406851:	89 c6                	mov    esi,eax
  406853:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  406856:	89 0c 24             	mov    DWORD PTR [esp],ecx
  406859:	8d 14 85 08 00 00 00 	lea    edx,[eax*4+0x8]
  406860:	89 e8                	mov    eax,ebp
  406862:	83 c0 0c             	add    eax,0xc
  406865:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  406869:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40686d:	e8 d6 18 00 00       	call   408148 <_memcpy>
  406872:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  406879:	00 
  40687a:	89 34 24             	mov    DWORD PTR [esp],esi
  40687d:	e8 0e 12 00 00       	call   407a90 <___lshift_D2A>
  406882:	89 c5                	mov    ebp,eax
  406884:	e9 d1 f8 ff ff       	jmp    40615a <___gdtoa+0xafa>
  406889:	89 fa                	mov    edx,edi
  40688b:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  40688f:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  406893:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  406897:	e9 04 fb ff ff       	jmp    4063a0 <___gdtoa+0xd40>
  40689c:	83 7c 24 2c 02       	cmp    DWORD PTR [esp+0x2c],0x2
  4068a1:	0f 84 2c f9 ff ff    	je     4061d3 <___gdtoa+0xb73>
  4068a7:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4068ab:	83 7c 24 10 39       	cmp    DWORD PTR [esp+0x10],0x39
  4068b0:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  4068b4:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  4068b8:	89 f0                	mov    eax,esi
  4068ba:	0f 84 f1 00 00 00    	je     4069b1 <___gdtoa+0x1351>
  4068c0:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [esp+0x10]
  4068c5:	83 c6 01             	add    esi,0x1
  4068c8:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  4068cc:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  4068d3:	00 
  4068d4:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  4068d8:	83 c1 01             	add    ecx,0x1
  4068db:	88 08                	mov    BYTE PTR [eax],cl
  4068dd:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  4068e1:	83 c0 01             	add    eax,0x1
  4068e4:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4068e8:	e9 d4 f5 ff ff       	jmp    405ec1 <___gdtoa+0x861>
  4068ed:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  4068f1:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  4068f5:	e9 ac f3 ff ff       	jmp    405ca6 <___gdtoa+0x646>
  4068fa:	83 7b 14 00          	cmp    DWORD PTR [ebx+0x14],0x0
  4068fe:	0f 85 ec fd ff ff    	jne    4066f0 <___gdtoa+0x1090>
  406904:	85 c0                	test   eax,eax
  406906:	89 54 24 18          	mov    DWORD PTR [esp+0x18],edx
  40690a:	0f 8e d3 00 00 00    	jle    4069e3 <___gdtoa+0x1383>
  406910:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406913:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  40691a:	00 
  40691b:	e8 70 11 00 00       	call   407a90 <___lshift_D2A>
  406920:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  406924:	89 04 24             	mov    DWORD PTR [esp],eax
  406927:	89 c3                	mov    ebx,eax
  406929:	e8 72 12 00 00       	call   407ba0 <___cmp_D2A>
  40692e:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  406932:	83 f8 00             	cmp    eax,0x0
  406935:	0f 8e 98 01 00 00    	jle    406ad3 <___gdtoa+0x1473>
  40693b:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
  40693f:	83 c0 31             	add    eax,0x31
  406942:	83 fa 39             	cmp    edx,0x39
  406945:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406949:	74 64                	je     4069af <___gdtoa+0x134f>
  40694b:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406952:	00 
  406953:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  406957:	7f 06                	jg     40695f <___gdtoa+0x12ff>
  406959:	83 7b 14 00          	cmp    DWORD PTR [ebx+0x14],0x0
  40695d:	74 08                	je     406967 <___gdtoa+0x1307>
  40695f:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  406966:	00 
  406967:	0f b6 44 24 10       	movzx  eax,BYTE PTR [esp+0x10]
  40696c:	83 c6 01             	add    esi,0x1
  40696f:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  406973:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  406977:	88 46 ff             	mov    BYTE PTR [esi-0x1],al
  40697a:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  40697e:	83 c0 01             	add    eax,0x1
  406981:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406985:	e9 37 f5 ff ff       	jmp    405ec1 <___gdtoa+0x861>
  40698a:	8b 4b 14             	mov    ecx,DWORD PTR [ebx+0x14]
  40698d:	85 c9                	test   ecx,ecx
  40698f:	0f 85 2a fa ff ff    	jne    4063bf <___gdtoa+0xd5f>
  406995:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  40699c:	00 
  40699d:	e9 41 fe ff ff       	jmp    4067e3 <___gdtoa+0x1183>
  4069a2:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  4069a9:	00 
  4069aa:	e9 bc fb ff ff       	jmp    40656b <___gdtoa+0xf0b>
  4069af:	89 f0                	mov    eax,esi
  4069b1:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  4069b5:	83 c6 01             	add    esi,0x1
  4069b8:	b9 39 00 00 00       	mov    ecx,0x39
  4069bd:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  4069c1:	8b 6c 24 24          	mov    ebp,DWORD PTR [esp+0x24]
  4069c5:	c6 00 39             	mov    BYTE PTR [eax],0x39
  4069c8:	e9 11 fa ff ff       	jmp    4063de <___gdtoa+0xd7e>
  4069cd:	83 7c 24 10 39       	cmp    DWORD PTR [esp+0x10],0x39
  4069d2:	74 db                	je     4069af <___gdtoa+0x134f>
  4069d4:	83 44 24 10 01       	add    DWORD PTR [esp+0x10],0x1
  4069d9:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  4069e0:	00 
  4069e1:	eb 84                	jmp    406967 <___gdtoa+0x1307>
  4069e3:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  4069ea:	00 
  4069eb:	e9 63 ff ff ff       	jmp    406953 <___gdtoa+0x12f3>
  4069f0:	0f 85 a8 f6 ff ff    	jne    40609e <___gdtoa+0xa3e>
  4069f6:	dd d8                	fstp   st(0)
  4069f8:	dd d8                	fstp   st(0)
  4069fa:	e9 0c f7 ff ff       	jmp    40610b <___gdtoa+0xaab>
  4069ff:	89 f1                	mov    ecx,esi
  406a01:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
  406a05:	83 7c 24 10 39       	cmp    DWORD PTR [esp+0x10],0x39
  406a0a:	89 7c 24 20          	mov    DWORD PTR [esp+0x20],edi
  406a0e:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
  406a12:	89 f0                	mov    eax,esi
  406a14:	74 99                	je     4069af <___gdtoa+0x134f>
  406a16:	85 c9                	test   ecx,ecx
  406a18:	7e 73                	jle    406a8d <___gdtoa+0x142d>
  406a1a:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  406a1e:	c7 44 24 18 20 00 00 	mov    DWORD PTR [esp+0x18],0x20
  406a25:	00 
  406a26:	83 c1 31             	add    ecx,0x31
  406a29:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  406a2d:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [esp+0x10]
  406a32:	83 c6 01             	add    esi,0x1
  406a35:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  406a39:	89 6c 24 20          	mov    DWORD PTR [esp+0x20],ebp
  406a3d:	88 08                	mov    BYTE PTR [eax],cl
  406a3f:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  406a43:	83 c0 01             	add    eax,0x1
  406a46:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406a4a:	e9 72 f4 ff ff       	jmp    405ec1 <___gdtoa+0x861>
  406a4f:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
  406a53:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  406a5a:	00 
  406a5b:	c7 44 24 04 0a 00 00 	mov    DWORD PTR [esp+0x4],0xa
  406a62:	00 
  406a63:	89 04 24             	mov    DWORD PTR [esp],eax
  406a66:	e8 25 0c 00 00       	call   407690 <___multadd_D2A>
  406a6b:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
  406a70:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  406a74:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  406a78:	7f 0a                	jg     406a84 <___gdtoa+0x1424>
  406a7a:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [esp+0x90],0x2
  406a81:	02 
  406a82:	7f 46                	jg     406aca <___gdtoa+0x146a>
  406a84:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406a88:	e9 a2 f6 ff ff       	jmp    40612f <___gdtoa+0xacf>
  406a8d:	83 7b 10 01          	cmp    DWORD PTR [ebx+0x10],0x1
  406a91:	c7 44 24 18 10 00 00 	mov    DWORD PTR [esp+0x18],0x10
  406a98:	00 
  406a99:	7f 92                	jg     406a2d <___gdtoa+0x13cd>
  406a9b:	83 7b 14 01          	cmp    DWORD PTR [ebx+0x14],0x1
  406a9f:	19 c9                	sbb    ecx,ecx
  406aa1:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
  406aa5:	f7 54 24 18          	not    DWORD PTR [esp+0x18]
  406aa9:	83 64 24 18 10       	and    DWORD PTR [esp+0x18],0x10
  406aae:	e9 7a ff ff ff       	jmp    406a2d <___gdtoa+0x13cd>
  406ab3:	83 7b 14 00          	cmp    DWORD PTR [ebx+0x14],0x0
  406ab7:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  406abe:	00 
  406abf:	0f 85 12 fd ff ff    	jne    4067d7 <___gdtoa+0x1177>
  406ac5:	e9 19 fd ff ff       	jmp    4067e3 <___gdtoa+0x1183>
  406aca:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406ace:	e9 21 f3 ff ff       	jmp    405df4 <___gdtoa+0x794>
  406ad3:	0f 85 72 fe ff ff    	jne    40694b <___gdtoa+0x12eb>
  406ad9:	f6 44 24 10 01       	test   BYTE PTR [esp+0x10],0x1
  406ade:	66 90                	xchg   ax,ax
  406ae0:	0f 84 65 fe ff ff    	je     40694b <___gdtoa+0x12eb>
  406ae6:	e9 50 fe ff ff       	jmp    40693b <___gdtoa+0x12db>
  406aeb:	31 c0                	xor    eax,eax
  406aed:	8d 76 00             	lea    esi,[esi+0x0]
  406af0:	e9 8f ec ff ff       	jmp    405784 <___gdtoa+0x124>
  406af5:	b8 01 00 00 00       	mov    eax,0x1
  406afa:	e9 40 ee ff ff       	jmp    40593f <___gdtoa+0x2df>
  406aff:	90                   	nop

00406b00 <___wcrtomb_cp>:
  406b00:	55                   	push   ebp
  406b01:	89 e5                	mov    ebp,esp
  406b03:	83 ec 48             	sub    esp,0x48
  406b06:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
  406b09:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  406b0c:	85 d2                	test   edx,edx
  406b0e:	66 89 45 e4          	mov    WORD PTR [ebp-0x1c],ax
  406b12:	75 12                	jne    406b26 <___wcrtomb_cp+0x26>
  406b14:	66 3d ff 00          	cmp    ax,0xff
  406b18:	77 5d                	ja     406b77 <___wcrtomb_cp+0x77>
  406b1a:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  406b1d:	88 01                	mov    BYTE PTR [ecx],al
  406b1f:	b8 01 00 00 00       	mov    eax,0x1
  406b24:	c9                   	leave  
  406b25:	c3                   	ret    
  406b26:	8d 45 f4             	lea    eax,[ebp-0xc]
  406b29:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  406b2d:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  406b30:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  406b37:	00 
  406b38:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
  406b3f:	00 
  406b40:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406b47:	00 
  406b48:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  406b4c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406b4f:	89 14 24             	mov    DWORD PTR [esp],edx
  406b52:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  406b59:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406b5d:	8d 45 e4             	lea    eax,[ebp-0x1c]
  406b60:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  406b64:	e8 ef 16 00 00       	call   408258 <_WideCharToMultiByte@32>
  406b69:	83 ec 20             	sub    esp,0x20
  406b6c:	85 c0                	test   eax,eax
  406b6e:	74 07                	je     406b77 <___wcrtomb_cp+0x77>
  406b70:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  406b73:	85 d2                	test   edx,edx
  406b75:	74 ad                	je     406b24 <___wcrtomb_cp+0x24>
  406b77:	e8 04 16 00 00       	call   408180 <__errno>
  406b7c:	c7 00 2a 00 00 00    	mov    DWORD PTR [eax],0x2a
  406b82:	b8 ff ff ff ff       	mov    eax,0xffffffff
  406b87:	c9                   	leave  
  406b88:	c3                   	ret    
  406b89:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00406b90 <_wcrtomb>:
  406b90:	57                   	push   edi
  406b91:	56                   	push   esi
  406b92:	53                   	push   ebx
  406b93:	83 ec 20             	sub    esp,0x20
  406b96:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  406b9a:	8b 74 24 34          	mov    esi,DWORD PTR [esp+0x34]
  406b9e:	85 db                	test   ebx,ebx
  406ba0:	74 5e                	je     406c00 <_wcrtomb+0x70>
  406ba2:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  406ba7:	8b 38                	mov    edi,DWORD PTR [eax]
  406ba9:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406bb0:	00 
  406bb1:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406bb8:	e8 cb 15 00 00       	call   408188 <_setlocale>
  406bbd:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406bc4:	00 
  406bc5:	89 04 24             	mov    DWORD PTR [esp],eax
  406bc8:	e8 fb 15 00 00       	call   4081c8 <_strchr>
  406bcd:	31 d2                	xor    edx,edx
  406bcf:	85 c0                	test   eax,eax
  406bd1:	74 0d                	je     406be0 <_wcrtomb+0x50>
  406bd3:	83 c0 01             	add    eax,0x1
  406bd6:	89 04 24             	mov    DWORD PTR [esp],eax
  406bd9:	e8 f2 15 00 00       	call   4081d0 <_atoi>
  406bde:	89 c2                	mov    edx,eax
  406be0:	0f b7 f6             	movzx  esi,si
  406be3:	89 7c 24 0c          	mov    DWORD PTR [esp+0xc],edi
  406be7:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  406beb:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406bee:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  406bf2:	e8 09 ff ff ff       	call   406b00 <___wcrtomb_cp>
  406bf7:	83 c4 20             	add    esp,0x20
  406bfa:	5b                   	pop    ebx
  406bfb:	5e                   	pop    esi
  406bfc:	5f                   	pop    edi
  406bfd:	c3                   	ret    
  406bfe:	66 90                	xchg   ax,ax
  406c00:	8d 5c 24 1e          	lea    ebx,[esp+0x1e]
  406c04:	eb 9c                	jmp    406ba2 <_wcrtomb+0x12>
  406c06:	8d 76 00             	lea    esi,[esi+0x0]
  406c09:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00406c10 <_wcsrtombs>:
  406c10:	55                   	push   ebp
  406c11:	57                   	push   edi
  406c12:	56                   	push   esi
  406c13:	31 f6                	xor    esi,esi
  406c15:	53                   	push   ebx
  406c16:	83 ec 3c             	sub    esp,0x3c
  406c19:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406c20:	00 
  406c21:	8b 5c 24 50          	mov    ebx,DWORD PTR [esp+0x50]
  406c25:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406c2c:	e8 57 15 00 00       	call   408188 <_setlocale>
  406c31:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406c38:	00 
  406c39:	89 04 24             	mov    DWORD PTR [esp],eax
  406c3c:	e8 87 15 00 00       	call   4081c8 <_strchr>
  406c41:	85 c0                	test   eax,eax
  406c43:	74 0d                	je     406c52 <_wcsrtombs+0x42>
  406c45:	83 c0 01             	add    eax,0x1
  406c48:	89 04 24             	mov    DWORD PTR [esp],eax
  406c4b:	e8 80 15 00 00       	call   4081d0 <_atoi>
  406c50:	89 c6                	mov    esi,eax
  406c52:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  406c57:	8b 00                	mov    eax,DWORD PTR [eax]
  406c59:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  406c5d:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  406c61:	8b 38                	mov    edi,DWORD PTR [eax]
  406c63:	85 ff                	test   edi,edi
  406c65:	0f 84 cc 00 00 00    	je     406d37 <_wcsrtombs+0x127>
  406c6b:	31 ed                	xor    ebp,ebp
  406c6d:	85 db                	test   ebx,ebx
  406c6f:	74 76                	je     406ce7 <_wcsrtombs+0xd7>
  406c71:	8b 4c 24 58          	mov    ecx,DWORD PTR [esp+0x58]
  406c75:	85 c9                	test   ecx,ecx
  406c77:	74 49                	je     406cc2 <_wcsrtombs+0xb2>
  406c79:	89 f0                	mov    eax,esi
  406c7b:	89 fe                	mov    esi,edi
  406c7d:	89 c7                	mov    edi,eax
  406c7f:	eb 13                	jmp    406c94 <_wcsrtombs+0x84>
  406c81:	01 c3                	add    ebx,eax
  406c83:	01 c5                	add    ebp,eax
  406c85:	80 7b ff 00          	cmp    BYTE PTR [ebx-0x1],0x0
  406c89:	74 47                	je     406cd2 <_wcsrtombs+0xc2>
  406c8b:	83 c6 02             	add    esi,0x2
  406c8e:	39 6c 24 58          	cmp    DWORD PTR [esp+0x58],ebp
  406c92:	76 2c                	jbe    406cc0 <_wcsrtombs+0xb0>
  406c94:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  406c98:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  406c9c:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  406ca0:	0f b7 06             	movzx  eax,WORD PTR [esi]
  406ca3:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406ca6:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406caa:	e8 51 fe ff ff       	call   406b00 <___wcrtomb_cp>
  406caf:	85 c0                	test   eax,eax
  406cb1:	7f ce                	jg     406c81 <_wcsrtombs+0x71>
  406cb3:	b8 ff ff ff ff       	mov    eax,0xffffffff
  406cb8:	83 c4 3c             	add    esp,0x3c
  406cbb:	5b                   	pop    ebx
  406cbc:	5e                   	pop    esi
  406cbd:	5f                   	pop    edi
  406cbe:	5d                   	pop    ebp
  406cbf:	c3                   	ret    
  406cc0:	89 f7                	mov    edi,esi
  406cc2:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  406cc6:	89 38                	mov    DWORD PTR [eax],edi
  406cc8:	83 c4 3c             	add    esp,0x3c
  406ccb:	89 e8                	mov    eax,ebp
  406ccd:	5b                   	pop    ebx
  406cce:	5e                   	pop    esi
  406ccf:	5f                   	pop    edi
  406cd0:	5d                   	pop    ebp
  406cd1:	c3                   	ret    
  406cd2:	8b 44 24 54          	mov    eax,DWORD PTR [esp+0x54]
  406cd6:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  406cdc:	83 c4 3c             	add    esp,0x3c
  406cdf:	5b                   	pop    ebx
  406ce0:	8d 45 ff             	lea    eax,[ebp-0x1]
  406ce3:	5e                   	pop    esi
  406ce4:	5f                   	pop    edi
  406ce5:	5d                   	pop    ebp
  406ce6:	c3                   	ret    
  406ce7:	8b 44 24 58          	mov    eax,DWORD PTR [esp+0x58]
  406ceb:	85 c0                	test   eax,eax
  406ced:	74 63                	je     406d52 <_wcsrtombs+0x142>
  406cef:	89 e8                	mov    eax,ebp
  406cf1:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
  406cf5:	89 fd                	mov    ebp,edi
  406cf7:	89 c7                	mov    edi,eax
  406cf9:	eb 17                	jmp    406d12 <_wcsrtombs+0x102>
  406cfb:	90                   	nop
  406cfc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406d00:	01 c7                	add    edi,eax
  406d02:	80 7c 04 2d 00       	cmp    BYTE PTR [esp+eax*1+0x2d],0x0
  406d07:	74 38                	je     406d41 <_wcsrtombs+0x131>
  406d09:	83 c5 02             	add    ebp,0x2
  406d0c:	39 7c 24 58          	cmp    DWORD PTR [esp+0x58],edi
  406d10:	76 37                	jbe    406d49 <_wcsrtombs+0x139>
  406d12:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  406d16:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  406d1a:	0f b7 45 00          	movzx  eax,WORD PTR [ebp+0x0]
  406d1e:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406d22:	8d 44 24 2e          	lea    eax,[esp+0x2e]
  406d26:	89 04 24             	mov    DWORD PTR [esp],eax
  406d29:	e8 d2 fd ff ff       	call   406b00 <___wcrtomb_cp>
  406d2e:	85 c0                	test   eax,eax
  406d30:	7f ce                	jg     406d00 <_wcsrtombs+0xf0>
  406d32:	e9 7c ff ff ff       	jmp    406cb3 <_wcsrtombs+0xa3>
  406d37:	83 c4 3c             	add    esp,0x3c
  406d3a:	31 c0                	xor    eax,eax
  406d3c:	5b                   	pop    ebx
  406d3d:	5e                   	pop    esi
  406d3e:	5f                   	pop    edi
  406d3f:	5d                   	pop    ebp
  406d40:	c3                   	ret    
  406d41:	8d 47 ff             	lea    eax,[edi-0x1]
  406d44:	e9 6f ff ff ff       	jmp    406cb8 <_wcsrtombs+0xa8>
  406d49:	89 fd                	mov    ebp,edi
  406d4b:	89 e8                	mov    eax,ebp
  406d4d:	e9 66 ff ff ff       	jmp    406cb8 <_wcsrtombs+0xa8>
  406d52:	89 dd                	mov    ebp,ebx
  406d54:	89 e8                	mov    eax,ebp
  406d56:	e9 5d ff ff ff       	jmp    406cb8 <_wcsrtombs+0xa8>
  406d5b:	90                   	nop
  406d5c:	90                   	nop
  406d5d:	90                   	nop
  406d5e:	90                   	nop
  406d5f:	90                   	nop

00406d60 <___mbrtowc_cp>:
  406d60:	55                   	push   ebp
  406d61:	89 e5                	mov    ebp,esp
  406d63:	56                   	push   esi
  406d64:	53                   	push   ebx
  406d65:	83 ec 30             	sub    esp,0x30
  406d68:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
  406d6b:	8b 75 14             	mov    esi,DWORD PTR [ebp+0x14]
  406d6e:	85 db                	test   ebx,ebx
  406d70:	0f 84 2d 01 00 00    	je     406ea3 <___mbrtowc_cp+0x143>
  406d76:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
  406d79:	85 c9                	test   ecx,ecx
  406d7b:	0f 84 2f 01 00 00    	je     406eb0 <___mbrtowc_cp+0x150>
  406d81:	8b 06                	mov    eax,DWORD PTR [esi]
  406d83:	c7 06 00 00 00 00    	mov    DWORD PTR [esi],0x0
  406d89:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  406d8c:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  406d8f:	84 c0                	test   al,al
  406d91:	0f 84 99 00 00 00    	je     406e30 <___mbrtowc_cp+0xd0>
  406d97:	83 7d 1c 01          	cmp    DWORD PTR [ebp+0x1c],0x1
  406d9b:	76 73                	jbe    406e10 <___mbrtowc_cp+0xb0>
  406d9d:	80 7d f4 00          	cmp    BYTE PTR [ebp-0xc],0x0
  406da1:	0f 85 9a 00 00 00    	jne    406e41 <___mbrtowc_cp+0xe1>
  406da7:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406dab:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406dae:	89 04 24             	mov    DWORD PTR [esp],eax
  406db1:	e8 aa 14 00 00       	call   408260 <_IsDBCSLeadByteEx@8>
  406db6:	83 ec 08             	sub    esp,0x8
  406db9:	85 c0                	test   eax,eax
  406dbb:	74 53                	je     406e10 <___mbrtowc_cp+0xb0>
  406dbd:	83 7d 10 01          	cmp    DWORD PTR [ebp+0x10],0x1
  406dc1:	0f 86 05 01 00 00    	jbe    406ecc <___mbrtowc_cp+0x16c>
  406dc7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406dca:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  406dd1:	00 
  406dd2:	c7 44 24 0c 02 00 00 	mov    DWORD PTR [esp+0xc],0x2
  406dd9:	00 
  406dda:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  406dde:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406de2:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406de5:	c7 44 24 04 08 00 00 	mov    DWORD PTR [esp+0x4],0x8
  406dec:	00 
  406ded:	89 04 24             	mov    DWORD PTR [esp],eax
  406df0:	e8 73 14 00 00       	call   408268 <_MultiByteToWideChar@24>
  406df5:	83 ec 18             	sub    esp,0x18
  406df8:	85 c0                	test   eax,eax
  406dfa:	0f 84 b7 00 00 00    	je     406eb7 <___mbrtowc_cp+0x157>
  406e00:	8d 65 f8             	lea    esp,[ebp-0x8]
  406e03:	b8 02 00 00 00       	mov    eax,0x2
  406e08:	5b                   	pop    ebx
  406e09:	5e                   	pop    esi
  406e0a:	5d                   	pop    ebp
  406e0b:	c3                   	ret    
  406e0c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406e10:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406e13:	85 c0                	test   eax,eax
  406e15:	75 50                	jne    406e67 <___mbrtowc_cp+0x107>
  406e17:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  406e1a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  406e1d:	66 89 02             	mov    WORD PTR [edx],ax
  406e20:	8d 65 f8             	lea    esp,[ebp-0x8]
  406e23:	b8 01 00 00 00       	mov    eax,0x1
  406e28:	5b                   	pop    ebx
  406e29:	5e                   	pop    esi
  406e2a:	5d                   	pop    ebp
  406e2b:	c3                   	ret    
  406e2c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406e30:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406e33:	31 d2                	xor    edx,edx
  406e35:	66 89 10             	mov    WORD PTR [eax],dx
  406e38:	31 c0                	xor    eax,eax
  406e3a:	8d 65 f8             	lea    esp,[ebp-0x8]
  406e3d:	5b                   	pop    ebx
  406e3e:	5e                   	pop    esi
  406e3f:	5d                   	pop    ebp
  406e40:	c3                   	ret    
  406e41:	88 45 f5             	mov    BYTE PTR [ebp-0xb],al
  406e44:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406e47:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  406e4e:	00 
  406e4f:	c7 44 24 0c 02 00 00 	mov    DWORD PTR [esp+0xc],0x2
  406e56:	00 
  406e57:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406e5b:	8d 45 f4             	lea    eax,[ebp-0xc]
  406e5e:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  406e62:	e9 7b ff ff ff       	jmp    406de2 <___mbrtowc_cp+0x82>
  406e67:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  406e6a:	c7 44 24 14 01 00 00 	mov    DWORD PTR [esp+0x14],0x1
  406e71:	00 
  406e72:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
  406e79:	00 
  406e7a:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  406e7e:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  406e82:	8b 45 18             	mov    eax,DWORD PTR [ebp+0x18]
  406e85:	c7 44 24 04 08 00 00 	mov    DWORD PTR [esp+0x4],0x8
  406e8c:	00 
  406e8d:	89 04 24             	mov    DWORD PTR [esp],eax
  406e90:	e8 d3 13 00 00       	call   408268 <_MultiByteToWideChar@24>
  406e95:	83 ec 18             	sub    esp,0x18
  406e98:	85 c0                	test   eax,eax
  406e9a:	74 1b                	je     406eb7 <___mbrtowc_cp+0x157>
  406e9c:	b8 01 00 00 00       	mov    eax,0x1
  406ea1:	eb 97                	jmp    406e3a <___mbrtowc_cp+0xda>
  406ea3:	8d 65 f8             	lea    esp,[ebp-0x8]
  406ea6:	31 c0                	xor    eax,eax
  406ea8:	5b                   	pop    ebx
  406ea9:	5e                   	pop    esi
  406eaa:	5d                   	pop    ebp
  406eab:	c3                   	ret    
  406eac:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  406eb0:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  406eb5:	eb 83                	jmp    406e3a <___mbrtowc_cp+0xda>
  406eb7:	e8 c4 12 00 00       	call   408180 <__errno>
  406ebc:	c7 00 2a 00 00 00    	mov    DWORD PTR [eax],0x2a
  406ec2:	b8 ff ff ff ff       	mov    eax,0xffffffff
  406ec7:	e9 6e ff ff ff       	jmp    406e3a <___mbrtowc_cp+0xda>
  406ecc:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  406ecf:	88 06                	mov    BYTE PTR [esi],al
  406ed1:	b8 fe ff ff ff       	mov    eax,0xfffffffe
  406ed6:	e9 5f ff ff ff       	jmp    406e3a <___mbrtowc_cp+0xda>
  406edb:	90                   	nop
  406edc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00406ee0 <_mbrtowc>:
  406ee0:	56                   	push   esi
  406ee1:	31 f6                	xor    esi,esi
  406ee3:	53                   	push   ebx
  406ee4:	83 ec 34             	sub    esp,0x34
  406ee7:	8b 5c 24 40          	mov    ebx,DWORD PTR [esp+0x40]
  406eeb:	66 89 74 24 2e       	mov    WORD PTR [esp+0x2e],si
  406ef0:	85 db                	test   ebx,ebx
  406ef2:	74 70                	je     406f64 <_mbrtowc+0x84>
  406ef4:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  406ef9:	8b 30                	mov    esi,DWORD PTR [eax]
  406efb:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406f02:	00 
  406f03:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406f0a:	e8 79 12 00 00       	call   408188 <_setlocale>
  406f0f:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406f16:	00 
  406f17:	89 04 24             	mov    DWORD PTR [esp],eax
  406f1a:	e8 a9 12 00 00       	call   4081c8 <_strchr>
  406f1f:	31 c9                	xor    ecx,ecx
  406f21:	85 c0                	test   eax,eax
  406f23:	74 0d                	je     406f32 <_mbrtowc+0x52>
  406f25:	83 c0 01             	add    eax,0x1
  406f28:	89 04 24             	mov    DWORD PTR [esp],eax
  406f2b:	e8 a0 12 00 00       	call   4081d0 <_atoi>
  406f30:	89 c1                	mov    ecx,eax
  406f32:	8b 54 24 4c          	mov    edx,DWORD PTR [esp+0x4c]
  406f36:	85 d2                	test   edx,edx
  406f38:	74 36                	je     406f70 <_mbrtowc+0x90>
  406f3a:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
  406f3e:	89 74 24 14          	mov    DWORD PTR [esp+0x14],esi
  406f42:	89 1c 24             	mov    DWORD PTR [esp],ebx
  406f45:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  406f49:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  406f4d:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  406f51:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  406f55:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  406f59:	e8 02 fe ff ff       	call   406d60 <___mbrtowc_cp>
  406f5e:	83 c4 34             	add    esp,0x34
  406f61:	5b                   	pop    ebx
  406f62:	5e                   	pop    esi
  406f63:	c3                   	ret    
  406f64:	8d 5c 24 2e          	lea    ebx,[esp+0x2e]
  406f68:	eb 8a                	jmp    406ef4 <_mbrtowc+0x14>
  406f6a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  406f70:	ba 78 d0 40 00       	mov    edx,0x40d078
  406f75:	eb c3                	jmp    406f3a <_mbrtowc+0x5a>
  406f77:	89 f6                	mov    esi,esi
  406f79:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00406f80 <_mbsrtowcs>:
  406f80:	55                   	push   ebp
  406f81:	57                   	push   edi
  406f82:	56                   	push   esi
  406f83:	53                   	push   ebx
  406f84:	83 ec 3c             	sub    esp,0x3c
  406f87:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  406f8b:	8b 5c 24 50          	mov    ebx,DWORD PTR [esp+0x50]
  406f8f:	8b 74 24 54          	mov    esi,DWORD PTR [esp+0x54]
  406f93:	8b 7c 24 58          	mov    edi,DWORD PTR [esp+0x58]
  406f97:	85 c0                	test   eax,eax
  406f99:	0f 84 41 01 00 00    	je     4070e0 <_mbsrtowcs+0x160>
  406f9f:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  406fa6:	00 
  406fa7:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  406fae:	e8 d5 11 00 00       	call   408188 <_setlocale>
  406fb3:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  406fba:	00 
  406fbb:	89 04 24             	mov    DWORD PTR [esp],eax
  406fbe:	e8 05 12 00 00       	call   4081c8 <_strchr>
  406fc3:	c7 44 24 18 00 00 00 	mov    DWORD PTR [esp+0x18],0x0
  406fca:	00 
  406fcb:	85 c0                	test   eax,eax
  406fcd:	74 0f                	je     406fde <_mbsrtowcs+0x5e>
  406fcf:	83 c0 01             	add    eax,0x1
  406fd2:	89 04 24             	mov    DWORD PTR [esp],eax
  406fd5:	e8 f6 11 00 00       	call   4081d0 <_atoi>
  406fda:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  406fde:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  406fe3:	85 f6                	test   esi,esi
  406fe5:	8b 00                	mov    eax,DWORD PTR [eax]
  406fe7:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  406feb:	0f 84 df 00 00 00    	je     4070d0 <_mbsrtowcs+0x150>
  406ff1:	8b 0e                	mov    ecx,DWORD PTR [esi]
  406ff3:	85 c9                	test   ecx,ecx
  406ff5:	0f 84 d5 00 00 00    	je     4070d0 <_mbsrtowcs+0x150>
  406ffb:	85 db                	test   ebx,ebx
  406ffd:	74 71                	je     407070 <_mbsrtowcs+0xf0>
  406fff:	85 ff                	test   edi,edi
  407001:	0f 84 c9 00 00 00    	je     4070d0 <_mbsrtowcs+0x150>
  407007:	89 74 24 54          	mov    DWORD PTR [esp+0x54],esi
  40700b:	31 ed                	xor    ebp,ebp
  40700d:	89 de                	mov    esi,ebx
  40700f:	8b 5c 24 54          	mov    ebx,DWORD PTR [esp+0x54]
  407013:	eb 0f                	jmp    407024 <_mbsrtowcs+0xa4>
  407015:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  407017:	01 c5                	add    ebp,eax
  407019:	83 c6 02             	add    esi,0x2
  40701c:	01 c1                	add    ecx,eax
  40701e:	39 ef                	cmp    edi,ebp
  407020:	89 0b                	mov    DWORD PTR [ebx],ecx
  407022:	76 30                	jbe    407054 <_mbsrtowcs+0xd4>
  407024:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  407028:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  40702c:	89 34 24             	mov    DWORD PTR [esp],esi
  40702f:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  407033:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  407037:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40703b:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  40703f:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  407043:	89 f8                	mov    eax,edi
  407045:	29 e8                	sub    eax,ebp
  407047:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40704b:	e8 10 fd ff ff       	call   406d60 <___mbrtowc_cp>
  407050:	85 c0                	test   eax,eax
  407052:	7f c1                	jg     407015 <_mbsrtowcs+0x95>
  407054:	85 c0                	test   eax,eax
  407056:	75 6e                	jne    4070c6 <_mbsrtowcs+0x146>
  407058:	39 fd                	cmp    ebp,edi
  40705a:	73 6a                	jae    4070c6 <_mbsrtowcs+0x146>
  40705c:	c7 03 00 00 00 00    	mov    DWORD PTR [ebx],0x0
  407062:	83 c4 3c             	add    esp,0x3c
  407065:	89 e8                	mov    eax,ebp
  407067:	5b                   	pop    ebx
  407068:	5e                   	pop    esi
  407069:	5f                   	pop    edi
  40706a:	5d                   	pop    ebp
  40706b:	c3                   	ret    
  40706c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407070:	31 ed                	xor    ebp,ebp
  407072:	66 89 6c 24 2e       	mov    WORD PTR [esp+0x2e],bp
  407077:	31 ed                	xor    ebp,ebp
  407079:	85 ff                	test   edi,edi
  40707b:	74 49                	je     4070c6 <_mbsrtowcs+0x146>
  40707d:	89 7c 24 58          	mov    DWORD PTR [esp+0x58],edi
  407081:	8d 5c 24 2e          	lea    ebx,[esp+0x2e]
  407085:	89 f7                	mov    edi,esi
  407087:	8b 74 24 1c          	mov    esi,DWORD PTR [esp+0x1c]
  40708b:	eb 11                	jmp    40709e <_mbsrtowcs+0x11e>
  40708d:	8d 76 00             	lea    esi,[esi+0x0]
  407090:	8b 0f                	mov    ecx,DWORD PTR [edi]
  407092:	01 c5                	add    ebp,eax
  407094:	01 c1                	add    ecx,eax
  407096:	39 6c 24 58          	cmp    DWORD PTR [esp+0x58],ebp
  40709a:	89 0f                	mov    DWORD PTR [edi],ecx
  40709c:	76 28                	jbe    4070c6 <_mbsrtowcs+0x146>
  40709e:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  4070a2:	89 74 24 14          	mov    DWORD PTR [esp+0x14],esi
  4070a6:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  4070aa:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  4070ae:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4070b2:	8b 44 24 5c          	mov    eax,DWORD PTR [esp+0x5c]
  4070b6:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4070b9:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4070bd:	e8 9e fc ff ff       	call   406d60 <___mbrtowc_cp>
  4070c2:	85 c0                	test   eax,eax
  4070c4:	7f ca                	jg     407090 <_mbsrtowcs+0x110>
  4070c6:	83 c4 3c             	add    esp,0x3c
  4070c9:	89 e8                	mov    eax,ebp
  4070cb:	5b                   	pop    ebx
  4070cc:	5e                   	pop    esi
  4070cd:	5f                   	pop    edi
  4070ce:	5d                   	pop    ebp
  4070cf:	c3                   	ret    
  4070d0:	83 c4 3c             	add    esp,0x3c
  4070d3:	31 c0                	xor    eax,eax
  4070d5:	5b                   	pop    ebx
  4070d6:	5e                   	pop    esi
  4070d7:	5f                   	pop    edi
  4070d8:	5d                   	pop    ebp
  4070d9:	c3                   	ret    
  4070da:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4070e0:	c7 44 24 5c 74 d0 40 	mov    DWORD PTR [esp+0x5c],0x40d074
  4070e7:	00 
  4070e8:	e9 b2 fe ff ff       	jmp    406f9f <_mbsrtowcs+0x1f>
  4070ed:	8d 76 00             	lea    esi,[esi+0x0]

004070f0 <_mbrlen>:
  4070f0:	53                   	push   ebx
  4070f1:	31 c0                	xor    eax,eax
  4070f3:	83 ec 38             	sub    esp,0x38
  4070f6:	66 89 44 24 2e       	mov    WORD PTR [esp+0x2e],ax
  4070fb:	a1 b0 e1 40 00       	mov    eax,ds:0x40e1b0
  407100:	8b 18                	mov    ebx,DWORD PTR [eax]
  407102:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
  407109:	00 
  40710a:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  407111:	e8 72 10 00 00       	call   408188 <_setlocale>
  407116:	c7 44 24 04 2e 00 00 	mov    DWORD PTR [esp+0x4],0x2e
  40711d:	00 
  40711e:	89 04 24             	mov    DWORD PTR [esp],eax
  407121:	e8 a2 10 00 00       	call   4081c8 <_strchr>
  407126:	31 c9                	xor    ecx,ecx
  407128:	85 c0                	test   eax,eax
  40712a:	74 0d                	je     407139 <_mbrlen+0x49>
  40712c:	83 c0 01             	add    eax,0x1
  40712f:	89 04 24             	mov    DWORD PTR [esp],eax
  407132:	e8 99 10 00 00       	call   4081d0 <_atoi>
  407137:	89 c1                	mov    ecx,eax
  407139:	8b 54 24 48          	mov    edx,DWORD PTR [esp+0x48]
  40713d:	85 d2                	test   edx,edx
  40713f:	74 2f                	je     407170 <_mbrlen+0x80>
  407141:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  407145:	89 5c 24 14          	mov    DWORD PTR [esp+0x14],ebx
  407149:	89 4c 24 10          	mov    DWORD PTR [esp+0x10],ecx
  40714d:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  407151:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  407155:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407159:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40715d:	8d 44 24 2e          	lea    eax,[esp+0x2e]
  407161:	89 04 24             	mov    DWORD PTR [esp],eax
  407164:	e8 f7 fb ff ff       	call   406d60 <___mbrtowc_cp>
  407169:	83 c4 38             	add    esp,0x38
  40716c:	5b                   	pop    ebx
  40716d:	c3                   	ret    
  40716e:	66 90                	xchg   ax,ax
  407170:	ba 70 d0 40 00       	mov    edx,0x40d070
  407175:	eb ca                	jmp    407141 <_mbrlen+0x51>
  407177:	90                   	nop
  407178:	90                   	nop
  407179:	90                   	nop
  40717a:	90                   	nop
  40717b:	90                   	nop
  40717c:	90                   	nop
  40717d:	90                   	nop
  40717e:	90                   	nop
  40717f:	90                   	nop

00407180 <___rv_alloc_D2A>:
  407180:	53                   	push   ebx
  407181:	31 db                	xor    ebx,ebx
  407183:	83 ec 18             	sub    esp,0x18
  407186:	8b 4c 24 20          	mov    ecx,DWORD PTR [esp+0x20]
  40718a:	83 f9 13             	cmp    ecx,0x13
  40718d:	76 11                	jbe    4071a0 <___rv_alloc_D2A+0x20>
  40718f:	b8 04 00 00 00       	mov    eax,0x4
  407194:	01 c0                	add    eax,eax
  407196:	83 c3 01             	add    ebx,0x1
  407199:	8d 50 10             	lea    edx,[eax+0x10]
  40719c:	39 ca                	cmp    edx,ecx
  40719e:	76 f4                	jbe    407194 <___rv_alloc_D2A+0x14>
  4071a0:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4071a3:	e8 a8 03 00 00       	call   407550 <___Balloc_D2A>
  4071a8:	89 18                	mov    DWORD PTR [eax],ebx
  4071aa:	83 c4 18             	add    esp,0x18
  4071ad:	83 c0 04             	add    eax,0x4
  4071b0:	5b                   	pop    ebx
  4071b1:	c3                   	ret    
  4071b2:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4071b9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004071c0 <___nrv_alloc_D2A>:
  4071c0:	56                   	push   esi
  4071c1:	53                   	push   ebx
  4071c2:	83 ec 14             	sub    esp,0x14
  4071c5:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  4071c9:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
  4071cd:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  4071d1:	89 04 24             	mov    DWORD PTR [esp],eax
  4071d4:	e8 a7 ff ff ff       	call   407180 <___rv_alloc_D2A>
  4071d9:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
  4071dc:	8d 4b 01             	lea    ecx,[ebx+0x1]
  4071df:	84 d2                	test   dl,dl
  4071e1:	88 10                	mov    BYTE PTR [eax],dl
  4071e3:	89 c2                	mov    edx,eax
  4071e5:	74 10                	je     4071f7 <___nrv_alloc_D2A+0x37>
  4071e7:	83 c1 01             	add    ecx,0x1
  4071ea:	0f b6 59 ff          	movzx  ebx,BYTE PTR [ecx-0x1]
  4071ee:	83 c2 01             	add    edx,0x1
  4071f1:	84 db                	test   bl,bl
  4071f3:	88 1a                	mov    BYTE PTR [edx],bl
  4071f5:	75 f0                	jne    4071e7 <___nrv_alloc_D2A+0x27>
  4071f7:	85 f6                	test   esi,esi
  4071f9:	74 02                	je     4071fd <___nrv_alloc_D2A+0x3d>
  4071fb:	89 16                	mov    DWORD PTR [esi],edx
  4071fd:	83 c4 14             	add    esp,0x14
  407200:	5b                   	pop    ebx
  407201:	5e                   	pop    esi
  407202:	c3                   	ret    
  407203:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  407209:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00407210 <___freedtoa>:
  407210:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  407214:	ba 01 00 00 00       	mov    edx,0x1
  407219:	8b 48 fc             	mov    ecx,DWORD PTR [eax-0x4]
  40721c:	83 e8 04             	sub    eax,0x4
  40721f:	d3 e2                	shl    edx,cl
  407221:	89 48 04             	mov    DWORD PTR [eax+0x4],ecx
  407224:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
  407227:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40722b:	e9 f0 03 00 00       	jmp    407620 <___Bfree_D2A>

00407230 <___quorem_D2A>:
  407230:	55                   	push   ebp
  407231:	57                   	push   edi
  407232:	56                   	push   esi
  407233:	53                   	push   ebx
  407234:	83 ec 4c             	sub    esp,0x4c
  407237:	8b 44 24 64          	mov    eax,DWORD PTR [esp+0x64]
  40723b:	8b 7c 24 60          	mov    edi,DWORD PTR [esp+0x60]
  40723f:	8b 50 10             	mov    edx,DWORD PTR [eax+0x10]
  407242:	31 c0                	xor    eax,eax
  407244:	3b 57 10             	cmp    edx,DWORD PTR [edi+0x10]
  407247:	0f 8f d6 01 00 00    	jg     407423 <___quorem_D2A+0x1f3>
  40724d:	8b 44 24 64          	mov    eax,DWORD PTR [esp+0x64]
  407251:	8b 74 24 60          	mov    esi,DWORD PTR [esp+0x60]
  407255:	83 c0 14             	add    eax,0x14
  407258:	89 c7                	mov    edi,eax
  40725a:	89 44 24 38          	mov    DWORD PTR [esp+0x38],eax
  40725e:	8d 42 ff             	lea    eax,[edx-0x1]
  407261:	31 d2                	xor    edx,edx
  407263:	89 44 24 30          	mov    DWORD PTR [esp+0x30],eax
  407267:	c1 e0 02             	shl    eax,0x2
  40726a:	01 c7                	add    edi,eax
  40726c:	8d 5e 14             	lea    ebx,[esi+0x14]
  40726f:	01 d8                	add    eax,ebx
  407271:	89 7c 24 28          	mov    DWORD PTR [esp+0x28],edi
  407275:	8b 3f                	mov    edi,DWORD PTR [edi]
  407277:	89 44 24 3c          	mov    DWORD PTR [esp+0x3c],eax
  40727b:	8b 00                	mov    eax,DWORD PTR [eax]
  40727d:	89 5c 24 2c          	mov    DWORD PTR [esp+0x2c],ebx
  407281:	8d 4f 01             	lea    ecx,[edi+0x1]
  407284:	f7 f1                	div    ecx
  407286:	89 7c 24 10          	mov    DWORD PTR [esp+0x10],edi
  40728a:	85 c0                	test   eax,eax
  40728c:	89 c5                	mov    ebp,eax
  40728e:	89 44 24 34          	mov    DWORD PTR [esp+0x34],eax
  407292:	0f 84 c7 00 00 00    	je     40735f <___quorem_D2A+0x12f>
  407298:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
  40729c:	89 de                	mov    esi,ebx
  40729e:	c7 44 24 20 00 00 00 	mov    DWORD PTR [esp+0x20],0x0
  4072a5:	00 
  4072a6:	c7 44 24 24 00 00 00 	mov    DWORD PTR [esp+0x24],0x0
  4072ad:	00 
  4072ae:	c7 44 24 10 00 00 00 	mov    DWORD PTR [esp+0x10],0x0
  4072b5:	00 
  4072b6:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  4072bd:	00 
  4072be:	66 90                	xchg   ax,ax
  4072c0:	83 c7 04             	add    edi,0x4
  4072c3:	89 e8                	mov    eax,ebp
  4072c5:	f7 67 fc             	mul    DWORD PTR [edi-0x4]
  4072c8:	03 44 24 20          	add    eax,DWORD PTR [esp+0x20]
  4072cc:	13 54 24 24          	adc    edx,DWORD PTR [esp+0x24]
  4072d0:	c7 44 24 1c 00 00 00 	mov    DWORD PTR [esp+0x1c],0x0
  4072d7:	00 
  4072d8:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  4072dc:	89 d3                	mov    ebx,edx
  4072de:	89 d9                	mov    ecx,ebx
  4072e0:	31 db                	xor    ebx,ebx
  4072e2:	89 4c 24 20          	mov    DWORD PTR [esp+0x20],ecx
  4072e6:	8b 0e                	mov    ecx,DWORD PTR [esi]
  4072e8:	89 5c 24 24          	mov    DWORD PTR [esp+0x24],ebx
  4072ec:	31 db                	xor    ebx,ebx
  4072ee:	2b 4c 24 18          	sub    ecx,DWORD PTR [esp+0x18]
  4072f2:	1b 5c 24 1c          	sbb    ebx,DWORD PTR [esp+0x1c]
  4072f6:	2b 4c 24 10          	sub    ecx,DWORD PTR [esp+0x10]
  4072fa:	1b 5c 24 14          	sbb    ebx,DWORD PTR [esp+0x14]
  4072fe:	83 c6 04             	add    esi,0x4
  407301:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  407308:	00 
  407309:	89 d8                	mov    eax,ebx
  40730b:	83 e0 01             	and    eax,0x1
  40730e:	39 7c 24 28          	cmp    DWORD PTR [esp+0x28],edi
  407312:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  407316:	89 4e fc             	mov    DWORD PTR [esi-0x4],ecx
  407319:	73 a5                	jae    4072c0 <___quorem_D2A+0x90>
  40731b:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  40731f:	8b 38                	mov    edi,DWORD PTR [eax]
  407321:	85 ff                	test   edi,edi
  407323:	75 3a                	jne    40735f <___quorem_D2A+0x12f>
  407325:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  407329:	89 c6                	mov    esi,eax
  40732b:	83 e8 04             	sub    eax,0x4
  40732e:	39 c1                	cmp    ecx,eax
  407330:	73 22                	jae    407354 <___quorem_D2A+0x124>
  407332:	8b 76 fc             	mov    esi,DWORD PTR [esi-0x4]
  407335:	85 f6                	test   esi,esi
  407337:	75 1b                	jne    407354 <___quorem_D2A+0x124>
  407339:	8b 54 24 30          	mov    edx,DWORD PTR [esp+0x30]
  40733d:	eb 07                	jmp    407346 <___quorem_D2A+0x116>
  40733f:	90                   	nop
  407340:	8b 18                	mov    ebx,DWORD PTR [eax]
  407342:	85 db                	test   ebx,ebx
  407344:	75 0a                	jne    407350 <___quorem_D2A+0x120>
  407346:	83 e8 04             	sub    eax,0x4
  407349:	83 ea 01             	sub    edx,0x1
  40734c:	39 c1                	cmp    ecx,eax
  40734e:	72 f0                	jb     407340 <___quorem_D2A+0x110>
  407350:	89 54 24 30          	mov    DWORD PTR [esp+0x30],edx
  407354:	8b 44 24 60          	mov    eax,DWORD PTR [esp+0x60]
  407358:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  40735c:	89 78 10             	mov    DWORD PTR [eax+0x10],edi
  40735f:	8b 44 24 64          	mov    eax,DWORD PTR [esp+0x64]
  407363:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  407367:	8b 44 24 60          	mov    eax,DWORD PTR [esp+0x60]
  40736b:	89 04 24             	mov    DWORD PTR [esp],eax
  40736e:	e8 2d 08 00 00       	call   407ba0 <___cmp_D2A>
  407373:	85 c0                	test   eax,eax
  407375:	0f 88 a4 00 00 00    	js     40741f <___quorem_D2A+0x1ef>
  40737b:	31 f6                	xor    esi,esi
  40737d:	31 ff                	xor    edi,edi
  40737f:	8d 45 01             	lea    eax,[ebp+0x1]
  407382:	8b 6c 24 2c          	mov    ebp,DWORD PTR [esp+0x2c]
  407386:	89 74 24 10          	mov    DWORD PTR [esp+0x10],esi
  40738a:	8b 74 24 38          	mov    esi,DWORD PTR [esp+0x38]
  40738e:	89 7c 24 14          	mov    DWORD PTR [esp+0x14],edi
  407392:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
  407396:	89 44 24 34          	mov    DWORD PTR [esp+0x34],eax
  40739a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4073a0:	83 c6 04             	add    esi,0x4
  4073a3:	8b 45 00             	mov    eax,DWORD PTR [ebp+0x0]
  4073a6:	31 db                	xor    ebx,ebx
  4073a8:	8b 4e fc             	mov    ecx,DWORD PTR [esi-0x4]
  4073ab:	31 d2                	xor    edx,edx
  4073ad:	29 c8                	sub    eax,ecx
  4073af:	19 da                	sbb    edx,ebx
  4073b1:	2b 44 24 10          	sub    eax,DWORD PTR [esp+0x10]
  4073b5:	1b 54 24 14          	sbb    edx,DWORD PTR [esp+0x14]
  4073b9:	83 c5 04             	add    ebp,0x4
  4073bc:	c7 44 24 14 00 00 00 	mov    DWORD PTR [esp+0x14],0x0
  4073c3:	00 
  4073c4:	89 d3                	mov    ebx,edx
  4073c6:	83 e3 01             	and    ebx,0x1
  4073c9:	39 f7                	cmp    edi,esi
  4073cb:	89 5c 24 10          	mov    DWORD PTR [esp+0x10],ebx
  4073cf:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  4073d2:	73 cc                	jae    4073a0 <___quorem_D2A+0x170>
  4073d4:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  4073d8:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
  4073dc:	8d 14 98             	lea    edx,[eax+ebx*4]
  4073df:	8b 3a                	mov    edi,DWORD PTR [edx]
  4073e1:	85 ff                	test   edi,edi
  4073e3:	75 3a                	jne    40741f <___quorem_D2A+0x1ef>
  4073e5:	8b 4c 24 2c          	mov    ecx,DWORD PTR [esp+0x2c]
  4073e9:	8d 42 fc             	lea    eax,[edx-0x4]
  4073ec:	39 c1                	cmp    ecx,eax
  4073ee:	73 24                	jae    407414 <___quorem_D2A+0x1e4>
  4073f0:	8b 72 fc             	mov    esi,DWORD PTR [edx-0x4]
  4073f3:	85 f6                	test   esi,esi
  4073f5:	75 1d                	jne    407414 <___quorem_D2A+0x1e4>
  4073f7:	89 da                	mov    edx,ebx
  4073f9:	eb 0b                	jmp    407406 <___quorem_D2A+0x1d6>
  4073fb:	90                   	nop
  4073fc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407400:	8b 18                	mov    ebx,DWORD PTR [eax]
  407402:	85 db                	test   ebx,ebx
  407404:	75 0a                	jne    407410 <___quorem_D2A+0x1e0>
  407406:	83 e8 04             	sub    eax,0x4
  407409:	83 ea 01             	sub    edx,0x1
  40740c:	39 c1                	cmp    ecx,eax
  40740e:	72 f0                	jb     407400 <___quorem_D2A+0x1d0>
  407410:	89 54 24 30          	mov    DWORD PTR [esp+0x30],edx
  407414:	8b 44 24 60          	mov    eax,DWORD PTR [esp+0x60]
  407418:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
  40741c:	89 78 10             	mov    DWORD PTR [eax+0x10],edi
  40741f:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
  407423:	83 c4 4c             	add    esp,0x4c
  407426:	5b                   	pop    ebx
  407427:	5e                   	pop    esi
  407428:	5f                   	pop    edi
  407429:	5d                   	pop    ebp
  40742a:	c3                   	ret    
  40742b:	90                   	nop
  40742c:	90                   	nop
  40742d:	90                   	nop
  40742e:	90                   	nop
  40742f:	90                   	nop

00407430 <_dtoa_lock>:
  407430:	55                   	push   ebp
  407431:	89 e5                	mov    ebp,esp
  407433:	53                   	push   ebx
  407434:	89 c3                	mov    ebx,eax
  407436:	83 ec 14             	sub    esp,0x14
  407439:	8b 15 c8 d9 40 00    	mov    edx,DWORD PTR ds:0x40d9c8
  40743f:	83 fa 02             	cmp    edx,0x2
  407442:	74 7f                	je     4074c3 <_dtoa_lock+0x93>
  407444:	85 d2                	test   edx,edx
  407446:	75 1d                	jne    407465 <_dtoa_lock+0x35>
  407448:	eb 2a                	jmp    407474 <_dtoa_lock+0x44>
  40744a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  407450:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  407457:	e8 14 0e 00 00       	call   408270 <_Sleep@4>
  40745c:	83 ec 04             	sub    esp,0x4
  40745f:	8b 15 c8 d9 40 00    	mov    edx,DWORD PTR ds:0x40d9c8
  407465:	83 fa 01             	cmp    edx,0x1
  407468:	74 e6                	je     407450 <_dtoa_lock+0x20>
  40746a:	83 fa 02             	cmp    edx,0x2
  40746d:	74 54                	je     4074c3 <_dtoa_lock+0x93>
  40746f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  407472:	c9                   	leave  
  407473:	c3                   	ret    
  407474:	c7 44 24 04 01 00 00 	mov    DWORD PTR [esp+0x4],0x1
  40747b:	00 
  40747c:	c7 04 24 c8 d9 40 00 	mov    DWORD PTR [esp],0x40d9c8
  407483:	e8 f0 0d 00 00       	call   408278 <_InterlockedExchange@8>
  407488:	83 ec 08             	sub    esp,0x8
  40748b:	85 c0                	test   eax,eax
  40748d:	75 51                	jne    4074e0 <_dtoa_lock+0xb0>
  40748f:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  407496:	e8 9d 0d 00 00       	call   408238 <_InitializeCriticalSection@4>
  40749b:	83 ec 04             	sub    esp,0x4
  40749e:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  4074a5:	e8 8e 0d 00 00       	call   408238 <_InitializeCriticalSection@4>
  4074aa:	83 ec 04             	sub    esp,0x4
  4074ad:	c7 04 24 00 75 40 00 	mov    DWORD PTR [esp],0x407500
  4074b4:	e8 27 9e ff ff       	call   4012e0 <_atexit>
  4074b9:	c7 05 c8 d9 40 00 02 	mov    DWORD PTR ds:0x40d9c8,0x2
  4074c0:	00 00 00 
  4074c3:	8d 04 5b             	lea    eax,[ebx+ebx*2]
  4074c6:	8d 04 c5 e0 d9 40 00 	lea    eax,[eax*8+0x40d9e0]
  4074cd:	89 04 24             	mov    DWORD PTR [esp],eax
  4074d0:	e8 3b 0d 00 00       	call   408210 <_EnterCriticalSection@4>
  4074d5:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  4074d8:	83 ec 04             	sub    esp,0x4
  4074db:	c9                   	leave  
  4074dc:	c3                   	ret    
  4074dd:	8d 76 00             	lea    esi,[esi+0x0]
  4074e0:	83 f8 02             	cmp    eax,0x2
  4074e3:	0f 85 76 ff ff ff    	jne    40745f <_dtoa_lock+0x2f>
  4074e9:	c7 05 c8 d9 40 00 02 	mov    DWORD PTR ds:0x40d9c8,0x2
  4074f0:	00 00 00 
  4074f3:	eb ce                	jmp    4074c3 <_dtoa_lock+0x93>
  4074f5:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4074f9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

00407500 <_dtoa_lock_cleanup>:
  407500:	55                   	push   ebp
  407501:	89 e5                	mov    ebp,esp
  407503:	83 ec 18             	sub    esp,0x18
  407506:	c7 44 24 04 03 00 00 	mov    DWORD PTR [esp+0x4],0x3
  40750d:	00 
  40750e:	c7 04 24 c8 d9 40 00 	mov    DWORD PTR [esp],0x40d9c8
  407515:	e8 5e 0d 00 00       	call   408278 <_InterlockedExchange@8>
  40751a:	83 ec 08             	sub    esp,0x8
  40751d:	83 f8 02             	cmp    eax,0x2
  407520:	74 02                	je     407524 <_dtoa_lock_cleanup+0x24>
  407522:	c9                   	leave  
  407523:	c3                   	ret    
  407524:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  40752b:	e8 00 0d 00 00       	call   408230 <_DeleteCriticalSection@4>
  407530:	83 ec 04             	sub    esp,0x4
  407533:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  40753a:	e8 f1 0c 00 00       	call   408230 <_DeleteCriticalSection@4>
  40753f:	83 ec 04             	sub    esp,0x4
  407542:	c9                   	leave  
  407543:	c3                   	ret    
  407544:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  40754a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00407550 <___Balloc_D2A>:
  407550:	55                   	push   ebp
  407551:	31 c0                	xor    eax,eax
  407553:	89 e5                	mov    ebp,esp
  407555:	57                   	push   edi
  407556:	56                   	push   esi
  407557:	53                   	push   ebx
  407558:	83 ec 1c             	sub    esp,0x1c
  40755b:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  40755e:	e8 cd fe ff ff       	call   407430 <_dtoa_lock>
  407563:	83 fe 09             	cmp    esi,0x9
  407566:	7f 2e                	jg     407596 <___Balloc_D2A+0x46>
  407568:	8b 1c b5 a0 d9 40 00 	mov    ebx,DWORD PTR [esi*4+0x40d9a0]
  40756f:	85 db                	test   ebx,ebx
  407571:	74 6e                	je     4075e1 <___Balloc_D2A+0x91>
  407573:	8b 03                	mov    eax,DWORD PTR [ebx]
  407575:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  40757c:	89 04 b5 a0 d9 40 00 	mov    DWORD PTR [esi*4+0x40d9a0],eax
  407583:	75 44                	jne    4075c9 <___Balloc_D2A+0x79>
  407585:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  40758c:	e8 97 0c 00 00       	call   408228 <_LeaveCriticalSection@4>
  407591:	83 ec 04             	sub    esp,0x4
  407594:	eb 33                	jmp    4075c9 <___Balloc_D2A+0x79>
  407596:	bf 01 00 00 00       	mov    edi,0x1
  40759b:	89 f1                	mov    ecx,esi
  40759d:	d3 e7                	shl    edi,cl
  40759f:	8d 04 bd 1b 00 00 00 	lea    eax,[edi*4+0x1b]
  4075a6:	c1 e8 03             	shr    eax,0x3
  4075a9:	c1 e0 03             	shl    eax,0x3
  4075ac:	89 04 24             	mov    DWORD PTR [esp],eax
  4075af:	e8 ac 0b 00 00       	call   408160 <_malloc>
  4075b4:	85 c0                	test   eax,eax
  4075b6:	89 c3                	mov    ebx,eax
  4075b8:	74 5f                	je     407619 <___Balloc_D2A+0xc9>
  4075ba:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  4075c1:	89 73 04             	mov    DWORD PTR [ebx+0x4],esi
  4075c4:	89 7b 08             	mov    DWORD PTR [ebx+0x8],edi
  4075c7:	74 bc                	je     407585 <___Balloc_D2A+0x35>
  4075c9:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
  4075d0:	89 d8                	mov    eax,ebx
  4075d2:	c7 43 0c 00 00 00 00 	mov    DWORD PTR [ebx+0xc],0x0
  4075d9:	8d 65 f4             	lea    esp,[ebp-0xc]
  4075dc:	5b                   	pop    ebx
  4075dd:	5e                   	pop    esi
  4075de:	5f                   	pop    edi
  4075df:	5d                   	pop    ebp
  4075e0:	c3                   	ret    
  4075e1:	8b 1d 20 90 40 00    	mov    ebx,DWORD PTR ds:0x409020
  4075e7:	bf 01 00 00 00       	mov    edi,0x1
  4075ec:	89 f1                	mov    ecx,esi
  4075ee:	d3 e7                	shl    edi,cl
  4075f0:	8d 04 bd 1b 00 00 00 	lea    eax,[edi*4+0x1b]
  4075f7:	c1 e8 03             	shr    eax,0x3
  4075fa:	89 da                	mov    edx,ebx
  4075fc:	81 ea a0 d0 40 00    	sub    edx,0x40d0a0
  407602:	c1 fa 03             	sar    edx,0x3
  407605:	01 c2                	add    edx,eax
  407607:	81 fa 20 01 00 00    	cmp    edx,0x120
  40760d:	77 9a                	ja     4075a9 <___Balloc_D2A+0x59>
  40760f:	8d 04 c3             	lea    eax,[ebx+eax*8]
  407612:	a3 20 90 40 00       	mov    ds:0x409020,eax
  407617:	eb a1                	jmp    4075ba <___Balloc_D2A+0x6a>
  407619:	31 c0                	xor    eax,eax
  40761b:	eb bc                	jmp    4075d9 <___Balloc_D2A+0x89>
  40761d:	8d 76 00             	lea    esi,[esi+0x0]

00407620 <___Bfree_D2A>:
  407620:	55                   	push   ebp
  407621:	89 e5                	mov    ebp,esp
  407623:	53                   	push   ebx
  407624:	83 ec 14             	sub    esp,0x14
  407627:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  40762a:	85 db                	test   ebx,ebx
  40762c:	74 29                	je     407657 <___Bfree_D2A+0x37>
  40762e:	83 7b 04 09          	cmp    DWORD PTR [ebx+0x4],0x9
  407632:	7f 2c                	jg     407660 <___Bfree_D2A+0x40>
  407634:	31 c0                	xor    eax,eax
  407636:	e8 f5 fd ff ff       	call   407430 <_dtoa_lock>
  40763b:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
  40763e:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  407645:	8b 14 85 a0 d9 40 00 	mov    edx,DWORD PTR [eax*4+0x40d9a0]
  40764c:	89 1c 85 a0 d9 40 00 	mov    DWORD PTR [eax*4+0x40d9a0],ebx
  407653:	89 13                	mov    DWORD PTR [ebx],edx
  407655:	74 19                	je     407670 <___Bfree_D2A+0x50>
  407657:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  40765a:	c9                   	leave  
  40765b:	c3                   	ret    
  40765c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407660:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  407663:	c9                   	leave  
  407664:	e9 ef 0a 00 00       	jmp    408158 <_free>
  407669:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  407670:	c7 04 24 e0 d9 40 00 	mov    DWORD PTR [esp],0x40d9e0
  407677:	e8 ac 0b 00 00       	call   408228 <_LeaveCriticalSection@4>
  40767c:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  40767f:	83 ec 04             	sub    esp,0x4
  407682:	c9                   	leave  
  407683:	c3                   	ret    
  407684:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  40768a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00407690 <___multadd_D2A>:
  407690:	55                   	push   ebp
  407691:	31 c9                	xor    ecx,ecx
  407693:	57                   	push   edi
  407694:	56                   	push   esi
  407695:	53                   	push   ebx
  407696:	83 ec 2c             	sub    esp,0x2c
  407699:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  40769d:	8b 7c 24 48          	mov    edi,DWORD PTR [esp+0x48]
  4076a1:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  4076a4:	89 fd                	mov    ebp,edi
  4076a6:	c1 fd 1f             	sar    ebp,0x1f
  4076a9:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  4076ad:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  4076b1:	8d 58 14             	lea    ebx,[eax+0x14]
  4076b4:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
  4076b8:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  4076bc:	c1 f8 1f             	sar    eax,0x1f
  4076bf:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  4076c3:	8b 04 8b             	mov    eax,DWORD PTR [ebx+ecx*4]
  4076c6:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
  4076ca:	0f af f0             	imul   esi,eax
  4076cd:	f7 64 24 10          	mul    DWORD PTR [esp+0x10]
  4076d1:	01 f2                	add    edx,esi
  4076d3:	01 f8                	add    eax,edi
  4076d5:	11 ea                	adc    edx,ebp
  4076d7:	89 d5                	mov    ebp,edx
  4076d9:	89 ef                	mov    edi,ebp
  4076db:	31 ed                	xor    ebp,ebp
  4076dd:	89 04 8b             	mov    DWORD PTR [ebx+ecx*4],eax
  4076e0:	83 c1 01             	add    ecx,0x1
  4076e3:	39 4c 24 1c          	cmp    DWORD PTR [esp+0x1c],ecx
  4076e7:	7f da                	jg     4076c3 <___multadd_D2A+0x33>
  4076e9:	89 ea                	mov    edx,ebp
  4076eb:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  4076ef:	09 fa                	or     edx,edi
  4076f1:	74 1d                	je     407710 <___multadd_D2A+0x80>
  4076f3:	8b 54 24 1c          	mov    edx,DWORD PTR [esp+0x1c]
  4076f7:	3b 50 08             	cmp    edx,DWORD PTR [eax+0x8]
  4076fa:	7d 1c                	jge    407718 <___multadd_D2A+0x88>
  4076fc:	8b 54 24 40          	mov    edx,DWORD PTR [esp+0x40]
  407700:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  407704:	89 7c 82 14          	mov    DWORD PTR [edx+eax*4+0x14],edi
  407708:	83 c0 01             	add    eax,0x1
  40770b:	89 42 10             	mov    DWORD PTR [edx+0x10],eax
  40770e:	89 d0                	mov    eax,edx
  407710:	83 c4 2c             	add    esp,0x2c
  407713:	5b                   	pop    ebx
  407714:	5e                   	pop    esi
  407715:	5f                   	pop    edi
  407716:	5d                   	pop    ebp
  407717:	c3                   	ret    
  407718:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40771b:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40771f:	83 c0 01             	add    eax,0x1
  407722:	89 04 24             	mov    DWORD PTR [esp],eax
  407725:	e8 26 fe ff ff       	call   407550 <___Balloc_D2A>
  40772a:	85 c0                	test   eax,eax
  40772c:	89 c3                	mov    ebx,eax
  40772e:	74 3a                	je     40776a <___multadd_D2A+0xda>
  407730:	8d 48 0c             	lea    ecx,[eax+0xc]
  407733:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407737:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  40773a:	89 0c 24             	mov    DWORD PTR [esp],ecx
  40773d:	8d 14 85 08 00 00 00 	lea    edx,[eax*4+0x8]
  407744:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407748:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  40774c:	83 c0 0c             	add    eax,0xc
  40774f:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  407753:	e8 f0 09 00 00       	call   408148 <_memcpy>
  407758:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  40775c:	89 04 24             	mov    DWORD PTR [esp],eax
  40775f:	e8 bc fe ff ff       	call   407620 <___Bfree_D2A>
  407764:	89 5c 24 40          	mov    DWORD PTR [esp+0x40],ebx
  407768:	eb 92                	jmp    4076fc <___multadd_D2A+0x6c>
  40776a:	31 c0                	xor    eax,eax
  40776c:	eb a2                	jmp    407710 <___multadd_D2A+0x80>
  40776e:	66 90                	xchg   ax,ax

00407770 <___i2b_D2A>:
  407770:	83 ec 1c             	sub    esp,0x1c
  407773:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  40777a:	e8 d1 fd ff ff       	call   407550 <___Balloc_D2A>
  40777f:	85 c0                	test   eax,eax
  407781:	74 0e                	je     407791 <___i2b_D2A+0x21>
  407783:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  407787:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  40778e:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
  407791:	83 c4 1c             	add    esp,0x1c
  407794:	c3                   	ret    
  407795:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407799:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004077a0 <___mult_D2A>:
  4077a0:	55                   	push   ebp
  4077a1:	57                   	push   edi
  4077a2:	56                   	push   esi
  4077a3:	53                   	push   ebx
  4077a4:	83 ec 3c             	sub    esp,0x3c
  4077a7:	8b 7c 24 50          	mov    edi,DWORD PTR [esp+0x50]
  4077ab:	8b 6c 24 54          	mov    ebp,DWORD PTR [esp+0x54]
  4077af:	8b 77 10             	mov    esi,DWORD PTR [edi+0x10]
  4077b2:	8b 5d 10             	mov    ebx,DWORD PTR [ebp+0x10]
  4077b5:	39 de                	cmp    esi,ebx
  4077b7:	7d 0c                	jge    4077c5 <___mult_D2A+0x25>
  4077b9:	89 f0                	mov    eax,esi
  4077bb:	89 de                	mov    esi,ebx
  4077bd:	89 c3                	mov    ebx,eax
  4077bf:	89 f8                	mov    eax,edi
  4077c1:	89 ef                	mov    edi,ebp
  4077c3:	89 c5                	mov    ebp,eax
  4077c5:	8d 04 1e             	lea    eax,[esi+ebx*1]
  4077c8:	3b 47 08             	cmp    eax,DWORD PTR [edi+0x8]
  4077cb:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
  4077cf:	0f 9f c0             	setg   al
  4077d2:	0f b6 c0             	movzx  eax,al
  4077d5:	03 47 04             	add    eax,DWORD PTR [edi+0x4]
  4077d8:	89 04 24             	mov    DWORD PTR [esp],eax
  4077db:	e8 70 fd ff ff       	call   407550 <___Balloc_D2A>
  4077e0:	85 c0                	test   eax,eax
  4077e2:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
  4077e6:	0f 84 08 01 00 00    	je     4078f4 <___mult_D2A+0x154>
  4077ec:	8b 4c 24 20          	mov    ecx,DWORD PTR [esp+0x20]
  4077f0:	8d 40 14             	lea    eax,[eax+0x14]
  4077f3:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  4077f7:	8d 0c 88             	lea    ecx,[eax+ecx*4]
  4077fa:	89 ca                	mov    edx,ecx
  4077fc:	39 d0                	cmp    eax,edx
  4077fe:	89 4c 24 28          	mov    DWORD PTR [esp+0x28],ecx
  407802:	73 11                	jae    407815 <___mult_D2A+0x75>
  407804:	8b 54 24 28          	mov    edx,DWORD PTR [esp+0x28]
  407808:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  40780e:	83 c0 04             	add    eax,0x4
  407811:	39 c2                	cmp    edx,eax
  407813:	77 f3                	ja     407808 <___mult_D2A+0x68>
  407815:	8d 47 14             	lea    eax,[edi+0x14]
  407818:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
  40781c:	8d 04 b0             	lea    eax,[eax+esi*4]
  40781f:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  407823:	8d 45 14             	lea    eax,[ebp+0x14]
  407826:	8d 1c 98             	lea    ebx,[eax+ebx*4]
  407829:	39 d8                	cmp    eax,ebx
  40782b:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  40782f:	89 5c 24 1c          	mov    DWORD PTR [esp+0x1c],ebx
  407833:	73 74                	jae    4078a9 <___mult_D2A+0x109>
  407835:	83 44 24 14 04       	add    DWORD PTR [esp+0x14],0x4
  40783a:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
  40783e:	8b 68 fc             	mov    ebp,DWORD PTR [eax-0x4]
  407841:	85 ed                	test   ebp,ebp
  407843:	74 55                	je     40789a <___mult_D2A+0xfa>
  407845:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
  407849:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  40784d:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  407854:	00 
  407855:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  40785c:	00 
  40785d:	eb 03                	jmp    407862 <___mult_D2A+0xc2>
  40785f:	90                   	nop
  407860:	89 c7                	mov    edi,eax
  407862:	83 c6 04             	add    esi,0x4
  407865:	8b 0f                	mov    ecx,DWORD PTR [edi]
  407867:	89 e8                	mov    eax,ebp
  407869:	f7 66 fc             	mul    DWORD PTR [esi-0x4]
  40786c:	31 db                	xor    ebx,ebx
  40786e:	01 c1                	add    ecx,eax
  407870:	11 d3                	adc    ebx,edx
  407872:	03 4c 24 08          	add    ecx,DWORD PTR [esp+0x8]
  407876:	13 5c 24 0c          	adc    ebx,DWORD PTR [esp+0xc]
  40787a:	89 0f                	mov    DWORD PTR [edi],ecx
  40787c:	89 da                	mov    edx,ebx
  40787e:	89 d0                	mov    eax,edx
  407880:	31 d2                	xor    edx,edx
  407882:	39 74 24 10          	cmp    DWORD PTR [esp+0x10],esi
  407886:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40788a:	8d 47 04             	lea    eax,[edi+0x4]
  40788d:	89 54 24 0c          	mov    DWORD PTR [esp+0xc],edx
  407891:	77 cd                	ja     407860 <___mult_D2A+0xc0>
  407893:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  407897:	89 47 04             	mov    DWORD PTR [edi+0x4],eax
  40789a:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
  40789e:	83 44 24 18 04       	add    DWORD PTR [esp+0x18],0x4
  4078a3:	39 44 24 1c          	cmp    DWORD PTR [esp+0x1c],eax
  4078a7:	77 8c                	ja     407835 <___mult_D2A+0x95>
  4078a9:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
  4078ad:	85 ff                	test   edi,edi
  4078af:	7e 30                	jle    4078e1 <___mult_D2A+0x141>
  4078b1:	8b 5c 24 28          	mov    ebx,DWORD PTR [esp+0x28]
  4078b5:	8b 73 fc             	mov    esi,DWORD PTR [ebx-0x4]
  4078b8:	85 f6                	test   esi,esi
  4078ba:	75 25                	jne    4078e1 <___mult_D2A+0x141>
  4078bc:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
  4078c0:	89 d0                	mov    eax,edx
  4078c2:	c1 e0 02             	shl    eax,0x2
  4078c5:	29 c3                	sub    ebx,eax
  4078c7:	89 d8                	mov    eax,ebx
  4078c9:	eb 0d                	jmp    4078d8 <___mult_D2A+0x138>
  4078cb:	90                   	nop
  4078cc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4078d0:	8b 4c 90 fc          	mov    ecx,DWORD PTR [eax+edx*4-0x4]
  4078d4:	85 c9                	test   ecx,ecx
  4078d6:	75 05                	jne    4078dd <___mult_D2A+0x13d>
  4078d8:	83 ea 01             	sub    edx,0x1
  4078db:	75 f3                	jne    4078d0 <___mult_D2A+0x130>
  4078dd:	89 54 24 20          	mov    DWORD PTR [esp+0x20],edx
  4078e1:	8b 44 24 2c          	mov    eax,DWORD PTR [esp+0x2c]
  4078e5:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
  4078e9:	89 58 10             	mov    DWORD PTR [eax+0x10],ebx
  4078ec:	83 c4 3c             	add    esp,0x3c
  4078ef:	5b                   	pop    ebx
  4078f0:	5e                   	pop    esi
  4078f1:	5f                   	pop    edi
  4078f2:	5d                   	pop    ebp
  4078f3:	c3                   	ret    
  4078f4:	31 c0                	xor    eax,eax
  4078f6:	eb f4                	jmp    4078ec <___mult_D2A+0x14c>
  4078f8:	90                   	nop
  4078f9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00407900 <___pow5mult_D2A>:
  407900:	55                   	push   ebp
  407901:	89 e5                	mov    ebp,esp
  407903:	57                   	push   edi
  407904:	56                   	push   esi
  407905:	53                   	push   ebx
  407906:	83 ec 1c             	sub    esp,0x1c
  407909:	8b 5d 0c             	mov    ebx,DWORD PTR [ebp+0xc]
  40790c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  40790f:	89 d8                	mov    eax,ebx
  407911:	83 e0 03             	and    eax,0x3
  407914:	0f 85 9e 00 00 00    	jne    4079b8 <___pow5mult_D2A+0xb8>
  40791a:	c1 fb 02             	sar    ebx,0x2
  40791d:	89 d0                	mov    eax,edx
  40791f:	85 db                	test   ebx,ebx
  407921:	74 4e                	je     407971 <___pow5mult_D2A+0x71>
  407923:	8b 3d 80 d0 40 00    	mov    edi,DWORD PTR ds:0x40d080
  407929:	85 ff                	test   edi,edi
  40792b:	0f 84 d5 00 00 00    	je     407a06 <___pow5mult_D2A+0x106>
  407931:	f6 c3 01             	test   bl,0x1
  407934:	75 13                	jne    407949 <___pow5mult_D2A+0x49>
  407936:	d1 fb                	sar    ebx,1
  407938:	74 35                	je     40796f <___pow5mult_D2A+0x6f>
  40793a:	8b 37                	mov    esi,DWORD PTR [edi]
  40793c:	85 f6                	test   esi,esi
  40793e:	66 90                	xchg   ax,ax
  407940:	74 3e                	je     407980 <___pow5mult_D2A+0x80>
  407942:	89 f7                	mov    edi,esi
  407944:	f6 c3 01             	test   bl,0x1
  407947:	74 ed                	je     407936 <___pow5mult_D2A+0x36>
  407949:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  40794d:	89 14 24             	mov    DWORD PTR [esp],edx
  407950:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  407953:	e8 48 fe ff ff       	call   4077a0 <___mult_D2A>
  407958:	85 c0                	test   eax,eax
  40795a:	89 c6                	mov    esi,eax
  40795c:	74 7f                	je     4079dd <___pow5mult_D2A+0xdd>
  40795e:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407961:	89 14 24             	mov    DWORD PTR [esp],edx
  407964:	e8 b7 fc ff ff       	call   407620 <___Bfree_D2A>
  407969:	d1 fb                	sar    ebx,1
  40796b:	89 f2                	mov    edx,esi
  40796d:	75 cb                	jne    40793a <___pow5mult_D2A+0x3a>
  40796f:	89 d0                	mov    eax,edx
  407971:	8d 65 f4             	lea    esp,[ebp-0xc]
  407974:	5b                   	pop    ebx
  407975:	5e                   	pop    esi
  407976:	5f                   	pop    edi
  407977:	5d                   	pop    ebp
  407978:	c3                   	ret    
  407979:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  407980:	b8 01 00 00 00       	mov    eax,0x1
  407985:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  407988:	e8 a3 fa ff ff       	call   407430 <_dtoa_lock>
  40798d:	8b 37                	mov    esi,DWORD PTR [edi]
  40798f:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407992:	85 f6                	test   esi,esi
  407994:	74 51                	je     4079e7 <___pow5mult_D2A+0xe7>
  407996:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  40799d:	75 a3                	jne    407942 <___pow5mult_D2A+0x42>
  40799f:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  4079a6:	89 f7                	mov    edi,esi
  4079a8:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  4079ab:	e8 78 08 00 00       	call   408228 <_LeaveCriticalSection@4>
  4079b0:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  4079b3:	83 ec 04             	sub    esp,0x4
  4079b6:	eb 8c                	jmp    407944 <___pow5mult_D2A+0x44>
  4079b8:	8b 04 85 5c a3 40 00 	mov    eax,DWORD PTR [eax*4+0x40a35c]
  4079bf:	89 14 24             	mov    DWORD PTR [esp],edx
  4079c2:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4079c9:	00 
  4079ca:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4079ce:	e8 bd fc ff ff       	call   407690 <___multadd_D2A>
  4079d3:	85 c0                	test   eax,eax
  4079d5:	89 c2                	mov    edx,eax
  4079d7:	0f 85 3d ff ff ff    	jne    40791a <___pow5mult_D2A+0x1a>
  4079dd:	31 c0                	xor    eax,eax
  4079df:	8d 65 f4             	lea    esp,[ebp-0xc]
  4079e2:	5b                   	pop    ebx
  4079e3:	5e                   	pop    esi
  4079e4:	5f                   	pop    edi
  4079e5:	5d                   	pop    ebp
  4079e6:	c3                   	ret    
  4079e7:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  4079eb:	89 3c 24             	mov    DWORD PTR [esp],edi
  4079ee:	e8 ad fd ff ff       	call   4077a0 <___mult_D2A>
  4079f3:	85 c0                	test   eax,eax
  4079f5:	89 c6                	mov    esi,eax
  4079f7:	89 07                	mov    DWORD PTR [edi],eax
  4079f9:	74 e2                	je     4079dd <___pow5mult_D2A+0xdd>
  4079fb:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  407a01:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407a04:	eb 90                	jmp    407996 <___pow5mult_D2A+0x96>
  407a06:	b8 01 00 00 00       	mov    eax,0x1
  407a0b:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  407a0e:	e8 1d fa ff ff       	call   407430 <_dtoa_lock>
  407a13:	8b 3d 80 d0 40 00    	mov    edi,DWORD PTR ds:0x40d080
  407a19:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407a1c:	85 ff                	test   edi,edi
  407a1e:	74 27                	je     407a47 <___pow5mult_D2A+0x147>
  407a20:	83 3d c8 d9 40 00 02 	cmp    DWORD PTR ds:0x40d9c8,0x2
  407a27:	0f 85 04 ff ff ff    	jne    407931 <___pow5mult_D2A+0x31>
  407a2d:	c7 04 24 f8 d9 40 00 	mov    DWORD PTR [esp],0x40d9f8
  407a34:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
  407a37:	e8 ec 07 00 00       	call   408228 <_LeaveCriticalSection@4>
  407a3c:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407a3f:	83 ec 04             	sub    esp,0x4
  407a42:	e9 ea fe ff ff       	jmp    407931 <___pow5mult_D2A+0x31>
  407a47:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  407a4e:	e8 fd fa ff ff       	call   407550 <___Balloc_D2A>
  407a53:	85 c0                	test   eax,eax
  407a55:	89 c7                	mov    edi,eax
  407a57:	74 1e                	je     407a77 <___pow5mult_D2A+0x177>
  407a59:	c7 40 14 71 02 00 00 	mov    DWORD PTR [eax+0x14],0x271
  407a60:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  407a63:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  407a6a:	a3 80 d0 40 00       	mov    ds:0x40d080,eax
  407a6f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
  407a75:	eb a9                	jmp    407a20 <___pow5mult_D2A+0x120>
  407a77:	c7 05 80 d0 40 00 00 	mov    DWORD PTR ds:0x40d080,0x0
  407a7e:	00 00 00 
  407a81:	31 c0                	xor    eax,eax
  407a83:	e9 57 ff ff ff       	jmp    4079df <___pow5mult_D2A+0xdf>
  407a88:	90                   	nop
  407a89:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00407a90 <___lshift_D2A>:
  407a90:	55                   	push   ebp
  407a91:	57                   	push   edi
  407a92:	56                   	push   esi
  407a93:	53                   	push   ebx
  407a94:	83 ec 2c             	sub    esp,0x2c
  407a97:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407a9b:	8b 74 24 44          	mov    esi,DWORD PTR [esp+0x44]
  407a9f:	89 c7                	mov    edi,eax
  407aa1:	8b 50 04             	mov    edx,DWORD PTR [eax+0x4]
  407aa4:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  407aa7:	89 f3                	mov    ebx,esi
  407aa9:	c1 fb 05             	sar    ebx,0x5
  407aac:	01 d8                	add    eax,ebx
  407aae:	8d 68 01             	lea    ebp,[eax+0x1]
  407ab1:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  407ab5:	8b 47 08             	mov    eax,DWORD PTR [edi+0x8]
  407ab8:	39 c5                	cmp    ebp,eax
  407aba:	7e 0d                	jle    407ac9 <___lshift_D2A+0x39>
  407abc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407ac0:	01 c0                	add    eax,eax
  407ac2:	83 c2 01             	add    edx,0x1
  407ac5:	39 c5                	cmp    ebp,eax
  407ac7:	7f f7                	jg     407ac0 <___lshift_D2A+0x30>
  407ac9:	89 14 24             	mov    DWORD PTR [esp],edx
  407acc:	e8 7f fa ff ff       	call   407550 <___Balloc_D2A>
  407ad1:	85 c0                	test   eax,eax
  407ad3:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  407ad7:	0f 84 bc 00 00 00    	je     407b99 <___lshift_D2A+0x109>
  407add:	85 db                	test   ebx,ebx
  407adf:	8d 50 14             	lea    edx,[eax+0x14]
  407ae2:	7e 13                	jle    407af7 <___lshift_D2A+0x67>
  407ae4:	31 c0                	xor    eax,eax
  407ae6:	c7 04 82 00 00 00 00 	mov    DWORD PTR [edx+eax*4],0x0
  407aed:	83 c0 01             	add    eax,0x1
  407af0:	39 d8                	cmp    eax,ebx
  407af2:	75 f2                	jne    407ae6 <___lshift_D2A+0x56>
  407af4:	8d 14 82             	lea    edx,[edx+eax*4]
  407af7:	8b 7c 24 40          	mov    edi,DWORD PTR [esp+0x40]
  407afb:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407aff:	8b 4f 10             	mov    ecx,DWORD PTR [edi+0x10]
  407b02:	83 c0 14             	add    eax,0x14
  407b05:	83 e6 1f             	and    esi,0x1f
  407b08:	89 74 24 0c          	mov    DWORD PTR [esp+0xc],esi
  407b0c:	8d 3c 88             	lea    edi,[eax+ecx*4]
  407b0f:	89 f9                	mov    ecx,edi
  407b11:	74 72                	je     407b85 <___lshift_D2A+0xf5>
  407b13:	c7 44 24 10 20 00 00 	mov    DWORD PTR [esp+0x10],0x20
  407b1a:	00 
  407b1b:	89 6c 24 1c          	mov    DWORD PTR [esp+0x1c],ebp
  407b1f:	89 cd                	mov    ebp,ecx
  407b21:	29 74 24 10          	sub    DWORD PTR [esp+0x10],esi
  407b25:	31 f6                	xor    esi,esi
  407b27:	eb 09                	jmp    407b32 <___lshift_D2A+0xa2>
  407b29:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  407b30:	89 fa                	mov    edx,edi
  407b32:	8b 18                	mov    ebx,DWORD PTR [eax]
  407b34:	83 c0 04             	add    eax,0x4
  407b37:	0f b6 4c 24 0c       	movzx  ecx,BYTE PTR [esp+0xc]
  407b3c:	8d 7a 04             	lea    edi,[edx+0x4]
  407b3f:	d3 e3                	shl    ebx,cl
  407b41:	0f b6 4c 24 10       	movzx  ecx,BYTE PTR [esp+0x10]
  407b46:	09 f3                	or     ebx,esi
  407b48:	89 1a                	mov    DWORD PTR [edx],ebx
  407b4a:	8b 70 fc             	mov    esi,DWORD PTR [eax-0x4]
  407b4d:	d3 ee                	shr    esi,cl
  407b4f:	39 c5                	cmp    ebp,eax
  407b51:	77 dd                	ja     407b30 <___lshift_D2A+0xa0>
  407b53:	85 f6                	test   esi,esi
  407b55:	8b 6c 24 1c          	mov    ebp,DWORD PTR [esp+0x1c]
  407b59:	89 72 04             	mov    DWORD PTR [edx+0x4],esi
  407b5c:	74 07                	je     407b65 <___lshift_D2A+0xd5>
  407b5e:	8b 6c 24 18          	mov    ebp,DWORD PTR [esp+0x18]
  407b62:	83 c5 02             	add    ebp,0x2
  407b65:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
  407b69:	8d 45 ff             	lea    eax,[ebp-0x1]
  407b6c:	89 47 10             	mov    DWORD PTR [edi+0x10],eax
  407b6f:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
  407b73:	89 04 24             	mov    DWORD PTR [esp],eax
  407b76:	e8 a5 fa ff ff       	call   407620 <___Bfree_D2A>
  407b7b:	89 f8                	mov    eax,edi
  407b7d:	83 c4 2c             	add    esp,0x2c
  407b80:	5b                   	pop    ebx
  407b81:	5e                   	pop    esi
  407b82:	5f                   	pop    edi
  407b83:	5d                   	pop    ebp
  407b84:	c3                   	ret    
  407b85:	89 fb                	mov    ebx,edi
  407b87:	83 c0 04             	add    eax,0x4
  407b8a:	8b 48 fc             	mov    ecx,DWORD PTR [eax-0x4]
  407b8d:	83 c2 04             	add    edx,0x4
  407b90:	39 c3                	cmp    ebx,eax
  407b92:	89 4a fc             	mov    DWORD PTR [edx-0x4],ecx
  407b95:	77 f0                	ja     407b87 <___lshift_D2A+0xf7>
  407b97:	eb cc                	jmp    407b65 <___lshift_D2A+0xd5>
  407b99:	31 c0                	xor    eax,eax
  407b9b:	eb e0                	jmp    407b7d <___lshift_D2A+0xed>
  407b9d:	8d 76 00             	lea    esi,[esi+0x0]

00407ba0 <___cmp_D2A>:
  407ba0:	53                   	push   ebx
  407ba1:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  407ba5:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  407ba9:	8b 41 10             	mov    eax,DWORD PTR [ecx+0x10]
  407bac:	8b 5a 10             	mov    ebx,DWORD PTR [edx+0x10]
  407baf:	29 d8                	sub    eax,ebx
  407bb1:	85 c0                	test   eax,eax
  407bb3:	75 24                	jne    407bd9 <___cmp_D2A+0x39>
  407bb5:	c1 e3 02             	shl    ebx,0x2
  407bb8:	83 c1 14             	add    ecx,0x14
  407bbb:	8d 04 19             	lea    eax,[ecx+ebx*1]
  407bbe:	8d 54 1a 14          	lea    edx,[edx+ebx*1+0x14]
  407bc2:	eb 04                	jmp    407bc8 <___cmp_D2A+0x28>
  407bc4:	39 c1                	cmp    ecx,eax
  407bc6:	73 18                	jae    407be0 <___cmp_D2A+0x40>
  407bc8:	83 ea 04             	sub    edx,0x4
  407bcb:	83 e8 04             	sub    eax,0x4
  407bce:	8b 1a                	mov    ebx,DWORD PTR [edx]
  407bd0:	39 18                	cmp    DWORD PTR [eax],ebx
  407bd2:	74 f0                	je     407bc4 <___cmp_D2A+0x24>
  407bd4:	19 c0                	sbb    eax,eax
  407bd6:	83 c8 01             	or     eax,0x1
  407bd9:	5b                   	pop    ebx
  407bda:	c3                   	ret    
  407bdb:	90                   	nop
  407bdc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407be0:	31 c0                	xor    eax,eax
  407be2:	5b                   	pop    ebx
  407be3:	c3                   	ret    
  407be4:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  407bea:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]

00407bf0 <___diff_D2A>:
  407bf0:	55                   	push   ebp
  407bf1:	57                   	push   edi
  407bf2:	56                   	push   esi
  407bf3:	53                   	push   ebx
  407bf4:	83 ec 2c             	sub    esp,0x2c
  407bf7:	8b 74 24 40          	mov    esi,DWORD PTR [esp+0x40]
  407bfb:	8b 5c 24 44          	mov    ebx,DWORD PTR [esp+0x44]
  407bff:	89 34 24             	mov    DWORD PTR [esp],esi
  407c02:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  407c06:	e8 95 ff ff ff       	call   407ba0 <___cmp_D2A>
  407c0b:	85 c0                	test   eax,eax
  407c0d:	0f 84 1f 01 00 00    	je     407d32 <___diff_D2A+0x142>
  407c13:	0f 88 3f 01 00 00    	js     407d58 <___diff_D2A+0x168>
  407c19:	31 ff                	xor    edi,edi
  407c1b:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
  407c1e:	89 04 24             	mov    DWORD PTR [esp],eax
  407c21:	e8 2a f9 ff ff       	call   407550 <___Balloc_D2A>
  407c26:	85 c0                	test   eax,eax
  407c28:	89 c2                	mov    edx,eax
  407c2a:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
  407c2e:	0f 84 34 01 00 00    	je     407d68 <___diff_D2A+0x178>
  407c34:	89 78 0c             	mov    DWORD PTR [eax+0xc],edi
  407c37:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
  407c3a:	83 c6 14             	add    esi,0x14
  407c3d:	8d 6b 14             	lea    ebp,[ebx+0x14]
  407c40:	8d 7a 14             	lea    edi,[edx+0x14]
  407c43:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  407c4a:	00 
  407c4b:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  407c4f:	8d 04 86             	lea    eax,[esi+eax*4]
  407c52:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  407c56:	8b 43 10             	mov    eax,DWORD PTR [ebx+0x10]
  407c59:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  407c60:	00 
  407c61:	8d 44 85 00          	lea    eax,[ebp+eax*4+0x0]
  407c65:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
  407c69:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  407c70:	83 c5 04             	add    ebp,0x4
  407c73:	83 c6 04             	add    esi,0x4
  407c76:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  407c79:	8b 46 fc             	mov    eax,DWORD PTR [esi-0x4]
  407c7c:	31 d2                	xor    edx,edx
  407c7e:	31 db                	xor    ebx,ebx
  407c80:	29 c8                	sub    eax,ecx
  407c82:	19 da                	sbb    edx,ebx
  407c84:	2b 44 24 08          	sub    eax,DWORD PTR [esp+0x8]
  407c88:	1b 54 24 0c          	sbb    edx,DWORD PTR [esp+0xc]
  407c8c:	83 c7 04             	add    edi,0x4
  407c8f:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  407c96:	00 
  407c97:	89 d1                	mov    ecx,edx
  407c99:	83 e1 01             	and    ecx,0x1
  407c9c:	39 6c 24 14          	cmp    DWORD PTR [esp+0x14],ebp
  407ca0:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  407ca4:	89 47 fc             	mov    DWORD PTR [edi-0x4],eax
  407ca7:	77 c7                	ja     407c70 <___diff_D2A+0x80>
  407ca9:	39 74 24 10          	cmp    DWORD PTR [esp+0x10],esi
  407cad:	76 4b                	jbe    407cfa <___diff_D2A+0x10a>
  407caf:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
  407cb3:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  407cb7:	89 7c 24 14          	mov    DWORD PTR [esp+0x14],edi
  407cbb:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  407cbf:	90                   	nop
  407cc0:	83 c6 04             	add    esi,0x4
  407cc3:	8b 46 fc             	mov    eax,DWORD PTR [esi-0x4]
  407cc6:	31 d2                	xor    edx,edx
  407cc8:	29 c8                	sub    eax,ecx
  407cca:	19 da                	sbb    edx,ebx
  407ccc:	83 c7 04             	add    edi,0x4
  407ccf:	89 d5                	mov    ebp,edx
  407cd1:	31 db                	xor    ebx,ebx
  407cd3:	83 e5 01             	and    ebp,0x1
  407cd6:	39 74 24 10          	cmp    DWORD PTR [esp+0x10],esi
  407cda:	89 e9                	mov    ecx,ebp
  407cdc:	89 47 fc             	mov    DWORD PTR [edi-0x4],eax
  407cdf:	77 df                	ja     407cc0 <___diff_D2A+0xd0>
  407ce1:	8b 6c 24 08          	mov    ebp,DWORD PTR [esp+0x8]
  407ce5:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
  407ce9:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
  407ced:	f7 d5                	not    ebp
  407cef:	8d 54 3d 00          	lea    edx,[ebp+edi*1+0x0]
  407cf3:	c1 ea 02             	shr    edx,0x2
  407cf6:	8d 7c 93 04          	lea    edi,[ebx+edx*4+0x4]
  407cfa:	85 c0                	test   eax,eax
  407cfc:	75 21                	jne    407d1f <___diff_D2A+0x12f>
  407cfe:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  407d02:	89 d0                	mov    eax,edx
  407d04:	c1 e0 02             	shl    eax,0x2
  407d07:	29 c7                	sub    edi,eax
  407d09:	89 d0                	mov    eax,edx
  407d0b:	90                   	nop
  407d0c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407d10:	83 e8 01             	sub    eax,0x1
  407d13:	8b 6c 87 fc          	mov    ebp,DWORD PTR [edi+eax*4-0x4]
  407d17:	85 ed                	test   ebp,ebp
  407d19:	74 f5                	je     407d10 <___diff_D2A+0x120>
  407d1b:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
  407d1f:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
  407d23:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
  407d27:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
  407d2a:	83 c4 2c             	add    esp,0x2c
  407d2d:	5b                   	pop    ebx
  407d2e:	5e                   	pop    esi
  407d2f:	5f                   	pop    edi
  407d30:	5d                   	pop    ebp
  407d31:	c3                   	ret    
  407d32:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  407d39:	e8 12 f8 ff ff       	call   407550 <___Balloc_D2A>
  407d3e:	85 c0                	test   eax,eax
  407d40:	74 26                	je     407d68 <___diff_D2A+0x178>
  407d42:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  407d49:	c7 40 14 00 00 00 00 	mov    DWORD PTR [eax+0x14],0x0
  407d50:	83 c4 2c             	add    esp,0x2c
  407d53:	5b                   	pop    ebx
  407d54:	5e                   	pop    esi
  407d55:	5f                   	pop    edi
  407d56:	5d                   	pop    ebp
  407d57:	c3                   	ret    
  407d58:	89 f0                	mov    eax,esi
  407d5a:	bf 01 00 00 00       	mov    edi,0x1
  407d5f:	89 de                	mov    esi,ebx
  407d61:	89 c3                	mov    ebx,eax
  407d63:	e9 b3 fe ff ff       	jmp    407c1b <___diff_D2A+0x2b>
  407d68:	31 c0                	xor    eax,eax
  407d6a:	eb be                	jmp    407d2a <___diff_D2A+0x13a>
  407d6c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00407d70 <___b2d_D2A>:
  407d70:	55                   	push   ebp
  407d71:	b9 20 00 00 00       	mov    ecx,0x20
  407d76:	57                   	push   edi
  407d77:	56                   	push   esi
  407d78:	53                   	push   ebx
  407d79:	83 ec 14             	sub    esp,0x14
  407d7c:	8b 44 24 28          	mov    eax,DWORD PTR [esp+0x28]
  407d80:	8b 7c 24 2c          	mov    edi,DWORD PTR [esp+0x2c]
  407d84:	8d 58 14             	lea    ebx,[eax+0x14]
  407d87:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
  407d8a:	8d 2c 83             	lea    ebp,[ebx+eax*4]
  407d8d:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  407d90:	8d 75 fc             	lea    esi,[ebp-0x4]
  407d93:	0f bd c2             	bsr    eax,edx
  407d96:	83 f0 1f             	xor    eax,0x1f
  407d99:	29 c1                	sub    ecx,eax
  407d9b:	83 f8 0a             	cmp    eax,0xa
  407d9e:	89 0f                	mov    DWORD PTR [edi],ecx
  407da0:	7f 3e                	jg     407de0 <___b2d_D2A+0x70>
  407da2:	b9 0b 00 00 00       	mov    ecx,0xb
  407da7:	89 d7                	mov    edi,edx
  407da9:	29 c1                	sub    ecx,eax
  407dab:	d3 ef                	shr    edi,cl
  407dad:	81 cf 00 00 f0 3f    	or     edi,0x3ff00000
  407db3:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
  407db7:	31 ff                	xor    edi,edi
  407db9:	39 f3                	cmp    ebx,esi
  407dbb:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  407dc2:	73 05                	jae    407dc9 <___b2d_D2A+0x59>
  407dc4:	8b 7d f8             	mov    edi,DWORD PTR [ebp-0x8]
  407dc7:	d3 ef                	shr    edi,cl
  407dc9:	8d 48 15             	lea    ecx,[eax+0x15]
  407dcc:	d3 e2                	shl    edx,cl
  407dce:	09 d7                	or     edi,edx
  407dd0:	89 3c 24             	mov    DWORD PTR [esp],edi
  407dd3:	dd 04 24             	fld    QWORD PTR [esp]
  407dd6:	83 c4 14             	add    esp,0x14
  407dd9:	5b                   	pop    ebx
  407dda:	5e                   	pop    esi
  407ddb:	5f                   	pop    edi
  407ddc:	5d                   	pop    ebp
  407ddd:	c3                   	ret    
  407dde:	66 90                	xchg   ax,ax
  407de0:	31 ff                	xor    edi,edi
  407de2:	39 f3                	cmp    ebx,esi
  407de4:	73 06                	jae    407dec <___b2d_D2A+0x7c>
  407de6:	8b 7d f8             	mov    edi,DWORD PTR [ebp-0x8]
  407de9:	8d 75 f8             	lea    esi,[ebp-0x8]
  407dec:	89 c1                	mov    ecx,eax
  407dee:	83 e9 0b             	sub    ecx,0xb
  407df1:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  407df5:	74 49                	je     407e40 <___b2d_D2A+0xd0>
  407df7:	0f b6 4c 24 0c       	movzx  ecx,BYTE PTR [esp+0xc]
  407dfc:	bd 2b 00 00 00       	mov    ebp,0x2b
  407e01:	29 c5                	sub    ebp,eax
  407e03:	89 f8                	mov    eax,edi
  407e05:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  407e0c:	d3 e2                	shl    edx,cl
  407e0e:	89 e9                	mov    ecx,ebp
  407e10:	d3 e8                	shr    eax,cl
  407e12:	81 ca 00 00 f0 3f    	or     edx,0x3ff00000
  407e18:	09 c2                	or     edx,eax
  407e1a:	31 c0                	xor    eax,eax
  407e1c:	39 de                	cmp    esi,ebx
  407e1e:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  407e22:	76 05                	jbe    407e29 <___b2d_D2A+0xb9>
  407e24:	8b 46 fc             	mov    eax,DWORD PTR [esi-0x4]
  407e27:	d3 e8                	shr    eax,cl
  407e29:	0f b6 4c 24 0c       	movzx  ecx,BYTE PTR [esp+0xc]
  407e2e:	d3 e7                	shl    edi,cl
  407e30:	09 f8                	or     eax,edi
  407e32:	89 04 24             	mov    DWORD PTR [esp],eax
  407e35:	dd 04 24             	fld    QWORD PTR [esp]
  407e38:	83 c4 14             	add    esp,0x14
  407e3b:	5b                   	pop    ebx
  407e3c:	5e                   	pop    esi
  407e3d:	5f                   	pop    edi
  407e3e:	5d                   	pop    ebp
  407e3f:	c3                   	ret    
  407e40:	81 ca 00 00 f0 3f    	or     edx,0x3ff00000
  407e46:	89 3c 24             	mov    DWORD PTR [esp],edi
  407e49:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  407e4d:	dd 04 24             	fld    QWORD PTR [esp]
  407e50:	83 c4 14             	add    esp,0x14
  407e53:	5b                   	pop    ebx
  407e54:	5e                   	pop    esi
  407e55:	5f                   	pop    edi
  407e56:	5d                   	pop    ebp
  407e57:	c3                   	ret    
  407e58:	90                   	nop
  407e59:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]

00407e60 <___d2b_D2A>:
  407e60:	55                   	push   ebp
  407e61:	57                   	push   edi
  407e62:	56                   	push   esi
  407e63:	53                   	push   ebx
  407e64:	83 ec 1c             	sub    esp,0x1c
  407e67:	dd 44 24 30          	fld    QWORD PTR [esp+0x30]
  407e6b:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  407e72:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
  407e76:	e8 d5 f6 ff ff       	call   407550 <___Balloc_D2A>
  407e7b:	85 c0                	test   eax,eax
  407e7d:	0f 84 c5 00 00 00    	je     407f48 <___d2b_D2A+0xe8>
  407e83:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  407e87:	89 d3                	mov    ebx,edx
  407e89:	81 e2 ff ff ff 7f    	and    edx,0x7fffffff
  407e8f:	c1 ea 14             	shr    edx,0x14
  407e92:	81 e3 ff ff 0f 00    	and    ebx,0xfffff
  407e98:	85 d2                	test   edx,edx
  407e9a:	74 06                	je     407ea2 <___d2b_D2A+0x42>
  407e9c:	81 cb 00 00 10 00    	or     ebx,0x100000
  407ea2:	8b 7c 24 08          	mov    edi,DWORD PTR [esp+0x8]
  407ea6:	85 ff                	test   edi,edi
  407ea8:	75 3e                	jne    407ee8 <___d2b_D2A+0x88>
  407eaa:	f3 0f bc cb          	tzcnt  ecx,ebx
  407eae:	d3 eb                	shr    ebx,cl
  407eb0:	85 d2                	test   edx,edx
  407eb2:	8d 71 20             	lea    esi,[ecx+0x20]
  407eb5:	b9 01 00 00 00       	mov    ecx,0x1
  407eba:	89 58 14             	mov    DWORD PTR [eax+0x14],ebx
  407ebd:	c7 40 10 01 00 00 00 	mov    DWORD PTR [eax+0x10],0x1
  407ec4:	74 56                	je     407f1c <___d2b_D2A+0xbc>
  407ec6:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
  407eca:	8d 94 16 cd fb ff ff 	lea    edx,[esi+edx*1-0x433]
  407ed1:	89 17                	mov    DWORD PTR [edi],edx
  407ed3:	ba 35 00 00 00       	mov    edx,0x35
  407ed8:	29 f2                	sub    edx,esi
  407eda:	8b 74 24 3c          	mov    esi,DWORD PTR [esp+0x3c]
  407ede:	89 16                	mov    DWORD PTR [esi],edx
  407ee0:	83 c4 1c             	add    esp,0x1c
  407ee3:	5b                   	pop    ebx
  407ee4:	5e                   	pop    esi
  407ee5:	5f                   	pop    edi
  407ee6:	5d                   	pop    ebp
  407ee7:	c3                   	ret    
  407ee8:	f3 0f bc f7          	tzcnt  esi,edi
  407eec:	89 f1                	mov    ecx,esi
  407eee:	d3 ef                	shr    edi,cl
  407ef0:	85 f6                	test   esi,esi
  407ef2:	74 4f                	je     407f43 <___d2b_D2A+0xe3>
  407ef4:	b9 20 00 00 00       	mov    ecx,0x20
  407ef9:	89 dd                	mov    ebp,ebx
  407efb:	29 f1                	sub    ecx,esi
  407efd:	d3 e5                	shl    ebp,cl
  407eff:	89 e9                	mov    ecx,ebp
  407f01:	09 f9                	or     ecx,edi
  407f03:	89 48 14             	mov    DWORD PTR [eax+0x14],ecx
  407f06:	89 f1                	mov    ecx,esi
  407f08:	d3 eb                	shr    ebx,cl
  407f0a:	83 fb 01             	cmp    ebx,0x1
  407f0d:	19 c9                	sbb    ecx,ecx
  407f0f:	83 c1 02             	add    ecx,0x2
  407f12:	85 d2                	test   edx,edx
  407f14:	89 58 18             	mov    DWORD PTR [eax+0x18],ebx
  407f17:	89 48 10             	mov    DWORD PTR [eax+0x10],ecx
  407f1a:	75 aa                	jne    407ec6 <___d2b_D2A+0x66>
  407f1c:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
  407f20:	81 ee 32 04 00 00    	sub    esi,0x432
  407f26:	0f bd 54 88 10       	bsr    edx,DWORD PTR [eax+ecx*4+0x10]
  407f2b:	c1 e1 05             	shl    ecx,0x5
  407f2e:	89 37                	mov    DWORD PTR [edi],esi
  407f30:	8b 74 24 3c          	mov    esi,DWORD PTR [esp+0x3c]
  407f34:	83 f2 1f             	xor    edx,0x1f
  407f37:	29 d1                	sub    ecx,edx
  407f39:	89 0e                	mov    DWORD PTR [esi],ecx
  407f3b:	83 c4 1c             	add    esp,0x1c
  407f3e:	5b                   	pop    ebx
  407f3f:	5e                   	pop    esi
  407f40:	5f                   	pop    edi
  407f41:	5d                   	pop    ebp
  407f42:	c3                   	ret    
  407f43:	89 78 14             	mov    DWORD PTR [eax+0x14],edi
  407f46:	eb c2                	jmp    407f0a <___d2b_D2A+0xaa>
  407f48:	31 c0                	xor    eax,eax
  407f4a:	eb 94                	jmp    407ee0 <___d2b_D2A+0x80>
  407f4c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]

00407f50 <___strcp_D2A>:
  407f50:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
  407f54:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  407f58:	8d 51 01             	lea    edx,[ecx+0x1]
  407f5b:	0f b6 09             	movzx  ecx,BYTE PTR [ecx]
  407f5e:	84 c9                	test   cl,cl
  407f60:	88 08                	mov    BYTE PTR [eax],cl
  407f62:	74 10                	je     407f74 <___strcp_D2A+0x24>
  407f64:	83 c2 01             	add    edx,0x1
  407f67:	0f b6 4a ff          	movzx  ecx,BYTE PTR [edx-0x1]
  407f6b:	83 c0 01             	add    eax,0x1
  407f6e:	84 c9                	test   cl,cl
  407f70:	88 08                	mov    BYTE PTR [eax],cl
  407f72:	75 f0                	jne    407f64 <___strcp_D2A+0x14>
  407f74:	f3 c3                	repz ret 
  407f76:	90                   	nop
  407f77:	90                   	nop
  407f78:	90                   	nop
  407f79:	90                   	nop
  407f7a:	90                   	nop
  407f7b:	90                   	nop
  407f7c:	90                   	nop
  407f7d:	90                   	nop
  407f7e:	90                   	nop
  407f7f:	90                   	nop

00407f80 <___rshift_D2A>:
  407f80:	55                   	push   ebp
  407f81:	57                   	push   edi
  407f82:	56                   	push   esi
  407f83:	53                   	push   ebx
  407f84:	83 ec 10             	sub    esp,0x10
  407f87:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  407f8b:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  407f8f:	8b 4c 24 28          	mov    ecx,DWORD PTR [esp+0x28]
  407f93:	8b 56 10             	mov    edx,DWORD PTR [esi+0x10]
  407f96:	8d 68 14             	lea    ebp,[eax+0x14]
  407f99:	89 c8                	mov    eax,ecx
  407f9b:	c1 f8 05             	sar    eax,0x5
  407f9e:	39 d0                	cmp    eax,edx
  407fa0:	0f 8d 8a 00 00 00    	jge    408030 <___rshift_D2A+0xb0>
  407fa6:	8d 44 85 00          	lea    eax,[ebp+eax*4+0x0]
  407faa:	83 e1 1f             	and    ecx,0x1f
  407fad:	8d 7c 95 00          	lea    edi,[ebp+edx*4+0x0]
  407fb1:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  407fb5:	89 0c 24             	mov    DWORD PTR [esp],ecx
  407fb8:	0f 84 92 00 00 00    	je     408050 <___rshift_D2A+0xd0>
  407fbe:	8b 74 24 04          	mov    esi,DWORD PTR [esp+0x4]
  407fc2:	8b 04 24             	mov    eax,DWORD PTR [esp]
  407fc5:	c7 44 24 08 20 00 00 	mov    DWORD PTR [esp+0x8],0x20
  407fcc:	00 
  407fcd:	29 44 24 08          	sub    DWORD PTR [esp+0x8],eax
  407fd1:	8b 1e                	mov    ebx,DWORD PTR [esi]
  407fd3:	8d 56 04             	lea    edx,[esi+0x4]
  407fd6:	89 c1                	mov    ecx,eax
  407fd8:	d3 eb                	shr    ebx,cl
  407fda:	39 d7                	cmp    edi,edx
  407fdc:	0f 86 ac 00 00 00    	jbe    40808e <___rshift_D2A+0x10e>
  407fe2:	89 ee                	mov    esi,ebp
  407fe4:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
  407fe8:	8b 6c 24 08          	mov    ebp,DWORD PTR [esp+0x8]
  407fec:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  407ff0:	8b 02                	mov    eax,DWORD PTR [edx]
  407ff2:	89 e9                	mov    ecx,ebp
  407ff4:	83 c6 04             	add    esi,0x4
  407ff7:	83 c2 04             	add    edx,0x4
  407ffa:	d3 e0                	shl    eax,cl
  407ffc:	0f b6 0c 24          	movzx  ecx,BYTE PTR [esp]
  408000:	09 d8                	or     eax,ebx
  408002:	89 46 fc             	mov    DWORD PTR [esi-0x4],eax
  408005:	8b 5a fc             	mov    ebx,DWORD PTR [edx-0x4]
  408008:	d3 eb                	shr    ebx,cl
  40800a:	39 d7                	cmp    edi,edx
  40800c:	77 e2                	ja     407ff0 <___rshift_D2A+0x70>
  40800e:	2b 7c 24 04          	sub    edi,DWORD PTR [esp+0x4]
  408012:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
  408016:	8d 47 fb             	lea    eax,[edi-0x5]
  408019:	c1 e8 02             	shr    eax,0x2
  40801c:	8d 44 85 04          	lea    eax,[ebp+eax*4+0x4]
  408020:	85 db                	test   ebx,ebx
  408022:	89 18                	mov    DWORD PTR [eax],ebx
  408024:	74 03                	je     408029 <___rshift_D2A+0xa9>
  408026:	83 c0 04             	add    eax,0x4
  408029:	29 e8                	sub    eax,ebp
  40802b:	c1 f8 02             	sar    eax,0x2
  40802e:	eb 4b                	jmp    40807b <___rshift_D2A+0xfb>
  408030:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  408034:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
  40803b:	8b 44 24 24          	mov    eax,DWORD PTR [esp+0x24]
  40803f:	c7 40 14 00 00 00 00 	mov    DWORD PTR [eax+0x14],0x0
  408046:	83 c4 10             	add    esp,0x10
  408049:	5b                   	pop    ebx
  40804a:	5e                   	pop    esi
  40804b:	5f                   	pop    edi
  40804c:	5d                   	pop    ebp
  40804d:	c3                   	ret    
  40804e:	66 90                	xchg   ax,ax
  408050:	39 c7                	cmp    edi,eax
  408052:	89 ea                	mov    edx,ebp
  408054:	76 da                	jbe    408030 <___rshift_D2A+0xb0>
  408056:	83 c0 04             	add    eax,0x4
  408059:	8b 48 fc             	mov    ecx,DWORD PTR [eax-0x4]
  40805c:	83 c2 04             	add    edx,0x4
  40805f:	39 c7                	cmp    edi,eax
  408061:	89 4a fc             	mov    DWORD PTR [edx-0x4],ecx
  408064:	77 f0                	ja     408056 <___rshift_D2A+0xd6>
  408066:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  40806a:	f7 d0                	not    eax
  40806c:	01 f8                	add    eax,edi
  40806e:	c1 e8 02             	shr    eax,0x2
  408071:	8d 04 85 04 00 00 00 	lea    eax,[eax*4+0x4]
  408078:	c1 f8 02             	sar    eax,0x2
  40807b:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
  40807f:	85 c0                	test   eax,eax
  408081:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
  408084:	74 b5                	je     40803b <___rshift_D2A+0xbb>
  408086:	83 c4 10             	add    esp,0x10
  408089:	5b                   	pop    ebx
  40808a:	5e                   	pop    esi
  40808b:	5f                   	pop    edi
  40808c:	5d                   	pop    ebp
  40808d:	c3                   	ret    
  40808e:	89 e8                	mov    eax,ebp
  408090:	eb 8e                	jmp    408020 <___rshift_D2A+0xa0>
  408092:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  408099:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]

004080a0 <___trailz_D2A>:
  4080a0:	53                   	push   ebx
  4080a1:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  4080a5:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
  4080a8:	8d 50 14             	lea    edx,[eax+0x14]
  4080ab:	8d 1c 8a             	lea    ebx,[edx+ecx*4]
  4080ae:	39 da                	cmp    edx,ebx
  4080b0:	73 28                	jae    4080da <___trailz_D2A+0x3a>
  4080b2:	8b 48 14             	mov    ecx,DWORD PTR [eax+0x14]
  4080b5:	31 c0                	xor    eax,eax
  4080b7:	85 c9                	test   ecx,ecx
  4080b9:	74 0b                	je     4080c6 <___trailz_D2A+0x26>
  4080bb:	eb 15                	jmp    4080d2 <___trailz_D2A+0x32>
  4080bd:	8d 76 00             	lea    esi,[esi+0x0]
  4080c0:	8b 0a                	mov    ecx,DWORD PTR [edx]
  4080c2:	85 c9                	test   ecx,ecx
  4080c4:	75 0c                	jne    4080d2 <___trailz_D2A+0x32>
  4080c6:	83 c2 04             	add    edx,0x4
  4080c9:	83 c0 20             	add    eax,0x20
  4080cc:	39 d3                	cmp    ebx,edx
  4080ce:	77 f0                	ja     4080c0 <___trailz_D2A+0x20>
  4080d0:	5b                   	pop    ebx
  4080d1:	c3                   	ret    
  4080d2:	f3 0f bc c9          	tzcnt  ecx,ecx
  4080d6:	01 c8                	add    eax,ecx
  4080d8:	5b                   	pop    ebx
  4080d9:	c3                   	ret    
  4080da:	31 c0                	xor    eax,eax
  4080dc:	5b                   	pop    ebx
  4080dd:	c3                   	ret    
  4080de:	90                   	nop
  4080df:	90                   	nop

004080e0 <_signal>:
  4080e0:	ff 25 1c e2 40 00    	jmp    DWORD PTR ds:0x40e21c
  4080e6:	90                   	nop
  4080e7:	90                   	nop

004080e8 <__setmode>:
  4080e8:	ff 25 d4 e1 40 00    	jmp    DWORD PTR ds:0x40e1d4
  4080ee:	90                   	nop
  4080ef:	90                   	nop

004080f0 <___p__fmode>:
  4080f0:	ff 25 b8 e1 40 00    	jmp    DWORD PTR ds:0x40e1b8
  4080f6:	90                   	nop
  4080f7:	90                   	nop

004080f8 <___p__environ>:
  4080f8:	ff 25 b4 e1 40 00    	jmp    DWORD PTR ds:0x40e1b4
  4080fe:	90                   	nop
  4080ff:	90                   	nop

00408100 <__cexit>:
  408100:	ff 25 c0 e1 40 00    	jmp    DWORD PTR ds:0x40e1c0
  408106:	90                   	nop
  408107:	90                   	nop

00408108 <___getmainargs>:
  408108:	ff 25 ac e1 40 00    	jmp    DWORD PTR ds:0x40e1ac
  40810e:	90                   	nop
  40810f:	90                   	nop

00408110 <_clock>:
  408110:	ff 25 e8 e1 40 00    	jmp    DWORD PTR ds:0x40e1e8
  408116:	90                   	nop
  408117:	90                   	nop

00408118 <_printf>:
  408118:	ff 25 10 e2 40 00    	jmp    DWORD PTR ds:0x40e210
  40811e:	90                   	nop
  40811f:	90                   	nop

00408120 <_strlen>:
  408120:	ff 25 28 e2 40 00    	jmp    DWORD PTR ds:0x40e228
  408126:	90                   	nop
  408127:	90                   	nop

00408128 <_isspace>:
  408128:	ff 25 fc e1 40 00    	jmp    DWORD PTR ds:0x40e1fc
  40812e:	90                   	nop
  40812f:	90                   	nop

00408130 <_fwrite>:
  408130:	ff 25 f4 e1 40 00    	jmp    DWORD PTR ds:0x40e1f4
  408136:	90                   	nop
  408137:	90                   	nop

00408138 <_vfprintf>:
  408138:	ff 25 30 e2 40 00    	jmp    DWORD PTR ds:0x40e230
  40813e:	90                   	nop
  40813f:	90                   	nop

00408140 <_abort>:
  408140:	ff 25 d8 e1 40 00    	jmp    DWORD PTR ds:0x40e1d8
  408146:	90                   	nop
  408147:	90                   	nop

00408148 <_memcpy>:
  408148:	ff 25 0c e2 40 00    	jmp    DWORD PTR ds:0x40e20c
  40814e:	90                   	nop
  40814f:	90                   	nop

00408150 <_calloc>:
  408150:	ff 25 e4 e1 40 00    	jmp    DWORD PTR ds:0x40e1e4
  408156:	90                   	nop
  408157:	90                   	nop

00408158 <_free>:
  408158:	ff 25 f0 e1 40 00    	jmp    DWORD PTR ds:0x40e1f0
  40815e:	90                   	nop
  40815f:	90                   	nop

00408160 <_malloc>:
  408160:	ff 25 04 e2 40 00    	jmp    DWORD PTR ds:0x40e204
  408166:	90                   	nop
  408167:	90                   	nop

00408168 <_tolower>:
  408168:	ff 25 2c e2 40 00    	jmp    DWORD PTR ds:0x40e22c
  40816e:	90                   	nop
  40816f:	90                   	nop

00408170 <_realloc>:
  408170:	ff 25 14 e2 40 00    	jmp    DWORD PTR ds:0x40e214
  408176:	90                   	nop
  408177:	90                   	nop

00408178 <_strcoll>:
  408178:	ff 25 24 e2 40 00    	jmp    DWORD PTR ds:0x40e224
  40817e:	90                   	nop
  40817f:	90                   	nop

00408180 <__errno>:
  408180:	ff 25 c4 e1 40 00    	jmp    DWORD PTR ds:0x40e1c4
  408186:	90                   	nop
  408187:	90                   	nop

00408188 <_setlocale>:
  408188:	ff 25 18 e2 40 00    	jmp    DWORD PTR ds:0x40e218
  40818e:	90                   	nop
  40818f:	90                   	nop

00408190 <_wcstombs>:
  408190:	ff 25 38 e2 40 00    	jmp    DWORD PTR ds:0x40e238
  408196:	90                   	nop
  408197:	90                   	nop

00408198 <_mbstowcs>:
  408198:	ff 25 08 e2 40 00    	jmp    DWORD PTR ds:0x40e208
  40819e:	90                   	nop
  40819f:	90                   	nop

004081a0 <__fullpath>:
  4081a0:	ff 25 c8 e1 40 00    	jmp    DWORD PTR ds:0x40e1c8
  4081a6:	90                   	nop
  4081a7:	90                   	nop

004081a8 <_fputc>:
  4081a8:	ff 25 ec e1 40 00    	jmp    DWORD PTR ds:0x40e1ec
  4081ae:	90                   	nop
  4081af:	90                   	nop

004081b0 <_localeconv>:
  4081b0:	ff 25 00 e2 40 00    	jmp    DWORD PTR ds:0x40e200
  4081b6:	90                   	nop
  4081b7:	90                   	nop

004081b8 <_getenv>:
  4081b8:	ff 25 f8 e1 40 00    	jmp    DWORD PTR ds:0x40e1f8
  4081be:	90                   	nop
  4081bf:	90                   	nop

004081c0 <_wcslen>:
  4081c0:	ff 25 34 e2 40 00    	jmp    DWORD PTR ds:0x40e234
  4081c6:	90                   	nop
  4081c7:	90                   	nop

004081c8 <_strchr>:
  4081c8:	ff 25 20 e2 40 00    	jmp    DWORD PTR ds:0x40e220
  4081ce:	90                   	nop
  4081cf:	90                   	nop

004081d0 <_atoi>:
  4081d0:	ff 25 e0 e1 40 00    	jmp    DWORD PTR ds:0x40e1e0
  4081d6:	90                   	nop
  4081d7:	90                   	nop

004081d8 <_SetUnhandledExceptionFilter@4>:
  4081d8:	ff 25 84 e1 40 00    	jmp    DWORD PTR ds:0x40e184
  4081de:	90                   	nop
  4081df:	90                   	nop

004081e0 <_ExitProcess@4>:
  4081e0:	ff 25 50 e1 40 00    	jmp    DWORD PTR ds:0x40e150
  4081e6:	90                   	nop
  4081e7:	90                   	nop

004081e8 <_GetModuleHandleA@4>:
  4081e8:	ff 25 68 e1 40 00    	jmp    DWORD PTR ds:0x40e168
  4081ee:	90                   	nop
  4081ef:	90                   	nop

004081f0 <_GetProcAddress@8>:
  4081f0:	ff 25 6c e1 40 00    	jmp    DWORD PTR ds:0x40e16c
  4081f6:	90                   	nop
  4081f7:	90                   	nop

004081f8 <_GetCommandLineA@0>:
  4081f8:	ff 25 60 e1 40 00    	jmp    DWORD PTR ds:0x40e160
  4081fe:	90                   	nop
  4081ff:	90                   	nop

00408200 <_VirtualQuery@12>:
  408200:	ff 25 94 e1 40 00    	jmp    DWORD PTR ds:0x40e194
  408206:	90                   	nop
  408207:	90                   	nop

00408208 <_VirtualProtect@16>:
  408208:	ff 25 90 e1 40 00    	jmp    DWORD PTR ds:0x40e190
  40820e:	90                   	nop
  40820f:	90                   	nop

00408210 <_EnterCriticalSection@4>:
  408210:	ff 25 4c e1 40 00    	jmp    DWORD PTR ds:0x40e14c
  408216:	90                   	nop
  408217:	90                   	nop

00408218 <_TlsGetValue@4>:
  408218:	ff 25 8c e1 40 00    	jmp    DWORD PTR ds:0x40e18c
  40821e:	90                   	nop
  40821f:	90                   	nop

00408220 <_GetLastError@0>:
  408220:	ff 25 64 e1 40 00    	jmp    DWORD PTR ds:0x40e164
  408226:	90                   	nop
  408227:	90                   	nop

00408228 <_LeaveCriticalSection@4>:
  408228:	ff 25 7c e1 40 00    	jmp    DWORD PTR ds:0x40e17c
  40822e:	90                   	nop
  40822f:	90                   	nop

00408230 <_DeleteCriticalSection@4>:
  408230:	ff 25 48 e1 40 00    	jmp    DWORD PTR ds:0x40e148
  408236:	90                   	nop
  408237:	90                   	nop

00408238 <_InitializeCriticalSection@4>:
  408238:	ff 25 70 e1 40 00    	jmp    DWORD PTR ds:0x40e170
  40823e:	90                   	nop
  40823f:	90                   	nop

00408240 <_FindNextFileA@8>:
  408240:	ff 25 5c e1 40 00    	jmp    DWORD PTR ds:0x40e15c
  408246:	90                   	nop
  408247:	90                   	nop

00408248 <_FindFirstFileA@8>:
  408248:	ff 25 58 e1 40 00    	jmp    DWORD PTR ds:0x40e158
  40824e:	90                   	nop
  40824f:	90                   	nop

00408250 <_FindClose@4>:
  408250:	ff 25 54 e1 40 00    	jmp    DWORD PTR ds:0x40e154
  408256:	90                   	nop
  408257:	90                   	nop

00408258 <_WideCharToMultiByte@32>:
  408258:	ff 25 98 e1 40 00    	jmp    DWORD PTR ds:0x40e198
  40825e:	90                   	nop
  40825f:	90                   	nop

00408260 <_IsDBCSLeadByteEx@8>:
  408260:	ff 25 78 e1 40 00    	jmp    DWORD PTR ds:0x40e178
  408266:	90                   	nop
  408267:	90                   	nop

00408268 <_MultiByteToWideChar@24>:
  408268:	ff 25 80 e1 40 00    	jmp    DWORD PTR ds:0x40e180
  40826e:	90                   	nop
  40826f:	90                   	nop

00408270 <_Sleep@4>:
  408270:	ff 25 88 e1 40 00    	jmp    DWORD PTR ds:0x40e188
  408276:	90                   	nop
  408277:	90                   	nop

00408278 <_InterlockedExchange@8>:
  408278:	ff 25 74 e1 40 00    	jmp    DWORD PTR ds:0x40e174
  40827e:	90                   	nop
  40827f:	90                   	nop

00408280 <___umoddi3>:
  408280:	55                   	push   ebp
  408281:	57                   	push   edi
  408282:	56                   	push   esi
  408283:	53                   	push   ebx
  408284:	83 ec 1c             	sub    esp,0x1c
  408287:	8b 44 24 3c          	mov    eax,DWORD PTR [esp+0x3c]
  40828b:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  40828f:	8b 6c 24 34          	mov    ebp,DWORD PTR [esp+0x34]
  408293:	8b 5c 24 38          	mov    ebx,DWORD PTR [esp+0x38]
  408297:	85 c0                	test   eax,eax
  408299:	89 c2                	mov    edx,eax
  40829b:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  40829f:	89 ee                	mov    esi,ebp
  4082a1:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4082a4:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  4082a8:	89 6c 24 08          	mov    DWORD PTR [esp+0x8],ebp
  4082ac:	75 16                	jne    4082c4 <___umoddi3+0x44>
  4082ae:	39 eb                	cmp    ebx,ebp
  4082b0:	76 4e                	jbe    408300 <___umoddi3+0x80>
  4082b2:	89 c8                	mov    eax,ecx
  4082b4:	89 ea                	mov    edx,ebp
  4082b6:	f7 f3                	div    ebx
  4082b8:	89 d0                	mov    eax,edx
  4082ba:	31 d2                	xor    edx,edx
  4082bc:	83 c4 1c             	add    esp,0x1c
  4082bf:	5b                   	pop    ebx
  4082c0:	5e                   	pop    esi
  4082c1:	5f                   	pop    edi
  4082c2:	5d                   	pop    ebp
  4082c3:	c3                   	ret    
  4082c4:	39 e8                	cmp    eax,ebp
  4082c6:	77 58                	ja     408320 <___umoddi3+0xa0>
  4082c8:	0f bd f8             	bsr    edi,eax
  4082cb:	83 f7 1f             	xor    edi,0x1f
  4082ce:	75 60                	jne    408330 <___umoddi3+0xb0>
  4082d0:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
  4082d4:	39 3c 24             	cmp    DWORD PTR [esp],edi
  4082d7:	0f 87 e4 00 00 00    	ja     4083c1 <___umoddi3+0x141>
  4082dd:	89 ef                	mov    edi,ebp
  4082df:	89 ce                	mov    esi,ecx
  4082e1:	29 de                	sub    esi,ebx
  4082e3:	19 c7                	sbb    edi,eax
  4082e5:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  4082e9:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
  4082ed:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  4082f1:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
  4082f5:	83 c4 1c             	add    esp,0x1c
  4082f8:	5b                   	pop    ebx
  4082f9:	5e                   	pop    esi
  4082fa:	5f                   	pop    edi
  4082fb:	5d                   	pop    ebp
  4082fc:	c3                   	ret    
  4082fd:	8d 76 00             	lea    esi,[esi+0x0]
  408300:	85 db                	test   ebx,ebx
  408302:	89 df                	mov    edi,ebx
  408304:	75 0b                	jne    408311 <___umoddi3+0x91>
  408306:	b8 01 00 00 00       	mov    eax,0x1
  40830b:	31 d2                	xor    edx,edx
  40830d:	f7 f3                	div    ebx
  40830f:	89 c7                	mov    edi,eax
  408311:	89 e8                	mov    eax,ebp
  408313:	31 d2                	xor    edx,edx
  408315:	f7 f7                	div    edi
  408317:	89 c8                	mov    eax,ecx
  408319:	f7 f7                	div    edi
  40831b:	eb 9b                	jmp    4082b8 <___umoddi3+0x38>
  40831d:	8d 76 00             	lea    esi,[esi+0x0]
  408320:	89 c8                	mov    eax,ecx
  408322:	89 ea                	mov    edx,ebp
  408324:	83 c4 1c             	add    esp,0x1c
  408327:	5b                   	pop    ebx
  408328:	5e                   	pop    esi
  408329:	5f                   	pop    edi
  40832a:	5d                   	pop    ebp
  40832b:	c3                   	ret    
  40832c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  408330:	8b 2c 24             	mov    ebp,DWORD PTR [esp]
  408333:	bb 20 00 00 00       	mov    ebx,0x20
  408338:	89 f9                	mov    ecx,edi
  40833a:	29 fb                	sub    ebx,edi
  40833c:	d3 e2                	shl    edx,cl
  40833e:	89 d9                	mov    ecx,ebx
  408340:	89 e8                	mov    eax,ebp
  408342:	d3 e8                	shr    eax,cl
  408344:	89 f9                	mov    ecx,edi
  408346:	89 04 24             	mov    DWORD PTR [esp],eax
  408349:	89 e8                	mov    eax,ebp
  40834b:	d3 e0                	shl    eax,cl
  40834d:	89 d9                	mov    ecx,ebx
  40834f:	89 c5                	mov    ebp,eax
  408351:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  408355:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  408359:	09 14 24             	or     DWORD PTR [esp],edx
  40835c:	89 f2                	mov    edx,esi
  40835e:	d3 ea                	shr    edx,cl
  408360:	89 f9                	mov    ecx,edi
  408362:	d3 e6                	shl    esi,cl
  408364:	89 d9                	mov    ecx,ebx
  408366:	d3 e8                	shr    eax,cl
  408368:	89 f9                	mov    ecx,edi
  40836a:	09 f0                	or     eax,esi
  40836c:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
  408370:	f7 34 24             	div    DWORD PTR [esp]
  408373:	d3 e6                	shl    esi,cl
  408375:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  408379:	89 d6                	mov    esi,edx
  40837b:	f7 e5                	mul    ebp
  40837d:	39 d6                	cmp    esi,edx
  40837f:	89 c1                	mov    ecx,eax
  408381:	89 d5                	mov    ebp,edx
  408383:	72 2f                	jb     4083b4 <___umoddi3+0x134>
  408385:	39 44 24 04          	cmp    DWORD PTR [esp+0x4],eax
  408389:	72 25                	jb     4083b0 <___umoddi3+0x130>
  40838b:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  40838f:	29 c8                	sub    eax,ecx
  408391:	19 ee                	sbb    esi,ebp
  408393:	89 f9                	mov    ecx,edi
  408395:	89 f2                	mov    edx,esi
  408397:	d3 e8                	shr    eax,cl
  408399:	89 d9                	mov    ecx,ebx
  40839b:	d3 e2                	shl    edx,cl
  40839d:	89 f9                	mov    ecx,edi
  40839f:	d3 ee                	shr    esi,cl
  4083a1:	09 d0                	or     eax,edx
  4083a3:	89 f2                	mov    edx,esi
  4083a5:	83 c4 1c             	add    esp,0x1c
  4083a8:	5b                   	pop    ebx
  4083a9:	5e                   	pop    esi
  4083aa:	5f                   	pop    edi
  4083ab:	5d                   	pop    ebp
  4083ac:	c3                   	ret    
  4083ad:	8d 76 00             	lea    esi,[esi+0x0]
  4083b0:	39 d6                	cmp    esi,edx
  4083b2:	75 d7                	jne    40838b <___umoddi3+0x10b>
  4083b4:	89 d5                	mov    ebp,edx
  4083b6:	89 c1                	mov    ecx,eax
  4083b8:	2b 4c 24 08          	sub    ecx,DWORD PTR [esp+0x8]
  4083bc:	1b 2c 24             	sbb    ebp,DWORD PTR [esp]
  4083bf:	eb ca                	jmp    40838b <___umoddi3+0x10b>
  4083c1:	3b 44 24 08          	cmp    eax,DWORD PTR [esp+0x8]
  4083c5:	0f 82 12 ff ff ff    	jb     4082dd <___umoddi3+0x5d>
  4083cb:	e9 1d ff ff ff       	jmp    4082ed <___umoddi3+0x6d>

004083d0 <___udivdi3>:
  4083d0:	55                   	push   ebp
  4083d1:	57                   	push   edi
  4083d2:	56                   	push   esi
  4083d3:	53                   	push   ebx
  4083d4:	83 ec 14             	sub    esp,0x14
  4083d7:	8b 74 24 34          	mov    esi,DWORD PTR [esp+0x34]
  4083db:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
  4083df:	8b 6c 24 2c          	mov    ebp,DWORD PTR [esp+0x2c]
  4083e3:	8b 4c 24 30          	mov    ecx,DWORD PTR [esp+0x30]
  4083e7:	85 f6                	test   esi,esi
  4083e9:	89 3c 24             	mov    DWORD PTR [esp],edi
  4083ec:	89 e8                	mov    eax,ebp
  4083ee:	89 ca                	mov    edx,ecx
  4083f0:	75 2e                	jne    408420 <___udivdi3+0x50>
  4083f2:	39 e9                	cmp    ecx,ebp
  4083f4:	77 5c                	ja     408452 <___udivdi3+0x82>
  4083f6:	85 c9                	test   ecx,ecx
  4083f8:	89 cb                	mov    ebx,ecx
  4083fa:	75 0b                	jne    408407 <___udivdi3+0x37>
  4083fc:	b8 01 00 00 00       	mov    eax,0x1
  408401:	31 d2                	xor    edx,edx
  408403:	f7 f1                	div    ecx
  408405:	89 c3                	mov    ebx,eax
  408407:	89 e8                	mov    eax,ebp
  408409:	31 d2                	xor    edx,edx
  40840b:	f7 f3                	div    ebx
  40840d:	89 c5                	mov    ebp,eax
  40840f:	89 f8                	mov    eax,edi
  408411:	f7 f3                	div    ebx
  408413:	89 ea                	mov    edx,ebp
  408415:	83 c4 14             	add    esp,0x14
  408418:	5b                   	pop    ebx
  408419:	5e                   	pop    esi
  40841a:	5f                   	pop    edi
  40841b:	5d                   	pop    ebp
  40841c:	c3                   	ret    
  40841d:	8d 76 00             	lea    esi,[esi+0x0]
  408420:	39 ee                	cmp    esi,ebp
  408422:	77 22                	ja     408446 <___udivdi3+0x76>
  408424:	0f bd de             	bsr    ebx,esi
  408427:	83 f3 1f             	xor    ebx,0x1f
  40842a:	75 36                	jne    408462 <___udivdi3+0x92>
  40842c:	3b 0c 24             	cmp    ecx,DWORD PTR [esp]
  40842f:	ba 00 00 00 00       	mov    edx,0x0
  408434:	0f 86 86 00 00 00    	jbe    4084c0 <___udivdi3+0xf0>
  40843a:	39 ee                	cmp    esi,ebp
  40843c:	0f 82 7e 00 00 00    	jb     4084c0 <___udivdi3+0xf0>
  408442:	31 c0                	xor    eax,eax
  408444:	eb cf                	jmp    408415 <___udivdi3+0x45>
  408446:	31 d2                	xor    edx,edx
  408448:	31 c0                	xor    eax,eax
  40844a:	83 c4 14             	add    esp,0x14
  40844d:	5b                   	pop    ebx
  40844e:	5e                   	pop    esi
  40844f:	5f                   	pop    edi
  408450:	5d                   	pop    ebp
  408451:	c3                   	ret    
  408452:	89 f8                	mov    eax,edi
  408454:	89 ea                	mov    edx,ebp
  408456:	f7 f1                	div    ecx
  408458:	31 d2                	xor    edx,edx
  40845a:	83 c4 14             	add    esp,0x14
  40845d:	5b                   	pop    ebx
  40845e:	5e                   	pop    esi
  40845f:	5f                   	pop    edi
  408460:	5d                   	pop    ebp
  408461:	c3                   	ret    
  408462:	bf 20 00 00 00       	mov    edi,0x20
  408467:	89 d9                	mov    ecx,ebx
  408469:	29 df                	sub    edi,ebx
  40846b:	89 d5                	mov    ebp,edx
  40846d:	d3 e6                	shl    esi,cl
  40846f:	89 f9                	mov    ecx,edi
  408471:	d3 ed                	shr    ebp,cl
  408473:	89 d9                	mov    ecx,ebx
  408475:	d3 e2                	shl    edx,cl
  408477:	09 f5                	or     ebp,esi
  408479:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  40847d:	8b 14 24             	mov    edx,DWORD PTR [esp]
  408480:	89 f9                	mov    ecx,edi
  408482:	89 c6                	mov    esi,eax
  408484:	d3 ee                	shr    esi,cl
  408486:	89 d9                	mov    ecx,ebx
  408488:	d3 e0                	shl    eax,cl
  40848a:	89 f9                	mov    ecx,edi
  40848c:	d3 ea                	shr    edx,cl
  40848e:	89 d7                	mov    edi,edx
  408490:	89 f2                	mov    edx,esi
  408492:	09 c7                	or     edi,eax
  408494:	89 f8                	mov    eax,edi
  408496:	f7 f5                	div    ebp
  408498:	89 d6                	mov    esi,edx
  40849a:	89 c7                	mov    edi,eax
  40849c:	f7 64 24 04          	mul    DWORD PTR [esp+0x4]
  4084a0:	39 d6                	cmp    esi,edx
  4084a2:	72 2c                	jb     4084d0 <___udivdi3+0x100>
  4084a4:	8b 2c 24             	mov    ebp,DWORD PTR [esp]
  4084a7:	89 d9                	mov    ecx,ebx
  4084a9:	d3 e5                	shl    ebp,cl
  4084ab:	39 c5                	cmp    ebp,eax
  4084ad:	73 04                	jae    4084b3 <___udivdi3+0xe3>
  4084af:	39 d6                	cmp    esi,edx
  4084b1:	74 1d                	je     4084d0 <___udivdi3+0x100>
  4084b3:	89 f8                	mov    eax,edi
  4084b5:	31 d2                	xor    edx,edx
  4084b7:	e9 59 ff ff ff       	jmp    408415 <___udivdi3+0x45>
  4084bc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4084c0:	b8 01 00 00 00       	mov    eax,0x1
  4084c5:	e9 4b ff ff ff       	jmp    408415 <___udivdi3+0x45>
  4084ca:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4084d0:	8d 47 ff             	lea    eax,[edi-0x1]
  4084d3:	31 d2                	xor    edx,edx
  4084d5:	83 c4 14             	add    esp,0x14
  4084d8:	5b                   	pop    ebx
  4084d9:	5e                   	pop    esi
  4084da:	5f                   	pop    edi
  4084db:	5d                   	pop    ebp
  4084dc:	c3                   	ret    
  4084dd:	90                   	nop
  4084de:	90                   	nop
  4084df:	90                   	nop

004084e0 <_strdup>:
  4084e0:	ff 25 a0 e1 40 00    	jmp    DWORD PTR ds:0x40e1a0
  4084e6:	90                   	nop
  4084e7:	90                   	nop

004084e8 <_stricoll>:
  4084e8:	ff 25 a4 e1 40 00    	jmp    DWORD PTR ds:0x40e1a4
  4084ee:	90                   	nop
  4084ef:	90                   	nop

004084f0 <_main>:
  4084f0:	55                   	push   ebp
  4084f1:	89 e5                	mov    ebp,esp
  4084f3:	57                   	push   edi
  4084f4:	56                   	push   esi
  4084f5:	53                   	push   ebx
  4084f6:	bb 20 a1 07 00       	mov    ebx,0x7a120
  4084fb:	83 e4 f0             	and    esp,0xfffffff0
  4084fe:	83 ec 30             	sub    esp,0x30
  408501:	e8 7a 99 ff ff       	call   401e80 <___main>
  408506:	8d 74 24 10          	lea    esi,[esp+0x10]
  40850a:	e8 01 fc ff ff       	call   408110 <_clock>
  40850f:	89 c7                	mov    edi,eax
  408511:	89 34 24             	mov    DWORD PTR [esp],esi
  408514:	e8 c7 8e ff ff       	call   4013e0 <_encrypt>
  408519:	83 eb 01             	sub    ebx,0x1
  40851c:	75 f3                	jne    408511 <_main+0x21>
  40851e:	e8 ed fb ff ff       	call   408110 <_clock>
  408523:	c7 04 24 64 a0 40 00 	mov    DWORD PTR [esp],0x40a064
  40852a:	29 f8                	sub    eax,edi
  40852c:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  408530:	db 44 24 0c          	fild   DWORD PTR [esp+0xc]
  408534:	d8 35 7c a0 40 00    	fdiv   DWORD PTR ds:0x40a07c
  40853a:	dd 5c 24 04          	fstp   QWORD PTR [esp+0x4]
  40853e:	e8 d5 fb ff ff       	call   408118 <_printf>
  408543:	8d 65 f4             	lea    esp,[ebp-0xc]
  408546:	31 c0                	xor    eax,eax
  408548:	5b                   	pop    ebx
  408549:	5e                   	pop    esi
  40854a:	5f                   	pop    edi
  40854b:	5d                   	pop    ebp
  40854c:	c3                   	ret    
  40854d:	90                   	nop
  40854e:	90                   	nop
  40854f:	90                   	nop

00408550 <_register_frame_ctor>:
  408550:	55                   	push   ebp
  408551:	89 e5                	mov    ebp,esp
  408553:	83 ec 18             	sub    esp,0x18
  408556:	e8 a5 8d ff ff       	call   401300 <___gcc_register_frame>
  40855b:	c7 04 24 90 13 40 00 	mov    DWORD PTR [esp],0x401390
  408562:	e8 79 8d ff ff       	call   4012e0 <_atexit>
  408567:	c9                   	leave  
  408568:	c3                   	ret    
  408569:	90                   	nop
  40856a:	90                   	nop
  40856b:	90                   	nop
  40856c:	90                   	nop
  40856d:	90                   	nop
  40856e:	90                   	nop
  40856f:	90                   	nop

00408570 <__CTOR_LIST__>:
  408570:	ff                   	(bad)  
  408571:	ff                   	(bad)  
  408572:	ff                   	(bad)  
  408573:	ff 50 85             	call   DWORD PTR [eax-0x7b]

00408574 <.ctors.65535>:
  408574:	50                   	push   eax
  408575:	85 40 00             	test   DWORD PTR [eax+0x0],eax
  408578:	00 00                	add    BYTE PTR [eax],al
	...

0040857c <__DTOR_LIST__>:
  40857c:	ff                   	(bad)  
  40857d:	ff                   	(bad)  
  40857e:	ff                   	(bad)  
  40857f:	ff 00                	inc    DWORD PTR [eax]
  408581:	00 00                	add    BYTE PTR [eax],al
	...
