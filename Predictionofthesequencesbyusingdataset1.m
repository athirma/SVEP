num=10000;  %% The generation times
alpha=0.5;  %% The mutation frequency of the hotspots=1-0.5=0.5
h=0.1;%% The mutation frequency of the more mutable hotspots=1-0.1=0.9

M = cell(1,7);
for i=1:7
    M{i} = [];
end
%% Paragraph 1
while_flag = 1;
%S489=The amino acid at site 486
%S496=The amino acid at site 493
[S69,S70,S489,S496]=deal(0);
[a69,a70,a489,a496]=deal(1);
while while_flag <= num
    if S69==0
        S69=randsrc(1,1,[double('H'),88,100;pn(1:1,:)*alpha,(1-pn(1:1,:))*alpha,1-alpha]);
    end
    if S70==0
        S70=randsrc(1,1,[double('V'),88,100;pn(2:2,:)*alpha,(1-pn(2:2,:))*alpha,1-alpha]);
    end
    if S489==0
        S489=randsrc(1,1,[double('F'),double('V'),88,100;pn(3:3,:)*h,(1-pn(3:3,:)-0.023)*h,0.023*h,1-h]);
    end
    if S496==0
        S496=randsrc(1,1,[double('R'),88,double('Q'),100;pn(4:4,:)*h,0.023*h,(1-pn(4:4,:)-0.023)*h,1-h]);
    end
    if S69==100
        S69=randsrc(1,1,[double('Y'),double('S'); 0.989,1-0.989]);
        a69=0;
    end
    if S70==100
        S70=randsrc(1,1,[double('F'),double('A'),double('G'),double('I'),double('L'),double('G');0.46,0.0925,0.017,0.354,0.0562,(1-0.46-0.0925-0.017-0.354-0.0562)]);
        a70=0;
    end
    if S489==100
        S489=randsrc(1,1,[double('V'),double('S');0.998,0.002]);
        a489=0;
    end
    if S496==100
        S496=double('Q');
        a496=0;
    end
    
    if S69==88
        S70=88;
    end
    if S70==88
        S69=88;
    end
    if S69==double('H')
        S70=double('V');
    end
    if S70==double('V')
        S69=double('H');
    end
    SS6970=[S69,S70];
    
    if S489==double('F')
        S496=randsrc(1,1,[double('R'),double('Q'),88;0.991,0.0069,1-0.0069-0.991]);
    end
    if S496==double('R')
        S489=double('F');
    end
    if S489==double('V')
        S496=double('Q');
    end
    if S496==double('Q')
        S489=randsrc(1,1,[double('V'),double('F');0.99,0.01]);
    end
    SS489496=[S489,S496];
    %%
    SSO69702=[double('XX')
        double('HV')];
    if SS489496==[double('V'),double('Q')]
        SS6970= randsrc(1,1,[1:2;0.998,1-0.998]);
        for j69702=1:2
            if SS6970==j69702
                SS6970=SSO69702(j69702,:);
            end
        end
    end
    SSO69701=[double('HV')
        double('XX')];
    if SS489496==[double('F'),double('R')]
        SS6970= randsrc(1,1,[1:2;0.985,1-0.985]);
        for j69701=1:2
            if SS6970==j69701
                SS6970=SSO69701(j69701,:);
            end
        end
    end
    SSO4894961=[double('FR')
        double('FQ')
        double('VQ')
        double('SQ')
        double('XX')];
    
    if SS6970==[double('H'),double('V')]
        SS489496= randsrc(1,1,[1:5;0.952,0.004,0.002,0.001,1-0.952-0.007]);
        for j4894961=1:5
            if SS489496==j4894961
                SS489496=SSO4894961(j4894961,:);
            end
        end
    end
    SSO4894962=[double('VQ')
        double('FR')
        double('FQ')
        double('XX')];
    
    if SS6970==[88,88]
        SS489496= randsrc(1,1,[1:4;0.971,0.0142,(1-0.01-0.0142-0.971),0.01]);
        for j4894962=1:4
            if SS489496==j4894962
                SS489496=SSO4894962(j4894962,:);
            end
        end
    end
    if isequal([SS6970,SS489496],double('HVFR'))||isequal([SS6970,SS489496],double('XXXX'))
        M{1}(while_flag,:)=[SS6970,SS489496];
        while_flag=while_flag+1;
    end
    
    if ~isequal([SS6970,SS489496],double('HVFR'))&&~isequal([SS6970,SS489496],double('XXXX'))
        Record69496=[SS6970,SS489496];
        Record69496_1 = ["S69","S70","S489","S496"];
        for ii69496=1:length(Record69496_1)
            eval([char(Record69496_1(ii69496)),'=Record69496(ii69496)']);
        end
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score69496 = obj.bilTrain('269496', char(S69,S70)', char(S489,S496)');
 %      score69496 = obj.bilTrain('2269496', char(S69),char(S70), char(S489),char(S496));

        if score69496 < 0
            if  a69==0
                S69=0;
            end
            if a70==0
                S70=0;
            end
            if  a489==0
                S489=0;
            end
            if a496==0
                S496=0;
            end
            continue
        end
        
        if score69496>=0
            M{1}(while_flag,:)=[S69,S70,S489,S496];
            while_flag=while_flag+1;
        end
    end
    [S69,S70,S489,S496]=deal(0);
    [a69,a70,a489,a496]=deal(1);
end
     
%% Paragraph 2
while_flag = 1;
S76=0;
a76=1;
while while_flag <= num
    if S76==0
    S76=randsrc(1,1,[double('T'),double('I'),100;pn(5:5,:)*alpha,(1-pn(5:5,:))*alpha,1-alpha]);
    end
    if S76==100
        S76=randsrc(1,1,[double('I');1]);
        a76=0;
    end
    if S76==double('T') || S76==88
        M{2}(while_flag,:)=[S76];
        S76 = 0;
        while_flag=while_flag+1;
    end
    
    if (S76~=double('T')) && (S76~=88)
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score76 = obj.bilTrain('276',char(S76));
        if score76<0
            if a76==0
                S76=0;
            end
            continue
        end
        
        if score76>=0
            M{2}(while_flag,:)=[S76];
            while_flag=while_flag+1;
        end
    end
           S76 = 0;
           a76 = 1;
end

%%  Paragraph 3
[S149,S436,S437,S438,S475,S476,S477,S478,S479,S480,S481,S482,S484,S485,S486,S487,S488,S490,S491,S492,S493,S495,S497,S498,S501,S502,S503,S504,S506,S507,S508,S509,S513,S514,S515,S516,S517,S518,S519,S520,S521,S522,S523,S525,S526,S531,S444,S445,S446,S448,S450,S451,S452,S454,S456,S458,S459,S461,S462,S463,S464,S465,S466,S449,S447,S453,S467,S469,S471,S472,S473,S474,S499,S688]=deal(0);
[a149,a436,a437,a438,a475,a476,a477,a478,a479,a480,a481,a482,a484,a485,a486,a487,a488,a490,a491,a492,a493,a495,a497,a498,a501,a502,a503,a504,a506,a507,a508,a509,a513,a514,a515,a516,a517,a518,a519,a520,a521,a522,a523,a525,a526,a531,a444,a445,a446,a448,a450,a451,a452,a454,a456,a458,a459,a461,a462,a463,a464,a465,a466,a449,a447,a453,a467,a469,a471,a472,a473,a474,a499,a688]=deal(1);
while_flag = 1;
%S436=The amino acid at site 433
%S437=The amino acid at site 434
%S438=The amino acid at site 435
%S475=The amino acid at site 472
%S476=The amino acid at site 473
%S477=The amino acid at site 474
%S478=The amino acid at site 475
%S479=The amino acid at site 476
%S480=The amino acid at site 477
%S481=The amino acid at site 478
%S482=The amino acid at site 479
%S484=The amino acid at site 481
%S485=The amino acid at site 482
%S486=The amino acid at site 483
%S487=The amino acid at site 484
%...
while while_flag <= num
    if S149==0
        S149=randsrc(1,1,[double('N'),88,100;pn(6:6,:)*alpha,(1-pn(6:6,:))*alpha,1-alpha]);
    end
    if S436==0
        S436=randsrc(1,1,[double('V'),88,100;pn(7:7,:)*alpha,(1-pn(7:7,:))*alpha,1-alpha]);
    end
    if S437==0
        S437=randsrc(1,1,[double('I'),88,100;pn(8:8,:)*alpha,(1-pn(8:8,:))*alpha,1-alpha]);
    end
    if S438==0
        S438=randsrc(1,1,[double('A'),88,100;pn(9:9,:)*alpha,(1-pn(9:9,:))*alpha,1-alpha]);
    end
    if S475==0
        S475=randsrc(1, 1,[double('I'),double('X'),100;pn(10:10,:)*alpha,(1-pn(10:10,:))*alpha,1-alpha]);
    end
    if S476==0
        S476=randsrc(1, 1,[double('Y'),double('X'),100;pn(11:11,:)*alpha,(1-pn(11:11,:))*alpha,1-alpha]);
    end
    if S477==0
        S477=randsrc(1, 1,[double('Q'),double('X'),100;pn(12:12,:)*alpha,(1-pn(12:12,:))*alpha,1-alpha]);
    end
    if S478==0
        S478=randsrc(1, 1,[double('A'),double('X'),100;pn(13:13,:)*alpha,(1-pn(13:13,:))*alpha,1-alpha]);
    end
    if S479==0
        S479=randsrc(1, 1,[double('G'),double('X'),100;pn(14:14,:)*alpha,(1-pn(14:14,:))*alpha,1-alpha]);
    end
    if S480==0
        S480=randsrc(1, 1,[double('N'),double('X'),100;pn(15:15,:)*alpha,(1-pn(15:15,:))*alpha,1-alpha]);
    end
    if S481==0
        S481=randsrc(1, 1,[double('K'),double('X'),100;pn(16:16,:)*alpha,(1-pn(16:16,:))*alpha,1-alpha]);
    end
    if S482==0
        S482=randsrc(1, 1,[double('P'),double('X'),100;pn(17:17,:)*alpha,(1-pn(17:17,:))*alpha,1-alpha]);
    end
    if 484==0
        S484=randsrc(1, 1,[double('N'),double('X'),100;pn(18:18,:)*alpha,(1-pn(18:18,:))*alpha,1-alpha]);
    end
    if S485==0
        S485=randsrc(1, 1,[double('G'),double('X'),100;pn(19:19,:)*alpha,(1-pn(19:19,:))*alpha,1-alpha]);
    end
    if S486==0
        S486=randsrc(1, 1,[double('V'),double('X'),100;pn(20:20,:)*alpha,(1-pn(20:20,:))*alpha,1-alpha]);
    end
    if S487==0
        S487=randsrc(1, 1,[double('A'),double('X'),100;pn(21:21,:)*alpha,(1-pn(21:21,:))*alpha,1-alpha]);
    end
    if S488==0
        S488=randsrc(1, 1,[double('G'),double('X'),100;pn(22:22,:)*alpha,(1-pn(22:22,:))*alpha,1-alpha]);
    end
    if S490==0
        S490=randsrc(1, 1,[double('N'),double('X'),100;pn(23:23,:)*alpha,(1-pn(23:23,:))*alpha,1-alpha]);
    end
    if S491==0
        S491=randsrc(1, 1,[double('C'),double('X'),100;pn(24:24,:)*alpha,(1-pn(24:24,:))*alpha,1-alpha]);
    end
    if S492==0
        S492=randsrc(1, 1,[double('Y'),double('X'),100;pn(25:25,:)*alpha,(1-pn(25:25,:))*alpha,1-alpha]);
    end
    if S493==0
        S493=randsrc(1, 1,[double('F'),double('X'),100;pn(26:26,:)*alpha,(1-pn(26:26,:))*alpha,1-alpha]);
    end
    if S495==0
        S495=randsrc(1, 1,[double('L'),double('X'),100;pn(27:27,:)*alpha,(1-pn(27:27,:))*alpha,1-alpha]);
    end
    if S497==0
        S497=randsrc(1, 1,[double('S'),double('X'),100;pn(28:28,:)*alpha,(1-pn(28:28,:))*alpha,1-alpha]);
    end
    if S498==0
        S498=randsrc(1, 1,[double('Y'),double('X'),100;pn(29:29,:)*alpha,(1-pn(29:29,:))*alpha,1-alpha]);
    end
    if S501==0
        S501=randsrc(1, 1,[double('R'),double('X'),100;pn(30:30,:)*alpha,(1-pn(30:30,:))*alpha,1-alpha]);
    end
    if S502==0
        S502=randsrc(1, 1,[double('P'),double('X'),100;pn(31:31,:)*alpha,(1-pn(31:31,:))*alpha,1-alpha]);
    end
    if S503==0
        S503=randsrc(1, 1,[double('T'),double('X'),100;pn(32:32,:)*alpha,(1-pn(32:32,:))*alpha,1-alpha]);
    end
    if S504==0
        S504=randsrc(1, 1,[double('Y'),double('X'),100;pn(33:33,:)*alpha,(1-pn(33:33,:))*alpha,1-alpha]);
    end
    if S506==0
        S506=randsrc(1, 1,[double('V'),double('X'),100;pn(34:34,:)*alpha,(1-pn(34:34,:))*alpha,1-alpha]);
    end
    if S507==0
        S507=randsrc(1, 1,[double('G'),double('X'),100;pn(35:35,:)*alpha,(1-pn(35:35,:))*alpha,1-alpha]);
    end
    if S508==0
        S508=randsrc(1, 1,[double('H'),double('X'),100;pn(36:36,:)*alpha,(1-pn(36:36,:))*alpha,1-alpha]);
    end
    if S509==0
        S509=randsrc(1, 1,[double('Q'),double('X'),100;pn(37:37,:)*alpha,(1-pn(37:37,:))*alpha,1-alpha]);
    end
    if S513==0
        S513=randsrc(1, 1,[double('V'),double('X'),100;pn(38:38,:)*alpha,(1-pn(38:38,:))*alpha,1-alpha]);
    end
    if S514==0
        S514=randsrc(1, 1,[double('V'),double('X'),100;pn(39:39,:)*alpha,(1-pn(39:39,:))*alpha,1-alpha]);
    end
    if S515==0
        S515=randsrc(1, 1,[double('V'),double('X'),100;pn(40:40,:)*alpha,(1-pn(40:40,:))*alpha,1-alpha]);
    end
    if S516==0
        S516=randsrc(1, 1,[double('L'),double('X'),100;pn(41:41,:)*alpha,(1-pn(41:41,:))*alpha,1-alpha]);
    end
    if S517==0
        S517=randsrc(1, 1,[double('S'),double('X'),100;pn(42:42,:)*alpha,(1-pn(42:42,:))*alpha,1-alpha]);
    end
    if S518==0
        S518=randsrc(1, 1,[double('F'),double('X'),100;pn(43:43,:)*alpha,(1-pn(43:43,:))*alpha,1-alpha]);
    end
    if S519==0
        S519=randsrc(1, 1,[double('E'),double('X'),100;pn(44:44,:)*alpha,(1-pn(44:44,:))*alpha,1-alpha]);
    end
    if S520==0
        S520=randsrc(1, 1,[double('L'),double('X'),100;pn(45:45,:)*alpha,(1-pn(45:45,:))*alpha,1-alpha]);
    end
    if S521==0
        S521=randsrc(1, 1,[double('L'),double('X'),100;pn(46:46,:)*alpha,(1-pn(46:46,:))*alpha,1-alpha]);
    end
    if S522==0
        S522=randsrc(1, 1,[double('H'),double('X'),100;pn(47:47,:)*alpha,(1-pn(47:47,:))*alpha,1-alpha]);
    end
    if S523==0
        S523=randsrc(1, 1,[double('A'),double('X'),100;pn(48:48,:)*alpha,(1-pn(48:48,:))*alpha,1-alpha]);
    end
    if S449==0
        S449=randsrc(1,1,[double('G'),double('X'),100;pn(69:69,:)*alpha,(1-pn(69:69,:))*alpha,1-alpha]);
    end
    if S525==0
        S525=randsrc(1,1,[double('A'),88,100;pn(49:49,:)*alpha,(1-pn(49:49,:))*alpha,1-alpha]);
    end
    if S526==0
        S526=randsrc(1,1,[double('T'),88,100;pn(50:50,:)*alpha,(1-pn(50:50,:))*alpha,1-alpha]);
    end
    if S531==0
        S531=randsrc(1,1,[double('K'),88,100;pn(51:51,:)*alpha,(1-pn(51:51,:))*alpha,1-alpha]);
    end
    if S447==0
        S447=randsrc(1, 1,[double('K'),double('X'),100;pn(70:70,:)*alpha,(1-pn(70:70,:))*alpha,1-alpha]);
    end
    if S453==0
        S453=randsrc(1, 1,[double('N'),double('X'),100;pn(71:71,:)*alpha,(1-pn(71:71,:))*alpha,1-alpha]);
    end
    if S467==0
        S467=randsrc(1, 1,[double('F'),double('X'),100;pn(72:72,:)*alpha,(1-pn(72:72,:))*alpha,1-alpha]);
    end
    if S469==0
        S469=randsrc(1, 1,[double('R'),double('X'),100;pn(73:73,:)*alpha,(1-pn(73:73,:))*alpha,1-alpha]);
    end
    if S471==0
        S471=randsrc(1, 1,[double('I'),double('X'),100;pn(74:74,:)*alpha,(1-pn(74:74,:))*alpha,1-alpha]);
    end
    if S472==0
        S472=randsrc(1, 1,[double('S'),double('X'),100;pn(75:75,:)*alpha,(1-pn(75:75,:))*alpha,1-alpha]);
    end
    if S473==0
        S473=randsrc(1, 1,[double('T'),double('X'),100;pn(76:76,:)*alpha,(1-pn(76:76,:))*alpha,1-alpha]);
    end
    if S474==0
        S474=randsrc(1, 1,[double('E'),double('X'),100;pn(77:77,:)*alpha,(1-pn(77:77,:))*alpha,1-alpha]);
    end
    if S444==0
        S444=randsrc(1, 1,[double('L'),double('X'),100;pn(52:52,:)*alpha,(1-pn(52:52,:))*alpha,1-alpha]);
    end
    if S445==0
        S445=randsrc(1, 1,[double('D'),double('X'),100;pn(53:53,:)*alpha,(1-pn(53:53,:))*alpha,1-alpha]);
    end
    if S446==0
        S446=randsrc(1, 1,[double('S'),double('X'),100;pn(54:54,:)*alpha,(1-pn(54:54,:))*alpha,1-alpha]);
    end
    if S448==0
        S448=randsrc(1, 1,[double('V'),double('X'),100;pn(55:55,:)*alpha,(1-pn(55:55,:))*alpha,1-alpha]);
    end
    if S450==0
        S450=randsrc(1, 1,[double('G'),double('X'),100;pn(56:56,:)*alpha,(1-pn(56:56,:))*alpha,1-alpha]);
    end
    if S451==0
        S451=randsrc(1, 1,[double('N'),double('X'),100;pn(57:57,:)*alpha,(1-pn(57:57,:))*alpha,1-alpha]);
    end
    if S452==0
        S452=randsrc(1, 1,[double('Y'),double('X'),100;pn(58:58,:)*alpha,(1-pn(58:58,:))*alpha,1-alpha]);
    end
    if S454==0
        S454=randsrc(1, 1,[double('Y'),double('X'),100;pn(59:59,:)*alpha,(1-pn(59:59,:))*alpha,1-alpha]);
    end
    if S456==0
        S456=randsrc(1, 1,[double('Y'),double('X'),100;pn(60:60,:)*alpha,(1-pn(60:60,:))*alpha,1-alpha]);
    end
    if S458==0
        S458=randsrc(1, 1,[double('L'),double('X'),100;pn(61:61,:)*alpha,(1-pn(61:61,:))*alpha,1-alpha]);
    end
    if S459==0
        S459=randsrc(1, 1,[double('F'),double('X'),100;pn(62:62,:)*alpha,(1-pn(62:62,:))*alpha,1-alpha]);
    end
    if S461==0
        S461=randsrc(1, 1,[double('K'),double('X'),100;pn(63:63,:)*alpha,(1-pn(63:63,:))*alpha,1-alpha]);
    end
    if S462==0
        S462=randsrc(1, 1,[double('S'),double('X'),100;pn(64:64,:)*alpha,(1-pn(64:64,:))*alpha,1-alpha]);
    end
    if S463==0
        S463=randsrc(1, 1,[double('N'),double('X'),100;pn(65:65,:)*alpha,(1-pn(65:65,:))*alpha,1-alpha]);
    end
    if S464==0
        S464=randsrc(1, 1,[double('L'),double('X'),100;pn(66:66,:)*alpha,(1-pn(66:66,:))*alpha,1-alpha]);
    end
    if S465==0
        S465=randsrc(1, 1,[double('K'),double('X'),100;pn(67:67,:)*alpha,(1-pn(67:67,:))*alpha,1-alpha]);
    end
    if S466==0
        S466=randsrc(1, 1,[double('P'),double('X'),100;pn(68:68,:)*alpha,(1-pn(68:68,:))*alpha,1-alpha]);
    end
    if S499==0
        S499=randsrc(1, 1,[double('G'),double('X'),100;pn(78:78,:)*alpha,(1-pn(78:78,:))*alpha,1-alpha]);
    end
    if S688==0
        S688=randsrc(1, 1,[double('R'),double('X'),100;pn(79:79,:)*alpha,(1-pn(79:79,:))*alpha,1-alpha]);
    end
    
    if S499==100
        S499=randsrc(1,1,[double('S'),double('D'),double('N');1539/1544,4/1544,1/1544]);
        a449=0;
    end
    if S688==100
        S688=randsrc(1,1,[double('L'),double('P');0.67,0.33]);
        a688=0;
    end
    if S149==100
        S149=randsrc(1,1,[double('S'),double('K'),double('I'),double('Y'),double('D'),double('T');0.667,0.1,0.1,0.0667,(1-0.2-0.667-0.0667)/2,(1-0.2-0.667-0.0667)/2]);
        a149=0;
    end
    if S436==100
        S436=randsrc(1,1,[double('I');1]);
        a436=0;
    end
    if S437==100
        S437=randsrc(1,1,[double('V'),double('T'),double('L');0.818,(1-0.818)/2,(1-0.818)/2]);
        a437=0;
    end
    if S438==100
        S438=randsrc(1,1,[double('S'),double('T');0.979,(1-0.979)]);
        a438=0;
    end
    if S475==100
        S475=randsrc(1, 1,[double('L'),double('T'),double('V');0.6,0.2,0.2]);
        a475=0;
    end
    if S476==100
        S476=randsrc(1, 1,[double('F'),double('H');0.67,0.33]);
        a476=0;
    end
    if S477==100
        S477=randsrc(1, 1,[double('K'),double('E');0.67,0.33]);
        a477=0;
    end
    if S478==100
        S478=randsrc(1, 1,[double('V'),double('T'),double('S');0.32,0.18,1-0.32-0.18]);
        a478=0;
    end
    if S479==100
        S479=randsrc(1, 1,[double('S');1]);
        a479=0;
    end
    if S480==100
        S480=randsrc(1, 1,[double('S'),double('K'),double('D');0.989,0.006,1-0.006-0.989]);
        a480=0;
    end
    if S481==100
        S481=randsrc(1, 1,[double('Q'),double('E'),double('R'),double('I'),double('N'),double('T');2/2126,36/2126,110/2126,14/2126,9/2126,1955/2126]);
        a481=0;
    end
    if S482==100
        S482=randsrc(1, 1,[double('L'),double('S'),double('R'),double('H'),double('Q'); 24/38,7/38,2/38,4/38,1/38]);
        a482=0;
    end
    if S484==100
        S484=randsrc(1, 1,[double('K'),double('D'),double('S'),double('H');17/35,8/35,9/35,1/35]);
        a484=0;
    end
    if S485==100
        S485=randsrc(1, 1,[double('D'),double('S'),double('R');2/11,8/11,1/11]);
        a485=0;
    end
    if S486==100
        S486=randsrc(1, 1,[double('F'),double('I'),double('A'),double('L'),double('G');22/62,19/62,17/62,3/62,1/62]);
        a486=0;
    end
    if S487==100
        S487=randsrc(1, 1,[double('E'),double('R'),double('V'),double('S'),double('T'),double('P');1159/1435,10/1435,179/1435,57/1435,23/1435,7/1435]);
        a487=0;
    end
    if S488==100
        S488=randsrc(1, 1,[double('S'),double('D');0.9,0.1]);
        a488=0;
    end
    if S490==100
        S490=randsrc(1, 1,[double('D'),double('K'),double('T');5/7,1/7,1/7]);
        a490=0;
    end
    if S491==100
        S491=randsrc(1, 1,[double('R');1]);
        a491=0;
    end
    if S492==100
        S492=randsrc(1, 1,[double('H');1]);
        a492=0;
    end
    if S493==100
        S493=randsrc(1, 1,[double('V'),double('Y'),double('S'),double('I'),double('L');3/76,2/76,50/76,1/76,20/76]);
        a493=0;
    end
    if S495==100
        S495=randsrc(1, 1,[double('K');1]);
        a495=0;
    end
    if S497==100
        S497=randsrc(1, 1,[double('P'),double('T'),double('L'),double('A');213/220,4/220,2/220,1/220]);
        a497=0;
    end
    if S498==100
        S498=randsrc(1, 1,[double('H');1]);
        a498=0;
    end
    if S501==100
        S501=randsrc(1, 1,[double('Q');1]);
        a501=0;
    end
    if S502==100
        S502=randsrc(1, 1,[double('S'),double('R'),double('H');1/3,1/3,1/3]);
        a502=0;
    end
    if S503==100
        S503=randsrc(1, 1,[double('S'),double('A'),double('N');7/9,1/9,1/9]);
        a503=0;
    end
    if S504==100
        S504=randsrc(1, 1,[double('N'),double('F');793/794,1/794]);
        a504=0;
    end
    if S506==100
        S506=randsrc(1, 1,[double('F');1]);
        a506=0;
    end
    if S507==100
        S507=randsrc(1, 1,[double('D');1]);
        a507=0;
    end
    if S508==100
        S508=randsrc(1, 1,[double('Y'),double('Q');929/930,1/930]);
        a508=0;
    end
    if S509==100
        S509=randsrc(1, 1,[double('K');1]);
        a509=0;
    end
    if S513==100
        S513=randsrc(1, 1,[double('I'),double('L');0.67,0.33]);
        a513=0;
    end
    if S514==100
        S514=randsrc(1, 1,[double('I'),double('L');0.5,0.5]);
        a514=0;
    end
    if S515==100
        S515=randsrc(1, 1,[double('A');1]);
        a515=0;
    end
    if S516==100
        S516=randsrc(1, 1,[double('F');1]);
        a516=0;
    end
    if S517==100
        S517=randsrc(1, 1,[double('A');1]);
        a517=0;
    end
    if S518==100
        S518=randsrc(1, 1,[double('L'),double('S');5/6,1/6]);
        a518=0;
    end
    if S519==100
        S519=randsrc(1, 1,[double('Q'),double('K');0.5,0.5]);
        a519=0;
    end
    if S520==100
        S520=randsrc(1, 1,[double('Q'),double('F'),double('P');1/64,62/64,1/64]);
        a520=0;
    end
    if S521==100
        S521=randsrc(1, 1,[double('Q'),double('V'),double('P');2/8,2/8,4/8]);
        a521=0;
    end
    if S522==100
        S522=randsrc(1, 1,[double('Q'),double('R'),double('Y'),double('L'),double('N'),double('D'),double('P');5/17,2/17,5/17,1/17,1/17,2/17,1/17]);
        a522=0;
    end
    if S523==100
        S523=randsrc(1, 1,[double('S'),double('T'),double('G');2/35,31/35,2/35]);
        a523=0;
    end
    if S449==100
        S449=randsrc(1,1,[double('R'),double('V'),double('S'),double('I'),double('A'),double('N'),double('D'),double('T');7/2375,46/2375,2194/2375,1/2375,3/2375,4/2375,117/2375,3/2375]);
        a449=-0;
    end
    if S447==100
        S447=randsrc(1,1,[double('Q'),double('E'),double('R'),double('S'),double('N'),double('T'),double('M');6/1841,4/1841,729/1841,2/1841,585/1841,387/1841,128/1841,]);
        a447=0;
    end
    if S453==100
        S453=randsrc(1,1,[double('Q'),double('Y'),double('I'),double('D');7/779,3/779,7/779,762/779]);
        a453=0;
    end
    if S467==100
        S467=randsrc(1,1,[double('I'),double('L');0.5,0.5]);
        a467=0;
    end
    if S469==100
        S469=randsrc(1,1,[double('I'),double('T');0.5,0.5]);
        a469=0;
    end
    if S471==100
        S471=randsrc(1,1,[double('T');1]);
        a471=0;
    end
    if S472==100
        S472=randsrc(1,1,[double('T');1]);
        a472=0;
    end
    if S473==100
        S473=randsrc(1,1,[double('S'),double('I'),double('A'),double('N');2/84,43/84,2/84,37/84]);
        a473=0;
    end
    if S474==100
        S474=randsrc(1,1,[double('Q'),double('V'),double('D'),double('K'),double('G'),double('Z');52/57,1/57,1/57,1/57,1/57,1/57]);
        a474=0;
    end
    if S525==100
        S525=randsrc(1,1,[double('E'),double('V'),double('S'),double('P');3/275,37/275,30/275,205/275]);
        a525=0;
    end
    if S526==100
        S526=randsrc(1,1,[double('N');1]);
        a526=0;
    end
    if S531==100
        S531=randsrc(1,1,[double('R');1]);
        a531=0;
    end
    if S444==100
        S444=randsrc(1,1,[double('F'),double('I'),double('G');8/13,4/13,1/13]);
        a444=0;
    end
    if S445==100
        S445=randsrc(1,1,[double('V');1]);
        a445=0;
    end
    if S446==100
        S446=randsrc(1,1,[double('A');1]);
        a446=0;
    end
    if S448==100
        S448=randsrc(1,1,[double('R'),double('F'),double('I'),double('A'),double('L'),double('D'),double('G');1/634,100/634,20/634,502/634,2/634,6/634,3/634]);
        a448=0;
    end
    if S450==100
        S450=randsrc(1,1,[double('V');1]);
        a450=0;
    end
    if S451==100
        S451=randsrc(1,1,[double('S'),double('D');2/11,9/11]);
        a451=0;
    end
    if S452==100
        S452=randsrc(1,1,[double('H'),double('S'),double('N'),double('D');0.29,0.07,0.6,0.04]);
        a452=0;
    end
    if S454==100
        S454=randsrc(1,1,[double('H');1]);
        a454=0;
    end
    if S456==100
        S456=randsrc(1,1,[double('H'),double('F');0.5,0.5]);
        a456=0;
    end
    if S458==100
        S458=randsrc(1,1,[double('V'),double('F'),double('S'),double('W');4/64,34/64,21/64,5/64]);
        a458=0;
    end
    if S459==100
        S459=randsrc(1,1,[double('V'),double('Y'),double('L');1/8,1/8,6/8]);
        a459=0;
    end
    if S461==100
        S461=randsrc(1,1,[double('E'),double('R');0.33,0.67]);
        a461=0;
    end
    if S462==100
        S462=randsrc(1,1,[double('F');1]);
        a462=0;
    end
    if S463==100
        S463=randsrc(1,1,[double('H'),double('Y'),double('S'),double('I'),double('A'),double('K'),double('T');9/978,16/978,196/978,19/978,2/978,734/978,2/978]);
        a463=0;
    end
    if S464==100
        S464=randsrc(1,1,[double('E'),double('V'),double('I');1/89,1/89,87/89]);
        a464=0;
    end
    if S465==100
        S465=randsrc(1,1,[double('R');1]);
        a465=0;
    end
    if S466==100
        S466=randsrc(1,1,[double('R'),double('S'),double('I'),double('A'),double('D'),double('T'),double('G');5/143,71/143,1/143,4/143,1/143,52/143,9/143,]);
        a466=0;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if S436 == double('V')
        S437=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
        S438=randsrc(1, 1,[double('A'),double('X');0.9989826074318104, 1-0.9989826074318104]);
    end
    if S437 == double('I')
        S438=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S436=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
    end
    if S438 == double('A')
        S436=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S437=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
    end
    SS436438=[S436,S437,S438];
    %%
    if S475 == double('I')
        S476=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S477=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
        S478=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9989834041305895, 1-0.9989834041305895]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9932490590090866, 1-0.9932490590090866]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9934886685618309, 1-0.9934886685618309]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9986274792609791, 1-0.9986274792609791]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9985600163771966, 1-0.9985600163771966]);
        S485=randsrc(1, 1,[double('G'),double('X');0.998641437099003, 1-0.998641437099003]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9983995012399213, 1-0.9983995012399213]);
        S487=randsrc(1, 1,[double('A'),double('X');0.994919346959285, 1-0.994919346959285]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9985088376377755, 1-0.9985088376377755]);
        S490=randsrc(1, 1,[double('N'),double('X');0.998634458179991, 1-0.998634458179991]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9985972372785938, 1-0.9985972372785938]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9981343023174664, 1-0.9981343023174664]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9978411877189636, 1-0.9978411877189636]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9979830924055403, 1-0.9979830924055403]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9975085259127263, 1-0.9975085259127263]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9980040291625762, 1-0.9980040291625762]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9950938199345842, 1-0.9950938199345842]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9971572536557904, 1-0.9971572536557904]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9971130538353813, 1-0.9971130538353813]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9953124927302927, 1-0.9953124927302927]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9970990959973574, 1-0.9970990959973574]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9971735378001517, 1-0.9971735378001517]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9933700269386274, 1-0.9933700269386274]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9959266376033462, 1-0.9959266376033462]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9967385185150721, 1-0.9967385185150721]);
        S514=randsrc(1, 1,[double('V'),double('X');0.996694318694663, 1-0.996694318694663]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9966338347298925, 1-0.9966338347298925]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9965035615750024, 1-0.9965035615750024]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9965803296841341, 1-0.9965803296841341]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9966501188742538, 1-0.9966501188742538]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9965989401348327, 1-0.9965989401348327]);
        S520=randsrc(1, 1,[double('L'),double('X');0.996464014367268, 1-0.996464014367268]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9966826871629764, 1-0.9966826871629764]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9965524140080863, 1-0.9965524140080863]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9964709932862799, 1-0.9964709932862799]);
    end
    
    if S476 == double('Y')
        S477=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
        S478=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9989744352998905, 1-0.9989744352998905]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9932094128700231, 1-0.9932094128700231]);
        S481=randsrc(1, 1,[double('K'),double('X');0.993416386244875, 1-0.993416386244875]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9986232782257033, 1-0.9986232782257033]);
        S484=randsrc(1, 1,[double('N'),double('X');0.998555837463111, 1-0.998555837463111]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9986186271386279, 1-0.9986186271386279]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9983558407188721, 1-0.9983558407188721]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9948721764994524, 1-0.9948721764994524]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9984674668086798, 1-0.9984674668086798]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9986093249644773, 1-0.9986093249644773]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9985581630066487, 1-0.9985581630066487]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.998113984190955, 1-0.998113984190955]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9978256167922848, 1-0.9978256167922848]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9979581727739316, 1-0.9979581727739316]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9975000406970119, 1-0.9975000406970119]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9979791026657706, 1-0.9979791026657706]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9950465922647771, 1-0.9950465922647771]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9971046982956091, 1-0.9971046982956091]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9970535363377806, 1-0.9970535363377806]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9952651933573174, 1-0.9952651933573174]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9970256298153286, 1-0.9970256298153286]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9970977216649961, 1-0.9970977216649961]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9932745280890776, 1-0.9932745280890776]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9958605325029593, 1-0.9958605325029593]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9966698216540661, 1-0.9966698216540661]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9966233107833128, 1-0.9966233107833128]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9965465678465699, 1-0.9965465678465699]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9964047096907724, 1-0.9964047096907724]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9964744759969024, 1-0.9964744759969024]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9965535444771829, 1-0.9965535444771829]);
        S519=randsrc(1, 1,[double('E'),double('X');0.996490754801666, 1-0.996490754801666]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9963628499070946, 1-0.9963628499070946]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9965837765431725, 1-0.9965837765431725]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9964605227356764, 1-0.9964605227356764]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9963605243635568, 1-0.9963605243635568]);
        S475=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
    end
    
    if S477 == double('Q')
        S478=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S479=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9933761588233379, 1-0.9933761588233379]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9935854796470386, 1-0.9935854796470386]);
        S482=randsrc(1, 1,[double('P'),double('X');0.998783613435606, 1-0.998783613435606]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9986975593191957, 1-0.9986975593191957]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9987626813532359, 1-0.9987626813532359]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9984928900693549, 1-0.9984928900693549]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9950111870351334, 1-0.9950111870351334]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9986022020550653, 1-0.9986022020550653]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9986975593191957, 1-0.9986975593191957]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9986301114982254, 1-0.9986301114982254]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9982277503593341, 1-0.9982277503593341]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9979370269930831, 1-0.9979370269930831]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9980719226350235, 1-0.9980719226350235]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9976137426098121, 1-0.9976137426098121]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9980905289304636, 1-0.9980905289304636]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9951530600378639, 1-0.9951530600378639]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9972090556839907, 1-0.9972090556839907]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9971625399453905, 1-0.9971625399453905]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9953740097962146, 1-0.9953740097962146]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9971416078630204, 1-0.9971416078630204]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9972206846186407, 1-0.9972206846186407]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9933901135449179, 1-0.9933901135449179]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9959391760202064, 1-0.9959391760202064]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9966927309855289, 1-0.9966927309855289]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9966462152469288, 1-0.9966462152469288]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9965578353435885, 1-0.9965578353435885]);
        S516=randsrc(1, 1,[double('L'),double('X');0.996418288127788, 1-0.996418288127788]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9964857359487582, 1-0.9964857359487582]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9965624869174485, 1-0.9965624869174485]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9965043422441984, 1-0.9965043422441984]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9963717723891878, 1-0.9963717723891878]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9965950479344686, 1-0.9965950479344686]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9964578265055982, 1-0.9964578265055982]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9963531660937478, 1-0.9963531660937478]);
        S475=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
        S476=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
    end
    
    if S478 == double('A')
        S479=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9936311955115978, 1-0.9936311955115978]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9938451947858612, 1-0.9938451947858612]);
        S482=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S484=randsrc(1, 1,[double('N'),double('X');0.998948612261228, 1-0.998948612261228]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9989835034472492, 1-0.9989835034472492]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9987043739590796, 1-0.9987043739590796]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9951966467244154, 1-0.9951966467244154]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9987834606473943, 1-0.9987834606473943]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9987950910427347, 1-0.9987950910427347]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9986671566939903, 1-0.9986671566939903]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9984089619174334, 1-0.9984089619174334]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9981182020339235, 1-0.9981182020339235]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9982507885408041, 1-0.9982507885408041]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9977995292015966, 1-0.9977995292015966]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9982717232524168, 1-0.9982717232524168]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9953524940219768, 1-0.9953524940219768]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9974040957600231, 1-0.9974040957600231]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9973389655461169, 1-0.9973389655461169]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9955548629008997, 1-0.9955548629008997]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9973157047554361, 1-0.9973157047554361]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9973808349693423, 1-0.9973808349693423]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9934776742931045, 1-0.9934776742931045]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9959340137889967, 1-0.9959340137889967]);
        S513=randsrc(1, 1,[double('V'),double('X');0.996610902797808, 1-0.996610902797808]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9965457725839016, 1-0.9965457725839016]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9964713380537231, 1-0.9964713380537231]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9963271211515021, 1-0.9963271211515021]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9964015556816808, 1-0.9964015556816808]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9964806423699955, 1-0.9964806423699955]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9964341207886338, 1-0.9964341207886338]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9962992082026852, 1-0.9962992082026852]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9965155335560166, 1-0.9965155335560166]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9963852731282041, 1-0.9963852731282041]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9962852517282768, 1-0.9962852517282768]);
        S475=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
        S476=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S477=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
    end
    
    if S479 == double('G')
        S480=randsrc(1, 1,[double('N'),double('X');0.9939305255713541, 1-0.9939305255713541]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9941282662100797, 1-0.9941282662100797]);
        S482=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S484=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S485=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9988670624581255, 1-0.9988670624581255]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9953728690538227, 1-0.9953728690538227]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9989298741904266, 1-0.9989298741904266]);
        S490=randsrc(1, 1,[double('N'),double('X');0.998904284225415, 1-0.998904284225415]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9987507444353458, 1-0.9987507444353458]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9985669619593538, 1-0.9985669619593538]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9982994305069605, 1-0.9982994305069605]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9984413384947517, 1-0.9984413384947517]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9979830454849996, 1-0.9979830454849996]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.998462275738852, 1-0.998462275738852]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9955566515298147, 1-0.9955566515298147]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9975782587657261, 1-0.9975782587657261]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9975038152311472, 1-0.9975038152311472]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9957218231221618, 1-0.9957218231221618]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9974665934638577, 1-0.9974665934638577]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9975200997543363, 1-0.9975200997543363]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9935373706543587, 1-0.9935373706543587]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9959451537258989, 1-0.9959451537258989]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9966081664557433, 1-0.9966081664557433]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9965500074443534, 1-0.9965500074443534]);
        S515=randsrc(1, 1,[double('V'),double('X');0.99647789027023, 1-0.99647789027023]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9963406350033499, 1-0.9963406350033499]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9964104258170178, 1-0.9964104258170178]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9965058065956972, 1-0.9965058065956972]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9964499739447629, 1-0.9964499739447629]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9963034132360604, 1-0.9963034132360604]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9965151120375195, 1-0.9965151120375195]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9963825094915506, 1-0.9963825094915506]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9962638651083153, 1-0.9962638651083153]);
        S475=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
        S476=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S477=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
        S478=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
    end
    
    if S480 == double('N')
        S481=randsrc(1, 1,[double('K'),double('X');1, 1-1]);
        S482=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S484=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S485=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S486=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S487=randsrc(1, 1,[double('A'),double('X');0.998380729748007, 1-0.998380729748007]);
        S488=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9988885066911897, 1-0.9988885066911897]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9986170683252487, 1-0.9986170683252487]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9987621474518723, 1-0.9987621474518723]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9982824503396489, 1-0.9982824503396489]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9987644874377857, 1-0.9987644874377857]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9978331730442983, 1-0.9978331730442983]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9978518929316046, 1-0.9978518929316046]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9977746733964662, 1-0.9977746733964662]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9977208537204606, 1-0.9977208537204606]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9977021338331543, 1-0.9977021338331543]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9977372336218536, 1-0.9977372336218536]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9956967659054693, 1-0.9956967659054693]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9961507231726465, 1-0.9961507231726465]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9968199591438459, 1-0.9968199591438459]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9967708194396669, 1-0.9967708194396669]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9967006198622684, 1-0.9967006198622684]);
        S516=randsrc(1, 1,[double('L'),double('X');0.996557880721558, 1-0.996557880721558]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9966280802989566, 1-0.9966280802989566]);
        S518=randsrc(1, 1,[double('F'),double('X');0.996705299834095, 1-0.996705299834095]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9966514801580895, 1-0.9966514801580895]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9965087410173791, 1-0.9965087410173791]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9967240197214012, 1-0.9967240197214012]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9965859605525175, 1-0.9965859605525175]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9964853411582463, 1-0.9964853411582463]);
        S475=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
        S476=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S477=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
        S478=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S479=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
    end
    
    if S481 == double('K')
        S482=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S484=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S485=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S486=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9984326018808778, 1-0.9984326018808778]);
        S488=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9988934637159033, 1-0.9988934637159033]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9986197538951013, 1-0.9986197538951013]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9987764937070135, 1-0.9987764937070135]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9982945772703878, 1-0.9982945772703878]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9987718149066579, 1-0.9987718149066579]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9978547700369625, 1-0.9978547700369625]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9978711458382071, 1-0.9978711458382071]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9977986244326954, 1-0.9977986244326954]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9977307818275394, 1-0.9977307818275394]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9977073878257615, 1-0.9977073878257615]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9977518364291396, 1-0.9977518364291396]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9957001824732139, 1-0.9957001824732139]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9961633837084172, 1-0.9961633837084172]);
        S513=randsrc(1, 1,[double('V'),double('X');0.996825433958733, 1-0.996825433958733]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9967739671548215, 1-0.9967739671548215]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9967084639498432, 1-0.9967084639498432]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9965680999391756, 1-0.9965680999391756]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9966523183455762, 1-0.9966523183455762]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9967248397510878, 1-0.9967248397510878]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9966710335469986, 1-0.9966710335469986]);
        S520=randsrc(1, 1,[double('L'),double('X');0.996528330136153, 1-0.996528330136153]);
        S521=randsrc(1, 1,[double('L'),double('X');0.996745894352688, 1-0.996745894352688]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9966078697421981, 1-0.9966078697421981]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9965119543349086, 1-0.9965119543349086]);
        S475=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
        S476=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S477=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
        S478=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S479=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S480=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
    end
    
    if S482 == double('P')
        S484=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S485=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S486=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9956313186531993, 1-0.9956313186531993]);
        S488=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9989322551979865, 1-0.9989322551979865]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9987484821274873, 1-0.9987484821274873]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9984786381252355, 1-0.9984786381252355]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9986321700575512, 1-0.9986321700575512]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9981669217778067, 1-0.9981669217778067]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9986438012645448, 1-0.9986438012645448]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9957243683091481, 1-0.9957243683091481]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9977156309464545, 1-0.9977156309464545]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9976342124974993, 1-0.9976342124974993]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9958523115860779, 1-0.9958523115860779]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9975155741861644, 1-0.9975155741861644]);
        S507=randsrc(1, 1,[double('G'),double('X');0.997562099014139, 1-0.997562099014139]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9936028361535133, 1-0.9936028361535133]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9959895598286025, 1-0.9959895598286025]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9966734747998269, 1-0.9966734747998269]);
        S514=randsrc(1, 1,[double('V'),double('X');0.996606013799264, 1-0.996606013799264]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9965106379019164, 1-0.9965106379019164]);
        S516=randsrc(1, 1,[double('L'),double('X');0.996354779728202, 1-0.996354779728202]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9964338719357585, 1-0.9964338719357585]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9965083116605177, 1-0.9965083116605177]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9964478293841509, 1-0.9964478293841509]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9963082549002275, 1-0.9963082549002275]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9965199428675112, 1-0.9965199428675112]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9963873471077841, 1-0.9963873471077841]);
        S523=randsrc(1, 1,[double('A'),double('X');0.996261730072253, 1-0.996261730072253]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9985996026779691, 1-0.9985996026779691]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9989229502323915, 1-0.9989229502323915]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9989787800259609, 1-0.9989787800259609]);
        S478=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S479=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9938447652589805, 1-0.9938447652589805]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9941657865720042, 1-0.9941657865720042]);
    end
    
    if S484 == double('N')
        S485=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S486=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9957622486597123, 1-0.9957622486597123]);
        S488=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.998823105280908, 1-0.998823105280908]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9985230669039064, 1-0.9985230669039064]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9986695972740699, 1-0.9986695972740699]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9981881403435323, 1-0.9981881403435323]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.998660293758504, 1-0.998660293758504]);
        S501=randsrc(1, 1,[double('R'),double('X');0.995736663991906, 1-0.995736663991906]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9977136610496692, 1-0.9977136610496692]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9976183000151182, 1-0.9976183000151182]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9958366767842398, 1-0.9958366767842398]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9974461849771482, 1-0.9974461849771482]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9975113095861099, 1-0.9975113095861099]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9935829001383898, 1-0.9935829001383898]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9959878589121864, 1-0.9959878589121864]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9966623637907174, 1-0.9966623637907174]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9965809580295154, 1-0.9965809580295154]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9964669899638325, 1-0.9964669899638325]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9963018525625371, 1-0.9963018525625371]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9963716289292817, 1-0.9963716289292817]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9964530346904836, 1-0.9964530346904836]);
        S519=randsrc(1, 1,[double('E'),double('X');0.996387910081522, 1-0.996387910081522]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9962506832269243, 1-0.9962506832269243]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9964414052960262, 1-0.9964414052960262]);
        S522=randsrc(1, 1,[double('H'),double('X');0.996320459593669, 1-0.996320459593669]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9961809068601798, 1-0.9961809068601798]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9983765365337427, 1-0.9983765365337427]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9986998336996593, 1-0.9986998336996593]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9987370477619231, 1-0.9987370477619231]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9988626452220633, 1-0.9988626452220633]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9989487027410483, 1-0.9989487027410483]);
        S480=randsrc(1, 1,[double('N'),double('X');0.993464280314924, 1-0.993464280314924]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9937736222074917, 1-0.9937736222074917]);
        S482=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
    end
    
    if S485 == double('G')
        S486=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9958485861935839, 1-0.9958485861935839]);
        S488=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9988557447659626, 1-0.9988557447659626]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9985487494592696, 1-0.9985487494592696]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9986906185025141, 1-0.9986906185025141]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9982068683222707, 1-0.9982068683222707]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9986650355602897, 1-0.9986650355602897]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9957276486485229, 1-0.9957276486485229]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9977347467521293, 1-0.9977347467521293]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9976324149832315, 1-0.9976324149832315]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9958509119156042, 1-0.9958509119156042]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9974742658858443, 1-0.9974742658858443]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9975254317702931, 1-0.9975254317702931]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9936251959420802, 1-0.9936251959420802]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9960206896230935, 1-0.9960206896230935]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9966858461209283, 1-0.9966858461209283]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9965951429621326, 1-0.9965951429621326]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9964811825831329, 1-0.9964811825831329]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9963346620958476, 1-0.9963346620958476]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9963974565903985, 1-0.9963974565903985]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9964742054170718, 1-0.9964742054170718]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9964207138106025, 1-0.9964207138106025]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9962811704893785, 1-0.9962811704893785]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9964788568611125, 1-0.9964788568611125]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9963532678720108, 1-0.9963532678720108]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9962230274388684, 1-0.9962230274388684]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9983906003618823, 1-0.9983906003618823]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9986952699465549, 1-0.9986952699465549]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9987348072209017, 1-0.9987348072209017]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9988301618237382, 1-0.9988301618237382]);
        S479=randsrc(1, 1,[double('G'),double('X');0.998881327708187, 1-0.998881327708187]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9933972751840809, 1-0.9933972751840809]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9937205505449167, 1-0.9937205505449167]);
        S482=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S484=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
    end
    
    if S486 == double('V')
        S487=randsrc(1, 1,[double('A'),double('X');0.9961011105786455, 1-0.9961011105786455]);
        S488=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9989740989052402, 1-0.9989740989052402]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9986856369194121, 1-0.9986856369194121]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9988182363806396, 1-0.9988182363806396]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9983157542117777, 1-0.9983157542117777]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9987693839475558, 1-0.9987693839475558]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9958079959801427, 1-0.9958079959801427]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9978272298809396, 1-0.9978272298809396]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9977295250147721, 1-0.9977295250147721]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9959289639096834, 1-0.9959289639096834]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9975969255535446, 1-0.9975969255535446]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9976341464549418, 1-0.9976341464549418]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9937492148716112, 1-0.9937492148716112]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9961173947230068, 1-0.9961173947230068]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9967757394164694, 1-0.9967757394164694]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9967036239200123, 1-0.9967036239200123]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9965966138284954, 1-0.9965966138284954]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9964360986912201, 1-0.9964360986912201]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9965012352686651, 1-0.9965012352686651]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9965803296841341, 1-0.9965803296841341]);
        S519=randsrc(1, 1,[double('E'),double('X');0.996522172025701, 1-0.996522172025701]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9963732884201123, 1-0.9963732884201123]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9965826559904715, 1-0.9965826559904715]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9964547091419187, 1-0.9964547091419187]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9963383938250524, 1-0.9963383938250524]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9983995012399213, 1-0.9983995012399213]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9986833106130748, 1-0.9986833106130748]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9987158789017972, 1-0.9987158789017972]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9988019522362783, 1-0.9988019522362783]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9988438257503501, 1-0.9988438257503501]);
        S480=randsrc(1, 1,[double('N'),double('X');0.993374679551302, 1-0.993374679551302]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9936677941498048, 1-0.9936677941498048]);
        S482=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S484=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S485=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
    end
    
    if S487 == double('A')
        S488=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9988071087912114, 1-0.9988071087912114]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9989168267693191, 1-0.9989168267693191]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9984149253801028, 1-0.9984149253801028]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9988818103933272, 1-0.9988818103933272]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9978219814133076, 1-0.9978219814133076]);
        S502=randsrc(1, 1,[double('P'),double('X');0.997906020715688, 1-0.997906020715688]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9978126437130431, 1-0.9978126437130431]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9976655749338774, 1-0.9976655749338774]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9976445651082823, 1-0.9976445651082823]);
        S507=randsrc(1, 1,[double('G'),double('X');0.997695922459737, 1-0.997695922459737]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9955342448485075, 1-0.9955342448485075]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9961762117416912, 1-0.9961762117416912]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9968111753596766, 1-0.9968111753596766]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9967294704823623, 1-0.9967294704823623]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9966384279047835, 1-0.9966384279047835]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9964843558504194, 1-0.9964843558504194]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9965450509021385, 1-0.9965450509021385]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9966174180791884, 1-0.9966174180791884]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9965473853272047, 1-0.9965473853272047]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9964096542483034, 1-0.9964096542483034]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9966127492290561, 1-0.9966127492290561]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9964796870002871, 1-0.9964796870002871]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9963349526461875, 1-0.9963349526461875]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9983915811294415, 1-0.9983915811294415]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9986717121373763, 1-0.9986717121373763]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9987067285133681, 1-0.9987067285133681]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9987674235650873, 1-0.9987674235650873]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9988234497666743, 1-0.9988234497666743]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9960081331369304, 1-0.9960081331369304]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9963092739704602, 1-0.9963092739704602]);
        S482=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S484=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S485=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S486=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
    end
    
    if S488 == double('G')
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9987697674418604, 1-0.9987697674418604]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9988744186046512, 1-0.9988744186046512]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9983720930232558, 1-0.9983720930232558]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9988325581395349, 1-0.9988325581395349]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9958511627906976, 1-0.9958511627906976]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9978581395348837, 1-0.9978581395348837]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9977511627906976, 1-0.9977511627906976]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9959232558139535, 1-0.9959232558139535]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9975627906976744, 1-0.9975627906976744]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9976023255813954, 1-0.9976023255813954]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9937488372093023, 1-0.9937488372093023]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9961511627906977, 1-0.9961511627906977]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9967627906976744, 1-0.9967627906976744]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9966883720930233, 1-0.9966883720930233]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9965883720930232, 1-0.9965883720930232]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9964255813953489, 1-0.9964255813953489]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9964906976744186, 1-0.9964906976744186]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9965651162790697, 1-0.9965651162790697]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9965069767441861, 1-0.9965069767441861]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9963604651162791, 1-0.9963604651162791]);
        S521=randsrc(1, 1,[double('L'),double('X');0.996560465116279, 1-0.996560465116279]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9964418604651163, 1-0.9964418604651163]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9963046511627907, 1-0.9963046511627907]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9981976744186046, 1-0.9981976744186046]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9984837209302325, 1-0.9984837209302325]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9985139534883721, 1-0.9985139534883721]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9985697674418604, 1-0.9985697674418604]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9985953488372094, 1-0.9985953488372094]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9931232558139534, 1-0.9931232558139534]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9934093023255814, 1-0.9934093023255814]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9988837209302326, 1-0.9988837209302326]);
        S484=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S485=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S486=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9960093023255814, 1-0.9960093023255814]);
    end
    
    if S490 == double('N')
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9987865713900499, 1-0.9987865713900499]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9988493349388404, 1-0.9988493349388404]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9983449019726351, 1-0.9983449019726351]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9988074925729801, 1-0.9988074925729801]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9958041405345595, 1-0.9958041405345595]);
        S502=randsrc(1, 1,[double('P'),double('X');0.997756784274709, 1-0.997756784274709]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9976452046324148, 1-0.9976452046324148]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.995832035445133, 1-0.995832035445133]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9974243699237074, 1-0.9974243699237074]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9975010809277848, 1-0.9975010809277848]);
        S508=randsrc(1, 1,[double('H'),double('X');0.993623688358059, 1-0.993623688358059]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.996097037095582, 1-0.996097037095582]);
        S513=randsrc(1, 1,[double('V'),double('X');0.996740944614655, 1-0.996740944614655]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9966084437894306, 1-0.9966084437894306]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9965038378747797, 1-0.9965038378747797]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9963248455319327, 1-0.9963248455319327]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9963806353530799, 1-0.9963806353530799]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9964526972053949, 1-0.9964526972053949]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9963922582324855, 1-0.9963922582324855]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9962551082554988, 1-0.9962551082554988]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9964526972053949, 1-0.9964526972053949]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9963411175631006, 1-0.9963411175631006]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9961621252202536, 1-0.9961621252202536]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9978916096758147, 1-0.9978916096758147]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9981938045403617, 1-0.9981938045403617]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9981775325091937, 1-0.9981775325091937]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9981496375986201, 1-0.9981496375986201]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9981380147192145, 1-0.9981380147192145]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9926264453050541, 1-0.9926264453050541]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9928937715313841, 1-0.9928937715313841]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9983890689143766, 1-0.9983890689143766]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9986726671718745, 1-0.9986726671718745]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9988167908765045, 1-0.9988167908765045]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9987075358100914, 1-0.9987075358100914]);
        S487=randsrc(1, 1,[double('A'),double('X');0.995367120268907, 1-0.995367120268907]);
        S488=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
    end
    
    if S491 == double('C')
        S492=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S493=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
        S495=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9985098290836727, 1-0.9985098290836727]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9989585076903048, 1-0.9989585076903048]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9958689021555172, 1-0.9958689021555172]);
        S502=randsrc(1, 1,[double('P'),double('X');0.997830999274675, 1-0.997830999274675]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9977194108129219, 1-0.9977194108129219]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9958828507132362, 1-0.9958828507132362]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9974822853316967, 1-0.9974822853316967]);
        S507=randsrc(1, 1,[double('G'),double('X');0.997559002399152, 1-0.997559002399152]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9937115252282914, 1-0.9937115252282914]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9962129665792557, 1-0.9962129665792557]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9968615745131953, 1-0.9968615745131953]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9967034908590452, 1-0.9967034908590452]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9965802785991928, 1-0.9965802785991928]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9963942978296044, 1-0.9963942978296044]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9964431177816214, 1-0.9964431177816214]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9965151853298369, 1-0.9965151853298369]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9964593910989603, 1-0.9964593910989603]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9963222302813889, 1-0.9963222302813889]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9965175100894568, 1-0.9965175100894568]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9963942978296044, 1-0.9963942978296044]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9962059923003962, 1-0.9962059923003962]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9979332886979486, 1-0.9979332886979486]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9982215588908107, 1-0.9982215588908107]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9981890122561328, 1-0.9981890122561328]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9981006713905782, 1-0.9981006713905782]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9980634752366605, 1-0.9980634752366605]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9925561196972233, 1-0.9925561196972233]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9928281165727464, 1-0.9928281165727464]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9982959511986461, 1-0.9982959511986461]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9985749223530287, 1-0.9985749223530287]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9987120831706001, 1-0.9987120831706001]);
        S486=randsrc(1, 1,[double('V'),double('X');0.998602819468467, 1-0.998602819468467]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9952691141735944, 1-0.9952691141735944]);
        S488=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
    end
    
    if S492 == double('Y')
        S493=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
        S495=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9989953558463546, 1-0.9989953558463546]);
        S498=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S501=randsrc(1, 1,[double('R'),double('X');0.996293049118262, 1-0.996293049118262]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9982325704704386, 1-0.9982325704704386]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9981209433422558, 1-0.9981209433422558]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9962953746834324, 1-0.9962953746834324]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9978674567386739, 1-0.9978674567386739]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9979302469982767, 1-0.9979302469982767]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9939419027309112, 1-0.9939419027309112]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9963628160733762, 1-0.9963628160733762]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9969604863221885, 1-0.9969604863221885]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9967930456299142, 1-0.9967930456299142]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9966395583286628, 1-0.9966395583286628]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9964511875498543, 1-0.9964511875498543]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9964976988532638, 1-0.9964976988532638]);
        S518=randsrc(1, 1,[double('F'),double('X');0.996572116938719, 1-0.996572116938719]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9965139778094572, 1-0.9965139778094572]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9963790950295696, 1-0.9963790950295696]);
        S521=randsrc(1, 1,[double('L'),double('X');0.996572116938719, 1-0.996572116938719]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9964535131150247, 1-0.9964535131150247]);
        S523=randsrc(1, 1,[double('A'),double('X');0.996244212249682, 1-0.996244212249682]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9978162943049235, 1-0.9978162943049235]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9981232689074262, 1-0.9981232689074262]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9981325711681082, 1-0.9981325711681082]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9981883847321995, 1-0.9981883847321995]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9982255937749271, 1-0.9982255937749271]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9927326088422639, 1-0.9927326088422639]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9929860954458457, 1-0.9929860954458457]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9984581502919747, 1-0.9984581502919747]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9986883812438518, 1-0.9986883812438518]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9987883805461822, 1-0.9987883805461822]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9986558233314651, 1-0.9986558233314651]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9953139861814918, 1-0.9953139861814918]);
        S488=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
    end
    
    if S493 == double('F')
        S495=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S497=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S498=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9963689567903532, 1-0.9963689567903532]);
        S502=randsrc(1, 1,[double('P'),double('X');0.998299620380364, 1-0.998299620380364]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9981949458483754, 1-0.9981949458483754]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9963829133946184, 1-0.9963829133946184]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9979460530723138, 1-0.9979460530723138]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9980042055900852, 1-0.9980042055900852]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9940033123674122, 1-0.9940033123674122]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9964247832074138, 1-0.9964247832074138]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9969946778815736, 1-0.9969946778815736]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9968271986303919, 1-0.9968271986303919]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9966736759834753, 1-0.9966736759834753]);
        S516=randsrc(1, 1,[double('L'),double('X');0.99646897912092, 1-0.99646897912092]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9965108489337154, 1-0.9965108489337154]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9965783058543303, 1-0.9965783058543303]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9965155011351371, 1-0.9965155011351371]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9963805872939074, 1-0.9963805872939074]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9965783058543303, 1-0.9965783058543303]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9964643269194983, 1-0.9964643269194983]);
        S523=randsrc(1, 1,[double('A'),double('X');0.996243347351967, 1-0.996243347351967]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9977529867133127, 1-0.9977529867133127]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9980646842085675, 1-0.9980646842085675]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9980716625107, 1-0.9980716625107]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9981274889277606, 1-0.9981274889277606]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9981879675462428, 1-0.9981879675462428]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9926913915664892, 1-0.9926913915664892]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9929426104432617, 1-0.9929426104432617]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9984182515166177, 1-0.9984182515166177]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9986182961777513, 1-0.9986182961777513]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9987113402061856, 1-0.9987113402061856]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9985973612713536, 1-0.9985973612713536]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9952454501470096, 1-0.9952454501470096]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9989927983921992, 1-0.9989927983921992]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
    end
    
    if S495 == double('L')
        S497=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S498=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9964557480139166, 1-0.9964557480139166]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9983767139853764, 1-0.9983767139853764]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9982581071275745, 1-0.9982581071275745]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.996451096764591, 1-0.996451096764591]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9979813577927031, 1-0.9979813577927031]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9980464752832611, 1-0.9980464752832611]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9940394239892836, 1-0.9940394239892836]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9964580736385793, 1-0.9964580736385793]);
        S513=randsrc(1, 1,[double('V'),double('X');0.997011572308322, 1-0.997011572308322]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9968441273326015, 1-0.9968441273326015]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9966929617295206, 1-0.9966929617295206]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9964976092578467, 1-0.9964976092578467]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9965417961264396, 1-0.9965417961264396]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9966069136169975, 1-0.9966069136169975]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9965185398798118, 1-0.9965185398798118]);
        S520=randsrc(1, 1,[double('L'),double('X');0.996385979274033, 1-0.996385979274033]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9965883086196953, 1-0.9965883086196953]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9964697017618932, 1-0.9964697017618932]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9962510930435915, 1-0.9962510930435915]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9976906547098551, 1-0.9976906547098551]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.997992985916017, 1-0.997992985916017]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9980022884146682, 1-0.9980022884146682]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9980557777819122, 1-0.9980557777819122]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9981255465217957, 1-0.9981255465217957]);
        S480=randsrc(1, 1,[double('N'),double('X');0.992632421068299, 1-0.992632421068299]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9928952166551935, 1-0.9928952166551935]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9983674114867254, 1-0.9983674114867254]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9985604383337364, 1-0.9985604383337364]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9986488120709223, 1-0.9986488120709223]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9985255539637947, 1-0.9985255539637947]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9951510725780944, 1-0.9951510725780944]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9988930026605146, 1-0.9988930026605146]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S493=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
    end
    
    if S497 == double('S')
        S498=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9964849020611362, 1-0.9964849020611362]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9983924998836831, 1-0.9983924998836831]);
        S503=randsrc(1, 1,[double('T'),double('X');0.998255245894012, 1-0.998255245894012]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9964500069790164, 1-0.9964500069790164]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9979737588982459, 1-0.9979737588982459]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9980388963848695, 1-0.9980388963848695]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9940213092634811, 1-0.9940213092634811]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9964569859954404, 1-0.9964569859954404]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9970013492765086, 1-0.9970013492765086]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9968361792211418, 1-0.9968361792211418]);
        S515=randsrc(1, 1,[double('V'),double('X');0.996668682826967, 1-0.996668682826967]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9964546596566324, 1-0.9964546596566324]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9964918810775601, 1-0.9964918810775601]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9965523658865677, 1-0.9965523658865677]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9964732703670962, 1-0.9964732703670962]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9963336900386173, 1-0.9963336900386173]);
        S521=randsrc(1, 1,[double('L'),double('X');0.996524449820872, 1-0.996524449820872]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9963988275252408, 1-0.9963988275252408]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9961778253384823, 1-0.9961778253384823]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9975224491694971, 1-0.9975224491694971]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9978411575861909, 1-0.9978411575861909]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9978504629414228, 1-0.9978504629414228]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9979109477504303, 1-0.9979109477504303]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9979737588982459, 1-0.9979737588982459]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9924603359233238, 1-0.9924603359233238]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9927208858698181, 1-0.9927208858698181]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9982087191178524, 1-0.9982087191178524]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9983855208672591, 1-0.9983855208672591]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9984715954031546, 1-0.9984715954031546]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9983296887358675, 1-0.9983296887358675]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9949564974642907, 1-0.9949564974642907]);
        S488=randsrc(1, 1,[double('G'),double('X');0.998697250267529, 1-0.998697250267529]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S493=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
        S495=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
    end
    
    if S498 == double('Y')
        S501=randsrc(1, 1,[double('R'),double('X');0.9965634620213726, 1-0.9965634620213726]);
        S502=randsrc(1, 1,[double('P'),double('X');0.998458440676705, 1-0.998458440676705]);
        S503=randsrc(1, 1,[double('T'),double('X');0.998321258172822, 1-0.998321258172822]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9964983584602077, 1-0.9964983584602077]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9980189916388427, 1-0.9980189916388427]);
        S507=randsrc(1, 1,[double('G'),double('X');0.998081770072823, 1-0.998081770072823]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9940616251708968, 1-0.9940616251708968]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9965053338417611, 1-0.9965053338417611]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9970401130941863, 1-0.9970401130941863]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9968634034281675, 1-0.9968634034281675]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9967076199068089, 1-0.9967076199068089]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9964867328242855, 1-0.9964867328242855]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9965262599864213, 1-0.9965262599864213]);
        S518=randsrc(1, 1,[double('F'),double('X');0.996596013801955, 1-0.996596013801955]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9965123092233145, 1-0.9965123092233145]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9963681513378781, 1-0.9963681513378781]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9965588117670037, 1-0.9965588117670037]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9964239543903052, 1-0.9964239543903052]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9962030673077817, 1-0.9962030673077817]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9974981631495243, 1-0.9974981631495243]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9978004296835037, 1-0.9978004296835037]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.997807405065057, 1-0.997807405065057]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9978632081174841, 1-0.9978632081174841]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9979329619330177, 1-0.9979329619330177]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9924224105058547, 1-0.9924224105058547]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9926781744961449, 1-0.9926781744961449]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9981654746514634, 1-0.9981654746514634]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9983375340631132, 1-0.9983375340631132]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9984096130058314, 1-0.9984096130058314]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9982631299932107, 1-0.9982631299932107]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9949033212116702, 1-0.9949033212116702]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9986374754699082, 1-0.9986374754699082]);
        S490=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S491=randsrc(1, 1,[double('C'),double('X');1, 1-1]);
        S492=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S493=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
        S495=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S497=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
    end
    
    if S501 == double('R')
        S502=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S503=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
        S504=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9988714397304513, 1-0.9988714397304513]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9989413918132746, 1-0.9989413918132746]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9966446317605774, 1-0.9966446317605774]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9972672052977044, 1-0.9972672052977044]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9971342963403402, 1-0.9971342963403402]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9969547526610938, 1-0.9969547526610938]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9967868676623179, 1-0.9967868676623179]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9965466988446248, 1-0.9965466988446248]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9965793431499423, 1-0.9965793431499423]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9966469634966715, 1-0.9966469634966715]);
        S519=randsrc(1, 1,[double('E'),double('X');0.996574679677754, 1-0.996574679677754]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9964324437760135, 1-0.9964324437760135]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9966236461357304, 1-0.9966236461357304]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9964744150257074, 1-0.9964744150257074]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9961829480139438, 1-0.9961829480139438]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9974164364077274, 1-0.9974164364077274]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9976962447390204, 1-0.9976962447390204]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9976985764751145, 1-0.9976985764751145]);
        S478=randsrc(1, 1,[double('A'),double('X');0.997773192030126, 1-0.997773192030126]);
        S479=randsrc(1, 1,[double('G'),double('X');0.997857134529514, 1-0.997857134529514]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9943152274025626, 1-0.9943152274025626]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9945857087894792, 1-0.9945857087894792]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9980763177223602, 1-0.9980763177223602]);
        S484=randsrc(1, 1,[double('N'),double('X');0.998244202721136, 1-0.998244202721136]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9983024961234888, 1-0.9983024961234888]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9981322793886188, 1-0.9981322793886188]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9966726125937067, 1-0.9966726125937067]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9984867032749234, 1-0.9984867032749234]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9988714397304513, 1-0.9988714397304513]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9988574493138866, 1-0.9988574493138866]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9989367283410864, 1-0.9989367283410864]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9987828337588752, 1-0.9987828337588752]);
        S495=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9987968241754398, 1-0.9987968241754398]);
        S498=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
    end
    
    if S502 == double('P')
        S503=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9977446968956416, 1-0.9977446968956416]);
        S506=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S507=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9952077718350114, 1-0.9952077718350114]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9975701378318368, 1-0.9975701378318368]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9973839414971116, 1-0.9973839414971116]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9972117098874909, 1-0.9972117098874909]);
        S515=randsrc(1, 1,[double('V'),double('X');0.997072062636447, 1-0.997072062636447]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9968462995805928, 1-0.9968462995805928]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9968858663017218, 1-0.9968858663017218]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9969370702937713, 1-0.9969370702937713]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9968602643056972, 1-0.9968602643056972]);
        S520=randsrc(1, 1,[double('L'),double('X');0.996708979783733, 1-0.996708979783733]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9968951761184581, 1-0.9968951761184581]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9967415641423099, 1-0.9967415641423099]);
        S523=randsrc(1, 1,[double('A'),double('X');0.996492526544615, 1-0.996492526544615]);
        S475=randsrc(1, 1,[double('I'),double('X');0.997649271274095, 1-0.997649271274095]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9979239108678145, 1-0.9979239108678145]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9979239108678145, 1-0.9979239108678145]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9979937344933365, 1-0.9979937344933365]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9980472659395699, 1-0.9980472659395699]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9925079249814968, 1-0.9925079249814968]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9927755822126642, 1-0.9927755822126642]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9982357897284792, 1-0.9982357897284792]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9983894017046274, 1-0.9983894017046274]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9984778449636219, 1-0.9984778449636219]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9983195780791055, 1-0.9983195780791055]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9949261498787396, 1-0.9949261498787396]);
        S488=randsrc(1, 1,[double('G'),double('X');0.998661713844163, 1-0.998661713844163]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9989922123383002, 1-0.9989922123383002]);
        S491=randsrc(1, 1,[double('C'),double('X');0.998987557429932, 1-0.998987557429932]);
        S492=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9988804945374651, 1-0.9988804945374651]);
        S495=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9988711847207288, 1-0.9988711847207288]);
        S498=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9976097045529658, 1-0.9976097045529658]);
    end
    
    if S503 == double('T')
        S504=randsrc(1, 1,[double('Y'),double('X');0.9979424538797779, 1-0.9979424538797779]);
        S506=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S507=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9952983674628408, 1-0.9952983674628408]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9976631489765803, 1-0.9976631489765803]);
        S513=randsrc(1, 1,[double('V'),double('X');0.997465308003482, 1-0.997465308003482]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9972860873572635, 1-0.9972860873572635]);
        S515=randsrc(1, 1,[double('V'),double('X');0.997123159497065, 1-0.997123159497065]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9968834227884871, 1-0.9968834227884871]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9969183359013868, 1-0.9969183359013868]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9969811795046062, 1-0.9969811795046062]);
        S519=randsrc(1, 1,[double('E'),double('X');0.996895060492787, 1-0.996895060492787]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9967437703368882, 1-0.9967437703368882]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9969439388508465, 1-0.9969439388508465]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9967833385315079, 1-0.9967833385315079]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9965040336283103, 1-0.9965040336283103]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9976422011088405, 1-0.9976422011088405]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9979098683077381, 1-0.9979098683077381]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9979145233894581, 1-0.9979145233894581]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9979657292883777, 1-0.9979657292883777]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9980099525647173, 1-0.9980099525647173]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9924680777771053, 1-0.9924680777771053]);
        S481=randsrc(1, 1,[double('K'),double('X');0.992740400057723, 1-0.992740400057723]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9981915007517957, 1-0.9981915007517957]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9983311532033945, 1-0.9983311532033945]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9984126171334938, 1-0.9984126171334938]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9982589994367351, 1-0.9982589994367351]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9948700999446045, 1-0.9948700999446045]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9985918377797123, 1-0.9985918377797123]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9989176935001094, 1-0.9989176935001094]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9989130384183894, 1-0.9989130384183894]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.998968899399029, 1-0.998968899399029]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9988129541614102, 1-0.9988129541614102]);
        S495=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9987710584259306, 1-0.9987710584259306]);
        S498=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9974839283303618, 1-0.9974839283303618]);
        S502=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
    end
    
    if S504 == double('Y')
        S506=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S507=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9970108606949166, 1-0.9970108606949166]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9976637148333124, 1-0.9976637148333124]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9974678585917937, 1-0.9974678585917937]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9972813288379663, 1-0.9972813288379663]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9971041255718303, 1-0.9971041255718303]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9968569736480091, 1-0.9968569736480091]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9968663001357004, 1-0.9968663001357004]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9969245906837715, 1-0.9969245906837715]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9968359890507035, 1-0.9968359890507035]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9966960917353329, 1-0.9966960917353329]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9968872847330059, 1-0.9968872847330059]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9967333976860984, 1-0.9967333976860984]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9964396133238204, 1-0.9964396133238204]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9975867713098585, 1-0.9975867713098585]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9978665659405996, 1-0.9978665659405996]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9978712291844453, 1-0.9978712291844453]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9979271881105934, 1-0.9979271881105934]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9979738205490504, 1-0.9979738205490504]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9941546238394352, 1-0.9941546238394352]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9944134338728706, 1-0.9944134338728706]);
        S482=randsrc(1, 1,[double('P'),double('X');0.998155687059032, 1-0.998155687059032]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9982955843744025, 1-0.9982955843744025]);
        S485=randsrc(1, 1,[double('G'),double('X');0.998377191141702, 1-0.998377191141702]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9982046511194117, 1-0.9982046511194117]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9964675927868945, 1-0.9964675927868945]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9985100935913039, 1-0.9985100935913039]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9988505103920389, 1-0.9988505103920389]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9988225309289648, 1-0.9988225309289648]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9988901479647272, 1-0.9988901479647272]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9987479190274339, 1-0.9987479190274339]);
        S495=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9987129446985913, 1-0.9987129446985913]);
        S498=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S501=randsrc(1, 1,[double('R'),double('X');1, 1-1]);
        S502=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S503=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
    end
    
    if S506 == double('V')
        S507=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9956459108563662, 1-0.9956459108563662]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9979172048190528, 1-0.9979172048190528]);
        S513=randsrc(1, 1,[double('V'),double('X');0.997665873110067, 1-0.997665873110067]);
        S514=randsrc(1, 1,[double('V'),double('X');0.997507627219224, 1-0.997507627219224]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9973726527829169, 1-0.9973726527829169]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9971469196739203, 1-0.9971469196739203]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9971655368375489, 1-0.9971655368375489]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9972027711648062, 1-0.9972027711648062]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9971306296557454, 1-0.9971306296557454]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9969560937467274, 1-0.9969560937467274]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9971515739648276, 1-0.9971515739648276]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9970003095103454, 1-0.9970003095103454]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9967280334922773, 1-0.9967280334922773]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9974587571646991, 1-0.9974587571646991]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9977124160191384, 1-0.9977124160191384]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9977240517464063, 1-0.9977240517464063]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9977729218009314, 1-0.9977729218009314]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9978031746918278, 1-0.9978031746918278]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9922273341850686, 1-0.9922273341850686]);
        S481=randsrc(1, 1,[double('K'),double('X');0.992480993039508, 1-0.992480993039508]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9979032419463314, 1-0.9979032419463314]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9979893463281135, 1-0.9979893463281135]);
        S485=randsrc(1, 1,[double('G'),double('X');0.99808475929171, 1-0.99808475929171]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9979567662917636, 1-0.9979567662917636]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9945335353295587, 1-0.9945335353295587]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9982336966007387, 1-0.9982336966007387]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9985269169278888, 1-0.9985269169278888]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9985059726188066, 1-0.9985059726188066]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9985455340915174, 1-0.9985455340915174]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9983942696370351, 1-0.9983942696370351]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9986339656187531, 1-0.9986339656187531]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9983198009825208, 1-0.9983198009825208]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9988852973277389, 1-0.9988852973277389]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9969048965467489, 1-0.9969048965467489]);
        S502=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S503=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9974587571646991, 1-0.9974587571646991]);
    end
    
    if S507 == double('G')
        S508=randsrc(1, 1,[double('H'),double('X');0.9957049590737974, 1-0.9957049590737974]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9979734666052424, 1-0.9979734666052424]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9976663455856006, 1-0.9976663455856006]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9975011517038237, 1-0.9975011517038237]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9973475911940027, 1-0.9973475911940027]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9971009637085329, 1-0.9971009637085329]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9971079437317065, 1-0.9971079437317065]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9971568038939223, 1-0.9971568038939223]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9970590835694908, 1-0.9970590835694908]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9969101764084524, 1-0.9969101764084524]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9970916570109679, 1-0.9970916570109679]);
        S522=randsrc(1, 1,[double('H'),double('X');0.996926463129191, 1-0.996926463129191]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9966309754815053, 1-0.9966309754815053]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9973313044732642, 1-0.9973313044732642]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9975825853075165, 1-0.9975825853075165]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9976011987026464, 1-0.9976011987026464]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9976360988185148, 1-0.9976360988185148]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9976547122136445, 1-0.9976547122136445]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9920613869771381, 1-0.9920613869771381]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9923243011833466, 1-0.9923243011833466]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9977477791892936, 1-0.9977477791892936]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9978524795368987, 1-0.9978524795368987]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9979339131405917, 1-0.9979339131405917]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9977919860027269, 1-0.9977919860027269]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9943834080195812, 1-0.9943834080195812]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9980711869296739, 1-0.9980711869296739]);
        S490=randsrc(1, 1,[double('N'),double('X');0.998401574693228, 1-0.998401574693228]);
        S491=randsrc(1, 1,[double('C'),double('X');0.998380634623707, 1-0.998380634623707]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9984062280420104, 1-0.9984062280420104]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9982503408577983, 1-0.9982503408577983]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9984969683432683, 1-0.9984969683432683]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9981828673004528, 1-0.9981828673004528]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9987459225031293, 1-0.9987459225031293]);
        S501=randsrc(1, 1,[double('R'),double('X');0.99677290261937, 1-0.99677290261937]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9989506698495573, 1-0.9989506698495573]);
        S503=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9972870976598309, 1-0.9972870976598309]);
        S506=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
    end
    
    if S508 == double('H')
        S509=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
        S513=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S514=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S515=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9989163537170936, 1-0.9989163537170936]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9989327018291202, 1-0.9989327018291202]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9989700689423239, 1-0.9989700689423239]);
        S519=randsrc(1, 1,[double('E'),double('X');0.998869644825589, 1-0.998869644825589]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9987131700390486, 1-0.9987131700390486]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9988813220484651, 1-0.9988813220484651]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9987131700390486, 1-0.9987131700390486]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9984235749117202, 1-0.9984235749117202]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9972722007361321, 1-0.9972722007361321]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9975034097490798, 1-0.9975034097490798]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.997515086971956, 1-0.997515086971956]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9974777198587523, 1-0.9974777198587523]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9974169982997964, 1-0.9974169982997964]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9937643629841376, 1-0.9937643629841376]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9940165909982625, 1-0.9940165909982625]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9975337705285579, 1-0.9975337705285579]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9976692263139211, 1-0.9976692263139211]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9977789922089569, 1-0.9977789922089569]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9976528782018945, 1-0.9976528782018945]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9959690226631541, 1-0.9959690226631541]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9979634923304, 1-0.9979634923304]);
        S490=randsrc(1, 1,[double('N'),double('X');0.998269435569755, 1-0.998269435569755]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9982787773480559, 1-0.9982787773480559]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9981643405638697, 1-0.9981643405638697]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9979961885544533, 1-0.9979961885544533]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9982367393457019, 1-0.9982367393457019]);
        S497=randsrc(1, 1,[double('S'),double('X');0.997912112549745, 1-0.997912112549745]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9984726192478001, 1-0.9984726192478001]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9982297330119762, 1-0.9982297330119762]);
        S502=randsrc(1, 1,[double('P'),double('X');0.99862442314519, 1-0.99862442314519]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9986781383704202, 1-0.9986781383704202]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.998645442146367, 1-0.998645442146367]);
        S506=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S507=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
    end
    
    if S509 == double('Q')
        S513=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S514=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S515=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9988727802037846, 1-0.9988727802037846]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9988704512372635, 1-0.9988704512372635]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9989216885007278, 1-0.9989216885007278]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9988052401746725, 1-0.9988052401746725]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9986422125181951, 1-0.9986422125181951]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9988145560407569, 1-0.9988145560407569]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9986422125181951, 1-0.9986422125181951]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9983394468704513, 1-0.9983394468704513]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9970655021834061, 1-0.9970655021834061]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.99732634643377, 1-0.99732634643377]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9973007278020378, 1-0.9973007278020378]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9971703056768559, 1-0.9971703056768559]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9970608442503639, 1-0.9970608442503639]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9914596797671034, 1-0.9914596797671034]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9917205240174672, 1-0.9917205240174672]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9971563318777292, 1-0.9971563318777292]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9973100436681223, 1-0.9973100436681223]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9974101892285299, 1-0.9974101892285299]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9972564774381368, 1-0.9972564774381368]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9938468704512373, 1-0.9938468704512373]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9976011644832605, 1-0.9976011644832605]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9979784570596798, 1-0.9979784570596798]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9980157205240174, 1-0.9980157205240174]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9978200873362445, 1-0.9978200873362445]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9976524017467249, 1-0.9976524017467249]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9978899563318777, 1-0.9978899563318777]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9975825327510917, 1-0.9975825327510917]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9981508005822416, 1-0.9981508005822416]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9960826783114993, 1-0.9960826783114993]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9982183406113537, 1-0.9982183406113537]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9982742358078602, 1-0.9982742358078602]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9965275109170305, 1-0.9965275109170305]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9986981077147016, 1-0.9986981077147016]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9989566229985444, 1-0.9989566229985444]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9970468704512373, 1-0.9970468704512373]);
    end
    
    if S513 == double('V')
        S514=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S515=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S516=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S517=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S518=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
        S519=randsrc(1, 1,[double('E'),double('X');0.9989508114345269, 1-0.9989508114345269]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9987902925630909, 1-0.9987902925630909]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9989554641554381, 1-0.9989554641554381]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9987600498771682, 1-0.9987600498771682]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9984157485297402, 1-0.9984157485297402]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9967617062458125, 1-0.9967617062458125]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9970199322563835, 1-0.9970199322563835]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9969385096404377, 1-0.9969385096404377]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9967314635598898, 1-0.9967314635598898]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9966081664557433, 1-0.9966081664557433]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9910155959204943, 1-0.9910155959204943]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9912691692101541, 1-0.9912691692101541]);
        S482=randsrc(1, 1,[double('P'),double('X');0.996724484478523, 1-0.996724484478523]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9968687188267699, 1-0.9968687188267699]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9969594468845381, 1-0.9969594468845381]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9967989280131021, 1-0.9967989280131021]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9933675463411002, 1-0.9933675463411002]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9970967021514181, 1-0.9970967021514181]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9975061415916028, 1-0.9975061415916028]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9975480160798035, 1-0.9975480160798035]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9973014218715105, 1-0.9973014218715105]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9971060075932405, 1-0.9971060075932405]);
        S495=randsrc(1, 1,[double('L'),double('X');0.997327011836522, 1-0.997327011836522]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9970106268145612, 1-0.9970106268145612]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9975689533239038, 1-0.9975689533239038]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9948354797885803, 1-0.9948354797885803]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9969152460358818, 1-0.9969152460358818]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9969594468845381, 1-0.9969594468845381]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9952170029032978, 1-0.9952170029032978]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9973293381969776, 1-0.9973293381969776]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9975317315566143, 1-0.9975317315566143]);
        S508=randsrc(1, 1,[double('H'),double('X');0.995554325169359, 1-0.995554325169359]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9983622422392615, 1-0.9983622422392615]);
    end
    
    if S514 == double('V')
        S515=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S516=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S517=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S518=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
        S519=randsrc(1, 1,[double('E'),double('X');1, 1-1]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9989763299567732, 1-0.9989763299567732]);
        S521=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S522=randsrc(1, 1,[double('H'),double('X');0.998943758637216, 1-0.998943758637216]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9985947802133887, 1-0.9985947802133887]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9967870719779631, 1-0.9967870719779631]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9970429894887699, 1-0.9970429894887699]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9969615611898769, 1-0.9969615611898769]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9967358884758019, 1-0.9967358884758019]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9966195623345261, 1-0.9966195623345261]);
        S480=randsrc(1, 1,[double('N'),double('X');0.991035907553289, 1-0.991035907553289]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9912871720184446, 1-0.9912871720184446]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9967265823844997, 1-0.9967265823844997]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9968568676627286, 1-0.9968568676627286]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9969382959616216, 1-0.9969382959616216]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9967963780692652, 1-0.9967963780692652]);
        S487=randsrc(1, 1,[double('A'),double('X');0.993355450810328, 1-0.993355450810328]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9970918464681057, 1-0.9970918464681057]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9974431514147585, 1-0.9974431514147585]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9974594370745371, 1-0.9974594370745371]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9972035195637304, 1-0.9972035195637304]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9970080916463872, 1-0.9970080916463872]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9972291113148111, 1-0.9972291113148111]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9969150307333665, 1-0.9969150307333665]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9974617635973626, 1-0.9974617635973626]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9947257727545565, 1-0.9947257727545565]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9968126637290439, 1-0.9968126637290439]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9968498880942521, 1-0.9968498880942521]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9951003429294645, 1-0.9951003429294645]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9972407439289387, 1-0.9972407439289387]);
        S507=randsrc(1, 1,[double('G'),double('X');0.997436171846282, 1-0.997436171846282]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9954632804902449, 1-0.9954632804902449]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9982551078808635, 1-0.9982551078808635]);
        S513=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
    end
    
    if S515 == double('V')
        S516=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S517=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S518=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
        S519=randsrc(1, 1,[double('E'),double('X');1, 1-1]);
        S520=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S521=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S522=randsrc(1, 1,[double('H'),double('X');1, 1-1]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9988389651666283, 1-0.9988389651666283]);
        S475=randsrc(1, 1,[double('I'),double('X');0.996812389335232, 1-0.996812389335232]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9970520418158678, 1-0.9970520418158678]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.996958972891349, 1-0.996958972891349]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9967472410880688, 1-0.9967472410880688]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9966332316555333, 1-0.9966332316555333]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9910514229075197, 1-0.9910514229075197]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9913073624499463, 1-0.9913073624499463]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9967169936876001, 1-0.9967169936876001]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9968286763970228, 1-0.9968286763970228]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9969101117059767, 1-0.9969101117059767]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9967751617654245, 1-0.9967751617654245]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9933502253431334, 1-0.9933502253431334]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9970776357701104, 1-0.9970776357701104]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9974243175139429, 1-0.9974243175139429]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9974219907908299, 1-0.9974219907908299]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9971358038479347, 1-0.9971358038479347]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9969403591064453, 1-0.9969403591064453]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9971637245252903, 1-0.9971637245252903]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9968333298432487, 1-0.9968333298432487]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9973917433903613, 1-0.9973917433903613]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9946438833939445, 1-0.9946438833939445]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9967588747036337, 1-0.9967588747036337]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9967728350423115, 1-0.9967728350423115]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9950091789226807, 1-0.9950091789226807]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9971916452026459, 1-0.9971916452026459]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9973684761592316, 1-0.9973684761592316]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9954163554674503, 1-0.9954163554674503]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.998168868910093, 1-0.998168868910093]);
        S513=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S514=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
    end
    
    if S516 == double('L')
        S517=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S518=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
        S519=randsrc(1, 1,[double('E'),double('X');1, 1-1]);
        S520=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S521=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S522=randsrc(1, 1,[double('H'),double('X');1, 1-1]);
        S523=randsrc(1, 1,[double('A'),double('X');0.9989901340282948, 1-0.9989901340282948]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9967493484735667, 1-0.9967493484735667]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.996977382725242, 1-0.996977382725242]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9968866344005957, 1-0.9968866344005957]);
        S478=randsrc(1, 1,[double('A'),double('X');0.996670234549516, 1-0.996670234549516]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9965631980640357, 1-0.9965631980640357]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9909763588979896, 1-0.9909763588979896]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9912346425912137, 1-0.9912346425912137]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9966283507073715, 1-0.9966283507073715]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9967307334326135, 1-0.9967307334326135]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9968307892777364, 1-0.9968307892777364]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9966818689501117, 1-0.9966818689501117]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9932636820551005, 1-0.9932636820551005]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9969820364854802, 1-0.9969820364854802]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9973124534623976, 1-0.9973124534623976]);
        S491=randsrc(1, 1,[double('C'),double('X');0.997303145941921, 1-0.997303145941921]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9970146128071482, 1-0.9970146128071482]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9968028667163068, 1-0.9968028667163068]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9970355547282204, 1-0.9970355547282204]);
        S497=randsrc(1, 1,[double('S'),double('X');0.99668652271035, 1-0.99668652271035]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9972379932985853, 1-0.9972379932985853]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9944713328369322, 1-0.9944713328369322]);
        S502=randsrc(1, 1,[double('P'),double('X');0.996600428145942, 1-0.996600428145942]);
        S503=randsrc(1, 1,[double('T'),double('X');0.996600428145942, 1-0.996600428145942]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9948296723752792, 1-0.9948296723752792]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9970332278481012, 1-0.9970332278481012]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9971891288160833, 1-0.9971891288160833]);
        S508=randsrc(1, 1,[double('H'),double('X');0.995253164556962, 1-0.995253164556962]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9979779411764705, 1-0.9979779411764705]);
        S513=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S514=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S515=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
    end
    
    if S517 == double('S')
        S518=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
        S519=randsrc(1, 1,[double('E'),double('X');1, 1-1]);
        S520=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S521=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S522=randsrc(1, 1,[double('H'),double('X');1, 1-1]);
        S523=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9966777099463967, 1-0.9966777099463967]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.99689873064324, 1-0.99689873064324]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9968056692972007, 1-0.9968056692972007]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9965962812686122, 1-0.9965962812686122]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9964846076533651, 1-0.9964846076533651]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9908986003573556, 1-0.9908986003573556]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9911708047945206, 1-0.9911708047945206]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9965590567301965, 1-0.9965590567301965]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9966521180762359, 1-0.9966521180762359]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9967451794222751, 1-0.9967451794222751]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9965986078022633, 1-0.9965986078022633]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9931762768016676, 1-0.9931762768016676]);
        S488=randsrc(1, 1,[double('G'),double('X');0.99689873064324, 1-0.99689873064324]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9972197922870757, 1-0.9972197922870757]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9972035065515188, 1-0.9972035065515188]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9969126898451459, 1-0.9969126898451459]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9966963222156046, 1-0.9966963222156046]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9969313021143538, 1-0.9969313021143538]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9965753424657534, 1-0.9965753424657534]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9971290574746873, 1-0.9971290574746873]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9943558293627159, 1-0.9943558293627159]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9964915872543181, 1-0.9964915872543181]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9964869341870161, 1-0.9964869341870161]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9946908502084574, 1-0.9946908502084574]);
        S506=randsrc(1, 1,[double('V'),double('X');0.996903383710542, 1-0.996903383710542]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9970476287969029, 1-0.9970476287969029]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9951212589338893, 1-0.9951212589338893]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9978270175699822, 1-0.9978270175699822]);
        S513=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S514=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S515=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S516=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
    end
    
    if S518 == double('F')
        S519=randsrc(1, 1,[double('E'),double('X');1, 1-1]);
        S520=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S521=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S522=randsrc(1, 1,[double('H'),double('X');1, 1-1]);
        S523=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9964484490165204, 1-0.9964484490165204]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9966787067423649, 1-0.9966787067423649]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9965833474821667, 1-0.9965833474821667]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9963763481124681, 1-0.9963763481124681]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9962809888522699, 1-0.9962809888522699]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9906780508567216, 1-0.9906780508567216]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9909455219523995, 1-0.9909455219523995]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9963344830714055, 1-0.9963344830714055]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9964344940028329, 1-0.9964344940028329]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9965228757561873, 1-0.9965228757561873]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9963786739480827, 1-0.9963786739480827]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9929503922521764, 1-0.9929503922521764]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9966740550711357, 1-0.9966740550711357]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9969926945503346, 1-0.9969926945503346]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9969764137010324, 1-0.9969764137010324]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9966880100848232, 1-0.9966880100848232]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9964647298658226, 1-0.9964647298658226]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9966973134272816, 1-0.9966973134272816]);
        S497=randsrc(1, 1,[double('S'),double('X');0.99633680890702, 1-0.99633680890702]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9968996611257509, 1-0.9968996611257509]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9941249392375445, 1-0.9941249392375445]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9962437754824365, 1-0.9962437754824365]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9962507529892802, 1-0.9962507529892802]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9944505562235872, 1-0.9944505562235872]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9966414933725314, 1-0.9966414933725314]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9967973243587089, 1-0.9967973243587089]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9948599032917551, 1-0.9948599032917551]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9975788051252114, 1-0.9975788051252114]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9988696438913091, 1-0.9988696438913091]);
        S514=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S515=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
        S516=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S517=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
    end
    
    if S519 == double('E')
        S520=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S521=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S522=randsrc(1, 1,[double('H'),double('X');1, 1-1]);
        S523=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9963648373014673, 1-0.9963648373014673]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9965834587305538, 1-0.9965834587305538]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9964927540950818, 1-0.9964927540950818]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9962973902648343, 1-0.9962973902648343]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9961927310700589, 1-0.9961927310700589]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9905923012696323, 1-0.9905923012696323]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9908597636562806, 1-0.9908597636562806]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9962415720276208, 1-0.9962415720276208]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9963369281828606, 1-0.9963369281828606]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9964369358578682, 1-0.9964369358578682]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9962880872252987, 1-0.9962880872252987]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9928482883570134, 1-0.9928482883570134]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9965834587305538, 1-0.9965834587305538]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9968997620747638, 1-0.9968997620747638]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9968881332753444, 1-0.9968881332753444]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9965974132898572, 1-0.9965974132898572]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9963694888212351, 1-0.9963694888212351]);
        S495=randsrc(1, 1,[double('L'),double('X');0.996576481450902, 1-0.996576481450902]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9962252917084334, 1-0.9962252917084334]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.996783474080569, 1-0.996783474080569]);
        S501=randsrc(1, 1,[double('R'),double('X');0.994020471338498, 1-0.994020471338498]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9961345870729614, 1-0.9961345870729614]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9961322613130775, 1-0.9961322613130775]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9943297974030565, 1-0.9943297974030565]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9965369435328758, 1-0.9965369435328758]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9966671860863741, 1-0.9966671860863741]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9947275023432031, 1-0.9947275023432031]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9974300353282927, 1-0.9974300353282927]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9986929229452493, 1-0.9986929229452493]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9988208397388637, 1-0.9988208397388637]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9989882944505043, 1-0.9989882944505043]);
        S516=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S517=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S518=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
    end
    
    if S520 == double('L')
        S521=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S522=randsrc(1, 1,[double('H'),double('X');1, 1-1]);
        S523=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9962484795061854, 1-0.9962484795061854]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9964740824125091, 1-0.9964740824125091]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9963787244830321, 1-0.9963787244830321]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9961810312146042, 1-0.9961810312146042]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9960647410567054, 1-0.9960647410567054]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9904688586586163, 1-0.9904688586586163]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9907363260217835, 1-0.9907363260217835]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9961205603324969, 1-0.9961205603324969]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9962182440651318, 1-0.9962182440651318]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9963159277977668, 1-0.9963159277977668]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9961577731830245, 1-0.9961577731830245]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9927295393281685, 1-0.9927295393281685]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9964554759872453, 1-0.9964554759872453]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9967810884293619, 1-0.9967810884293619]);
        S491=randsrc(1, 1,[double('C'),double('X');0.996769459413572, 1-0.996769459413572]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.996481059821983, 1-0.996481059821983]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9962531311125015, 1-0.9962531311125015]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9964624533967192, 1-0.9964624533967192]);
        S497=randsrc(1, 1,[double('S'),double('X');0.996104279710391, 1-0.996104279710391]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9966578208619892, 1-0.9966578208619892]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9938970925134722, 1-0.9938970925134722]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9960019443714401, 1-0.9960019443714401]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9959996185682821, 1-0.9959996185682821]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9942087501366409, 1-0.9942087501366409]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9963810502861901, 1-0.9963810502861901]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9965368790977744, 1-0.9965368790977744]);
        S508=randsrc(1, 1,[double('H'),double('X');0.994590181854549, 1-0.994590181854549]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9972857877146426, 1-0.9972857877146426]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9985510246325813, 1-0.9985510246325813]);
        S514=randsrc(1, 1,[double('V'),double('X');0.99866731479048, 1-0.99866731479048]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9988208177989064, 1-0.9988208177989064]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9989231531378573, 1-0.9989231531378573]);
        S517=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S518=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
        S519=randsrc(1, 1,[double('E'),double('X');1, 1-1]);
    end
    
    if S521 == double('L')
        S522=randsrc(1, 1,[double('H'),double('X');1, 1-1]);
        S523=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9961473807071428, 1-0.9961473807071428]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.996375236283908, 1-0.996375236283908]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9962822340076773, 1-0.9962822340076773]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9960776289999698, 1-0.9960776289999698]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9959567260408698, 1-0.9959567260408698]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9903649641824984, 1-0.9903649641824984]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9906346707835674, 1-0.9906346707835674]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9960125274066083, 1-0.9960125274066083]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9960892542844986, 1-0.9960892542844986]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9961938818452581, 1-0.9961938818452581]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9960474032601948, 1-0.9960474032601948]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9926132942103758, 1-0.9926132942103758]);
        S488=randsrc(1, 1,[double('G'),double('X');0.99633571031651, 1-0.99633571031651]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9966588932264118, 1-0.9966588932264118]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9966449428849771, 1-0.9966449428849771]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9963543107717562, 1-0.9963543107717562]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9961311053088024, 1-0.9961311053088024]);
        S495=randsrc(1, 1,[double('L'),double('X');0.996345010544133, 1-0.996345010544133]);
        S497=randsrc(1, 1,[double('S'),double('X');0.995975326496116, 1-0.995975326496116]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9965286900396887, 1-0.9965286900396887]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9937688474925424, 1-0.9937688474925424]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9958683738784507, 1-0.9958683738784507]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9958799991629795, 1-0.9958799991629795]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9940804051179153, 1-0.9940804051179153]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9962566583817138, 1-0.9962566583817138]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9963984868529657, 1-0.9963984868529657]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9944384638814034, 1-0.9944384638814034]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9971378549489999, 1-0.9971378549489999]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9983957107350202, 1-0.9983957107350202]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9985073134664971, 1-0.9985073134664971]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9986444918239374, 1-0.9986444918239374]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9987281938725451, 1-0.9987281938725451]);
        S517=randsrc(1, 1,[double('S'),double('X');0.998918848538818, 1-0.998918848538818]);
        S518=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
        S519=randsrc(1, 1,[double('E'),double('X');1, 1-1]);
        S520=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
    end
    
    if S522 == double('H')
        S523=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
        S475=randsrc(1, 1,[double('I'),double('X');0.9959801261528947, 1-0.9959801261528947]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9962149481647846, 1-0.9962149481647846]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9961079995257061, 1-0.9961079995257061]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9959103770404522, 1-0.9959103770404522]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9957871536084704, 1-0.9957871536084704]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9901909498201635, 1-0.9901909498201635]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9904606463882747, 1-0.9904606463882747]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9958429528984244, 1-0.9958429528984244]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9959313017741849, 1-0.9959313017741849]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9960312755020192, 1-0.9960312755020192]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9958824773954752, 1-0.9958824773954752]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9924438461520577, 1-0.9924438461520577]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9961800736085633, 1-0.9961800736085633]);
        S490=randsrc(1, 1,[double('N'),double('X');0.996510219407458, 1-0.996510219407458]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9964846447328958, 1-0.9964846447328958]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9961986733718814, 1-0.9961986733718814]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9959801261528947, 1-0.9959801261528947]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9961893734902223, 1-0.9961893734902223]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9958127282830326, 1-0.9958127282830326]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.9963567713600845, 1-0.9963567713600845]);
        S501=randsrc(1, 1,[double('R'),double('X');0.993583081655286, 1-0.993583081655286]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9956778799989771, 1-0.9956778799989771]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9956825299398065, 1-0.9956825299398065]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9938899777500332, 1-0.9938899777500332]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9960684750286553, 1-0.9960684750286553]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9961963484014665, 1-0.9961963484014665]);
        S508=randsrc(1, 1,[double('H'),double('X');0.9942340733714163, 1-0.9942340733714163]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.9969287140821133, 1-0.9969287140821133]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9981632733723463, 1-0.9981632733723463]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9982771969226691, 1-0.9982771969226691]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9984050702954805, 1-0.9984050702954805]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9984771443783378, 1-0.9984771443783378]);
        S517=randsrc(1, 1,[double('S'),double('X');0.998663142011518, 1-0.998663142011518]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9989630631950208, 1-0.9989630631950208]);
        S519=randsrc(1, 1,[double('E'),double('X');1, 1-1]);
        S520=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S521=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
    end
    
    if S523 == double('A')
        S475=randsrc(1, 1,[double('I'),double('X');0.9955029701313551, 1-0.9955029701313551]);
        S476=randsrc(1, 1,[double('Y'),double('X');0.9957191064506233, 1-0.9957191064506233]);
        S477=randsrc(1, 1,[double('Q'),double('X');0.9956075522213236, 1-0.9956075522213236]);
        S478=randsrc(1, 1,[double('A'),double('X');0.9954146563664928, 1-0.9954146563664928]);
        S479=randsrc(1, 1,[double('G'),double('X');0.9952728895334244, 1-0.9952728895334244]);
        S480=randsrc(1, 1,[double('N'),double('X');0.9896975021148823, 1-0.9896975021148823]);
        S481=randsrc(1, 1,[double('K'),double('X');0.9899717395952441, 1-0.9899717395952441]);
        S482=randsrc(1, 1,[double('P'),double('X');0.9953216945087431, 1-0.9953216945087431]);
        S484=randsrc(1, 1,[double('N'),double('X');0.9953960639949428, 1-0.9953960639949428]);
        S485=randsrc(1, 1,[double('G'),double('X');0.9955052941777989, 1-0.9955052941777989]);
        S486=randsrc(1, 1,[double('V'),double('X');0.9953704994840616, 1-0.9953704994840616]);
        S487=randsrc(1, 1,[double('A'),double('X');0.9919053462364392, 1-0.9919053462364392]);
        S488=randsrc(1, 1,[double('G'),double('X');0.9956470610108672, 1-0.9956470610108672]);
        S490=randsrc(1, 1,[double('N'),double('X');0.9959352427698915, 1-0.9959352427698915]);
        S491=randsrc(1, 1,[double('C'),double('X');0.9959003820732354, 1-0.9959003820732354]);
        S492=randsrc(1, 1,[double('Y'),double('X');0.9955936079426612, 1-0.9955936079426612]);
        S493=randsrc(1, 1,[double('F'),double('X');0.9953635273447304, 1-0.9953635273447304]);
        S495=randsrc(1, 1,[double('L'),double('X');0.9955750155711112, 1-0.9955750155711112]);
        S497=randsrc(1, 1,[double('S'),double('X');0.9951961960007809, 1-0.9951961960007809]);
        S498=randsrc(1, 1,[double('Y'),double('X');0.995740022868617, 1-0.995740022868617]);
        S501=randsrc(1, 1,[double('R'),double('X');0.9928977140679179, 1-0.9928977140679179]);
        S502=randsrc(1, 1,[double('P'),double('X');0.9950335127497187, 1-0.9950335127497187]);
        S503=randsrc(1, 1,[double('T'),double('X');0.9950079482388376, 1-0.9950079482388376]);
        S504=randsrc(1, 1,[double('Y'),double('X');0.9932021641520484, 1-0.9932021641520484]);
        S506=randsrc(1, 1,[double('V'),double('X');0.9954007120878303, 1-0.9954007120878303]);
        S507=randsrc(1, 1,[double('G'),double('X');0.9955052941777989, 1-0.9955052941777989]);
        S508=randsrc(1, 1,[double('H'),double('X');0.99355077111861, 1-0.99355077111861]);
        S509=randsrc(1, 1,[double('Q'),double('X');0.996230396668247, 1-0.996230396668247]);
        S513=randsrc(1, 1,[double('V'),double('X');0.9974226324938877, 1-0.9974226324938877]);
        S514=randsrc(1, 1,[double('V'),double('X');0.9975318626767438, 1-0.9975318626767438]);
        S515=randsrc(1, 1,[double('V'),double('X');0.9976898978349183, 1-0.9976898978349183]);
        S516=randsrc(1, 1,[double('L'),double('X');0.9977735635068932, 1-0.9977735635068932]);
        S517=randsrc(1, 1,[double('S'),double('X');0.9979804036403863, 1-0.9979804036403863]);
        S518=randsrc(1, 1,[double('F'),double('X');0.9982337247027545, 1-0.9982337247027545]);
        S519=randsrc(1, 1,[double('E'),double('X');0.998419648418254, 1-0.998419648418254]);
        S520=randsrc(1, 1,[double('L'),double('X');0.9983917598609291, 1-0.9983917598609291]);
        S521=randsrc(1, 1,[double('L'),double('X');0.9987543111061531, 1-0.9987543111061531]);
        S522=randsrc(1, 1,[double('H'),double('X');0.9989425588680965, 1-0.9989425588680965]);
    end
    
    SS475523=[S475,S476,S477,S478,S479,S480,S481,S482,S484,S485,S486,S487,S488,S490,S491,S492,S493,S495,S497,S498,S501,S502,S503,S504,S506,S507,S508,S509,S513,S514,S515,S516,S517,S518,S519,S520,S521,S522,S523];
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if S525 == double('A')
        S526=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
        S531=randsrc(1, 1,[double('K'),double('X');0.9976763280866574, 1-0.9976763280866574]);
    end
    
    if S526 == double('T')
        S531=randsrc(1, 1,[double('K'),double('X');0.9981418554038329, 1-0.9981418554038329]);
        S525=randsrc(1, 1,[double('A'),double('X');0.9979490729019805, 1-0.9979490729019805]);
    end
    
    if S531 == double('K')
        S525=randsrc(1, 1,[double('A'),double('X');0.9931647046837518, 1-0.9931647046837518]);
        S526=randsrc(1, 1,[double('T'),double('X');0.9950471894710519, 1-0.9950471894710519]);
    end
    SS525531=[S525,S526,S531];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if S444 == double('L')
        S445=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
        S446=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9969977577002824, 1-0.9969977577002824]);
        S450=randsrc(1, 1,[double('G'),double('X');0.9975630236332761, 1-0.9975630236332761]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9973495829697806, 1-0.9973495829697806]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.996681114957734, 1-0.996681114957734]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9966693874487508, 1-0.9966693874487508]);
        S456=randsrc(1, 1,[double('Y'),double('X');0.9967444435062437, 1-0.9967444435062437]);
        S458=randsrc(1, 1,[double('L'),double('X');0.9963152166774559, 1-0.9963152166774559]);
        S459=randsrc(1, 1,[double('F'),double('X');0.9961158490247404, 1-0.9961158490247404]);
        S461=randsrc(1, 1,[double('K'),double('X');0.9959399363899912, 1-0.9959399363899912]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9961862140786399, 1-0.9961862140786399]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9939157683394786, 1-0.9939157683394786]);
        S464=randsrc(1, 1,[double('L'),double('X');0.9960994305121638, 1-0.9960994305121638]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9959070993648381, 1-0.9959070993648381]);
        S466=randsrc(1, 1,[double('P'),double('X');0.9960032649385009, 1-0.9960032649385009]);
    end
    
    if S445 == double('D')
        S446=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S448=randsrc(1, 1,[double('V'),double('X');0.99725794118061, 1-0.99725794118061]);
        S450=randsrc(1, 1,[double('G'),double('X');0.9978115133631387, 1-0.9978115133631387]);
        S451=randsrc(1, 1,[double('N'),double('X');0.997605096617111, 1-0.997605096617111]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.996910785744109, 1-0.996910785744109]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.996880292361173, 1-0.996880292361173]);
        S456=randsrc(1, 1,[double('Y'),double('X');0.9969576986409334, 1-0.9969576986409334]);
        S458=randsrc(1, 1,[double('L'),double('X');0.9965049891865773, 1-0.9965049891865773]);
        S459=randsrc(1, 1,[double('F'),double('X');0.9962844985715023, 1-0.9962844985715023]);
        S461=randsrc(1, 1,[double('K'),double('X');0.9961109208532518, 1-0.9961109208532518]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9963525222718977, 1-0.9963525222718977]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9940725554862287, 1-0.9940725554862287]);
        S464=randsrc(1, 1,[double('L'),double('X');0.9962610421230901, 1-0.9962610421230901]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9960452427976975, 1-0.9960452427976975]);
        S466=randsrc(1, 1,[double('P'),double('X');0.9961601793949174, 1-0.9961601793949174]);
        S444=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
    end
    
    if S446 == double('S')
        S448=randsrc(1, 1,[double('V'),double('X');0.9971757635985224, 1-0.9971757635985224]);
        S450=randsrc(1, 1,[double('G'),double('X');0.997820298876868, 1-0.997820298876868]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9975976412352577, 1-0.9975976412352577]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9968898243114019, 1-0.9968898243114019]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9967796673729211, 1-0.9967796673729211]);
        S456=randsrc(1, 1,[double('Y'),double('X');0.9968734179588622, 1-0.9968734179588622]);
        S458=randsrc(1, 1,[double('L'),double('X');0.9963859149119682, 1-0.9963859149119682]);
        S459=randsrc(1, 1,[double('F'),double('X');0.9960179438621491, 1-0.9960179438621491]);
        S461=randsrc(1, 1,[double('K'),double('X');0.9958374739842124, 1-0.9958374739842124]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9961538822117638, 1-0.9961538822117638]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9938898055612848, 1-0.9938898055612848]);
        S464=randsrc(1, 1,[double('L'),double('X');0.9961187257420359, 1-0.9961187257420359]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9957882549265933, 1-0.9957882549265933]);
        S466=randsrc(1, 1,[double('P'),double('X');0.9959476309226932, 1-0.9959476309226932]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9987624922655767, 1-0.9987624922655767]);
        S445=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
    end
    
    if S448 == double('V')
        S450=randsrc(1, 1,[double('G'),double('X');0.9987852529234992, 1-0.9987852529234992]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9985314953137079, 1-0.9985314953137079]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9977984177743108, 1-0.9977984177743108]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9976292460344499, 1-0.9976292460344499]);
        S456=randsrc(1, 1,[double('Y'),double('X');0.9976386444644422, 1-0.9976386444644422]);
        S458=randsrc(1, 1,[double('L'),double('X');0.9971922190398094, 1-0.9971922190398094]);
        S459=randsrc(1, 1,[double('F'),double('X');0.996830379485107, 1-0.996830379485107]);
        S461=randsrc(1, 1,[double('K'),double('X');0.99665650853025, 1-0.99665650853025]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9969408110375162, 1-0.9969408110375162]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9946687405868849, 1-0.9946687405868849]);
        S464=randsrc(1, 1,[double('L'),double('X');0.9968468267375935, 1-0.9968468267375935]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9965578250153312, 1-0.9965578250153312]);
        S466=randsrc(1, 1,[double('P'),double('X');0.9966941022502191, 1-0.9966941022502191]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9987429599885339, 1-0.9987429599885339]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9989426766258697, 1-0.9989426766258697]);
        S446=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
    end
    
    if S450 == double('G')
        S451=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9987797380191393, 1-0.9987797380191393]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9984629392356467, 1-0.9984629392356467]);
        S456=randsrc(1, 1,[double('Y'),double('X');0.9984230460555031, 1-0.9984230460555031]);
        S458=randsrc(1, 1,[double('L'),double('X');0.9979161680019148, 1-0.9979161680019148]);
        S459=randsrc(1, 1,[double('F'),double('X');0.9974444898131591, 1-0.9974444898131591]);
        S461=randsrc(1, 1,[double('K'),double('X');0.997275530461963, 1-0.997275530461963]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9975829426148337, 1-0.9975829426148337]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9953184179772749, 1-0.9953184179772749]);
        S464=randsrc(1, 1,[double('L'),double('X');0.9974796896779916, 1-0.9974796896779916]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9971229977143554, 1-0.9971229977143554]);
        S466=randsrc(1, 1,[double('P'),double('X');0.9972825704349295, 1-0.9972825704349295]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9980546208035894, 1-0.9980546208035894]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9982423534160295, 1-0.9982423534160295]);
        S446=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9975313161464127, 1-0.9975313161464127]);
    end
    
    if S451 == double('N')
        S452=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9986317059317777, 1-0.9986317059317777]);
        S456=randsrc(1, 1,[double('Y'),double('X');0.9985190505024901, 1-0.9985190505024901]);
        S458=randsrc(1, 1,[double('L'),double('X');0.998028529987467, 1-0.998028529987467]);
        S459=randsrc(1, 1,[double('F'),double('X');0.9975497444129948, 1-0.9975497444129948]);
        S461=randsrc(1, 1,[double('K'),double('X');0.997390149221504, 1-0.997390149221504]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9977022986401551, 1-0.9977022986401551]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9954257201733016, 1-0.9954257201733016]);
        S464=randsrc(1, 1,[double('L'),double('X');0.997568520317876, 1-0.997568520317876]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9972070841489117, 1-0.9972070841489117]);
        S466=randsrc(1, 1,[double('P'),double('X');0.9973760672928431, 1-0.9973760672928431]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9979815902252639, 1-0.9979815902252639]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9981763902384071, 1-0.9981763902384071]);
        S446=randsrc(1, 1,[double('S'),double('X');0.9989696722196405, 1-0.9989696722196405]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9974183130788259, 1-0.9974183130788259]);
        S450=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
    end
    
    if S452 == double('Y')
        S454=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S456=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S458=randsrc(1, 1,[double('L'),double('X');0.9985417195029166, 1-0.9985417195029166]);
        S459=randsrc(1, 1,[double('F'),double('X');0.9980274466706118, 1-0.9980274466706118]);
        S461=randsrc(1, 1,[double('K'),double('X');0.997860718948723, 1-0.997860718948723]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9981612985036774, 1-0.9981612985036774]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9958717276749232, 1-0.9958717276749232]);
        S464=randsrc(1, 1,[double('L'),double('X');0.9980297949483848, 1-0.9980297949483848]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9976540705046919, 1-0.9976540705046919]);
        S466=randsrc(1, 1,[double('P'),double('X');0.9978278430598999, 1-0.9978278430598999]);
        S444=randsrc(1, 1,[double('L'),double('X');0.997860718948723, 1-0.997860718948723]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9980297949483848, 1-0.9980297949483848]);
        S446=randsrc(1, 1,[double('S'),double('X');0.9988094231690479, 1-0.9988094231690479]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9972337287833103, 1-0.9972337287833103]);
        S450=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S451=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
    end
    
    if S454 == double('Y')
        S456=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S458=randsrc(1, 1,[double('L'),double('X');0.9989267564089317, 1-0.9989267564089317]);
        S459=randsrc(1, 1,[double('F'),double('X');0.9983607789353048, 1-0.9983607789353048]);
        S461=randsrc(1, 1,[double('K'),double('X');0.9982034325007281, 1-0.9982034325007281]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9984570655594488, 1-0.9984570655594488]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9961508834884879, 1-0.9961508834884879]);
        S464=randsrc(1, 1,[double('L'),double('X');0.9983067644876142, 1-0.9983067644876142]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9979169210825435, 1-0.9979169210825435]);
        S466=randsrc(1, 1,[double('P'),double('X');0.9980789644256151, 1-0.9980789644256151]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9979239664452857, 1-0.9979239664452857]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9980742675171203, 1-0.9980742675171203]);
        S446=randsrc(1, 1,[double('S'),double('X');0.9987741068828497, 1-0.9987741068828497]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9971395827266493, 1-0.9971395827266493]);
        S450=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
        S451=randsrc(1, 1,[double('N'),double('X');1, 1-1]);
        S452=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
    end
    
    if S456 == double('Y')
        S458=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S459=randsrc(1, 1,[double('F'),double('X');0.998382621514655, 1-0.998382621514655]);
        S461=randsrc(1, 1,[double('K'),double('X');0.9981783952037333, 1-0.9981783952037333]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9984788660979629, 1-0.9984788660979629]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9961525640965451, 1-0.9961525640965451]);
        S464=randsrc(1, 1,[double('L'),double('X');0.9983168935065423, 1-0.9983168935065423]);
        S465=randsrc(1, 1,[double('K'),double('X');0.997880271738365, 1-0.997880271738365]);
        S466=randsrc(1, 1,[double('P'),double('X');0.998061023760675, 1-0.998061023760675]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9975633688421073, 1-0.9975633688421073]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9977159517180831, 1-0.9977159517180831]);
        S446=randsrc(1, 1,[double('S'),double('X');0.9984319175207396, 1-0.9984319175207396]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9967135995943643, 1-0.9967135995943643]);
        S450=randsrc(1, 1,[double('G'),double('X');0.9987511678458584, 1-0.9987511678458584]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9987065666974962, 1-0.9987065666974962]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9986924821243293, 1-0.9986924821243293]);
        S454=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
    end
    
    if S458 == double('L')
        S459=randsrc(1, 1,[double('F'),double('X');0.9989807900051665, 1-0.9989807900051665]);
        S461=randsrc(1, 1,[double('K'),double('X');0.9986543609976046, 1-0.9986543609976046]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9989126861115025, 1-0.9989126861115025]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9965760180357898, 1-0.9965760180357898]);
        S464=randsrc(1, 1,[double('L'),double('X');0.9987201164811422, 1-0.9987201164811422]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9982786153773895, 1-0.9982786153773895]);
        S466=randsrc(1, 1,[double('P'),double('X');0.998370203372317, 1-0.998370203372317]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9975506082382227, 1-0.9975506082382227]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9976797707951717, 1-0.9976797707951717]);
        S446=randsrc(1, 1,[double('S'),double('X');0.9983608097318115, 1-0.9983608097318115]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9966840449016016, 1-0.9966840449016016]);
        S450=randsrc(1, 1,[double('G'),double('X');0.9986614062279836, 1-0.9986614062279836]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9986332253064675, 1-0.9986332253064675]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9985979991545724, 1-0.9985979991545724]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9989079892912498, 1-0.9989079892912498]);
        S456=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
    end
    
    if S459 == double('F')
        S461=randsrc(1, 1,[double('K'),double('X');1, 1-1]);
        S462=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S463=randsrc(1, 1,[double('N'),double('X');0.997057931951752, 1-0.997057931951752]);
        S464=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9988438518532444, 1-0.9988438518532444]);
        S466=randsrc(1, 1,[double('P'),double('X');0.9988884998507817, 1-0.9988884998507817]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9979814405323921, 1-0.9979814405323921]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9980895356843246, 1-0.9980895356843246]);
        S446=randsrc(1, 1,[double('S'),double('X');0.9986229617601651, 1-0.9986229617601651]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9969521866944268, 1-0.9969521866944268]);
        S450=randsrc(1, 1,[double('G'),double('X');0.9988203529071721, 1-0.9988203529071721]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9987851044880637, 1-0.9987851044880637]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9987146076498469, 1-0.9987146076498469]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9989730960566419, 1-0.9989730960566419]);
        S456=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S458=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
    end
    
    if S461 == double('K')
        S462=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S463=randsrc(1, 1,[double('N'),double('X');0.997393734151483, 1-0.997393734151483]);
        S464=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S465=randsrc(1, 1,[double('K'),double('X');1, 1-1]);
        S466=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9978943064019196, 1-0.9978943064019196]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9980047613116403, 1-0.9980047613116403]);
        S446=randsrc(1, 1,[double('S'),double('X');0.9985311847111604, 1-0.9985311847111604]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9968673107519629, 1-0.9968673107519629]);
        S450=randsrc(1, 1,[double('G'),double('X');0.9987403440082911, 1-0.9987403440082911]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9987144928592075, 1-0.9987144928592075]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9986369394119569, 1-0.9986369394119569]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9989048513206412, 1-0.9989048513206412]);
        S456=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S458=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S459=randsrc(1, 1,[double('F'),double('X');1, 1-1]);
    end
    
    if S462 == double('S')
        S463=randsrc(1, 1,[double('N'),double('X');0.9974633179331678, 1-0.9974633179331678]);
        S464=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9988631906293085, 1-0.9988631906293085]);
        S466=randsrc(1, 1,[double('P'),double('X');0.9989453979185114, 1-0.9989453979185114]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9975784081380519, 1-0.9975784081380519]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9976841032241699, 1-0.9976841032241699]);
        S446=randsrc(1, 1,[double('S'),double('X');0.9982853908251967, 1-0.9982853908251967]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9965895718879256, 1-0.9965895718879256]);
        S450=randsrc(1, 1,[double('G'),double('X');0.9984850370989752, 1-0.9984850370989752]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9984638980817516, 1-0.9984638980817516]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9983746444534742, 1-0.9983746444534742]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9985954297444762, 1-0.9985954297444762]);
        S456=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
        S458=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S459=randsrc(1, 1,[double('F'),double('X');0.9989594905966606, 1-0.9989594905966606]);
        S461=randsrc(1, 1,[double('K'),double('X');1, 1-1]);
    end
    
    if S463 == double('N')
        S464=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9989336434320204, 1-0.9989336434320204]);
        S466=randsrc(1, 1,[double('P'),double('X');0.99899249313224, 1-0.99899249313224]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9975118346747142, 1-0.9975118346747142]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9976083481830743, 1-0.9976083481830743]);
        S446=randsrc(1, 1,[double('S'),double('X');0.9982250930413761, 1-0.9982250930413761]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9965231597110245, 1-0.9965231597110245]);
        S450=randsrc(1, 1,[double('G'),double('X');0.9984275360101316, 1-0.9984275360101316]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9983945801780085, 1-0.9983945801780085]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9982933586936308, 1-0.9982933586936308]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9984981556503951, 1-0.9984981556503951]);
        S456=randsrc(1, 1,[double('Y'),double('X');0.9989359974200291, 1-0.9989359974200291]);
        S458=randsrc(1, 1,[double('L'),double('X');0.9989430593840555, 1-0.9989430593840555]);
        S459=randsrc(1, 1,[double('F'),double('X');0.998794758139502, 1-0.998794758139502]);
        S461=randsrc(1, 1,[double('K'),double('X');1, 1-1]);
        S462=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
    end
    
    if S464 == double('L')
        S465=randsrc(1, 1,[double('K'),double('X');1, 1-1]);
        S466=randsrc(1, 1,[double('P'),double('X');0.9988663674940854, 1-0.9988663674940854]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9967633970483307, 1-0.9967633970483307]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9968643208532052, 1-0.9968643208532052]);
        S446=randsrc(1, 1,[double('S'),double('X');0.9975214991175034, 1-0.9975214991175034]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9957682413909648, 1-0.9957682413909648]);
        S450=randsrc(1, 1,[double('G'),double('X');0.9976529347703631, 1-0.9976529347703631]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9976012993353112, 1-0.9976012993353112]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9975144579218146, 1-0.9975144579218146]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9977163055315633, 1-0.9977163055315633]);
        S456=randsrc(1, 1,[double('Y'),double('X');0.9981622479251944, 1-0.9981622479251944]);
        S458=randsrc(1, 1,[double('L'),double('X');0.9981481655338165, 1-0.9981481655338165]);
        S459=randsrc(1, 1,[double('F'),double('X');0.9979345825979196, 1-0.9979345825979196]);
        S461=randsrc(1, 1,[double('K'),double('X');0.9981153066206016, 1-0.9981153066206016]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9986762552104849, 1-0.9986762552104849]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9965756318299598, 1-0.9965756318299598]);
    end
    
    if S465 == double('K')
        S466=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
        S444=randsrc(1, 1,[double('L'),double('X');0.9968072344311595, 1-0.9968072344311595]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9968847059486388, 1-0.9968847059486388]);
        S446=randsrc(1, 1,[double('S'),double('X');0.9974270065709933, 1-0.9974270065709933]);
        S448=randsrc(1, 1,[double('V'),double('X');0.995715590321225, 1-0.995715590321225]);
        S450=randsrc(1, 1,[double('G'),double('X');0.997532649549374, 1-0.997532649549374]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9974763066275709, 1-0.9974763066275709]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9973753588926738, 1-0.9973753588926738]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.9975631686320173, 1-0.9975631686320173]);
        S456=randsrc(1, 1,[double('Y'),double('X');0.9979622643281224, 1-0.9979622643281224]);
        S458=randsrc(1, 1,[double('L'),double('X');0.997943483354188, 1-0.997943483354188]);
        S459=randsrc(1, 1,[double('F'),double('X');0.9978777499454178, 1-0.9978777499454178]);
        S461=randsrc(1, 1,[double('K'),double('X');0.9979575690846388, 1-0.9979575690846388]);
        S462=randsrc(1, 1,[double('S'),double('X');0.9983707505111946, 1-0.9983707505111946]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9962320671044199, 1-0.9962320671044199]);
        S464=randsrc(1, 1,[double('L'),double('X');1, 1-1]);
    end
    
    if S466 == double('P')
        S444=randsrc(1, 1,[double('L'),double('X');0.9960219543087676, 1-0.9960219543087676]);
        S445=randsrc(1, 1,[double('D'),double('X');0.9961181216869165, 1-0.9961181216869165]);
        S446=randsrc(1, 1,[double('S'),double('X');0.996704508139044, 1-0.996704508139044]);
        S448=randsrc(1, 1,[double('V'),double('X');0.9949711497865553, 1-0.9949711497865553]);
        S450=randsrc(1, 1,[double('G'),double('X');0.9968100577004269, 1-0.9968100577004269]);
        S451=randsrc(1, 1,[double('N'),double('X');0.9967631467842567, 1-0.9967631467842567]);
        S452=randsrc(1, 1,[double('Y'),double('X');0.9966669794061078, 1-0.9966669794061078]);
        S454=randsrc(1, 1,[double('Y'),double('X');0.996842895341746, 1-0.996842895341746]);
        S456=randsrc(1, 1,[double('Y'),double('X');0.9972604024956607, 1-0.9972604024956607]);
        S458=randsrc(1, 1,[double('L'),double('X');0.9971525073884693, 1-0.9971525073884693]);
        S459=randsrc(1, 1,[double('F'),double('X');0.9970399211896608, 1-0.9970399211896608]);
        S461=randsrc(1, 1,[double('K'),double('X');0.9971360885678098, 1-0.9971360885678098]);
        S462=randsrc(1, 1,[double('S'),double('X');0.997570014542384, 1-0.997570014542384]);
        S463=randsrc(1, 1,[double('N'),double('X');0.9954097668527466, 1-0.9954097668527466]);
        S464=randsrc(1, 1,[double('L'),double('X');0.9982197307313412, 1-0.9982197307313412]);
        S465=randsrc(1, 1,[double('K'),double('X');0.9984730496786602, 1-0.9984730496786602]);
    end
    
    SS444466=[S444,S445,S446,S448,S450,S451,S452,S454,S456,S458,S459,S461,S462,S463,S464,S465,S466];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if S447 == double('K')
        S453=randsrc(1, 1,[double('N'),double('X');0.995288272484312, 1-0.995288272484312]);
        S467=randsrc(1, 1,[double('F'),double('X');0.9959169737570199, 1-0.9959169737570199]);
        S469=randsrc(1, 1,[double('R'),double('X');0.9952458881288484, 1-0.9952458881288484]);
        S471=randsrc(1, 1,[double('I'),double('X');0.9952082131462142, 1-0.9952082131462142]);
        S472=randsrc(1, 1,[double('S'),double('X');0.9950763507069946, 1-0.9950763507069946]);
        S473=randsrc(1, 1,[double('T'),double('X');0.9946595712116039, 1-0.9946595712116039]);
        S474=randsrc(1, 1,[double('E'),double('X');0.9944523588071159, 1-0.9944523588071159]);
    end
    
    if S453 == double('N')
        S467=randsrc(1, 1,[double('F'),double('X');0.9978215865248894, 1-0.9978215865248894]);
        S469=randsrc(1, 1,[double('R'),double('X');0.9971040745271478, 1-0.9971040745271478]);
        S471=randsrc(1, 1,[double('I'),double('X');0.9970334995765503, 1-0.9970334995765503]);
        S472=randsrc(1, 1,[double('S'),double('X');0.996889997177002, 1-0.996889997177002]);
        S473=randsrc(1, 1,[double('T'),double('X');0.996440669991531, 1-0.996440669991531]);
        S474=randsrc(1, 1,[double('E'),double('X');0.9962242401430319, 1-0.9962242401430319]);
        S447=randsrc(1, 1,[double('K'),double('X');0.9943634139456102, 1-0.9943634139456102]);
    end
    
    if S467 == double('F')
        S469=randsrc(1, 1,[double('R'),double('X');0.9988814500899754, 1-0.9988814500899754]);
        S471=randsrc(1, 1,[double('I'),double('X');0.9987036053344066, 1-0.9987036053344066]);
        S472=randsrc(1, 1,[double('S'),double('X');0.9985468211419973, 1-0.9985468211419973]);
        S473=randsrc(1, 1,[double('T'),double('X');0.9980413676261704, 1-0.9980413676261704]);
        S474=randsrc(1, 1,[double('E'),double('X');0.9977956610559766, 1-0.9977956610559766]);
        S447=randsrc(1, 1,[double('K'),double('X');0.9897318054284772, 1-0.9897318054284772]);
        S453=randsrc(1, 1,[double('N'),double('X');0.9925469007041249, 1-0.9925469007041249]);
    end
    
    if S469 == double('R')
        S471=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
        S472=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S473=randsrc(1, 1,[double('T'),double('X');0.9988580735138576, 1-0.9988580735138576]);
        S474=randsrc(1, 1,[double('E'),double('X');0.9985842919587783, 1-0.9985842919587783]);
        S447=randsrc(1, 1,[double('K'),double('X');0.9890440577702482, 1-0.9890440577702482]);
        S453=randsrc(1, 1,[double('N'),double('X');0.991812293493827, 1-0.991812293493827]);
        S467=randsrc(1, 1,[double('F'),double('X');0.9988604135271488, 1-0.9988604135271488]);
    end
    
    if S471 == double('I')
        S472=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S473=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
        S474=randsrc(1, 1,[double('E'),double('X');0.9987978211092322, 1-0.9987978211092322]);
        S447=randsrc(1, 1,[double('K'),double('X');0.9885231676712111, 1-0.9885231676712111]);
        S453=randsrc(1, 1,[double('N'),double('X');0.9912573060434048, 1-0.9912573060434048]);
        S467=randsrc(1, 1,[double('F'),double('X');0.998194392794411, 1-0.998194392794411]);
        S469=randsrc(1, 1,[double('R'),double('X');1, 1-1]);
    end
    
    if S472 == double('S')
        S473=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
        S474=randsrc(1, 1,[double('E'),double('X');0.9989708156052423, 1-0.9989708156052423]);
        S447=randsrc(1, 1,[double('K'),double('X');0.988470795723271, 1-0.988470795723271]);
        S453=randsrc(1, 1,[double('N'),double('X');0.9911934562584936, 1-0.9911934562584936]);
        S467=randsrc(1, 1,[double('F'),double('X');0.998117060368682, 1-0.998117060368682]);
        S469=randsrc(1, 1,[double('R'),double('X');0.9989778327715702, 1-0.9989778327715702]);
        S471=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
    end
    
    if S473 == double('T')
        S474=randsrc(1, 1,[double('E'),double('X');1, 1-1]);
        S447=randsrc(1, 1,[double('K'),double('X');0.9884798989095334, 1-0.9884798989095334]);
        S453=randsrc(1, 1,[double('N'),double('X');0.9911709645715355, 1-0.9911709645715355]);
        S467=randsrc(1, 1,[double('F'),double('X');0.9980390321523845, 1-0.9980390321523845]);
        S469=randsrc(1, 1,[double('R'),double('X');0.9988767725932512, 1-0.9988767725932512]);
        S471=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
        S472=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
    end
    
    if S474 == double('E')
        S447=randsrc(1, 1,[double('K'),double('X');0.9885307411247832, 1-0.9885307411247832]);
        S453=randsrc(1, 1,[double('N'),double('X');0.991213143302538, 1-0.991213143302538]);
        S467=randsrc(1, 1,[double('F'),double('X');0.9980525666562897, 1-0.9980525666562897]);
        S469=randsrc(1, 1,[double('R'),double('X');0.9988624367727846, 1-0.9988624367727846]);
        S471=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
        S472=randsrc(1, 1,[double('S'),double('X');1, 1-1]);
        S473=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
    end
    
    SS447474=[S447,S453,S467,S469,S471,S472,S473,S474];
    
    %%
    SSO4474741=[double('KNFRISTE')
        double('KNFXXXXX')
        double('RNFXXXXX')
        double('TNFXXXXX')
        double('MNFXXXXX')
        double('NNFXXXXX')
        double('KDFXXXXX')];
    if SS444466==[double('L'),double('D'),double('S'),double('V'),double('G'),double('N'),double('Y'),double('Y'),double('Y'),double('L'),double('F'),double('K'),double('S'),double('N'),double('L'),double('K'),double('P')]
        S449=randsrc(1, 1,[double('G'),double('S'),double('X');0.996,0.0035,1-0.996-0.0035]);
        S499=randsrc(1, 1,[double('G'),double('S'),double('X');0.995,0.0033,1-0.995-0.0033]);
        S688=randsrc(1, 1,[double('R'),double('X');0.978,1-0.978]);
        SS447474=randsrc(1,1,[1:7;0.99335,0.0004,0.002,0.001,0.00025,0.001,0.002]);
        for j4474741=1:7
            if SS447474==j4474741
                SS447474=SSO4474741(j4474741,:);
            end
        end
    end
    %%
    SSO4444661=[double('LDSVGNYYYLFKSNLKP')
        double('LDSVGNXXXXXXXXXXX')
        double('LDSVGNYYYLFKSNLKX')
        double('LDSVGNYYYLFKSNLXX')
        double('LDSVGNYYYLFXXXXXX')
        double('LDSVGNYYYXXXXXXXX')];
    SSO4474742=[double('KNFRISTE')
        double('KNFXXXXX')
        double('KNXXXXXX')
        double('KXFRISTE')
        double('KXXXXXXX')
        double('KDFRISTE')];
    if S449==double('G')
        S499=randsrc(1, 1,[double('G'),double('X');0.996,0.004]);
        S688=randsrc(1, 1,[double('R'),double('X');0.98,0.02]);
        SS444466=randsrc(1,1,[1:6;1-0.0013,0.0005,0.0002,0.0002,0.0002,0.0002]);
        for j4444661=1:6
            if SS444466==j4444661
                SS444466=SSO4444661(j4444661,:);
            end
        end
        SS447474=randsrc(1,1,[1:6;0.988,0.0006,0.0014,0.0003,0.0007,0.009]);
        for j4474742=1:6
            if SS447474==j4474742
                SS447474=SSO4474742(j4474742,:);
            end
        end
    end
    %%
    SSO4444662=[double('LDSVGNYYYLFKSNLKP')
        double('XXSVGNYYYLFKSNLKP')
        double('XXXXXXXXXXXXXXLKP')
        double('XXXXXXXXXXXXXXXKP')
        double('XXXXXXXXXXXXXXXXP')
        double('XXXXXXXXXXXXXXXXX')];
    SSO4474743=[double('KNFRISTE')
        double('KNFXXXXX')
        double('KNXXXXXX')
        double('KXFRISTE')
        double('XNFRISTE')
        double('XXFRISTE')
        double('XXXRISTE')
        double('XXXXISTE')
        double('XXXXXXXX')];
    if S499==double('G')
        S449=randsrc(1, 1,[double('G'),double('X');0.985,1-0.985]);
        S688=randsrc(1, 1,[double('R'),double('X');0.98,1-0.98]);
        SS444466=randsrc(1,1,[1:6;1-0.000301184-0.000410918-0.000270833-0.000756463-0.008561576,0.000301184,0.000410918,0.000270833,0.000756463,0.008561576]);
        for j4444662=1:6
            if SS444466==j4444662
                SS444466=SSO4444662(j4444662,:);
            end
        end
        SS447474=randsrc(1,1,[1:9;1-0.000443605-0.000987605-0.000410918-0.000684086-0.004422041-0.000842849-0.000464618-0.005360616,0.000443605,0.000987605,0.000410918,0.000684086,0.004422041,0.000842849,0.000464618,0.005360616]);
        for j4474743=1:9
            if SS447474==j4474743
                SS447474=SSO4474743(j4474743,:);
            end
        end
    end
    %%
    SSO4444663=[double('LDSVGNYYYLFKSNLKP')
        double('LDSVGNYYYLFKSNLKX')
        double('LDSVGNYYYLFKSNLXX')
        double('LDSVGNYYYLFXXXXXX')
        double('LDSVGNYYYXXXXXXXX')
        double('LDSVGNXXXXXXXXXXX')
        double('LDSVXXXXXXXXXXXXX')
        double('XXXXXXXXXXXXXXXXX')];
    SSO4474744=[double('KNFRISTE')
        double('KNFXXXXX')
        double('KNXXXXXX')
        double('KXFRISTE')
        double('KXXXXXXX')
        double('XNFRISTE')
        double('XXFRISTE')
        double('XXXRISTE')
        double('XXXXISTE')
        double('XXXXXXXX')];
    if S688==double('R')
        S449=randsrc(1, 1,[double('G'),double('X');0.984,1-0.984]);
        S499=randsrc(1, 1,[double('G'),double('X');0.991,0.009]);
        SS444466=randsrc(1,1,[1:8;0.98,0.0002,0.0002,0.0002,0.0002,0.0004,0.0002,0.0186]);
        for j4444663=1:8
            if SS444466==j4444663
                SS444466=SSO4444663(j4444663,:);
            end
        end
        SS447474=randsrc(1,1,[1:10; 0.977997763,0.000572258,0.0013416,0.000479652,0.000873821,0.00075747,0.003469163,0.000617373,0.000325308,1-0.986434408]);
        for j4474744=1:10
            if SS447474==j4474744
                SS447474=SSO4474744(j4474744,:);
            end
        end
    end
    %%
    SSO4444664=[double('LDSVGNYYYLFKSNLKP')
                double('XXSVGNYYYLFKSNLKP')];
    if SS447474==double('KNFRISTE')
        S449=randsrc(1, 1,[double('G'),double('X');0.9942,1-0.9942]);
        S499=randsrc(1, 1,[double('G'),double('X');0.995,1-0.995]);
        S688=randsrc(1, 1,[double('R'),double('X');0.98,0.02]);
        SS444466=randsrc(1,1,[1:2;1-0.0003,0.0003]);
        for j4444664=1:2
            if SS444466==j4444664
                SS444466=SSO4444664(j4444664,:);
            end
        end
    end
    
    %%
    SSO4755231=[double('IYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        double('IYQAGSTPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLSYRPTYVGXXXXXXXXXXXXX')
        double('IYQAGSTPNGVEGNCYFLSYQPTNVGYQVVVLSFELLHA')
        double('IYQAGSKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLSYXXXXXXXXVVVLSFELLHA')
        double('IYQAGSTPNGVEGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLPYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVVGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXVGHQVVVLSFELLHA')
        double('IYQAGNRPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXVVVLSFELLHA')
        double('IYQAGNKPNGVEGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLSYRPTYVGYQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXHA')
        double('IYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFEFLHA')
        double('XYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHX')
        double('IYQAGNKPNGVSGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGSTPNGVEGNCYFLSYQPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYSLSYRPTYVGHQVVVLSFELLHA')];
    
    SSO5255311=[double('ATK')
        double('XXX')
        double('XXK')];
    
    SSO4364381=[double('VIA')
        double('XXX')];
    if S149==double('N')
        SS475523=randsrc(1,1,[1:23;0.980337441,0.009618481,0.001716189,0.001711588,0.001451629,0.000644146,0.000623441,0.000584333,0.000480809,0.000409493,0.000384187,0.000255358,0.000250757,0.000234653,0.000186342,0.000184042,0.000151834,0.000142632,0.000140332,0.000135731,0.00013113,0.000115026,0.000110425]);
        for j4755231=1:23
            if SS475523==j4755231
                SS475523=SSO4755231(j4755231,:);
            end
        end
        SS525531=randsrc(1,1,[1:3;0.98,0.012,1-0.98-0.012]);
        for j5255311=1:3
            if SS525531==j5255311
                SS525531=SSO5255311(j5255311,:);
            end
        end
        SS436438=randsrc(1,1,[1:2;0.987,1-0.987]);
        for j4364381=1:2
            if SS436438==j4364381
                SS436438=SSO4364381(j4364381,:);
            end
        end
    end
    %%
    SSO5255312=[double('AXK')
        double('AXX')
        double('PTK')
        double('ATX')
        double('XXX')
        double('XXK')
        double('ATK')];
    
    SSO4364382=[double('VXX')
        double('VIS')
        double('VIX')
        double('XXX')
        double('VIA')];
    
    if SS475523==double('IYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        S149=randsrc(1, 1,[double('N'),double('X');0.995,0.005]);
        SS525531=randsrc(1,1,[1:7;0.000108707,0.000181966,0.00071605,0.001207595,0.003407735,0.003575522,1-0.000108707-0.000181966-0.00071605-0.001207595-0.003407735-0.003575522]);
        for j5255312=1:7
            if SS525531==j5255312
                SS525531=SSO5255312(j5255312,:);
            end
        end
        SS436438=randsrc(1,1,[1:5;0.000141792,0.000219778,0.00053881,0.010629675,1-0.000141792-0.000219778-0.00053881-0.010629675]);
        for j4364382=1:5
            if SS436438==j4364382
                SS436438=SSO4364382(j4364382,:);
            end
        end
    end
    %%
    SSO4755232=[double('IYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        double('IYQAGSTPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGSTPNGVEGNCYFLSYQPTNVGYQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLSYXXXXXXXXVVVLSFELLHA')
        double('IYQAGSKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXA')
        double('IYQAGSTPNGVEGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLPYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVVGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXVGHQVVVLSFELLHA')
        double('IYQAGNRPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLSYRPTYVGXXXXXXXXXXXXX')
        double('IYQAGNKPNGVAGNCYFLSYRPTYVGYQVVVLSFELLHA')
        double('IYQAGNKPNGVEGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXHA')
        double('IYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFEFLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXFELLHA')
        double('IYQAGNKPNGVSGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXLHA')
        double('XYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGSTPNGVEGNCYFLSYQPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYSLSYRPTYVGHQVVVLSFELLHA')];
    
    SSO4364383=[double('VIA')
        double('XXX')
        double('VIX')
        double('VIS')
        double('VXX')];
    
    if SS525531==double('ATK')
        S149=randsrc(1, 1,[double('N'),double('X');0.9926,1-0.9926]);
        SS475523=randsrc(1,1,[1:25;0.984138529,0.006068108,0.001746067,0.001466324,0.001030389,0.00064807,0.000634086,0.000592124,0.000491883,0.000438265,0.000359004,0.000261094,0.000249438,0.000242445,0.000200483,0.000184165,0.00017484,0.000167846,0.000163184,0.000135209,0.000132878,0.000125885,0.000121222,0.00011656,0.000111898]);
        for j4755232=1:25
            if SS475523==j4755232
                SS475523=SSO4755232(j4755232,:);
            end
        end
        SS436438=randsrc(1,1,[1:5;0.986793764,0.012252776,0.000550163,0.000216801,0.000186496]);
        for j4364383=1:5
            if SS436438==j4364383
                SS436438=SSO4364383(j4364383,:);
            end
        end
    end
    %%
    SSO4755233=[double('IYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
        double('IYQAGSTPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLSYRPTYVGXXXXXXXXXXXXX')
        double('IYQAGSTPNGVEGNCYFLSYQPTNVGYQVVVLSFELLHA')
        double('IYQAGSKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXA')
        double('IYQAGSTPNGVEGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLSYXXXXXXXXVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLPYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVVGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNRPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXVVVLSFELLHA')
        double('IYQAGNKPNGVEGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLSYRPTYVGYQVVVLSFELLHA')
        double('IYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHX')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXHA')
        double('IYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFEFLHA')
        double('IYQAGNKPNGVSGNCYFLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXELLHA')
        double('IYQAGSTPNGVEGNCYFLSYQPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXFELLHA')
        double('IYQAGNKPNGVAGNCXXXXXXXXXXXXXXXXXXXXXXXX')
        double('IYQAGNKPNGVAGNCYSLSYRPTYVGHQVVVLSFELLHA')
        double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXLHA')];
    
    SSO5255313=[double('ATK')
        double('XXX')
        double('XXK')
        double('ATX')
        double('XTK')
        double('PTK')
        double('AXX')
        double('AXK')];
    
    if SS436438==double('VIA')
        S149=randsrc(1, 1,[double('N'),double('X');]);
        SS475523=randsrc(1,1,[1:26;0.976250782,0.013456197,0.001727048,0.001519248,0.001454599,0.00064418,0.000611855,0.000579531,0.000574913,0.000464086,0.000408673,0.000251669,0.000223962,0.0002078,0.00018702,0.000184711,0.000154695,0.000147769,0.000143151,0.000131607,0.000126989,0.000115444,0.000110827,0.000108518,0.000108518,0.000106209]);
        for j4755233=1:26
            if SS475523==j4755233
                SS475523=SSO4755233(j4755233,:);
            end
        end
        SS525531=randsrc(1,1,[1:8;0.977372902,0.013853326,0.004721675,0.001715503,0.001050544,0.000690357,0.000482558,0.000113135]);
        for j5255313=1:8
            if SS525531==j5255313
                SS525531=SSO5255313(j5255313,:);
            end
        end
    end
    %%
    SSS149531=[S149,SS436438,SS475523,SS525531];
    SSS444688=[SS444466,S449,SS447474,S499,S688];
    %%

    %%
    SSSO149531=[double('NVIAIYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAATK')
        double('NVIAIYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAXXK')
        double('NVIAIYQAGSTPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAATK')
        double('NVIAIYQAGSTPNGVEGNCYFLSYQPTNVGYQVVVLSFELLHAATK')
        double('NVIAIYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAXXX')
        double('NVIAIYQAGNKPNGVAGNCYFLSYRPTYVGXXXXXXXXXXXXXXXX')
        double('NVIAIYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAATX')
        double('NXXXIYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAATK')
        double('NVIAIYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAPTK')
        double('NVIAIYQAGSKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAATK')
        double('NVIAIYQAGSTPNGVEGNCYFLSYRPTYVGHQVVVLSFELLHAATK')
        double('NVIAIYQAGNKPNGVAGNCYFLPYRPTYVGHQVVVLSFELLHAATK')
        double('NVIAIYQAGNKPNGVVGNCYFLSYRPTYVGHQVVVLSFELLHAATK')
        double('XVIAIYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAATK')
        double('NVIAIYQAGNRPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAATK')
        double('NVISIYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAATK')
        double('NVIAIYQAGNKPNGVAGNCYFLSYRPTYVGXXXXXXXXXXXXXXTK')];
    if SSS444688==double('LDSVGNYYYLFKSNLKPGKNFRISTEGR')
        SSS149531=randsrc(1,1,[1:17;0.984912444,0.003511589,0.001827009,0.001539697,0.001488128,0.001323599,0.000822645,0.000709685,0.000704774,0.000675306,0.000613914,0.000473942,0.000397816,0.000319235,0.0002603,0.000218553,0.000201364]);
        for j149531=1:17
            if SSS149531==j149531
                SSS149531=SSSO149531(j149531,:);
            end
        end
    end
        SSSO444688=[double('LDSVGNYYYLFKSNLKPGKNFRISTEGR')
        double('LDSVGNYYYLFKSNLKPGKNFRISTEGX')
        double('LDSVGNYYYLFKSNLKPSKNFRISTESR')
        double('LDSVGNYYYLFKSNLKPGKDFRISTEGR')
        double('LDSVGNYYYLFKSNLKPGRNFRISTEGR')
        double('LDSVGNYYYLFKSKLKPGTNFRISTEGR')
        double('LDSVGNYYYLFKSNLKPGNNFRISTEGR')
        double('LDSAGNYYYLFKSNLKPGKNFRISTEGR')
        double('LDSVGNYYYLFKSNLKPGTNFRISTEGR')
        double('LDSVGNYYYLFKSSLKPGKNFRISTEGR')
        double('LDSVGNYYYLFKSNLKPSKNFRISTEGR')
        double('LDSVGNYYYLFKSNLKPDKNFRISTEGR')
        double('LDSVGNYYYLFKSNLKPGMNFRISTEGR')
        double('LDSFGNYYYLFKSNLKPGKNFRISTEGR')
        double('LDSVGNYYYLFKSNIKPGKNFRISTEGR')
        double('LDSVGNYYYLFKSNLKPGKNFRISTESR')
        double('LDSVGNYYYLFKSNLKPGKNFXXXXXGR')
        double('LDSVGNNYYLFKSNLKPGKNFRISTEGR')
        double('LDSVGNYYYLFKSNLKPGXNFRISTEGR')
        double('LDSVGNYYYLFKSNLKPGKNFRISTQGR')];

    if SSS149531==double('NVIAIYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAATK')
        SSS444688=randsrc(1,1,[1:20;0.950244210,0.016,0.002913418,0.001765488,0.00167346,0.008445811,0.001305347,0.011186679,0.002888798,0.000467406,0.000426236,0.000273663,0.001244601,0.000237336,0.000201009,0.00016226,0.00016226,0.000145308,0.000140464,0.000116246]);
        for j444688=1:20
            if SSS444688==j444688
                SSS444688=SSSO444688(j444688,:);
            end
        end
    end
    %%
    if isequal([SSS149531, SSS444688],double('NVIAIYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAATKLDSVGNYYYLFKSNLKPGKNFRISTEGR'))||isequal([SSS149531, SSS444688],double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'))
        M{3}(while_flag,:)=[SSS149531, SSS444688];
        while_flag=while_flag+1;
    end
    
    if ~isequal([SSS149531, SSS444688],double('NVIAIYQAGNKPNGVAGNCYFLSYRPTYVGHQVVVLSFELLHAATKLDSVGNYYYLFKSNLKPGKNFRISTEGR'))&&~isequal([SSS149531, SSS444688],double('XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'))
        Record149688=[SSS149531, SSS444688];
        Record149688_1 = [ "S149","S436","S437","S438", "S475", "S476", "S477", "S478", "S479", "S480", "S481", "S482", "S484", "S485", "S486", "S487", "S488", "S490", "S491", "S492", "S493", "S495", "S497", "S498", "S501", "S502", "S503", "S504", "S506", "S507", "S508", "S509", "S513", "S514", "S515", "S516", "S517", "S518", "S519", "S520", "S521", "S522", "S523", "S525","S526","S531","S444","S445","S446","S448","S450","S451","S452","S454","S456","S458","S459","S461","S462","S463","S464","S465","S466","S449","S447","S453","S467","S469","S471","S472","S473","S474","S499","S688"];
        for ii149688=1:length(Record149688_1)
            eval([char(Record149688_1(ii149688)),'=Record149688(ii149688)']);
        end
        
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
       score149688 = obj.bilTrain('2149688',char(S149,S436,S437,S438,S475,S476,S477,S478,S479,S480,S481,S482,S484,S485,S486,S487,S488,S490,S491,S492,S493,S495,S497,S498,S501,S502,S503,S504,S506,S507,S508,S509,S513,S514,S515,S516,S517,S518,S519,S520,S521,S522,S523,S525,S526,S531)',char(S444,S445,S446,S448,S450,S451,S452,S454,S456,S458,S459,S461,S462,S463,S464,S465,S466,S449,S447,S453,S467,S469,S471,S472,S473,S474,S499,S688)');
     % score149688 = obj.bilTrain('22149688',char(S149),char(S436),char(S437),char(S438),char(S475),char(S476),char(S477),char(S478),char(S479),char(S480),char(S481),char(S482),char(S484),char(S485),char(S486),char(S487),char(S488),char(S490),char(S491),char(S492),char(S493),char(S495),char(S497),char(S498),char(S501),char(S502),char(S503),char(S504),char(S506),char(S507),char(S508),char(S509),char(S513),char(S514),char(S515),char(S516),char(S517),char(S518),char(S519),char(S520),char(S521),char(S522),char(S523),char(S525),char(S526),char(S531),char(S444),char(S445),char(S446),char(S448),char(S450),char(S451),char(S452),char(S454),char(S456),char(S458),char(S459),char(S461),char(S462),char(S463),char(S464),char(S465),char(S466),char(S449),char(S447),char(S453),char(S467),char(S469),char(S471),char(S472),char(S473),char(S474),char(S499),char(S688));

        
        if score149688 < 0
            if  a149==0
                S149=0;
            end
            if  a436==0
                S436=0;
            end
            if  a437==0
                S437=0;
            end
            if  a438==0
                S438=0;
            end
            if  a475==0
                S475=0;
            end
            if  a476==0
                S476=0;
            end
            if  a477==0
                S477=0;
            end
            if  a478==0
                S478=0;
            end
            if  a479==0
                S479=0;
            end
            if  a480==0
                S480=0;
            end
            if  a481==0
                S481=0;
            end
            if  a482==0
                S482=0;
            end
            if  a484==0
                S484=0;
            end
            if  a485==0
                S485=0;
            end
            if  a486==0
                S486=0;
            end
            if  a487==0
                S487=0;
            end
            if  a488==0
                S488=0;
            end
            if  a490==0
                S490=0;
            end
            if  a491==0
                S491=0;
            end
            if  a492==0
                S492=0;
            end
            if  a493==0
                S493=0;
            end
            if  a495==0
                S495=0;
            end
            if  a497==0
                S497=0;
            end
            if  a498==0
                S498=0;
            end
            if  a501==0
                S501=0;
            end
            if  a502==0
                S502=0;
            end
            if  a503==0
                S503=0;
            end
            if  a504==0
                S504=0;
            end
            if  a506==0
                S506=0;
            end
            if  a507==0
                S507=0;
            end
            if  a508==0
                S508=0;
            end
            if  a509==0
                S509=0;
            end
            if  a513==0
                S513=0;
            end
            if  a514==0
                S514=0;
            end
            if  a515==0
                S515=0;
            end
            if  a516==0
                S516=0;
            end
            if  a517==0
                S517=0;
            end
            if  a518==0
                S518=0;
            end
            if  a519==0
                S519=0;
            end
            if  a520==0
                S520=0;
            end
            if  a521==0
                S521=0;
            end
            if  a522==0
                S522=0;
            end
            if  a523==0
                S523=0;
            end
            if  a525==0
                S525=0;
            end
            if  a526==0
                S526=0;
            end
            if  a531==0
                S531=0;
            end
            if  a444==0
                S444=0;
            end
            if  a445==0
                S445=0;
            end
            if  a446==0
                S446=0;
            end
            if  a448==0
                S448=0;
            end
            if  a450==0
                S450=0;
            end
            if  a451==0
                S451=0;
            end
            if  a452==0
                S452=0;
            end
            if  a454==0
                S454=0;
            end
            if  a456==0
                S456=0;
            end
            if  a458==0
                S458=0;
            end
            if  a459==0
                S459=0;
            end
            if  a461==0
                S461=0;
            end
            if  a462==0
                S462=0;
            end
            if  a463==0
                S463=0;
            end
            if  a464==0
                S464=0;
            end
            if  a465==0
                S465=0;
            end
            if  a466==0
                S466=0;
            end
            if  a449==0
                S449=0;
            end
            if  a447==0
                S447=0;
            end
            if  a453==0
                S453=0;
            end
            if  a467==0
                S467=0;
            end
            if  a469==0
                S469=0;
            end
            if  a471==0
                S471=0;
            end
            if  a472==0
                S472=0;
            end
            if  a473==0
                S473=0;
            end
            if  a474==0
                S474=0;
            end
            if  a499==0
                S499=0;
            end
            if  a688==0
                S688=0;
            end
            continue
        end
        
        if score149688>=0
            M{3}(while_flag,:)=[S149,S436,S437,S438,S475,S476,S477,S478,S479,S480,S481,S482,S484,S485,S486,S487,S488,S490,S491,S492,S493,S495,S497,S498,S501,S502,S503,S504,S506,S507,S508,S509,S513,S514,S515,S516,S517,S518,S519,S520,S521,S522,S523,S525,S526,S531,S444,S445,S446,S448,S450,S451,S452,S454,S456,S458,S459,S461,S462,S463,S464,S465,S466,S449,S447,S453,S467,S469,S471,S472,S473,S474,S499,S688];
            while_flag=while_flag+1;
        end
    end
    [S149,S436,S437,S438,S475,S476,S477,S478,S479,S480,S481,S482,S484,S485,S486,S487,S488,S490,S491,S492,S493,S495,S497,S498,S501,S502,S503,S504,S506,S507,S508,S509,S513,S514,S515,S516,S517,S518,S519,S520,S521,S522,S523,S525,S526,S531,S444,S445,S446,S448,S450,S451,S452,S454,S456,S458,S459,S461,S462,S463,S464,S465,S466,S449,S447,S453,S467,S469,S471,S472,S473,S474,S499,S688]=deal(0);
    [a149,a436,a437,a438,a475,a476,a477,a478,a479,a480,a481,a482,a484,a485,a486,a487,a488,a490,a491,a492,a493,a495,a497,a498,a501,a502,a503,a504,a506,a507,a508,a509,a513,a514,a515,a516,a517,a518,a519,a520,a521,a522,a523,a525,a526,a531,a444,a445,a446,a448,a450,a451,a452,a454,a456,a458,a459,a461,a462,a463,a464,a465,a466,a449,a447,a453,a467,a469,a471,a472,a473,a474,a499,a688]=deal(1);
end

%%  Paragraph 4
while_flag = 1;
[S349,S661]=deal(0);
[a349,a661]=deal(1);
%S349=The amino acid at site 346
%S661=The amino acid at site 658
while while_flag <= num
    if S349==0
        S349=randsrc(1,1,[double('R'),double('T'),100;pn(80:80,:)*alpha,(1-pn(80:80,:))*alpha,1-alpha]);
    end
    if S661==0
        S661=randsrc(1,1,[double('N'),double('S'),100;pn(81:81,:)*alpha,(1-pn(81:81,:))*alpha,1-alpha]);
    end
    if S349==100
        S349=randsrc(1,1,[double('E'),double('S'),double('I'),double('K'),double('T'),double('G');7/15579,206/15579,376/15579,1522/15579,13464/15579,4/15579,]);
        a349=0;
    end
    if S661==100
        S661=randsrc(1,1,[double('Y'),double('S'),double('I'),double('D'),double('K'),double('T');1/16794,16773/16794,6/16794,4/16794,9/16794,1/16794]);
        a661=0;
    end
    if S349==double('R')
        S661=randsrc(1,1,[double('N'),double('S'),88;0.987,0.013,1-0.013-0.987]);
    end
    if S661==double('N')
        S349=randsrc(1,1,[double('R'),double('T'),88;0.97,1-0.97-0.01,0.01]);
    end
    
    if isequal([S349,S661],double('RN'))||isequal([S349,S661],double('XX'))
        M{4}(while_flag,:)=[S349,S661];
        while_flag=while_flag+1;
    end
    
    if ~isequal([S349,S661],double('RN'))&&~isequal([S349,S661],double('XX'))
        
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score349661= obj.bilTrain('2349661',char(S349),char(S661));
        if score349661 < 0
            if  a349==0
                S349=0;
            end
            if a661==0
                S661=0;
            end
            continue
        end
        
        if score349661>=0
            M{4}(while_flag,:)=[S349,S661];
            while_flag=while_flag+1; 
        end
    end
    [S349,S661]=deal(0);
    [a349,Sa661]=deal(1);
    
end

%%  Paragraph 5
while_flag = 1;
S411 = 0;
a411 = 1;
%S411=The amino acid at site 408
while while_flag <= num
    if S411==0
        S411=randsrc(1,1,[double('S'),double('R'),88,100;pn(82:82,:)*alpha,(1-pn(82:82,:)-0.01)*alpha,0.01*alpha,1-alpha]);
    end
    if S411==100
        S411=double('S');
        a411=0;
    end
    if S411==double('R') || S411==88
        M{5}(while_flag,:)=[S411];
        while_flag=while_flag+1;
    end
    if (S411~=double('R')) && (S411~=88)
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score411 = obj.bilTrain('2411',char(S411));
        if score411<0
            if a411==0
                S411=0;
            end
            continue
        end
        if score411>=0
            M{5}(while_flag,:)=[S411];
            a411 = 1;
            while_flag=while_flag+1;
        end
    end
    S411 = 0;
end

%% Paragraph 6
while_flag = 1;
S443 = 0;
a443 = 1;
%S443=The amino acid at site 440
while while_flag <= num
    if S443==0
        S443=randsrc(1,1,[double('K'),double('N'),88,100;pn(83:83,:)*alpha,(1-pn(83:83,:)-0.0366)*alpha,0.0366*alpha,1-alpha]);
    end
    if S443==100
        S443=randsrc(1,1,[double('K')]);
        a443=0;
    end
    if S443==double('N') || S443==88
        M{6}(while_flag,:)=[S443];
        while_flag=while_flag+1;
    end
    if (S443~=double('N')) && (S443~=88)
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score443 = obj.bilTrain('2443',char(S443));
        if score443<0
            if a443==0
                S443=0;
            end
            continue
        end   
        if score443>=0
            M{6}(while_flag,:)=[S443];
            a443 = 1;
            while_flag=while_flag+1;
        end
    end
    S443 = 0;
end 

%% Paragraph 7
while_flag = 1;
S455 = 0;
a455 = 1;
%S455=The amino acid at site 452
while while_flag <= num
    if S455==0
    S455=randsrc(1,1,[double('R'),double('L'),double('M'),double('Q'),88,100;pn(84:84,:)*h,(1-pn(84:84,:)-0.0328-0.231-0.005)*h,0.005*h,0.231*h,0.0328*h,1-h]);
    end
    if S455==100
  S455=randsrc(1,1,[double('R'),double('Q'),double('H'),double('K'),double('M');204578/330046,122931/330046,1/330046,6/330046,2530/330046]);
    a455=0;
    end
     if S455==double('L') || S455==88
        M{7}(while_flag,:)=[S455];
        while_flag=while_flag+1;
    end
    if (S455~=double('L')) && (S455~=88)
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score455 = obj.bilTrain('2455',char(S455));
        if score455<0
            if a455==0
                S455=0;
            end
            continue
        end   
        if score455>=0
            M{7}(while_flag,:)=[S455];
            a455 = 1;
            while_flag=while_flag+1;
        end
    end
    S455 = 0;
end 

MMcom = [];
for i=1:7
    MMcom = [MMcom, M{i}];
end
MMMcom=[];

for iiii=1:num
 Recordall=[MMcom(iiii,:)];
        Recordall_1 = ["S69","S70","S489","S496","S76","S149","S436","S437","S438", "S475", "S476", "S477", "S478", "S479", "S480", "S481", "S482", "S484", "S485", "S486", "S487", "S488", "S490", "S491", "S492", "S493", "S495", "S497", "S498", "S501", "S502", "S503", "S504", "S506", "S507", "S508", "S509", "S513", "S514", "S515", "S516", "S517", "S518", "S519", "S520", "S521", "S522", "S523", "S525","S526","S531","S444","S445","S446","S448","S450","S451","S452","S454","S456","S458","S459","S461","S462","S463","S464","S465","S466","S449","S447","S453","S467","S469","S471","S472","S473","S474","S499","S688","S349","S661","S411","S443","S455"];
        for iiall=1:length(Recordall_1)
            eval([char(Recordall_1(iiall)),'=Recordall(iiall)']);
        end
MMMcom(iiii,:)=[double('QCVNLITRTQXXXSYTNSFTRGVYYPDKVFRSSVLHSTQDLFLPFFSNVTWFHAI'),S69,S70,double('SGTNG'),S76,double('KRFDNPVLPFNDGVYFASTEKSNIIRGWIFGTTLDSKTQSLLIVNNATNVVIKVCEFQFCNDPFLDVYYHKN'),S149,double('KSWMESEFRVYSSANNCTFEYVSQPFLMDLEGKQGNFKNLREFVFKNIDGYFKIYSKHTPINLGRDLPQGFSALEPLVDLPIGINITRFQTLLALHRSYLTPGDSSSGWTAGAAAYYVGYLQPRTFLLKYNENGTITDAVDCALDPLSETKCTLKSFTVEKGIYQTSNFRVQPTESIVRFPNITNLCPFDEVFNAT'),S349,double('FASVYAWNRKRISNCVADYSVLYNFAPFFAFKCYGVSPTKLNDLCFTNVYADSFVIRGNEV'),S411,double('QIAPGQTGNIADYNYKLPDDFTGC'),S436,S437,S438,double('WNSN'),S443,S444,S445,S446,S447,S448,S449,S450,S451,S452,S453,S454,S455,S456,double('R'),S458,S459,double('R'),S461,S462,S463,S464,S465,S466,S467,double('E'),S469,double('D'),S471,S472,S473,S474,S475,S476,S477,S478,S479,S480,S481,S482,double('C'),S484,S485,S486,S487,S488,S489,S490,S491,S492,S493,double('P'),S495,S496,S497,S498,S499,double('F'),S501,S502,S503,S504,double('G'),S506,S507,S508,S509,double('PYR'),S513,S514,S515,S516,S517,S518,S519,S520,S521,S522,S523,double('P'),S525,S526,double('VCGP'),S531,double('KSTNLVKNKCVNFNFNGLTGTGVLTESNKKFLPFQQFGRDIADTTDAVRDPQTLEILDITPCSFGGVSVITPGTNTSNQVAVLYQGVNCTEVPVAIHADQLTPTWRVYSTGSNVFQTRAGCLIGAEYVN'),S661,double('SYECDIPIGAGICASYQTQTKSHRRA'),S688];        
end

MMu=unique(MMMcom,'rows');

[C7,~,n7]=unique(MMMcom,'rows');
s7=sum(bsxfun(@eq,n7,unique(n7)'));
CH7= [];
CH7=[C7 s7.'];

CHH = cell(1,7);
for i=1:7
    [C11,~,n11]=unique(M{i},'rows');
    s11=sum(bsxfun(@eq,n11,unique(n11)'));
    CHH{i} = [];
    CHH{i}=[C11 s11.'];
end

[c123, ia123, ib123] = intersect(dataset2(:,1:672),CH7(:,1:672),'rows');
dd=CH7(ib123,673);
sumdd=sum(dd);
