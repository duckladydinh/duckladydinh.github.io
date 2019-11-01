import {publish} from "gh-pages";

publish('dist', {
    repo: 'https://github.com/duckladydinh/duckladydinh.github.io.git',
    branch: 'master'
}, null);