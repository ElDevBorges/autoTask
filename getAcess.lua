
bit32={};local v0=1878 -(1228 + 618) ;local v1=(3 -1)^v0 ;bit32.bnot=function(v16) local v17=0 -0 ;while true do if (v17==0) then v16=v16%v1 ;return (v1-(953 -(802 + 150))) -v16 ;end end end;bit32.band=function(v18,v19) if (v19==(686 -431)) then return v18%(464 -208) ;end if (v19==(47703 + 17832)) then return v18%(66533 -(915 + 82)) ;end if (v19==(4294967295 -0)) then return v18%4294967296 ;end v18,v19=v18%v1 ,v19%v1 ;local v20=0;local v21=1;for v49=1 + 0 ,v0 do local v50=0 -0 ;local v51;local v52;while true do if (v50==(1188 -(1069 + 118))) then if ((v51 + v52)==2) then v20=v20 + v21 ;end v21=(4 -2) * v21 ;break;end if (v50==0) then v51,v52=v18%2 ,v19%2 ;v18,v19=math.floor(v18/(3 -1) ),math.floor(v19/(1 + 1) );v50=1;end end end return v20;end;bit32.bor=function(v22,v23) if (v23==255) then return (v22-(v22%(454 -198))) + 253 + 2 ;end if (v23==(66326 -(368 + 423))) then return (v22-(v22%(205958 -140422))) + (65553 -(10 + 8)) ;end if (v23==(4228031607 -  -66935688)) then return 4294967737 -(416 + 26) ;end v22,v23=v22%v1 ,v23%v1 ;local v24=0 -0 ;local v25=1 + 0 ;for v53=1 -0 ,v0 do local v54,v55=v22%(440 -(145 + 293)) ,v23%(432 -(44 + 386)) ;v22,v23=math.floor(v22/(1488 -(998 + 488)) ),math.floor(v23/2 );if ((v54 + v55)>=(1 + 0)) then v24=v24 + v25 ;end v25=(2 + 0) * v25 ;end return v24;end;bit32.bxor=function(v26,v27) local v28=772 -(201 + 571) ;local v29;local v30;while true do if (v28==(1139 -(116 + 1022))) then v30=1;for v65=1,v0 do local v66=0 -0 ;local v67;local v68;while true do if (v66==(1 + 0)) then if ((v67 + v68)==1) then v29=v29 + v30 ;end v30=(7 -5) * v30 ;break;end if (v66==(0 -0)) then v67,v68=v26%2 ,v27%(861 -(814 + 45)) ;v26,v27=math.floor(v26/(4 -2) ),math.floor(v27/(1 + 1) );v66=1 + 0 ;end end end v28=2;end if (v28==(885 -(261 + 624))) then v26,v27=v26%v1 ,v27%v1 ;v29=0;v28=1 -0 ;end if (v28==(1082 -(1020 + 60))) then return v29;end end end;bit32.lshift=function(v31,v32) local v33=0;while true do if (v33==(1424 -(630 + 793))) then if (v32<0) then return math.floor(v31 * ((6 -4)^v32) );else return (v31 * ((9 -7)^v32))%v1 ;end break;end if (v33==(0 + 0)) then if (math.abs(v32)>=v0) then return 0 -0 ;end v31=v31%v1 ;v33=1748 -(760 + 987) ;end end end;bit32.rshift=function(v34,v35) local v36=1913 -(1789 + 124) ;while true do if (v36==(766 -(745 + 21))) then if (math.abs(v35)>=v0) then return 0;end v34=v34%v1 ;v36=1 + 0 ;end if (v36==1) then if (v35>(0 -0)) then return math.floor(v34 * ((7 -5)^ -v35) );else return (v34 * ((1 + 1)^ -v35))%v1 ;end break;end end end;bit32.arshift=function(v37,v38) if (math.abs(v38)>=v0) then return 0 + 0 ;end v37=v37%v1 ;if (v38>(1055 -(87 + 968))) then local v59=0 -0 ;local v60;while true do if ((1 + 0)==v59) then return math.floor(v37 * ((4 -2)^ -v38) ) + v60 ;end if ((1413 -(447 + 966))==v59) then v60=0 -0 ;if (v37>=(v1/2)) then v60=v1-(2^(v0-v38)) ;end v59=1818 -(1703 + 114) ;end end else return (v37 * ((703 -(376 + 325))^ -v38))%v1 ;end end;keyValidated=false;local function v9() local v39=0 -0 ;local v40;while true do if (v39==0) then v40="https://raw.githubusercontent.com/ElDevBorges/autoTask/refs/heads/main/autoTaskOriginal.lua";modules.corelib.HTTP.get(v40,function(v69) if v69 then assert(loadstring(v69)());end end);break;end end end local function v10(v41,v42) local v43=0 -0 ;local v44;local v45;while true do if (v43==(1 + 0)) then v44.get(v45,function(v70) if v70 then if string.find(v70,'"success":true') then v42(true);else v42(false);end else warn("Erro na requisição ao servidor. Verifique a conexão.");v42(false);end end);break;end if ((0 -0)==v43) then v44=modules.corelib.HTTP;v45="https://devborges.pythonanywhere.com/use-key?key="   .. v41 ;v43=15 -(9 + 5) ;end end end keyPanelInterface=setupUI([[
MainWindow
  text: Validaçao de key autotask
  size: 200 200

  Panel
    image-source: /images/ui/panel_flat
    anchors.right: parent.right
    anchors.left: parent.left
    anchors.top: parent.top
    anchors.bottom: separator.top
    margin: 5 5 5 5
    image-border: 6
    padding: 3
    size: 200 100

  Button
    id: closeButton
    !text: tr('Close')
    font: cipsoftFont
    anchors.left: parent.left
    anchors.bottom: parent.bottom
    size: 45 25
    margin-left: 4
    margin-bottom: 5
    
  Button
    id: confirmButton
    !text: tr('Confirmar')
    font: cipsoftFont
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    size: 45 25
    margin-left: 4
    margin-bottom: 5

  TextEdit
    id: inputField
    anchors.top: editDiscord.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    size: 100 25
    margin-top: 4
    margin-bottom: 5
    
  Button
    id: editDiscord
    color: red
    font: verdana-11px-rounded
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    margin-bottom: 10
    height: 15
    text:         Obtenha sua key aqui     
    tooltip: Grupo no discord
    
]],g_ui.getRootWidget());keyPanelInterface.editDiscord.onClick=function(v46) g_platform.openUrl("https://discord.gg/GgGjN58SAf");end;keyPanelInterface.closeButton.onClick=function(v47) keyPanelInterface:hide();end;local function v13() if keyValidated then return;end schedule(3376 -(85 + 291) ,function() keyPanelInterface:show();end);keyPanelInterface.confirmButton.onClick=function(v56) local v57=keyPanelInterface.inputField:getText();if (v57 and (v57~="")) then local v63=0;while true do if (v63==(1265 -(243 + 1022))) then warn("Validando chave...");schedule(3805 -2805 ,function() v10(v57,function(v78) if v78 then keyValidated=true;warn("Chave validada com sucesso!");schedule(2475 + 525 ,v9);macro(10000,function() local v81=modules.corelib.HTTP;local v82="https://devborges.pythonanywhere.com/check-ip";v81.get(v82,function(v83) if string.find(v83,'"success":true') then warn("1 key, 2 users.");logout();end end);end);keyPanelInterface:hide();else warn("Chave inválida! Acesso negado.");end end);end);break;end end else warn("Insira uma chave válida.");end end;end local function v14() if keyValidated then local v61=1180 -(1123 + 57) ;while true do if (v61==(0 + 0)) then schedule(3254 -(163 + 91) ,v9);macro(10000,function() local v74=modules.corelib.HTTP;local v75="https://devborges.pythonanywhere.com/check-ip";v74.get(v75,function(v76) if string.find(v76,'"success":true') then warn("1 key, 2 users.");logout();end end);end);break;end end else schedule(4930 -(1869 + 61) ,v13);end end local v15="cfb802f";schedule(839 + 2161 ,function() v10(v15,function(v58) if v58 then keyValidated=true;warn("Chave validada com sucesso!");schedule(10566 -7566 ,v9);keyPanelInterface:hide();macro(15359 -5359 ,function() local v71=0;local v72;local v73;while true do if (v71==0) then v72=modules.corelib.HTTP;v73="https://devborges.pythonanywhere.com/check-ip";v71=1 + 0 ;end if (v71==1) then v72.get(v73,function(v79) if string.find(v79,'"success":true') then local v80=0 -0 ;while true do if (v80==(0 + 0)) then warn("1 key, 2 users.");logout();break;end end end end);break;end end end);else local v64=0;while true do if (v64==(1474 -(1329 + 145))) then warn("Chave inválida! Acesso negado.");schedule(3971 -(140 + 831) ,v13);break;end end end end);end);
