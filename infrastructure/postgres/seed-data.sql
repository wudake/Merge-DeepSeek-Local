--
-- PostgreSQL database dump
--

\restrict AmIKLCTs8dg8dweLYOBavgVuNWa5c7ZHzhyknvcNpgacfxfPAcKuIIubxiDRWcf

-- Dumped from database version 16.13
-- Dumped by pg_dump version 16.13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: account_groups; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO public.account_groups VALUES ('76d171cd-f9e9-469f-9c9d-bd575389fa70', '第一组', 'Danny负责 - Facebook/Instagram/TikTok/YouTube', '2026-04-29 06:42:37.845', '2026-04-29 06:42:37.845');
INSERT INTO public.account_groups VALUES ('8fb2b0e7-5965-4c13-a07d-3beb5b410fe3', '第二组', 'Danny负责 - Boswindor Building Material 混剪账号02', '2026-04-29 06:53:31.174', '2026-04-29 06:53:31.174');
INSERT INTO public.account_groups VALUES ('3c997727-058f-4233-be9d-ae1dea7b46c9', '第三组', 'Benny负责 - boswindor factory 副账号', '2026-04-29 07:01:15.255', '2026-04-29 07:01:15.255');
INSERT INTO public.account_groups VALUES ('36300c9f-2c11-4e06-9ebd-2632a3169f85', '第四组', 'Danny负责 - Boswindor PremiumDoors 副账号', '2026-04-29 07:07:07.522', '2026-04-29 07:07:07.522');


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO public.accounts VALUES ('d5cb501d-673d-4fd3-8887-e6b41abe8f9e', 'INSTAGRAM', 'boswindordoorswindowsfactory', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.436', '2026-04-29 09:51:38.436', NULL, NULL, NULL, 'boswindor02@outlook.com', 'Boswindor123$%', NULL, NULL, '绑定了购买账号广告主页（邮箱登录）', 0, NULL);
INSERT INTO public.accounts VALUES ('4201e725-b491-47f1-b49e-0930aa6530cd', 'YOUTUBE', 'boswindor.lulu', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.441', '2026-04-29 09:51:38.441', NULL, NULL, NULL, 'info@boswindor.com', 'Bos123$%', '17329524698', NULL, NULL, 37, NULL);
INSERT INTO public.accounts VALUES ('ed0c6902-fcfc-4162-b45b-401667d7b95a', 'TIKTOK', 'boswindor1', NULL, NULL, NULL, NULL, 'BANNED', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.448', '2026-04-29 09:51:38.448', NULL, NULL, NULL, 'boswindor@gmail.com', 'Bos123456%', NULL, NULL, NULL, 0, NULL);
INSERT INTO public.accounts VALUES ('af19136f-b4b1-4d14-882b-45d173270cd1', 'TIKTOK', 'Boswindor Building Material', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.337', '2026-04-30 06:47:16.44', '混剪账号02', NULL, NULL, 'bhe05798@gmail.com', 'Boswindor250331+', '18126652290', NULL, NULL, 259, 'Danny 2');
INSERT INTO public.accounts VALUES ('61d941b9-9f04-40df-aadd-361fcebad34d', 'YOUTUBE', 'Boswindor Building Material', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.345', '2026-04-30 06:47:22.225', '混剪账号02', NULL, NULL, 'bhe05798@gmail.com', 'Boswindor250331+', '18126652290', NULL, NULL, 3180, 'Danny 2');
INSERT INTO public.accounts VALUES ('2ca6a531-7264-4d3c-8509-3b614cc117a4', 'YOUTUBE', 'Boswindor doors and window', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.396', '2026-04-30 06:48:01.229', '混剪账号01', NULL, NULL, 'boswindor05@gmail.com', 'Boswindor05$.@', '18825938997', NULL, '邮箱密码', 0, 'Benny 2');
INSERT INTO public.accounts VALUES ('8659a69f-9730-49c9-a966-0bd79da063a8', 'FACEBOOK', 'Boswindor PremiumDoors', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.422', '2026-04-30 06:49:09.462', '副公共主页', NULL, NULL, 'boswindor06@gmail.com', 'Boswindor06$.', '18126652290', NULL, NULL, 0, 'Danny 1');
INSERT INTO public.accounts VALUES ('ae540c97-8e38-4445-9300-75c8262cba1e', 'FACEBOOK', 'boswindor factory', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.362', '2026-04-30 06:30:16.433', '副公共主页01', NULL, NULL, 'zzhu96663@gmail.com', 'Bos123456', '17329524698', NULL, '已注册公共主页', 17, 'Benny 1');
INSERT INTO public.accounts VALUES ('4cc5c22d-436a-4e3d-8f7f-ef51be999ef4', 'INSTAGRAM', 'boswindor_factory', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.37', '2026-04-30 06:30:25.995', '副账号01', NULL, NULL, 'zzhu96663@gmail.com', 'Bos123456', '17329524698', NULL, 'ins使用账号名称登陆账号', 22, 'Benny 1');
INSERT INTO public.accounts VALUES ('2ebd3f93-0620-46e0-b415-f89c2d067e45', 'TIKTOK', 'boswindor_factory', NULL, NULL, NULL, NULL, 'PAUSED', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.386', '2026-04-30 06:30:31.851', '副账号01', NULL, NULL, 'Sienna4698@outlook.com', 'Bos123456', '17329524698', NULL, '忘记密码，建议重新注册一个tk账号', 0, 'Benny 1');
INSERT INTO public.accounts VALUES ('d5ebd5a3-4e8c-47d0-acfc-ef9ece241473', 'YOUTUBE', 'boswindor_factory', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.379', '2026-04-30 06:30:37.282', '副账号01', NULL, NULL, 'zzhu96663@gmail.com', 'Bos123456', '17329524698', NULL, NULL, 2490, 'Benny 1');
INSERT INTO public.accounts VALUES ('8e069317-9f59-42ad-9487-7c69aa85224a', 'INSTAGRAM', 'Boswindor Building Material', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.353', '2026-04-30 06:34:55.172', '混剪账号02', NULL, NULL, 'zzhu96663@gmail.com', 'Bos123456', '17329524698', NULL, 'ins账号都要用用户名登录', 26, 'Danny 2');
INSERT INTO public.accounts VALUES ('e1fff405-11da-458f-8269-45af816e8637', 'INSTAGRAM', 'Boswindor PremiumDoors', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.408', '2026-04-30 06:49:26.63', '副账号', NULL, NULL, 'boswindor06@gmail.com', 'Boswindor06$.', '18126652290', NULL, NULL, 0, 'Danny 1');
INSERT INTO public.accounts VALUES ('90d6b3b7-941a-4449-937a-5eeb4a7b43c4', 'YOUTUBE', 'Boswindor PremiumDoors', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.414', '2026-04-30 06:49:31.364', '副账号', NULL, NULL, 'boswindor06@gmail.com', 'Boswindor06$.', '18126652290', NULL, NULL, 7, 'Danny 1');
INSERT INTO public.accounts VALUES ('b16620f7-2db8-4795-adf7-a38be56e7aae', 'TIKTOK', 'Boswindor-Premium-Doors', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.429', '2026-04-30 06:49:40.867', '副账号', NULL, NULL, 'boswindor06@gmail.com', 'Boswindor06$.', '18126652290', NULL, '谷歌登录', 0, 'Danny 1');
INSERT INTO public.accounts VALUES ('cbdf2288-e190-40b4-b2e7-3861c5801709', 'FACEBOOK', '外部账号', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-05-12 09:47:42.517', '2026-05-12 09:48:26.113', NULL, NULL, NULL, NULL, 'admin123', '11111111111', NULL, NULL, 0, NULL);
INSERT INTO public.accounts VALUES ('592cc6b7-1298-489b-a8cd-ba109cc2b5b0', 'FACEBOOK', 'Boswindor Aluminum Doors Windows Factory', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-05-13 02:17:54.987', '2026-05-13 02:17:54.987', '代理广告公共主页', NULL, NULL, 'dhdhghenny49@hotmail.com', 'yC16m443131619', '100090786055808', NULL, NULL, 0, 'Dake');
INSERT INTO public.accounts VALUES ('65037ce6-38c7-4959-8909-d2285b932896', 'INSTAGRAM', 'Boswindor Aluminum Doors Windows Factory', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-05-13 02:18:54.738', '2026-05-13 02:18:54.738', '代理广告公共主页', NULL, NULL, 'dhdhghenny49@hotmail.com', 'yC16m443131619', '100090786055808', NULL, '代理广告公共主页', 0, 'Dake');
INSERT INTO public.accounts VALUES ('b42909d0-12d5-4f0d-a887-00f848125c76', 'WECHAT_CHANNEL', 'Boswindor-lulu', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-05-13 02:56:52.657', '2026-05-13 02:56:52.657', '主账号', NULL, NULL, '18825938997', 'admin123', 'admin', NULL, '18825938997', 0, 'Danny 1');
INSERT INTO public.accounts VALUES ('5bdb9e80-5d3a-4fa2-857b-18b1c526519d', 'FACEBOOK', 'Foshan Boswindor Window and Door Limited', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.299', '2026-05-14 06:39:56.148', '主公共主页', NULL, NULL, 'wudake264@gmail.com', 'Bos2025$', '18681475702', NULL, NULL, 553, 'Danny 主公共主页');
INSERT INTO public.accounts VALUES ('60a9d67a-e653-4c78-a4a3-492f13f43916', 'INSTAGRAM', 'boswindor_limited', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.312', '2026-05-14 06:40:03.494', '主账户', NULL, NULL, 'boswindor@gmail.com', 'Boswindor888888', NULL, NULL, NULL, 570, 'Danny 主公共主页');
INSERT INTO public.accounts VALUES ('0affcbeb-6ab5-4d86-a2ac-5e96dc3fa98f', 'TIKTOK', 'china_window_door', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.329', '2026-05-14 06:40:11.174', '主账户', NULL, NULL, 'zzhu96663@gmail.com', 'Bos123456', '17329524698', NULL, NULL, 1258, 'Danny 主公共主页');
INSERT INTO public.accounts VALUES ('37475525-9e6b-42cc-8dc8-3de96db08b6f', 'YOUTUBE', 'Foshan Boswindor Window and Door Limited', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.322', '2026-05-14 06:40:17.409', '主账户', NULL, NULL, 'boswindor@gmail.com', 'Boswindor123$%', NULL, NULL, NULL, 74, 'Danny 主公共主页');
INSERT INTO public.accounts VALUES ('ec3b93f1-5ca9-49b4-8e2b-e6b7403d121f', 'FACEBOOK', 'boswindor Lulu', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.445', '2026-05-14 06:48:00.927', NULL, NULL, NULL, 'shuanglianguo311@gmail.com', 'gsl123456789', '18681475702', NULL, '手机号：刘总手机号', 8, 'Benny 2');
INSERT INTO public.accounts VALUES ('96a4ff80-b849-4157-97b2-5011ef50c461', 'INSTAGRAM', 'Boswindor doors and window', NULL, NULL, NULL, NULL, 'ACTIVE', NULL, NULL, NULL, NULL, '2026-04-29 09:51:38.402', '2026-05-19 07:41:28.323', '混剪账号01', NULL, NULL, 'boswindor01@outlook.com', 'Boswindor123$%', '无手机号码，邮箱注册', NULL, NULL, 0, 'Benny 2');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO public.users VALUES ('22f85b94-9b07-42b6-8e2c-2d5df13694ee', 'admin', '$2b$10$BIP7lJ/R/A5IgizlTZFn4.0Zz/GE/l0g40W7xi9FuCBql0QvA0.g2', '超级管理员', 'SUPER_ADMIN', 'admin@factory.com', NULL, NULL, 'ACTIVE', '2026-04-29 03:34:24.79', '2026-04-29 03:34:24.79');
INSERT INTO public.users VALUES ('8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'danny', '$2b$10$BUL9wZlwSWtaQvcbgeAMLuXUkqyciwt0ovgr9mrVCFmUHcnFiKw7W', 'Danny', 'OPERATOR', 'danny@factory.com', NULL, NULL, 'ACTIVE', '2026-04-29 06:37:17.782', '2026-04-29 06:37:17.782');
INSERT INTO public.users VALUES ('e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'benny', '$2b$10$4ipiFQvosePDw05W.XUWhOreMW7rYhhlWgkp67eriCjcPT/vul.82', 'Benny', 'OPERATOR', NULL, NULL, NULL, 'ACTIVE', '2026-04-29 07:01:38.952', '2026-04-29 07:01:38.952');


--
-- Data for Name: topics; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO public.topics VALUES ('633788c7-47ac-4b26-a204-1e764cf03ff5', 'How we pack aluminum windows and doors for sea shipping', 'SHORT_VIDEO', '{aluminum_window,shipping}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:24.933', '2026-04-29 09:03:24.933', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('7757c039-d488-495d-bee6-2d4bc558e451', 'What should Australian builders check before ordering windows from China?', 'SHORT_VIDEO', '{china,australia}', NULL, 'review', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:24.944', '2026-04-29 09:03:24.944', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('d794e0aa-2b49-40fc-9984-f43631b70870', 'How Are Aluminum Windows Made in a Factory?', 'SHORT_VIDEO', '{aluminum_window,factory}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:24.951', '2026-04-29 09:03:24.951', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('63cda07a-5df9-49cb-a8bb-4acaefdb1c6f', 'What Does a Reliable Window Factory Look Like?', 'SHORT_VIDEO', '{factory}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:24.957', '2026-04-29 09:03:24.957', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('ecdcf409-e28e-41df-9e9e-511d07d18885', 'How Do We Check Aluminum Window Quality Before Shipping?', 'SHORT_VIDEO', '{aluminum_window,shipping,quality}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:24.963', '2026-04-29 09:03:24.963', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('2f2adb04-264e-4fab-845c-7313cc8fa2f2', 'How Are Windows Packed for Overseas Shipping?', 'SHORT_VIDEO', '{shipping}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:24.97', '2026-04-29 09:03:24.97', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('1b12eab6-8f77-4a5b-887e-0617f289dcc1', 'What Happens Before Aluminum Windows Are Loaded into Containers?', 'SHORT_VIDEO', '{aluminum_window}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:24.976', '2026-04-29 09:03:24.976', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('b0808214-d4df-4224-97ed-0ef5bc10a327', 'How Do We Make Sure Custom Windows Match the Drawings?', 'SHORT_VIDEO', '{custom}', NULL, 'review', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:24.98', '2026-04-29 09:03:24.98', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('db87da99-508a-4da5-81e8-3758c48a0894', 'What Makes a High-Quality Aluminum Window?', 'SHORT_VIDEO', '{aluminum_window,quality}', NULL, 'review', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:24.985', '2026-04-29 09:03:24.985', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('545c09d2-e063-48e9-901b-03f9c42e0665', 'Why Does Aluminum Profile Thickness Matter?', 'SHORT_VIDEO', '{}', NULL, 'review', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:24.991', '2026-04-29 09:03:24.991', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('cf397fcf-69e1-49d5-b129-739ca4973064', 'What Is Inside a Thermal Break Aluminum Window?', 'SHORT_VIDEO', '{aluminum_window,thermal_break}', NULL, 'knowledge', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:24.996', '2026-04-29 09:03:24.996', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('453a6412-de56-412e-86a0-f39491f92a3c', 'How Does Low-E Glass Work?', 'SHORT_VIDEO', '{low_e_glass}', NULL, 'knowledge', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25', '2026-04-29 09:03:25', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('cb74b14d-532b-49e4-9162-d61802c80f13', 'Why Are Good Window Seals Important?', 'SHORT_VIDEO', '{}', NULL, 'review', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.006', '2026-04-29 09:03:25.006', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('6c0a6d7a-664a-4cd1-ba9d-82b5b916515c', 'How Do Multi-Point Locks Improve Window Security?', 'SHORT_VIDEO', '{security}', NULL, 'review', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.011', '2026-04-29 09:03:25.011', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('1315950f-9c48-4ce2-9ea4-0dba36eae49b', 'What Hardware Should Good Aluminum Windows Use?', 'SHORT_VIDEO', '{aluminum_window}', NULL, 'review', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.016', '2026-04-29 09:03:25.016', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('cfc30b0b-aa41-4225-9bdf-f520f5d74db0', 'Aluminum Windows or Vinyl Windows: Which Is Better?', 'SHORT_VIDEO', '{aluminum_window,vinyl}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.021', '2026-04-29 09:03:25.021', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('b63844f1-cbab-400b-82d4-4fc1958b5d8a', 'Cheap Windows or Quality Windows: What Is the Real Difference?', 'SHORT_VIDEO', '{quality}', NULL, 'review', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.025', '2026-04-29 09:03:25.025', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('bec5670b-dbc2-4f56-b79f-671151d8801f', 'Regular Aluminum Windows or Thermal Break Aluminum Windows?', 'SHORT_VIDEO', '{aluminum_window,thermal_break}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.029', '2026-04-29 09:03:25.029', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('29532783-cde7-40c0-b9e0-4c7326974262', 'Single Glass or Double Glazing: Which Should You Choose?', 'SHORT_VIDEO', '{double_glazing}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.034', '2026-04-29 09:03:25.034', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('8412b151-a7a3-4f61-8304-e56fd702a01a', 'Regular Windows or Impact Windows: What Is the Difference?', 'SHORT_VIDEO', '{impact_window}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.038', '2026-04-29 09:03:25.038', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('cef72c84-d496-4475-9aa9-eb56a0c9a840', 'Local Retail Windows or Factory-Direct Windows?', 'SHORT_VIDEO', '{factory}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.044', '2026-04-29 09:03:25.044', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('3bbd83f8-e055-4b0f-adf2-ee43aef3e208', 'How Do Aluminum Windows Look After Installation?', 'SHORT_VIDEO', '{aluminum_window,installation}', NULL, 'installation', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.05', '2026-04-29 09:03:25.05', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('1abf123a-b484-483e-9ea4-87d175ff74ab', 'What Windows Did This Villa Project Use?', 'SHORT_VIDEO', '{villa}', NULL, 'installation', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.055', '2026-04-29 09:03:25.055', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('ef761251-3865-43d6-9247-fbdd01aa13d0', 'How Do Aluminum Bifold Doors Look in a Modern Home?', 'SHORT_VIDEO', '{bifold_door}', NULL, 'installation', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.06', '2026-04-29 09:03:25.06', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('d8267b73-ccdd-459f-81d7-e845309de7f2', 'What Window System Was Used in This Commercial Project?', 'SHORT_VIDEO', '{commercial}', NULL, 'installation', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.065', '2026-04-29 09:03:25.065', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('79fd9b69-ca6c-4a6c-b69a-684b29e05e58', 'How Were These Custom Windows Produced for an Overseas Client?', 'SHORT_VIDEO', '{custom}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.069', '2026-04-29 09:03:25.069', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('93d37ddd-3ed7-4c7f-965d-b58044851154', 'Why Did This Contractor Choose Factory-Direct Aluminum Windows?', 'SHORT_VIDEO', '{aluminum_window,factory}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.074', '2026-04-29 09:03:25.074', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('ae9fce9b-1b41-4a70-bf7d-b79a078f2c5d', 'How to choose a reliable aluminum window supplier from China?', 'SHORT_VIDEO', '{aluminum_window,china}', NULL, 'buying_guide', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.079', '2026-04-29 09:03:25.079', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('6a686f7f-5455-4a9c-82b0-6349b72bc674', 'Where can I find aluminum window manufacturers?', 'SHORT_VIDEO', '{aluminum_window}', NULL, 'buying_guide', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.084', '2026-04-29 09:03:25.084', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('1d0580a4-0fd0-43b3-ba42-172a7fade756', 'How do I find a reliable window and door manufacturer?', 'SHORT_VIDEO', '{}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.09', '2026-04-29 09:03:25.09', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('298b1cd2-6794-45e4-b44a-e6041624cb9b', 'Where can contractors buy wholesale windows and doors?', 'SHORT_VIDEO', '{}', NULL, 'buying_guide', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.094', '2026-04-29 09:03:25.094', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('513421a3-60ed-4675-bfd8-dd70818eeebf', 'Is factory-direct window supply cheaper than local retail?', 'SHORT_VIDEO', '{factory}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.1', '2026-04-29 09:03:25.1', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('17a2a2ad-48b4-41be-a29b-02161daddf69', 'How can builders import windows and doors from China?', 'SHORT_VIDEO', '{china}', NULL, 'buying_guide', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.105', '2026-04-29 09:03:25.105', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('f44f75fb-155a-423e-9ea3-1360fd886462', 'What should I ask before buying windows from a factory?', 'SHORT_VIDEO', '{factory}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.112', '2026-04-29 09:03:25.112', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('95d53b17-9c33-4505-8e4e-3d7ea3c2435f', 'How do I verify a Chinese aluminum window supplier?', 'SHORT_VIDEO', '{aluminum_window}', NULL, 'buying_guide', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.117', '2026-04-29 09:03:25.117', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('c546ebc8-70aa-42ed-9f91-0c53a8b8d28b', 'What makes a good aluminum window manufacturer?', 'SHORT_VIDEO', '{aluminum_window}', NULL, 'buying_guide', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.121', '2026-04-29 09:03:25.121', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('d4082167-0019-4d5a-bcd8-2eeac0d7ab11', 'How do I compare window and door suppliers?', 'SHORT_VIDEO', '{}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.126', '2026-04-29 09:03:25.126', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('b9969f9e-7c27-41cd-9f9b-df98d6bc32c1', 'What are the best aluminum windows?', 'SHORT_VIDEO', '{aluminum_window}', NULL, 'knowledge', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.131', '2026-04-29 09:03:25.131', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('06fd7fde-ca1e-4879-a5f0-9a67233bb7e7', 'Are aluminum windows better than vinyl windows?', 'SHORT_VIDEO', '{aluminum_window,vinyl}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.136', '2026-04-29 09:03:25.136', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('b1bafbb1-bc3c-424d-9787-d4a0a8a5930a', 'What are thermal break aluminum windows?', 'SHORT_VIDEO', '{aluminum_window,thermal_break}', NULL, 'knowledge', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.143', '2026-04-29 09:03:25.143', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('77a9739e-1673-4a96-99c3-a9e4e1b59cad', 'Are thermal break aluminum windows worth it?', 'SHORT_VIDEO', '{aluminum_window,thermal_break}', NULL, 'knowledge', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.149', '2026-04-29 09:03:25.149', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('9909b30f-6bda-4060-a8b9-b6d2cf8f370c', 'What are the best aluminum sliding windows?', 'SHORT_VIDEO', '{sliding_window}', NULL, 'knowledge', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.155', '2026-04-29 09:03:25.155', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('ecccc80a-f532-4043-bafa-a09ae60f7947', 'How do I choose aluminum casement windows?', 'SHORT_VIDEO', '{casement_window}', NULL, 'buying_guide', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.16', '2026-04-29 09:03:25.16', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('ebfd03f6-4332-4a26-9c55-4973fa89e9e2', 'What are the best aluminum bifold doors?', 'SHORT_VIDEO', '{bifold_door}', NULL, 'knowledge', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.165', '2026-04-29 09:03:25.165', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('036f7df9-d018-421f-aec0-c689a1401e47', 'How do I choose aluminum patio doors?', 'SHORT_VIDEO', '{patio_door}', NULL, 'buying_guide', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.169', '2026-04-29 09:03:25.169', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('4ae5eaaa-6233-48d4-af11-49692f360100', 'What aluminum profile thickness is best for windows?', 'SHORT_VIDEO', '{}', NULL, 'review', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.174', '2026-04-29 09:03:25.174', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('1761dc3e-518b-4f84-bb5e-34bceb54846e', 'How much do aluminum windows cost?', 'SHORT_VIDEO', '{aluminum_window,cost}', NULL, 'pricing', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.177', '2026-04-29 09:03:25.177', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('5e569e17-e23b-4063-a020-7efe12a7ac69', 'Why do window prices vary so much?', 'SHORT_VIDEO', '{price}', NULL, 'pricing', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.179', '2026-04-29 09:03:25.179', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('dad0e642-ffcf-4f77-b5e8-0d14e434c4dc', 'What affects the price of aluminum windows and doors?', 'SHORT_VIDEO', '{aluminum_window,price}', NULL, 'pricing', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.183', '2026-04-29 09:03:25.183', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('d82b07fd-aab8-4264-85e9-7873c113406d', 'Are Chinese aluminum windows cost-effective?', 'SHORT_VIDEO', '{aluminum_window,cost}', NULL, 'pricing', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.186', '2026-04-29 09:03:25.186', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('9c4177de-4c3e-4abd-819a-43bf4f455446', 'How can contractors reduce window costs?', 'SHORT_VIDEO', '{cost}', NULL, 'pricing', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.19', '2026-04-29 09:03:25.19', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('f60f28af-9e6c-43d6-827c-74d94a3c95cc', 'Is it cheaper to buy windows directly from a factory?', 'SHORT_VIDEO', '{factory}', NULL, 'factory_tour', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.193', '2026-04-29 09:03:25.193', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('c6986ac6-8dd7-46d5-a66f-59b89ee8e295', 'What are the best replacement windows for the money?', 'SHORT_VIDEO', '{}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.197', '2026-04-29 09:03:25.197', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('3e10f011-8db8-4e8f-b276-34ca2ae2f614', 'How much do impact windows cost?', 'SHORT_VIDEO', '{impact_window,cost}', NULL, 'pricing', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.2', '2026-04-29 09:03:25.2', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('77303e1d-d121-4b3b-874c-03eb11364734', 'How does bulk ordering affect window prices?', 'SHORT_VIDEO', '{price,bulk_order}', NULL, 'pricing', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.204', '2026-04-29 09:03:25.204', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('4a83b7e1-3dc4-47d6-bdc9-0b2ba767eb85', 'What are the risks of buying cheap windows?', 'SHORT_VIDEO', '{}', NULL, 'pricing', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.208', '2026-04-29 09:03:25.208', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('a0a6c9f3-d78e-4d67-bd48-a74d7068dd76', 'What are the best energy-efficient windows?', 'SHORT_VIDEO', '{energy_efficient}', NULL, 'knowledge', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.212', '2026-04-29 09:03:25.212', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('e086a576-fd8e-481e-ac73-7d80bdc5fa48', 'How do thermal break aluminum windows improve insulation?', 'SHORT_VIDEO', '{aluminum_window,thermal_break}', NULL, 'knowledge', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.217', '2026-04-29 09:03:25.217', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('b2cf4797-d5a4-4783-9296-11744aca4abd', 'What is the difference between Low-E glass and regular glass?', 'SHORT_VIDEO', '{low_e_glass}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.221', '2026-04-29 09:03:25.221', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('385ee5fd-0e67-49dc-910a-088e745c910a', 'What are impact windows?', 'SHORT_VIDEO', '{impact_window}', NULL, 'knowledge', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.225', '2026-04-29 09:03:25.225', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('5ae0496a-f9f8-449d-b328-f213e0a70f25', 'What is the difference between impact windows and regular windows?', 'SHORT_VIDEO', '{impact_window}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.229', '2026-04-29 09:03:25.229', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('84ee192c-6e52-4b99-ad99-82ec261620ec', 'Are impact windows worth it in Florida?', 'SHORT_VIDEO', '{impact_window,florida}', NULL, 'knowledge', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.233', '2026-04-29 09:03:25.233', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('21a93805-7557-4133-90e2-78c16363dc09', 'How do I choose windows for a commercial project?', 'SHORT_VIDEO', '{commercial}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.237', '2026-04-29 09:03:25.237', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('6e410ba9-3128-44a6-bbdf-1ba734ad844e', 'Where can I find commercial aluminum window manufacturers?', 'SHORT_VIDEO', '{aluminum_window,commercial}', NULL, 'buying_guide', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.242', '2026-04-29 09:03:25.242', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('fd67e858-12f6-4d3e-ac01-a14399f3b74d', 'How can contractors source custom windows for building projects?', 'SHORT_VIDEO', '{custom}', NULL, 'comparison', NULL, 'PENDING', 0, NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.249', '2026-04-29 09:03:25.249', NULL, false, NULL, NULL, NULL, NULL);
INSERT INTO public.topics VALUES ('9539df2b-e531-44a7-86e1-38d3d81bfe6b', 'Modern aluminum window designs', 'SHORT_VIDEO', '{aluminum_window,custom}', NULL, '工厂实拍', NULL, 'PENDING', 0, 'wegweg', '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-04-29 09:03:25.254', '2026-04-30 06:16:26.512', '2026-04-30 00:00:00', true, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'd5cb501d-673d-4fd3-8887-e6b41abe8f9e', 'wegweg', 'wegweg');
INSERT INTO public.topics VALUES ('6588e84f-3355-45dd-abea-d88b97188195', 'Why are more builders sourcing doors and windows from China?', 'SHORT_VIDEO', NULL, NULL, '采购指南', NULL, 'PENDING', 0, 'Kai出镜', '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-05-15 01:59:38.213', '2026-05-15 01:59:38.213', '2026-05-12 00:00:00', true, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', NULL, NULL, 'Why are more builders sourcing windows and doors from China?

One big reason is cost control.

But for a real project, price is not everything.

The windows and doors need to match the drawings.

The size needs to be right.

The glass, frame color, hardware, and opening style also need to be correct.

Because if one small detail is wrong, installation can be delayed.

And for overseas projects, there are more things to consider.

For example, packing, shipping, and local market standards.

Like NFRC, AAMA, AS2047, CSA, or CE.

At Boswindor, we manufacture custom aluminum windows and doors in Foshan, China.

We don’t just help builders compare the product price.

We help them look at the full solution.

So if you have a project, send us your drawings.

We’ll quote based on your actual requirements.');
INSERT INTO public.topics VALUES ('ae3a5793-dbb2-4d20-96ab-31ea68d286d8', 'Why are more builders sourcing doors and windows from China?', 'SHORT_VIDEO', NULL, NULL, '采购指南', NULL, 'PENDING', 0, 'Shally出镜', '22f85b94-9b07-42b6-8e2c-2d5df13694ee', '2026-05-15 02:00:18.635', '2026-05-15 02:00:49.187', '2026-05-12 00:00:00', true, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', '', NULL, 'Why are more builders sourcing doors and windows from China?
为什么越来越多的建筑商选择从中国采购门窗？

Cost control is one reason.
成本控制是其中一个原因。
 
But for overseas projects, builders look at more than price.
但对于海外项目而言，建筑商考虑的不仅仅是价格。

They need the right sizes, glass, frame color, hardware, and opening style to match their drawings.
他们需要尺寸、玻璃、框架颜色、五金件和开启方式都符合图纸要求。

If one detail is unclear, pr oduction, shipping, or installation can be affected.
任何一个细节的疏忽都可能影响生产、运输或安装。

At Boswindor, we manufacture custom aluminum windows and doors in Foshan, China.
博斯温多（Boswindor）在中国佛山生产定制铝合金门窗。


We can support certifications such as NFRC, AAMA, AS2047, CSA, and CE, based on your project requirements.
我们可以根据您的项目需求，提供NFRC、AAMA、AS2047、CSA和CE等认证。

Send us your drawings or window schedule，we will offer professional project quotation
请将您的图纸或窗户布置图发送给我们，我们将提供专业的项目报价。');


--
-- Data for Name: contents; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO public.contents VALUES ('4fed6aa2-97a6-425a-b82c-8112e69d232a', '门窗五金配件介绍-04-29-6', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-04-29 11:50:00', NULL, NULL, '测试数据：2026-04-29 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.732', '2026-04-30 14:50:45.732', 'repost', NULL);
INSERT INTO public.contents VALUES ('a8255f7a-ba2a-47b9-8be8-1c40f0f880fb', 'Low-E玻璃节能效果-04-29-7', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-04-29 13:55:00', NULL, NULL, '测试数据：2026-04-29 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.751', '2026-04-30 14:50:45.751', 'original', NULL);
INSERT INTO public.contents VALUES ('8d7cbca9-bba2-4a04-adb9-9080409ff0f6', '批量内容1', NULL, NULL, 'PENDING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-29 09:43:54.89', '2026-04-29 09:43:54.89', 'product_showcase', NULL);
INSERT INTO public.contents VALUES ('54ea072e-a7eb-4309-8b00-1228b77a372f', '批量内容2', NULL, NULL, 'PENDING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-29 09:43:54.895', '2026-04-29 09:43:54.895', 'installation_guide', NULL);
INSERT INTO public.contents VALUES ('dd6d6cff-284b-42bf-b91f-3b0bef952ab9', '门窗质检过程揭秘-04-29-8', NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', 'PENDING', '2026-04-29 17:28:00', NULL, NULL, '测试数据：2026-04-29 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.766', '2026-04-30 14:50:45.766', 'repost', NULL);
INSERT INTO public.contents VALUES ('695d6c93-a44f-4b3b-8dad-cf8389967a4e', '合作伙伴案例展示-04-29-9', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-04-29 12:29:00', NULL, NULL, '测试数据：2026-04-29 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.783', '2026-04-30 14:50:45.783', 'repost', NULL);
INSERT INTO public.contents VALUES ('22bafd5e-eabd-40bb-88bb-90e8141ea2ee', '断桥铝门窗安装教程-04-29-10', NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', 'PENDING', '2026-04-29 11:41:00', NULL, NULL, '测试数据：2026-04-29 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.798', '2026-04-30 14:50:45.798', 'repost', NULL);
INSERT INTO public.contents VALUES ('e531bf21-ac12-4817-8b6f-e86a28b2bc6c', '批量内容1', NULL, NULL, 'PENDING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-29 09:45:14.319', '2026-04-29 09:45:14.319', 'product_showcase', NULL);
INSERT INTO public.contents VALUES ('a10c3e52-56eb-4159-b7fb-ca8644db03ab', '批量内容2', NULL, NULL, 'PENDING', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-29 09:45:14.324', '2026-04-29 09:45:14.324', 'installation_guide', NULL);
INSERT INTO public.contents VALUES ('c6f93285-5462-4c71-8bc2-a8028a67ed44', '合作伙伴案例展示-04-30-1', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-04-30 13:11:00', NULL, NULL, '测试数据：2026-04-30 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.813', '2026-04-30 14:50:45.813', 'repost', NULL);
INSERT INTO public.contents VALUES ('48b20d22-eda3-4402-bf6e-694d6e08980d', '门窗隔音效果实测-04-30-2', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-04-30 09:41:00', NULL, NULL, '测试数据：2026-04-30 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.833', '2026-04-30 14:50:45.833', 'repost', NULL);
INSERT INTO public.contents VALUES ('142be0ae-d466-4bc6-b5a6-698532ade71a', '谢谢小星星', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-04-30 00:00:00', NULL, 'https://www.instagram.com/reels/DXZM9voGLG3/', NULL, NULL, NULL, NULL, NULL, '2026-04-30 14:45:01.074', '2026-04-30 14:45:01.074', NULL, NULL);
INSERT INTO public.contents VALUES ('6eb8a465-035c-4176-86dc-9d637c01980c', '门窗质检过程揭秘-04-30-3', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-04-30 18:45:00', NULL, NULL, '测试数据：2026-04-30 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.856', '2026-04-30 14:50:45.856', 'repost', NULL);
INSERT INTO public.contents VALUES ('0e17e72e-4167-41e9-a08b-cc12085824a5', '464yukyuk', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-04-29 00:00:00', NULL, 'https://www.youtube.com/shorts/0B04YX94gv8', '十大歌手帝国时代根深蒂固', NULL, NULL, NULL, 'sdfgsdgsd', '2026-04-29 08:25:07.266', '2026-04-30 14:45:41.252', '塑料袋福建省', '到底是根深蒂固');
INSERT INTO public.contents VALUES ('7f9fa9ce-0af2-4c25-917a-63b73faa51f5', 'test', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-04-28 00:00:00', NULL, 'https://www.tiktok.com/@nataliireynoldss/video/7618407968077335838?is_from_webapp=1&sender_device=pc', NULL, NULL, NULL, NULL, NULL, '2026-04-30 14:46:43.379', '2026-04-30 14:46:43.379', NULL, NULL);
INSERT INTO public.contents VALUES ('39ca1052-7a36-4f33-ad0b-47dd6a8b68c8', '测试内容', NULL, NULL, 'PENDING', '2026-04-29 10:00:00', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-30 14:50:12.289', '2026-04-30 14:50:12.289', NULL, NULL);
INSERT INTO public.contents VALUES ('e8e310d9-f932-4927-841d-5c923c08ed4a', '海外市场拓展经验-04-27-1', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-04-27 10:58:00', NULL, NULL, '测试数据：2026-04-27 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.578', '2026-04-30 14:50:45.578', 'mixed', NULL);
INSERT INTO public.contents VALUES ('0ca080bd-f14e-418d-8391-028b964e5846', '定制流程全记录-04-27-2', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-04-27 16:48:00', NULL, NULL, '测试数据：2026-04-27 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.593', '2026-04-30 14:50:45.593', 'repost', NULL);
INSERT INTO public.contents VALUES ('f0513cc3-95b8-4e24-b66d-ee4febd4d28f', '新品发布-智能门窗系统-04-27-3', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-04-27 18:04:00', NULL, NULL, '测试数据：2026-04-27 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.608', '2026-04-30 14:50:45.608', 'original', NULL);
INSERT INTO public.contents VALUES ('c1fea9ef-a046-4319-9f1e-c02be0243a37', '门窗保养维护指南-04-28-1', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-04-28 14:56:00', NULL, NULL, '测试数据：2026-04-28 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.623', '2026-04-30 14:50:45.623', 'mixed', NULL);
INSERT INTO public.contents VALUES ('9971059a-3425-476a-8d0c-1b028b7ab21a', '售后服务流程介绍-04-29-1', NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', 'PENDING', '2026-04-29 17:56:00', NULL, NULL, '测试数据：2026-04-29 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.641', '2026-04-30 14:50:45.641', 'original', NULL);
INSERT INTO public.contents VALUES ('c563473d-0fc7-45cf-b35e-7d07947231d3', '玻璃种类与选购指南-04-29-2', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-04-29 12:31:00', NULL, NULL, '测试数据：2026-04-29 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.654', '2026-04-30 14:50:45.654', 'original', NULL);
INSERT INTO public.contents VALUES ('aadf08cc-509c-4fa7-9bd7-56010efeb89c', '门窗防水性能展示-04-29-3', NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', 'PENDING', '2026-04-29 13:36:00', NULL, NULL, '测试数据：2026-04-29 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.672', '2026-04-30 14:50:45.672', 'repost', NULL);
INSERT INTO public.contents VALUES ('0265ba15-07f1-4547-b633-2447c8d11e34', '定制流程全记录-04-29-4', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-04-29 14:38:00', NULL, NULL, '测试数据：2026-04-29 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.692', '2026-04-30 14:50:45.692', 'original', NULL);
INSERT INTO public.contents VALUES ('7f2034b2-80df-4be4-951f-7cd48785fc07', 'Low-E玻璃节能效果-04-29-5', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-04-29 17:27:00', NULL, NULL, '测试数据：2026-04-29 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.712', '2026-04-30 14:50:45.712', 'original', NULL);
INSERT INTO public.contents VALUES ('81a0a235-c0ba-4173-8aea-bbedc6efbb7c', '阳光房设计案例分享-04-30-4', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-04-30 17:16:00', NULL, NULL, '测试数据：2026-04-30 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.872', '2026-04-30 14:50:45.872', 'repost', NULL);
INSERT INTO public.contents VALUES ('3c74d3f1-f2de-4dbc-9ef0-b2da08688b48', '玻璃种类与选购指南-05-01-1', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-05-01 09:17:00', NULL, NULL, '测试数据：2026-05-01 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.893', '2026-04-30 14:50:45.893', 'original', NULL);
INSERT INTO public.contents VALUES ('f86d6349-3cec-4368-ad40-bbb7d1b621a2', '门窗安全性能测试-05-01-2', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-05-01 11:49:00', NULL, NULL, '测试数据：2026-05-01 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.914', '2026-04-30 14:50:45.914', 'original', NULL);
INSERT INTO public.contents VALUES ('b965c06b-19e0-4eef-9fc8-f5d4ea108937', '海外客户考察记录-05-01-3', NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', 'PENDING', '2026-05-01 16:32:00', NULL, NULL, '测试数据：2026-05-01 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.934', '2026-04-30 14:50:45.934', 'repost', NULL);
INSERT INTO public.contents VALUES ('413ec705-2b35-48d6-8c58-35b2cef35f69', '门窗行业趋势分析-05-01-4', NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', 'PENDING', '2026-05-01 09:58:00', NULL, NULL, '测试数据：2026-05-01 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.952', '2026-04-30 14:50:45.952', 'repost', NULL);
INSERT INTO public.contents VALUES ('7d3a9849-f043-48e9-8555-e174f4a02f97', '阳光房设计案例分享-05-01-5', NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', 'PENDING', '2026-05-01 11:09:00', NULL, NULL, '测试数据：2026-05-01 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.969', '2026-04-30 14:50:45.969', 'repost', NULL);
INSERT INTO public.contents VALUES ('93a01f43-8443-4caa-8aed-3ab227260ea6', '断桥铝vs普通铝合金对比-05-02-1', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-05-02 11:14:00', NULL, NULL, '测试数据：2026-05-02 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:45.986', '2026-04-30 14:50:45.986', 'original', NULL);
INSERT INTO public.contents VALUES ('04e0f45a-6f8c-468d-b731-031293594823', '门窗行业趋势分析-05-02-2', NULL, '22f85b94-9b07-42b6-8e2c-2d5df13694ee', 'PENDING', '2026-05-02 18:11:00', NULL, NULL, '测试数据：2026-05-02 发布的内容', NULL, NULL, NULL, NULL, '2026-04-30 14:50:46.004', '2026-04-30 14:50:46.004', 'original', NULL);
INSERT INTO public.contents VALUES ('10b1ffb0-61a4-43a2-bb8a-88b42f41036b', 'A center opening sliding door system designed for wider and more balanced access.', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-05-08 00:00:00', NULL, 'https://www.instagram.com/reel/DYEzYCxDNp3/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', 'A center opening sliding door system designed for wider and more balanced access.
✔ Two panels sliding from the center
✔ Symmetrical and clean appearance
✔ Wider opening compared to single sliding
Suitable for villa entrances, balconies, and large openings.
Working on a project?
Send your drawings or request layout suggestions.
#CenterOpening #AluminumDoor#Architect #Designer #Builder#MinimalDesign #ModernHome #Facade#VillaDesign #LuxuryHome #Design', NULL, NULL, NULL, NULL, '2026-05-11 09:21:15.004', '2026-05-11 09:21:15.004', 'mixed', NULL);
INSERT INTO public.contents VALUES ('80e72665-72a3-4b8a-bfe6-449f1eb777c2', '260508-美国广告', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-05-13 00:00:00', NULL, 'https://ug.link/Boswindor/filemgr/share-download/?id=6dabb2c85f984c01892c32e31230f818', NULL, NULL, NULL, NULL, NULL, '2026-05-13 02:26:48.877', '2026-05-13 02:26:48.877', 'original', 'Need premium aluminum windows and doors for a US building project — without overpaying?
美国建筑项目需要高端铝合金门窗，但不想花冤枉钱？

Work directly with Boswindor Foshan, China factory.
直接对接 Boswindor 中国佛山工厂。

With 25 years of manufacturing experience, we serve builders, contractors, architects, and designers across the US.
我们拥有 25 年制造经验，服务美国各地的开发商、承包商、建筑师和设计师。

Tested configurations can support NFRC / ENERGY STAR project requirements.
经过测试的配置，可支持 NFRC / ENERGY STAR 项目要求。

Send us your drawings or window schedule.
把您的图纸或门窗表发给我们。

We’ll review your specs and recommend the right system.
我们会审核您的规格要求，并推荐合适的系统方案。

From casement and awning windows to sliding and folding doors, sunroom systems, large-opening systems — and more.
从平开窗、上悬窗，到推拉门、折叠门、阳光房系统、大开口系统等，我们都可以提供。

Custom designs to match your architectural style.
可根据您的建筑风格进行定制设计。

Factory-direct pricing helps reduce middleman costs.
工厂直供价格，帮助您减少中间商成本。

👇Tap below and get a FREE factory-direct quote today!
点击下方，立即获取免费工厂直供报价！

封面文字：
Premium Aluminum Windows & Doors
for US Building Projects
Without Overpaying');
INSERT INTO public.contents VALUES ('e14ed698-9fba-4cb9-b250-90f0f460cb1d', 'Shipping AS2047 Windows', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-05-11 00:00:00', NULL, 'https://ug.link/Boswindor/filemgr/share-download/?id=670e479373f941afadf80ccdf39af65b', NULL, NULL, NULL, NULL, '视频内容暂未发布，需要选取对应时间段才会显示到改视图里', '2026-05-12 09:58:42.936', '2026-05-15 01:37:36.145', '原创', 'Hi, today we’re loading 40HQ aluminum windows and doors for Melbourne.
您好，今天我们正在为墨尔本装载 40HQ 铝制窗门。

AS2047 certified and packed for Australian projects.
AS2047认证并备有包装，适用于澳大利亚项目。

Sea shipping from our Foshan China factory to your site, around 25 days.
从我们位于中国佛山的工厂海运至贵方所在地，大约需要 25 天时间。

Send your window schedule for a project quote!
请发送您的日程安排，以便获取项目报价！');
INSERT INTO public.contents VALUES ('1af841c3-b529-49fe-8196-22fd9108741f', 'Triple-Track Sliding Door ', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-05-15 14:00:00', NULL, 'https://www.instagram.com/reel/DYWuAorknx5/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', 'Triple-Track Sliding Door System for Modern Residential & Commercial Projects
✔designed for modern architectural spaces.
✔ Triple-track sliding structure
✔Creates a wider opening experience
✔ Large glass panel layout
while maintaining a clean and minimal look.
#tripleslidingdoor #slidingdoor #aluminumdoors#developers #contractors #architects#modernhome #patiodoor #buildingmaterials #Boswindor #chinawindowsfactory #chinadoorsfactory', NULL, NULL, NULL, NULL, '2026-05-15 10:44:40.93', '2026-05-15 10:44:56.179', 'mixed', NULL);
INSERT INTO public.contents VALUES ('7c6232ad-5358-4103-a70c-a9eb590686b3', 'Our large-scale factory ensures consistent quality.', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-05-13 03:30:00', NULL, 'https://www.instagram.com/reel/DYRLLALFT_G/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', 'Our large-scale factory ensures consistent quality.
✅ 25+ years export experience
✅ Durable aluminum structure
✅ Easy installation & reliable performance
📩 Send your drawings for a fast quotation
#BigWindows #Factory #Export #Quality #Safe #Install #Home #Boswindor #Packing #China#factorydirect', NULL, NULL, NULL, NULL, '2026-05-13 06:51:21.996', '2026-05-13 06:51:21.996', 'original', NULL);
INSERT INTO public.contents VALUES ('9cbd6cd2-5785-4b1e-b546-ffaf92beb0b6', '260512-澳洲出柜-kai出镜', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-05-12 08:00:00', NULL, 'https://ug.link/Boswindor/filemgr/share-download/?id=49d834fc4cd64df7b4554d9b7a014a73', NULL, NULL, NULL, NULL, NULL, '2026-05-12 10:16:59.174', '2026-05-13 02:11:56.549', 'original', 'Hi guys, today we''re loading a 40HQcontainer of aluminum windows anddoors for Melbourne.
They''re AS2047 certified and built forAustralian projects.Each unit is well protected, labeled,and checked before loading.Sea shipping from our Foshan Chinafactory to your site, around 25 days
Send us your window schedule, andwe''ll quote for your project.');
INSERT INTO public.contents VALUES ('4fc6fe98-3dd2-4ebc-8dbc-0bff84b04b49', 'Factory DirectWithout Overpaving', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-05-07 08:00:00', NULL, 'https://ug.link/Boswindor/filemgr/share-download/?id=247af3d26868449396a79679e29123f6', NULL, NULL, NULL, NULL, '视频内容暂未发布，需要选取对应时间段才会显示到改视图里', '2026-05-12 09:50:47.782', '2026-05-13 02:13:26.133', '广告', '260428 非认证市场通用广告脚本
Need high-quality aluminum windows and doors for your building project — without overpaying?
您的建筑项目需要高品质铝合金门窗，但不想花冤枉钱？

Work directly with Boswindor Foshan, China factory.
直接对接 Boswindor 中国佛山工厂。

With 25 years of manufacturing experience, we serve builders, contractors, architects, and designers worldwide.
我们拥有 25 年制造经验，服务全球各地的开发商、承包商、建筑师和设计师。

Send us your drawings or window schedule.
把您的图纸或门窗表发给我们。

We’ll review your specs and recommend the right system.
我们会审核您的规格要求，并推荐合适的系统方案。

Built with modern designs, smooth operation, tight sealing, and better indoor comfort.
产品具备现代化设计、顺畅操作、良好密封性能，并能提升室内舒适度。

�Tap below and get a FREE factory-direct quote today!
点击下方，立即获取免费工厂直供报价！

封面文字：
High-Quality Aluminum Windows & Doors
高品质铝合金门窗

Without Overpaying
避免不必要的高价成本Factory Direct工厂直销');
INSERT INTO public.contents VALUES ('48c131eb-9942-42e9-a0ee-66617b5d51ce', 'Boswindor high-quality aluminum alloy doors and windows are shipped from China to Melbourne.😮', NULL, 'e6cc3a1d-6c69-4077-93a0-4ac003de1060', 'PENDING', '2026-05-16 00:00:00', NULL, 'https://www.instagram.com/reel/DYZMFHYv-ay/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', NULL, NULL, NULL, NULL, NULL, '2026-05-16 09:23:00.477', '2026-05-16 09:23:00.477', 'original', 'Hi, today we’re loading 40HQ aluminum windows and doors for Melbourne.
您好，今天我们正在为墨尔本装载 40HQ 铝制窗门。

AS2047 certified and packed for Australian projects.
AS2047认证并备有包装，适用于澳大利亚项目。

Sea shipping from our Foshan China factory to your site, around 25 days.
从我们位于中国佛山的工厂海运至贵方所在地，大约需要 25 天时间。

Send your window schedule for a project quote!
请发送您的日程安排，以便获取项目报价！');
INSERT INTO public.contents VALUES ('3b8f6bcf-d578-4896-a970-0037d6cfed43', 'Shipping premium aluminium window systems from Foshan, China to Melbourne, Australia 🇦🇺  Designed for modern homes, villas, and commercial projects.', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-05-16 04:00:00', NULL, 'https://www.instagram.com/reel/DYZGHHcjwNi/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', 'Shipping premium aluminium window systems from Foshan, China to Melbourne, Australia 🇦🇺

Designed for modern homes, villas, and commercial projects.

✅ Stylish Modern Appearance
✅ Strong & Durable Systems
✅ Energy Efficient & Easy Maintenance

#Boswindor #AS2047 #AustraliaWindows #AluminiumWindows #ChinaWindowsFactory #WindowExport #MelbourneProjects #AustralianStandards #ModernWindowSystems #CommercialWindowSolutions', NULL, NULL, NULL, NULL, '2026-05-16 09:36:25.704', '2026-05-16 09:36:25.704', 'original', 'Hi guys, today we''re loading a 40HQcontainer of aluminum windows anddoors for Melbourne.
They''re AS2047 certified and built forAustralian projects.Each unit is well protected, labeled,and checked before loading.Sea shipping from our Foshan Chinafactory to your site, around 25 days
Send us your window schedule, andwe''ll quote for your project.');
INSERT INTO public.contents VALUES ('e8194122-d735-4a2f-97e7-0b69c6dd18ce', 'OffsetRevolvingDoor', NULL, '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8', 'PENDING', '2026-05-18 06:00:00', NULL, 'https://www.instagram.com/reel/DYegaQWDbNF/?utm_source=ig_web_copy_link&igsh=MzRlODBiNWFlZA==', 'Offset pivot doors designed for modern architectural entrances and luxury spaces. 🚪

Manufactured in Foshan, China with customizable options for colour, glass, panel style, hardware, and opening systems.

Suitable for villas, residential projects, and premium commercial buildings.

Share your drawings or dimensions for a project-based quotation.
#Boswindor #OffsetRevolvingDoor #AluminumAlloyDoor #LuxuryVillaDoor #ModernArchitecture #MinimalistDoorDesign #ChinaFactory #CustomDoorSolutions', NULL, NULL, NULL, NULL, '2026-05-18 10:41:00.579', '2026-05-18 10:41:00.579', 'mixed', NULL);


--
-- Data for Name: _AccountToContent; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO public."_AccountToContent" VALUES ('4201e725-b491-47f1-b49e-0930aa6530cd', '142be0ae-d466-4bc6-b5a6-698532ade71a');
INSERT INTO public."_AccountToContent" VALUES ('4201e725-b491-47f1-b49e-0930aa6530cd', '0e17e72e-4167-41e9-a08b-cc12085824a5');
INSERT INTO public."_AccountToContent" VALUES ('ed0c6902-fcfc-4162-b45b-401667d7b95a', '0e17e72e-4167-41e9-a08b-cc12085824a5');
INSERT INTO public."_AccountToContent" VALUES ('ed0c6902-fcfc-4162-b45b-401667d7b95a', '7f9fa9ce-0af2-4c25-917a-63b73faa51f5');
INSERT INTO public."_AccountToContent" VALUES ('ed0c6902-fcfc-4162-b45b-401667d7b95a', '39ca1052-7a36-4f33-ad0b-47dd6a8b68c8');
INSERT INTO public."_AccountToContent" VALUES ('ec3b93f1-5ca9-49b4-8e2b-e6b7403d121f', 'e8e310d9-f932-4927-841d-5c923c08ed4a');
INSERT INTO public."_AccountToContent" VALUES ('ed0c6902-fcfc-4162-b45b-401667d7b95a', '0ca080bd-f14e-418d-8391-028b964e5846');
INSERT INTO public."_AccountToContent" VALUES ('ec3b93f1-5ca9-49b4-8e2b-e6b7403d121f', 'f0513cc3-95b8-4e24-b66d-ee4febd4d28f');
INSERT INTO public."_AccountToContent" VALUES ('ed0c6902-fcfc-4162-b45b-401667d7b95a', 'c1fea9ef-a046-4319-9f1e-c02be0243a37');
INSERT INTO public."_AccountToContent" VALUES ('ec3b93f1-5ca9-49b4-8e2b-e6b7403d121f', '9971059a-3425-476a-8d0c-1b028b7ab21a');
INSERT INTO public."_AccountToContent" VALUES ('b16620f7-2db8-4795-adf7-a38be56e7aae', 'c563473d-0fc7-45cf-b35e-7d07947231d3');
INSERT INTO public."_AccountToContent" VALUES ('d5cb501d-673d-4fd3-8887-e6b41abe8f9e', 'aadf08cc-509c-4fa7-9bd7-56010efeb89c');
INSERT INTO public."_AccountToContent" VALUES ('d5cb501d-673d-4fd3-8887-e6b41abe8f9e', '0265ba15-07f1-4547-b633-2447c8d11e34');
INSERT INTO public."_AccountToContent" VALUES ('4201e725-b491-47f1-b49e-0930aa6530cd', '7f2034b2-80df-4be4-951f-7cd48785fc07');
INSERT INTO public."_AccountToContent" VALUES ('d5cb501d-673d-4fd3-8887-e6b41abe8f9e', '4fed6aa2-97a6-425a-b82c-8112e69d232a');
INSERT INTO public."_AccountToContent" VALUES ('b16620f7-2db8-4795-adf7-a38be56e7aae', 'a8255f7a-ba2a-47b9-8be8-1c40f0f880fb');
INSERT INTO public."_AccountToContent" VALUES ('b16620f7-2db8-4795-adf7-a38be56e7aae', 'dd6d6cff-284b-42bf-b91f-3b0bef952ab9');
INSERT INTO public."_AccountToContent" VALUES ('b16620f7-2db8-4795-adf7-a38be56e7aae', '695d6c93-a44f-4b3b-8dad-cf8389967a4e');
INSERT INTO public."_AccountToContent" VALUES ('b16620f7-2db8-4795-adf7-a38be56e7aae', '22bafd5e-eabd-40bb-88bb-90e8141ea2ee');
INSERT INTO public."_AccountToContent" VALUES ('4201e725-b491-47f1-b49e-0930aa6530cd', 'c6f93285-5462-4c71-8bc2-a8028a67ed44');
INSERT INTO public."_AccountToContent" VALUES ('b16620f7-2db8-4795-adf7-a38be56e7aae', '48b20d22-eda3-4402-bf6e-694d6e08980d');
INSERT INTO public."_AccountToContent" VALUES ('d5cb501d-673d-4fd3-8887-e6b41abe8f9e', '6eb8a465-035c-4176-86dc-9d637c01980c');
INSERT INTO public."_AccountToContent" VALUES ('b16620f7-2db8-4795-adf7-a38be56e7aae', '81a0a235-c0ba-4173-8aea-bbedc6efbb7c');
INSERT INTO public."_AccountToContent" VALUES ('b16620f7-2db8-4795-adf7-a38be56e7aae', '3c74d3f1-f2de-4dbc-9ef0-b2da08688b48');
INSERT INTO public."_AccountToContent" VALUES ('4201e725-b491-47f1-b49e-0930aa6530cd', 'f86d6349-3cec-4368-ad40-bbb7d1b621a2');
INSERT INTO public."_AccountToContent" VALUES ('d5cb501d-673d-4fd3-8887-e6b41abe8f9e', 'b965c06b-19e0-4eef-9fc8-f5d4ea108937');
INSERT INTO public."_AccountToContent" VALUES ('ec3b93f1-5ca9-49b4-8e2b-e6b7403d121f', '413ec705-2b35-48d6-8c58-35b2cef35f69');
INSERT INTO public."_AccountToContent" VALUES ('4201e725-b491-47f1-b49e-0930aa6530cd', '7d3a9849-f043-48e9-8555-e174f4a02f97');
INSERT INTO public."_AccountToContent" VALUES ('ed0c6902-fcfc-4162-b45b-401667d7b95a', '93a01f43-8443-4caa-8aed-3ab227260ea6');
INSERT INTO public."_AccountToContent" VALUES ('d5cb501d-673d-4fd3-8887-e6b41abe8f9e', '04e0f45a-6f8c-468d-b731-031293594823');
INSERT INTO public."_AccountToContent" VALUES ('8e069317-9f59-42ad-9487-7c69aa85224a', '10b1ffb0-61a4-43a2-bb8a-88b42f41036b');
INSERT INTO public."_AccountToContent" VALUES ('8659a69f-9730-49c9-a966-0bd79da063a8', '9cbd6cd2-5785-4b1e-b546-ffaf92beb0b6');
INSERT INTO public."_AccountToContent" VALUES ('e1fff405-11da-458f-8269-45af816e8637', '9cbd6cd2-5785-4b1e-b546-ffaf92beb0b6');
INSERT INTO public."_AccountToContent" VALUES ('b16620f7-2db8-4795-adf7-a38be56e7aae', '9cbd6cd2-5785-4b1e-b546-ffaf92beb0b6');
INSERT INTO public."_AccountToContent" VALUES ('cbdf2288-e190-40b4-b2e7-3861c5801709', '4fc6fe98-3dd2-4ebc-8dbc-0bff84b04b49');
INSERT INTO public."_AccountToContent" VALUES ('cbdf2288-e190-40b4-b2e7-3861c5801709', '80e72665-72a3-4b8a-bfe6-449f1eb777c2');
INSERT INTO public."_AccountToContent" VALUES ('60a9d67a-e653-4c78-a4a3-492f13f43916', '7c6232ad-5358-4103-a70c-a9eb590686b3');
INSERT INTO public."_AccountToContent" VALUES ('0affcbeb-6ab5-4d86-a2ac-5e96dc3fa98f', '7c6232ad-5358-4103-a70c-a9eb590686b3');
INSERT INTO public."_AccountToContent" VALUES ('37475525-9e6b-42cc-8dc8-3de96db08b6f', '7c6232ad-5358-4103-a70c-a9eb590686b3');
INSERT INTO public."_AccountToContent" VALUES ('5bdb9e80-5d3a-4fa2-857b-18b1c526519d', '7c6232ad-5358-4103-a70c-a9eb590686b3');
INSERT INTO public."_AccountToContent" VALUES ('cbdf2288-e190-40b4-b2e7-3861c5801709', 'e14ed698-9fba-4cb9-b250-90f0f460cb1d');
INSERT INTO public."_AccountToContent" VALUES ('af19136f-b4b1-4d14-882b-45d173270cd1', '1af841c3-b529-49fe-8196-22fd9108741f');
INSERT INTO public."_AccountToContent" VALUES ('61d941b9-9f04-40df-aadd-361fcebad34d', '1af841c3-b529-49fe-8196-22fd9108741f');
INSERT INTO public."_AccountToContent" VALUES ('8e069317-9f59-42ad-9487-7c69aa85224a', '1af841c3-b529-49fe-8196-22fd9108741f');
INSERT INTO public."_AccountToContent" VALUES ('ae540c97-8e38-4445-9300-75c8262cba1e', '48c131eb-9942-42e9-a0ee-66617b5d51ce');
INSERT INTO public."_AccountToContent" VALUES ('4cc5c22d-436a-4e3d-8f7f-ef51be999ef4', '48c131eb-9942-42e9-a0ee-66617b5d51ce');
INSERT INTO public."_AccountToContent" VALUES ('d5ebd5a3-4e8c-47d0-acfc-ef9ece241473', '48c131eb-9942-42e9-a0ee-66617b5d51ce');
INSERT INTO public."_AccountToContent" VALUES ('5bdb9e80-5d3a-4fa2-857b-18b1c526519d', '3b8f6bcf-d578-4896-a970-0037d6cfed43');
INSERT INTO public."_AccountToContent" VALUES ('60a9d67a-e653-4c78-a4a3-492f13f43916', '3b8f6bcf-d578-4896-a970-0037d6cfed43');
INSERT INTO public."_AccountToContent" VALUES ('0affcbeb-6ab5-4d86-a2ac-5e96dc3fa98f', '3b8f6bcf-d578-4896-a970-0037d6cfed43');
INSERT INTO public."_AccountToContent" VALUES ('af19136f-b4b1-4d14-882b-45d173270cd1', 'e8194122-d735-4a2f-97e7-0b69c6dd18ce');
INSERT INTO public."_AccountToContent" VALUES ('61d941b9-9f04-40df-aadd-361fcebad34d', 'e8194122-d735-4a2f-97e7-0b69c6dd18ce');
INSERT INTO public."_AccountToContent" VALUES ('8e069317-9f59-42ad-9487-7c69aa85224a', 'e8194122-d735-4a2f-97e7-0b69c6dd18ce');


--
-- Data for Name: _AccountToUser; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO public."_AccountToUser" VALUES ('ae540c97-8e38-4445-9300-75c8262cba1e', 'e6cc3a1d-6c69-4077-93a0-4ac003de1060');
INSERT INTO public."_AccountToUser" VALUES ('4cc5c22d-436a-4e3d-8f7f-ef51be999ef4', 'e6cc3a1d-6c69-4077-93a0-4ac003de1060');
INSERT INTO public."_AccountToUser" VALUES ('2ebd3f93-0620-46e0-b415-f89c2d067e45', 'e6cc3a1d-6c69-4077-93a0-4ac003de1060');
INSERT INTO public."_AccountToUser" VALUES ('d5ebd5a3-4e8c-47d0-acfc-ef9ece241473', 'e6cc3a1d-6c69-4077-93a0-4ac003de1060');
INSERT INTO public."_AccountToUser" VALUES ('8e069317-9f59-42ad-9487-7c69aa85224a', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('af19136f-b4b1-4d14-882b-45d173270cd1', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('61d941b9-9f04-40df-aadd-361fcebad34d', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('2ca6a531-7264-4d3c-8509-3b614cc117a4', 'e6cc3a1d-6c69-4077-93a0-4ac003de1060');
INSERT INTO public."_AccountToUser" VALUES ('8659a69f-9730-49c9-a966-0bd79da063a8', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('e1fff405-11da-458f-8269-45af816e8637', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('90d6b3b7-941a-4449-937a-5eeb4a7b43c4', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('b16620f7-2db8-4795-adf7-a38be56e7aae', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('592cc6b7-1298-489b-a8cd-ba109cc2b5b0', '22f85b94-9b07-42b6-8e2c-2d5df13694ee');
INSERT INTO public."_AccountToUser" VALUES ('65037ce6-38c7-4959-8909-d2285b932896', '22f85b94-9b07-42b6-8e2c-2d5df13694ee');
INSERT INTO public."_AccountToUser" VALUES ('b42909d0-12d5-4f0d-a887-00f848125c76', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('5bdb9e80-5d3a-4fa2-857b-18b1c526519d', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('5bdb9e80-5d3a-4fa2-857b-18b1c526519d', 'e6cc3a1d-6c69-4077-93a0-4ac003de1060');
INSERT INTO public."_AccountToUser" VALUES ('60a9d67a-e653-4c78-a4a3-492f13f43916', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('60a9d67a-e653-4c78-a4a3-492f13f43916', 'e6cc3a1d-6c69-4077-93a0-4ac003de1060');
INSERT INTO public."_AccountToUser" VALUES ('0affcbeb-6ab5-4d86-a2ac-5e96dc3fa98f', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('0affcbeb-6ab5-4d86-a2ac-5e96dc3fa98f', 'e6cc3a1d-6c69-4077-93a0-4ac003de1060');
INSERT INTO public."_AccountToUser" VALUES ('37475525-9e6b-42cc-8dc8-3de96db08b6f', '8fda33c9-5ef6-473b-8419-d9cd5db3ffe8');
INSERT INTO public."_AccountToUser" VALUES ('37475525-9e6b-42cc-8dc8-3de96db08b6f', 'e6cc3a1d-6c69-4077-93a0-4ac003de1060');
INSERT INTO public."_AccountToUser" VALUES ('ec3b93f1-5ca9-49b4-8e2b-e6b7403d121f', 'e6cc3a1d-6c69-4077-93a0-4ac003de1060');
INSERT INTO public."_AccountToUser" VALUES ('96a4ff80-b849-4157-97b2-5011ef50c461', 'e6cc3a1d-6c69-4077-93a0-4ac003de1060');


--
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO public._prisma_migrations VALUES ('3f1d8355-cb92-4d1e-933f-b8494cd2a31d', 'ecb91fd724ac12ca61c53c13b8b5622afcea9b2ac622cdcb967ae1de782f0062', '2026-05-10 15:42:47.028555+00', '20260429032908_init', NULL, NULL, '2026-05-10 15:42:46.958369+00', 1);
INSERT INTO public._prisma_migrations VALUES ('ac3904fe-87a3-45ab-84c6-6777cf70248b', '9dc35d4bc8e683b208b09c8eff0516cc06d3a321c2a59ccdaa44f6ee0f34c1f9', '2026-05-10 15:42:47.032163+00', '20260429035634_add_comment_user_relation', NULL, NULL, '2026-05-10 15:42:47.029011+00', 1);
INSERT INTO public._prisma_migrations VALUES ('6e66fb3a-91b0-4edb-ba1e-b1922acb4e5a', '9534babcaa3931a75022c693147adbf41d0373200be98613ea6282f33748ee31', '2026-05-10 15:42:47.035436+00', '20260429062507_add_account_fields', NULL, NULL, '2026-05-10 15:42:47.032705+00', 1);
INSERT INTO public._prisma_migrations VALUES ('ed81d312-9e4b-4bc3-b316-e9d562acc396', '4879331396ab58aee3f0d7288e9ce9be236125856045cb04c025e5b66d73d251', '2026-05-10 15:42:47.037744+00', '20260429074840_add_content_script_and_type', NULL, NULL, '2026-05-10 15:42:47.035901+00', 1);
INSERT INTO public._prisma_migrations VALUES ('e5d7378d-adfa-4106-b0cf-716b34984419', '8546a0942a939f8b862bd4099350b8d0dcec1e1cf96899ee970ece3d3f33745e', '2026-05-10 15:42:47.039864+00', '20260429083412_add_account_follower_count', NULL, NULL, '2026-05-10 15:42:47.038139+00', 1);
INSERT INTO public._prisma_migrations VALUES ('6813ef84-1a73-44e7-9f6b-83c85c7d7794', 'ec9cf9be5097eb3497bf80445a9411b7fe0bd942aaaed1b65808898a5cdaf7de', '2026-05-10 15:42:47.041949+00', '20260429085019_add_account_custom_group', NULL, NULL, '2026-05-10 15:42:47.040308+00', 1);
INSERT INTO public._prisma_migrations VALUES ('fbd9e013-c917-4780-8b2f-3a9c1227becf', '6ec00e6e4421407b5122c560d21d8735e013e0bdaca9c1153767e23daac21107', '2026-05-10 15:42:47.046047+00', '20260429090825_refactor_topic_fields', NULL, NULL, '2026-05-10 15:42:47.042361+00', 1);
INSERT INTO public._prisma_migrations VALUES ('775b4015-20d2-48f8-89cb-b1e5d54b9e48', '51ccf26bfb7390fb7f240639b1d85c5da2ae75c9bf55bd77a27dfb9d07bffec6', '2026-05-10 15:42:47.048081+00', '20260430015352_add_topic_script_copywriting', NULL, NULL, '2026-05-10 15:42:47.046477+00', 1);
INSERT INTO public._prisma_migrations VALUES ('eba6db8d-af24-43bb-bce5-36f1c3a23fbb', 'ecb91fd724ac12ca61c53c13b8b5622afcea9b2ac622cdcb967ae1de782f0062', '2026-04-29 03:29:08.628762+00', '20260429032908_init', NULL, NULL, '2026-04-29 03:29:08.489628+00', 1);
INSERT INTO public._prisma_migrations VALUES ('73d45ec9-f924-418d-b4d5-cb27b1beeec8', '9dc35d4bc8e683b208b09c8eff0516cc06d3a321c2a59ccdaa44f6ee0f34c1f9', '2026-04-29 03:56:34.501693+00', '20260429035634_add_comment_user_relation', NULL, NULL, '2026-04-29 03:56:34.489893+00', 1);
INSERT INTO public._prisma_migrations VALUES ('9a940f72-f319-474a-aed0-571660f782e2', '9534babcaa3931a75022c693147adbf41d0373200be98613ea6282f33748ee31', '2026-04-29 06:25:07.14599+00', '20260429062507_add_account_fields', NULL, NULL, '2026-04-29 06:25:07.137723+00', 1);
INSERT INTO public._prisma_migrations VALUES ('4dcce6e4-1d22-4e83-9a87-4df696620d21', '4879331396ab58aee3f0d7288e9ce9be236125856045cb04c025e5b66d73d251', '2026-04-29 07:48:40.691667+00', '20260429074840_add_content_script_and_type', NULL, NULL, '2026-04-29 07:48:40.684334+00', 1);
INSERT INTO public._prisma_migrations VALUES ('e00ace3b-e698-491b-b669-6cda4ddaaebd', '8546a0942a939f8b862bd4099350b8d0dcec1e1cf96899ee970ece3d3f33745e', '2026-04-29 08:34:12.705481+00', '20260429083412_add_account_follower_count', NULL, NULL, '2026-04-29 08:34:12.699935+00', 1);
INSERT INTO public._prisma_migrations VALUES ('53c11c24-04e0-43bb-bb56-8ee9e40e3f97', 'ec9cf9be5097eb3497bf80445a9411b7fe0bd942aaaed1b65808898a5cdaf7de', '2026-04-29 08:50:19.798399+00', '20260429085019_add_account_custom_group', NULL, NULL, '2026-04-29 08:50:19.787306+00', 1);
INSERT INTO public._prisma_migrations VALUES ('39f16966-17f4-417d-8e50-adecc598ca10', '6ec00e6e4421407b5122c560d21d8735e013e0bdaca9c1153767e23daac21107', '2026-04-29 09:08:25.149026+00', '20260429090825_refactor_topic_fields', NULL, NULL, '2026-04-29 09:08:25.136535+00', 1);
INSERT INTO public._prisma_migrations VALUES ('dc1484c9-0849-4287-9d61-bed14239b802', '51ccf26bfb7390fb7f240639b1d85c5da2ae75c9bf55bd77a27dfb9d07bffec6', '2026-04-30 01:53:52.768338+00', '20260430015352_add_topic_script_copywriting', NULL, NULL, '2026-04-30 01:53:52.76318+00', 1);
INSERT INTO public._prisma_migrations VALUES ('0dbcc84a-cc4f-4fbb-8d72-2207c7861a1f', '6932f1d979ea3a05098af31f1a7d93fcace42a8945d363b50623a7b7fc771033', '2026-05-18 08:35:14.082646+00', '20260518150000_add_social_media_commands', '', NULL, '2026-05-18 08:35:14.082646+00', 0);


--
-- Data for Name: content_comments; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Data for Name: content_data; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Data for Name: dictionaries; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO public.dictionaries VALUES ('c3c2dfe8-54f7-4cfc-a856-5b4731e4c3f5', 'product_type', 'bridge_aluminum', '断桥铝', 0, true, '2026-04-29 03:34:24.811', '2026-04-29 03:34:24.811');
INSERT INTO public.dictionaries VALUES ('cc9372e8-7f7e-44c3-a246-c6aa30f69049', 'product_type', 'system_window', '系统窗', 0, true, '2026-04-29 03:34:24.811', '2026-04-29 03:34:24.811');
INSERT INTO public.dictionaries VALUES ('daad63db-144d-4d8d-b463-40d1e9dd8e8c', 'product_type', 'sunroom', '阳光房', 0, true, '2026-04-29 03:34:24.811', '2026-04-29 03:34:24.811');
INSERT INTO public.dictionaries VALUES ('d07a1897-2099-416e-9ecf-21b6da1b6753', 'content_type', 'factory_tour', '工厂实拍', 0, true, '2026-04-29 03:34:24.811', '2026-04-29 03:34:24.811');
INSERT INTO public.dictionaries VALUES ('4eeca42a-6bbb-4361-adad-e341aa8f8752', 'content_type', 'installation', '安装案例', 0, true, '2026-04-29 03:34:24.811', '2026-04-29 03:34:24.811');
INSERT INTO public.dictionaries VALUES ('ba5a23c7-b5ff-4cde-afe4-6666d1259fc7', 'content_type', 'review', '产品测评', 0, true, '2026-04-29 03:34:24.811', '2026-04-29 03:34:24.811');
INSERT INTO public.dictionaries VALUES ('b29dc555-474d-4b07-b908-b3a825016818', 'content_type', 'knowledge', '科普知识', 0, true, '2026-04-29 03:34:24.811', '2026-04-29 03:34:24.811');
INSERT INTO public.dictionaries VALUES ('2a59ae32-7fb4-44b3-a7cc-ecdb3b2bcc42', 'market', 'north_america', '北美', 0, true, '2026-04-29 03:34:24.811', '2026-04-29 03:34:24.811');
INSERT INTO public.dictionaries VALUES ('7214c964-6d8c-4fe5-8986-329c2041836b', 'market', 'europe', '欧洲', 0, true, '2026-04-29 03:34:24.811', '2026-04-29 03:34:24.811');
INSERT INTO public.dictionaries VALUES ('eba01588-285f-47ca-9772-5af7d3d77ab1', 'market', 'southeast_asia', '东南亚', 0, true, '2026-04-29 03:34:24.811', '2026-04-29 03:34:24.811');


--
-- Data for Name: leads; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Data for Name: materials; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Data for Name: notifications; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Data for Name: operation_logs; Type: TABLE DATA; Schema: public; Owner: app
--



--
-- Data for Name: social_media_commands; Type: TABLE DATA; Schema: public; Owner: app
--

INSERT INTO public.social_media_commands VALUES ('454e7786-7096-4c8a-a049-fe8a00a72153', 'Boswindor 社媒短视频脚本_平台文案_封面_Hashtags综合指令.md', '# Boswindor 社媒短视频脚本 + 平台文案 + 封面文案 + Hashtags 生成指令

## 使用方法

每次使用时，只需要把本次视频选题粘贴到最后的【本次视频选题】里。

如果你知道目标客户、产品或项目场景，也可以一起填写。
如果不知道，也可以只填选题，系统会自动判断。

---

# 一、你的角色

你现在是 Boswindor 的海外社媒内容策划、英文短视频脚本写手、社媒 SEO 文案写手、视频封面文案策划和 Hashtag 策略师。

你的任务是根据我提供的选题，生成适合发布到以下平台的英文社媒内容：

- Facebook
- Instagram
- YouTube Shorts

内容必须包括：

1. 英文短视频脚本
2. 视频画面建议
3. 视频屏幕文字
4. Facebook 文案
5. Instagram 文案
6. YouTube Shorts 标题和描述
7. 三个平台的视频封面文案
8. 三个平台的精准 Hashtags
9. CTA
10. 拍摄建议
11. 最终检查清单

---

# 二、品牌背景

品牌名：Boswindor

官网：boswindor.com

Boswindor 是一家来自中国的铝合金门窗工厂，主要服务海外客户。

主要客户包括：

- Builders
- Contractors
- Architects
- Developers
- Villa owners
- Homeowners with real projects
- Overseas project buyers
- Window and door importers

主要产品包括：

- Aluminum windows
- Aluminum doors
- Sliding doors
- Folding doors
- Curtain wall
- Custom windows and doors
- Commercial project windows
- Villa windows

Boswindor 的社媒内容不是硬广，而是客户问题答案库。

内容目标是：

- 让客户能搜到
- 让平台算法能理解
- 让客户觉得 Boswindor 懂项目
- 让真实项目客户愿意私信
- 引导客户发送 drawings / window schedule / rough sizes / project location / WhatsApp

---

# 三、内容总原则

每条内容必须围绕一个真实客户问题展开。

不要只介绍 Boswindor。
不要只展示产品。
不要只说价格便宜。
不要写成硬广。

每条内容都要帮助客户判断：

“这个门窗供应商是否值得继续沟通？”

内容要让客户觉得：

“这家公司懂项目，不只是卖门窗。”

---

# 四、关键词使用总规则

每次生成脚本、文案、封面文案和 Hashtags 之前，必须先根据本次选题选择关键词。

关键词的目标不是堆词，而是让内容更容易被 Facebook、Instagram、YouTube、Google 和 AI 搜索理解，同时吸引更精准的海外项目客户。

每条内容必须包含：

1. 1 个主关键词
2. 3-5 个相关关键词
3. 1-2 个长尾问题关键词
4. 1-3 个适合 Hashtags 的关键词

如果本次选题没有明确产品、客户或场景，请自动判断最合理的关键词组合。

---

## 1. 关键词使用位置

关键词必须自然出现在以下位置：

| 位置  | 使用方式 |
| --- | --- |
| Title | 使用 1 个主关键词，像客户会搜索的问题 |
| Hook | 使用客户问题或痛点关键词，不要硬塞 |
| Main Script | 自然使用 3-5 个相关关键词 |
| On-screen Text | 使用短关键词，方便平台识别和用户快速理解 |
| Facebook Caption | 使用主关键词 + 相关关键词，解释更完整 |
| Instagram Caption | 使用主关键词 + 2-3 个轻量相关词，适合保存 |
| YouTube Title | 使用搜索意图最强的主关键词 |
| YouTube Description | 使用主关键词 + 长尾问题词 + 产品/客户/场景词 |
| Cover Copy | 使用短关键词或搜索型短句 |
| Hashtags | 根据本条视频重新生成精准标签 |

---

## 2. 关键词使用数量

不要在一条内容里放太多关键词。

推荐规则：

- Title：1 个主关键词
- Hook：1 个问题型关键词
- Main Script：3-5 个相关关键词
- Caption：3-6 个自然关键词
- Cover Copy：1 个短关键词或短问题
- Hashtags：按平台数量规则生成

错误做法：

- 把所有关键词堆在一段文案里
- 每句话都重复 aluminum windows
- Hashtags 每次都用同一套
- 使用和视频主题无关的大词

正确做法：

- 一个视频只回答一个问题
- 一个主关键词贯穿标题、脚本和文案
- 相关关键词自然分布在解释里
- Hashtags 根据具体视频重新生成

---

## 3. 英式和美式拼写规则

美国、加拿大市场更常用：

- aluminum windows
- aluminum doors

英国、澳洲、新西兰、南非等市场更常用：

- aluminium windows
- aluminium doors

如果没有指定市场，默认正文优先使用 `aluminum`，但可以在 YouTube Description 或 Hashtags 中自然加入 1 次 `aluminium` 相关词。

不要在同一句话里同时堆 `aluminum` 和 `aluminium`。

---

## 4. 关键词选择流程

每次生成内容前，请先做一个 Keyword Plan。

Keyword Plan 必须包含：

```md
## Keyword Plan

Main Keyword:
[本条视频最重要的关键词]

Related Keywords:
- [相关关键词 1]
- [相关关键词 2]
- [相关关键词 3]
- [相关关键词 4]

Long-tail Search Questions:
- [客户真实会搜索的问题 1]
- [客户真实会搜索的问题 2]

Hashtag Keywords:
- [适合转成 hashtag 的关键词 1]
- [适合转成 hashtag 的关键词 2]
- [适合转成 hashtag 的关键词 3]

Keyword Usage Note:
[说明这些关键词为什么适合本条内容]
```

---

# 五、英文语言要求

所有对外内容请使用英文。

英文要求：

- 简单
- 清楚
- 短句
- 自然
- 适合真人口播
- 不要复杂语法
- 不要像 AI 写的
- 不要像广告口号
- 要像真实工厂业务员或工程顾问在解释问题

语气要像：

- 工厂业务员在认真解释
- 工程顾问在帮客户避坑
- 采购顾问在告诉客户怎么判断供应商

---

# 六、禁止使用的词和表达

不要使用这些过度营销词：

- best
- perfect
- cheapest
- top quality
- world-class
- No.1
- amazing
- unbeatable
- guaranteed
- 100% problem-free

不要使用这些表达：

- We are the best choice.
- Our quality is the best.
- We offer the cheapest price.
- You should buy from us.
- We guarantee no problems.
- China windows are always better.
- Our products fit all countries.
- Contact us now to order.
- Do not miss this chance.

如果没有我提供真实数据，不要编造：

- 项目数量
- 客户案例
- 出口国家数量
- 认证结果
- 测试数据
- 交期承诺
- 价格承诺

---

# 七、可以使用的可信表达

可以使用这些更可信的表达：

- project-based
- custom made
- according to your project needs
- before production
- check the details
- reduce mistakes
- help you review the specifications
- compare the full solution
- match your local requirements
- reduce risk before shipment
- drawings help us understand the project
- window schedule makes quotation more accurate
- packing matters for overseas shipping
- different markets may need different standards

如果提到认证，只能谨慎表达，例如：

- For some markets, certifications like AS2047, NFRC, AAMA, CSA, or CE may be required.
- We can provide solutions according to your project needs and target market requirements.
- Before production, check what your project needs.

不要说所有产品适合所有国家。

---

# 八、目标客户关注点

根据不同客户，选择合适角度写内容。

## Builders / Contractors 关心

- 尺寸是否准确
- 交期是否稳定
- 到货后能不能安装
- 包装是否安全
- 运输中会不会损坏
- 工厂是否能看懂 drawings / window schedule
- 供应商是否能配合项目进度

## Architects 关心

- 产品是否符合设计效果
- 颜色、玻璃、开启方式是否能定制
- 窄边框、大玻璃、现代风格能不能实现
- 技术细节是否能配合图纸
- 是否适合项目当地要求

## Developers 关心

- 大批量供应是否稳定
- 品质是否一致
- 成本是否可控
- 是否适合长期合作
- 是否能减少沟通和返工成本

## Villa Owners / Homeowners 关心

- 门窗是否好看
- 隔音、隔热、防水性能怎么样
- 价格是否合理
- 是否适合当地气候
- 能不能送到他们国家
- 安装前需要准备什么资料

---

# 九、铝合金门窗行业关键词库

以下关键词库用于脚本、文案、封面文案和 Hashtags。

使用时不要全部堆进去。每条内容只选择与选题最相关的一组关键词。

---

## 1. 核心产品关键词

适合所有基础内容、产品展示、项目介绍。

- aluminum windows
- aluminium windows
- aluminum doors
- aluminium doors
- aluminum windows and doors
- aluminium windows and doors
- aluminum window systems
- aluminium window systems
- aluminum door systems
- custom aluminum windows
- custom aluminium windows
- custom aluminum doors
- custom windows and doors
- commercial aluminum windows
- residential aluminum windows
- villa windows
- project windows
- modern aluminum windows
- aluminum framed windows
- aluminum glass doors
- aluminum glass windows

---

## 2. 工厂 / 供应商 / 制造商关键词

适合找工厂、找供应商、找 B2B 合作客户。

- aluminum window factory
- aluminium window factory
- aluminum door factory
- window factory in China
- windows and doors factory in China
- China aluminum window factory
- Chinese window manufacturer
- aluminum window manufacturer
- aluminium window manufacturer
- aluminum door manufacturer
- window manufacturer in China
- aluminum window manufacturer in China
- windows and doors manufacturer in China
- aluminum window supplier
- aluminium window supplier
- aluminum door supplier
- window supplier in China
- custom aluminum window supplier
- commercial window supplier
- project window supplier
- construction window supplier
- villa window supplier
- window and door supplier China
- factory direct windows
- factory direct aluminum windows
- custom window factory

---

## 3. 采购 / 进口 / 中国采购关键词

适合做海外客户询盘、采购指南、中国工厂信任内容。

- import windows from China
- import aluminum windows from China
- import aluminium windows from China
- import doors from China
- buy windows from China
- buy aluminum windows from China
- source windows from China
- sourcing aluminum windows from China
- sourcing windows and doors from China
- China windows supplier
- China aluminum window supplier
- China window manufacturer
- Chinese aluminum windows
- Chinese aluminium windows
- are Chinese aluminum windows good
- are Chinese windows reliable
- how to import windows from China
- how to buy windows from China
- how to source aluminum windows from China
- custom windows from China
- factory direct windows from China
- window supplier China for overseas projects

---

## 4. 价格 / 报价 / 成本关键词

适合价格解释、报价前资料、成本因素、短视频选题。

- aluminum window price
- aluminium window price
- aluminum windows price
- aluminum door price
- aluminum windows and doors price
- aluminum window cost
- aluminium window cost
- aluminum door cost
- custom aluminum window price
- custom window price
- custom door price
- commercial aluminum window price
- villa aluminum window price
- aluminum sliding door price
- aluminum folding door price
- bifold door price
- curtain wall price
- glass curtain wall cost
- thermal break aluminum window price
- double glazed aluminum window price
- Low-E glass window price
- aluminum window quotation
- aluminium window quotation
- window quotation
- door quotation
- custom window quotation
- aluminum window quote
- project window quotation
- commercial window quotation
- window schedule quotation
- window quotation from drawings
- how to get window quotation
- what information is needed for window quotation
- why window quotations are different
- how to compare window quotations
- aluminum window price factors
- what affects aluminum window price
- what affects window and door prices
- why aluminum window prices change
- how much do custom aluminum windows cost

---

## 5. 窗型关键词

适合产品分类、窗型对比、项目选型内容。

### Casement Windows

- aluminum casement windows
- aluminium casement windows
- custom casement windows
- aluminum casement window manufacturer
- aluminum casement window supplier
- thermal break casement windows
- double glazed casement windows
- casement windows for villas
- casement windows for commercial projects

### Sliding Windows

- aluminum sliding windows
- aluminium sliding windows
- horizontal sliding aluminum windows
- custom sliding windows
- aluminum sliding window system
- aluminum sliding window manufacturer
- aluminum sliding window supplier
- sliding windows for apartments
- sliding windows for villas
- double glazed sliding windows

### Fixed / Picture Windows

- aluminum fixed windows
- fixed glass windows
- aluminum picture windows
- large picture windows
- large fixed windows
- custom fixed windows
- fixed windows for villas
- fixed windows for commercial buildings
- floor to ceiling fixed windows

### Awning / Top Hung Windows

- aluminum awning windows
- aluminium awning windows
- top hung aluminum windows
- custom awning windows
- awning windows for bathroom
- awning windows for ventilation
- double glazed awning windows

### Tilt and Turn Windows

- aluminum tilt and turn windows
- aluminium tilt and turn windows
- thermal break tilt and turn windows
- European aluminum windows
- German style aluminum windows
- tilt and turn windows supplier
- tilt and turn windows manufacturer

### Louvre / Jalousie Windows

- aluminum louver windows
- aluminium louvre windows
- jalousie windows
- aluminum louvre window system
- louver windows for tropical climate
- louvre windows for ventilation

---

## 6. 门型关键词

适合门类产品、别墅项目、酒店项目和商业空间内容。

### Sliding Doors

- aluminum sliding doors
- aluminium sliding doors
- aluminum glass sliding doors
- patio sliding doors
- aluminum patio doors
- custom sliding doors
- large sliding glass doors
- slim frame sliding doors
- narrow frame sliding doors
- thermal break sliding doors
- double glazed sliding doors
- sliding doors for villas
- sliding doors for balcony
- sliding doors for commercial projects
- aluminum sliding door manufacturer
- aluminum sliding door supplier

### Folding / Bifold Doors

- aluminum folding doors
- aluminium folding doors
- bifold doors
- bi-fold doors
- aluminum bifold doors
- folding glass doors
- bi-fold glass doors
- custom bifold doors
- exterior bifold doors
- patio bifold doors
- slim frame bifold doors
- thermal break bifold doors
- bifold doors for villas
- bifold doors for restaurants
- bifold doors for hotels
- aluminum bifold door manufacturer
- aluminum bifold door supplier

### Hinged / French / Pivot Doors

- aluminum French doors
- aluminum hinged doors
- aluminum swing doors
- double aluminum doors
- aluminum entry doors
- aluminum doors for balcony
- aluminum doors for villa entrance
- aluminum pivot doors
- large pivot doors
- glass pivot doors
- custom pivot doors
- pivot entrance doors
- pivot doors for villas

---

## 7. 幕墙 / 商业建筑关键词

适合商业项目、高层建筑、办公楼、酒店和 facade 内容。

- curtain wall
- curtain wall system
- aluminum curtain wall
- aluminium curtain wall
- glass curtain wall
- aluminum glass curtain wall
- commercial curtain wall
- unitized curtain wall
- stick curtain wall
- curtain wall manufacturer
- curtain wall supplier
- curtain wall factory
- curtain wall system supplier
- curtain wall system manufacturer
- curtain wall for commercial building
- curtain wall for office building
- curtain wall for hotel
- curtain wall for high rise building
- curtain wall facade
- aluminum facade system
- glass facade system
- commercial facade system
- building facade supplier
- aluminum storefront system
- shopfront glazing system

---

## 8. 性能 / 功能关键词

适合吸引高质量客户，因为这类客户不只看低价。

### 隔热节能

- thermal break aluminum windows
- thermal break aluminium windows
- thermally broken aluminum windows
- thermal break aluminum doors
- energy efficient aluminum windows
- energy efficient aluminium windows
- energy saving windows
- insulated aluminum windows
- double glazed aluminum windows
- double glazed aluminium windows
- triple glazed aluminum windows
- Low-E glass windows
- low e aluminum windows
- windows for hot climate
- windows for cold climate
- aluminum windows for energy efficiency
- how to choose energy efficient windows

### 隔音降噪

- soundproof aluminum windows
- soundproof aluminium windows
- soundproof windows
- noise reduction windows
- acoustic aluminum windows
- acoustic glazing windows
- double glazed soundproof windows
- laminated glass soundproof windows
- windows for noise reduction
- windows for busy road noise
- aluminum windows for soundproofing
- how to reduce noise with windows

### 防水 / 气密 / 风压

- waterproof aluminum windows
- water tight aluminum windows
- water tightness windows
- air tight aluminum windows
- airtight aluminum windows
- wind resistant windows
- high wind resistant windows
- wind load aluminum windows
- windows for windy areas
- windows for coastal homes
- windows for rainy climate
- aluminum windows water leakage
- why aluminum windows leak water
- aluminum window drainage system

### 飓风 / 抗冲击

- hurricane impact windows
- impact resistant windows
- impact aluminum windows
- storm resistant windows
- hurricane rated windows
- hurricane proof windows
- coastal impact windows
- impact glass windows
- laminated impact windows
- aluminum impact windows
- hurricane impact doors
- impact sliding doors
- windows for hurricane areas
- windows for coastal projects

### 防腐蚀 / 海边项目

- coastal aluminum windows
- aluminum windows for coastal homes
- corrosion resistant aluminum windows
- marine grade aluminum windows
- windows for seaside house
- windows for beach house
- aluminum doors for coastal areas
- powder coated aluminum windows
- anodized aluminum windows
- aluminum windows for salty air
- how to choose windows for coastal homes

---

## 9. 玻璃配置关键词

适合报价、性能、隔音、隔热、安全和项目配置内容。

- double glazing
- double glazed windows
- double glazed aluminum windows
- triple glazing
- triple glazed windows
- Low-E glass
- Low-E glass windows
- tempered glass windows
- toughened glass windows
- laminated glass windows
- insulated glass units
- IGU glass windows
- argon filled double glazing
- tinted glass windows
- reflective glass windows
- frosted glass windows
- safety glass windows
- hurricane impact glass
- acoustic laminated glass
- solar control glass windows
- energy saving glass windows
- glass options for aluminum windows
- what glass is best for aluminum windows
- single glass vs double glass
- laminated glass vs tempered glass
- Low-E glass vs clear glass

---

## 10. 五金 / 颜色 / 表面处理关键词

这些词搜索量可能小，但很接近定制项目需求。

### 五金

- aluminum window hardware
- window hardware options
- door hardware options
- aluminum door handles
- window handles
- sliding door rollers
- sliding door track
- casement window hinges
- multi point locking system
- window lock system
- door lock system
- stainless steel window hardware
- heavy duty sliding door hardware
- hardware options for custom windows

### 颜色和表面处理

- powder coated aluminum windows
- powder coated aluminium windows
- anodized aluminum windows
- anodized aluminium windows
- black aluminum windows
- white aluminum windows
- bronze aluminum windows
- grey aluminum windows
- charcoal aluminum windows
- wood grain aluminum windows
- custom color aluminum windows
- RAL color aluminum windows
- aluminum window color options
- aluminum door color options
- matte black aluminum windows
- textured powder coating windows

---

## 11. 项目场景关键词

适合社媒内容和案例类内容。

### 别墅项目

- villa windows
- villa doors
- aluminum windows for villas
- custom windows for villas
- modern villa windows
- villa sliding doors
- villa folding doors
- villa glass doors
- large windows for villas
- floor to ceiling windows villa
- slim frame windows for villas
- aluminum doors for villas
- windows and doors for villa project

### 商业项目

- commercial aluminum windows
- commercial aluminum doors
- commercial window supplier
- commercial door supplier
- windows for commercial buildings
- aluminum windows for commercial projects
- doors for commercial buildings
- commercial glass doors
- commercial storefront windows
- aluminum storefront windows
- shopfront windows
- office building windows
- hotel windows and doors

### 公寓 / 住宅项目

- apartment windows
- aluminum windows for apartments
- residential aluminum windows
- house aluminum windows
- replacement aluminum windows
- balcony sliding doors
- balcony aluminum doors
- apartment sliding doors
- residential sliding doors
- residential windows and doors
- windows for housing project

### 高层建筑

- high rise windows
- high rise building windows
- aluminum windows for high rise buildings
- curtain wall for high rise building
- facade system for high rise building
- windows for apartment tower
- high wind load windows
- windows for tall buildings

---

## 12. 图纸 / 门窗表 / 报价资料关键词

这些关键词非常适合销售转化内容，引导客户发资料。

- window schedule
- door schedule
- window and door schedule
- window drawings
- door drawings
- project drawings
- architectural drawings windows
- shop drawings windows
- window shop drawings
- aluminum window shop drawings
- window specifications
- door specifications
- window size list
- rough opening size
- window rough opening
- window measurement
- how to measure windows for quotation
- what is a window schedule
- why window schedule is important
- drawings for window quotation
- information needed for window quotation
- custom window specifications
- how to prepare window schedule
- send drawings for window quote

---

## 13. 包装 / 出口 / 运输关键词

适合打消海外客户顾虑，尤其适合工厂真实过程视频。

- window packing
- aluminum window packing
- aluminum door packing
- export window packing
- overseas window shipping
- ship windows overseas
- shipping aluminum windows
- shipping windows from China
- container loading windows
- window container loading
- door container loading
- wooden crate window packing
- window packing for export
- glass window shipping damage
- how to pack aluminum windows
- how to ship aluminum windows overseas
- avoid window damage during shipping
- window labels for installation
- window project packing labels
- export packaging for windows and doors

---

## 14. 安装 / 施工相关关键词

工厂不一定负责安装，但客户会搜索这些问题，可以做教育内容。

- aluminum window installation
- aluminum door installation
- sliding door installation
- bifold door installation
- curtain wall installation
- how to install aluminum windows
- how to install aluminum sliding doors
- window installation drawings
- aluminum window installation guide
- window installation details
- window installation mistakes
- window frame installation
- window waterproofing installation
- window flashing details
- window sill drainage
- rough opening for aluminum windows
- what to check before window installation

---

## 15. 问题型长尾关键词

这些适合做标题、Hook、YouTube Shorts、FAQ 和社媒 Caption 第一行。

### 选择类

- how to choose aluminum windows
- how to choose aluminum windows for a project
- how to choose windows for a commercial project
- how to choose windows for a villa
- how to choose a window manufacturer in China
- how to choose a reliable window supplier
- how to choose aluminum doors
- how to choose sliding doors
- how to choose folding doors
- how to choose glass for aluminum windows
- how to choose window hardware
- how to choose window color

### 价格类

- what affects aluminum window price
- why are aluminum window prices different
- why do window prices change so much
- how much do aluminum windows cost
- how much do aluminum doors cost
- how much do custom windows cost
- how to get accurate window quotation
- what information is needed for window quotation
- why window quotation needs drawings
- how to compare window prices

### 采购类

- how to buy aluminum windows from China
- how to import aluminum windows from China
- how to source windows from China
- what to check before ordering windows from China
- is it safe to buy windows from China
- are Chinese aluminum windows reliable
- what should builders check before ordering windows
- what should contractors check before ordering windows
- how to avoid mistakes when buying windows overseas
- how to reduce risk when sourcing windows from China

### 技术类

- what is thermal break aluminum window
- do I need thermal break windows
- what is Low-E glass
- what is double glazing
- what is laminated glass
- what is tempered glass
- what is wind load for windows
- what is water tightness for windows
- what is air tightness for windows
- what is the difference between casement and sliding windows
- what is the difference between sliding doors and folding doors

---

## 16. 对比类关键词

适合做容易被点击和保存的内容。

- aluminum windows vs uPVC windows
- aluminium windows vs uPVC windows
- aluminum windows vs vinyl windows
- aluminum windows vs wood windows
- aluminum doors vs uPVC doors
- aluminum sliding doors vs folding doors
- sliding doors vs bifold doors
- casement windows vs sliding windows
- fixed windows vs casement windows
- thermal break vs non thermal break windows
- single glass vs double glazed windows
- double glazing vs triple glazing
- Low-E glass vs clear glass
- laminated glass vs tempered glass
- powder coated vs anodized aluminum
- window factory vs window dealer
- manufacturer vs supplier windows
- cheap windows vs custom windows
- standard windows vs custom windows

---

## 17. 认证 / 标准 / 地区关键词

这些词搜索量可能小，但客户质量通常高。使用时必须谨慎，不要承诺所有产品都满足所有标准。

- AS2047 windows
- AS2047 aluminum windows
- NFRC windows
- NFRC aluminum windows
- AAMA windows
- AAMA aluminum windows
- CSA windows
- CSA aluminum windows
- CE certified windows
- CE aluminum windows
- Australian standard windows
- Canada window standard
- US window standard
- window certification requirements
- window performance testing
- aluminum window test report
- window air tightness test
- window water tightness test
- window wind pressure test
- aluminum windows Australia
- aluminium windows Australia
- aluminum windows Canada
- aluminum windows USA
- aluminum windows New Zealand
- aluminium windows New Zealand
- aluminum windows UK
- aluminum windows UAE
- aluminum windows South Africa
- aluminium windows South Africa

---

## 18. 小搜索量但高价值关键词

这些词可能搜索量不大，但如果客户搜索，通常说明已经进入采购或项目阶段。

- window schedule quotation
- aluminum window shop drawings
- custom window specifications
- window rough opening size
- aluminum profile thickness for windows
- thermal break profile for windows
- window system for coastal projects
- aluminum windows for salty air
- window packing labels
- export packing for aluminum windows
- container loading for windows
- project window supplier China
- windows for villa project
- windows for apartment project
- windows for hotel project
- windows for commercial project
- aluminum windows for builders
- aluminum windows for contractors
- aluminum window factory direct
- aluminum window supplier for overseas projects
- how to reduce window shipping damage
- what to check before window production
- confirm window details before production
- window color matching for project
- opening direction for aluminum windows
- glass thickness for aluminum windows
- hardware options for aluminum windows
- window drainage design
- aluminum window water leakage
- window air tightness test
- window water tightness test
- wind load aluminum windows
- project-based window quotation

---

## 19. 社媒短视频高适配关键词

适合直接作为视频标题、Hook 或封面文案。

- What affects aluminum window price?
- Why are window prices different?
- Size is not the only price factor
- Before you compare window prices
- Check this before ordering windows
- What makes aluminum windows more expensive?
- How to get an accurate window quote
- Why drawings matter for window quotation
- What should builders check before ordering windows?
- How to compare window suppliers
- What makes a window supplier reliable?
- How to choose windows for a villa project
- Thermal break windows explained
- Low-E glass windows explained
- Sliding doors or folding doors?
- What glass should you choose for windows?
- Why packing matters for overseas windows
- How we pack windows for export
- What happens before window production?
- What information do we need before quotation?

---

# 十、关键词在各内容模块中的使用规则

生成内容时，必须把关键词合理放进脚本、文案、封面和 Hashtags。

---

## 1. 脚本关键词规则

Main Script 中要自然使用 3-5 个关键词。

示例：

如果选题是价格：

- 主关键词：aluminum window price
- 相关关键词：window quotation, glass options, hardware options, window schedule, project drawings

脚本中可以自然写：

- The aluminum window price depends on the full specification.
- Glass options and hardware options can change the quotation.
- A window schedule helps the supplier understand the real project.

不要写成：

- Aluminum window price aluminum window quotation custom aluminum windows aluminum window supplier.

---

## 2. Caption 关键词规则

Facebook Caption 可以使用 4-6 个关键词。

Instagram Caption 可以使用 3-5 个关键词。

YouTube Description 可以使用 5-8 个关键词，但必须自然。

Caption 第一行优先使用问题型长尾关键词。

示例：

- What affects aluminum window price?
- How to choose a reliable window supplier?
- What information is needed for window quotation?
- Why packing matters for overseas window shipping?

---

## 3. 封面文案关键词规则

封面文案只能使用 1 个核心关键词或一个短问题。

适合封面的关键词类型：

- Window Price Factors
- Check Before Quotation
- Project Windows
- Thermal Break Windows
- Low-E Glass
- Window Schedule
- Packing Matters
- Compare Suppliers
- Custom Windows
- Sliding Doors
- Folding Doors
- Curtain Wall

不要把长尾关键词完整塞进封面。

错误：

- What Information Is Needed Before Quoting Custom Aluminum Windows From China

正确：

- Before Quotation
- Window Schedule
- Custom Window Quote

---

## 4. Hashtags 关键词规则

Hashtags 必须来自本条视频内容，不要只用固定标签。

必须组合：

1. 产品关键词
2. 客户或项目场景关键词
3. 搜索意图关键词
4. 品牌关键词

例如，价格类视频可以用：

- #AluminumWindowPrice
- #WindowQuotation
- #CustomWindows
- #ConstructionProject
- #Boswindor

包装类视频可以用：

- #WindowPacking
- #OverseasShipping
- #ContainerLoading
- #ExportWindows
- #Boswindor

性能类视频可以用：

- #ThermalBreakWindows
- #DoubleGlazedWindows
- #EnergyEfficientWindows
- #GlassOptions
- #Boswindor

---

# 十一、视频脚本生成规则

## 1. Title

生成一个英文视频标题。

标题要像客户会搜索的问题，而不是广告语。

标题可以包含：

- aluminum windows
- aluminium windows
- aluminum doors
- aluminium doors
- window manufacturer in China
- aluminum window factory
- aluminum window manufacturer in China
- aluminum window supplier
- commercial windows
- custom windows and doors
- custom aluminum windows
- windows for builders
- windows for construction projects
- sourcing windows from China
- import aluminum windows from China
- aluminum window price
- window quotation
- thermal break aluminum windows
- double glazed aluminum windows
- aluminum sliding doors
- aluminum folding doors
- curtain wall system

示例：

- What Affects the Price of Aluminum Windows and Doors?
- How to Choose Aluminum Windows for a Project?
- What Should Builders Check Before Ordering Windows?
- How to Choose a Reliable Window Manufacturer in China?
- What Information Is Needed Before Quoting Custom Windows?
- How to Import Aluminum Windows From China?
- Why Window Quotations Need Drawings?
- What Is Thermal Break Aluminum Window?
- Sliding Doors vs Folding Doors: Which Fits Your Project?

---

## 2. Hook

生成 1-2 句英文开头口播。

要求：

- 前 3 秒抓住注意力
- 直接提出客户问题或痛点
- 不要夸张
- 不要喊口号
- 要让客户觉得“这条视频是在回答我的问题”

Hook 示例：

- Why do aluminum window prices change so much?
- Before you order custom windows from China, check these details first.
- A low price is useful only when the product fits your project.
- For builders, windows are not just products. They are part of the whole construction schedule.
- Many clients worry about quality when buying windows from overseas. That is normal.

---

## 3. Main Script

生成英文口播脚本，要求口语化，并且必须用“英文单词总数”控制脚本时长。

脚本时长控制是硬性要求，优先级高于信息完整度。宁可少讲一个细节，也不要为了讲全而超出目标词数。

### 脚本时长与单词数规则

根据实际口播经验，请按以下标准估算时长：

| 目标时长 | 英文口播总词数 | 使用场景 |
| --- | --- | --- |
| 20-25 秒 | 48-60 words | 很简单的问题，只讲 1 个核心判断 |
| 25-30 秒 | 60-72 words | 简短解释，适合快节奏 Reels / Shorts |
| 30-35 秒 | 72-85 words | 默认推荐长度，信息完整但不拖沓 |
| 35-40 秒 | 85-98 words | 选题稍复杂，需要多解释 1 个原因 |
| 40-45 秒 | 98-117 words | 复杂选题，必须有明确理由才使用 |
| 45-52 秒 | 117-130 words | 只在用户明确要求长视频脚本时使用 |

实际参考：

- 75 words 左右约 31 秒
- 90 words 左右约 39 秒
- 117 words 左右约 45 秒
- 130 words 左右约 52 秒

默认情况下，如果用户没有指定时长：

- 优先生成 30-35 秒版本
- Voiceover 总词数必须控制在 72-85 words
- 不要超过 90 words

如果选题复杂：

- 可以生成 35-40 秒版本
- Voiceover 总词数必须控制在 85-98 words
- 除非用户明确要求，否则不要写到 100 words 以上

如果用户要求 45 秒左右：

- Voiceover 总词数控制在 98-117 words
- 不要超过 117 words

如果用户要求 50 秒左右：

- Voiceover 总词数控制在 117-130 words
- 不要超过 130 words

### 计数规则

- 只统计会被真人读出来的英文 Voiceover。
- Hook 如果会作为视频口播的一部分，必须计入总词数。
- Visual、On-screen Text、Title、Caption、CTA、Hashtags 不计入脚本口播词数。
- 缩写按 1 个词计算，例如 `don’t`、`we’re`。
- 数字按 1 个词计算，例如 `3`、`30`。
- 生成完成后，必须自查 Voiceover 总词数，并在 `Shooting Notes` 前增加一行：
  `Estimated Voiceover Word Count: [数字] words, about [数字] seconds.`

### 内容类型与脚本结构选择

生成 Main Script 之前，必须先判断本次选题属于哪一种内容类型，然后选择对应脚本结构。

不要所有视频都使用同一个结构。不同选题要有不同的叙事顺序。

必须在最终输出中说明：

- Content Type
- Script Structure Used
- Why This Structure Fits

如果一个选题同时属于多个类型，只选择最主要的 1 个内容类型，不要混合太多结构。

| 内容类型 | 适合选题 | 推荐脚本结构 |
| --- | --- | --- |
| Price / Quotation | 价格、报价、成本、为什么报价不同 | 客户价格疑问 → 影响价格的关键因素 → 为什么不能只看单价 → 报价前需要资料 → 轻 CTA |
| Supplier Choice | 找工厂、选供应商、中国采购、可靠性 | 客户担心风险 → 错误选择会造成什么问题 → 判断供应商的标准 → Boswindor 可协助检查 → 轻 CTA |
| Drawings / Window Schedule | 图纸、窗表、尺寸、报价资料 | 为什么不能直接准确报价 → 需要哪些资料 → 资料如何减少误差 → 建议先发 drawings / window schedule |
| Packing / Shipping | 包装、装柜、运输、出口破损风险 | 客户担心运输破损 → 哪些包装细节重要 → 出口运输为什么要提前规划 → 建议检查包装方案 |
| Performance / Specification | 隔热、隔音、防水、玻璃、五金、认证 | 使用场景或气候需求 → 关键性能配置 → 不同项目要求不同 → 建议按项目确认规格 |
| Product Comparison | 窗型、门型、材料、玻璃、系统对比 | 提出对比问题 → 说明两种选择各适合什么场景 → 提醒不要只看外观或价格 → 给选择建议 |
| Installation / Project Coordination | 安装、洞口尺寸、施工配合、项目进度 | 项目现场问题 → 安装前必须确认的细节 → 为什么会影响进度 → 建议提前核对图纸和尺寸 |
| Factory Process / Quality Control | 生产流程、质检、加工、工厂能力 | 客户关心质量稳定性 → 展示关键流程或检查点 → 解释这些细节为什么影响项目 → 自然带到工厂能力 |

### 各内容类型脚本模板

#### A. Price / Quotation

适合讲价格、报价、成本差异、为什么不同供应商报价不同。

结构：

1. 直接提出价格疑问
2. 说明价格不是只由尺寸决定
3. 点出 2-3 个真实影响因素，例如 system、glass、hardware、quantity、shipping
4. 提醒客户比较完整方案，而不是只比单价
5. 引导客户发送 drawings / window schedule / rough sizes

#### B. Supplier Choice

适合讲如何选择中国门窗工厂、供应商是否可靠、进口采购风险。

结构：

1. 承认客户担心海外采购风险
2. 说明错误供应商可能带来的项目问题
3. 给出 2-3 个判断标准，例如 drawings understanding、quotation details、packing plan、project communication
4. 自然带到 Boswindor 可以帮助客户核对项目细节，最多出现 1 次
5. 结尾回到“减少返工和沟通成本”

#### C. Drawings / Window Schedule

适合讲报价前资料、图纸、窗表、尺寸、洞口信息。

结构：

1. 说明为什么没有资料很难准确报价
2. 列出报价前最重要的资料
3. 解释这些资料如何减少尺寸、玻璃、开启方式和数量错误
4. 告诉客户先发 drawings / window schedule 会更高效
5. 结尾强调“报价更准确，后续沟通更少”

#### D. Packing / Shipping

适合讲出口包装、装柜、运输破损、项目到货风险。

结构：

1. 提出客户最担心的运输问题
2. 说明门窗出口不是只看产品本身，包装也很重要
3. 点出 2-3 个包装或装柜细节，例如 corner protection、wooden crate、labels、loading plan
4. 解释这些细节如何减少破损和现场混乱
5. 建议客户在下单前确认 packing plan

#### E. Performance / Specification

适合讲 thermal break、double glazing、Low-E glass、soundproof、waterproof、hardware、认证要求。

结构：

1. 从项目场景或气候需求切入
2. 说明不能只问“质量好不好”，要看具体配置
3. 解释 2-3 个关键配置如何影响性能
4. 提醒不同国家、气候和项目类型要求不同
5. 建议客户按 project location 和 requirements 确认规格

#### F. Product Comparison

适合讲 sliding vs folding、aluminum vs uPVC、single vs double glass、standard vs custom。

结构：

1. 提出客户常见对比问题
2. 简短说明 A 适合什么场景
3. 简短说明 B 适合什么场景
4. 提醒客户选择要看 opening size、budget、usage、climate 或 project style
5. 结尾给出选择建议，不强行说某一种最好

#### G. Installation / Project Coordination

适合讲安装前准备、洞口尺寸、防水、施工配合、项目进度。

结构：

1. 提出安装或现场配合问题
2. 说明门窗问题可能影响整体施工进度
3. 列出安装前必须核对的 2-3 个细节
4. 解释提前确认如何减少返工
5. 建议客户在生产前确认 drawings、rough sizes 和 installation details

#### H. Factory Process / Quality Control

适合讲生产流程、质检、加工细节、工厂能力展示。

结构：

1. 从客户关心质量稳定性切入
2. 说明质量不只看成品照片，还要看过程控制
3. 展示 2-3 个关键流程或检查点，例如 cutting、assembly、glass installation、water test、packing
4. 解释这些流程为什么影响项目交付
5. 自然带到 Boswindor 的工厂配合能力，最多出现 1 次

### 默认兜底结构

如果选题不明显属于以上类型，使用以下默认结构：

1. 承认客户问题
2. 说出客户应该检查什么
3. 解释为什么重要
4. 给出专业建议
5. 自然带到 Boswindor，最多出现 1 次
6. 结尾回到客户收益
7. 脚本要简洁明了，不要说废话

Main Script 必须用表格输出：

| Time | Voiceover | Visual |
| --- | --- | --- |
| 0-3s |     |     |
| 3-8s |     |     |
| 8-15s |     |     |
| 15-22s |     |     |
| 22-30s |     |     |
| 30-38s |     |     |

---

# 十二、视频内容常用角度

根据选题选择 3-5 个重点，不需要每条视频全部都讲。

## A. 价格不是唯一标准

可表达：

- Cost is important, but it is not the only thing to compare.
- A lower price is useful only when the windows fit your project.
- For builders, the real cost also includes time, installation, and risk.
- Before you compare prices, compare the full solution.

## B. 项目定制能力很重要

可表达：

- Most project windows are not standard sizes.
- They need to be custom made according to drawings.
- Before production, we need to check the size, glass, color, hardware, and opening direction.
- This helps reduce mistakes before the goods arrive on site.

## C. 图纸和门窗表很关键

可表达：

- If you have drawings or a window schedule, send them before quotation.
- This helps the supplier understand the real project.
- Without project details, the price may not be accurate.
- A good quotation should be based on real sizes and real requirements.

## D. 认证和当地要求不能忽略

可表达：

- Different countries may have different window requirements.
- For some markets, certifications like AS2047, NFRC, AAMA, CSA, or CE may be required.
- Before production, check what your project needs.
- We can provide solutions according to your project needs and target market requirements.

## E. 包装和运输很重要

可表达：

- For overseas projects, packing is very important.
- Windows and doors are large and easy to damage during shipping.
- Good packing can help reduce damage before the goods arrive on site.
- The supplier should plan protection, labels, and container loading carefully.

## F. 沟通能力影响项目成本

可表达：

- Good communication can reduce many project problems.
- A supplier should confirm the details before production, not after shipping.
- For builders and contractors, clear communication saves time on site.
- If the details are not clear, small mistakes can become big costs.

## G. 质检和生产过程要可见

可表达：

- Do not only look at product photos.
- Check the production process, testing, inspection, and packing.
- These details help you understand if the factory can support real projects.
- For project orders, process control is very important.

---

# 十三、视频画面建议规则

每段脚本都要给出画面建议。

画面可以包括：

- 真人业务员出镜
- 工厂生产线
- 切割型材
- 组角
- 玻璃安装
- 五金安装
- 质检
- 水密测试
- 包装
- 装柜
- 项目案例图片
- 图纸 / window schedule 展示
- 证书画面
- 产品细节特写
- 客户图纸打码展示
- 工程师检查图纸
- 业务员和工程师讨论项目
- 包装标签和货物编号
- 不同窗型对比
- 不同玻璃配置对比

画面建议要简单，方便拍摄和剪辑同事执行。

---

# 十四、On-screen Text 规则

生成视频画面上的英文屏幕文字。

要求：

- 每条不超过 8 个英文单词
- 简单直接
- 方便客户快速看懂
- 包含客户可能搜索的关键词
- 不能太广告
- 要像客户问题的答案提示

示例：

- Aluminum windows for projects
- Check drawings before production
- Custom sizes, glass, and color
- Factory direct is not only price
- Packing matters for overseas shipping
- Compare more than price
- Check local requirements
- Reduce mistakes before shipping
- Send drawings for review
- Window schedule helps quotation

---

# 十五、平台文案规则

## Facebook Caption

Facebook 更适合：

- builders
- contractors
- developers
- homeowners
- villa owners
- project buyers

Facebook 文案要更像“专业解释 + 项目建议”。

要求：

- 80-180 英文单词
- 第一行必须是客户会搜索的问题
- 第一行优先使用长尾问题关键词
- 文案中自然使用主关键词和 3-5 个相关关键词
- 比 Instagram 解释更完整
- 不要堆关键词
- 不要一上来就说 Contact us now
- CTA 要自然，引导私信项目资料

推荐结构：

1. 第一行：客户搜索型问题
2. 第二段：回答核心观点
3. 第三段：告诉客户应该检查什么
4. 第四段：自然介绍 Boswindor
5. 最后一行：轻 CTA

---

## Instagram Caption

Instagram 更适合：

- Reels 推荐
- Explore 搜索
- 视觉种草
- 保存和分享

要求：

- 50-120 英文单词
- 第一行必须抓住搜索意图
- 第一行优先使用主关键词或短问题关键词
- 文案中自然使用 2-4 个相关关键词
- 句子短
- 适合手机阅读
- 可以使用编号
- 适合客户保存
- CTA 可以引导 Save / DM / Send drawings

推荐结构：

1. 第一行：搜索型 Hook
2. 第二段：列出 3 个重点
3. 第三段：自然带到 Boswindor
4. 第四段：Save / DM / Send drawings CTA

---

## YouTube Shorts Title

要求：

- 45-70 个字符左右
- 最长不要超过 100 个字符
- 必须使用 1 个主关键词
- 核心关键词尽量靠前
- 像客户会搜索的问题
- 不要只写品牌名
- 不要堆关键词
- 不要标题党

---

## YouTube Shorts Description

要求：

- 80-160 英文单词
- 前两行必须说明视频主题
- 自然包含 2-4 个核心关键词
- 必须包含主关键词、1 个长尾问题关键词、1-2 个产品或场景关键词
- 不要堆大量 hashtags
- CTA 要引导客户发送项目资料

推荐结构：

1. 第一行：说明视频回答什么问题
2. 第二段：补充 3 个重点
3. 第三段：自然介绍 Boswindor
4. 第四段：轻 CTA
5. 最后一行：Hashtags

---

# 十六、视频封面文案生成规则

视频封面文案的目标不是装饰画面，而是让用户一眼知道这条视频回答什么问题。

封面文案必须服务于三个目标：

1. 让客户快速判断这条视频是否和自己有关
2. 让平台更容易理解视频主题
3. 提高点击、停留、保存和私信转化机会

---

## 1. 封面文案核心原则

封面文案要像搜索标题，不像广告口号。

推荐：

- Window Price Factors
- Check Before Quotation
- Aluminum Windows From China?
- Choosing Project Windows?
- What Affects Window Cost?

避免：

- Best Windows Ever
- Top Quality Factory
- Big Sale Today
- Cheap Price For You
- Amazing Aluminum Windows

一张封面只讲一个重点，不要塞太多信息。

错误：

- Aluminum Windows Factory Price Custom Size Good Quality Fast Delivery

正确：

- Window Price Factors
- Custom Size Matters
- Glass Affects Price
- Check Before Ordering

---

## 2. 封面文案长度

建议长度：

- Facebook：3-7 个英文单词
- Instagram：3-6 个英文单词
- YouTube Shorts：3-6 个英文单词

如果超过 7 个英文单词，必须压缩。

---

## 3. 封面文案类型

每个平台至少生成 3 个封面文案选项。

### 问题型

适合教育类和搜索类视频。

示例：

- What Affects Window Price?
- How To Choose Windows?
- Why Prices Change?
- Need Project Windows?

### 避坑型

适合采购建议、供应商选择、报价、包装、运输类视频。

示例：

- Check Before Ordering
- Avoid Window Mistakes
- Don’t Ignore Packing
- Drawings Matter First
- Glass Affects Cost

### 对比型

适合价格、材料、系统、玻璃、供应商对比类视频。

示例：

- Aluminum vs uPVC
- Cheap vs Right Windows
- Standard vs Custom
- Price vs Project Value
- Single vs Double Glass

### 项目型

适合 B2B、工程、开发商、承包商内容。

示例：

- Windows For Builders
- Custom Windows For Villas
- Commercial Window Projects
- Doors For Contractors
- Project Windows Guide

### 清单型

适合总结类、步骤类、检查类内容。

示例：

- 5 Price Factors
- 3 Things To Check
- 4 Window Cost Factors
- 3 Quotation Details
- 5 Supplier Checks

---

## 4. Facebook Cover Copy

Facebook 封面文案要偏专业、清楚、可信。

适合方向：

- 项目风险
- 报价因素
- 采购判断
- 工程客户关心点
- 供应商选择

要求：

- 3-7 个英文单词
- 不要太潮流化
- 不要像促销广告
- 适合 builders / contractors / developers 阅读
- 重点文字放在画面中上区域
- 避免放在底部或右侧，防止被平台按钮遮挡

---

## 5. Instagram Cover Copy

Instagram 封面文案要更短、更视觉化、更适合主页网格。

要求：

- 3-6 个英文单词
- 不超过两行
- 每行尽量 2-4 个词
- 主关键词尽量放在第一行
- 不要遮挡门窗主体、玻璃细节或人物脸部
- 文字放在中上区域或左上安全区域

---

## 6. YouTube Shorts Cover Copy

YouTube Shorts 封面文案要更像搜索缩略图标题。

要求：

- 3-6 个英文单词
- 必须和 YouTube Title 高度一致
- 关键词要明显
- 不要模糊表达
- 不要标题党
- 适合很小的缩略图也能看清
- 封面文案要和视频第一句话形成呼应

---

## 7. 封面文案输出格式

每个平台必须这样输出：

## Facebook Cover Copy

### Option 1

[封面文案]

Angle: [问题型 / 避坑型 / 项目型 / 对比型 / 清单型]

Layout: [例如 two lines, upper center]

Visual: [建议封面画面]

### Option 2

[封面文案]

Angle:

Layout:

Visual:

### Option 3

[封面文案]

Angle:

Layout:

Visual:

---

## Instagram Cover Copy

### Option 1

[封面文案]

Angle:

Layout:

Visual:

### Option 2

[封面文案]

Angle:

Layout:

Visual:

### Option 3

[封面文案]

Angle:

Layout:

Visual:

---

## YouTube Shorts Cover Copy

### Option 1

[封面文案]

Angle:

Layout:

Visual:

### Option 2

[封面文案]

Angle:

Layout:

Visual:

### Option 3

[封面文案]

Angle:

Layout:

Visual:

---

# 十七、Hashtags 生成规则

Hashtags 必须根据每次视频选题、目标客户、产品类型、应用场景和搜索意图重新生成。

不要机械套用固定标签。

Hashtags 的目标不是追求大流量，而是吸引更精准的海外项目客户。

Hashtags 必须优先从“铝合金门窗行业关键词库”里选择或改写，不能只使用下面的少量示例。

如果某个视频主题很具体，比如 `window schedule quotation`、`thermal break aluminum windows`、`window packing for export`，Hashtags 也要具体，不要只写泛词。

---

## 1. Hashtag 生成逻辑

每次从以下 5 类中组合：

### A. 产品关键词

根据视频内容选择。下面只是示例，实际应根据关键词库扩展：

- #AluminumWindows
- #AluminumDoors
- #SlidingDoors
- #FoldingDoors
- #CurtainWall
- #CustomWindows
- #CustomDoors
- #ThermalBreakWindows
- #DoubleGlazedWindows
- #LowEGlass
- #VillaWindows
- #CommercialWindows
- #AluminumSlidingDoors
- #AluminumFoldingDoors
- #BifoldDoors
- #CasementWindows
- #CurtainWallSystem
- #ImpactWindows
- #SoundproofWindows
- #EnergyEfficientWindows

### B. 客户类型关键词

根据目标客户选择：

- #Builders
- #Contractors
- #Architects
- #Developers
- #HomeBuilders
- #VillaOwners
- #ProjectBuyers
- #WindowImporters
- #ConstructionCompanies

### C. 应用场景关键词

根据视频场景选择：

- #ConstructionProject
- #VillaProject
- #CommercialProject
- #ResidentialProject
- #HotelProject
- #ApartmentProject
- #BuildingMaterials
- #HomeRenovation
- #ModernVilla
- #OverseasProject
- #CoastalProject
- #HotelProject
- #HighRiseBuilding
- #VillaWindows
- #CommercialFacade

### D. 问题 / 搜索意图关键词

如果视频讲价格：

- #WindowPrices
- #AluminumWindowPrice
- #WindowCost
- #DoorAndWindowCost
- #WindowQuotation
- #ProjectQuotation
- #WindowQuote
- #CustomWindowPrice
- #WindowPriceFactors

如果视频讲供应商选择：

- #WindowSupplier
- #WindowManufacturer
- #ChinaWindowFactory
- #SourcingFromChina
- #FactoryDirectWindows
- #WindowFactory
- #ProjectWindowSupplier
- #CommercialWindowSupplier

如果视频讲图纸和报价：

- #WindowSchedule
- #ProjectDrawings
- #CustomWindowQuotation
- #WindowSpecifications
- #WindowDrawings
- #RoughOpeningSize
- #WindowShopDrawings

如果视频讲包装运输：

- #WindowPacking
- #OverseasShipping
- #ContainerLoading
- #ExportWindows
- #WindowShipping
- #ShippingWindowsFromChina
- #WindowPackingForExport

如果视频讲性能：

- #EnergyEfficientWindows
- #SoundproofWindows
- #WaterproofWindows
- #ThermalBreak
- #GlassOptions
- #LowEGlass
- #DoubleGlazedWindows
- #ImpactResistantWindows
- #CoastalWindows

如果视频讲中国采购：

- #ImportWindowsFromChina
- #SourcingFromChina
- #WindowsFromChina
- #ChinaWindowSupplier
- #FactoryDirectWindows

如果视频讲安装和施工：

- #WindowInstallation
- #AluminumWindowInstallation
- #WindowInstallationDetails
- #WindowWaterproofing
- #WindowDrainage

### E. 品牌关键词

每条内容可以加入 1 个品牌标签：

- #Boswindor

---

## 2. 平台 Hashtag 数量

### Facebook

生成 3-6 个 hashtags。

优先选择：

- 1-2 个产品标签
- 1-2 个客户或场景标签
- 1 个搜索意图标签
- 1 个品牌标签，可选

### Instagram

生成 6-10 个 hashtags。

优先选择：

- 2-3 个产品标签
- 2 个场景标签
- 1-2 个客户类型标签
- 1-2 个搜索意图标签
- 1 个品牌标签

### YouTube Shorts

生成 3-5 个 hashtags。

优先选择：

- 1 个核心产品标签
- 1 个搜索意图标签
- 1 个客户或场景标签
- 1 个品牌标签
- 可加入 #Shorts

---

## 3. Hashtag 禁止事项

不要使用：

- #Viral
- #Trending
- #FYP
- #ForYou
- #Business
- #Factory
- #Home

除非视频主题强相关，否则不要使用太泛的标签。

每个平台的 Hashtags 不能完全一样。

---

## 4. Hashtag 输出格式

必须这样输出：

## Facebook Hashtags

[3-6 个精准 hashtags]

## Facebook Hashtag Logic

[简短说明为什么选择这些标签]

## Instagram Hashtags

[6-10 个精准 hashtags]

## Instagram Hashtag Logic

[简短说明为什么选择这些标签]

## YouTube Shorts Hashtags

[3-5 个精准 hashtags]

## YouTube Hashtag Logic

[简短说明为什么选择这些标签]

---

# 十八、CTA 规则

CTA 不要强硬销售。

不要使用：

- Buy now
- Order today
- Contact us immediately
- Best price for you
- Don’t miss this chance

推荐使用：

- Send us your drawings or window schedule.
- DM us your rough sizes and project location.
- Need help checking your window specifications?
- Send your project details for a more accurate suggestion.
- If you are comparing suppliers, we can help you review the key details.
- For a more accurate suggestion, send your drawings, window schedule, or rough sizes.

---

# 十九、最终输出格式

请严格按照以下格式输出：

## Topic

[我提供的选题]

## Target Audience

[目标客户]

## Search Intent

[客户真实会搜索的问题]

## Content Strategy Plan

Content Type:
[Price / Quotation 或 Supplier Choice 或 Drawings / Window Schedule 或 Packing / Shipping 或 Performance / Specification 或 Product Comparison 或 Installation / Project Coordination 或 Factory Process / Quality Control]

Script Structure Used:
[本条视频使用的脚本结构]

Recommended Duration:
[目标时长，例如 30-35 秒]

Recommended Word Count:
[目标词数范围，例如 72-85 words]

Why This Structure Fits:
[说明为什么本条选题适合这个内容类型和脚本结构]

## Keyword Plan

Main Keyword:
[本条视频最重要的关键词]

Related Keywords:

- [相关关键词 1]
- [相关关键词 2]
- [相关关键词 3]
- [相关关键词 4]

Long-tail Search Questions:

- [客户真实会搜索的问题 1]
- [客户真实会搜索的问题 2]

Hashtag Keywords:

- [适合转成 hashtag 的关键词 1]
- [适合转成 hashtag 的关键词 2]
- [适合转成 hashtag 的关键词 3]

Keyword Usage Note:
[说明这些关键词为什么适合本条内容]

---

# Video Script

## Title

[英文视频标题]

## Hook

[1-2 句英文开头口播]

## Main Script

| Time | Voiceover | Visual |
| --- | --- | --- |
| 0-3s |     |     |
| 3-8s |     |     |
| 8-15s |     |     |
| 15-22s |     |     |
| 22-30s |     |     |
| 30-38s |     |     |
| 38-45s |     |     |

Estimated Voiceover Word Count: [数字] words, about [数字] seconds.

## On-screen Text

1.
2.
3.
4.
5.

## Shooting Notes

[拍摄和剪辑建议]

---

# Facebook

## Facebook Caption

[Facebook 英文文案]

## Facebook Cover Copy

### Option 1

[封面文案]

Angle:

Layout:

Visual:

### Option 2

[封面文案]

Angle:

Layout:

Visual:

### Option 3

[封面文案]

Angle:

Layout:

Visual:

## Facebook CTA

[轻 CTA]

## Facebook Hashtags

[3-6 个精准 hashtags]

## Facebook Hashtag Logic

[标签选择逻辑]

## Facebook Notes

[为什么这样写]

---

# Instagram

## Instagram Caption

[Instagram 英文文案]

## Instagram Cover Copy

### Option 1

[封面文案]

Angle:

Layout:

Visual:

### Option 2

[封面文案]

Angle:

Layout:

Visual:

### Option 3

[封面文案]

Angle:

Layout:

Visual:

## Instagram CTA

[轻 CTA]

## Instagram Hashtags

[6-10 个精准 hashtags]

## Instagram Hashtag Logic

[标签选择逻辑]

## Instagram Notes

[为什么这样写]

---

# YouTube Shorts

## YouTube Shorts Title

[45-70 characters, search-friendly]

## YouTube Shorts Description

[YouTube Shorts 英文描述]

## YouTube Shorts Cover Copy

### Option 1

[封面文案]

Angle:

Layout:

Visual:

### Option 2

[封面文案]

Angle:

Layout:

Visual:

### Option 3

[封面文案]

Angle:

Layout:

Visual:

## YouTube Shorts CTA

[轻 CTA]

## YouTube Shorts Hashtags

[3-5 个精准 hashtags]

## YouTube Hashtag Logic

[标签选择逻辑]

## YouTube Notes

[说明标题、描述和封面如何匹配搜索意图]

---

# Cross-platform Check

请逐条检查并回答 Yes / No：

1. 是否围绕一个真实客户问题？
2. 是否适合 Facebook / Instagram / YouTube Shorts？
3. 是否避免硬广？
4. 是否自然包含关键词？
5. 是否能引导客户私信项目资料？
6. 是否体现 Boswindor 是中国门窗工厂？
7. 是否让客户觉得 Boswindor 懂项目？
8. 封面文案是否短、清楚、容易点击？
9. YouTube 标题是否适合搜索？
10. Instagram 文案是否适合保存？
11. Facebook 文案是否适合建立信任？
12. 视频脚本是否适合真人口播？
13. CTA 是否引导 drawings / window schedule / rough sizes / project location？
14. Hashtags 是否根据本条视频重新生成？
15. 是否没有编造数据、认证、案例或承诺？
16. 是否已生成 Keyword Plan？
17. 是否已生成 Content Strategy Plan？
18. 是否已明确选择 1 个 Content Type？
19. Main Script 是否使用了对应内容类型的脚本结构，而不是套用统一模板？
20. 主关键词是否出现在 Title、Caption 或 YouTube Description 中？
21. 长尾问题关键词是否自然出现在 Hook、Caption 或 Description 中？
22. 封面文案是否只使用 1 个核心关键词或短问题？
23. Hashtags 是否覆盖产品、场景、搜索意图和品牌？
24. Voiceover 总词数是否符合目标时长对应的词数范围？
25. 是否已输出 `Estimated Voiceover Word Count`？

---

# 二十、本次视频选题

[在这里粘贴本次视频选题]

可选补充信息：

目标客户：
[例如 builders / contractors / villa owners]

产品：
[例如 aluminum windows / sliding doors / curtain wall]

项目场景：
[例如 villa project / commercial project / apartment project]

重点想表达：
[例如 price factors / supplier choice / packing / drawings / thermal break]', '2026-05-18 09:17:33.97', '2026-05-20 08:21:51.004');


--
-- PostgreSQL database dump complete
--

\unrestrict AmIKLCTs8dg8dweLYOBavgVuNWa5c7ZHzhyknvcNpgacfxfPAcKuIIubxiDRWcf

