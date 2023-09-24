npm install
rm -rf output
npm run transpile
npm run lint
# MacOS
find . -name '*.mjs' -print0 | xargs -0 sed -i '' 's/%23/#/g'
# Linux
# find . -name '*.mjs' -print | xargs sed -i 's/%23/#/g'
esbuild run.mjs --bundle --outdir=dist --format=esm --target=es2022 --external:tls --external:net --external:util --external:util/types --external:crypto --external:zlib --external:http --external:https --external:fs --external:path --external:url --inject:./polyfills/buffer.js --inject:./polyfills/process.js --out-extension:.js=.mjs