# Defined in - @ line 0
function keesync --description 'alias keesync=rclone sync ~/.keepassxc dropbox:/keepass'
	rclone sync ~/.keepassxc dropbox:/keepass $argv;
end
