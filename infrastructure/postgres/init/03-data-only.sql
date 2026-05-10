COPY public."_AccountToContent" ("A", "B") FROM stdin;
4201e725-b491-47f1-b49e-0930aa6530cd	142be0ae-d466-4bc6-b5a6-698532ade71a
4201e725-b491-47f1-b49e-0930aa6530cd	0e17e72e-4167-41e9-a08b-cc12085824a5
4201e725-b491-47f1-b49e-0930aa6530cd	7f2034b2-80df-4be4-951f-7cd48785fc07
4201e725-b491-47f1-b49e-0930aa6530cd	c6f93285-5462-4c71-8bc2-a8028a67ed44
4201e725-b491-47f1-b49e-0930aa6530cd	f86d6349-3cec-4368-ad40-bbb7d1b621a2
4201e725-b491-47f1-b49e-0930aa6530cd	7d3a9849-f043-48e9-8555-e174f4a02f97
COPY public."_AccountToUser" ("A", "B") FROM stdin;
4cc5c22d-436a-4e3d-8f7f-ef51be999ef4	e6cc3a1d-6c69-4077-93a0-4ac003de1060
2ebd3f93-0620-46e0-b415-f89c2d067e45	e6cc3a1d-6c69-4077-93a0-4ac003de1060
5bdb9e80-5d3a-4fa2-857b-18b1c526519d	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
5bdb9e80-5d3a-4fa2-857b-18b1c526519d	e6cc3a1d-6c69-4077-93a0-4ac003de1060
60a9d67a-e653-4c78-a4a3-492f13f43916	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
60a9d67a-e653-4c78-a4a3-492f13f43916	e6cc3a1d-6c69-4077-93a0-4ac003de1060
0affcbeb-6ab5-4d86-a2ac-5e96dc3fa98f	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
0affcbeb-6ab5-4d86-a2ac-5e96dc3fa98f	e6cc3a1d-6c69-4077-93a0-4ac003de1060
37475525-9e6b-42cc-8dc8-3de96db08b6f	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
37475525-9e6b-42cc-8dc8-3de96db08b6f	e6cc3a1d-6c69-4077-93a0-4ac003de1060
8e069317-9f59-42ad-9487-7c69aa85224a	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
61d941b9-9f04-40df-aadd-361fcebad34d	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
96a4ff80-b849-4157-97b2-5011ef50c461	e6cc3a1d-6c69-4077-93a0-4ac003de1060
2ca6a531-7264-4d3c-8509-3b614cc117a4	e6cc3a1d-6c69-4077-93a0-4ac003de1060
8659a69f-9730-49c9-a966-0bd79da063a8	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
90d6b3b7-941a-4449-937a-5eeb4a7b43c4	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
COPY public._prisma_migrations (id, checksum, finished_at, migration_name, logs, rolled_back_at, started_at, applied_steps_count) FROM stdin;
73d45ec9-f924-418d-b4d5-cb27b1beeec8	9dc35d4bc8e683b208b09c8eff0516cc06d3a321c2a59ccdaa44f6ee0f34c1f9	2026-04-29 03:56:34.501693+00	20260429035634_add_comment_user_relation	\N	\N	2026-04-29 03:56:34.489893+00	1
9a940f72-f319-474a-aed0-571660f782e2	9534babcaa3931a75022c693147adbf41d0373200be98613ea6282f33748ee31	2026-04-29 06:25:07.14599+00	20260429062507_add_account_fields	\N	\N	2026-04-29 06:25:07.137723+00	1
4dcce6e4-1d22-4e83-9a87-4df696620d21	4879331396ab58aee3f0d7288e9ce9be236125856045cb04c025e5b66d73d251	2026-04-29 07:48:40.691667+00	20260429074840_add_content_script_and_type	\N	\N	2026-04-29 07:48:40.684334+00	1
53c11c24-04e0-43bb-bb56-8ee9e40e3f97	ec9cf9be5097eb3497bf80445a9411b7fe0bd942aaaed1b65808898a5cdaf7de	2026-04-29 08:50:19.798399+00	20260429085019_add_account_custom_group	\N	\N	2026-04-29 08:50:19.787306+00	1
39f16966-17f4-417d-8e50-adecc598ca10	6ec00e6e4421407b5122c560d21d8735e013e0bdaca9c1153767e23daac21107	2026-04-29 09:08:25.149026+00	20260429090825_refactor_topic_fields	\N	\N	2026-04-29 09:08:25.136535+00	1
COPY public.account_groups (id, name, description, created_at, updated_at) FROM stdin;
76d171cd-f9e9-469f-9c9d-bd575389fa70	第一组	Danny负责 - Facebook/Instagram/TikTok/YouTube	2026-04-29 06:42:37.845	2026-04-29 06:42:37.845
8fb2b0e7-5965-4c13-a07d-3beb5b410fe3	第二组	Danny负责 - Boswindor Building Material 混剪账号02	2026-04-29 06:53:31.174	2026-04-29 06:53:31.174
3c997727-058f-4233-be9d-ae1dea7b46c9	第三组	Benny负责 - boswindor factory 副账号	2026-04-29 07:01:15.255	2026-04-29 07:01:15.255
36300c9f-2c11-4e06-9ebd-2632a3169f85	第四组	Danny负责 - Boswindor PremiumDoors 副账号	2026-04-29 07:07:07.522	2026-04-29 07:07:07.522
COPY public.accounts (id, platform, name, account_id, home_url, market, target_audience, status, persona, contact_info, group_id, tags, created_at, updated_at, account_type, common_devices, linked_phone, login_email, login_password, login_phone, registered_at, remark, follower_count, custom_group) FROM stdin;
4201e725-b491-47f1-b49e-0930aa6530cd	YOUTUBE	boswindor.lulu	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.441	2026-04-29 09:51:38.441	\N	\N	\N	info@boswindor.com	Bos123$%	17329524698	\N	\N	37	\N
61d941b9-9f04-40df-aadd-361fcebad34d	YOUTUBE	Boswindor Building Material	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.345	2026-04-30 06:47:22.225	混剪账号02	\N	\N	bhe05798@gmail.com	Boswindor250331+	18126652290	\N	\N	3180	Danny 2
96a4ff80-b849-4157-97b2-5011ef50c461	INSTAGRAM	Boswindor doors and window	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.402	2026-04-30 06:47:55.287	混剪账号01	\N	\N	boswindor01@outlook.com	Boswindor123$%	\N	\N	\N	0	Benny 2
2ca6a531-7264-4d3c-8509-3b614cc117a4	YOUTUBE	Boswindor doors and window	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.396	2026-04-30 06:48:01.229	混剪账号01	\N	\N	boswindor05@gmail.com	Boswindor05$.@	18825938997	\N	邮箱密码	0	Benny 2
8659a69f-9730-49c9-a966-0bd79da063a8	FACEBOOK	Boswindor PremiumDoors	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.422	2026-04-30 06:49:09.462	副公共主页	\N	\N	boswindor06@gmail.com	Boswindor06$.	18126652290	\N	\N	0	Danny 1
4cc5c22d-436a-4e3d-8f7f-ef51be999ef4	INSTAGRAM	boswindor_factory	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.37	2026-04-30 06:30:25.995	副账号01	\N	\N	zzhu96663@gmail.com	Bos123456	17329524698	\N	ins使用账号名称登陆账号	22	Benny 1
2ebd3f93-0620-46e0-b415-f89c2d067e45	TIKTOK	boswindor_factory	\N	\N	\N	\N	PAUSED	\N	\N	\N	\N	2026-04-29 09:51:38.386	2026-04-30 06:30:31.851	副账号01	\N	\N	Sienna4698@outlook.com	Bos123456	17329524698	\N	忘记密码，建议重新注册一个tk账号	0	Benny 1
5bdb9e80-5d3a-4fa2-857b-18b1c526519d	FACEBOOK	Foshan Boswindor Window and Door Limited	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.299	2026-04-30 06:33:35.73	主公共主页	\N	\N	wudake264@gmail.com	Bos2025$	18681475702	\N	\N	553	Danny Benny
60a9d67a-e653-4c78-a4a3-492f13f43916	INSTAGRAM	boswindor_limited	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.312	2026-04-30 06:33:51.644	主账户	\N	\N	boswindor@gmail.com	Boswindor888888	\N	\N	\N	570	Danny Benny
0affcbeb-6ab5-4d86-a2ac-5e96dc3fa98f	TIKTOK	china_window_door	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.329	2026-04-30 06:34:01.87	主账户	\N	\N	zzhu96663@gmail.com	Bos123456	17329524698	\N	\N	1258	Danny Benny
37475525-9e6b-42cc-8dc8-3de96db08b6f	YOUTUBE	Foshan Boswindor Window and Door Limited	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.322	2026-04-30 06:34:11.17	主账户	\N	\N	boswindor@gmail.com	Boswindor123$%	\N	\N	\N	74	Danny Benny
8e069317-9f59-42ad-9487-7c69aa85224a	INSTAGRAM	Boswindor Building Material	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.353	2026-04-30 06:34:55.172	混剪账号02	\N	\N	zzhu96663@gmail.com	Bos123456	17329524698	\N	ins账号都要用用户名登录	26	Danny 2
90d6b3b7-941a-4449-937a-5eeb4a7b43c4	YOUTUBE	Boswindor PremiumDoors	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.414	2026-04-30 06:49:31.364	副账号	\N	\N	boswindor06@gmail.com	Boswindor06$.	18126652290	\N	\N	7	Danny 1
COPY public.content_comments (id, content_id, user_id, content, created_at) FROM stdin;
COPY public.content_data (id, content_id, account_id, views, likes, comments, shares, favorites, completion_rate, followers_gained, total_followers, dm_leads, comment_leads, profile_clicks, valid_leads, record_date, created_at) FROM stdin;
COPY public.contents (id, title, topic_id, operator_id, status, planned_publish_at, actual_publish_at, publish_url, description, attachments, production_time_hours, rating, remark, created_at, updated_at, content_type, script) FROM stdin;
4fed6aa2-97a6-425a-b82c-8112e69d232a	门窗五金配件介绍-04-29-6	\N	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8	PENDING	2026-04-29 11:50:00	\N	\N	测试数据：2026-04-29 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.732	2026-04-30 14:50:45.732	repost	\N
8d7cbca9-bba2-4a04-adb9-9080409ff0f6	批量内容1	\N	\N	PENDING	\N	\N	\N	\N	\N	\N	\N	\N	2026-04-29 09:43:54.89	2026-04-29 09:43:54.89	product_showcase	\N
54ea072e-a7eb-4309-8b00-1228b77a372f	批量内容2	\N	\N	PENDING	\N	\N	\N	\N	\N	\N	\N	\N	2026-04-29 09:43:54.895	2026-04-29 09:43:54.895	installation_guide	\N
695d6c93-a44f-4b3b-8dad-cf8389967a4e	合作伙伴案例展示-04-29-9	\N	e6cc3a1d-6c69-4077-93a0-4ac003de1060	PENDING	2026-04-29 12:29:00	\N	\N	测试数据：2026-04-29 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.783	2026-04-30 14:50:45.783	repost	\N
22bafd5e-eabd-40bb-88bb-90e8141ea2ee	断桥铝门窗安装教程-04-29-10	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	PENDING	2026-04-29 11:41:00	\N	\N	测试数据：2026-04-29 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.798	2026-04-30 14:50:45.798	repost	\N
48b20d22-eda3-4402-bf6e-694d6e08980d	门窗隔音效果实测-04-30-2	\N	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8	PENDING	2026-04-30 09:41:00	\N	\N	测试数据：2026-04-30 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.833	2026-04-30 14:50:45.833	repost	\N
142be0ae-d466-4bc6-b5a6-698532ade71a	谢谢小星星	\N	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8	PENDING	2026-04-30 00:00:00	\N	https://www.instagram.com/reels/DXZM9voGLG3/	\N	\N	\N	\N	\N	2026-04-30 14:45:01.074	2026-04-30 14:45:01.074	\N	\N
6eb8a465-035c-4176-86dc-9d637c01980c	门窗质检过程揭秘-04-30-3	\N	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8	PENDING	2026-04-30 18:45:00	\N	\N	测试数据：2026-04-30 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.856	2026-04-30 14:50:45.856	repost	\N
0e17e72e-4167-41e9-a08b-cc12085824a5	464yukyuk	\N	e6cc3a1d-6c69-4077-93a0-4ac003de1060	PENDING	2026-04-29 00:00:00	\N	https://www.youtube.com/shorts/0B04YX94gv8	十大歌手帝国时代根深蒂固	\N	\N	\N	sdfgsdgsd	2026-04-29 08:25:07.266	2026-04-30 14:45:41.252	塑料袋福建省	到底是根深蒂固
7f9fa9ce-0af2-4c25-917a-63b73faa51f5	test	\N	e6cc3a1d-6c69-4077-93a0-4ac003de1060	PENDING	2026-04-28 00:00:00	\N	https://www.tiktok.com/@nataliireynoldss/video/7618407968077335838?is_from_webapp=1&sender_device=pc	\N	\N	\N	\N	\N	2026-04-30 14:46:43.379	2026-04-30 14:46:43.379	\N	\N
39ca1052-7a36-4f33-ad0b-47dd6a8b68c8	测试内容	\N	\N	PENDING	2026-04-29 10:00:00	\N	\N	\N	\N	\N	\N	\N	2026-04-30 14:50:12.289	2026-04-30 14:50:12.289	\N	\N
0ca080bd-f14e-418d-8391-028b964e5846	定制流程全记录-04-27-2	\N	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8	PENDING	2026-04-27 16:48:00	\N	\N	测试数据：2026-04-27 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.593	2026-04-30 14:50:45.593	repost	\N
9971059a-3425-476a-8d0c-1b028b7ab21a	售后服务流程介绍-04-29-1	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	PENDING	2026-04-29 17:56:00	\N	\N	测试数据：2026-04-29 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.641	2026-04-30 14:50:45.641	original	\N
0265ba15-07f1-4547-b633-2447c8d11e34	定制流程全记录-04-29-4	\N	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8	PENDING	2026-04-29 14:38:00	\N	\N	测试数据：2026-04-29 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.692	2026-04-30 14:50:45.692	original	\N
7f2034b2-80df-4be4-951f-7cd48785fc07	Low-E玻璃节能效果-04-29-5	\N	e6cc3a1d-6c69-4077-93a0-4ac003de1060	PENDING	2026-04-29 17:27:00	\N	\N	测试数据：2026-04-29 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.712	2026-04-30 14:50:45.712	original	\N
81a0a235-c0ba-4173-8aea-bbedc6efbb7c	阳光房设计案例分享-04-30-4	\N	e6cc3a1d-6c69-4077-93a0-4ac003de1060	PENDING	2026-04-30 17:16:00	\N	\N	测试数据：2026-04-30 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.872	2026-04-30 14:50:45.872	repost	\N
3c74d3f1-f2de-4dbc-9ef0-b2da08688b48	玻璃种类与选购指南-05-01-1	\N	e6cc3a1d-6c69-4077-93a0-4ac003de1060	PENDING	2026-05-01 09:17:00	\N	\N	测试数据：2026-05-01 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.893	2026-04-30 14:50:45.893	original	\N
413ec705-2b35-48d6-8c58-35b2cef35f69	门窗行业趋势分析-05-01-4	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	PENDING	2026-05-01 09:58:00	\N	\N	测试数据：2026-05-01 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.952	2026-04-30 14:50:45.952	repost	\N
7d3a9849-f043-48e9-8555-e174f4a02f97	阳光房设计案例分享-05-01-5	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	PENDING	2026-05-01 11:09:00	\N	\N	测试数据：2026-05-01 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.969	2026-04-30 14:50:45.969	repost	\N
93a01f43-8443-4caa-8aed-3ab227260ea6	断桥铝vs普通铝合金对比-05-02-1	\N	e6cc3a1d-6c69-4077-93a0-4ac003de1060	PENDING	2026-05-02 11:14:00	\N	\N	测试数据：2026-05-02 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.986	2026-04-30 14:50:45.986	original	\N
04e0f45a-6f8c-468d-b731-031293594823	门窗行业趋势分析-05-02-2	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	PENDING	2026-05-02 18:11:00	\N	\N	测试数据：2026-05-02 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:46.004	2026-04-30 14:50:46.004	original	\N
COPY public.dictionaries (id, category, code, name, sort_order, is_active, created_at, updated_at) FROM stdin;
4eeca42a-6bbb-4361-adad-e341aa8f8752	content_type	installation	安装案例	0	t	2026-04-29 03:34:24.811	2026-04-29 03:34:24.811
2a59ae32-7fb4-44b3-a7cc-ecdb3b2bcc42	market	north_america	北美	0	t	2026-04-29 03:34:24.811	2026-04-29 03:34:24.811
7214c964-6d8c-4fe5-8986-329c2041836b	market	europe	欧洲	0	t	2026-04-29 03:34:24.811	2026-04-29 03:34:24.811
COPY public.leads (id, source_platform, source_content_id, source_account_id, operator_id, lead_time, customer_name, customer_contact, requirement, status, is_valid, valid_confirmed_by, valid_confirmed_at, deal_amount, remark, created_at, updated_at) FROM stdin;
COPY public.materials (id, name, nas_path, thumbnail_path, category, tags, description, file_type, file_size, usage_count, is_sensitive, allowed_roles, created_by, created_at, updated_at) FROM stdin;
COPY public.notifications (id, user_id, type, title, content, is_read, link, created_at) FROM stdin;
COPY public.operation_logs (id, user_id, username, action, resource, resource_id, detail, ip_address, user_agent, created_at) FROM stdin;
COPY public.topics (id, title, content_form, tags, product_type, content_type, source, status, usage_count, remark, created_by, created_at, updated_at, completed_at, is_completed, operator_id, published_accounts, copywriting, script) FROM stdin;
633788c7-47ac-4b26-a204-1e764cf03ff5	How we pack aluminum windows and doors for sea shipping	SHORT_VIDEO	{aluminum_window,shipping}	\N	factory_tour	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:24.933	2026-04-29 09:03:24.933	\N	f	\N	\N	\N	\N
7757c039-d488-495d-bee6-2d4bc558e451	What should Australian builders check before ordering windows from China?	SHORT_VIDEO	{china,australia}	\N	review	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:24.944	2026-04-29 09:03:24.944	\N	f	\N	\N	\N	\N
63cda07a-5df9-49cb-a8bb-4acaefdb1c6f	What Does a Reliable Window Factory Look Like?	SHORT_VIDEO	{factory}	\N	factory_tour	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:24.957	2026-04-29 09:03:24.957	\N	f	\N	\N	\N	\N
2f2adb04-264e-4fab-845c-7313cc8fa2f2	How Are Windows Packed for Overseas Shipping?	SHORT_VIDEO	{shipping}	\N	factory_tour	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:24.97	2026-04-29 09:03:24.97	\N	f	\N	\N	\N	\N
1b12eab6-8f77-4a5b-887e-0617f289dcc1	What Happens Before Aluminum Windows Are Loaded into Containers?	SHORT_VIDEO	{aluminum_window}	\N	factory_tour	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:24.976	2026-04-29 09:03:24.976	\N	f	\N	\N	\N	\N
545c09d2-e063-48e9-901b-03f9c42e0665	Why Does Aluminum Profile Thickness Matter?	SHORT_VIDEO	{}	\N	review	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:24.991	2026-04-29 09:03:24.991	\N	f	\N	\N	\N	\N
453a6412-de56-412e-86a0-f39491f92a3c	How Does Low-E Glass Work?	SHORT_VIDEO	{low_e_glass}	\N	knowledge	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25	2026-04-29 09:03:25	\N	f	\N	\N	\N	\N
6c0a6d7a-664a-4cd1-ba9d-82b5b916515c	How Do Multi-Point Locks Improve Window Security?	SHORT_VIDEO	{security}	\N	review	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.011	2026-04-29 09:03:25.011	\N	f	\N	\N	\N	\N
1315950f-9c48-4ce2-9ea4-0dba36eae49b	What Hardware Should Good Aluminum Windows Use?	SHORT_VIDEO	{aluminum_window}	\N	review	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.016	2026-04-29 09:03:25.016	\N	f	\N	\N	\N	\N
29532783-cde7-40c0-b9e0-4c7326974262	Single Glass or Double Glazing: Which Should You Choose?	SHORT_VIDEO	{double_glazing}	\N	comparison	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.034	2026-04-29 09:03:25.034	\N	f	\N	\N	\N	\N
8412b151-a7a3-4f61-8304-e56fd702a01a	Regular Windows or Impact Windows: What Is the Difference?	SHORT_VIDEO	{impact_window}	\N	comparison	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.038	2026-04-29 09:03:25.038	\N	f	\N	\N	\N	\N
3bbd83f8-e055-4b0f-adf2-ee43aef3e208	How Do Aluminum Windows Look After Installation?	SHORT_VIDEO	{aluminum_window,installation}	\N	installation	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.05	2026-04-29 09:03:25.05	\N	f	\N	\N	\N	\N
1abf123a-b484-483e-9ea4-87d175ff74ab	What Windows Did This Villa Project Use?	SHORT_VIDEO	{villa}	\N	installation	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.055	2026-04-29 09:03:25.055	\N	f	\N	\N	\N	\N
79fd9b69-ca6c-4a6c-b69a-684b29e05e58	How Were These Custom Windows Produced for an Overseas Client?	SHORT_VIDEO	{custom}	\N	factory_tour	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.069	2026-04-29 09:03:25.069	\N	f	\N	\N	\N	\N
93d37ddd-3ed7-4c7f-965d-b58044851154	Why Did This Contractor Choose Factory-Direct Aluminum Windows?	SHORT_VIDEO	{aluminum_window,factory}	\N	factory_tour	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.074	2026-04-29 09:03:25.074	\N	f	\N	\N	\N	\N
6a686f7f-5455-4a9c-82b0-6349b72bc674	Where can I find aluminum window manufacturers?	SHORT_VIDEO	{aluminum_window}	\N	buying_guide	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.084	2026-04-29 09:03:25.084	\N	f	\N	\N	\N	\N
1d0580a4-0fd0-43b3-ba42-172a7fade756	How do I find a reliable window and door manufacturer?	SHORT_VIDEO	{}	\N	comparison	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.09	2026-04-29 09:03:25.09	\N	f	\N	\N	\N	\N
298b1cd2-6794-45e4-b44a-e6041624cb9b	Where can contractors buy wholesale windows and doors?	SHORT_VIDEO	{}	\N	buying_guide	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.094	2026-04-29 09:03:25.094	\N	f	\N	\N	\N	\N
513421a3-60ed-4675-bfd8-dd70818eeebf	Is factory-direct window supply cheaper than local retail?	SHORT_VIDEO	{factory}	\N	factory_tour	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.1	2026-04-29 09:03:25.1	\N	f	\N	\N	\N	\N
17a2a2ad-48b4-41be-a29b-02161daddf69	How can builders import windows and doors from China?	SHORT_VIDEO	{china}	\N	buying_guide	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.105	2026-04-29 09:03:25.105	\N	f	\N	\N	\N	\N
95d53b17-9c33-4505-8e4e-3d7ea3c2435f	How do I verify a Chinese aluminum window supplier?	SHORT_VIDEO	{aluminum_window}	\N	buying_guide	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.117	2026-04-29 09:03:25.117	\N	f	\N	\N	\N	\N
06fd7fde-ca1e-4879-a5f0-9a67233bb7e7	Are aluminum windows better than vinyl windows?	SHORT_VIDEO	{aluminum_window,vinyl}	\N	comparison	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.136	2026-04-29 09:03:25.136	\N	f	\N	\N	\N	\N
77a9739e-1673-4a96-99c3-a9e4e1b59cad	Are thermal break aluminum windows worth it?	SHORT_VIDEO	{aluminum_window,thermal_break}	\N	knowledge	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.149	2026-04-29 09:03:25.149	\N	f	\N	\N	\N	\N
9909b30f-6bda-4060-a8b9-b6d2cf8f370c	What are the best aluminum sliding windows?	SHORT_VIDEO	{sliding_window}	\N	knowledge	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.155	2026-04-29 09:03:25.155	\N	f	\N	\N	\N	\N
036f7df9-d018-421f-aec0-c689a1401e47	How do I choose aluminum patio doors?	SHORT_VIDEO	{patio_door}	\N	buying_guide	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.169	2026-04-29 09:03:25.169	\N	f	\N	\N	\N	\N
4ae5eaaa-6233-48d4-af11-49692f360100	What aluminum profile thickness is best for windows?	SHORT_VIDEO	{}	\N	review	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.174	2026-04-29 09:03:25.174	\N	f	\N	\N	\N	\N
1761dc3e-518b-4f84-bb5e-34bceb54846e	How much do aluminum windows cost?	SHORT_VIDEO	{aluminum_window,cost}	\N	pricing	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.177	2026-04-29 09:03:25.177	\N	f	\N	\N	\N	\N
5e569e17-e23b-4063-a020-7efe12a7ac69	Why do window prices vary so much?	SHORT_VIDEO	{price}	\N	pricing	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.179	2026-04-29 09:03:25.179	\N	f	\N	\N	\N	\N
9c4177de-4c3e-4abd-819a-43bf4f455446	How can contractors reduce window costs?	SHORT_VIDEO	{cost}	\N	pricing	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.19	2026-04-29 09:03:25.19	\N	f	\N	\N	\N	\N
3e10f011-8db8-4e8f-b276-34ca2ae2f614	How much do impact windows cost?	SHORT_VIDEO	{impact_window,cost}	\N	pricing	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.2	2026-04-29 09:03:25.2	\N	f	\N	\N	\N	\N
77303e1d-d121-4b3b-874c-03eb11364734	How does bulk ordering affect window prices?	SHORT_VIDEO	{price,bulk_order}	\N	pricing	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.204	2026-04-29 09:03:25.204	\N	f	\N	\N	\N	\N
4a83b7e1-3dc4-47d6-bdc9-0b2ba767eb85	What are the risks of buying cheap windows?	SHORT_VIDEO	{}	\N	pricing	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.208	2026-04-29 09:03:25.208	\N	f	\N	\N	\N	\N
385ee5fd-0e67-49dc-910a-088e745c910a	What are impact windows?	SHORT_VIDEO	{impact_window}	\N	knowledge	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.225	2026-04-29 09:03:25.225	\N	f	\N	\N	\N	\N
5ae0496a-f9f8-449d-b328-f213e0a70f25	What is the difference between impact windows and regular windows?	SHORT_VIDEO	{impact_window}	\N	comparison	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.229	2026-04-29 09:03:25.229	\N	f	\N	\N	\N	\N
84ee192c-6e52-4b99-ad99-82ec261620ec	Are impact windows worth it in Florida?	SHORT_VIDEO	{impact_window,florida}	\N	knowledge	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.233	2026-04-29 09:03:25.233	\N	f	\N	\N	\N	\N
21a93805-7557-4133-90e2-78c16363dc09	How do I choose windows for a commercial project?	SHORT_VIDEO	{commercial}	\N	comparison	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.237	2026-04-29 09:03:25.237	\N	f	\N	\N	\N	\N
6e410ba9-3128-44a6-bbdf-1ba734ad844e	Where can I find commercial aluminum window manufacturers?	SHORT_VIDEO	{aluminum_window,commercial}	\N	buying_guide	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.242	2026-04-29 09:03:25.242	\N	f	\N	\N	\N	\N
9539df2b-e531-44a7-86e1-38d3d81bfe6b	Modern aluminum window designs	SHORT_VIDEO	{aluminum_window,custom}	\N	工厂实拍	\N	PENDING	0	wegweg	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:25.254	2026-04-30 06:16:26.512	2026-04-30 00:00:00	t	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8	d5cb501d-673d-4fd3-8887-e6b41abe8f9e	wegweg	wegweg
COPY public.users (id, username, password_hash, real_name, role, email, phone, avatar, status, created_at, updated_at) FROM stdin;
22f85b94-9b07-42b6-8e2c-2d5df13694ee	admin	$2b$10$BIP7lJ/R/A5IgizlTZFn4.0Zz/GE/l0g40W7xi9FuCBql0QvA0.g2	超级管理员	SUPER_ADMIN	admin@factory.com	\N	\N	ACTIVE	2026-04-29 03:34:24.79	2026-04-29 03:34:24.79
8fda33c9-5ef6-473b-8419-d9cd5db3ffe8	danny	$2b$10$BUL9wZlwSWtaQvcbgeAMLuXUkqyciwt0ovgr9mrVCFmUHcnFiKw7W	Danny	OPERATOR	danny@factory.com	\N	\N	ACTIVE	2026-04-29 06:37:17.782	2026-04-29 06:37:17.782
