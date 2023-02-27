import React from 'react'
import { Navbar, NavItem, NavLink } from 'reactstrap';
import { Link } from 'react-router-dom';

export function DevSubsectionNav(props) {
    /*console.log("DevSubsectionNav", props.subsections);*/
    const subsections = props.subsections;
    const [activelink, setActiveLink] = useState("");

    return (
        <Navbar>
            <ul className="navbar-nav">
                {subsections.map(s =>
                    <NavItem key={s.devSubsectionCode}>
                        <NavLink
                            tag={Link}
                            className={"text-dark " + (activelink == s.devSubsectionCode ? "devsubsectionactive" : "")}
                            to={"/DevSection/" + s.devSectionCode + "/" + s.devSubsectionCode}
                            onClick={() => setActiveLink(s.devSubsectionCode)}
                        >
                            {s.devSubsectionName}

                        </NavLink>
                    </NavItem>
                )}
            </ul>
        </Navbar>

    )
}