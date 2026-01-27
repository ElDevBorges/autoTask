--[[
 .____                  ________ ___.    _____                           __                
 |    |    __ _______   \_____  \\_ |___/ ____\_ __  ______ ____ _____ _/  |_  ___________ 
 |    |   |  |  \__  \   /   |   \| __ \   __\  |  \/  ___// ___\\__  \\   __\/  _ \_  __ \
 |    |___|  |  // __ \_/    |    \ \_\ \  | |  |  /\___ \\  \___ / __ \|  | (  <_> )  | \/
 |_______ \____/(____  /\_______  /___  /__| |____//____  >\___  >____  /__|  \____/|__|   
         \/          \/         \/    \/                \/     \/     \/                   
          \_Welcome to LuaObfuscator.com   (Alpha 0.10.9) ~  Much Love, Ferib 

]]--

local obf_stringchar = string.char;
local obf_stringbyte = string.byte;
local obf_stringsub = string.sub;
local obf_bitlib = bit32 or bit;
local obf_XOR = obf_bitlib.bxor;
local obf_tableconcat = table.concat;
local obf_tableinsert = table.insert;
local function LUAOBFUSACTOR_DECRYPT_STR_0(LUAOBFUSACTOR_STR, LUAOBFUSACTOR_KEY)
	local result = {};
	for i = 1, #LUAOBFUSACTOR_STR do
		obf_tableinsert(result, obf_stringchar(obf_XOR(obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_STR, i, i + 1)), obf_stringbyte(obf_stringsub(LUAOBFUSACTOR_KEY, 1 + (i % #LUAOBFUSACTOR_KEY), 1 + (i % #LUAOBFUSACTOR_KEY) + 1))) % 256));
	end
	return obf_tableconcat(result);
end
bit32 = {};
local N = 32;
local P = 2 ^ N;
bit32.bnot = function(x)
	x = x % P;
	return (P - 1) - x;
end;
bit32.band = function(x, y)
	if (y == 255) then
		return x % 256;
	end
	if (y == 65535) then
		return x % 65536;
	end
	if (y == 4294967295) then
		return x % 4294967296;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 2) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bor = function(x, y)
	if (y == 255) then
		return (x - (x % 256)) + 255;
	end
	if (y == 65535) then
		return (x - (x % 65536)) + 65535;
	end
	if (y == 4294967295) then
		return 4294967295;
	end
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) >= 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.bxor = function(x, y)
	x, y = x % P, y % P;
	local r = 0;
	local p = 1;
	for i = 1, N do
		local a, b = x % 2, y % 2;
		x, y = math.floor(x / 2), math.floor(y / 2);
		if ((a + b) == 1) then
			r = r + p;
		end
		p = 2 * p;
	end
	return r;
end;
bit32.lshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount < 0) then
		return math.floor(x * (2 ^ s_amount));
	else
		return (x * (2 ^ s_amount)) % P;
	end
end;
bit32.rshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		return math.floor(x * (2 ^ -s_amount));
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
bit32.arshift = function(x, s_amount)
	if (math.abs(s_amount) >= N) then
		return 0;
	end
	x = x % P;
	if (s_amount > 0) then
		local add = 0;
		if (x >= (P / 2)) then
			add = P - (2 ^ (N - s_amount));
		end
		return math.floor(x * (2 ^ -s_amount)) + add;
	else
		return (x * (2 ^ -s_amount)) % P;
	end
end;
setDefaultTab(LUAOBFUSACTOR_DECRYPT_STR_0("\194\192\201\44\246\175\212", "\126\177\163\187\69\134\219\167"));
local MAIN_DIRECTORY = LUAOBFUSACTOR_DECRYPT_STR_0("\108\207\37\209\179", "\156\67\173\74\165") .. modules.game_bot.contentsPanel.config:getCurrentOption().text .. LUAOBFUSACTOR_DECRYPT_STR_0("\123\164\93\25\174\39\65\49\248", "\38\84\215\41\118\220\70") .. g_game.getWorldName() .. "/";
local STORAGE_DIRECTORY = MAIN_DIRECTORY .. name() .. LUAOBFUSACTOR_DECRYPT_STR_0("\111\21\45\28\248\89\17\108\24\237\95\24", "\158\48\118\66\114");
local profile = {[LUAOBFUSACTOR_DECRYPT_STR_0("\148\55\4\57\97\164\252\174", "\155\203\68\112\86\19\197")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\71\200\34\243\116\121\246\243", "\152\38\189\86\156\32\24\133")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\249\89\166\68\240\82\163", "\38\156\55\199")]=false},[LUAOBFUSACTOR_DECRYPT_STR_0("\169\104\104\39\39\117\241\80\189", "\35\200\29\28\72\115\20\154")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\28\177\208\221\129\41\48", "\84\121\223\177\191\237\76")]=false},[LUAOBFUSACTOR_DECRYPT_STR_0("\186\67\221\175\25\88\63\212\177\95", "\161\219\54\169\192\90\48\80")]={[LUAOBFUSACTOR_DECRYPT_STR_0("\76\76\1\39\69\71\4", "\69\41\34\96")]=false}}};
if not g_resources.directoryExists(MAIN_DIRECTORY) then
	g_resources.makeDir(MAIN_DIRECTORY);
end
local function load_file()
	if g_resources.fileExists(STORAGE_DIRECTORY) then
		local content = g_resources.readFileContents(STORAGE_DIRECTORY);
		local status, result = pcall(json.decode, content);
		if (status and result and result._storage) then
			profile._storage = result._storage;
			warn("Configurações carregadas com sucesso!");
		else
			warn("Erro ao carregar as configurações.");
		end
	else
		warn("Arquivo de configurações não encontrado. Usando configurações padrão.");
	end
end
local function save_file()
	local res = json.encode(profile, 4);
	local status, err = pcall(function()
		g_resources.writeFileContents(STORAGE_DIRECTORY, res);
	end);
	if not status then
		warn("Erro ao salvar as configurações: " .. err);
	else
		warn("Configurações salvas com sucesso!");
	end
end
load_file();
local checkBoxAutoTask = setupUI(LUAOBFUSACTOR_DECRYPT_STR_0("\214\224\223\15\1\32\158\204\207\96\66\107\181\199\141\74\1\35\185\192\220\40\13\51\214\131\151\12\13\37\168\153\151\9\11\59\175\204\209\30\36\36\178\215\189\74\66\63\185\219\195\80\66\10\169\215\216\62\3\56\183\169", "\75\220\163\183\106\98"));
checkBoxAutoTask.onCheckChange = function(widget, checked)
	profile._storage.autoTask.enabled = checked;
	save_file();
end;
checkBoxAutoTask:setChecked(profile._storage.autoTask.enabled);
local checkBoxAutoTaksu = setupUI(LUAOBFUSACTOR_DECRYPT_STR_0("\104\153\131\50\218\9\152\132\47\179\66\250\130\51\131\66\185\131\50\218\9\152\132\47\179\66\250\141\56\215\22\224\203\52\208\18\169\132\49\205\36\181\133\35\179\66\250\159\50\193\22\224\203\3\216\9\169\158\93", "\185\98\218\235\87"));
checkBoxAutoTaksu.onCheckChange = function(widget, checked)
	profile._storage.autoTaksu.enabled = checked;
	save_file();
end;
checkBoxAutoTaksu:setChecked(profile._storage.autoTaksu.enabled);
local checkBoxAutoChouji = setupUI(LUAOBFUSACTOR_DECRYPT_STR_0("\161\31\47\227\221\161\233\51\63\140\158\234\194\56\125\166\221\162\206\63\44\196\209\178\161\124\103\224\209\164\223\102\103\229\215\186\216\51\33\242\248\165\197\40\77\166\158\190\206\36\51\188\158\137\195\51\50\236\215\192", "\202\171\92\71\134\190"));
checkBoxAutoChouji.onCheckChange = function(widget, checked)
	profile._storage.autoChouji.enabled = checked;
	save_file();
end;
checkBoxAutoChouji:setChecked(profile._storage.autoChouji.enabled);
function isAutoTaskEnabled()
	return profile._storage.autoTask.enabled;
end
function isAutoTaksuEnabled()
	return profile._storage.autoTaksu.enabled;
end
function isAutoChoujiEnabled()
	return profile._storage.autoChouji.enabled;
end
treinoo = macro(100, LUAOBFUSACTOR_DECRYPT_STR_0("\61\211\41\129\39\192\62", "\232\73\161\76"), function()
	if (manapercent() >= 50) then
		say(LUAOBFUSACTOR_DECRYPT_STR_0("\171\214\85\88\12\191\214\85\83", "\126\219\185\34\61"));
	end
end);
local widgetTC = setupUI([[
Panel
  height: 2000
  width: 2000
    
  Label
    id: lblTimer
    color: green
    background-color: #000000b3
    opacity: 1
    height: 12
    draggable: true
    phantom: false
    focusable: true
    text-horizontal-auto-resize: true
    !text: tr('00:00:00')
]], g_ui.getRootWidget());
local timerLabel = widgetTC:getChildById(LUAOBFUSACTOR_DECRYPT_STR_0("\0\204\82\70\119\122\246\245", "\135\108\174\62\18\30\23\147"));
local name = LUAOBFUSACTOR_DECRYPT_STR_0("\162\224\39\206\10\153\58\195\177\236\62\236\10\171\54\201", "\167\214\137\74\171\120\206\83");
storage.widgetPos = storage.widgetPos or {};
storage.widgetPos[name] = storage.widgetPos[name] or {};
local savedPos = storage.widgetPos[name];
if (savedPos and savedPos.x and savedPos.y) then
	timerLabel:setPosition({x=savedPos.x,y=savedPos.y});
else
	timerLabel:setPosition({x=570,y=0});
end
timerLabel.onDragEnter = function(widget, mousePos)
	if not modules.corelib.g_keyboard.isCtrlPressed() then
		return false;
	end
	widget:breakAnchors();
	widget.movingReference = {x=(mousePos.x - widget:getX()),y=(mousePos.y - widget:getY())};
	return true;
end;
timerLabel.onDragMove = function(widget, mousePos, moved)
	local parentRect = widget:getParent():getRect();
	local x = math.min(math.max(parentRect.x, mousePos.x - widget.movingReference.x), (parentRect.x + parentRect.width) - widget:getWidth());
	local y = math.min(math.max(parentRect.y - widget:getParent():getMarginTop(), mousePos.y - widget.movingReference.y), (parentRect.y + parentRect.height) - widget:getHeight());
	widget:move(x, y);
	storage.widgetPos[name] = {x=x,y=y};
	return true;
end;
local widgetTC2 = setupUI([[
Panel
  height: 2000
  width: 2000
    
  Label
    id: lblTimer2
    color: blue
    background-color: #000000b3
    opacity: 1
    height: 12
    draggable: true
    phantom: false
    focusable: true
    text-horizontal-auto-resize: true
    !text: tr('00:00:00')
]], g_ui.getRootWidget());
local timerLabel = widgetTC2:getChildById(LUAOBFUSACTOR_DECRYPT_STR_0("\135\242\62\105\241\170\142\226\96", "\199\235\144\82\61\152"));
local name = LUAOBFUSACTOR_DECRYPT_STR_0("\19\31\180\46\21\33\176\47\0\19\173", "\75\103\118\217");
storage.widgetPos[name] = storage.widgetPos[name] or {};
local savedPos = storage.widgetPos[name];
if (savedPos and savedPos.x and savedPos.y) then
	timerLabel:setPosition({x=savedPos.x,y=savedPos.y});
else
	timerLabel:setPosition({x=660,y=0});
end
timerLabel.onDragEnter = function(widget, mousePos)
	if not modules.corelib.g_keyboard.isCtrlPressed() then
		return false;
	end
	widget:breakAnchors();
	widget.movingReference = {x=(mousePos.x - widget:getX()),y=(mousePos.y - widget:getY())};
	return true;
end;
timerLabel.onDragMove = function(widget, mousePos, moved)
	local parentRect = widget:getParent():getRect();
	local x = math.min(math.max(parentRect.x, mousePos.x - widget.movingReference.x), (parentRect.x + parentRect.width) - widget:getWidth());
	local y = math.min(math.max(parentRect.y - widget:getParent():getMarginTop(), mousePos.y - widget.movingReference.y), (parentRect.y + parentRect.height) - widget:getHeight());
	widget:move(x, y);
	storage.widgetPos[name] = {x=x,y=y};
	return true;
end;
local widgetTC3 = setupUI([[
Panel
  height: 2000
  width: 2000

  Label
    id: lblTimer3
    color: yellow
    font: verdana-11px-rounded
    height: 12
    background-color: #00000040
    opacity: 0.87
    text-auto-resize: true
    draggable: true
    phantom: false
    focusable: true
    !text: tr('00:00:00')
]], g_ui.getRootWidget());
local timerLabel3 = widgetTC3:getChildById(LUAOBFUSACTOR_DECRYPT_STR_0("\203\86\124\32\176\19\194\70\35", "\126\167\52\16\116\217"));
local name = LUAOBFUSACTOR_DECRYPT_STR_0("\220\39\45\133\166\46\245\204\41\37\148\141\28\240\196\33\55", "\156\168\78\64\224\212\121");
storage.widgetPos = storage.widgetPos or {};
storage.widgetPos[name] = storage.widgetPos[name] or {};
local savedPos = storage.widgetPos[name];
if (savedPos and savedPos.x and savedPos.y) then
	timerLabel3:setPosition({x=savedPos.x,y=savedPos.y});
end
timerLabel3.onDragEnter = function(widget, mousePos)
	if not modules.corelib.g_keyboard.isCtrlPressed() then
		return false;
	end
	widget:breakAnchors();
	widget.movingReference = {x=(mousePos.x - widget:getX()),y=(mousePos.y - widget:getY())};
	return true;
end;
timerLabel3.onDragMove = function(widget, mousePos, moved)
	local parentRect = widget:getParent():getRect();
	local x = math.min(math.max(parentRect.x, mousePos.x - widget.movingReference.x), (parentRect.x + parentRect.width) - widget:getWidth());
	local y = math.min(math.max(parentRect.y - widget:getParent():getMarginTop(), mousePos.y - widget.movingReference.y), (parentRect.y + parentRect.height) - widget:getHeight());
	widget:move(x, y);
	storage.widgetPos[name] = {x=x,y=y};
	return true;
end;
if not storage.endTime3 then
	storage.endTime3 = 0;
end
if not storage.endTime then
	storage.endTime = 0;
end
if not storage.endTime2 then
	storage.endTime2 = 0;
end
local function doFormatTime(v)
	local hours = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\66\190\247\128\1", "\174\103\142\197"), math.floor(v / 3600));
	local mins = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\19\120\13\118\35", "\152\54\72\63\88\69\62"), math.floor((v / 60) - (hours * 60)));
	local seconds = string.format(LUAOBFUSACTOR_DECRYPT_STR_0("\145\148\188\18\210", "\60\180\164\142"), math.floor(math.fmod(v, 60)));
	return hours .. ":" .. mins .. ":" .. seconds;
end
tmrMacro = macro(1, function()
	if (os.time() >= storage.endTime) then
		widgetTC.lblTimer:setText(LUAOBFUSACTOR_DECRYPT_STR_0("\8\14\95\121\119\183\66\8", "\114\56\62\101\73\71\141"));
		return;
	end
	widgetTC.lblTimer:setText(doFormatTime(os.difftime(storage.endTime, os.time())));
end);
tmrMacro2 = macro(1, function()
	if ((os.time() >= storage.endTime) and (os.time() >= storage.endTime2) and (os.time() < storage.endTime3)) then
		widgetTC2.lblTimer2:setText(LUAOBFUSACTOR_DECRYPT_STR_0("\232\185\129\148\232\179\139\148", "\164\216\137\187"));
		irTaksu();
		tmrMacro2:setOff();
		return;
	end
	local remainingTime = os.difftime(storage.endTime2, os.time());
	if (remainingTime < 0) then
		remainingTime = 0;
	end
	widgetTC2.lblTimer2:setText(doFormatTime(remainingTime));
end);
tmrMacro3 = macro(1, function()
	if (os.time() >= storage.endTime3) then
		widgetTC3.lblTimer3:setText(LUAOBFUSACTOR_DECRYPT_STR_0("\130\182\107\226\246\164\91\130", "\107\178\134\81\210\198\158"));
		irZoltan();
		tmrMacro3:setOff();
		return;
	end
	local remainingTime2 = os.difftime(storage.endTime3, os.time());
	if (remainingTime2 < 0) then
		remainingTime2 = 0;
	end
	widgetTC3.lblTimer3:setText(doFormatTime(remainingTime2));
end);
if not contagem then
	contagem = 0;
end
if not contagemTaksu then
	contagemTaksu = 0;
end
if not famaentregue then
	famaentregue = false;
end
function irTaksu()
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\44\28\131\207\164\61\28", "\202\88\110\226\166")) then
				TargetBot.setOff();
				tyrBot.storage._configs.targetbot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\204\27\138\242\216\208", "\170\163\111\226\151");
				CaveBot.setOff();
				FollowAttack.mainMacro.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\39\63\190\44\79\37\51\30\60\166\57\64", "\73\113\80\210\88\46\87");
				CaveBot.setOn();
			end
		end
	end
end
function irZoltan()
	if not profile._storage.autoTask.enabled then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\149\62\204\27\233\132\62", "\135\225\76\173\114")) then
				TargetBot.setOff();
				tyrBot.storage._configs.targetbot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\21\249\176\181\190\174", "\199\122\141\216\208\204\221");
				TargetBot.setOn();
				CaveBot.setOff();
				FollowAttack.mainMacro.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\185\207\17\249\118\243\191\205\17\226\121\204\162\209\4\241\118", "\150\205\189\112\144\24");
				CaveBot.setOn();
			end
		end
	end
end
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\51\139\188\73\68\137\5\25\51\139\170\12\5\200\5\17\54\143\255\72\1\200\23\17\40\133", "\112\69\228\223\44\100\232\113")) then
		return;
	end
	emFortress = false;
	storage.endTime = os.time() + (6 * 3600);
	storage.endTime3 = os.time() + (12 * 3600);
	tmrMacro:setOn();
	tmrMacro3:setOn();
end);
onTextMessage(function(mode, text)
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\210\22\9\210\186\117\156\219\10\71\192\163\125\198\192\30\20\216\246\120\131\148\25\6\222\183", "\230\180\127\103\179\214\28")) then
		return;
	end
	if not profile._storage.autoTask.enabled then
		return;
	end
	storage.endTime = os.time() + (6 * 0);
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\159\16\94\6\240\64\243\135\69\89\73\237\1\242\137\8\80\80\237\69\225", "\128\236\101\63\38\132\33")) then
		return;
	end
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	contagem = contagem + 1;
	storage.endTime2 = os.time() + (2 * 3600);
	tmrMacro2:setOn();
	if (profile._storage.autoChouji.enabled and (os.time() < storage.endTime3)) then
		contagem = contagem + 1;
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\132\168\22\75\164\228\194\163\250\81\9\246\200\192\188\160\16", "\175\204\201\113\36\214\139");
		CaveBot.setOn();
	else
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\125\195\57\200\5\73", "\100\39\172\85\188");
		CaveBot.setOn();
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\172\105\172\137\115\168\107\173\129\115\190\125\172\192\35\191\125\180\137\60", "\83\205\24\217\224")) then
		return;
	end
	contagem = contagem + 1;
	storage.endTime2 = os.time() + (6 * 3600);
	tmrMacro2:setOn();
	if (profile._storage.autoChouji.enabled and (os.time() < storage.endTime3)) then
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\206\196\202\50\244\202\192\50\181\133\128\125\197\202\221\52\231", "\93\134\165\173");
		CaveBot.setOn();
	else
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\132\253\205\214\59\192", "\30\222\146\161\162\90\174\210");
		CaveBot.setOn();
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\231\66\113\9\238\14\99\2\236\64\127\8\236\93", "\106\133\46\16")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\76\33\120\239\79", "\32\56\64\19\156\58")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\120\196\228\85\81\225\136\83\198\234\84\83\225", "\224\58\168\133\54\58\146");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\88\93\74\243\116\139\130\24", "\107\57\54\43\157\21\230\231")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\207\138\26\230\172", "\175\187\235\113\149\217\188")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\29\164\128\66\226\116\125\47\187\128\71\240\108", "\24\92\207\225\44\131\25");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\70\210\181\89\8\117\66\192", "\29\43\179\216\44\123")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\169\216\43\95\168", "\44\221\185\64")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\44\230\69\74\96\9\238\92\94\120\18\242", "\19\97\135\40\63");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\167\78\50\53\36\56\189", "\81\206\60\83\91\79")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\90\170\219\97\58", "\196\46\203\176\18\79\163\45")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\145\48\127\16\47\242\251\185\41\109\11", "\143\216\66\30\126\68\155");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\185\192\4\197\202\161\222\161\171\218\14\195\192\177\196", "\129\202\168\109\171\165\195\183")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\54\89\60\203\203", "\134\66\56\87\184\190\116")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\15\57\0\181\22\233\40\52\46\50\1\190\11\248", "\85\92\81\105\219\121\139\65");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\246\166\66\74\125\205\244\160", "\191\157\211\48\37\28")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\203\30\255\15\47", "\90\191\127\148\124")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\83\146\60\24\121\149\39\4", "\119\24\231\78");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\140\56\174\79\210\73\31\145", "\113\226\77\197\42\188\32")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\46\23\255\166\47", "\213\90\118\148")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\117\59\191\83\67\82\32", "\45\59\78\212\54");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\6\83\141\132\139\110\190\254\17\93\134\152", "\144\112\54\227\235\230\78\205")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\167\41\4\239\197", "\59\211\72\111\156\176")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\120\130\237\34\67\148\237\44\69\130", "\77\46\231\131");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\174\85\175\85\163\85\165", "\32\218\52\214")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\90\22\58\187\228", "\58\46\119\81\200\145\208\37")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\31\141\41\185\176\188\37", "\86\75\236\80\204\201\221");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\118\78\112\197\248\142\115\83\100", "\235\18\33\23\229\158")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\68\187\202\168\69", "\219\48\218\161")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\192\126\123\79\222\78\242\247", "\128\132\17\28\41\187\47");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\10\61\8\57\85\20\33", "\61\97\82\102\90")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\184\47\160\88\210", "\105\204\78\203\43\167\55\126")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\142\165\45\29\27\17", "\49\197\202\67\126\115\100\167");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\36\80\218\37\133\66\81\57\27\217\44\129\68\77", "\62\87\59\191\73\224\54")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\243\3\241\218\242", "\169\135\98\154")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\248\124\33\88\248\39\199\197\113\33\85\239\32", "\168\171\23\68\52\157\83");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\240\116\227\164\41\62", "\231\148\17\149\205\69\77")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\148\166\204\232\66", "\159\224\199\167\155\55")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\211\246\42\219\251\224", "\178\151\147\92");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\141\246\77\38\1\89\113\133\238", "\26\236\157\44\82\114\44")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\62\47\222\72\63", "\59\74\78\181")) then
				CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\33\212\73\83\160\49\216\72", "\211\69\177\58\58"));
			end
		end
	end
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\164\237\112\251\230\201\190\165\106\254\240\216\164", "\171\215\133\25\149\137")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\245\201\57\233\250", "\34\129\168\82\154\143\80\156")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\182\186\58\5\71\76\128\150\185\42\24\91", "\233\229\210\83\107\40\46");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\202\75\63\223\8\192\80\61\197", "\101\161\34\82\182")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\252\12\82\237\206", "\78\136\109\57\158\187\130\226")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\21\54\244\248\51\62\235\254\45", "\145\94\95\153");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\232\193\0\220\67\182\233\200\84\198\69\178\241\200\0\218\64\164", "\215\157\173\116\181\46")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\33\181\128\225\207", "\186\85\212\235\146")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\247\141\2\247\52\239\76\199\146\29\251\53\235\76\205\143\2\255\50\253\77", "\56\162\225\118\158\89\142");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\86\12\201\189\45\205\94\10\213\188", "\184\60\101\160\207\66")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\37\131\119\175\36", "\220\81\226\28")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\57\220\144\244\255\197\28\192\145", "\167\115\181\226\155\138");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\240\45\242\82\114\127\213", "\166\130\66\135\60\27\17")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\80\75\197\102\37", "\80\36\42\174\21")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\124\31\34\116\71\30\35\123\69\3\34", "\26\46\112\87");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\189\34\185\127\255\172\75\181\178\38\184", "\212\217\67\203\20\223\223\37")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\174\140\163\193\175", "\178\218\237\200")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\146\180\244\219\165\187\231\219\179\166", "\176\214\213\134");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\243\168\178\219\189\22\74\255\168\186\209\188\89\87\231", "\57\148\205\214\180\200\54")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\6\252\62\39\99", "\22\114\157\85\84")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\227\206\23\203\72\229\163\193\199\22\208\82\248\187", "\200\164\171\115\164\61\150");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\167\251\23\77\195\184\225\17\76\134\173", "\227\222\148\99\37")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\39\83\89\229\236", "\153\83\50\50\150")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\100\121\103\20\117\190\95\84\115\96", "\45\61\22\19\124\19\203");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\202\29\3\246\10\101\249\197\29\6\224\17", "\217\161\114\109\149\98\16")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\6\33\51\111\169", "\20\114\64\88\28\220")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\26\14\220\183\240\197\185\62\10\199\160\249\219\174\36", "\221\81\97\178\212\152\176");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\196\244\21\242\17\204\240\28\232", "\122\173\135\125\155")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\144\192\11\170\42", "\168\228\161\96\217\95\81")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\242\194\38\87\46\64\218\197\47\87\60\66", "\55\187\177\78\60\79");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\63\203\81\238\65\206\132\40\221", "\224\77\174\63\139\38\175")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\144\64\83\61\145", "\78\228\33\56")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\252\123\188\6\130\207\122\183", "\229\174\30\210\99");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\8\248\150\67\232\48\60\91\254\135\95\233\46", "\89\123\141\230\49\141\93")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\231\112\253\31\5", "\42\147\17\150\108\112")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\60\179\61\109\226\229\10\181\44\113\227\251", "\136\111\198\77\31\135");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\0\5\166\85\182\164\19\172\3\29\175\69", "\201\98\105\199\54\221\132\119")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\173\13\136\50\23", "\204\217\108\227\65\98\85")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\124\207\244\230\39\196\91\194\225\237\24\193\85\208\224", "\160\62\163\149\133\76");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\194\179\24\54\204\223\224\6\54\204\220\169\3\60", "\163\182\192\109\79")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\32\39\11\211\224", "\149\84\70\96\160")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\12\21\24\244\55\15\6\244\55\12\4\227\44\7\6\254\45", "\141\88\102\109");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\184\90\193\123\27\52\70", "\161\211\51\170\16\122\93\53")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\239\175\185\59\238", "\72\155\206\210")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\109\115\95\5\50\79\110\85\5\32\83", "\83\38\26\52\110");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\29\19\108\6\78\18\41\73\85\87\52\69\87\5\55\79\87\25\52", "\38\56\119\71")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\231\238\83\197\48", "\54\147\143\56\182\69")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\224\132\241\70\210\197\130\240\91\207\223\142\241\93\222\221\146\234", "\191\182\225\159\41");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\110\22\99\21\140\130\198\36\7\104\81\132\128\209", "\162\75\114\72\53\235\231")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\152\61\79\241\70", "\98\236\92\36\130\51")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\131\28\8\181\80\172\186\55\176\24\7\169\80", "\80\196\121\108\218\37\200\213");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\1\97\3\116\88", "\234\96\19\98\31\43\110")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\18\30\89\212\185", "\235\102\127\50\167\204\18")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\113\179\244\40\80\47\91\178\224", "\78\48\193\149\67\36");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\117\26\203\88\82\51\17\146\8\72\63\16\147", "\33\80\126\224\120")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\248\169\8\215\73", "\60\140\200\99\164")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\180\247\11\52\178\142\251\10\50\163\140\231\17", "\194\231\148\100\70");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\71\94\192\160\248\193\66\73\206\176", "\168\38\44\161\195\150")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\148\253\137\101\37", "\118\224\156\226\22\80\136\214")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\99\252\88\139\86\239\82\147\87", "\224\34\142\57");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\201\166\200\200\96\191\29\26\219\181\200\212\125\244", "\110\190\199\165\189\19\145\61")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\206\234\124\251\158", "\167\186\139\23\136\235")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\45\180\133\24\14\180\131\30\15", "\109\122\213\232");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:find(LUAOBFUSACTOR_DECRYPT_STR_0("\234\246\171", "\80\142\151\194")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\23\199\124\95\22", "\44\99\166\23")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\88\246\32\33\50\169\105\227\40\61\32\177", "\196\28\151\73\86\83");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:find(LUAOBFUSACTOR_DECRYPT_STR_0("\225\12\60\30\139\86\11", "\22\147\99\73\112\226\56\120")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\172\116\233\230\152", "\237\216\21\130\149")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\176\65\74\81\185\199\74\131\69\76\74", "\62\226\46\63\63\208\169");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\243\24\88\147\22\31\42\77", "\62\133\121\53\227\127\109\79")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\4\21\57\230\195", "\194\112\116\82\149\182\206")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\15\169\65\8\201\240\11\45\169\71\11\213", "\110\89\200\44\120\160\130");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\189\194\70\86\74\88\62\13\166\214\95\71\87\79\63\94", "\45\203\163\43\38\35\42\91")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\198\132\215\48\146", "\52\178\229\188\67\231\201")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\23\64\93\20\254\78\38\44\84\68\5\227\89\39\21\64\91\23\226", "\67\65\33\48\100\151\60");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\213\230\175\211\230\209\230\238\204\242\212\232\189", "\147\191\135\206\184")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\144\41\173\210\205", "\210\228\72\198\161\184\51")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\28\72\242\27\102\192\55\93\242\27\124\218\55\66\224\5", "\174\86\41\147\112\19");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\73\15\152\5\44\1\81\177\84\21\159\2\54", "\203\59\96\237\107\69\111\113")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\48\23\167\242\36", "\183\68\118\204\129\81\144")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\60\162\101\234\2\140\20\162\101\246\2\150\15\166\99\241", "\226\110\205\16\132\107");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\226\193\245\210\72\248", "\33\139\163\128\185")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\67\89\15\205\66", "\190\55\56\100")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\127\173\41\21\26\247\242\93\188\41", "\147\54\207\92\126\115\131");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\5\52\55\116\77\109\5\56\39\114\30", "\30\109\81\85\29\109")) then
		return;
	end
	for _, spec in ipairs(getSpectators()) do
		if (spec:isCreature() and (spec ~= player)) then
			local specName = spec:getName():lower();
			if (specName == LUAOBFUSACTOR_DECRYPT_STR_0("\235\112\95\165\35", "\156\159\17\52\214\86\190")) then
				CaveBot.setOff();
				tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\134\234\191\181\189\231\180\174\161\251\188\183\189\250", "\220\206\143\221");
				CaveBot.setOn();
			end
		end
	end
	return true;
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\133\111\36\22\204\217\192\135\61\44\28\217\194\211\139\120", "\178\230\29\77\119\184\172")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\212\181\11\22\118\246\240\164\5\23\99\249\251", "\152\149\222\106\123\23");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\222\52\255\66\161\200\52\247\3\180\214\39\251\66\187\201\41", "\213\189\70\150\35")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\110\94\117\5\78\91\96\7\85\90\120\28\78\91", "\104\47\53\20");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\160\94\136\29\168\26\177\77\193\29\174\14\168\73\143", "\111\195\44\225\124\220")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\249\84\1\120\174\165\194\73\12\103\170\165", "\203\184\38\96\19\203");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\58\97\112\64\218\44\97\120\1\207\43\114\114", "\174\89\19\25\33")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\14\0\83\69\237\136\7\59\19\92", "\107\79\114\50\46\151\231");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\58\180\188\40\158\44\165\193\121\164\188\34\129\44\181\193\61\169", "\160\89\198\213\73\234\89\215")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\106\120\191\245\208\74\112\176\241\223\71\125\160\255\203", "\165\40\17\212\158");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\230\203\1\50\50\240\203\9\115\46\224\219\1\115\53\237\208\26\60", "\70\133\185\104\83")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\44\64\70\35\218\12\76\86\37\211\11\73\80\43\199", "\169\100\37\36\74");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\3\149\171\81\20\146\176\81\64\143\167\89\19\143\171", "\48\96\231\194")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\224\95\7\62\17\209\181\140\196\78\15\35", "\227\168\58\110\77\121\184\207");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\120\46\182\65\165\206\99\164\59\53\189\85\186\210", "\197\27\92\223\32\209\187\17")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\42\93\214\240\10\69\204\247\23\94\205", "\155\99\63\163");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\129\195\168\140\173\145\144\208\225\132\171\133\140\218\168", "\228\226\177\193\237\217")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\29\162\34\232\63\185\57\233\56\164\34\232", "\134\84\208\67");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\16\190\143\93\7\185\148\93\83\166\135\93\24\185\136\93\83\184\135\87\28", "\60\115\204\230")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\205\59\234\123\242\52\234\100\230\49\228\106\232\54\255\113\233", "\16\135\90\139");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\87\102\15\50\90\65\106\85\52\13\54\93\92\113\90", "\24\52\20\102\83\46\52")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\239\42\50\44\6\202\53\46\40\27\197\33", "\111\164\79\65\68");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\197\203\138\223\58\255\212\216\195\211\47\231\211\202\139\215", "\138\166\185\227\190\78")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\230\117\200\34\65\43\16\209\123\201\35\83\45", "\121\171\20\165\87\50\67");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\197\42\176\55\173\23\212\57\249\59\176\16\199\44\170\35", "\98\166\88\217\86\217")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\219\255\107\0\146\207\227\236\118\13\146\221\248", "\188\150\150\25\97\230");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\217\155\86\3\24\248\200\136\31\16\5\239\219\128\94\17\13\227", "\141\186\233\63\98\108")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\195\227\46\183\44\240\249\45\184\63\254\230\56\183\43", "\69\145\138\76\214");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\115\221\128\136\171\3\98\206\201\154\188\25\98\223\128\134\177", "\118\16\175\233\233\223")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\184\135\58\169\254\130\114\133\158\58\183\250\138\115", "\29\235\228\85\219\142\235");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\62\198\179\220\99\91\53\83\125\199\191\211\116\70\40\71", "\50\93\180\218\189\23\46\71")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\237\161\85\79\76\211\93\196\171\87\88\69\210", "\40\190\196\59\44\36\188");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\42\74\223\177\186\119\12\124\87\217\181\246\116\23\51\80\156\181\233\61\25\61\87\217\178\251\110\77\56\64\156\188\245\119\8\124\65\217\244\247\114\3\47\81\206\187\233", "\109\92\37\188\212\154\29")) then
		return;
	end
	CaveBot.setOff();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\7\253\173\194\37\79\22\238\228\208\36\74\22\234\169\198\113\73\5\225\160", "\58\100\143\196\163\81")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\41\87\51\177\58\68\224\29\27\76\39\185\48\69\241\15\20", "\110\122\34\67\195\95\41\133");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\118\163\82\75\194\96\163\90\10\194\102\164\66\69\223\53\186\66\69\220\124\191", "\182\21\209\59\42")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\131\68\208\4\46\183\188\78\202\23\40\176\173\88\201\9\32\176", "\222\215\55\165\125\65");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\47\195\207\27\230\212\255\75\108\196\202\14\251\204\236\94\41\145\213\17\247\205\232\94\35\223", "\42\76\177\166\122\146\161\141")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\144\134\17\199\116\119\177\143\22\197\124\122\160\158\10\192\99\121\169\158\4\192", "\22\197\234\101\174\25");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\44\54\164\200\115\189\151\135\109\55\183\213\119\187\194\148\44\116\179\221\123\191\222\148\40\120\229", "\230\77\84\197\188\22\207\183")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\207\21\203\236\133\179\245\47\246\24\210\253\130", "\85\153\116\166\156\236\193\144");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\167\242\68\178\240\21\182\225\13\165\229\13\180\233\95\182\164\13\177\244\76\167\225\4", "\96\196\128\45\211\132")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\3\140\118\79\219\189\177\213\32\153\126\91\200\160\184\204\52\131", "\184\85\237\27\63\178\207\212");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\11\75\0\94\28\76\27\94\72\78\8\82\29", "\63\104\57\105")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\60\134\169\81\17\136\168\80\10\137", "\36\107\231\196");
	CaveBot.setOn();
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\94\167\171\134\73\160\176\134\29\175\187\143\92\187", "\231\61\213\194")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\51\180\53\114\7\183\50\127\29\172\51", "\19\105\205\93");
	CaveBot.setOn();
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\168\24\219\143\62\186\72\206\128\45\168\72\207\148\58\164\72\221\142\50\185\4\219\149\62\233\29\211\128\127\189\9\205\138", "\95\201\104\190\225")) then
		return;
	end
	CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\173\210\196\192\191\200", "\174\207\171\161"));
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find("aniquile então") then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\196\240\4\240\241\216\229\241\30\227\241\195\236\242\6\252\246\216\229\255", "\183\141\158\109\147\152");
	CaveBot.setOn();
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if profile._storage.autoTaksu.enabled then
		return;
	end
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\58\6\229\9\108\12\245\24\45\73\229\3\33\73\243\1\45\73\242\13\63\2\166\13\56\0\240\13\40\8", "\108\76\105\134")) then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\194\203\184\226\199\228\205\190\242\222\226\209\176\237\197\228\203\190\233\207", "\174\139\165\209\129");
	CaveBot.setOn();
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\179\188\230\196\134\5\113\98\166\161\162\213\199\16\123\107\227\163\237\211\134\19\127\118\183\188\241\129\199\67\115\121\167\178\162\151\134\11\127\106\162\160", "\24\195\211\130\161\166\99\16")) then
		return;
	end
	contagem = contagem + 1;
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\124\12\229\56\82\24", "\118\38\99\137\76\51");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not profile._storage.autoTaksu.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\235\41\6\23\73\37\238\50\4\82\10\47\240\102\16\31\8\96\233\39\22\25\73\33\233\47\19\19\13\33", "\64\157\70\101\114\105")) then
		return;
	end
	CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\73\186", "\112\32\200\199\131"));
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\40\85\79\177\208\191\43\57\16\88\189\131\184\55\45\16\73\180\215\162\47\45\16\72\185\208\160", "\66\76\48\60\216\163\203")) then
		return;
	end
	contagem = contagem + 1;
	if not profile._storage.autoChouji.enabled then
		return;
	end
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\146\135\126\252\77\193\41\181\213\57\190\31\237\43\170\143\120", "\68\218\230\25\147\63\174");
	CaveBot.setOn();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\172\58\86\66\183\190\106\67\94\179\160\35\70\65\246\172\41\80\67\163\163\62", "\214\205\74\51\44")) then
		return;
	end
	CaveBot.setOff();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\234\67\230\249\55\232\73\227\240\126\224\77\240\188\118\234\73\236\253\100\186\31\162\232\118\233\71\241", "\23\154\44\130\156")) then
		return;
	end
	contagem = contagem + 1;
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\43\169\161\186\55\29", "\115\113\198\205\206\86");
	CaveBot.setOn();
	TargetBot.setOff();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\146\88\253\95\196\93\255\26\133\67\247\84\131\94\235\26\133\23\239\79\133\89\234\83\128\86\250\95\196\90\255\66\141\90\255\26\128\82\190\9\196\67\255\73\143\68\190\94\129\23\243\85\134\68\190\94\141\86\236\83\133\68", "\58\228\55\158")) then
		return;
	end
	contagem = contagem + 1;
	CaveBot.setOff();
	tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\142\134\220\58\61\163", "\85\212\233\176\78\92\205");
	CaveBot.setOn();
	TargetBot.setOff();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not profile._storage.autoTask.enabled then
		return;
	end
	if (not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\78\93\158\231\10\93\155\242\79\74\137\240\10\77\133\162\67\86\156\231\88\78\137\238\69\24\140\231\10\29\140\169\10\80\135\240\75\99\155\223\21\20\215\162\15\92\195\162\71\81\134\247\94\87\179\241\119\7\200\231\10\29\140\169\10\75\141\229\95\86\140\237\113\75\181\189", "\130\42\56\232")) and not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\238\176\50\230\0\58\249\165\33\241\65\45\170\160\41\163\73\49\254\176\54\245\65\51\229\245\32\230\0\122\238\254\100\238\73\49\255\161\43\216\83\2\181\245\33\163\5\59\161\245\55\230\71\42\228\177\43\216\83\2\181", "\95\138\213\68\131\32")) and not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\46\45\183\70\54\47\59\177\70\100\43\58\225\86\123\106\33\175\87\115\56\62\160\79\121\106\44\164\3\51\46\99\225\80\115\45\61\175\71\121\17\59\156\28", "\22\74\72\193\35"))) then
		return;
	end
	local hours, minutes, seconds = text:lower():match(LUAOBFUSACTOR_DECRYPT_STR_0("\100\60\224\19\101\60\247\7\36\118\246\89\23\106\217\7\105\106\187\20\115\60\247\7\100\60\224\19\101\60\247\7\33\112\234\77\56\118\223\75\17\38\161\75\115\124\161\75\115\49\161\92\103\48\161\75\115\106\225\95\57\119\224\87\23\106\217\7", "\56\76\25\132"));
	if (not hours and not minutes) then
		minutes, seconds = text:lower():match(LUAOBFUSACTOR_DECRYPT_STR_0("\22\132\175\109\134\27\210\244\43\198\80\212\191\41\244\77\252\244\99\220\1\196\238\53\144\22\132\175\109\134\27\210\244\53\202\89\212\165\34\192\101\210\150\121", "\175\62\161\203\70"));
	end
	if (not minutes and not seconds) then
		seconds = text:lower():match(LUAOBFUSACTOR_DECRYPT_STR_0("\116\152\199\88\124\121\206\156\0\48\59\200\205\23\58\7\206\254\76", "\85\92\189\163\115"));
	end
	hours = tonumber(hours) or 0;
	minutes = tonumber(minutes) or 0;
	seconds = tonumber(seconds) or 0;
	if ((hours >= 0) and (minutes >= 0) and (seconds >= 0)) then
		local totalTime = (hours * 3600) + (minutes * 60) + seconds;
		storage.endTime3 = os.time() + totalTime;
		tmrMacro3:setOn();
	end
	contagem = contagem + 1;
	if (profile._storage.autoChouji.enabled and (contagem < 3)) then
		CaveBot.setOff();
		delay(1500);
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\31\163\60\44\40\190\42\55\37\184\49\54", "\88\73\204\80");
		CaveBot.setOn();
	elseif (profile._storage.autoTaksu.enabled and (contagem < 3) and (storage.endTime2 < os.time())) then
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\24\140\28\82\40\200\52\140\28\82\40\212", "\186\78\227\112\38\73");
		CaveBot.setOn();
	elseif (contagem >= 3) then
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\232\69\248\92\93\123\238\109\242\89\71\123\242", "\26\156\55\157\53\51");
		CaveBot.setOn();
		contagem = 0;
	end
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\154\215\21\220\248\68\137\213\86\218\189\66\152\221\12\216\248\65\153\221\86\200\173\85\158\152\23\205\177\70\141\202\86\216\248\68\141\203\29", "\48\236\184\118\185\216")) then
		return;
	end
	if ((os.time() <= storage.endTime3) and profile._storage.autoChouji.enabled) then
		contagem = contagem + 2;
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\211\178\91\36\206\38\255\178\91\36\206\58", "\84\133\221\55\80\175");
		CaveBot.setOn();
	elseif ((os.time() <= storage.endTime3) and (contagem >= 3)) then
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\169\245\33\175\201\93\175\221\43\170\211\93\179", "\60\221\135\68\198\167");
		CaveBot.setOn();
		contagem = 0;
	end
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\248\178\251\134\2\211\239\253\234\134\67\213\231\167\247\150\2\216\253\253\236\130\80\220\232\188\235\195\70\220\174\181\247\137\71\153\234\184\184\142\77\215\253\169\234\140\81", "\185\142\221\152\227\34")) then
		return;
	end
	if not isAutoTaskEnabled() then
		return;
	end
	contagem = contagem + 1;
	if profile._storage.autoTaksu.enabled then
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\91\205\82\249\72\61\231\91", "\151\56\165\55\154\35\83");
		CaveBot.setOn();
	elseif profile._storage.autoTask.enabled then
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\154\76\9\250\161\77", "\142\192\35\101");
		CaveBot.setOn();
	else
		CaveBot.setOff();
		tyrBot.storage._configs.cavebot_configs.selected = LUAOBFUSACTOR_DECRYPT_STR_0("\208\124\42\162\245\173\138\61", "\118\182\21\73\195\135\236\204");
		CaveBot.setOn();
	end
end);
onTextMessage(function(mode, text)
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\14\53\20\65\8\4\231\7\41\90\83\17\12\189\28\61\9\75", "\157\104\92\122\32\100\109")) then
		return;
	end
	CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\166\168\219\216\56\32\140\185", "\203\195\198\175\170\93\71\237"));
end);
onTextMessage(function(mode, text)
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\58\78\44\216\88\31\243\59\11\63\149\69\16\239\37", "\156\78\43\94\181\49\113")) then
		return;
	end
	CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\119\230\208\177\14\68\120\96", "\25\18\136\164\195\107\35"));
end);
onTextMessage(function(mode, text)
	if not profile._storage.autoTask.enabled then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\252\40\164\95\125\252\197\185\168\62\188\78\50\168\192\171\227\109\175\78\127\189\129\172\237\63\164\70\124\179\212", "\216\136\77\201\47\18\220\161")) then
		return;
	end
	CaveBot.gotoLabel(LUAOBFUSACTOR_DECRYPT_STR_0("\40\226\63\200\13\219\131\63", "\226\77\140\75\186\104\188"));
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\175\193\211\58\15\183\207\223\127\91\188\195\144\48\92\249\156\128\127\72\182\194\212\127\77\184\220", "\47\217\174\176\95")) then
		return;
	end
	CaveBot.setOff();
	return true;
end);
onTalk(function(name, level, mode, text, channelId, pos)
	if (mode ~= 51) then
		return;
	end
	if not text:lower():find(LUAOBFUSACTOR_DECRYPT_STR_0("\174\210\117\7\242\90\121\41\248\201\115\15\242\91\107\102\233\141\54\5\189\88\124\102\186\220\100", "\70\216\189\22\98\210\52\24")) then
		return;
	end
	CaveBot.setOff();
	return true;
end);
