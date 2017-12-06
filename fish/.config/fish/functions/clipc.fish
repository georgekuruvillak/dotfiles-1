# Defined in - @ line 0
function clipc --description 'alias clipc=xclip -in -selection clipboard'
	xclip -in -selection clipboard $argv;
end
