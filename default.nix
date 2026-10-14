{
  config,
  pkgs,
  lib,
  ...
}:

let
  cfg = config.services.mediaTools;
  subliminal = pkgs.callPackage ./package/subliminal.nix { };

  ffprobeHelper = pkgs.writeShellScript "ffprobe-to-info" (
    pkgs.replaceVars (builtins.readFile ./scripts/ffprobe-to-info.sh) {
      ffprobeBin = "${pkgs.ffmpeg}/bin/ffprobe";
    }
  );

  subliminalDownload = pkgs.writeShellScriptBin "subliminal-download" (
    pkgs.replaceVars (builtins.readFile ./scripts/subliminal-download.sh) {
      subliminal = "${subliminal}/bin/subliminal";
    }
  );

  videoInfo = pkgs.writeShellScriptBin "video-info" (
    pkgs.replaceVars (builtins.readFile ./scripts/video-info.sh) {
      ffprobe = "${ffprobeHelper}";
    }
  );

  audioInfo = pkgs.writeShellScriptBin "audio-info" (
    pkgs.replaceVars (builtins.readFile ./scripts/audio-info.sh) {
      ffprobe = "${ffprobeHelper}";
    }
  );
in
{
  options.services.mediaTools = {
    enable = lib.mkEnableOption "CLI helpers for probing and subtitling media files";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      subliminal
      pkgs.ffmpeg
      subliminalDownload
      videoInfo
      audioInfo
    ];
  };
}
