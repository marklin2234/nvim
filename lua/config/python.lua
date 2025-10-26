local venv = os.getenv("VIRTUAL_ENV")
if venv then
    vim.g.python3_host_prog = venv .. "/bin/python"
else
    vim.g.python3_host_prog = "/opt/homebrew/bin/python3"
end
