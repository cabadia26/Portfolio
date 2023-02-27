﻿import React, { useState, useEffect } from 'react';
import { GetCodeScipt } from './utility';

export function CodeScript(props) {
    const [filecontents, setFilecontents] = useState("");
    const fileurl = props.dirpath;
    const elementcode = props.elementcode;
    useEffect(() => {
        (
            async () => {

                const filecontentsval = await GetCodeScipt(fileurl, elementcode);
                setFilecontents(filecontentsval);
            }
        )();
    }, [fileurl]);

    if (filecontents == "") return <p>Loading...</p>;
    console.log(filecontents)

    return (
        <div className="code" dangerouslySetInnerHTML={{ __html: filecontents }} />
    )
}