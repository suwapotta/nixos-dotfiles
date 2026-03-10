{ pkgs, inputs, ...}: {
	enviroment.systemPackages = [
		inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
	];
}
