import React, { useState, useEffect } from 'react';
import { GetDevTools } from './utility';
export function DevTool(props) {
    const [devtools, setDevTools] = useState([]);
    const tooltype = props.toolType;
    let caption = props.caption;
    const subsectioncode = props.subsectionCode;
    useEffect(() => {
        (
            async () => {
                const devtoolsobj = await GetDevTools(subsectioncode);
                setDevTools(devtoolsobj);
            }
        )();
    }, [subsectioncode]);

    if (devtools.length == 0) { return; }

    let tools = devtools;
    if (tooltype != "") {
        tools = devtools.filter(t => t.devToolTypeCode == tooltype);
    }
    if(!caption){ caption= "Skills and Technologies" }
    return (
        <ul className="list-group list-group-horizontal">
            <li className="list-group-item devtoolheader">{caption}</li>
            {tools.map(t => <li key={t.devToolCode} className="list-group-item text-bg-light">{GetTool(t)}</li>)}
        </ul>
    )
}
function GetTool(t) {
    if (t.hasIcon) {
        const imgpath = "/tool/" + t.devToolCode + "." + t.iconExt;
        return (
                <img src={imgpath} className="figure-img img-fluid rounded" width="40" />
        )
    }
    else {
        return <span>{t.devToolName}</span>
    }
}

