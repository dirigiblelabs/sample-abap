npm install
rm -rf output
rm -rf dist
npm run transpile
npm run lint
find . -name '*.mjs' -print0 | xargs -0 sed -i '' 's/%23/#/g'

esbuild run.mjs --tsconfig=./tsconfig.json --bundle --outdir=dist --format=esm --target=es2022 --external:tls --external:net --external:util --external:util/types --external:crypto --external:zlib --external:http --external:https --external:fs --external:path --external:url --external:sdk --inject:./polyfills/buffer.js --inject:./polyfills/process.js --out-extension:.js=.mjs
