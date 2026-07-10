switch (commandline -t)[-1]
    case "!"
        commandline -f backward-delete-char history-token-search-backward
    case "*"
        commandline -i '$'
end
