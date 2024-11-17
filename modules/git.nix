{ username, ... }:

{
    home-manager.users.${username} = {
	programs.git = {
		enable = true;
		userName = "Sam Newby";
		userEmail = "samjnewby@hotmail.com";
		aliases = {
			ci = "commit";
			co = "checkout";
			s = "status";
		};
		extraConfig = {
			push = { autoSetupRemote = true; };
		};
	};
    };
}
