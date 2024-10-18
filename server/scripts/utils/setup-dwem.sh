#!/bin/bash

source "$DGL_CONF_HOME/dgl-manage.conf"
TIMESTAMP=$(date +%s%3N)
sed -i 's|<script type="text/javascript">|<script  type="text/javascript">\
      localStorage.removeItem("DWEM");\
      localStorage.DWEM_MODULES = JSON.stringify(\
        ["io-hook", "site-information", "websocket-factory", "rc-manager", "module-manager", "cnc-banner", "cnc-userinfo", "sound-support", "cnc-chat", "cnc-public-chat", "convenience-module", "cnc-splash-screen", "wtrec", "advanced-rc-editor"].map(m => "../modules/" + m + "/index.js")\
      );|g' "$WEBDIR/templates/client.html"

sed -i 's|<script src="/static/scripts/contrib/require.js" data-main="/static/scripts/app"></script>|<script src="https://cdn.jsdelivr.net/gh/refracta/dcss-webtiles-extension-module/loader/dwem-base-loader.js?t='"$TIMESTAMP"'"></script>|g' "$WEBDIR/templates/client.html"
dgl publish --confirm > /dev/null 2>&1