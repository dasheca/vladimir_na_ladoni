PGDMP      7                }            diplom    16.2    16.2 P    O           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            P           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            Q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            R           1262    18025    diplom    DATABASE     �   CREATE DATABASE diplom WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE diplom;
                postgres    false            �            1259    18053    attractions    TABLE     �  CREATE TABLE public.attractions (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    site character varying(255) DEFAULT '-'::character varying,
    "categoryId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.attractions;
       public         heap    postgres    false            �            1259    18052    attractions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.attractions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.attractions_id_seq;
       public          postgres    false    222            S           0    0    attractions_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.attractions_id_seq OWNED BY public.attractions.id;
          public          postgres    false    221            �            1259    18039    categories_attractions    TABLE     �   CREATE TABLE public.categories_attractions (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 *   DROP TABLE public.categories_attractions;
       public         heap    postgres    false            �            1259    18038    categories_attractions_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_attractions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.categories_attractions_id_seq;
       public          postgres    false    218            T           0    0    categories_attractions_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.categories_attractions_id_seq OWNED BY public.categories_attractions.id;
          public          postgres    false    217            �            1259    18046    categories_routes    TABLE     �   CREATE TABLE public.categories_routes (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 %   DROP TABLE public.categories_routes;
       public         heap    postgres    false            �            1259    18045    categories_routes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.categories_routes_id_seq;
       public          postgres    false    220            U           0    0    categories_routes_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.categories_routes_id_seq OWNED BY public.categories_routes.id;
          public          postgres    false    219            �            1259    18111    comment_routes    TABLE     	  CREATE TABLE public.comment_routes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "routeId" integer NOT NULL,
    comment character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public.comment_routes;
       public         heap    postgres    false            �            1259    18110    comment_routes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.comment_routes_id_seq;
       public          postgres    false    228            V           0    0    comment_routes_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.comment_routes_id_seq OWNED BY public.comment_routes.id;
          public          postgres    false    227            �            1259    18149    comment_sites    TABLE     Z  CREATE TABLE public.comment_sites (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    surname character varying(255) NOT NULL,
    comment character varying(255) NOT NULL,
    is_validated boolean DEFAULT false NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public.comment_sites;
       public         heap    postgres    false            �            1259    18148    comment_sites_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.comment_sites_id_seq;
       public          postgres    false    232            W           0    0    comment_sites_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.comment_sites_id_seq OWNED BY public.comment_sites.id;
          public          postgres    false    231            �            1259    18070    routes    TABLE     �  CREATE TABLE public.routes (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    image character varying(255) NOT NULL,
    document character varying(255),
    "userId" integer NOT NULL,
    is_published boolean DEFAULT false NOT NULL,
    "categoryId" integer,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.routes;
       public         heap    postgres    false            �            1259    18069    routes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.routes_id_seq;
       public          postgres    false    224            X           0    0    routes_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.routes_id_seq OWNED BY public.routes.id;
          public          postgres    false    223            �            1259    18090    routes_items    TABLE     D  CREATE TABLE public.routes_items (
    id integer NOT NULL,
    "routeId" integer NOT NULL,
    "attractionId" integer NOT NULL,
    "position" integer DEFAULT 1 NOT NULL,
    "isVisited" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public.routes_items;
       public         heap    postgres    false            �            1259    18089    routes_items_id_seq    SEQUENCE     �   CREATE SEQUENCE public.routes_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.routes_items_id_seq;
       public          postgres    false    226            Y           0    0    routes_items_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.routes_items_id_seq OWNED BY public.routes_items.id;
          public          postgres    false    225            �            1259    18128    user_routes    TABLE     E  CREATE TABLE public.user_routes (
    id integer NOT NULL,
    "userId" integer NOT NULL,
    "routeId" integer NOT NULL,
    "isCompleted" boolean DEFAULT false NOT NULL,
    "isFavorite" boolean DEFAULT false NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.user_routes;
       public         heap    postgres    false            �            1259    18127    user_routes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_routes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.user_routes_id_seq;
       public          postgres    false    230            Z           0    0    user_routes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.user_routes_id_seq OWNED BY public.user_routes.id;
          public          postgres    false    229            �            1259    18027    users    TABLE     �  CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    surname character varying(255),
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    birthdate timestamp with time zone,
    photo character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    18026    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    216            [           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    215            |           2604    18056    attractions id    DEFAULT     p   ALTER TABLE ONLY public.attractions ALTER COLUMN id SET DEFAULT nextval('public.attractions_id_seq'::regclass);
 =   ALTER TABLE public.attractions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    222    221    222            z           2604    18042    categories_attractions id    DEFAULT     �   ALTER TABLE ONLY public.categories_attractions ALTER COLUMN id SET DEFAULT nextval('public.categories_attractions_id_seq'::regclass);
 H   ALTER TABLE public.categories_attractions ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            {           2604    18049    categories_routes id    DEFAULT     |   ALTER TABLE ONLY public.categories_routes ALTER COLUMN id SET DEFAULT nextval('public.categories_routes_id_seq'::regclass);
 C   ALTER TABLE public.categories_routes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    219    220    220            �           2604    18114    comment_routes id    DEFAULT     v   ALTER TABLE ONLY public.comment_routes ALTER COLUMN id SET DEFAULT nextval('public.comment_routes_id_seq'::regclass);
 @   ALTER TABLE public.comment_routes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    228    228            �           2604    18152    comment_sites id    DEFAULT     t   ALTER TABLE ONLY public.comment_sites ALTER COLUMN id SET DEFAULT nextval('public.comment_sites_id_seq'::regclass);
 ?   ALTER TABLE public.comment_sites ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    231    232    232            ~           2604    18073 	   routes id    DEFAULT     f   ALTER TABLE ONLY public.routes ALTER COLUMN id SET DEFAULT nextval('public.routes_id_seq'::regclass);
 8   ALTER TABLE public.routes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    223    224    224            �           2604    18093    routes_items id    DEFAULT     r   ALTER TABLE ONLY public.routes_items ALTER COLUMN id SET DEFAULT nextval('public.routes_items_id_seq'::regclass);
 >   ALTER TABLE public.routes_items ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    226    225    226            �           2604    18131    user_routes id    DEFAULT     p   ALTER TABLE ONLY public.user_routes ALTER COLUMN id SET DEFAULT nextval('public.user_routes_id_seq'::regclass);
 =   ALTER TABLE public.user_routes ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    229    230    230            x           2604    18030    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            B          0    18053    attractions 
   TABLE DATA           �   COPY public.attractions (id, title, description, image, latitude, longitude, site, "categoryId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    222   �f       >          0    18039    categories_attractions 
   TABLE DATA           U   COPY public.categories_attractions (id, title, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    218   :g       @          0    18046    categories_routes 
   TABLE DATA           P   COPY public.categories_routes (id, title, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    220   �g       H          0    18111    comment_routes 
   TABLE DATA           d   COPY public.comment_routes (id, "userId", "routeId", comment, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    228   h       L          0    18149    comment_sites 
   TABLE DATA           k   COPY public.comment_sites (id, name, surname, comment, is_validated, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    232   h       D          0    18070    routes 
   TABLE DATA           �   COPY public.routes (id, title, description, image, document, "userId", is_published, "categoryId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    224   �h       F          0    18090    routes_items 
   TABLE DATA           x   COPY public.routes_items (id, "routeId", "attractionId", "position", "isVisited", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    226   �m       J          0    18128    user_routes 
   TABLE DATA           u   COPY public.user_routes (id, "userId", "routeId", "isCompleted", "isFavorite", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    230   �m       <          0    18027    users 
   TABLE DATA           u   COPY public.users (id, name, surname, email, password, birthdate, photo, role, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    216   �m       \           0    0    attractions_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.attractions_id_seq', 1, true);
          public          postgres    false    221            ]           0    0    categories_attractions_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public.categories_attractions_id_seq', 3, true);
          public          postgres    false    217            ^           0    0    categories_routes_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.categories_routes_id_seq', 1, true);
          public          postgres    false    219            _           0    0    comment_routes_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.comment_routes_id_seq', 1, false);
          public          postgres    false    227            `           0    0    comment_sites_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.comment_sites_id_seq', 1, true);
          public          postgres    false    231            a           0    0    routes_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.routes_id_seq', 32, true);
          public          postgres    false    223            b           0    0    routes_items_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.routes_items_id_seq', 1, false);
          public          postgres    false    225            c           0    0    user_routes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.user_routes_id_seq', 1, false);
          public          postgres    false    229            d           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 5, true);
          public          postgres    false    215            �           2606    18061    attractions attractions_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.attractions
    ADD CONSTRAINT attractions_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.attractions DROP CONSTRAINT attractions_pkey;
       public            postgres    false    222            �           2606    18063 !   attractions attractions_title_key 
   CONSTRAINT     ]   ALTER TABLE ONLY public.attractions
    ADD CONSTRAINT attractions_title_key UNIQUE (title);
 K   ALTER TABLE ONLY public.attractions DROP CONSTRAINT attractions_title_key;
       public            postgres    false    222            �           2606    18044 2   categories_attractions categories_attractions_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.categories_attractions
    ADD CONSTRAINT categories_attractions_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.categories_attractions DROP CONSTRAINT categories_attractions_pkey;
       public            postgres    false    218            �           2606    18051 (   categories_routes categories_routes_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.categories_routes
    ADD CONSTRAINT categories_routes_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.categories_routes DROP CONSTRAINT categories_routes_pkey;
       public            postgres    false    220            �           2606    18116 "   comment_routes comment_routes_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.comment_routes
    ADD CONSTRAINT comment_routes_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.comment_routes DROP CONSTRAINT comment_routes_pkey;
       public            postgres    false    228            �           2606    18157     comment_sites comment_sites_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.comment_sites
    ADD CONSTRAINT comment_sites_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.comment_sites DROP CONSTRAINT comment_sites_pkey;
       public            postgres    false    232            �           2606    18097    routes_items routes_items_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.routes_items
    ADD CONSTRAINT routes_items_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.routes_items DROP CONSTRAINT routes_items_pkey;
       public            postgres    false    226            �           2606    18099 2   routes_items routes_items_routeId_attractionId_key 
   CONSTRAINT     �   ALTER TABLE ONLY public.routes_items
    ADD CONSTRAINT "routes_items_routeId_attractionId_key" UNIQUE ("routeId", "attractionId");
 ^   ALTER TABLE ONLY public.routes_items DROP CONSTRAINT "routes_items_routeId_attractionId_key";
       public            postgres    false    226    226            �           2606    18078    routes routes_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.routes DROP CONSTRAINT routes_pkey;
       public            postgres    false    224            �           2606    18135    user_routes user_routes_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.user_routes
    ADD CONSTRAINT user_routes_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.user_routes DROP CONSTRAINT user_routes_pkey;
       public            postgres    false    230            �           2606    18137 *   user_routes user_routes_userId_routeId_key 
   CONSTRAINT     v   ALTER TABLE ONLY public.user_routes
    ADD CONSTRAINT "user_routes_userId_routeId_key" UNIQUE ("userId", "routeId");
 V   ALTER TABLE ONLY public.user_routes DROP CONSTRAINT "user_routes_userId_routeId_key";
       public            postgres    false    230    230            �           2606    18037    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    216            �           2606    18035    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            �           2606    18064 '   attractions attractions_categoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.attractions
    ADD CONSTRAINT "attractions_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories_attractions(id) ON UPDATE CASCADE ON DELETE SET NULL;
 S   ALTER TABLE ONLY public.attractions DROP CONSTRAINT "attractions_categoryId_fkey";
       public          postgres    false    218    4750    222            �           2606    18122 *   comment_routes comment_routes_routeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_routes
    ADD CONSTRAINT "comment_routes_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES public.routes(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.comment_routes DROP CONSTRAINT "comment_routes_routeId_fkey";
       public          postgres    false    228    4758    224            �           2606    18117 )   comment_routes comment_routes_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment_routes
    ADD CONSTRAINT "comment_routes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.comment_routes DROP CONSTRAINT "comment_routes_userId_fkey";
       public          postgres    false    228    4748    216            �           2606    18084    routes routes_categoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.routes
    ADD CONSTRAINT "routes_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories_routes(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.routes DROP CONSTRAINT "routes_categoryId_fkey";
       public          postgres    false    4752    220    224            �           2606    18105 +   routes_items routes_items_attractionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.routes_items
    ADD CONSTRAINT "routes_items_attractionId_fkey" FOREIGN KEY ("attractionId") REFERENCES public.attractions(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.routes_items DROP CONSTRAINT "routes_items_attractionId_fkey";
       public          postgres    false    222    4754    226            �           2606    18100 &   routes_items routes_items_routeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.routes_items
    ADD CONSTRAINT "routes_items_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES public.routes(id) ON UPDATE CASCADE ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.routes_items DROP CONSTRAINT "routes_items_routeId_fkey";
       public          postgres    false    4758    226    224            �           2606    18079    routes routes_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.routes
    ADD CONSTRAINT "routes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.routes DROP CONSTRAINT "routes_userId_fkey";
       public          postgres    false    224    4748    216            �           2606    18143 $   user_routes user_routes_routeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_routes
    ADD CONSTRAINT "user_routes_routeId_fkey" FOREIGN KEY ("routeId") REFERENCES public.routes(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.user_routes DROP CONSTRAINT "user_routes_routeId_fkey";
       public          postgres    false    4758    230    224            �           2606    18138 #   user_routes user_routes_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_routes
    ADD CONSTRAINT "user_routes_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.user_routes DROP CONSTRAINT "user_routes_userId_fkey";
       public          postgres    false    4748    216    230            B   �   x�}�A
�0����KB2�IҞ�M���#�[�R��� =��F�����H/�|e�O�Y�B^��)�M���u��|}��"��Zl"�@��P��&֭�H{}�R�)������8�����������"k�9���hǕ�Gjm�R?�B`      >   v   x�}�=
�@F�S�K��qM�9��QS�Y�ڇ@��i��׽�����_',�e%������)��D�8�[kx�ϱN�s�?����a�f���ﺤ5F�n��+�=-T�9�      @   2   x�3�,N�HK/��4202�50"##+Cc+=KSmc<R\1z\\\  �      H      x������ � �      L   [   x�3�0��^ ��ya���6\�ta���@(��bㅭ
/6_�a��E�N##S]# R04�2��2��33��60�#����� �.*|      D     x�����E����ը���6�%�"ph8��]9��m�	��	���qy#jve��s�����uOW�:CKWo��˛�r�r��Xp1���J�^H8b��o���O^�,��%K�wAt�|I�J�_Yw w�l����o�b]����l>&�K�+z��w��;��Jj���B)F�]�T�ٯ��9��d�y0�dK�0l�.B���&�8�9�s丒�9��d�r��<[�(b���s���ĳs�I&,�[���\�{�|���Wo�]�0�(�	���j�Hd����s�Ox�q������7=~���ӯ�G?{����2�D�]�l1B*�/JZ�v��#6_:\�򄽓LZN��~>�z�pz�x������r�����Ӣ:���z�Rvz��|ì�p�����O�N2h��/��J�Ul7�,���R>.�m�Ӥ���A��F�[��%&������X�A��C
�ylG;tr�n��v�A�giXξ���ig׌�P\�4�jwp?� Y���w�A������W�Z�����#t@A-�1�Z�$=\�X�.ٯ'n���]6u;:i%Iu�i+�P=t�9��Cɇ��⥵���Ǿ��]ve;��!��e�}d ��Z$���#6�V�6M�{ɠ_���������?������Ekv���ʰ��[ԫdGI�&�y++3�N2�xVvj�kfW �m�!��|ﶪ��^2��F�%vR-��r�X:v���۽����Q���4ŗjkhu���d�)[�&ȽW�x|����Ҥ���!;�}�`���CϞ1k�b	��R*��>���!��CTp��PC����8#��=L��i����)�?�n43hۡ(�����[��'��;Ka��w�!7�sr��O���]�6�f��J-ڋ���E]m�v�c��!��}hH������s�	��J�ݷ�9����w�!���SL��s�\�������h牍VL���+�{^l�<��Qn�3h��[��4E����:��[���𷒡��9�X����tҳö�
!��]�S>��w������ѥ����Ѕ�X���!:i�6��~K�V����=O#�5ݳfM�RY{ Dm:k{MB�^��MKo'7�<u��#'-�@ۼ���xFq�?R���[��7�9��d���RШ�s�ux̊j�6�)8��s��(�3u�洗���^��$���o/n�Mڦ�z�Uy-�t8n�i�Y�,��%�|5����]      F      x������ � �      J      x������ � �      <   b  x����N�@�u�,�ƙ�Sڮh,HC(�;��T
���e�ʕ�W>Ѹ����	�`�!9���|9i�����a��{��+۲O����l�>���6\�Nꅑ=c*��0�#܅��V��i33��b��O�tj�4+�q/�����Q�� 4ǚP"P�tk6�3~�j%��0�$Q
�	,)��$]��?/\��B?�a4��1ͮ(��GyKt}�Dc�:�``e��jE�E��D�L52�au��{�[|�7�r����$��� ���*�\�<:���!Ͷ8�ha�X%��|����B{��K+�u;�����Ɣ#�F-w��(+�D���O+�x������     