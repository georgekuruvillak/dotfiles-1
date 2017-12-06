# Defined in - @ line 0
function az --description 'alias az=docker run --rm -u (id -u):(id -g) -v /home/fntlnz/.azure:/.azure -it azuresdk/azure-cli-python az '
	docker run --rm -u (id -u):(id -g) -v /home/fntlnz/.azure:/.azure -it azuresdk/azure-cli-python az  $argv;
end
