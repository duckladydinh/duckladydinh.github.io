import '/index.scss';
import 'bulma/css/bulma.css';
import React from 'react';
import { render } from 'react-dom';
import { Intro } from './intro';
import {PostCard} from "./post-card";

const App = () => {
    return (
        <div>
            <Intro />
            <section className="container is-fluid">
                <PostCard time="05 Feb 2020" title="Graduation">
                    Today I graduated!
                </PostCard>
                <PostCard time="09 Feb 2020" title="Bulma">
                    Today I learned Bulma!
                </PostCard>
            </section>
        </div>
    );
};

render(<App />, document.getElementById('app'));
