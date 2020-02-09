import React from 'react';

export const PostCard = ({time, title, children}) => {
    return (
        <div className="card is-inline-block" style={{ width: '400px', margin: '1em'}}>
            <header className="card-header">
                <p className="card-header-title">{title}</p>
                <time className="card-header-title level-right">{time}</time>
            </header>
            <div className="card-content" style={{minHeight: '200px'}}>
                <div className="content block-with-text">
                    {children}
                </div>
            </div>
            <footer className="card-footer">
                <a href="#" className="card-footer-item">
                    More
                </a>
            </footer>
        </div>
    );
};
