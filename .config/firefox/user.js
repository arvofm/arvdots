/** LET BRO COOK **/
user_pref("browser.aboutConfig.showWarning", false);

/** STARTUP **/
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.default.sites", "");

/** GEOLOCATION **/
/* use Mozilla geolocation service instead of Google if permission is granted */
user_pref("geo.provider.network.url", "https://location.services.mozilla.com/v1/geolocate?key=%MOZILLA_API_KEY%");
user_pref("geo.provider.use_gpsd", false);
user_pref("geo.provider.use_geoclue", false);

/** FASTER BROWSING **/
user_pref("nglayout.initialpaint.delay", 0);
user_pref("nglayout.initialpaint.delay_in_oopif", 0);
user_pref("content.notify.interval", 100000);
user_pref("gfx.canvas.accelerated.cache-items", 4096); // default=2048; alt=8192
user_pref("gfx.canvas.accelerated.cache-size", 512); // default=256; alt=1024
user_pref("gfx.content.skia-font-cache-size", 20); // default=5; Chrome=20
user_pref("media.memory_cache_max_size", 65536);
user_pref("media.cache_readahead_limit", 7200);
user_pref("media.cache_resume_threshold", 3600);
user_pref("image.mem.decode_bytes_at_a_time", 32768);
user_pref("network.buffer.cache.size", 262144); // 256 kb; default=32768 (32 kb)
user_pref("network.buffer.cache.count", 128); // default=24
user_pref("network.http.max-connections", 1800); // default=900
user_pref("network.http.max-persistent-connections-per-server", 10); // default=6; download connections; anything above 10 is excessive
user_pref("network.http.max-urgent-start-excessive-connections-per-host", 5);
user_pref("network.dnsCacheEntries", 1000);
user_pref("network.dns.max_high_priority_threads", 8);
user_pref("network.ssl_tokens_cache_capacity", 10240);

/** TELEMETRY **/
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("browser.shopping.experience2023.enabled", false);

/** DISK **/
user_pref("browser.cache.disk.enable", false);
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);

/** PRIV FINGERZ **/
/* limit window.screen & CSS media queries (FF41)
   spoof screen orientation (FF50)
   spoof timezone as UTC0 (FF55)
   spoof navigator.hardwareConcurrency as 2 (FF55)
   spoof User Agent & Navigator API
   disable device sensor API
   disable site specific zoom
   hide gamepads from content
   spoof network information API as "unknown" when dom.netinfo.enabled = true
   reduce fingerprinting in WebSpeech API
   spoof media statistics
   reduce screen co-ordinate fingerprinting in Touch API
   enable some fingerprinting resistance for WebGL
   limit MediaError.message to a whitelist
   spoof/block fingerprinting in MediaDevices API (FF59)
   enumerate devices as one "Internal Camera" and one "Internal Microphone"
   suppresses the ondevicechange event
   warn when language prefs are not set to "en*" (also see 0210, 0211) (FF59)
   spoof keyboard events and suppress keyboard modifier events (FF59)
      Spoofing mimics the content language of the document. Currently it only supports en-US.
      Modifier events suppressed are SHIFT and both ALT keys. Chrome is not affected.
   disable WebGL debug renderer info (FF60)
   disable OS locale in HTTP Accept-Language headers (ANDROID) (FF62)
   return "no-preference" with prefers-reduced-motion (FF63)
   spoof/suppress Pointer Events (FF64)
   spoof pointerEvent.pointerid (FF65)
   disable exposure of system colors to CSS or canvas (FF67)
   return "light" with prefers-color-scheme (FF67)
   spoof audioContext outputLatency (FF70)
   return audioContext sampleRate as 44100 (FF72)
   spoof pointer as coarse and hover as none (ANDROID) (FF74)
   randomize canvas (previously FF58+ returned an all-white canvas) (FF78)
   return "no-preference" with prefers-contrast (FF80)
   limit font visibility to bundled and "Base Fonts" (Windows, Mac, some Linux) (FF80)
   spoof smooth=true and powerEfficient=false for supported media in MediaCapabilities (FF82)
   use fdlibm's sin, cos and tan in jsmath (FF93, ESR91.1)
   enforce navigator.pdfViewerEnabled as true and plugins/mimeTypes as hard-coded values (FF100-115)
   reduce JS timing precision to 16.67ms (previously FF55+ was 100ms) (FF102)
   return "srgb" with color-gamut (FF110)
   return "none" with inverted-colors (FF114) */
user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.window.maxInnerWidth", 1600);
user_pref("privacy.window.maxInnerHeight", 900);
user_pref("privacy.resistFingerprinting.letterboxing", true);

/** STUDIES **/
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

/** NO CRASH REPORTS **/
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

/** STYLES **/
user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
user_pref("layers.acceleration.force-enabled", true);
user_pref("gfx.webrender.all", true);
user_pref("svg.context-properties.content.enabled", true);

/** NO TRANSLATIONS PLEASE **/
user_pref("browser.translations.automaticallyPopup", false);
user_pref("browser.translations.enable", false);
user_pref("browser.translations.panelShown", false);

/** BROWSING **/
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.search.region", "US");
user_pref("browser.contentblocking.category", "strict");
user_pref("network.proxy.socks_remote_dns", true); // set the proxy server to do any DNS lookups when using SOCKS
user_pref("network.file.disable_unc_paths", true); // disable using UNC (Uniform Naming Convention) paths
user_pref("security.ssl.require_safe_negotiation", true);
user_pref("security.OCSP.enabled", 1);
user_pref("security.OCSP.require", true);
user_pref("security.cert_pinning.enforcement_level", 2);
user_pref("security.remote_settings.crlite_filters.enabled", true);
user_pref("security.pki.crlite_mode", 2);
user_pref("dom.security.https_only_mode", true);
user_pref("browser.urlbar.suggest.history", false);
user_pref("browser.urlbar.suggest.bookmark", true);
user_pref("browser.urlbar.suggest.openpage", false);
user_pref("browser.urlbar.suggest.topsites", false);

/** BEHAVIOR **/
user_pref("browser.ctrlTab.sortByRecentlyUsed", true);
user_pref("signon.rememberSignons", false); // Dont save logins and passwords for websites
user_pref("browser.download.forbid_open_with", true);
user_pref("privacy.sanitize.sanitizeOnShutdown", true); // Clear history when firefox closes
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("browser.uitour.enabled", false);
user_pref("browser.download.manager.addToRecentDocs", false);
user_pref("browser.download.always_ask_before_handling_new_types", true);
user_pref("permissions.manager.defaultsUrl", ""); // remove special permissions for certain mozilla domains
user_pref("pdfjs.enableScripting", false);
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
user_pref("browser.xul.error_pages.expert_bad_cert", true);
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.speculativeConnect.enabled", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.trending.featureGate", false);
user_pref("browser.urlbar.addons.featureGate", false);
user_pref("browser.urlbar.mdn.featureGate", false);
user_pref("browser.urlbar.pocket.featureGate", false);
user_pref("browser.urlbar.weather.featureGate", false);
user_pref("signon.autofillForms", false);
user_pref("signon.formlessCapture.enabled", false);
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);
user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true); // force WebRTC inside the proxy
user_pref("dom.disable_window_move_resize", true);
/* 1602: control the amount of cross-origin information to send [FF52+]
 * 0=send full URI (default), 1=scheme+host+port+path, 2=scheme+host+port ***/
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);
user_pref("browser.messaging-system.whatsNewPanel.enabled", false);

/** BLOCK IMPLICIT OUTBOUND **/
user_pref("network.prefetch-next", false);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("browser.places.speculativeConnect.enabled", false);

/** OTHER **/
user_pref("captivedetect.canonicalURL", "");
user_pref("network.captive-portal-service.enabled", false);
user_pref("network.connectivity-service.enabled", false);
