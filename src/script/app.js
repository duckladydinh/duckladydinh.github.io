import React from "react";
import Logo from "/image/atom-icon.svg"
import { Card, Button, Jumbotron } from 'react-bootstrap';

class App extends React.Component {
    render() {
        return <div>

            <Jumbotron>
                <div className="row">
                    <div className="col-lg-9">
                        <div className="px-5">
                            <h1 className="text-danger text-center">Hello, World!</h1>

                            <h5 className="text-warning text-justify">
                                I want to apply for LMU Elite Data Science Program!
                            </h5>
                            <h5 className="text-muted text-justify">
                                That's why I make this dummy website, as optionally requested by the application. I am
                                thinking of explaining some solutions from problems I solved in Competitive Programming
                                and Data Sciences (if any).

                                This may be the start of 1001 exciting stories or the death of a side project.
                            </h5>
                            <h5>
                                Who knows, right?
                            </h5>
                        </div>
                    </div>
                    <div className="col d-flex justify-content-center">
                        <img alt="atom-icon.svg" className="img-fluid" height="auto" src={Logo} width="50%"/>
                    </div>
                </div>
            </Jumbotron>

            <div className="container">
                <div className="row">
                    <div className="col">
                        <Card>
                            <Card.Body>
                                <Card.Title>Story 1</Card.Title>
                                <Card.Text>
                                    Some quick example text to build on the card title and make up the bulk of
                                    the card's content.
                                </Card.Text>
                                <Button variant="primary">More</Button>
                            </Card.Body>
                        </Card>
                    </div>
                    <div className="col">
                        <Card>
                            <Card.Body>
                                <Card.Title>Story 2</Card.Title>
                                <Card.Text>
                                    Some quick example text to build on the card title and make up the bulk of
                                    the card's content.
                                </Card.Text>
                                <Button variant="primary">More</Button>
                            </Card.Body>
                        </Card>
                    </div>
                </div>
            </div>
        </div>;
    }
}

export {App};
