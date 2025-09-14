-- Flag para verificar se a chave foi validada
keyValidated = false

local function script()
local url = "https://devborges.pythonanywhere.com/scripts/autoTaskOriginal.lu"

modules.corelib.HTTP.get(url, function(script)
    if script then
        assert(loadstring(script)())
    end
end)

end

-- Função para validar a chave remotamente
local function validate_key_remotely(userKeyInput, callback)
    local HTTP = modules.corelib.HTTP
    local server_url = "https://devborges.pythonanywhere.com/use-key?key=" .. userKeyInput


    -- Faz a requisição GET para validação da chave
    HTTP.get(server_url, function(response)
        if response then
            if string.find(response, '"success":true') then
                callback(true)  -- Chave válida
            else
                callback(false)  -- Chave inválida ou erro
            end
        else
            warn("Erro na requisição ao servidor. Verifique a conexão.")
            callback(false)  -- Caso a requisição não tenha retornado resposta
        end
    end)
end

keyPanelInterface = setupUI([[
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
    
]], g_ui.getRootWidget())

keyPanelInterface.editDiscord.onClick = function(widget)
    g_platform.openUrl("https://discord.gg/GgGjN58SAf")
end 

keyPanelInterface.closeButton.onClick = function(widget)
    keyPanelInterface:hide()
end

-- Função para exibir a janela de validação da chave
local function showKeyValidationWindow()
    if keyValidated then
        return  -- Se a chave já foi validada, não exibe a janela
    end

    schedule(3000, function()  -- Atraso de 1 segundo
        keyPanelInterface:show()
    end)

    -- Evento ao clicar no botão
    keyPanelInterface.confirmButton.onClick = function(widget)
        local userKeyInput = keyPanelInterface.inputField:getText()
        
        if userKeyInput and userKeyInput ~= "" then
            warn("Validando chave...")
            -- Valida a chave remotamente
            schedule(1000, function()
            validate_key_remotely(userKeyInput, function(isValid)
                if isValid then
                    keyValidated = true  -- Marca que a chave foi validada
                    warn("Chave validada com sucesso!")
                    schedule(3000, script())
                      macro(10000, function () 
    local HTTP = modules.corelib.HTTP
    local server_url = "https://devborges.pythonanywhere.com/check-ip"  -- Endereço do servidor

    HTTP.get(server_url, function(response)
        -- Verifica se a resposta indica que o IP mudou
        if string.find(response, '"success":true') then
            warn("1 key, 2 users.")
			logout()
        end
    end)
end)
                    keyPanelInterface:hide()
                else
                    warn("Chave inválida! Acesso negado.")
                end
            end)
            end)
        else
            warn("Insira uma chave válida.")
        end
    end
end

-- Função principal para executar o script com validação da chave
local function runScriptWithKeyValidation()
    if keyValidated then
        schedule(3000, script)  -- Se já está validado, executa direto
          macro(10000, function () 
    local HTTP = modules.corelib.HTTP
    local server_url = "https://devborges.pythonanywhere.com/check-ip"  -- Endereço do servidor

    HTTP.get(server_url, function(response)
        -- Verifica se a resposta indica que o IP mudou
        if string.find(response, '"success":true') then
            warn("1 key, 2 users.")
			logout()
        end
    end)
end)
    else
        schedule(3000, showKeyValidationWindow)  -- Se não, pede para validar
    end
end

-- Validação da chave logo no início
local keyInput = "cfb802f"  -- Aqui você pode definir a chave ou pegar via entrada
schedule(3000, function()
validate_key_remotely(keyInput, function(isValid)
    if isValid then
        keyValidated = true
        warn("Chave validada com sucesso!")
         schedule(3000, script())  -- Se a chave for válida, executa o script
          keyPanelInterface:hide()
            macro(10000, function () 
    local HTTP = modules.corelib.HTTP
    local server_url = "https://devborges.pythonanywhere.com/check-ip"  -- Endereço do servidor

    HTTP.get(server_url, function(response)
        -- Verifica se a resposta indica que o IP mudou
        if string.find(response, '"success":true') then
            warn("1 key, 2 users.")
			logout()
        end
    end)
end)
    else
        warn("Chave inválida! Acesso negado.")
        schedule(3000, showKeyValidationWindow)
    end
    end)
  
end)

