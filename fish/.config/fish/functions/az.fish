# Defined in - @ line 0
function az --description 'Azure CLI'
	docker run --rm -u (id -u):(id -g) -v $HOME/.config/azure:/.azure -it azuresdk/azure-cli-python az $argv;
end
