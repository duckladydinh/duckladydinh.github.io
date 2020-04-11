import React from 'react';

const RESUME_PATH = 'Lam_Gia_Thuan_CV.pdf';

export const Intro = () => {
    return (
        <section className="hero is-danger is-medium">
            <div className="hero-head">
                <nav className="navbar">
                    <div className="container">
                        <div className="navbar-menu is-active">
                            <div className="navbar-end">
                                <a className="navbar-item is-active">Home</a>
                                <a className="navbar-item">Contact</a>
                                <a className="navbar-item" href={RESUME_PATH}>
                                    Resume
                                </a>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>

            <div className="hero-body">
                <div className="container">
                    <p className="title">Hello, World!</p>
                    <p className="subtitle is-family-monospace">
                        from <span className="is-uppercase">Lam Gia Thuan</span>
                        , the Universe Most Handsome Boy
                    </p>
                    <div className="columns">
                        <div className="column is-four-fifths has-text-grey-lighter">
                            <p>
                                I set my eyes on LMU Elite Data Science Program,
                                so this dummy website was born as optionally
                                requested. I plan to tell my road to programming
                                challenges, some problem solving stories or
                                similar. Will there be 1001 stories or is this
                                just the end of a dummy project? Only time can
                                answer...
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
};
