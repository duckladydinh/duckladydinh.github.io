// bootstrap
import 'bootstrap'
import 'bootstrap/dist/css/bootstrap.css'
import '@fortawesome/fontawesome-free/css/all.css'

// personal custom style in scss
import '/style/scss/default.scss'

// !important: react classes
import React from "react";
import {render} from "react-dom";

// main class
import {App} from "/script/app"

// rendering
const app = document.getElementById("app");
render(<App/>, app);