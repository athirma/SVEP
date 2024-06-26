num=10000;  %% The generation times
alpha=0.5;  %% The mutation frequency of the hotspots=1-0.5=0.5
h=0.1;%% The mutation frequency of the more mutable hotspots=1-0.1=0.9

M = cell(1,8);   
for i=1:8
    M{i} = [];
end

%%% Paragraph 1
while_flag = 1;
[S68,S250]=deal(0);
[a68,a250]=deal(1);
while while_flag <= num
    if S68==0
        S68=randsrc(1,1,[double('I'),double('X'),100;pn2(1:1,:)*alpha,(1-pn2(1:1,:))*alpha,1-alpha]);
    end
    if S250==0
        S250=randsrc(1,1,[double('T'),double('X'),100;pn2(2:2,:)*alpha,(1-pn2(2:2,:))*alpha,1-alpha]);
    end
    
    if S68==100
        S68=randsrc(1,1,[double('F'),double('L'),double('N'),double('S'),double('T'),double('V');0.083636364,0.043636364,0.014545455,0.014545455,0.207272727,0.636363636]);
        a68=0;
    end
    if S250==100
        S250=randsrc(1,1,[double('A'),double('I'),double('N'),double('P'),double('S');0.055299539,0.608294931,0.262672811,0.023041475,0.050691244]);
        a250=0;
    end
 
    if S68 == double('I')
        S250=randsrc(1, 1,[double('T'),double('X');0.9882930997650075, 1-0.9882930997650075]);
    end
    if S250 == double('T')
        S68=randsrc(1, 1,[double('I'),double('X');0.998736080200029, 1-0.998736080200029]);
    end   
    
    if isequal([S68,S250],double('IT'))||isequal([S68,S250],double('XX'))
        M{1}(while_flag,:)=[S68,S250];
        while_flag=while_flag+1;
        S68 = 0;
        S250 = 0;
    end

    if ~isequal([S68,S250],double('IT'))&&~isequal([S68,S250],double('XX'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score68250 = obj.bilTrain('368250', char(S68), char(S250));
        if score68250 < 0
            if  a68==0
                S68=0;
            end
            if  a250==0
                S250=0;
            end
            continue
        end
        if score68250>=0
            a68=1;
            a250=1;
            M{1}(while_flag,:)=[S68,S250];
            while_flag=while_flag+1;
            S68 = 0;
            S250 = 0;
        end
    end
end

%% Paragraph 2
[S69,S70,S339,S446,S452,S486,S490,S83,S146,S183,S213,S252,S368,S445]=deal(0);
[a69,a70,a339,a446,a452,a486,a490,a83,a146,a183,a213,a252,a368,a445]=deal(1);
while_flag = 1;
while while_flag <= num
    if S69==0
        S69=randsrc(1,1,[double('X'),double('H'),100;pn2(3:3,:)*alpha,(1-pn2(3:3,:))*alpha,1-alpha]);
    end
    if S70==0
        S70=randsrc(1,1,[double('X'),double('V'),double('I'),100;pn2(4:4,:)*alpha,(1-pn2(4:4,:)-0.064)*alpha,0.064*alpha,1-alpha]);
    end
    if S339==0
        S339=randsrc(1,1,[double('D'),double('H'),100;pn2(5:5,:)*h,(1-pn2(5:5,:))*h,1-h]);
    end
    if S446==0
        S446=randsrc(1,1,[double('G'),double('S'),100;pn2(6:6,:)*h,(1-pn2(6:6,:))*h,1-h]);
    end
    if S452==0
        S452=randsrc(1,1,[double('R'),double('L'),100;pn2(7:7,:)*h,(1-pn2(7:7,:))*h,1-h]);
    end
    if S486==0
        S486=randsrc(1, 1,[double('V'),double('F'),double('P'),double('S'),100;pn2(8:8,:)*h,(1-pn2(8:8,:)-0.03-0.248)*h,0.248*h,0.03*h,1-h]);
    end
    if S490==0
        S490=randsrc(1, 1,[double('F'),double('S'),100;pn2(9:9,:)*h,(1-pn2(9:9,:))*h,1-h]);
    end
    if S83==0
        S83=randsrc(1, 1,[double('V'),double('A'),100;pn2(10:10,:)*h,(1-pn2(10:10,:))*h,1-h]);
    end
    if S146==0
        S146=randsrc(1, 1,[double('H'),double('Q'),double('K'),100;pn2(11:11,:)*h,(1-pn2(11:11,:)-0.039)*h,0.039*h,1-h]);
    end
    if S183==0
        S183=randsrc(1, 1,[double('Q'),double('E'),100;pn2(12:12,:)*h,(1-pn2(12:12,:))*h,1-h]);
    end
    if S213==0
        S213=randsrc(1, 1,[double('G'),double('E'),100;pn2(13:13,:)*h,(1-pn2(13:13,:))*h,1-h]);
    end
    if S252==0
        S252=randsrc(1, 1,[double('G'),double('V'),100;pn2(14:14,:)*h,(1-pn2(14:14,:))*h,1-h]);
    end
    if S368==0
        S368=randsrc(1, 1,[double('L'),double('I'),100;pn2(15:15,:)*h,(1-pn2(15:15,:))*h,1-h]);
    end
    if 445==0
        S445=randsrc(1, 1,[double('V'),double('P'),100;pn2(16:16,:)*h,(1-pn2(16:16,:))*h,1-h]);
    end
    
    if S69==100
        S69=randsrc(1,1,[double('Y'),double('Q');0.978723404,1-0.978723404]);
        a69=0;
    end
    if S70==100
        S70=randsrc(1,1,[double('V'),double('I');0.825273103, 1-0.825273103]);
        a70=0;
    end
    if S339==100
        S339=randsrc(1,1,[double('H'),double('G');0.990249018, 1-0.990249018]);
        a339=0;
    end
    if S446==100
        S446=randsrc(1,1,[double('S'),double('D');0.996806503,1-0.996806503]);
        a446=0;
    end
    if S452==100
        S452=randsrc(1,1,[double('L'),double('M'),double('Q');0.984591902,0.014566782,1-0.984591902-0.014566782]);
        a452=0;
    end
    if S486==100
        S486=randsrc(1, 1,[double('A'),double('F'),double('I'),double('L'),double('P'),double('S');0.005944712,0.080626568,0.00280283,0.000282543,0.772145747,1-0.005944712-0.080626568-0.00280283-0.000282543-0.772145747]);
        a486=0;
    end
    if S490==100
        S490=randsrc(1, 1,[double('L'),double('P'),double('S'),double('V');0.000347432,0.001055165,0.997979746,1-0.000347432-0.001055165-0.997979746]);
        a490=0;
    end
    if S83==100
        S83=randsrc(1, 1,[double('A'),double('F'),double('I'),double('S');1-0.000580199-0.000179585-0.000414428,0.000580199,0.000179585,0.000414428]);
        a83=0;
    end
    if S146==100
        S146=randsrc(1, 1,[double('E'),double('I'),double('K'),double('L'),double('N'),double('P'),double('Q'),double('Y');0.000105854,0.003572563,0.142637874,0.004287075,0.000145549,0.000211707,0.836694189,1-0.000105854-0.003572563-0.142637874-0.004287075-0.000145549-0.000211707-0.836694189]);
        a146=0;
    end
    if S183==100
        S183=randsrc(1, 1,[double('D'),double('E'),double('H'),double('K'),double('L'),double('P'),double('R');1-0.996513663-0.00038584-0.00044096-0.001143739-0.000854359-0.0004134,0.996513663,0.00038584,0.00044096,0.001143739,0.000854359,0.0004134]);
        a183=0;
    end
    if S213==100
        S213=randsrc(1, 1,[double('D'),double('E'),double('N'),double('R'),double('V'),double('W');0.000109872,0.99670384,0.00048069,0.000865242,0.001043784,1-0.000109872-0.99670384-0.00048069-0.000865242-0.001043784]);
        a213=0;
    end
    if S252==100
        S252=randsrc(1, 1,[double('D'),double('I'),double('S'),double('V');0.001978966,0.000296845,0.001258057,1-0.001978966-0.000296845-0.001258057]);
        a252=0;
    end
    if S368==100
        S368=randsrc(1, 1,[double('I');1]);
        a368=0;
    end
    if 445==100
        S445=randsrc(1, 1,[double('A'),double('F'),double('G'),double('I'),double('L'),double('P'),double('S');0.047683026,0.00150162,0.000184409,0.000447852,0.000355647,0.94966938,1-0.047683026-0.00150162-0.000184409-0.000447852-0.000355647-0.94966938]);
        a445=0;
    end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if S69 == double('X')
        S70=randsrc(1, 1,[double('X');1]);
        S339=randsrc(1, 1,[double('D'),double('H');0.9966079759531588, 1-0.9966079759531588]);
        S446=randsrc(1, 1,[double('G'),double('S');0.9978395416070888, 1-0.9978395416070888]);
        S452=randsrc(1, 1,[double('R'),double('L');0.987073779132268, 1-0.987073779132268]);
        S486=randsrc(1, 1,[double('V'),double('P');0.9950633003872126, 1-0.9950633003872126]);
        S490=randsrc(1, 1,[double('F'),double('S');1, 1-1]);
    end
    if S69 == double('H')
        S70=randsrc(1, 1,[double('V');1]);
        S339=randsrc(1, 1,[double('D'),double('H');0.01867954911433172, 1-0.01867954911433172]);
        S446=randsrc(1, 1,[double('G'),double('S');0.019419097035844216, 1-0.019419097035844216]);
        S452=randsrc(1, 1,[double('R'),double('L');0.03764537484344248, 1-0.03764537484344248]);
        S486=randsrc(1, 1,[double('V'),double('P');0.0041271545297310195, 1-0.0041271545297310195]);
        S490=randsrc(1, 1,[double('F'),double('S');0.07512375499493051, 1-0.07512375499493051]);
    end
        if S70 == double('X')
        S69=randsrc(1, 1,[double('X');1]);
        S339=randsrc(1, 1,[double('D'),double('H');0.9966, 1-0.9966]);
        S446=randsrc(1, 1,[double('G'),double('S');0.997839, 1-0.997839]);
        S452=randsrc(1, 1,[double('R'),double('L');0.987, 1-0.987]);
        S486=randsrc(1, 1,[double('V'),double('P');0.99506, 1-0.99506]);
        S490=randsrc(1, 1,[double('F'),double('S');1, 1-1]);
    end
    if S70 == double('V')
        S69=randsrc(1, 1,[double('H');1]);
        S339=randsrc(1, 1,[double('D'),double('H');0.01867954, 1-0.01867954]);
        S446=randsrc(1, 1,[double('G'),double('S');0.0194, 1-0.0194]);
        S452=randsrc(1, 1,[double('R'),double('L');0.0376, 1-0.0376]);
        S486=randsrc(1, 1,[double('V'),double('P');0.004127, 1-0.004127]);
        S490=randsrc(1, 1,[double('F'),double('S');0.075123, 1-0.075123]);
    end
    if S339 == double('D')
        S70=randsrc(1, 1,[double('X'),double('V');0.9917, 1-0.9917]);
        S446=randsrc(1, 1,[double('G'),double('S');0.9966968245889208, 1-0.9966968245889208]);
        S452=randsrc(1, 1,[double('R'),double('L');0.9828453012849144, 1-0.9828453012849144]);
        S486=randsrc(1, 1,[double('V'),double('P');0.9890465456887328, 1-0.9890465456887328]);
        S490=randsrc(1, 1,[double('F'),double('S');1, 1-1]);
        S69=randsrc(1, 1,[double('X'),double('H');0.9918667096010221, 1-0.9918667096010221]);
    end
    if S339 == double('H')
        S446=randsrc(1, 1,[double('G'),double('S');0.0021909271273293815, 1-0.0021909271273293815]);
        S452=randsrc(1, 1,[double('R'),double('L');0.03538347310636951, 1-0.03538347310636951]);
        S486=randsrc(1, 1,[double('V'),double('P');0.0009737453899241696, 1-0.0009737453899241696]);
        S490=randsrc(1, 1,[double('F'),double('S');0.05663546624146451, 1-0.05663546624146451]);
        S69=randsrc(1, 1,[double('X'),double('H');0.0004381854254658763, 1-0.0004381854254658763]);
        S70=randsrc(1, 1,[double('X'),double('V');0.000438, 1-0.000438]);
    end
    if S446 == double('G')
        S452=randsrc(1, 1,[double('R'),double('L');0.9803567724538478, 1-0.9803567724538478]);
        S486=randsrc(1, 1,[double('V'),double('P');0.9883634100808961, 1-0.9883634100808961]);
        S490=randsrc(1, 1,[double('F'),double('S');0.9988021157436217, 1-0.9988021157436217]);
        S69=randsrc(1, 1,[double('X'),double('H');0.991557768097905, 1-0.991557768097905]);
        S70=randsrc(1, 1,[double('X'),double('V');0.991386642, 1-0.991386642]);
        S339=randsrc(1, 1,[double('D'),double('H');0.9951566065131715, 1-0.9951566065131715]);
    end
    if S446 == double('S')
        S452=randsrc(1, 1,[double('R'),double('L');0.03686714237172953, 1-0.03686714237172953]);
        S486=randsrc(1, 1,[double('V'),double('P');0.002766855977865152, 1-0.002766855977865152]);
        S490=randsrc(1, 1,[double('F'),double('S');0.06013057618562206, 1-0.06013057618562206]);
        S69=randsrc(1, 1,[double('X'),double('H');0.0025484199796126403, 1-0.0025484199796126403]);
        S70=randsrc(1, 1,[double('X'),double('V');0.0025484, 1-0.0025484]);
        S339=randsrc(1, 1,[double('D'),double('H');0.0050847046259890295, 1-0.0050847046259890295]);
    end
    if S452 == double('R')
        S486=randsrc(1, 1,[double('V'),double('P');0.9816905436676113, 1-0.9816905436676113]);
        S490=randsrc(1, 1,[double('F'),double('S');1, 1-1]);
        S69=randsrc(1, 1,[double('X'),double('H');0.9835885702399834, 1-0.9835885702399834]);
        S70=randsrc(1, 1,[double('X'),double('V');0.983407, 1-0.983407]);   
        S339=randsrc(1, 1,[double('D'),double('H');0.9840565767920751, 1-0.9840565767920751]);
        S446=randsrc(1, 1,[double('G'),double('S');0.9830841631782845, 1-0.9830841631782845]);
    end
    if S452 == double('L')
        S486=randsrc(1, 1,[double('V'),double('P');0.027050451044298776, 1-0.027050451044298776]);
        S490=randsrc(1, 1,[double('F'),double('S');0.053148765273861406, 1-0.053148765273861406]);
        S69=randsrc(1, 1,[double('X'),double('H');0.029662723843703078, 1-0.029662723843703078]);
        S70=randsrc(1, 1,[double('X'),double('V');0.029687138,1-0.029687138]);
        S339=randsrc(1, 1,[double('D'),double('H');0.02490203977002234, 1-0.02490203977002234]);
        S446=randsrc(1, 1,[double('G'),double('S');0.03364216745401057, 1-0.03364216745401057]);
    end
    if S486 == double('V')
        S490=randsrc(1, 1,[double('F'),double('S');1, 1-1]);
        S69=randsrc(1, 1,[double('X'),double('H');0.998188728235947, 1-0.998188728235947]);
        S70=randsrc(1, 1,[double('X'),double('V');1-0.001879, 0.001879]);
        S339=randsrc(1, 1,[double('D'),double('H');0.9968957105315507, 1-0.9968957105315507]);
        S446=randsrc(1, 1,[double('G'),double('S');0.9977489975186624, 1-0.9977489975186624]);
        S452=randsrc(1, 1,[double('R'),double('L');0.9882633777600954, 1-0.9882633777600954]);
    end
    if S486 == double('P')
        S490=randsrc(1, 1,[double('F'),double('S');0.0006001083122319638, 1-0.0006001083122319638]);
        S69=randsrc(1, 1,[double('X'),double('H');2.927357620643726e-05, 1-2.927357620643726e-05]);
        S70=randsrc(1, 1,[double('X'),double('V');1-0.99488,0.99488]);
        S339=randsrc(1, 1,[double('D'),double('H');0.00016100466913540493, 1-0.00016100466913540493]);
        S446=randsrc(1, 1,[double('G'),double('S');0.0006586554646448383, 1-0.0006586554646448383]);
        S452=randsrc(1, 1,[double('R'),double('L');0.00026346218585793533, 1-0.00026346218585793533]);
    end
    if S490 == double('F')
        S69=randsrc(1, 1,[double('X'),double('H');0.9681538967112414, 1-0.9681538967112414]);
        S70=randsrc(1, 1,[double('X'),double('V');0.967987, 1-0.967987]);
        S339=randsrc(1, 1,[double('D'),double('H');0.9728001213377486, 1-0.9728001213377486]);
        S446=randsrc(1, 1,[double('G'),double('S');0.9737809348062387, 1-0.9737809348062387]);
        S452=randsrc(1, 1,[double('R'),double('L');0.971556409413787, 1-0.971556409413787]);
        S486=randsrc(1, 1,[double('V'),double('P');0.96512550873379, 1-0.96512550873379]);
    end
    if S490 == double('S')
        S69=randsrc(1, 1,[double('X'),double('H');0.001302284800660168, 1-0.001302284800660168]);
        S70=randsrc(1, 1,[double('X'),double('V');0.001302, 1-0.001302]);
        S339=randsrc(1, 1,[double('D'),double('H');0.0012507091649904586, 1-0.0012507091649904586]);
        S446=randsrc(1, 1,[double('G'),double('S');0.0025916756924029088, 1-0.0025916756924029088]);
        S452=randsrc(1, 1,[double('R'),double('L');0.00139254216308216, 1-0.00139254216308216]);
        S486=randsrc(1, 1,[double('V'),double('P');0.001302284800660168, 1-0.001302284800660168]);
    end
    
    SS69490=[S69,S70,S339,S446,S452,S486,S490];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    if S83 == double('V')
        S146=randsrc(1, 1,[double('H'),double('Q');0.9817545379801988, 1-0.9817545379801988]);
        S183=randsrc(1, 1,[double('Q'),double('E');0.9976023907167719, 1-0.9976023907167719]);
        S213=randsrc(1, 1,[double('G'),double('E');0.9974793101580847, 1-0.9974793101580847]);
        S252=randsrc(1, 1,[double('G'),double('V');0.9984196456264555, 1-0.9984196456264555]);
        S368=randsrc(1, 1,[double('L'),double('I');1, 1-1]);
        S445=randsrc(1, 1,[double('V'),double('P');0.9808388186235655, 1-0.9808388186235655]);
    end
    if S83 == double('A')
        S146=randsrc(1, 1,[double('H'),double('Q');0.001618436341503901, 1-0.001618436341503901]);
        S183=randsrc(1, 1,[double('Q'),double('E');0.0014247772920931777, 1-0.0014247772920931777]);
        S213=randsrc(1, 1,[double('G'),double('E');0.0003734853095778233, 1-0.0003734853095778233]);
        S252=randsrc(1, 1,[double('G'),double('V');0.026296132352127483, 1-0.026296132352127483]);
        S368=randsrc(1, 1,[double('L'),double('I');0.001452442870580424, 1-0.001452442870580424]);
        S445=randsrc(1, 1,[double('V'),double('P');0.0041636695623305485, 1-0.0041636695623305485]);
    end
    if S146 == double('H')
        S183=randsrc(1, 1,[double('Q'),double('E');0.9977353688292558, 1-0.9977353688292558]);
        S213=randsrc(1, 1,[double('G'),double('E');0.9976151229263844, 1-0.9976151229263844]);
        S252=randsrc(1, 1,[double('G'),double('V');0.9984217725248132, 1-0.9984217725248132]);
        S368=randsrc(1, 1,[double('L'),double('I');1, 1-1]);
        S445=randsrc(1, 1,[double('V'),double('P');0.9808608604596399, 1-0.9808608604596399]);
        S83=randsrc(1, 1,[double('V'),double('A');1, 1-1]);
    end
    if S146 == double('Q')
        S183=randsrc(1, 1,[double('Q'),double('E');0.0021981845209855457, 1-0.0021981845209855457]);
        S213=randsrc(1, 1,[double('G'),double('E');0.0016604990985862036, 1-0.0016604990985862036]);
        S252=randsrc(1, 1,[double('G'),double('V');0.019230160989341178, 1-0.019230160989341178]);
        S368=randsrc(1, 1,[double('L'),double('I');0.0024195844007970395, 1-0.0024195844007970395]);
        S445=randsrc(1, 1,[double('V'),double('P');0.005202897175570105, 1-0.005202897175570105]);
        S83=randsrc(1, 1,[double('V'),double('A');0.002625170003479141, 1-0.002625170003479141]);
    end
    if S183 == double('Q')
        S213=randsrc(1, 1,[double('G'),double('E');0.9975936646318011, 1-0.9975936646318011]);
        S252=randsrc(1, 1,[double('G'),double('V');0.9985995917119498, 1-0.9985995917119498]);
        S368=randsrc(1, 1,[double('L'),double('I');1, 1-1]);
        S445=randsrc(1, 1,[double('V'),double('P');0.981084626081125, 1-0.981084626081125]);
        S83=randsrc(1, 1,[double('V'),double('A');1, 1-1]);
        S146=randsrc(1, 1,[double('H'),double('Q');0.9819574157536071, 1-0.9819574157536071]);
    end
    if S183 == double('E')
        S213=randsrc(1, 1,[double('G'),double('E');0.00029039216770839095, 1-0.00029039216770839095]);
        S252=randsrc(1, 1,[double('G'),double('V');0.025983184910669838, 1-0.025983184910669838]);
        S368=randsrc(1, 1,[double('L'),double('I');0.0008988329000497815, 1-0.0008988329000497815]);
        S445=randsrc(1, 1,[double('V'),double('P');0.00360915979866143, 1-0.00360915979866143]);
        S83=randsrc(1, 1,[double('V'),double('A');0.0015625864262403895, 1-0.0015625864262403895]);
        S146=randsrc(1, 1,[double('H'),double('Q');0.0011062558769843465, 1-0.0011062558769843465]);
    end
    if S213 == double('G')
        S252=randsrc(1, 1,[double('G'),double('V');0.9987962268619016, 1-0.9987962268619016]);
        S368=randsrc(1, 1,[double('L'),double('I');1, 1-1]);
        S445=randsrc(1, 1,[double('V'),double('P');0.9812329794371867, 1-0.9812329794371867]);
        S83=randsrc(1, 1,[double('V'),double('A');1, 1-1]);
        S146=randsrc(1, 1,[double('H'),double('Q');0.9823331491494652, 1-0.9823331491494652]);
        S183=randsrc(1, 1,[double('Q'),double('E');0.9980956703635, 1-0.9980956703635]);
    end
    if S213 == double('E')
        S252=randsrc(1, 1,[double('G'),double('V');0.028688750482279667, 1-0.028688750482279667]);
        S368=randsrc(1, 1,[double('L'),double('I');0.0037755608223557294, 1-0.0037755608223557294]);
        S445=randsrc(1, 1,[double('V'),double('P');0.006517665215234526, 1-0.006517665215234526]);
        S83=randsrc(1, 1,[double('V'),double('A');0.0042165022322658875, 1-0.0042165022322658875]);
        S146=randsrc(1, 1,[double('H'),double('Q');0.0040235903654301935, 1-0.0040235903654301935]);
        S183=randsrc(1, 1,[double('Q'),double('E');0.0036791048889378824, 1-0.0036791048889378824]);
    end
    if S252 == double('G')
        S368=randsrc(1, 1,[double('L'),double('I');0.9909749760700123, 1-0.9909749760700123]);
        S445=randsrc(1, 1,[double('V'),double('P');0.9726172569396965, 1-0.9726172569396965]);
        S83=randsrc(1, 1,[double('V'),double('A');0.9903987028969936, 1-0.9903987028969936]);
        S146=randsrc(1, 1,[double('H'),double('Q');0.9731984137836729, 1-0.9731984137836729]);
        S183=randsrc(1, 1,[double('Q'),double('E');0.9890117403449825, 1-0.9890117403449825]);
        S213=randsrc(1, 1,[double('G'),double('E');0.9887089527455998, 1-0.9887089527455998]);
    end
    if S252 == double('V')
        S368=randsrc(1, 1,[double('L'),double('I');0.00043975997616784644, 1-0.00043975997616784644]);
        S445=randsrc(1, 1,[double('V'),double('P');0.0029506475820294214, 1-0.0029506475820294214]);
        S83=randsrc(1, 1,[double('V'),double('A');0.001347651539869207, 1-0.001347651539869207]);
        S146=randsrc(1, 1,[double('H'),double('Q');0.0012767225114550381, 1-0.0012767225114550381]);
        S183=randsrc(1, 1,[double('Q'),double('E');0.0008653341466528592, 1-0.0008653341466528592]);
        S213=randsrc(1, 1,[double('G'),double('E');0.00025534450229100763, 1-0.00025534450229100763]);
    end
    if S368 == double('L')
        S445=randsrc(1, 1,[double('V'),double('P');0.9812918055056529, 1-0.9812918055056529]);
        S83=randsrc(1, 1,[double('V'),double('A');1, 1-1]);
        S146=randsrc(1, 1,[double('H'),double('Q');0.9819365762182968, 1-0.9819365762182968]);
        S183=randsrc(1, 1,[double('Q'),double('E');0.9978392798255674, 1-0.9978392798255674]);
        S213=randsrc(1, 1,[double('G'),double('E');0.9975685745645336, 1-0.9975685745645336]);
        S252=randsrc(1, 1,[double('G'),double('V');0.9987350681438971, 1-0.9987350681438971]);
    end
    if S368 == double('I')
        S445=randsrc(1, 1,[double('V'),double('P');0.002986477891767829, 1-0.002986477891767829]);
        S83=randsrc(1, 1,[double('V'),double('A');0.0015485440920277632, 1-0.0015485440920277632]);
        S146=randsrc(1, 1,[double('H'),double('Q');0.0012167132151646711, 1-0.0012167132151646711]);
        S183=randsrc(1, 1,[double('Q'),double('E');0.000884882338301579, 1-0.000884882338301579]);
        S213=randsrc(1, 1,[double('G'),double('E');0.00023504687111135692, 1-0.00023504687111135692]);
        S252=randsrc(1, 1,[double('G'),double('V');0.02552332494538617, 1-0.02552332494538617]);
    end
    if S445 == double('V')
        S83=randsrc(1, 1,[double('V'),double('A');0.9981812716067939, 1-0.9981812716067939]);
        S146=randsrc(1, 1,[double('H'),double('Q');0.9808657748384187, 1-0.9808657748384187]);
        S183=randsrc(1, 1,[double('Q'),double('E');0.996853549777043, 1-0.996853549777043]);
        S213=randsrc(1, 1,[double('G'),double('E');0.9965028308031465, 1-0.9965028308031465]);
        S252=randsrc(1, 1,[double('G'),double('V');0.9978305526328974, 1-0.9978305526328974]);
        S368=randsrc(1, 1,[double('L'),double('I');0.9989077609098652, 1-0.9989077609098652]);
    end
    if S445 == double('P')
        S83=randsrc(1, 1,[double('V'),double('A');0.0013592798590787412, 1-0.0013592798590787412]);
        S146=randsrc(1, 1,[double('H'),double('Q');0.0010957460088491893, 1-0.0010957460088491893]);
        S183=randsrc(1, 1,[double('Q'),double('E');0.0007212505374703524, 1-0.0007212505374703524]);
        S213=randsrc(1, 1,[double('G'),double('E');0.00015257222908026687, 1-0.00015257222908026687]);
        S252=randsrc(1, 1,[double('G'),double('V');0.02514667739295671, 1-0.02514667739295671]);
        S368=randsrc(1, 1,[double('L'),double('I');8.322121586196374e-05, 1-8.322121586196374e-05]);
    end
    
    SS83445=[S83,S146,S183,S213,S252,S368,S445];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     %%
    SSO694901=[double('XXDGRVF')
        double('XXDGRVS')
        double('XXDGLVF')
        double('XXDSRVF')
        double('HVDGRVF')
        double('HVDGLVF')    
        double('HVHSLVF')
        double('HVHSLPS')
        double('HVHSRSF')
        double('HVHSLFS')
        double('HVDGMFF')
        double('HVHSLFF')];

    if SS83445==[double('V'),double('H'),double('Q'),double('G'),double('G'),double('L'),double('V')]
            SS69490=randsrc(1,1,[1:12;1-0.000421178-0.008978284-0.000621494-0.0010324-0.000179771-0.00019518-0.001797711-0.0123-0.024-0.005-0.002,0.000421178,0.008978284,0.000621494,0.0010324,0.000179771,0.00019518,0.001797711, 0.0123,0.024,0.005,0.002]);
            for j694901=1:12
            if SS69490==j694901
                SS69490=SSO694901(j694901,:);
            end
            end
    end
    
     SSO694902=[double('HVHSLPF')
        double('HVHSLPS')
        double('HVHSLSS')
        double('HVHSLFS')];

    if SS83445==[double('A'),double('Q'),double('E'),double('E'),double('V'),double('I'),double('P')]
            SS69490=randsrc(1,1,[1:4;0.000226926,1-0.000226926-0.034-0.001,0.034,0.001]);
            for j694902=1:4
            if SS69490==j694902
                SS69490=SSO694902(j694902,:);
            end
            end
    end   
    
     SSO834451=[double('VHQGGLV')
        double('VHQEGLV')
        double('VQQGGLV')
        double('VKQGGLV')
        double('VYQGGLV')
        double('VHQGDLV')
        double('VHQGSLV')
        double('VHQGGLA')
        double('VXQGGLV')];

    if SS69490==[double('X'),double('X'),double('D'),double('G'),double('R'),double('V'),double('F')]
            SS83445=randsrc(1,1,[1:9;1-0.000973964-0.00045771-0.0098-0.007-0.018-0.002,0.000973964,0.00045771,0.0098,0.005,0.001,0.001,0.018,0.002]);
            for j834451=1:9
            if SS83445==j834451
                SS83445=SSO834451(j834451,:);
            end
            end
    end   
    
    SSO834452=[double('VHQGGLV')
        double('VQEEVIP')
        double('AHEEVIP')
        double('AQQEVIP')
        double('AQEEGIP')
        double('AQEEVIV')
        double('AQEEVIP')
        double('AKEEVIP')
         double('AQEEGIP')];

    if SS69490==[double('H'),double('V'),double('H'),double('S'),double('L'),double('P'),double('S')]
            SS83445=randsrc(1,1,[1:9;0.005139803,0.000690202,0.000881109,0.000220277,0.004244008,0.002173402,1-0.005139803-0.000690202-0.000881109-0.000220277-0.004244008-0.002173402-0.1025-0.00424,0.1025,0.00424]);
            for j834452=1:9
            if SS83445==j834452
                SS83445=SSO834452(j834452,:);
            end
            end
    end   
   
    %%
   if isequal([SS69490,SS83445],double('XXDGRVFVHQGGLV'))||isequal([SS69490,SS83445],double('XXXXXXXXXXXXXX'))
        M{2}(while_flag,:)=[SS69490,SS83445];
        while_flag=while_flag+1;
    end
    
    if ~isequal([SS69490,SS83445],double('XXDGRVFVHQGGLV'))&&~isequal([SS69490,SS83445],double('XXXXXXXXXXXXXX'))
        Record69445=[SS69490,SS83445];
        Record69445_1 = ["S69","S70","S339","S446","S452","S486","S490","S83","S146","S183","S213","S252","S368","S445"];
        for ii69445=1:length(Record69445_1)
            eval([char(Record69445_1(ii69445)),'=Record69445(ii69445)']);
        end
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score69445 = obj.bilTrain('369445', char(S69,S70,S339,S446,S452,S486,S490)', char(S83,S146,S183,S213,S252,S368,S445)');
        
        if score69445 < 0
            if  a69==0
                S69=0;
            end
            if a70==0
                S70=0;
            end
            if  a339==0
                S339=0;
            end
            if a446==0
                S446=0;
            end
            if  a452==0
                S452=0;
            end
            if a486==0
                S486=0;
            end
            if a490==0
                S490=0;
            end
            if  a83==0
                S83=0;
            end
            if a146==0
                S146=0;
            end
            if  a183==0
                S183=0;
            end
            if a213==0
                S213=0;
            end
            if  a252==0
                S252=0;
            end
            if a368==0
                S368=0;
            end
            if a445==0
                S445=0;
            end
            continue
        end
        
        if score69445>=0
            M{2}(while_flag,:)=[S69,S70,S339,S446,S452,S486,S490,S83,S146,S183,S213,S252,S368,S445];
            while_flag=while_flag+1;
        end
    end
[S69,S70,S339,S446,S452,S486,S490,S83,S146,S183,S213,S252,S368,S445]=deal(0);
[a69,a70,a339,a446,a452,a486,a490,a83,a146,a183,a213,a252,a368,a445]=deal(1);
end

%% Paragraph 3
while_flag = 1;
[S144]=deal(0);
[a144]=deal(1);
while while_flag <= num
    if S144==0
        S144=randsrc(1,1,[double('Y'),double('X'),100;pn2(17:17,:)*alpha,(1-pn2(17:17,:))*alpha,1-alpha]);
    end
    if S144==100
        S144=randsrc(1,1,[double('C'),double('F'),double('H'),double('K'),double('L'),double('N'),double('S');0.085714286,0.228571429,0.371428571,0.057142857,0.114285714,0.114285714,0.028571429]);
        a144=0;
    end
    
    if S144==double('Y') || S144==double('X')
        M{3}(while_flag,:)=[S144];
        while_flag=while_flag+1;
    end
    
    if (S144~=double('Y')) && (S144~=double('X'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score144 = obj.bilTrain('3144',char(S144));
        if score144<0
            if a144==0
                S144=0;
            end
            continue
        end   
        if score144>=0
            M{3}(while_flag,:)=[S144];
            while_flag=while_flag+1;
            S144 = 0;
            a144 = 1;    
        end
    end
end

%% Paragraph 4
while_flag = 1;
[S145,S147]=deal(0);
[a145,a147]=deal(1);
while while_flag <= num
    if S145==0
        S145=randsrc(1,1,[double('Y'),double('Q'),double('X'),100;pn2(18:18,:)*alpha,(1-pn2(18:18,:)-0.01)*alpha,0.01*alpha,1-alpha]);
    end
    if S147==0
        S147=randsrc(1,1,[double('K'),double('E'),double('X'),100;pn2(19:19,:)*alpha,(1-pn2(19:19,:)-0.03)*alpha,0.03*alpha,1-alpha]);
    end
    if S145==100
        S145=randsrc(1, 1,[double('Q'),double('H'),double('K');1-0.2635-0.0246,0.2635,0.0246]);
        a145=0;
    end
    if S147==100
        S147=randsrc(1, 1,[double('E'),double('I'),double('N'),double('Q'),double('T');1-0.02300266-0.023101172-0.003940498-0.002413555,0.02300266,0.023101172,0.003940498,0.002413555]);
        a147=0;
    end
    
    if S145 == double('Y')
        S147=randsrc(1, 1,[double('K'),double('E');0.9544284484929108, 1-0.9544284484929108]);
    end
    if S147 == double('K')
        S145=randsrc(1, 1,[double('Y'),double('Q');0.9952038745170568, 1-0.9952038745170568]);
    end
    
    
    if isequal([S145,S147],double('YK'))||isequal([S145,S147],double('XX'))
        M{4}(while_flag,:)=[S145,S147];
        while_flag=while_flag+1;
        S145 = 0;
        S147 = 0;
    end
    
    if ~isequal([S145,S147],double('YK'))&&~isequal([S145,S147],double('XX'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score145147 = obj.bilTrain('3145147', char(S145), char(S147));
        if score145147 < 0
            if  a145==0
                S145=0;
            end
            if  a147==0
                S147=0;
            end
            continue
        end
        if score145147>=0
            a145=1;
            a147=1;
            M{4}(while_flag,:)=[S145,S147];
            while_flag=while_flag+1;
            S145 = 0;
            S147 = 0;
        end
    end
end

%% Paragraph 5
while_flag = 1;
[S180,S456,S478,S658]=deal(0);
[a180,a456,a478,a658]=deal(1);
while while_flag <= num
    
    if S180==0
        S180=randsrc(1,1,[double('E'),100;alpha,1-alpha]);
    end
    if S456==0
        S456=randsrc(1,1,[double('F'),100;alpha,1-alpha]);
    end
    if S478==0
        S478=randsrc(1,1,[double('K'),100;alpha,1-alpha]);
    end
    if S658==0
        S658=randsrc(1,1,[double('N'),double('S'),100;pn2(23:23,:)*alpha,(1-pn2(23:23,:))*alpha,1-alpha]);
    end
    
    if S180==100
        S180=randsrc(1,1,[double('V'),double('K'),double('G'),double('D');0.025291829,0.031128405,0.027237354,1-0.025291829-0.031128405-0.027237354]);
        a180=0;
    end
    if S456==100
        S456=randsrc(1,1,[double('L'),double('V');0.9972,1-0.9972]);
        a456=0;
    end
    if S478==100
        S478=randsrc(1,1,[double('R'),double('T'),double('E'),double('I'),double('Q');0.653191489,0.275319149,0.02212766,0.028085106,1-0.653191489-0.275319149-0.02212766-0.028085106]);
        a478=0;
    end
    if S658==100
        S658=randsrc(1,1,[double('S');1]);
        a658=0;
    end
    
    if S180 == double('E')
        S478=randsrc(1, 1,[double('K'),double('R');0.9947464296123579, 1-0.9947464296123579]);
    end
    if S478 == double('K')
        S180=randsrc(1, 1,[double('E'),double('V');1, 1-1]);
    end
    SS180478=[S180,S478];
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%(180,478),456
    if SS180478==[double('E'),double('K')]
        S456=randsrc(1, 1,[double('F'),double('L');0.997429,1-0.997429]);
    end
    SSO1804781=[double('EK')
        double('ER')
        double('VR')];
    if S456==[double('F')]
        SS180478=randsrc(1,1,[1:3;1-0.002285357-0.003253358,0.002285357,0.003253358]);
        for j1804781=1:3
            if SS180478==j1804781
                SS180478=SSO1804781(j1804781,:);
            end
        end
    end
    SSS180478=[SS180478,S456];
    
    if SSS180478==[double('E'),double('K'),double('F')]
        S658=randsrc(1, 1,[double('N'),double('S');0.963185183,1-0.963185183]);
    end
    
    SSO1804782=[double('EKF')
        double('ERF')
        double('EKL')
        double('VRF')];
    if S658==[double('N')]
        SSS180478=randsrc(1,1,[1:4;0.986420779,0.00232,0.002602277,1-0.986420779-0.00232-0.002602277]);
        for j1804782=1:4
            if SSS180478==j1804782
                SSS180478=SSO1804782(j1804782,:);
            end
        end
    end
    if isequal([SSS180478,S658],double('EKFN'))||isequal([SSS180478,S658],double('XXXX'))
        M{5}(while_flag,:)=[SSS180478,S658];
        while_flag=while_flag+1;
    end
    
    if ~isequal([SSS180478,S658],double('EKFN'))&&~isequal([SSS180478,S658],double('XXXX'))
        Record180658=[SSS180478,S658];
        Record180658_1 = ["S180","S478","S456","S658"];
        for ii180658=1:length(Record180658_1)
            eval([char(Record180658_1(ii180658)),'=Record180658(ii180658)']);
        end
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score180658 = obj.bilTrain('3180658', char(S180,S478,S456)', char(S658)');
        
        if score180658 < 0
            if  a180==0
                S180=0;
            end
            if a478==0
                S478=0;
            end
            if  a456==0
                S456=0;
            end
            if a658==0
                S658=0;
            end
            continue
        end
        
        if score180658>=0
            M{5}(while_flag,:)=[S180,S478,S456,S658];
            while_flag=while_flag+1;
        end
    end
[S180,S456,S478,S658]=deal(0);
[a180,a456,a478,a658]=deal(1);
end

%% Paragraph 6
while_flag = 1;
[S346]=deal(0);
[a346]=deal(1);
while while_flag <= num
    if S346==0
        S346=randsrc(1,1,[double('T'),double('R'),100;pn2(24:24,:)*h,(1-pn2(24:24,:))*h,1-h]);
    end
    if S346==100
        S346=randsrc(1,1,[double('T'),double('S'),double('I'),double('K');0.983588036,0.011327823,0.004703574,1-0.983588036-0.011327823-0.004703574]);
        a346=0;
    end
    
    if S346==double('R') || S346==double('X')
        M{6}(while_flag,:)=[S346];
        while_flag=while_flag+1;
    end
    
    if (S346~=double('R')) && (S346~=double('X'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score346 = obj.bilTrain('3346',char(S346));
        if score346<0
            if a346==0
                S346=0;
            end
            continue
        end
        if score346>=0
            M{6}(while_flag,:)=[S346];
            S346 = 0;
            a346 = 1;
            while_flag=while_flag+1;
        end
    end
    S346 = 0;
    a346 = 1;
end
 
%% Paragraph 7
while_flag = 1;
S444 = 0;
a444 = 1;
while while_flag <= num
    if S444==0
        S444=randsrc(1,1,[double('K'),double('T'),100;pn2(25:25,:)*h,(1-pn2(25:25,:))*h,1-h]);
    end
    if S444==100
        S444=randsrc(1,1,[double('K'),double('M'),double('N'),double('Q'),double('R');0.962850817,0.007429837,0.012835756,0.000110972,1-0.962850817-0.007429837-0.012835756-0.000110972]);
        a444=0;
    end
    
    if S444==double('T') || S444==double('X')
        M{7}(while_flag,:)=[S444];
        while_flag=while_flag+1;
    end
    
    if (S444~=double('T')) && (S444~=double('X'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score444 = obj.bilTrain('3444',char(S444));
        if score444<0
            if a444==0
                S444=0;
            end
            continue
        end
        if score444>=0
            M{7}(while_flag,:)=[S444];
            while_flag=while_flag+1;
        end
    end
    S444 = 0;
    a444 = 1;
end

%% Paragraph 8
while_flag = 1;
S460 = 0;                                                                                                                                                                                                                                                                                                                                                                                                      
a460 = 1;
while while_flag <= num
    if S460==0
        S460=randsrc(1,1,[double('K'),double('N'),100; pn2(26:26,:)*h,(1-pn2(26:26,:))*h,1-h]);
    end
    
    if S460==100
        S460=randsrc(1,1,[double('K'),double('S'),double('Y');0.998291172,0.001243319,1-0.998291172-0.001243319]);
        a460=0;
    end
    if S460==double('N') || S460==double('X')
        M{8}(while_flag,:)=[S460];
        while_flag=while_flag+1;
    end
    
    if (S460~=double('N')) && (S460~=double('X'))
        file = 'd:/test/bil/';
        insert(py.sys.path, int32(0), file);
        obj = py.importlib.import_module('bilModel');
        py.importlib.reload(obj);
        score460 = obj.bilTrain('3460',char(S460));
        if score460<0
            if a460==0
                S460=0;
            end
            continue
        end
        if score460>=0
            M{8}(while_flag,:)=[S460];
            while_flag=while_flag+1;
        end
    end
    S460 = 0;
    a460 = 1;
end

MMcom = [];
for i=1:8
    MMcom = [MMcom, M{i}];
end
MMMcom=[];

for iiii=1:num
    Recordall=[MMcom(iiii,:)];
    %
    Recordall_1 = ["S68","S250","S69","S70","S339","S446","S452","S486","S490","S83","S146","S183","S213","S252","S368","S445","S144","S145","S147","S180","S478","S456","S658","S346","S444","S460"];
    for iiall=1:length(Recordall_1)
        eval([char(Recordall_1(iiall)),'=Recordall(iiall)']);
    end
    %
    MMMcom(iiii,:)=[double('QCVNLITRT'),double('QXXX'),double('SYTNSFTRGVYYPDKVFRSSVLHSTQDLFLPFFSNVTWFHA'),S68,S69,S70,double('SGTNGTKRFDNP' ),S83,double('LPFNDGVYFASTEKSNIIRGWIFGTTLDSKTQSLLIVNNATNVVIKVCEFQFCNDPFLDV'),S144,S145,S146,S147,double('NNKSWMESEFRVYSSANNCTFEYVSQPFLMDL'),S180,double('GK'),S183,double('GNFKNLREFVFKNIDGYFKIYSKHTPINL'),S213,double('RDLPQGFSALEPLVDLPIGINITRFQTLLALHRSYL'),S250,double('P'),S252,double('DSSSGWTAGAAAYYVGYLQPRTFLLKYNENGTITDAVDCALDPLSETKCTLKSFTVEKGIYQTSNFRVQPTESIVRFPNITNLCPF'),S339,double('EVFNAT'),S346,double('FASVYAWNRKRISNCVADYSV'),S368, double('YNFAPFFAFKCYGVSPTKLNDLCFTNVYADSFVIRGNEVSQIAPGQTGNIADYNYKLPDDFTGCVIAWNSNKLDS'),S444,S445,S446,double('GNYNY'),S452,double('YRL'),S456,double('RKS'),S460,double('LKPFERDISTEIYQAGN'),S478,double('PCNGVAG'),S486,double('NCY'),S490,double('PLQSYGFRPTYGVGHQPYRVVVLSFELLHAPATVCGPKKSTNLVKNKCVNFNFNGLTGTGVLTESNKKFLPFQQFGRDIADTTDAVRDPQTLEILDITPCSFGGVSVITPGTNTSNQVAVLYQGVNCTEVPVAIHADQLTPTWRVYSTGSNVFQTRAGCLIGAEYVN'),S658,double('SYECDIPIGAGICASYQTQTKSHRRAR')];
end

MMu=unique(MMMcom,'rows');

[C8,~,n8]=unique(MMMcom,'rows');
s8=sum(bsxfun(@eq,n8,unique(n8)'));
CH8= [];
CH8=[C8 s8.'];

CHHH = cell(1,8);
for i=1:8
    [C111,~,n111]=unique(M{i},'rows');
    s111=sum(bsxfun(@eq,n111,unique(n111)'));
    CHHH{i} = [];
    CHHH{i}=[C111 s111.'];
end

[c123, ia123, ib123] = intersect(dataset2(:,1:672),CH8(:,1:672),'rows');
dd=CH8(ib123,673);
sumdd=sum(dd)
%[c1234, ia1234, ib1234] = intersect(BA12(:,2:673),CH7(:,1:672),'rows');
%BBF=CH7(ib1234,673);

d1=CH8(ib123,673)


