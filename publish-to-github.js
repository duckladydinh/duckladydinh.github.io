const pages = require('gh-pages')

pages.publish('build/web', {
    repo: 'git@github.com:duckladydinh/duckladydinh.github.io.git',
    branch: 'master'
}, null);