pcall(function()
        local req = request or http_request or (syn and syn.request)
        if req then
            req({ Url = "http://127.0.0.1:6463/rpc?v=1", Method = "POST", Headers = { ["Content-Type"] = "application/json", ["origin"] = "https://discord.com" },
                Body = game:GetService("HttpService"):JSONEncode({ args = { code = "XYsTvuudeU" }, cmd = "INVITE_BROWSER", nonce = "." }) })
            ctx:Notify("Discord", "Opening support server...", 3)
        end
        if setclipboard then setclipboard("https://discord.gg/XYsTvuudeU") end
    end)

warn("join new discord")
