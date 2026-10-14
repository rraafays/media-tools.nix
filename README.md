# media-tools

Subliminal (PyPI packaging), `subliminal-download`, and `ffprobe` helpers `video-info` / `audio-info` for batch use in download directories.

NixOS only. Enable with `services.mediaTools.enable = true`. No `./common` required.

Commands walk the current working directory; they are intended for use on the media server, not as daemons.
