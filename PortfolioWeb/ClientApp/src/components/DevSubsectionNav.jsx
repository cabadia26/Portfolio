

import React, { useState, useEffect } from 'react';
import { Navbar, NavItem, NavLink } from 'reactstrap';
import { Link, useParams } from 'react-router-dom';

export function DevSubsectionNav(props) {
    /* console.log("DevSubsectionNav", props.subsections);*/
    const params = useParams();
    let { sub } = params;
    const subsections = props.subsections;
    if (sub == null) {
        sub = subsections[0].devSubsectionCode
    }
    const [activelink, setActiveLink] = useState("");
    useEffect(() => setActiveLink(sub), [subsections]);
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