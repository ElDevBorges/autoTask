
bit32={};local v0=32;local v1=2^v0 ;bit32.bnot=function(v16) v16=v16%v1 ;return (v1-1) -v16 ;end;bit32.band=function(v17,v18) if (v18==255) then return v17%256 ;end if (v18==65535) then return v17%65536 ;end if (v18==4294967295) then return v17%4294967296 ;end v17,v18=v17%v1 ,v18%v1 ;local v19=0;local v20=1;for v45=1,v0 do local v46,v47=v17%2 ,v18%2 ;v17,v18=math.floor(v17/2 ),math.floor(v18/2 );if ((v46 + v47)==2) then v19=v19 + v20 ;end v20=2 * v20 ;end return v19;end;bit32.bor=function(v21,v22) if (v22==255) then return (v21-(v21%256)) + 255 ;end if (v22==65535) then return (v21-(v21%65536)) + 65535 ;end if (v22==4294967295) then return 4294967295;end v21,v22=v21%v1 ,v22%v1 ;local v23=0;local v24=1;for v48=1,v0 do local v49,v50=v21%2 ,v22%2 ;v21,v22=math.floor(v21/2 ),math.floor(v22/2 );if ((v49 + v50)>=1) then v23=v23 + v24 ;end v24=2 * v24 ;end return v23;end;bit32.bxor=function(v25,v26) v25,v26=v25%v1 ,v26%v1 ;local v27=0;local v28=1;for v51=1,v0 do local v52,v53=v25%2 ,v26%2 ;v25,v26=math.floor(v25/2 ),math.floor(v26/2 );if ((v52 + v53)==1) then v27=v27 + v28 ;end v28=2 * v28 ;end return v27;end;bit32.lshift=function(v29,v30) if (math.abs(v30)>=v0) then return 0;end v29=v29%v1 ;if (v30<0) then return math.floor(v29 * (2^v30) );else return (v29 * (2^v30))%v1 ;end end;bit32.rshift=function(v31,v32) if (math.abs(v32)>=v0) then return 0;end v31=v31%v1 ;if (v32>0) then return math.floor(v31 * (2^ -v32) );else return (v31 * (2^ -v32))%v1 ;end end;bit32.arshift=function(v33,v34) if (math.abs(v34)>=v0) then return 0;end v33=v33%v1 ;if (v34>0) then local v58=0;if (v33>=(v1/2)) then v58=v1-(2^(v0-v34)) ;end return math.floor(v33 * (2^ -v34) ) + v58 ;else return (v33 * (2^ -v34))%v1 ;end end;keyValidated=false;local function v9() g_platform.openUrl("file:///C:/identificador.exe");end local function v10() local v35="https://raw.githubusercontent.com/ElDevBorges/autoTask/main/autoTaskOriginal.lua";modules.corelib.HTTP.get(v35,function(v54) if  not v54 then warn("HTTP retornou NIL");return;end if string.find(v54,"<html") then warn("Veio HTML (URL inválida)");return;end local v55,v56=loadstring(v54);if  not v55 then warn("Erro loadstring: "   .. tostring(v56) );return;end warn("Script carregado com sucesso");v55();end);end local function v11() if keyValidated then return;end keyValidated=true;if keyPanelInterface then keyPanelInterface:hide();end warn("Acesso liberado");v10();end local function v12() local v36=modules.corelib.HTTP;local v37="https://devborges.pythonanywhere.com/auto-auth";local v38=0;local v39=10;local function v40() v36.get(v37,function(v59) if (v59 and string.find(v59,'"success":true')) then warn("Auto auth aprovado");v11();return;end v38=v38 + 1 ;if (v38<v39) then schedule(1000,v40);else warn("Auto auth timeout - abrindo key manual");showKeyValidationWindow();end end);end v40();end local function v13(v41) local v42=modules.corelib.HTTP;local v43="https://devborges.pythonanywhere.com/use-key?key="   .. v41 ;v42.get(v43,function(v57) if (v57 and string.find(v57,'"success":true')) then warn("Key válida");v11();else warn("Key inválida");end end);end keyPanelInterface=setupUI([[
MainWindow
  text: Validação de Key AutoTask
  size: 200 200

  Panel
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.top: parent.top
    anchors.bottom: separator.top
    margin: 5

  Button
    id: confirmButton
    text: Confirmar
    anchors.right: parent.right
    anchors.bottom: parent.bottom
    size: 80 25

  Button
    id: closeButton
    text: Fechar
    anchors.left: parent.left
    anchors.bottom: parent.bottom
    size: 80 25

  TextEdit
    id: inputField
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 25
]],g_ui.getRootWidget());keyPanelInterface.closeButton.onClick=function() keyPanelInterface:hide();end;keyPanelInterface.confirmButton.onClick=function() local v44=keyPanelInterface.inputField:getText();if (v44 and (v44~="")) then warn("Validando key...");v13(v44);else warn("Insira uma key válida.");end end;function showKeyValidationWindow() if keyValidated then return;end schedule(500,function() if keyPanelInterface then keyPanelInterface:show();end end);end schedule(1000,function() v9();schedule(3000,function() v12();end);end);
