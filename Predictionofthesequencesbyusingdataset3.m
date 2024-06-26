num=10000;  %% The generation times
alpha=0.5;  %% The mutation frequency of the hotspots=1-0.5=0.5
h=0.1;%% The mutation frequency of the more mutable hotspots=1-0.1=0.9

M = cell(1,11);
for i=1:11
    M{i} = [];
end

%%%1 (27,145)
while_flag = 1;
[S27,S145]=deal(0);
[a27,a145]=deal(1);
while while_flag <= num
    if S27==0
        S27=randsrc(1,1,[double('S'),double('X'),100;pn3(1:1,:)*alpha,(1-pn3(1:1,:))*alpha,1-alpha]);
    end
    if S145==0
        S145=randsrc(1,1,[double('Y'),double('X'),100;pn3(2:2,:)*alpha,(1-pn3(2:2,:))*alpha,1-alpha]);
    end
    
    
    if S27==100
        S27=randsrc(1,1,[double('A'),double('L');0.8,0.2]);
        a27=0;
    end
    if S145==100
        S145=randsrc(1,1,[double('S'),double('L'),double('D'),double('H'),double('Q'),double('F'),double('K'),double('N');0.058139535,0.11627907,0.38372093,0.209302326,0.151162791,0.046511628,0.023255814,0.011627907]);
        a145=0;
    end
    
    if S27 == double('S')
        S145=randsrc(1, 1,[double('Y'),double('X');0.994 ,0.006]);
    end
    if S145 == double('Y')
        S27=randsrc(1, 1,[double('S'),double('X'); 0.99, 1-0.99]);
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if isequal([S27,S145],double('SY'))||isequal([S27,S145],double('XX'))
        M{1}(while_flag,:)=[S27,S145];
        while_flag=while_flag+1;
    end
    
    if ~isequal([S27,S145],double('SY'))&&~isequal([S27,S145],double('XX'))
        Record27145=[S27,S145];
        Record27145_1 = ["S27","S145"];
        for ii27145=1:length(Record27145_1)
            eval([char(Record27145_1(ii27145)),'=Record27145(ii27145)']);
        end
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score27145 = obj.bilTrain('427145', char(S27)', char(S145)');
        
        if score27145 < 0
            if  a27==0
                S27=0;
            end
            if a145==0
                S145=0;
            end
            continue
        end
        
        if score27145>=0
            M{1}(while_flag,:)=[S27,S145];
            while_flag=while_flag+1;
        end
    end
    
    [S27,S145]=deal(0);
    [a27,a145]=deal(1);
end

%%%2 (52)
while_flag = 1;
[S52]=deal(0);
[a52]=deal(1);
while while_flag <= num
    if S52==0
        S52=randsrc(1,1,[double('Q'),double('H'),100;pn3(3:3,:)*h,(1-pn3(3:3,:))*h,1-h]);
    end
    
    if S52==100
        S52=randsrc(1,1,[double('H'),double('Y'),double('R');0.998775323,0.000459254,0.000765423]);
        a52=0;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if S52==double('Q') || S52==double('X')
        M{2}(while_flag,:)=[S52];
        while_flag=while_flag+1;
    end
    
    if (S52~=double('Q')) && (S52~=double('X'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score52 = obj.bilTrain('452',char(S52));
        if score52<0
            if a52==0
                S52=0;
            end
            continue
        end
        if score52>=0
            M{2}(while_flag,:)=[S52];
            while_flag=while_flag+1;
        end
    end
    [S52]=deal(0);
    [a52]=deal(1);
end

%%%3 (157,452)
while_flag = 1;
[S157,S452]=deal(0);
[a157,a452]=deal(1);
while while_flag <= num
    if S157==0
        S157=randsrc(1,1,[double('F'),double('L'),100;pn3(4:4,:)*alpha,(1-pn3(4:4,:))*alpha,1-alpha]);
    end
    if S452==0
        S452=randsrc(1,1,[double('L'),double('R'),100;pn3(5:5,:)*alpha,(1-pn3(5:5,:))*alpha,1-alpha]);
    end
    
    if S157==100
        S157=randsrc(1,1,[double('S'),double('L');0.003, 1-0.003]);
        a157=0;
    end
    if S452==100
        S452=randsrc(1,1,[double('R'),double('W'),double('M'),double('Q');0.97,0.005,0.0035,1-0.97-0.005-0.0035]);
        a452=0;
    end
    
    if S157 == double('F')
        S452=randsrc(1, 1,[double('L'),double('R'),double('X'),double('Q'),double('M'),double('W');0.991,0.002, 0.003,0.002, 0.00036, 1-0.991-0.002-0.003-0.002-0.00036]);
    end
    if S157 == double('L')
        S452=randsrc(1, 1,[double('L'),double('Q'),double('R'),double('X'),double('W'); 0.181,0.00026,0.81,0.004 ,1-0.181-0.00026-0.81-0.004]);
    end
    if S452 == double('L')
        S157=randsrc(1, 1,[double('F'),double('L'),double('S'); 0.97,0.023,1-0.97-0.023]);
    end
    if S452 == double('R')
        S157=randsrc(1, 1,[double('F'),double('L'),double('X'); 0.0199, 0.977,1-0.0199-0.977]);
    end
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if isequal([S157,S452],double('FL'))||isequal([S157,S452],double('XX'))
        M{3}(while_flag,:)=[S157,S452];
        while_flag=while_flag+1;
    end
    
    if ~isequal([S157,S452],double('FL'))&&~isequal([S157,S452],double('XX'))
        Record157452=[S157,S452];
        Record157452_1 = ["S157","S452"];
        for ii157452=1:length(Record157452_1)
            eval([char(Record157452_1(ii157452)),'=Record157452(ii157452)']);
        end
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score157452 = obj.bilTrain('4157452', char(S157)', char(S452)');
        
        if score157452 < 0
            if  a157==0
                S157=0;
            end
            if a452==0
                S452=0;
            end
            continue
        end
        
        if score157452>=0
            M{3}(while_flag,:)=[S157,S452];
            while_flag=while_flag+1;
        end
    end
    
    [S157,S452]=deal(0);
    [a157,a452]=deal(1);
end

%%%4 (180)
while_flag = 1;
[S180]=deal(0);
[a180]=deal(1);
while while_flag <= num
    if S180==0
        S180=randsrc(1,1,[double('E'),double('V'),100;pn3(6:6,:)*h,(1-pn3(6:6,:))*h,1-h]);
    end
    
    if S180==100
        S180=randsrc(1,1,[double('V'),double('D'),double('Q'),double('K'),double('L'),double('G'),double('I');0.995184018,0.004043047,0.000237826,0.00017837,0.000118913,0.00017837,5.94566E-05]);
        a180=0;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if S180==double('E') || S180==double('X')
        M{4}(while_flag,:)=[S180];
        while_flag=while_flag+1;
    end
    
    if (S180~=double('E')) && (S180~=double('X'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score180 = obj.bilTrain('4180',char(S180));
        if score180<0
            if a180==0
                S180=0;
            end
            continue
        end
        if score180>=0
            M{4}(while_flag,:)=[S180];
            while_flag=while_flag+1;
        end
    end
    [S180]=deal(0);
    [a180]=deal(1);
end

%%%5 (252,253)
while_flag = 1;
[S252,S253]=deal(0);
[a252,a253]=deal(1);
while while_flag <= num
    if S252==0
        S252=randsrc(1,1,[double('V'),double('G'),100;pn3(7:7,:)*alpha,(1-pn3(7:7,:))*alpha,1-alpha]);
    end
    if S253==0
        S253=randsrc(1,1,[double('D'),double('G'),100;pn3(8:8,:)*alpha,(1-pn3(8:8,:))*alpha,1-alpha]);
    end
    
    
    if S252==100
        S252=randsrc(1,1,[double('A'),double('D'),double('F'),double('V'),double('I');1.63905E-05,0.000163905,6.55619E-05,0.999541066,0.000213076]);
        a252=0;
    end
    if S253==100
        S253=randsrc(1,1,[double('S'),double('A'),double('Y'),double('D'),double('N'),double('W'),double('E'),double('V'),double('B');1.62493E-05,0.000113745,0.000113745,0.999577517,1.62493E-05,1.62493E-05,0.000113745,1.62493E-05,1.62493E-05]);
        a253=0;
    end
    
    if S252 == double('V')
        S253=randsrc(1, 1,[double('D'),double('G');0.9949 , 1-0.9949]);
    end
    if S253 == double('D')
        S252=randsrc(1, 1,[double('V'),double('G');0.986 , 1-0.986]);
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if isequal([S252,S253],double('GG'))||isequal([S252,S253],double('XX'))
        M{5}(while_flag,:)=[S252,S253];
        while_flag=while_flag+1;
    end
    
    if ~isequal([S252,S253],double('GG'))&&~isequal([S252,S253],double('XX'))
        Record252253=[S252,S253];
        Record252253_1 = ["S252","S253"];
        for ii252253=1:length(Record252253_1)
            eval([char(Record252253_1(ii252253)),'=Record252253(ii252253)']);
        end
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score252253 = obj.bilTrain('4252253', char(S252)', char(S253)');
        
        if score252253 < 0
            if  a252==0
                S252=0;
            end
            if a253==0
                S253=0;
            end
            continue
        end
        
        if score252253>=0
            M{5}(while_flag,:)=[S252,S253];
            while_flag=while_flag+1;
        end
    end
    
    [S252,S253]=deal(0);
    [a252,a253]=deal(1);
end

%%%6 (521)
while_flag = 1;
[S521]=deal(0);
[a521]=deal(1);
while while_flag <= num
    if S521==0
        S521=randsrc(1,1,[double('P'),double('S'),double('T'),100;pn3(9:9,:)*alpha,0.1*alpha,(1-0.1-pn3(9:9,:))*alpha,1-alpha]);
    end
    
    if S521==100
        S521=randsrc(1,1,[double('S'),double('A'),double('L'),double('Q'),double('T');0.721626016,0.000108401,0.000542005,0.012140921,1-0.721626016-0.000108401-0.000542005-0.012140921]);
        a521=0;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if S521==double('P') || S521==double('X')
        M{6}(while_flag,:)=[S521];
        while_flag=while_flag+1;
    end
    
    if (S521~=double('P')) && (S521~=double('X'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score521 = obj.bilTrain('4521',char(S521));
        if score521<0
            if a521==0
                S521=0;
            end
            continue
        end
        if score521>=0
            M{6}(while_flag,:)=[S521];
            while_flag=while_flag+1;
        end
    end
    [S521]=deal(0);
    [a521]=deal(1);
end

%%%7 (410437)
[S410,S411,S412,S413,S414,S415,S416,S418,S420,S421,S427,S428,S430,S433,S434,S435,S417]=deal(0);
[a410,a411,a412,a413,a414,a415,a416,a418,a420,a421,a427,a428,a430,a433,a434,a435,a417]=deal(1);
while_flag = 1;
while while_flag <= num
    if S410==0
        S410=randsrc(1,1,[double('I'),88,100;pn3(10:10,:)*alpha,(1-pn3(10:10,:))*alpha,1-alpha]);
    end
    
    if S411==0
        S411=randsrc(1,1,[double('A'),88,100;pn3(11:11,:)*alpha,(1-pn3(11:11,:))*alpha,1-alpha]);
    end
    if S412==0
        S412=randsrc(1,1,[double('P'),88,100;pn3(12:12,:)*alpha,(1-pn3(12:12,:))*alpha,1-alpha]);
    end
    if S413==0
        S413=randsrc(1,1,[double('G'),88,100;pn3(13:13,:)*alpha,(1-pn3(13:13,:))*alpha,1-alpha]);
    end
    if S414==0
        S414=randsrc(1, 1,[double('Q'),double('X'),100;pn3(14:14,:)*alpha,(1-pn3(14:14,:))*alpha,1-alpha]);
    end
    if S415==0
        S415=randsrc(1, 1,[double('T'),double('X'),100;pn3(15:15,:)*alpha,(1-pn3(15:15,:))*alpha,1-alpha]);
    end
    if S416==0
        S416=randsrc(1, 1,[double('G'),double('X'),100;pn3(16:16,:)*alpha,(1-pn3(16:16,:))*alpha,1-alpha]);
    end
    if S418==0
        S418=randsrc(1, 1,[double('I'),double('X'),100;pn3(17:17,:)*alpha,(1-pn3(17:17,:))*alpha,1-alpha]);
    end
    if S420==0
        S420=randsrc(1, 1,[double('D'),double('X'),100;pn3(18:18,:)*alpha,(1-pn3(18:18,:))*alpha,1-alpha]);
    end
    if S421==0
        S421=randsrc(1, 1,[double('Y'),double('X'),100;pn3(19:19,:)*alpha,(1-pn3(19:19,:))*alpha,1-alpha]);
    end
    if 427==0
        S427=randsrc(1, 1,[double('D'),double('X'),100;pn3(20:20,:)*alpha,(1-pn3(20:20,:))*alpha,1-alpha]);
    end
    if S428==0
        S428=randsrc(1, 1,[double('D'),double('X'),100;pn3(21:21,:)*alpha,(1-pn3(21:21,:))*alpha,1-alpha]);
    end
    if S430==0
        S430=randsrc(1, 1,[double('T'),double('X'),100;pn3(22:22,:)*alpha,(1-pn3(22:22,:))*alpha,1-alpha]);
    end
    if S433==0
        S433=randsrc(1, 1,[double('V'),double('X'),100;pn3(23:23,:)*alpha,(1-pn3(23:23,:))*alpha,1-alpha]);
    end
    if S434==0
        S434=randsrc(1, 1,[double('I'),double('X'),100;pn3(24:24,:)*alpha,(1-pn3(24:24,:))*alpha,1-alpha]);
    end
    if S435==0
        S435=randsrc(1, 1,[double('A'),double('X'),100;pn3(25:25,:)*alpha,(1-pn3(25:25,:))*alpha,1-alpha]);
    end
    
    if S417==0
        S417=randsrc(1, 1,[double('N'),double('X'),100;pn3(26:26,:)*alpha,(1-pn3(26:26,:))*alpha,1-alpha]);
    end
    
    
    if S410==100
        S410=randsrc(1,1,[double('V');1]);
        a410=0;
    end
    if S411==100
        S411=randsrc(1,1,[double('S'),double('V'),double('G'),double('T');0.688888889,0.133333333,0.155555556, 1-0.688888889-0.133333333-0.155555556]);
        a411=0;
    end
    if S412==100
        S412=randsrc(1,1,[double('Q');1]);
        a412=0;
    end
    if S413==100
        S413=randsrc(1,1,[double('A');1]);
        a413=0;
    end
    if S414==100
        S414=randsrc(1,1,[double('R');1]);
        a414=0;
    end
    if S415==100
        S415=randsrc(1,1,[double('N');1]);
        a415=0;
    end
    if S416==100
        S416=randsrc(1, 1,[double('R');1]);
        a416=0;
    end
    if S418==100
        S418=randsrc(1, 1,[double('V');1]);
        a418=0;
    end
    if S420==100
        S420=randsrc(1, 1,[double('Y'),double('N');0.142857143, 1-0.142857143]);
        a420=0;
    end
    if S421==100
        S421=randsrc(1, 1,[double('F');1]);
        a421=0;
    end
    if S427==100
        S427=randsrc(1, 1,[double('A'),double('Y'),double('G');0.111111111, 0.555555556,1-0.111111111-0.555555556]);
        a427=0;
    end
    if S428==100
        S428=randsrc(1, 1,[double('Y'),double('H'),double('G');0.33333,0.33333,1-0.33333-0.33333]);
        a428=0;
    end
    if S430==100
        S430=randsrc(1, 1,[double('S'),double('I'),double('P');0.075,0.75,1-0.75-0.075]);
        a430=0;
    end
    if S433==100
        S433=randsrc(1, 1,[double('I'); 1]);
        a433=0;
    end
    if S434==100
        S434=randsrc(1, 1,[double('M'),double('V');0.1,0.9]);
        a434=0;
    end
    if S435==100
        S435=randsrc(1, 1,[double('S'),double('T');0.6,0.4]);
        a435=0;
    end
    if S417==100
        S417=randsrc(1, 1,[double('S'),double('D'),double('K'),double('I');0.002936858,0.001468429,0.994126285,0.001468429]);
        a417=0;
    end
    
    %%%411435%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   if S411 == double('A')
   S412=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
   S413=randsrc(1, 1,[double('G'),double('X');0.9989777585031906, 1-0.9989777585031906]);
   S414=randsrc(1, 1,[double('Q'),double('X');0.998544080292423, 1-0.998544080292423]);
   S415=randsrc(1, 1,[double('T'),double('X');0.9981568676042376, 1-0.9981568676042376]);
   S416=randsrc(1, 1,[double('G'),double('X');0.9979864940214361, 1-0.9979864940214361]);
   S418=randsrc(1, 1,[double('I'),double('X');0.997537327303141, 1-0.997537327303141]);
   S420=randsrc(1, 1,[double('D'),double('X');0.9975063502880862, 1-0.9975063502880862]);
   S421=randsrc(1, 1,[double('Y'),double('X');0.9976922123784152, 1-0.9976922123784152]);
   S427=randsrc(1, 1,[double('D'),double('X');0.9972585341676476, 1-0.9972585341676476]);
   S428=randsrc(1, 1,[double('D'),double('X');0.9975063502880862, 1-0.9975063502880862]);
   S430=randsrc(1, 1,[double('T'),double('X');0.9970881605848461, 1-0.9970881605848461]);
   S433=randsrc(1, 1,[double('V'),double('X');0.9975683043181959, 1-0.9975683043181959]);
   S434=randsrc(1, 1,[double('I'),double('X');0.9962208041633108, 1-0.9962208041633108]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9962672696858931, 1-0.9962672696858931]);
end

if S412 == double('P')
   S413=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S414=randsrc(1, 1,[double('Q'),double('X');0.9986847602395283, 1-0.9986847602395283]);
   S415=randsrc(1, 1,[double('T'),double('X');0.9982669781979668, 1-0.9982669781979668]);
   S416=randsrc(1, 1,[double('G'),double('X');0.9980348770637659, 1-0.9980348770637659]);
   S418=randsrc(1, 1,[double('I'),double('X');0.9975706747953642, 1-0.9975706747953642]);
   S420=randsrc(1, 1,[double('D'),double('X');0.9975552013864174, 1-0.9975552013864174]);
   S421=randsrc(1, 1,[double('Y'),double('X');0.9977563557027249, 1-0.9977563557027249]);
   S427=randsrc(1, 1,[double('D'),double('X');0.9972921534343231, 1-0.9972921534343231]);
   S428=randsrc(1, 1,[double('D'),double('X');0.9975397279774707, 1-0.9975397279774707]);
   S430=randsrc(1, 1,[double('T'),double('X');0.9971219459359092, 1-0.9971219459359092]);
   S433=randsrc(1, 1,[double('V'),double('X');0.9976170950222043, 1-0.9976170950222043]);
   S434=randsrc(1, 1,[double('I'),double('X');0.9962709084438393, 1-0.9962709084438393]);
   S435=randsrc(1, 1,[double('A'),double('X');0.996286381852786, 1-0.996286381852786]);
   S411=randsrc(1, 1,[double('A'),double('X');0.9988549677379424, 1-0.9988549677379424]);
end

if S413 == double('G')
   S414=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
   S415=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
   S416=randsrc(1, 1,[double('G'),double('X');0.998916089871634, 1-0.998916089871634]);
   S418=randsrc(1, 1,[double('I'),double('X');0.9984360725290721, 1-0.9984360725290721]);
   S420=randsrc(1, 1,[double('D'),double('X');0.9984051036682615, 1-0.9984051036682615]);
   S421=randsrc(1, 1,[double('Y'),double('X');0.9985909168331243, 1-0.9985909168331243]);
   S427=randsrc(1, 1,[double('D'),double('X');0.9981418683513726, 1-0.9981418683513726]);
   S428=randsrc(1, 1,[double('D'),double('X');0.9983741348074511, 1-0.9983741348074511]);
   S430=randsrc(1, 1,[double('T'),double('X');0.9979405707561048, 1-0.9979405707561048]);
   S433=randsrc(1, 1,[double('V'),double('X');0.9984051036682615, 1-0.9984051036682615]);
   S434=randsrc(1, 1,[double('I'),double('X');0.9970579582230068, 1-0.9970579582230068]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9970889270838172, 1-0.9970889270838172]);
   S411=randsrc(1, 1,[double('A'),double('X');0.9987147922763661, 1-0.9987147922763661]);
   S412=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
end

if S414 == double('Q')
   S415=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
   S416=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S418=randsrc(1, 1,[double('I'),double('X');0.9988072371274552, 1-0.9988072371274552]);
   S420=randsrc(1, 1,[double('D'),double('X');0.9987607658467067, 1-0.9987607658467067]);
   S421=randsrc(1, 1,[double('Y'),double('X');0.9989001796889522, 1-0.9989001796889522]);
   S427=randsrc(1, 1,[double('D'),double('X');0.9984819381622158, 1-0.9984819381622158]);
   S428=randsrc(1, 1,[double('D'),double('X');0.9986988041390421, 1-0.9986988041390421]);
   S430=randsrc(1, 1,[double('T'),double('X');0.9982805626123056, 1-0.9982805626123056]);
   S433=randsrc(1, 1,[double('V'),double('X');0.9986833137121259, 1-0.9986833137121259]);
   S434=randsrc(1, 1,[double('I'),double('X');0.9973356465704195, 1-0.9973356465704195]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9973666274242519, 1-0.9973666274242519]);
   S411=randsrc(1, 1,[double('A'),double('X');0.9986678232852098, 1-0.9986678232852098]);
   S412=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
   S413=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
end

if S415 == double('T')
   S416=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S418=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
   S420=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S421=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
   S427=randsrc(1, 1,[double('D'),double('X');0.9987913909850163, 1-0.9987913909850163]);
   S428=randsrc(1, 1,[double('D'),double('X');0.9989928258208469, 1-0.9989928258208469]);
   S430=randsrc(1, 1,[double('T'),double('X');0.9985589661744426, 1-0.9985589661744426]);
   S433=randsrc(1, 1,[double('V'),double('X');0.9989773308334754, 1-0.9989773308334754]);
   S434=randsrc(1, 1,[double('I'),double('X');0.9976292669321475, 1-0.9976292669321475]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9976602569068906, 1-0.9976602569068906]);
   S411=randsrc(1, 1,[double('A'),double('X');0.9985744611618141, 1-0.9985744611618141]);
   S412=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
   S413=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S414=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
end

if S416 == double('G')
   S418=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
   S420=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S421=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
   S427=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S428=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S430=randsrc(1, 1,[double('T'),double('X');0.9988845164688749, 1-0.9988845164688749]);
   S433=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
   S434=randsrc(1, 1,[double('I'),double('X');0.997954946859604, 1-0.997954946859604]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9979859325132464, 1-0.9979859325132464]);
   S411=randsrc(1, 1,[double('A'),double('X');0.9982648033960276, 1-0.9982648033960276]);
   S412=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
   S413=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S414=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
   S415=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
end

if S418 == double('I')
   S420=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S421=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
   S427=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S428=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S430=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
   S433=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
   S434=randsrc(1, 1,[double('I'),double('X');0.998233023854178, 1-0.998233023854178]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9982640234356837, 1-0.9982640234356837]);
   S411=randsrc(1, 1,[double('A'),double('X');0.9982640234356837, 1-0.9982640234356837]);
   S412=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
   S413=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S414=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
   S415=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
   S416=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
end

if S420 == double('D')
   S421=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
   S427=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S428=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S430=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
   S433=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
   S434=randsrc(1, 1,[double('I'),double('X');0.9982796032238066, 1-0.9982796032238066]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9982951022938623, 1-0.9982951022938623]);
   S411=randsrc(1, 1,[double('A'),double('X');0.9981866088034718, 1-0.9981866088034718]);
   S412=randsrc(1, 1,[double('P'),double('X');1, 1-1]);
   S413=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S414=randsrc(1, 1,[double('Q'),double('X');1, 1-1]);
   S415=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
   S416=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S418=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
end

if S421 == double('Y')
   S427=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S428=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S430=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
   S433=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
   S434=randsrc(1, 1,[double('I'),double('X');0.9982804294278942, 1-0.9982804294278942]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9982959210546699, 1-0.9982959210546699]);
   S411=randsrc(1, 1,[double('A'),double('X');0.997893138758501, 1-0.997893138758501]);
   S412=randsrc(1, 1,[double('P'),double('X');0.9989310777524748, 1-0.9989310777524748]);
   S413=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S414=randsrc(1, 1,[double('Q'),double('X');0.998977552632802, 1-0.998977552632802]);
   S415=randsrc(1, 1,[double('T'),double('X');0.998977552632802, 1-0.998977552632802]);
   S416=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S418=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
   S420=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
end

if S427 == double('D')
   S428=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S430=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
   S433=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
   S434=randsrc(1, 1,[double('I'),double('X');0.9984812088337853, 1-0.9984812088337853]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9984967067028283, 1-0.9984967067028283]);
   S411=randsrc(1, 1,[double('A'),double('X');0.9978612940720651, 1-0.9978612940720651]);
   S412=randsrc(1, 1,[double('P'),double('X');0.9988686555598605, 1-0.9988686555598605]);
   S413=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S414=randsrc(1, 1,[double('Q'),double('X');0.9989616427741186, 1-0.9989616427741186]);
   S415=randsrc(1, 1,[double('T'),double('X');0.9989771406431616, 1-0.9989771406431616]);
   S416=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S418=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
   S420=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S421=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
end

if S428 == double('D')
   S430=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
   S433=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
   S434=randsrc(1, 1,[double('I'),double('X');0.9984665189981258, 1-0.9984665189981258]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9984820087052154, 1-0.9984820087052154]);
   S411=randsrc(1, 1,[double('A'),double('X');0.9975836056940163, 1-0.9975836056940163]);
   S412=randsrc(1, 1,[double('P'),double('X');0.9985904366548428, 1-0.9985904366548428]);
   S413=randsrc(1, 1,[double('G'),double('X');0.99871435431156, 1-0.99871435431156]);
   S414=randsrc(1, 1,[double('Q'),double('X');0.9986523954832014, 1-0.9986523954832014]);
   S415=randsrc(1, 1,[double('T'),double('X');0.9986523954832014, 1-0.9986523954832014]);
   S416=randsrc(1, 1,[double('G'),double('X');1, 1-1]);
   S418=randsrc(1, 1,[double('I'),double('X');0.9989776793320838, 1-0.9989776793320838]);
   S420=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S421=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
   S427=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
end

if S430 == double('T')
   S433=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
   S434=randsrc(1, 1,[double('I'),double('X');0.9984661150878498, 1-0.9984661150878498]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9984971026618326, 1-0.9984971026618326]);
   S411=randsrc(1, 1,[double('A'),double('X');0.9974280313594248, 1-0.9974280313594248]);
   S412=randsrc(1, 1,[double('P'),double('X');0.998435127513867, 1-0.998435127513867]);
   S413=randsrc(1, 1,[double('G'),double('X');0.9985435840228069, 1-0.9985435840228069]);
   S414=randsrc(1, 1,[double('Q'),double('X');0.9984971026618326, 1-0.9984971026618326]);
   S415=randsrc(1, 1,[double('T'),double('X');0.9984816088748412, 1-0.9984816088748412]);
   S416=randsrc(1, 1,[double('G'),double('X');0.9989464224845837, 1-0.9989464224845837]);
   S418=randsrc(1, 1,[double('I'),double('X');0.9988069784016609, 1-0.9988069784016609]);
   S420=randsrc(1, 1,[double('D'),double('X');0.9988689535496266, 1-0.9988689535496266]);
   S421=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
   S427=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S428=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
end

if S433 == double('V')
   S434=randsrc(1, 1,[double('I'),double('X');0.9984671837985972, 1-0.9984671837985972]);
   S435=randsrc(1, 1,[double('A'),double('X');0.9984826667905305, 1-0.9984826667905305]);
   S411=randsrc(1, 1,[double('A'),double('X');0.997213061451995, 1-0.997213061451995]);
   S412=randsrc(1, 1,[double('P'),double('X');0.9982349389195968, 1-0.9982349389195968]);
   S413=randsrc(1, 1,[double('G'),double('X');0.9983123538792636, 1-0.9983123538792636]);
   S414=randsrc(1, 1,[double('Q'),double('X');0.9982039729357302, 1-0.9982039729357302]);
   S415=randsrc(1, 1,[double('T'),double('X');0.9982039729357302, 1-0.9982039729357302]);
   S416=randsrc(1, 1,[double('G'),double('X');0.9986684626937309, 1-0.9986684626937309]);
   S418=randsrc(1, 1,[double('I'),double('X');0.998498149782464, 1-0.998498149782464]);
   S420=randsrc(1, 1,[double('D'),double('X');0.9985755647421307, 1-0.9985755647421307]);
   S421=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
   S427=randsrc(1, 1,[double('D'),double('X');0.9988387756049979, 1-0.9988387756049979]);
   S428=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S430=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
end

if S434 == double('I')
   S435=randsrc(1, 1,[double('A'),double('X');1, 1-1]);
   S411=randsrc(1, 1,[double('A'),double('X');0.9972093023255814, 1-0.9972093023255814]);
   S412=randsrc(1, 1,[double('P'),double('X');0.9982325581395349, 1-0.9982325581395349]);
   S413=randsrc(1, 1,[double('G'),double('X');0.9983100775193798, 1-0.9983100775193798]);
   S414=randsrc(1, 1,[double('Q'),double('X');0.998201550387597, 1-0.998201550387597]);
   S415=randsrc(1, 1,[double('T'),double('X');0.998201550387597, 1-0.998201550387597]);
   S416=randsrc(1, 1,[double('G'),double('X');0.9986666666666667, 1-0.9986666666666667]);
   S418=randsrc(1, 1,[double('I'),double('X');0.9984961240310077, 1-0.9984961240310077]);
   S420=randsrc(1, 1,[double('D'),double('X');0.9985891472868217, 1-0.9985891472868217]);
   S421=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
   S427=randsrc(1, 1,[double('D'),double('X');0.9988682170542635, 1-0.9988682170542635]);
   S428=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S430=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
   S433=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
end

if S435 == double('A')
   S411=randsrc(1, 1,[double('A'),double('X');0.9972094321194364, 1-0.9972094321194364]);
   S412=randsrc(1, 1,[double('P'),double('X');0.9982016340325256, 1-0.9982016340325256]);
   S413=randsrc(1, 1,[double('G'),double('X');0.9982946529618777, 1-0.9982946529618777]);
   S414=randsrc(1, 1,[double('Q'),double('X');0.9981861308776336, 1-0.9981861308776336]);
   S415=randsrc(1, 1,[double('T'),double('X');0.9981861308776336, 1-0.9981861308776336]);
   S416=randsrc(1, 1,[double('G'),double('X');0.9986512255243942, 1-0.9986512255243942]);
   S418=randsrc(1, 1,[double('I'),double('X');0.998480690820582, 1-0.998480690820582]);
   S420=randsrc(1, 1,[double('D'),double('X');0.9985582065950421, 1-0.9985582065950421]);
   S421=randsrc(1, 1,[double('Y'),double('X');1, 1-1]);
   S427=randsrc(1, 1,[double('D'),double('X');0.9988372633830984, 1-0.9988372633830984]);
   S428=randsrc(1, 1,[double('D'),double('X');1, 1-1]);
   S430=randsrc(1, 1,[double('T'),double('X');1, 1-1]);
   S433=randsrc(1, 1,[double('V'),double('X');1, 1-1]);
   S434=randsrc(1, 1,[double('I'),double('X');1, 1-1]);
end

    
    SS411435=[S411,S412,S413,S414,S415,S416,S418,S420,S421,S427,S428,S430,S433,S434,S435];
    
    %%%410 411435%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    if SS411435==[double('A'),double('P'),double('G'),double('Q'),double('T'),double('G'),double('I'),double('D'),double('Y'),double('D'),double('D'),double('T'),double('V'),double('I'),double('A')]
        S410=randsrc(1, 1,[double('I'),double('V'),double('X');0.99685,0.00246,1-0.99685-0.00246]);
    end
   
    SSO411435=[double('APGQTGIDYDDTVIA')
        double('APGQTGIDYDDTVIX')
        double('APGQTGIDYDDTVXX')
        double('APGQTGIDYXXXXXX')
        double('APGQTGXXXXXXXXX')
        double('APGQTXXXXXXXXXX')
        double('APGQXXXXXXXXXXX')
        double('APGXXXXXXXXXXXX')
        double('APXXXXXXXXXXXXX')
        double('XXXXXXXXXXXXXXX')];
    if S410==double('I')
        SS411435=randsrc(1,1,[1:10;1-0.000155234-0.001179776-0.00013971-0.000263897-0.000279421-0.000310467-0.000279421-0.000791692-0.000217327,0.000155234,0.001179776,0.00013971,0.000263897,0.000279421,0.000310467,0.000279421,0.000791692,0.000217327]);
        for j411435=1:10
            if SS411435==j411435
                SS411435=SSO411435(j411435,:);
            end
        end
    end
    SSS410435=[S410,SS411435];

    %%%%%410435 417%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    SSSO410435=[double('IAPGQTGIDYDDTVIA')
        double('IAPGQTGIDYDDTVIX')
        double('IAPGQTGIDYDDTVXA')
        double('IAPGQTGIDYDDTVXX')
        double('IAPGQTGIDYXXXXXX')
        double('IAPGQXGIDYDDTVIA')
        double('XAPGQTGIDYDDTVIA')];
    if S417==double('N')
        SSS410435=randsrc(1,1,[1:7;1-0.000157356-0.000110149-0.001180173-0.000110149-0.000110149-0.000125885,0.000157356,0.000110149,0.001180173,0.000110149,0.000110149,0.000125885]);
        for j410435=1:7
            if SSS410435==j410435
                SSS410435=SSSO410435(j410435,:);
            end
        end
    end
    if SSS410435==[double('I'),double('A'),double('P'),double('G'),double('Q'),double('T'),double('G'),double('I'),double('D'),double('Y'),double('D'),double('D'),double('T'),double('V'),double('I'),double('A')]
        S410=randsrc(1, 1,[double('N'),double('K'),double('X');0.98631,0.0091,1-0.98631-0.0091]);
    end
    %%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if isequal([SSS410435,S417],double('IAPGQTGIDYDDTVIAN'))||isequal([SSS410435,S417],double('XXXXXXXXXXXXXXXXX'))
        M{7}(while_flag,:)=[SSS410435,S417];
        while_flag=while_flag+1;
    end
    
    if ~isequal([SSS410435,S417],double('IAPGQTGIDYDDTVIAN'))&&~isequal([SSS410435,S417],double('XXXXXXXXXXXXXXXXX'))
        Record410417=[SSS410435,S417];
        Record410417_1 = ["S410","S411","S412","S413","S414","S415","S416","S418","S420","S421","S427","S428","S430","S433","S434","S435","S417"];
        for ii410417=1:length(Record410417_1)
            eval([char(Record410417_1(ii410417)),'=Record410417(ii410417)']);
        end
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score410417 = obj.bilTrain('4410417', char(S410,S411,S412,S413,S414,S415,S416,S418,S420,S421,S427,S428,S430,S433,S434,S435)', char(S417)');
        
        if score410417 < 0
            if  a410==0
                S410=0;
            end
            if a411==0
                S411=0;
            end
            if  a412==0
                S412=0;
            end
            if a413==0
                S413=0;
            end
            if  a414==0
                S414=0;
            end
            if a415==0
                S415=0;
            end
            if  a416==0
                S416=0;
            end
            if a418==0
                S418=0;
            end
            if  a420==0
                S420=0;
            end
            if a421==0
                S421=0;
            end
            if  a427==0
                S427=0;
            end
            if a428==0
                S428=0;
            end
            if  a430==0
                S430=0;
            end
            if a433==0
                S433=0;
            end
            if  a434==0
                S434=0;
            end
            if a435==0
                S435=0;
            end
            if a417==0
                S417=0;
            end
            continue
        end
        
        if score410417>=0
            M{7}(while_flag,:)=[SSS410435,S417];
            while_flag=while_flag+1;
        end
    end
    [S410,S411,S412,S413,S414,S415,S416,S418,S420,S421,S427,S428,S430,S433,S434,S435,S417]=deal(0);
    [a410,a411,a412,a413,a414,a415,a416,a418,a420,a421,a427,a428,a430,a433,a434,a435,a417]=deal(1);
end

%%%8 (455)
while_flag = 1;
[S455]=deal(0);
[a455]=deal(1);
while while_flag <= num
    if S455==0
        S455=randsrc(1,1,[double('L'),double('F'),100;pn3(27:27,:)*alpha,(1-pn3(27:27,:))*alpha,1-alpha]);
    end
    
    if S455==100
        S455=randsrc(1,1,[double('F'),double('W'),double('S');0.996,0.002,1-0.002-0.996]);
        a455=0;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if S455==double('L') || S455==double('X')
        M{8}(while_flag,:)=[S455];
        while_flag=while_flag+1;
    end
    
    if (S455~=double('L')) && (S455~=double('X'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score455 = obj.bilTrain('4455',char(S455));
        if score455<0
            if a455==0
                S455=0;
            end
            continue
        end
        if score455>=0
            M{8}(while_flag,:)=[S455];
            while_flag=while_flag+1;
        end
    end
    [S455]=deal(0);
    [a455]=deal(1);
end

%%%9 (456)
while_flag = 1;
[S456]=deal(0);
[a456]=deal(1);
while while_flag <= num
    if S456==0
        S456=randsrc(1,1,[double('L'),double('F'),100;pn3(28:28,:)*h,(1-pn3(28:28,:))*h,1-h]);
    end
    
    if S456==100
        S456=randsrc(1,1,[double('L');1]);
        a456=0;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if S456==double('F') || S456==double('X')
        M{9}(while_flag,:)=[S456];
        while_flag=while_flag+1;
    end
    
    if (S456~=double('F')) && (S456~=double('X'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score456 = obj.bilTrain('4456',char(S456));
        if score456<0
            if a456==0
                S456=0;
            end
            continue
        end
        if score456>=0
            M{9}(while_flag,:)=[S456];
            while_flag=while_flag+1;
        end
    end
    [S456]=deal(0);
    [a456]=deal(1);
end

%%%10 (478)
while_flag = 1;
[S478]=deal(0);
[a478]=deal(1);
while while_flag <= num
    if S478==0
        S478=randsrc(1,1,[double('K'),double('R'),100;pn3(29:29,:)*h,(1-pn3(29:29,:))*h,1-h]);
    end
    
    if S478==100
        S478=randsrc(1,1,[double('S'),double('Q'),double('N'),double('R'),double('E'),double('V'),double('I'),double('T');3.4808E-05,0.003411187,0.003863692,0.982352327,0.000661353,6.96161E-05,0.00602179,0.003585227]);
        a478=0;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if S478==double('K') || S478==double('X')
        M{10}(while_flag,:)=[S478];
        while_flag=while_flag+1;
    end
    
    if (S478~=double('K')) && (S478~=double('X'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score478 = obj.bilTrain('4478',char(S478));
        if score478<0
            if a478==0
                S478=0;
            end
            continue
        end
        if score478>=0
            M{10}(while_flag,:)=[S478];
            while_flag=while_flag+1;
        end
    end
    [S478]=deal(0);
    [a478]=deal(1);
end

%%%11 (547)
while_flag = 1;
[S547]=deal(0);
[a547]=deal(1);
while while_flag <= num
    if S547==0
        S547=randsrc(1,1,[double('T'),double('I'),100;pn3(30:30,:)*alpha,(1-pn3(30:30,:))*alpha,1-alpha]);
    end
    
    if S547==100
        S547=randsrc(1,1,[double('T'),double('K');0.99974,1-0.99974]);
        a547=0;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if S547==double('I') || S547==double('X')
        M{11}(while_flag,:)=[S547];
        while_flag=while_flag+1;
    end
    
    if (S547~=double('I')) && (S547~=double('X'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score547 = obj.bilTrain('4547',char(S547));
        if score547<0
            if a547==0
                S547=0;
            end
            continue
        end
        if score547>=0
            M{11}(while_flag,:)=[S547];
            while_flag=while_flag+1;
        end
    end
    [S547]=deal(0);
    [a547]=deal(1);
end

MMcom = [];
for i=1:11
    MMcom = [MMcom, M{i}];
end
MMMcom=[];
for iiii=1:num
    Recordall=[MMcom(iiii,:)];
    Recordall_1=["S27","S145","S52","S157","S452","S180","S252","S253","S521","S410","S411","S412","S413","S414","S415","S416","S418","S420","S421","S427","S428","S430","S433","S434","S435","S417","S455","S456","S478","S547"];
     for iiall = 1:length(Recordall_1)
        eval([char(Recordall_1(iiall)),'=Recordall(iiall)']);
     end
    %
  MMMcom(iiii,:)=[double('QCVNLITRTQXXX'),S27,double('YTNSFTRGVYYPDKVFRSSVLHST'),S52,double('DLFLPFFSNVTWFHAIHVSGTNGTKRFDNPALPFNDGVYFASTEKSNIIRGWIFGTTLDSKTQSLLIVNNATNVVIKVCEFQFCNDPFLDVX'),S145,double('QKNNKSWMESE'),S157,double('RVYSSANNCTFEYVSQPFLMDL'),S180,double('GKEGNFKNLREFVFKNIDGYFKIYSKHTPINLERDLPQGFSALEPLVDLPIGINITRFQTLLALHRSYLTP'),S252,S253,double('SSSGWTAGAAAYYVGYLQPRTFLLKYNENGTITDAVDCALDPLSETKCTLKSFTVEKGIYQTSNFRVQPTESIVRFPNITNLCPFHEVFNATTFASVYAWNRKRISNCVADYSVIYNFAPFFAFKCYGVSPTKLNDLCFTNVYADSFVIRGNEVSQ'),S410,S411,S412,S413,S414,S415,S416,S417,S418,double('A'),S420,S421,double('NYKLP'),S427,S428,double('F'),S430,double('GC'),S433,S434,S435,double('WNSNKLDSKPSGNYNY'),S452,double('YR'),S455,S456,double('RKSKLKPFERDISTEIYQAGN'),S478,double('PCNGVAGPNCYSPLQSYGFRPTYGVGHQPYRVVVLSFELLHA'),S521,double('ATVCGPKKSTNLVKNKCVNFNFNGL'),S547,double('GTGVLTESNKKFLPFQQFGRDIADTTDAVRDPQTLEILDITPCSFGGVSVITPGTNTSNQVAVLYQGVNCTEVPVAIHADQLTPTWRVYSTGSNVFQTRAGCLIGAEYVNNSYECDIPIGAGICASYQTQTKSHRRAR')];
end

MMu=unique(MMMcom,'rows');

[C11,~,n11]=unique(MMMcom,'rows');
s11=sum(bsxfun(@eq,n11,unique(n11)'));
CH11= [];
CH11=[C11 s11.'];

CHHH = cell(1,11);
for i=1:11
    [C111,~,n111]=unique(M{i},'rows');
    s111=sum(bsxfun(@eq,n111,unique(n111)'));
    CHHH{i} = [];
    CHHH{i}=[C111 s111.'];
end

[c123, ia123, ib123] = intersect(dataset3(:,1:672),CH11(:,1:672),'rows');
dd=CH11(ib123,673);
sumdd=sum(dd)
