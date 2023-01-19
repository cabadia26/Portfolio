import React, { Component } from 'react';
import { Collapse, Navbar, NavbarBrand, NavbarToggler, NavItem, NavLink } from 'reactstrap';
import { Link } from 'react-router-dom';
import './NavMenu.css';
import { GetProfile, GetDevSections } from './utility';


export class NavMenu extends Component {
    static displayName = NavMenu.name;

    constructor(props) {
        super(props);

        this.toggleNavbar = this.toggleNavbar.bind(this);
        this.state = {
            collapsed: true,
            profile: {},
            devsections: []
        };
    }

    async componentDidMount() {
        const profileobj = await GetProfile();
        const devsectionsobj = await GetDevSections();
        this.setState({ profile: profileobj, devsections: devsectionsobj })
    }

    toggleNavbar() {
        this.setState({
            collapsed: !this.state.collapsed
        });
    }



    render() {
        const profile = this.state.profile;
        const devsections = this.state.devsections;
        console.log(devsections);
        return (

            <header>

                <Navbar className="navbar-expand-sm navbar-toggleable-sm ng-white border-bottom box-shadow mb-3 container-fluid light" >
                    <NavbarBrand tag={Link} to="/" font="100">
                        <img className="rounded-pill" src="/ProfileIcon.png" width="70" />
                        {profile.firstName + " " + profile.lastName + " Software Portfolio"}
                    </NavbarBrand>
                    <NavbarToggler onClick={this.toggleNavbar} className="mr-2" />
                    <Collapse className="justify-content-between" isOpen={!this.state.collapsed} navbar>
                        <ul className="navbar-nav">
                            {devsections.map(d =>
                                <NavItem key={d.devSectionCode}>
                                    <NavLink tag={Link} className="text-dark" to={"/DevSection/" + d.devSectionCode}>{d.devSectionName}</NavLink>
                                </NavItem>
                            )}
                        </ul>
                        <ul className="navbar-nav flex-grow">
                            <li className="nav-item">
                                <a className="nav-link" target="_blank" href={profile.gitHubAccount} >GitHub</a>
                            </li>
                            <li className="nav-item">
                                <a className="nav-link" target="_blank" href="Camille Abadia Software Dev Resume.pdf">Get My Resume</a>
                            </li>
                        </ul>
                    </Collapse>
                </Navbar>
            </header >
        );
    }
}
