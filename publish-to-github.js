const pages = require('gh-pages')

pages.publish('build/web', {
    repo: 'https://github.com/duckladydinh/duckladydinh.github.io.git',
    branch: 'master'
}, null);