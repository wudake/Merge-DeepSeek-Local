BEGIN;
SET session_replication_role = 'replica';
COPY public.users (id, username, password_hash, real_name, role, email, phone, avatar, status, created_at, updated_at) FROM stdin;
22f85b94-9b07-42b6-8e2c-2d5df13694ee	admin	$2b$10$BIP7lJ/R/A5IgizlTZFn4.
COPY public.account_groups (id, name, description, created_at, updated_at) FROM stdin;
76d171cd-f9e9-469f-9c9d-bd575389fa70	第一组	Danny负责 - Facebook/Instagram/TikTok/YouTube	2026-04-29 06:42:37.
COPY public.accounts (id, platform, name, account_id, home_url, market, target_audience, status, persona, contact_info, group_id, tags, created_at, updated_at, account_type, common_devices, linked_phone, login_email, login_password, login_phone, registered_at, remark, follower_count, custom_group) FROM stdin;
d5cb501d-673d-4fd3-8887-e6b41abe8f9e	INSTAGRAM	boswindordoorswindowsfactory	\N	\N	\N	\N	ACTIVE	\N	\N	\N	\N	2026-04-29 09:51:38.
COPY public.dictionaries (id, category, code, name, sort_order, is_active, created_at, updated_at) FROM stdin;
c3c2dfe8-54f7-4cfc-a856-5b4731e4c3f5	product_type	bridge_aluminum	断桥铝	0	t	2026-04-29 03:34:24.
COPY public.topics (id, title, content_form, tags, product_type, content_type, source, status, usage_count, remark, created_by, created_at, updated_at, completed_at, is_completed, operator_id, published_accounts, copywriting, script) FROM stdin;
633788c7-47ac-4b26-a204-1e764cf03ff5	How we pack aluminum windows and doors for sea shipping	SHORT_VIDEO	{aluminum_window,shipping}	\N	factory_tour	\N	PENDING	0	\N	22f85b94-9b07-42b6-8e2c-2d5df13694ee	2026-04-29 09:03:24.
COPY public.contents (id, title, topic_id, operator_id, status, planned_publish_at, actual_publish_at, publish_url, description, attachments, production_time_hours, rating, remark, created_at, updated_at, content_type, script) FROM stdin;
4fed6aa2-97a6-425a-b82c-8112e69d232a	门窗五金配件介绍-04-29-6	\N	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8	PENDING	2026-04-29 11:50:00	\N	\N	测试数据：2026-04-29 发布的内容	\N	\N	\N	\N	2026-04-30 14:50:45.
COPY public.leads (id, source_platform, source_content_id, source_account_id, operator_id, lead_time, customer_name, customer_contact, requirement, status, is_valid, valid_confirmed_by, valid_confirmed_at, deal_amount, remark, created_at, updated_at) FROM stdin;
\.
COPY public.materials (id, name, nas_path, thumbnail_path, category, tags, description, file_type, file_size, usage_count, is_sensitive, allowed_roles, created_by, created_at, updated_at) FROM stdin;
\.
COPY public.notifications (id, user_id, type, title, content, is_read, link, created_at) FROM stdin;
\.
COPY public.operation_logs (id, user_id, username, action, resource, resource_id, detail, ip_address, user_agent, created_at) FROM stdin;
\.
COPY public.content_comments (id, content_id, user_id, content, created_at) FROM stdin;
\.
COPY public.content_data (id, content_id, account_id, views, likes, comments, shares, favorites, completion_rate, followers_gained, total_followers, dm_leads, comment_leads, profile_clicks, valid_leads, record_date, created_at) FROM stdin;
\.
COPY public."_AccountToContent" ("A", "B") FROM stdin;
4201e725-b491-47f1-b49e-0930aa6530cd	142be0ae-d466-4bc6-b5a6-698532ade71a
4201e725-b491-47f1-b49e-0930aa6530cd	0e17e72e-4167-41e9-a08b-cc12085824a5
ed0c6902-fcfc-4162-b45b-401667d7b95a	0e17e72e-4167-41e9-a08b-cc12085824a5
ed0c6902-fcfc-4162-b45b-401667d7b95a	7f9fa9ce-0af2-4c25-917a-63b73faa51f5
ed0c6902-fcfc-4162-b45b-401667d7b95a	39ca1052-7a36-4f33-ad0b-47dd6a8b68c8
ec3b93f1-5ca9-49b4-8e2b-e6b7403d121f	e8e310d9-f932-4927-841d-5c923c08ed4a
ed0c6902-fcfc-4162-b45b-401667d7b95a	0ca080bd-f14e-418d-8391-028b964e5846
ec3b93f1-5ca9-49b4-8e2b-e6b7403d121f	f0513cc3-95b8-4e24-b66d-ee4febd4d28f
ed0c6902-fcfc-4162-b45b-401667d7b95a	c1fea9ef-a046-4319-9f1e-c02be0243a37
ec3b93f1-5ca9-49b4-8e2b-e6b7403d121f	9971059a-3425-476a-8d0c-1b028b7ab21a
b16620f7-2db8-4795-adf7-a38be56e7aae	c563473d-0fc7-45cf-b35e-7d07947231d3
d5cb501d-673d-4fd3-8887-e6b41abe8f9e	aadf08cc-509c-4fa7-9bd7-56010efeb89c
d5cb501d-673d-4fd3-8887-e6b41abe8f9e	0265ba15-07f1-4547-b633-2447c8d11e34
4201e725-b491-47f1-b49e-0930aa6530cd	7f2034b2-80df-4be4-951f-7cd48785fc07
d5cb501d-673d-4fd3-8887-e6b41abe8f9e	4fed6aa2-97a6-425a-b82c-8112e69d232a
b16620f7-2db8-4795-adf7-a38be56e7aae	a8255f7a-ba2a-47b9-8be8-1c40f0f880fb
b16620f7-2db8-4795-adf7-a38be56e7aae	dd6d6cff-284b-42bf-b91f-3b0bef952ab9
b16620f7-2db8-4795-adf7-a38be56e7aae	695d6c93-a44f-4b3b-8dad-cf8389967a4e
b16620f7-2db8-4795-adf7-a38be56e7aae	22bafd5e-eabd-40bb-88bb-90e8141ea2ee
4201e725-b491-47f1-b49e-0930aa6530cd	c6f93285-5462-4c71-8bc2-a8028a67ed44
b16620f7-2db8-4795-adf7-a38be56e7aae	48b20d22-eda3-4402-bf6e-694d6e08980d
d5cb501d-673d-4fd3-8887-e6b41abe8f9e	6eb8a465-035c-4176-86dc-9d637c01980c
b16620f7-2db8-4795-adf7-a38be56e7aae	81a0a235-c0ba-4173-8aea-bbedc6efbb7c
b16620f7-2db8-4795-adf7-a38be56e7aae	3c74d3f1-f2de-4dbc-9ef0-b2da08688b48
4201e725-b491-47f1-b49e-0930aa6530cd	f86d6349-3cec-4368-ad40-bbb7d1b621a2
d5cb501d-673d-4fd3-8887-e6b41abe8f9e	b965c06b-19e0-4eef-9fc8-f5d4ea108937
ec3b93f1-5ca9-49b4-8e2b-e6b7403d121f	413ec705-2b35-48d6-8c58-35b2cef35f69
4201e725-b491-47f1-b49e-0930aa6530cd	7d3a9849-f043-48e9-8555-e174f4a02f97
ed0c6902-fcfc-4162-b45b-401667d7b95a	93a01f43-8443-4caa-8aed-3ab227260ea6
d5cb501d-673d-4fd3-8887-e6b41abe8f9e	04e0f45a-6f8c-468d-b731-031293594823
\.
COPY public."_AccountToUser" ("A", "B") FROM stdin;
ec3b93f1-5ca9-49b4-8e2b-e6b7403d121f	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
ae540c97-8e38-4445-9300-75c8262cba1e	e6cc3a1d-6c69-4077-93a0-4ac003de1060
4cc5c22d-436a-4e3d-8f7f-ef51be999ef4	e6cc3a1d-6c69-4077-93a0-4ac003de1060
2ebd3f93-0620-46e0-b415-f89c2d067e45	e6cc3a1d-6c69-4077-93a0-4ac003de1060
d5ebd5a3-4e8c-47d0-acfc-ef9ece241473	e6cc3a1d-6c69-4077-93a0-4ac003de1060
5bdb9e80-5d3a-4fa2-857b-18b1c526519d	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
5bdb9e80-5d3a-4fa2-857b-18b1c526519d	e6cc3a1d-6c69-4077-93a0-4ac003de1060
60a9d67a-e653-4c78-a4a3-492f13f43916	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
60a9d67a-e653-4c78-a4a3-492f13f43916	e6cc3a1d-6c69-4077-93a0-4ac003de1060
0affcbeb-6ab5-4d86-a2ac-5e96dc3fa98f	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
0affcbeb-6ab5-4d86-a2ac-5e96dc3fa98f	e6cc3a1d-6c69-4077-93a0-4ac003de1060
37475525-9e6b-42cc-8dc8-3de96db08b6f	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
37475525-9e6b-42cc-8dc8-3de96db08b6f	e6cc3a1d-6c69-4077-93a0-4ac003de1060
8e069317-9f59-42ad-9487-7c69aa85224a	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
af19136f-b4b1-4d14-882b-45d173270cd1	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
61d941b9-9f04-40df-aadd-361fcebad34d	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
96a4ff80-b849-4157-97b2-5011ef50c461	e6cc3a1d-6c69-4077-93a0-4ac003de1060
2ca6a531-7264-4d3c-8509-3b614cc117a4	e6cc3a1d-6c69-4077-93a0-4ac003de1060
8659a69f-9730-49c9-a966-0bd79da063a8	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
e1fff405-11da-458f-8269-45af816e8637	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
90d6b3b7-941a-4449-937a-5eeb4a7b43c4	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
b16620f7-2db8-4795-adf7-a38be56e7aae	8fda33c9-5ef6-473b-8419-d9cd5db3ffe8
\.
SET session_replication_role = 'origin';
COMMIT;